class TrainTroops {
    constructor(barbarianTrops, archerTrops, giantTrops, ballonTrops) {
        this.barbarianTrops = barbarianTrops;
        this.archerTrops = archerTrops;
        this.giantTrops = giantTrops;
        this.ballonTrops = ballonTrops;
    }
}

class CookSpell {
    constructor(lightSpell, healingSpell, rageSpell, jumpSpell) {
        this.lightSpell = lightSpell;
        this.healingSpell = healingSpell;
        this.rageSpell = rageSpell;
        this.jumpSpell = jumpSpell;
    }
}

class BattleMachine {
    constructor(wallMachine, ballonMachine, zeppelinMachine) {
        this.wallMachine = wallMachine;
        this.ballonMachine = ballonMachine;
        this.zeppelinMachine = zeppelinMachine;
    }
}

const Troops = new TrainTroops(16, 16, 16, 16);
console.log(Troops);

const Spell = new CookSpell(1, 2, 3, 1);
console.log(Spell);

const Machine = new BattleMachine(1, 1, 1)
console.log(Machine)