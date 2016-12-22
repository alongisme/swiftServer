import Vapor

let drop = Droplet()

drop.get { req in
    return try JSON(node:["message":"Hello"])
}

drop.get("getApi") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON( node : [
        "name" : "Hello \(name)!"
        ])
}

drop.post("getProtocolList") { request in
    return try JSON( node : [
        "cmd1" : [
                "head" : "4",
                "version" : "3",
                "type" : "1",
                "IMEI" : "15",
                "IMSI" : "16",
                "foot" : "4"
            ],
        "cmd2" : [
                "head" : "4",
                "version" : "3",
                "type" : "1",
                "IMEI" : "15",
                "IMSI" : "16",
                "TIME" : "14",
                "power" : "50",
                "foot" : "4"
            ],
        "cmd3" : [
                "head" : "4",
                "version" : "3",
                "type" : "1",
                "IMEI" : "15",
                "IMSI" : "16",
                "check" : "50",
                "context" : "testContext",
                "foot" : "4"
            ]
        ])
}

drop.run()
