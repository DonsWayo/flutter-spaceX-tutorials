import 'dart:convert';

List<UpcomingLaunches> upcomingLaunchesFromJson(String str) => List<UpcomingLaunches>.from(json.decode(str).map((x) => UpcomingLaunches.fromJson(x)));

String upcomingLaunchesToJson(List<UpcomingLaunches> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingLaunches {
    int flightNumber;
    String missionName;
    List<String> missionId;
    String launchYear;
    int launchDateUnix;
    DateTime launchDateUtc;
    DateTime launchDateLocal;
    bool isTentative;
    String tentativeMaxPrecision;
    bool tbd;
    dynamic launchWindow;
    Rocket rocket;
    List<String> ships;
    Telemetry telemetry;
    LaunchSite launchSite;
    dynamic launchSuccess;
    Links links;
    String details;
    bool upcoming;
    DateTime staticFireDateUtc;
    int staticFireDateUnix;
    dynamic timeline;

    UpcomingLaunches({
        this.flightNumber,
        this.missionName,
        this.missionId,
        this.launchYear,
        this.launchDateUnix,
        this.launchDateUtc,
        this.launchDateLocal,
        this.isTentative,
        this.tentativeMaxPrecision,
        this.tbd,
        this.launchWindow,
        this.rocket,
        this.ships,
        this.telemetry,
        this.launchSite,
        this.launchSuccess,
        this.links,
        this.details,
        this.upcoming,
        this.staticFireDateUtc,
        this.staticFireDateUnix,
        this.timeline,
    });

    factory UpcomingLaunches.fromJson(Map<String, dynamic> json) => UpcomingLaunches(
        flightNumber: json["flight_number"],
        missionName: json["mission_name"],
        missionId: List<String>.from(json["mission_id"].map((x) => x)),
        launchYear: json["launch_year"],
        launchDateUnix: json["launch_date_unix"],
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
        isTentative: json["is_tentative"],
        tentativeMaxPrecision: json["tentative_max_precision"],
        tbd: json["tbd"],
        launchWindow: json["launch_window"],
        rocket: Rocket.fromJson(json["rocket"]),
        ships: List<String>.from(json["ships"].map((x) => x)),
        telemetry: Telemetry.fromJson(json["telemetry"]),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        launchSuccess: json["launch_success"],
        links: Links.fromJson(json["links"]),
        details: json["details"] == null ? null : json["details"],
        upcoming: json["upcoming"],
        staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"] == null ? null : json["static_fire_date_unix"],
        timeline: json["timeline"],
    );

    Map<String, dynamic> toJson() => {
        "flight_number": flightNumber,
        "mission_name": missionName,
        "mission_id": List<dynamic>.from(missionId.map((x) => x)),
        "launch_year": launchYear,
        "launch_date_unix": launchDateUnix,
        "launch_date_utc": launchDateUtc.toIso8601String(),
        "launch_date_local": launchDateLocal.toIso8601String(),
        "is_tentative": isTentative,
        "tentative_max_precision": tentativeMaxPrecision,
        "tbd": tbd,
        "launch_window": launchWindow,
        "rocket": rocket.toJson(),
        "ships": List<dynamic>.from(ships.map((x) => x)),
        "telemetry": telemetry.toJson(),
        "launch_site": launchSite.toJson(),
        "launch_success": launchSuccess,
        "links": links.toJson(),
        "details": details == null ? null : details,
        "upcoming": upcoming,
        "static_fire_date_utc": staticFireDateUtc == null ? null : staticFireDateUtc.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix == null ? null : staticFireDateUnix,
        "timeline": timeline,
    };
}

class LaunchSite {
    SiteId siteId;
    SiteName siteName;
    SiteNameLong siteNameLong;

    LaunchSite({
        this.siteId,
        this.siteName,
        this.siteNameLong,
    });

    factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: siteIdValues.map[json["site_id"]],
        siteName: siteNameValues.map[json["site_name"]],
        siteNameLong: siteNameLongValues.map[json["site_name_long"]],
    );

    Map<String, dynamic> toJson() => {
        "site_id": siteIdValues.reverse[siteId],
        "site_name": siteNameValues.reverse[siteName],
        "site_name_long": siteNameLongValues.reverse[siteNameLong],
    };
}

enum SiteId { CCAFS_SLC_40, KSC_LC_39_A, VAFB_SLC_4_E }

final siteIdValues = EnumValues({
    "ccafs_slc_40": SiteId.CCAFS_SLC_40,
    "ksc_lc_39a": SiteId.KSC_LC_39_A,
    "vafb_slc_4e": SiteId.VAFB_SLC_4_E
});

enum SiteName { CCAFS_SLC_40, KSC_LC_39_A, VAFB_SLC_4_E }

final siteNameValues = EnumValues({
    "CCAFS SLC 40": SiteName.CCAFS_SLC_40,
    "KSC LC 39A": SiteName.KSC_LC_39_A,
    "VAFB SLC 4E": SiteName.VAFB_SLC_4_E
});

enum SiteNameLong { CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40, KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A, VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E }

final siteNameLongValues = EnumValues({
    "Cape Canaveral Air Force Station Space Launch Complex 40": SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
    "Kennedy Space Center Historic Launch Complex 39A": SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
    "Vandenberg Air Force Base Space Launch Complex 4E": SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
});

class Links {
    dynamic missionPatch;
    dynamic missionPatchSmall;
    String redditCampaign;
    dynamic redditLaunch;
    dynamic redditRecovery;
    dynamic redditMedia;
    dynamic presskit;
    dynamic articleLink;
    dynamic wikipedia;
    dynamic videoLink;
    dynamic youtubeId;
    List<dynamic> flickrImages;

    Links({
        this.missionPatch,
        this.missionPatchSmall,
        this.redditCampaign,
        this.redditLaunch,
        this.redditRecovery,
        this.redditMedia,
        this.presskit,
        this.articleLink,
        this.wikipedia,
        this.videoLink,
        this.youtubeId,
        this.flickrImages,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        missionPatch: json["mission_patch"],
        missionPatchSmall: json["mission_patch_small"],
        redditCampaign: json["reddit_campaign"] == null ? null : json["reddit_campaign"],
        redditLaunch: json["reddit_launch"],
        redditRecovery: json["reddit_recovery"],
        redditMedia: json["reddit_media"],
        presskit: json["presskit"],
        articleLink: json["article_link"],
        wikipedia: json["wikipedia"],
        videoLink: json["video_link"],
        youtubeId: json["youtube_id"],
        flickrImages: List<dynamic>.from(json["flickr_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mission_patch": missionPatch,
        "mission_patch_small": missionPatchSmall,
        "reddit_campaign": redditCampaign == null ? null : redditCampaign,
        "reddit_launch": redditLaunch,
        "reddit_recovery": redditRecovery,
        "reddit_media": redditMedia,
        "presskit": presskit,
        "article_link": articleLink,
        "wikipedia": wikipedia,
        "video_link": videoLink,
        "youtube_id": youtubeId,
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
    };
}

class Rocket {
    RocketId rocketId;
    RocketName rocketName;
    RocketType rocketType;
    FirstStage firstStage;
    SecondStage secondStage;
    Fairings fairings;

    Rocket({
        this.rocketId,
        this.rocketName,
        this.rocketType,
        this.firstStage,
        this.secondStage,
        this.fairings,
    });

    factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: rocketIdValues.map[json["rocket_id"]],
        rocketName: rocketNameValues.map[json["rocket_name"]],
        rocketType: rocketTypeValues.map[json["rocket_type"]],
        firstStage: FirstStage.fromJson(json["first_stage"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
        fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
    );

    Map<String, dynamic> toJson() => {
        "rocket_id": rocketIdValues.reverse[rocketId],
        "rocket_name": rocketNameValues.reverse[rocketName],
        "rocket_type": rocketTypeValues.reverse[rocketType],
        "first_stage": firstStage.toJson(),
        "second_stage": secondStage.toJson(),
        "fairings": fairings == null ? null : fairings.toJson(),
    };
}

class Fairings {
    bool reused;
    bool recoveryAttempt;
    bool recovered;
    dynamic ship;

    Fairings({
        this.reused,
        this.recoveryAttempt,
        this.recovered,
        this.ship,
    });

    factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        ship: json["ship"],
    );

    Map<String, dynamic> toJson() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt == null ? null : recoveryAttempt,
        "recovered": recovered == null ? null : recovered,
        "ship": ship,
    };
}

class FirstStage {
    List<Core> cores;

    FirstStage({
        this.cores,
    });

    factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
    };
}

class Core {
    String coreSerial;
    int flight;
    int block;
    bool gridfins;
    bool legs;
    bool reused;
    dynamic landSuccess;
    bool landingIntent;
    String landingType;
    String landingVehicle;

    Core({
        this.coreSerial,
        this.flight,
        this.block,
        this.gridfins,
        this.legs,
        this.reused,
        this.landSuccess,
        this.landingIntent,
        this.landingType,
        this.landingVehicle,
    });

    factory Core.fromJson(Map<String, dynamic> json) => Core(
        coreSerial: json["core_serial"] == null ? null : json["core_serial"],
        flight: json["flight"] == null ? null : json["flight"],
        block: json["block"] == null ? null : json["block"],
        gridfins: json["gridfins"] == null ? null : json["gridfins"],
        legs: json["legs"] == null ? null : json["legs"],
        reused: json["reused"] == null ? null : json["reused"],
        landSuccess: json["land_success"],
        landingIntent: json["landing_intent"] == null ? null : json["landing_intent"],
        landingType: json["landing_type"] == null ? null : json["landing_type"],
        landingVehicle: json["landing_vehicle"] == null ? null : json["landing_vehicle"],
    );

    Map<String, dynamic> toJson() => {
        "core_serial": coreSerial == null ? null : coreSerial,
        "flight": flight == null ? null : flight,
        "block": block == null ? null : block,
        "gridfins": gridfins == null ? null : gridfins,
        "legs": legs == null ? null : legs,
        "reused": reused == null ? null : reused,
        "land_success": landSuccess,
        "landing_intent": landingIntent == null ? null : landingIntent,
        "landing_type": landingType == null ? null : landingType,
        "landing_vehicle": landingVehicle == null ? null : landingVehicle,
    };
}

enum RocketId { FALCON9, FALCONHEAVY }

final rocketIdValues = EnumValues({
    "falcon9": RocketId.FALCON9,
    "falconheavy": RocketId.FALCONHEAVY
});

enum RocketName { FALCON_9, FALCON_HEAVY }

final rocketNameValues = EnumValues({
    "Falcon 9": RocketName.FALCON_9,
    "Falcon Heavy": RocketName.FALCON_HEAVY
});

enum RocketType { FT }

final rocketTypeValues = EnumValues({
    "FT": RocketType.FT
});

class SecondStage {
    int block;
    List<Payload> payloads;

    SecondStage({
        this.block,
        this.payloads,
    });

    factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json["block"] == null ? null : json["block"],
        payloads: List<Payload>.from(json["payloads"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "block": block == null ? null : block,
        "payloads": List<dynamic>.from(payloads.map((x) => x.toJson())),
    };
}

class Payload {
    String payloadId;
    List<dynamic> noradId;
    bool reused;
    List<String> customers;
    String nationality;
    String manufacturer;
    String payloadType;
    int payloadMassKg;
    double payloadMassLbs;
    String orbit;
    OrbitParams orbitParams;
    dynamic capSerial;
    dynamic massReturnedKg;
    dynamic massReturnedLbs;
    dynamic flightTimeSec;
    dynamic cargoManifest;

    Payload({
        this.payloadId,
        this.noradId,
        this.reused,
        this.customers,
        this.nationality,
        this.manufacturer,
        this.payloadType,
        this.payloadMassKg,
        this.payloadMassLbs,
        this.orbit,
        this.orbitParams,
        this.capSerial,
        this.massReturnedKg,
        this.massReturnedLbs,
        this.flightTimeSec,
        this.cargoManifest,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        payloadId: json["payload_id"],
        noradId: List<dynamic>.from(json["norad_id"].map((x) => x)),
        reused: json["reused"],
        customers: List<String>.from(json["customers"].map((x) => x)),
        nationality: json["nationality"],
        manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
        payloadType: json["payload_type"],
        payloadMassKg: json["payload_mass_kg"] == null ? null : json["payload_mass_kg"],
        payloadMassLbs: json["payload_mass_lbs"] == null ? null : json["payload_mass_lbs"].toDouble(),
        orbit: json["orbit"],
        orbitParams: OrbitParams.fromJson(json["orbit_params"]),
        capSerial: json["cap_serial"],
        massReturnedKg: json["mass_returned_kg"],
        massReturnedLbs: json["mass_returned_lbs"],
        flightTimeSec: json["flight_time_sec"],
        cargoManifest: json["cargo_manifest"],
    );

    Map<String, dynamic> toJson() => {
        "payload_id": payloadId,
        "norad_id": List<dynamic>.from(noradId.map((x) => x)),
        "reused": reused,
        "customers": List<dynamic>.from(customers.map((x) => x)),
        "nationality": nationality,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "payload_type": payloadType,
        "payload_mass_kg": payloadMassKg == null ? null : payloadMassKg,
        "payload_mass_lbs": payloadMassLbs == null ? null : payloadMassLbs,
        "orbit": orbit,
        "orbit_params": orbitParams.toJson(),
        "cap_serial": capSerial,
        "mass_returned_kg": massReturnedKg,
        "mass_returned_lbs": massReturnedLbs,
        "flight_time_sec": flightTimeSec,
        "cargo_manifest": cargoManifest,
    };
}

class OrbitParams {
    ReferenceSystem referenceSystem;
    String regime;
    double longitude;
    dynamic semiMajorAxisKm;
    dynamic eccentricity;
    dynamic periapsisKm;
    dynamic apoapsisKm;
    dynamic inclinationDeg;
    dynamic periodMin;
    double lifespanYears;
    dynamic epoch;
    dynamic meanMotion;
    dynamic raan;
    dynamic argOfPericenter;
    dynamic meanAnomaly;

    OrbitParams({
        this.referenceSystem,
        this.regime,
        this.longitude,
        this.semiMajorAxisKm,
        this.eccentricity,
        this.periapsisKm,
        this.apoapsisKm,
        this.inclinationDeg,
        this.periodMin,
        this.lifespanYears,
        this.epoch,
        this.meanMotion,
        this.raan,
        this.argOfPericenter,
        this.meanAnomaly,
    });

    factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
        referenceSystem: json["reference_system"] == null ? null : referenceSystemValues.map[json["reference_system"]],
        regime: json["regime"] == null ? null : json["regime"],
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        semiMajorAxisKm: json["semi_major_axis_km"],
        eccentricity: json["eccentricity"],
        periapsisKm: json["periapsis_km"],
        apoapsisKm: json["apoapsis_km"],
        inclinationDeg: json["inclination_deg"],
        periodMin: json["period_min"],
        lifespanYears: json["lifespan_years"] == null ? null : json["lifespan_years"].toDouble(),
        epoch: json["epoch"],
        meanMotion: json["mean_motion"],
        raan: json["raan"],
        argOfPericenter: json["arg_of_pericenter"],
        meanAnomaly: json["mean_anomaly"],
    );

    Map<String, dynamic> toJson() => {
        "reference_system": referenceSystem == null ? null : referenceSystemValues.reverse[referenceSystem],
        "regime": regime == null ? null : regime,
        "longitude": longitude == null ? null : longitude,
        "semi_major_axis_km": semiMajorAxisKm,
        "eccentricity": eccentricity,
        "periapsis_km": periapsisKm,
        "apoapsis_km": apoapsisKm,
        "inclination_deg": inclinationDeg,
        "period_min": periodMin,
        "lifespan_years": lifespanYears == null ? null : lifespanYears,
        "epoch": epoch,
        "mean_motion": meanMotion,
        "raan": raan,
        "arg_of_pericenter": argOfPericenter,
        "mean_anomaly": meanAnomaly,
    };
}

enum ReferenceSystem { GEOCENTRIC, SELENOCENTRIC }

final referenceSystemValues = EnumValues({
    "geocentric": ReferenceSystem.GEOCENTRIC,
    "selenocentric": ReferenceSystem.SELENOCENTRIC
});

class Telemetry {
    dynamic flightClub;

    Telemetry({
        this.flightClub,
    });

    factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json["flight_club"],
    );

    Map<String, dynamic> toJson() => {
        "flight_club": flightClub,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
