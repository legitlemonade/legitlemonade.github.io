
<!doctype html>
<html>
<head>
<title>Shell Shockers</title>
<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,900" rel="stylesheet">
<link rel="icon" type="image/png" href="https://shellshock.io/favicon.png">
<meta charset="UTF-8" />
<meta name="description" content="Welcome to Shell Shockers, the world's most advanced egg-based multiplayer shooter! It's like your favorite battlefield game but... with eggs." />

<style>
    * {
        --egg-brown: #532a19;
        font-family: Nunito, sans-serif;
        font-size: 2.5vh;
        font-weight: bold;
        line-height: 1.2em;
        outline: none;
    }

    #mainMenu {
        color: var(--egg-brown);
    }

    #game {
        color: #fff;
        text-shadow:
            0em 0em .1em #000,
            0em .1em .2em #000;
    }

    .textShadow {
        text-shadow:
            0em 0em .1em #000,
            0em .1em .2em #000;
    }

    html, body {
        padding: 0;
        margin: 0;
        overflow: hidden;
        width: 100%;
        height: 100%;
    }

    a, textarea, .textInput, select { color: var(--egg-brown); }

    .textInput {
        margin: 0;
        padding: 0.25em;
        height: 2em;
    }

    .team {
        display: none;
        position: absolute;
        left: 50%;
        bottom: 0.25em;
        transform: translateX(-50%);
        font-size: 2em;
    }

    .redTeam {
        font-size: 2em;
        color: #f00;
    }

    .blueTeam {
        font-size: 2em;
        color: #0af;
    }

    .pane {
        background: rgba(220, 210, 200, 1);
        border-radius: 0.5em;
        margin: 0.25em;
        padding: 0.75em;
        height: 100%;
        border-left: solid;
        border-right: solid;
        border-width: 0.2em;
    }

    div { vertical-align: top; }

    div, input, textarea {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        background-clip: padding-box;
    }

    select {
        font-size: 1em;
        background: #fff;
        height: 2em;
    }

    h1 { font-size: 1.5em; }
    h2 { font-size: 1.2em; }
    h3 { font-size: 1.1em; }
    small { font-size: 0.9em; }

    h1, h2, h3 {
        margin: 0.2em;
        font-weight: bolder;
    }

    p {
        margin: 0;
        padding: 0;
    }

    button {
        padding: 0.25em;
    }

    button > h1 {
        color: #fff;
    }

    button {
        background: var(--egg-brown);
        height: 2em;
        color: #fff;
        padding: 0;
        padding-left: 0.5em;
        padding-right: 0.5em;
        cursor: pointer;
        text-align: center;
        border-radius: 0.4em;
        border: solid;
        border-bottom: solid;
        border-color: rgba(0, 0, 0, 0.5);
        border-width: 0.2em;
        text-shadow:
            0em 0em 0.2em #000,
            0em 0em 0.2em #000,
            0em 0em 0.2em #000;
    }

    button.red { background: #b44; }
    button.yellow { background: #b94; }
    button.green { background: #4b9; }
    button.blue { background: #49b; }

    .roundedBorder, .textInput, textarea, select {
        border-style: solid;
        border-width: 0.2em;
        border-color: var(--egg-brown);
        border-radius: 0.4em;
    }

    canvas {
        /*background: var(--egg-brown);*/
        background: black;
    }

    .chat {
        position: absolute;
        background: transparent;
        border: none;
        pointer-events: none;
        overflow: hidden;
        color: #fff;
        text-align: left;
        text-shadow:
            0em 0em .1em #000,
            0em .1em .2em #000;
    }

    .friendCode {
        resize: none;
        border-width: 0;
        font-size: 1.2em;
        font-weight: 900;
        color: var(--egg-brown);
    }

    .bgap { margin-bottom: 0.75em; }
    .lgap { margin-left: 0.5em; }
    .rgap { margin-right: 0.5em; }

    .flexCol, .flexRow {
        display: flex;
        flex-wrap: nowrap;
    }

    .flexCol {
        align-items: center;
        flex-direction: column;
        text-align: center;
    }

    .flexRow {
        width: 100%;
        flex-direction: row;
    }

    .icon {
        -webkit-filter: drop-shadow(.1em .1em .1em #000);
        filter: drop-shadow(.1em .1em .1em #000);
        cursor: pointer;
        pointer-events: all;
        width: 2em;
    }

    .grenade {
        -webkit-filter: drop-shadow(.1em .1em .1em #000);
        filter: drop-shadow(.1em .1em .1em #000);
        width: 2em;
    }

    .settings {
        position: absolute;
        right: 1em;
        top: 4em;
        background: rgba(220, 210, 200, 1);
        color: var(--egg-brown);
    }

    .arrowRight {
        position: absolute;
        width: 0;
        height: 0;
        margin: 0;
        border: none;
        border-top: 1em solid transparent;
        border-bottom: 1em solid transparent;
        border-left: 1.5em solid white;
        cursor: pointer;
    }

    .arrowLeft {
        position: absolute;
        width: 0;
        height: 0;
        margin: 0;
        border: none;
        border-top: 1em solid transparent;
        border-bottom: 1em solid transparent;
        border-right: 1.5em solid white;
        cursor: pointer;
    }

    .statLabel {
        text-align: right;
        font-size: 0.9em;
        white-space: nowrap;
    }

    .outerBar {
        width: 100%;
        padding: 0;
        border: solid;
        border-width: 0.2em;
        border-radius: 0.3em;
        background: var(--egg-brown);
    }

    .innerBar {
        background: #fed;
        width: 100%;
        height: 0.8em;
        border-radius: 0.15em
    }

    div.otherPlayer {
        border-radius: 0.2em;
        padding-top: 0.05em; padding-bottom: 0.05em;
        padding-left: 0.5em; padding-right: 0.5em;
        margin: 0.1em;
    }

    .otherPlayer > span {
        font-weight: 600;
        font-size: 0.9em;
    }

    div.thisPlayer {
        border-radius: 0.2em;
        padding-top: 0.05em; padding-bottom: 0.05em;
        padding-left: 0.5em; padding-right: 0.5em;
        margin: 0.1em;
    }

    .thisPlayer > span {
        color: #ff0;
        font-weight: 700;
        font-size: 1em;
    }

    .alert {
        position: absolute;
        display: block;
        padding-top: 0.5em;
        padding-bottom: 1em;
        padding-left: 1.5em;
        padding-right: 1.5em;
        background: rgba(220, 210, 200, 1);
        text-align: center;
    }

    .colorSelector {
        position: relative;
        padding: 0.6em;
        padding-top: 0;
        padding-bottom: 0;
        margin-left: 0.1em;
        border: solid 0.1em;
        border-radius: 0.2em;
        cursor: pointer;
    }

</style>

<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "name": "Shell Shockers | Play in your browser for Free!",
  "url": "https://shellshock.io",
  "sameAs": ["https://www.facebook.com/ShellShockersGame", "https://twitter.com/eggcombat"],
  "description": "Welcome to Shell Shockers, the world's most advanced egg-based multiplayer shooter! It's like your favorite battlefield game but... with eggs.",
  "@type": "VideoGame",
  "applicationCategory": "Game",
  "applicationSubCategory": "Action",
  "genre": "First-Person Shooter",
  "gamePlatform": ["PC", "Mac", "Chromebook"],
  "operatingSystem": ["Windows", "OSX", "Linux", "ChromeOS"],
  "playMode": "Multi-Player",
  "aggregateRating":{
    "@type":"AggregateRating",
    "ratingValue":"4.1",
    "ratingCount":"49"
  },
  "image": "/img/largeIcon.jpg",
  "logo": "/img/largeIcon.jpg"
}
</script>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '771186996377132');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=771186996377132&ev=PageView&noscript=1"
/></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->

<script>var version = '0.12.2';</script>
<script src="!host_specific/servers.js?1520577182"></script>
<script src="src/babylon.custom.js?1519090252"></script>
<script src="src/shellshock.min.js?1520616612"></script>
</head>
<body>

<div class="flexCol" id="container" style="width: 100%; height: 100%; background: #a98;">

<!-- Changelog -->
<div id="changelog" style="display: none;">
    <div style="text-align: left; white-space: nowrap;">
        <h2>What's New</h2>
        <li>Some weapon tweaks. It's a surprise!
        <li>Notifications so I can warn you when the server is going to reset!
        <br><br><h2>Fixes</h2>
        <li><i>Might</i> have gotten rid of that blank white sniper scope?
        <br><br><h2>Known Issues</h2>
        <li><i>Now</i> the stupid scope sometimes doesn't go away
        <li>Sound cutting out on some systems
    </div>
</div>

<!-- Bug Report -->
<form id="bugReport" method="post" action="https://shellshock.io/feedback.php" style="display: none">
    <div style="text-align: left; width: 30em; white-space: normal">
        <p>This tool works best when used the moment you encounter a bug! Please be as detailed as possible in your description.</p>
        <br>
        <p>Please check the <a href="https://shellshock.io/faq.html?v=1" target="_window">FAQ</a> before submitting. Your issue may have already been addressed!</p>
        <br>
        <p>Your email address will never be distributed!</p>
        <br>
        <input class="textInput" type="hidden" name="name" value="Bug Report"/>
        <input class="textInput" type="textbox" name="email" placeholder="Email" id="bugEmail" maxlength="384" style="width: 100%; margin-bottom: 0.5em" oninput="bugReportChanged()"/>
        <br>
        <textarea type="text" name="comments" id="bugDescription" maxlength="4096" rows="10" style="width: 100%; resize: none;" placeholder="Please describe the problem(s) you're experiencing." oninput="bugReportChanged()"></textarea>
    </div>
</form>

<div id="offCanvasContainer" style="visibility: hidden;"></div>

<!-- Landing Page -->
<div id="mainMenu" style="display: none; height: 100%">
    <div class="flexCol" style="height: 100%">
        <!--
        <div style="position: absolute; width: 100%; margin-top: 5vh">
            <p><h2>Currently testing TEAM MODE at <a href="http://dev.shellshock.io">dev.shellshock.io</a>!</h2>
            </p>
        </div>
    -->

        <div style="flex: 2"></div>

        <!-- Main Menu -->
        <div class="flexRow" style="flex: 9; width: 130vh;">
            <!-- Left pane: Personal -->
            <div class="flexCol pane" style="flex: 2; height: 23em">
                <!-- Facebook -->
                <div id="fbLoginRequest" style="flex: 1; display: none">
                    <h3>Log in with Facebook<br>to track your stats!</h3>
                </div>

                <!-- Stats retrieval message -->
                <h2 id="statsRetrieval" style="display: none">Retrieving stats...</h2>

                <!-- Player statistics -->
                <div id="statsPane" style="flex: 1; display: none; width: 100%">
                    <h2>Your Stats</h2>
                    <hr style="width: 100%; border-width: 1px; border-style: solid">
                    <div class="flexRow">
                        <div style="flex: 1; text-align: left">Kills<br>Deaths<br>Ratio<br>Best Kill Streak</div>
                        <div id="stats" style="flex: 1; text-align: right"></div>
                    </div>
                </div>

                <div style="flex: 1" id="fbLogin" class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>

                <div>
                    <a target="_blank" rel="noopener" href="https://www.facebook.com/ShellShockersGame"><img style="width: 3em;" src="img/fbLogo.png"></a>
                    <a target="_blank" rel="noopener" href="https://twitter.com/eggcombat"><img style="width: 3em;" src="img/twitterLogo.png"></a>
                    <a target="_blank" rel="noopener" href="https://discord.gg/uAXe4qe"><img style="width: 3em;" src="img/discordLogo.png"></a>
                </div>
            </div>

            <!-- Center pane: Game -->
            <div class="flexCol pane" style="flex: 3; height: 23em">
                <!-- Name and Server -->
                <a href="https://www.shellshock.io" target="_blank" rel="noopener"><img width="100%" src="img/logo.png" /></a>
                <div class="flexRow bgap">
                    <div class="rgap" style="flex: 1">
                        <h3>Name</h3>
                        <input  class="textInput" id="username" style="flex: 1;" size="23" maxlength="32" type="textbox"/>
                    </div>
                    <div style="flex: 1">
                        <h3>Server</h3>
                        <select id="serverSelect" onchange="selectServer(this.selectedIndex)"></select>
                    </div>
                </div>

                <!-- Enter, Create, or Join game -->
                <div class="flexRow bgap">
                    <div class="rgap" style="flex: 1">
                        <button class="green" style="width: 100%; height: 100%;" onclick="login()">
                            <h1>PLAY</h1>
                        </button>
                    </div>
                    <div id="customGame" style="">
                        <h3>Private Games!</h3>
                        <button class="blue" onclick="login(true)">CREATE</button>
                        <button class="yellow" onclick="openJoinBox()">JOIN</button>
                    </div>
                    <div id="joinGame" style="display: none;">
                        <h3>Enter Game Code</h3>
                        <input  class="textInput" id="joinCode" type="textbox" size="8" maxlength="8" />
                        <button class="red" onclick="closeJoinBox()">BACK</button>
                    </div>
                </div>

                <div style="display: table; width: 100%; text-align: left">
                    <button name="gameType" class="brown" onclick="selectGameType(0)">FFA</button>&nbsp;
                    <button name="gameType" class="brown" onclick="selectGameType(1)">Teams</button>
                </div>
            </div>

            <!-- Right pane: Character customization -->
            <div class="flexCol pane" style="flex: 2; height: 23em;">
            <!--
                <div style="margin-bottom: 0.5em">
                    <span id="color0" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color1" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color2" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color3" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color4" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color5" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color6" class="colorSelector" onclick="selectColor(this)"></span>
                    <span id="color7" class="colorSelector" onclick="selectColor(this)"></span>
                </div>
            -->

                <div id="characterCanvasContainer" style="margin: 0; width: 100%; pointer-events: none;"></div>
                <div class="arrowLeft" style="transform: translate(-4.5em, 3.25em)" onclick="selectClass(-1)"></div>
                <div class="arrowRight" style="transform: translate(4.5em, 3.25em)" onclick="selectClass(1)"></div>

                <h2 id="className" style="margin-bottom: 0"></h2>
                <p id="classWeapon" style="margin-bottom: 0.2em"></p>

                <table style="width: 100%">
                    <tr>
                        <td class="statLabel">Damage</td>
                        <td class="outerBar">
                            <div id="damage" class="innerBar"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="statLabel">Accuracy</td>
                        <td class="outerBar">
                            <div id="accuracy" class="innerBar"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="statLabel">Fire Rate</td>
                        <td class="outerBar">
                            <div id="fireRate" class="innerBar"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="statLabel">Range</td>
                        <td class="outerBar">
                            <div id="range" class="innerBar"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="flex: auto">
            <div class="fb-like" style="margin-right: 2em" data-href="https://www.facebook.com/ShellShockersGame" data-layout="button" data-action="like" data-size="small" data-show-faces="false" data-share="true"></div>

            <a style="font-size: 1.2em; font-weight: 900" href="https://shellshock.io/faq.html?v=1" target="_window">FAQ</a>
            &nbsp;&nbsp;&nbsp;
            <a style="font-size: 1.2em; font-weight: 900" href="https://shellshock.io/feedback.html" target="_window">Contact Us</a>
        </div>

        <div style="margin: 1em">Brought to you by the<br>Egg and Dairy Ministry of Belarus</div>
    </div>

        <div style="position: absolute; margin: 1em; left: 0; bottom: 0">
            Version <script>document.write(version);</script><br>
            [<u style="cursor: pointer" onclick="showChangelog()">changelog</u>]
        </div>
</div>

<!-- GAME -->
<div id="game" style="display: none; width: 100%; height: 100%; pointer-events: none; -ms-user-select: none; -webkit-user-select: none; -moz-user-select: none; -o-user-select: none; user-select: none;
">
    <div id="gameCanvasContainer" style="width: 100%; height: 100%; pointer-events: all"></div>

    <!-- FPS -->
    <div id="FPS" style="
        position: absolute;
        top: 4em;
        left: 1em;
    "></div>

    <!-- Ping -->
    <div style="position: absolute; top: 5.5em; left: 1em;">
        PING:
        <b><span id="PING"></span></b>
    </div>

    <!-- Weapon -->
    <div id="WEAPON" style="position: absolute; right: 0.75em; bottom: 1.25em; text-align: right;">
        <div id="grenades" style="padding: 0.5em; padding-bottom: 0; margin-bottom: 0">
            <img id="grenade3" class="grenade" src="img/grenadeIconDark.png"/>
            <img id="grenade2" class="grenade" src="img/grenadeIconDark.png"/>
            <img id="grenade1" class="grenade" src="img/grenadeIconDark.png"/>
        </div>
        <h2 id="WEAPON_NAME" style="
            text-align: right;
            padding: 0.5em;
        "></h2>
        <h1 id="AMMO" style="
            text-align: right;
            font-size: 3em;
            line-height: 0.25em;
        "></h1>
    </div>

    <!-- Health -->
    <div style="
        position: absolute;
        top: 1em;
        left: 1em;
        width: 15em;
        height: 2em;
        background: rgba(0, 0, 0, 0.25);
        border-radius: 0.5em;
        padding: 0.25em;
    ">
        <div id="healthBar" style="
            width: 100%;
            height: 100%;
            background: #fe1;
            border-radius: 0.3em;
        "></div>
    </div>

    <!-- Grenade throw power -->
    <div id="grenadeThrowContainer" style="
        position: absolute;
        display: flex;
        visibility: hidden;
        align-items: flex-end;
        top: 50%;
        left: 50%;
        transform: translate(-6em, -3em);
        width: 1em;
        height: 6em;
        background: rgba(0, 0, 0, 0.25);
        border-radius: 0.3em;
        padding: 0.25em;
    ">
        <div id="grenadeThrow" style="
            width: 100%;
            height: 50%;
            border-radius: 0.05em;
            background: white;
        "></div>
    </div>

    <!-- Streak -->
    <h2 id="BEST_STREAK" style="
        position: absolute;
        text-align: center;
        font-weight: 700;
        width: 100%;
        top: 0.5em;
    ">BEST KILL STREAK: 0</h2>

    <!-- Kill -->
    <div id="KILL_BOX" style="
        position: absolute;
        display: none;
        width: 100%;
        transform-origin: center bottom;
        bottom: 10%;
        color: #fff;
        text-align: center;
    ">
        <h2 style="font-weight: 900">YOU KILLED</h2>
        <h1 style="font-size: 3.5em; margin: 0" id="KILLED_NAME"></h1>
        <i><h2 id="KILL_STREAK" style="text-align: center; padding-top: 0.5em;"></h2></i>
    </div>

    <!-- Death -->
    <div id="DEATH_BOX" style="
        position: absolute;
        display: none;
        width: 100%;
        transform-origin: center top;
        top: 20%;
        color: #fff;
        text-align: center;
    ">
        <h1 style="font-weight: 900">YOU WERE KILLED BY</h1>
        <h1 style="font-size: 5em; margin: 0" id="KILLED_BY_NAME"></h1>
        <h2 id="RESPAWN"></h2>
    </div>

    <!-- Team indicator -->
    <h1 id="blueTeam" class="team blueTeam">BLUE TEAM</h1>
    <h1 id="redTeam" class="team redTeam">RED TEAM</h1>

    <!-- Chat -->
    <div id="chatOut" class="chat" style="
        display: none;
        bottom: 2.5em;
        left: 1em;
        width: 100vh;
    "></div>

    <input id="chatIn" class="chat" maxlength=64 tabindex=-1 placeholder="Press TAB to exit" onkeydown="onChatKeyDown(event)" style="
        display: none;
        color: #ff0;
        bottom: 1em;
        left: 1em;
        width: 100vh;
    "></input>

    <!-- Kill ticker -->
    <div id="killTicker" class="chat" style="
        position: absolute;
        margin: 1em;
        width: 100vh;
        height: 7em;
        left: 0;
        top: 35%;
        zoom: 0.8;
    "></div>

    <!-- Player List -->
    <div id="playerSlot" style="display: none">
        <span></span>
        <span style="display: inline-block; width: 2em"></span>
    </div>
    <div id="playerList" style="position: absolute; right: 1em; top: 5em; text-align: right;"></div>

    <!-- Help -->
    <div id="help" style="
        position: absolute;
        left: 1em;
        bottom: 1em;
        color: #fff;
    ">
        <div style="float: left; text-align: right">
            <h1>WASD:</h1>
            <h1>SPACE:</h1>
            <h1>SHIFT:</h1>
            <h1>R:</h1>
            <h1>E:</h1>
            <h1>Q:</h1>
        </div>
        <div style="float: right; text-align: left">
            <h1>Move</h1>
            <h1>Jump</h1>
            <h1>Aim</h1>
            <h1>Reload</h1>
            <h1>Swap Weapon</h1>
            <h1>Grenade</h1>
        </div>
        <div style="position: absolute; left: 0; bottom: 0; padding-bottom: 8px; text-align: center">
            <img class="icon" src="img/settings.png" onclick="openSettingsMenu()"/>
            <p>Change</p>
        </div>
    </div>
</div>

<!-- Friend invite dialog -->
<div id="inviteFriends" class="alert roundedBorder"
    style="right: 1em; top: 4em; color: var(--egg-brown); display: none"
>
    <h1 style="position: absolute; right: 0.1em; top: 0; cursor: pointer;"
        onclick="document.getElementById('inviteFriends').style.display = 'none';"
    >X</h1>
    <p style="margin-bottom: 0.5em">Share this link with your</br>friends to play with them!</p>
    <textarea readonly cols="26" rows="1" id="friendCode" class="friendCode" style="background: transparent"></textarea>
    <p style="text-decoration: underline; cursor: pointer" onclick="copyFriendCode()">Copy to Clipboard</p>
</div>

<!-- Settings dialog -->
<div id="settings" class="settings roundedBorder" style="display: none;">
    <style>
        table td { text-align: right; padding-left: 0.5em; padding-right: 0.5em; }
        table div {
            width: 12em;
            background: var(--egg-brown);
            text-align: center;
            padding: 0.1em;
            cursor: pointer;
        }
    </style>
    <h1 style="text-align: center; margin: 0.5em">Settings</h1>
    <h1 style="display: block; position: absolute; right: 0.1em; top: 0; cursor: pointer;"
    onclick="closeSettingsMenu()">X</h1>
    <table style="padding-bottom: 0.5em">
        <tr><td>Forward</td><td><div tabindex="1" style="color: #fff" name="config" id="up" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Backward</td><td><div tabindex="2" style="color: #aaa" name="config" id="down" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Left</td><td><div tabindex="3" style="color: #aaa" name="config" id="left" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Right</td><td><div tabindex="4" style="color: #aaa" name="config" id="right" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Jump</td><td><div tabindex="5" style="color: #aaa" name="config" id="jump" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Fire</td><td><div tabindex="6" style="color: #aaa" name="config" id="fire" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Aim</td><td><div tabindex="7" style="color: #aaa" name="config" id="scope" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Reload</td><td><div tabindex="8" style="color: #aaa" name="config" id="reload" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Swap Weapon </td><td><div tabindex="9" style="color: #aaa" name="config" id="weapon" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Grenade</td><td><div tabindex="10" style="color: #aaa" name="config" id="grenade" onmousedown="configKey(event)">undefined</div></td></tr>
        <tr><td>Volume</td><td style="text-align: center"><input style="width: 90%; height: 1em;" type="range" min="0" max="1" value="1" step="0.01" id="volume" onchange="setVolume(this)"></td></tr>
        <tr><td>Mouse Speed</td><td style="text-align: center"><input style="width: 90%; height: 1em" type="range" min="1" max="11" value="5" step="0.5" id="mouseSensitivity" onchange="setMouseSensitivity(this)"></td></tr>
        <tr>
            <td>Invert Mouse<input style="height: 1em; margin-left: 1em" id="mouseInvert" type="checkbox" onclick="setCheckOption(this)"></td>
            <td>Auto Detail<input style="height: 1em; margin-left: 1em" id="autoDetail" type="checkbox" onclick="setCheckOption(this)"></td>
        </tr>
        <tr>
            <td>Hold To Aim<input style="height: 1em; margin-left: 1em" id="holdToAim" type="checkbox" onclick="setCheckOption(this)"></td>
            <td name="detail">Shadows<input style="height: 1em; margin-left: 1em" id="shadowsEnabled" type="checkbox" onclick="setCheckOption(this)"></td>
        </tr>
        <tr>
            <td>Enable chat<input style="height: 1em; margin-left: 1em" id="enableChat" type="checkbox" onclick="setCheckOption(this)"></td>
            <td name="detail">High Resolution<input style="height: 1em; margin-left: 1em" id="highRes" type="checkbox" onclick="setCheckOption(this)"></td>
        </tr>
    </table>
</div>

<!-- Corner icon buttons -->
<div style="position: absolute; right: 1em; top: 1em;">
    <img id="switchTeamButton" title="Switch team" style="visibility: hidden; margin-right: 1em;" class="icon" src="img/switchTeam.png" onclick="switchTeamDialog()" />
    <img id="homeButton" title="Main menu" style="visibility: hidden; margin-right: 1em;" class="icon" src="img/home.png" onclick="showMainMenuConfirm()" />
    <img id="friendsButton" title="Invite friends" style="visibility: hidden; margin-right: 1em;" class="icon" src="img/friends.png" onclick="inviteFriends()" />
    <img style="margin-right: 1em;" title="Bug report" class="icon" src="img/bug.png" onclick="showBugReport()" />
    <img style="margin-right: 1em;" title="Settings" class="icon" src="img/settings.png" onclick="openSettingsMenu()" />
    <img class="icon" title="Toggle fullscreen" src="img/fullScreen.png" onclick="toggleFullscreen()" />
</div>

<!-- Big ad -->
<div id="bigAd" style="
    display: none;
    position: absolute;
    top: 0; width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.6);
">
    <div style="
        position: absolute;
        max-width: calc(800px + 1.5em);
        max-height: calc(600px + 1.5em);
        width: calc(120vh + 1.5em);
        height: calc(90vh + 1.5em);
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
    ">
        <a href="http://store.steampowered.com/app/530390/Slayaway_Camp/" target="_window"
            onclick="ga('send', 'event', {
                eventCategory: 'Big ad',
                eventAction: 'click',
                eventLabel: 'Slayaway Camp'
            });"
        >
            <img id="bigAdImg" style="
                position: absolute;
                width: calc(100% - 1.5em);
                height: calc(100% - 1.5em);
                top: 50%; left: 50%;
                transform: translate(-50%, -50%);
            "/>
        </a>

        <img src="img/ads/closeAd.png" style="
            position: absolute; width: 1.5em; height: 1.5em; top: 0; right: 0; cursor: pointer"
            onclick="hideBigAd()"
        />
    </div>
</div>

<!-- Alert dialog overlay -->
<div id="overlay" style="
    display: none;
    position: absolute;
    top: 0; width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.6);
    color: var(--egg-brown);
">
    <div id="alert" class="alert roundedBorder" style="
        left: 50%; top: 45%;
        transform: translate(-50%, -50%);
    ">
        <h1 id="alertHeader"></h1>
        <div id="alertMessage" style="padding-bottom: 1em"></div>
        <h1 id="alertFooter" style="display: none">-</h1>

        <button id="alertButton1" class="green" style="width: 10em; display: none">OK</button>
        <button id="alertButton2" class="red" style="width: 10em; display: none">Cancel</button>
    </div>
    <script>
        startAlertBar();
    </script>
</div>

<!-- Notification -->
<div id="notification" class="roundedBorder" style="
    position: absolute;
    display: none;
    color: var(--egg-brown);
    background: white;
    left: 50%; top: 1em;
    transform: translateX(-50%);
    padding: 0.5em;
    box-shadow: 0.1em 0.1em 0.4em rgba(0, 0, 0, 0.5);
    text-align: left;
">
    <img style="display: flex; width: 2em; height: 2em; margin-right: 0.5em" src="img/notificationIcon.png">
    <p id="notificationMessage"></p>
</div>

</div>
</body>
</head>

