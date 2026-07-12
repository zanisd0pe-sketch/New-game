cat << 'EOT' > index.html
<!DOCTYPE html>
<html>
<head>
    <title>Dispo Tycoon</title>
    <style>
        body { background: #222; color: #eee; font-family: 'Courier New', monospace; text-align: center; }
        .dispensary-layout { display: flex; justify-content: center; gap: 50px; margin-top: 50px; }
        .room { border: 4px solid #555; padding: 30px; width: 300px; background: #333; }
        .counter-top { border-bottom: 8px solid #8B4513; height: 100px; margin-bottom: 20px; display: flex; align-items: flex-end; justify-content: center; font-size: 2em; }
        button { padding: 15px; cursor: pointer; background: #4CAF50; color: white; border: none; font-weight: bold; }
    </style>
</head>
<body>
    <h1>DISPO TYCOON</h1>
    <div class="dispensary-layout">
        <div class="room">
            <h2>GROW ROOM</h2>
            <p>Supply: <span id="weed">0</span>g</p>
            <p>Growers Hired: <span id="growers">0</span></p>
            <button onclick="buyGrower()">Hire Grower ($50)</button>
        </div>
        <div class="room">
            <div class="counter-top">🛒</div>
            <h2>COUNTERTOP</h2>
            <p>Cash: $<span id="money">0</span></p>
            <p id="status">Waiting for customers...</p>
        </div>
    </div>
    <script>
        let money = 0; let weed = 0; let growers = 0;
        function buyGrower() {
            if (money >= 50) { money -= 50; growers++; updateDisplay(); }
        }
        function updateDisplay() {
            document.getElementById("money").innerText = money;
            document.getElementById("weed").innerText = weed;
            document.getElementById("growers").innerText = growers;
        }
        setInterval(() => { weed += growers; updateDisplay(); }, 1000);
        setInterval(() => {
            if (weed >= 1) {
                weed--; money += 10;
                document.getElementById("status").innerText = "Customer at counter!";
            } else {
                document.getElementById("status").innerText = "Waiting for stock...";
            }
            updateDisplay();
        }, 2000);
    </script>
</body>
</html>
EOT
