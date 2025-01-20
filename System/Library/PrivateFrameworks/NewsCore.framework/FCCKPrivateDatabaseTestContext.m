@interface FCCKPrivateDatabaseTestContext
- (CKDatabase)ckDatabase;
- (CKDatabase)ckDatabaseWithZoneWidePCS;
- (CKDatabase)ckSecureDatabase;
- (CKRecord)clientRecord;
- (CKRecord)clientRecordSecure;
- (CKRecord)clientRecordWithZoneWidePCS;
- (CKRecord)defaultZoneClientRecord;
- (CKRecord)defaultZoneClientRecordSecure;
- (CKRecord)defaultZoneServerRecord;
- (CKRecord)defaultZoneServerRecordSecure;
- (CKRecord)serverRecord;
- (CKRecord)serverRecordSecure;
- (CKRecord)serverRecordWithZoneWidePCS;
- (CKRecordID)clientRecordID;
- (CKRecordID)clientRecordIDSecure;
- (CKRecordID)clientRecordIDWithZoneWidePCS;
- (CKRecordID)defaultZoneClientRecordID;
- (CKRecordID)defaultZoneClientRecordIDSecure;
- (CKRecordID)defaultZoneServerRecordID;
- (CKRecordID)defaultZoneServerRecordIDSecure;
- (CKRecordID)serverRecordID;
- (CKRecordID)serverRecordIDSecure;
- (CKRecordID)serverRecordIDWithZoneWidePCS;
- (CKRecordZone)clientZone;
- (CKRecordZone)clientZoneSecure;
- (CKRecordZone)clientZoneWithZoneWidePCS;
- (CKRecordZone)serverZone;
- (CKRecordZone)serverZoneSecure;
- (CKRecordZone)serverZoneWithZoneWidePCS;
- (CKRecordZoneID)clientZoneID;
- (CKRecordZoneID)clientZoneIDSecure;
- (CKRecordZoneID)clientZoneIDWithZoneWidePCS;
- (CKRecordZoneID)serverZoneID;
- (CKRecordZoneID)serverZoneIDSecure;
- (CKRecordZoneID)serverZoneIDWithZoneWidePCS;
- (FCCKPrivateDatabase)database;
- (FCCKPrivateDatabaseTestContext)init;
- (NSArray)allClientRecordIDs;
- (NSArray)allClientRecords;
- (NSArray)allClientZoneIDs;
- (NSArray)allClientZones;
- (NSArray)allDefaultZoneClientRecordIDs;
- (NSArray)allDefaultZoneClientRecords;
- (NSArray)allServerRecordIDs;
- (NSArray)allServerRecords;
- (NSArray)allServerZoneIDs;
- (NSArray)allServerZones;
- (NSDictionary)allClientRecordsByID;
- (NSDictionary)allClientZonesByID;
- (NSDictionary)allDefaultZoneClientRecordsByID;
- (TCKDatabase)tckDatabase;
- (TCKDatabase)tckDatabaseWithZoneWidePCS;
- (TCKDatabase)tckSecureDatabase;
@end

@implementation FCCKPrivateDatabaseTestContext

- (FCCKPrivateDatabaseTestContext)init
{
  v331[1] = *MEMORY[0x1E4F143B8];
  v300.receiver = self;
  v300.super_class = (Class)FCCKPrivateDatabaseTestContext;
  v2 = [(FCCKPrivateDatabaseTestContext *)&v300 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v4 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Record_Client", MEMORY[0x1E4F1CBF0]);
    uint64_t v5 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Record_Server", v3);
    uint64_t v6 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"Regular_Client");
    v299 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"Regular_Server");
    uint64_t v7 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"ZoneWidePCS_Client");
    v298 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ZoneWidePCS_Server", 2, 0);
    v297 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"Secure_Client");
    v296 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"Secure_Server", 6, 0);
    v291 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"SecureZoneWidePCS_Client");
    v290 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"SecureZoneWidePCS_Server", 6, 0);
    v331[0] = @"DefaultZoneStaticRecord_Client";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v331 count:1];
    uint64_t v9 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v8, 0);

    v330 = @"DefaultZoneStaticRecord_Server";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v330 count:1];
    v294 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v10, 0);

    v329 = @"DefaultZoneStaticRecordSecure_Client";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v329 count:1];
    v293 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v11, 0);

    v328 = @"DefaultZoneStaticRecordSecure_Server";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v328 count:1];
    uint64_t v13 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v12, 1);

    v14 = objc_alloc_init(TCKDatabase);
    tckDatabase = v2->_tckDatabase;
    v2->_tckDatabase = v14;

    v16 = objc_alloc_init(TCKDatabase);
    tckDatabaseWithZoneWidePCS = v2->_tckDatabaseWithZoneWidePCS;
    v2->_tckDatabaseWithZoneWidePCS = v16;

    v18 = objc_alloc_init(TCKDatabase);
    tckSecureDatabase = v2->_tckSecureDatabase;
    v2->_tckSecureDatabase = v18;

    objc_storeStrong((id *)&v2->_ckDatabase, v2->_tckDatabase);
    objc_storeStrong((id *)&v2->_ckDatabaseWithZoneWidePCS, v2->_tckDatabaseWithZoneWidePCS);
    objc_storeStrong((id *)&v2->_ckSecureDatabase, v2->_tckSecureDatabase);
    v295 = (void *)v9;
    if (v9) {
      v20 = *(void **)(v9 + 16);
    }
    else {
      v20 = 0;
    }
    id v282 = v20;
    if (v4) {
      v21 = *(void **)(v4 + 16);
    }
    else {
      v21 = 0;
    }
    id v262 = v21;
    v261 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v282);
    v327[0] = v261;
    if (v6) {
      v22 = *(void **)(v6 + 16);
    }
    else {
      v22 = 0;
    }
    id v280 = v22;
    if (v4) {
      v23 = *(void **)(v4 + 16);
    }
    else {
      v23 = 0;
    }
    id v260 = v23;
    v259 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v280);
    v327[1] = v259;
    if (v7) {
      v24 = *(void **)(v7 + 16);
    }
    else {
      v24 = 0;
    }
    id v278 = v24;
    if (v4) {
      v25 = *(void **)(v4 + 16);
    }
    else {
      v25 = 0;
    }
    id v258 = v25;
    v257 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v278);
    v327[2] = v257;
    if (v297) {
      v26 = (void *)v297[2];
    }
    else {
      v26 = 0;
    }
    id v276 = v26;
    if (v4) {
      v27 = *(void **)(v4 + 16);
    }
    else {
      v27 = 0;
    }
    id v256 = v27;
    v255 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v276);
    v327[3] = v255;
    if (v291) {
      v28 = (void *)v291[2];
    }
    else {
      v28 = 0;
    }
    id v274 = v28;
    if (v4) {
      v29 = *(void **)(v4 + 16);
    }
    else {
      v29 = 0;
    }
    id v254 = v29;
    v253 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v274);
    v327[4] = v253;
    v252 = [MEMORY[0x1E4F1C978] arrayWithObjects:v327 count:5];
    v30 = (void *)v9;
    if (v9) {
      v30 = *(void **)(v9 + 16);
    }
    id v272 = v30;
    if (v4) {
      v31 = *(void **)(v4 + 16);
    }
    else {
      v31 = 0;
    }
    id v251 = v31;
    v250 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v272);
    v325[0] = v250;
    v32 = v294;
    if (v294) {
      v32 = (void *)v294[2];
    }
    id v270 = v32;
    if (v5) {
      v33 = *(void **)(v5 + 16);
    }
    else {
      v33 = 0;
    }
    id v249 = v33;
    v248 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v270);
    v326[0] = v248;
    v34 = v293;
    if (v293) {
      v34 = (void *)v293[2];
    }
    id v269 = v34;
    if (v4) {
      v35 = *(void **)(v4 + 16);
    }
    else {
      v35 = 0;
    }
    id v247 = v35;
    v246 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v269);
    v325[1] = v246;
    if (v13) {
      v36 = *(void **)(v13 + 16);
    }
    else {
      v36 = 0;
    }
    id v268 = v36;
    if (v5) {
      v37 = *(void **)(v5 + 16);
    }
    else {
      v37 = 0;
    }
    id v245 = v37;
    v244 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v268);
    v326[1] = v244;
    if (v6) {
      v38 = *(void **)(v6 + 16);
    }
    else {
      v38 = 0;
    }
    id v267 = v38;
    if (v4) {
      v39 = *(void **)(v4 + 16);
    }
    else {
      v39 = 0;
    }
    id v243 = v39;
    v242 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v267);
    v325[2] = v242;
    v40 = v299;
    if (v299) {
      v40 = (void *)v299[2];
    }
    id v266 = v40;
    if (v5) {
      v41 = *(void **)(v5 + 16);
    }
    else {
      v41 = 0;
    }
    id v241 = v41;
    v240 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v266);
    v326[2] = v240;
    if (v7) {
      v42 = *(void **)(v7 + 16);
    }
    else {
      v42 = 0;
    }
    id v265 = v42;
    if (v4) {
      v43 = *(void **)(v4 + 16);
    }
    else {
      v43 = 0;
    }
    id v239 = v43;
    v238 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v265);
    v325[3] = v238;
    v44 = v298;
    if (v298) {
      v44 = (void *)v298[2];
    }
    id v264 = v44;
    if (v5) {
      v45 = *(void **)(v5 + 16);
    }
    else {
      v45 = 0;
    }
    id v237 = v45;
    v236 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v264);
    v326[3] = v236;
    if (v297) {
      v46 = (void *)v297[2];
    }
    else {
      v46 = 0;
    }
    id v47 = v46;
    if (v4) {
      v48 = *(void **)(v4 + 16);
    }
    else {
      v48 = 0;
    }
    id v235 = v48;
    v234 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v47);
    v325[4] = v234;
    v49 = v296;
    if (v296) {
      v49 = (void *)v296[2];
    }
    id v263 = v49;
    v289 = (void *)v4;
    v286 = (void *)v13;
    if (v5) {
      v50 = *(void **)(v5 + 16);
    }
    else {
      v50 = 0;
    }
    id v233 = v50;
    v232 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v263);
    v326[4] = v232;
    if (v291) {
      v51 = (void *)v291[2];
    }
    else {
      v51 = 0;
    }
    id v52 = v51;
    v53 = (void *)v4;
    v292 = (void *)v7;
    if (v4) {
      v53 = *(void **)(v4 + 16);
    }
    id v54 = v53;
    v55 = +[FCPair pairWithFirst:v52 second:v54];
    v325[5] = v55;
    v56 = v290;
    if (v290) {
      v56 = (void *)v290[2];
    }
    id v57 = v56;
    v287 = (void *)v6;
    v288 = (void *)v5;
    if (v5) {
      v58 = *(void **)(v5 + 16);
    }
    else {
      v58 = 0;
    }
    id v59 = v58;
    v60 = +[FCPair pairWithFirst:v57 second:v59];
    v326[5] = v60;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v326 forKeys:v325 count:6];
    v285 = +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:v252 V2Changes:v61 V3Changes:0 V4Changes:0];

    if (v295) {
      v62 = (void *)v295[2];
    }
    else {
      v62 = 0;
    }
    id v283 = v62;
    v281 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v324[0] = v281;
    if (v295) {
      v63 = (void *)v295[2];
    }
    else {
      v63 = 0;
    }
    id v279 = v63;
    v277 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v324[1] = v277;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v324 count:2];
    if (v295) {
      v65 = (void *)v295[2];
    }
    else {
      v65 = 0;
    }
    id v275 = v65;
    v273 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v322[0] = v273;
    v66 = v294;
    if (v294) {
      v66 = (void *)v294[2];
    }
    id v271 = v66;
    v67 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v323[0] = v67;
    v68 = v293;
    if (v293) {
      v68 = (void *)v293[2];
    }
    id v69 = v68;
    v70 = +[FCPair pairWithFirst:v69 second:@"DefaultZoneStaticRecordSecure_Client"];
    v322[1] = v70;
    if (v286) {
      v71 = (void *)v286[2];
    }
    else {
      v71 = 0;
    }
    id v72 = v71;
    v73 = +[FCPair pairWithFirst:v72 second:@"DefaultZoneStaticRecordSecure_Server"];
    v323[1] = v73;
    v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v323 forKeys:v322 count:2];
    v75 = +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:v64 V2Changes:v74 V3Changes:0 V4Changes:0];

    v321[0] = v287;
    v321[1] = v299;
    v321[2] = v292;
    v321[3] = v298;
    v321[4] = v297;
    v321[5] = v296;
    v321[6] = v291;
    v321[7] = v290;
    v321[8] = v295;
    v321[9] = v294;
    v321[10] = v293;
    v321[11] = v286;
    v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v321 count:12];
    v320[0] = v289;
    v320[1] = v288;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v320 count:2];
    v284 = v75;
    v78 = +[FCCKPrivateDatabaseSchema databaseSchemaWithZones:records:recordTypeVersionMapping:recordNameVersionMapping:]((uint64_t)FCCKPrivateDatabaseSchema, v76, v77, v285, v75);

    v79 = -[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]((id *)[FCCKDatabaseEncryptionMiddleware alloc], v78, 0);
    v80 = [FCCKPrivateDatabase alloc];
    ckDatabase = v2->_ckDatabase;
    ckDatabaseWithZoneWidePCS = v2->_ckDatabaseWithZoneWidePCS;
    ckSecureDatabase = v2->_ckSecureDatabase;
    v319 = v79;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v319 count:1];
    uint64_t v85 = -[FCCKPrivateDatabase t_initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:schema:middleware:encryptionDelegate:networkBehaviorMonitor:]((id *)&v80->super.isa, 0, ckDatabase, ckDatabaseWithZoneWidePCS, ckSecureDatabase, v78, v84, 0, 0);
    database = v2->_database;
    v2->_database = (FCCKPrivateDatabase *)v85;

    v87 = v2->_database;
    if (v87) {
      v87->_currentVersion = 3;
    }
    id v88 = objc_alloc(MEMORY[0x1E4F1A320]);
    if (v287) {
      v89 = (void *)v287[2];
    }
    else {
      v89 = 0;
    }
    id v90 = v89;
    uint64_t v91 = *MEMORY[0x1E4F19C08];
    uint64_t v92 = [v88 initWithZoneName:v90 ownerName:*MEMORY[0x1E4F19C08]];
    clientZoneID = v2->_clientZoneID;
    v2->_clientZoneID = (CKRecordZoneID *)v92;

    id v94 = objc_alloc(MEMORY[0x1E4F1A320]);
    v95 = v292;
    if (v292) {
      v95 = (void *)v292[2];
    }
    id v96 = v95;
    uint64_t v97 = [v94 initWithZoneName:v96 ownerName:v91];
    clientZoneIDWithZoneWidePCS = v2->_clientZoneIDWithZoneWidePCS;
    v2->_clientZoneIDWithZoneWidePCS = (CKRecordZoneID *)v97;

    id v99 = objc_alloc(MEMORY[0x1E4F1A320]);
    v100 = v297;
    if (v297) {
      v100 = (void *)v297[2];
    }
    id v101 = v100;
    uint64_t v102 = [v99 initWithZoneName:v101 ownerName:v91];
    clientZoneIDSecure = v2->_clientZoneIDSecure;
    v2->_clientZoneIDSecure = (CKRecordZoneID *)v102;

    long long v317 = *(_OWORD *)&v2->_clientZoneID;
    v318 = v2->_clientZoneIDSecure;
    uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v317 count:3];
    allClientZoneIDs = v2->_allClientZoneIDs;
    v2->_allClientZoneIDs = (NSArray *)v104;

    uint64_t v106 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_clientZoneID];
    clientZone = v2->_clientZone;
    v2->_clientZone = (CKRecordZone *)v106;

    uint64_t v108 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_clientZoneIDWithZoneWidePCS];
    clientZoneWithZoneWidePCS = v2->_clientZoneWithZoneWidePCS;
    v2->_clientZoneWithZoneWidePCS = (CKRecordZone *)v108;

    uint64_t v110 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_clientZoneIDSecure];
    clientZoneSecure = v2->_clientZoneSecure;
    v2->_clientZoneSecure = (CKRecordZone *)v110;

    long long v315 = *(_OWORD *)&v2->_clientZone;
    v316 = v2->_clientZoneSecure;
    uint64_t v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v315 count:3];
    allClientZones = v2->_allClientZones;
    v2->_allClientZones = (NSArray *)v112;

    uint64_t v114 = [(NSArray *)v2->_allClientZones fc_dictionaryWithKeyBlock:&__block_literal_global_154];
    allClientZonesByID = v2->_allClientZonesByID;
    v2->_allClientZonesByID = (NSDictionary *)v114;

    uint64_t v116 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_clientZoneID];
    clientRecordID = v2->_clientRecordID;
    v2->_clientRecordID = (CKRecordID *)v116;

    uint64_t v118 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_clientZoneIDWithZoneWidePCS];
    clientRecordIDWithZoneWidePCS = v2->_clientRecordIDWithZoneWidePCS;
    v2->_clientRecordIDWithZoneWidePCS = (CKRecordID *)v118;

    uint64_t v120 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_clientZoneIDSecure];
    clientRecordIDSecure = v2->_clientRecordIDSecure;
    v2->_clientRecordIDSecure = (CKRecordID *)v120;

    long long v313 = *(_OWORD *)&v2->_clientRecordID;
    v314 = v2->_clientRecordIDSecure;
    uint64_t v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v313 count:3];
    allClientRecordIDs = v2->_allClientRecordIDs;
    v2->_allClientRecordIDs = (NSArray *)v122;

    id v124 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v289) {
      v125 = (void *)v289[2];
    }
    else {
      v125 = 0;
    }
    id v126 = v125;
    uint64_t v127 = [v124 initWithRecordType:v126 recordID:v2->_clientRecordID];
    clientRecord = v2->_clientRecord;
    v2->_clientRecord = (CKRecord *)v127;

    id v129 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v289) {
      v130 = (void *)v289[2];
    }
    else {
      v130 = 0;
    }
    id v131 = v130;
    uint64_t v132 = [v129 initWithRecordType:v131 recordID:v2->_clientRecordIDWithZoneWidePCS];
    clientRecordWithZoneWidePCS = v2->_clientRecordWithZoneWidePCS;
    v2->_clientRecordWithZoneWidePCS = (CKRecord *)v132;

    id v134 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v289) {
      v135 = (void *)v289[2];
    }
    else {
      v135 = 0;
    }
    id v136 = v135;
    uint64_t v137 = [v134 initWithRecordType:v136 recordID:v2->_clientRecordIDSecure];
    clientRecordSecure = v2->_clientRecordSecure;
    v2->_clientRecordSecure = (CKRecord *)v137;

    long long v311 = *(_OWORD *)&v2->_clientRecord;
    v312 = v2->_clientRecordSecure;
    uint64_t v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v311 count:3];
    allClientRecords = v2->_allClientRecords;
    v2->_allClientRecords = (NSArray *)v139;

    uint64_t v141 = [(NSArray *)v2->_allClientRecords fc_dictionaryWithKeyBlock:&__block_literal_global_59_0];
    allClientRecordsByID = v2->_allClientRecordsByID;
    v2->_allClientRecordsByID = (NSDictionary *)v141;

    id v143 = objc_alloc(MEMORY[0x1E4F1A320]);
    v144 = v299;
    if (v299) {
      v144 = (void *)v299[2];
    }
    id v145 = v144;
    uint64_t v146 = [v143 initWithZoneName:v145 ownerName:v91];
    serverZoneID = v2->_serverZoneID;
    v2->_serverZoneID = (CKRecordZoneID *)v146;

    id v148 = objc_alloc(MEMORY[0x1E4F1A320]);
    v149 = v298;
    if (v298) {
      v149 = (void *)v298[2];
    }
    id v150 = v149;
    uint64_t v151 = [v148 initWithZoneName:v150 ownerName:v91];
    serverZoneIDWithZoneWidePCS = v2->_serverZoneIDWithZoneWidePCS;
    v2->_serverZoneIDWithZoneWidePCS = (CKRecordZoneID *)v151;

    id v153 = objc_alloc(MEMORY[0x1E4F1A320]);
    v154 = v296;
    if (v296) {
      v154 = (void *)v296[2];
    }
    id v155 = v154;
    uint64_t v156 = [v153 initWithZoneName:v155 ownerName:v91];
    serverZoneIDSecure = v2->_serverZoneIDSecure;
    v2->_serverZoneIDSecure = (CKRecordZoneID *)v156;

    long long v309 = *(_OWORD *)&v2->_serverZoneID;
    v310 = v2->_serverZoneIDSecure;
    uint64_t v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v309 count:3];
    allServerZoneIDs = v2->_allServerZoneIDs;
    v2->_allServerZoneIDs = (NSArray *)v158;

    uint64_t v160 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_serverZoneID];
    serverZone = v2->_serverZone;
    v2->_serverZone = (CKRecordZone *)v160;

    uint64_t v162 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_serverZoneIDWithZoneWidePCS];
    serverZoneWithZoneWidePCS = v2->_serverZoneWithZoneWidePCS;
    v2->_serverZoneWithZoneWidePCS = (CKRecordZone *)v162;

    uint64_t v164 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2->_serverZoneIDSecure];
    serverZoneSecure = v2->_serverZoneSecure;
    v2->_serverZoneSecure = (CKRecordZone *)v164;

    long long v307 = *(_OWORD *)&v2->_serverZone;
    v308 = v2->_serverZoneSecure;
    uint64_t v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v307 count:3];
    allServerZones = v2->_allServerZones;
    v2->_allServerZones = (NSArray *)v166;

    uint64_t v168 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_serverZoneID];
    serverRecordID = v2->_serverRecordID;
    v2->_serverRecordID = (CKRecordID *)v168;

    uint64_t v170 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_serverZoneIDWithZoneWidePCS];
    serverRecordIDWithZoneWidePCS = v2->_serverRecordIDWithZoneWidePCS;
    v2->_serverRecordIDWithZoneWidePCS = (CKRecordID *)v170;

    uint64_t v172 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"R" zoneID:v2->_serverZoneIDSecure];
    serverRecordIDSecure = v2->_serverRecordIDSecure;
    v2->_serverRecordIDSecure = (CKRecordID *)v172;

    long long v305 = *(_OWORD *)&v2->_serverRecordID;
    v306 = v2->_serverRecordIDSecure;
    uint64_t v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v305 count:3];
    allServerRecordIDs = v2->_allServerRecordIDs;
    v2->_allServerRecordIDs = (NSArray *)v174;

    id v176 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v288) {
      v177 = (void *)v288[2];
    }
    else {
      v177 = 0;
    }
    id v178 = v177;
    uint64_t v179 = [v176 initWithRecordType:v178 recordID:v2->_serverRecordID];
    serverRecord = v2->_serverRecord;
    v2->_serverRecord = (CKRecord *)v179;

    id v181 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v288) {
      v182 = (void *)v288[2];
    }
    else {
      v182 = 0;
    }
    id v183 = v182;
    uint64_t v184 = [v181 initWithRecordType:v183 recordID:v2->_serverRecordIDWithZoneWidePCS];
    serverRecordWithZoneWidePCS = v2->_serverRecordWithZoneWidePCS;
    v2->_serverRecordWithZoneWidePCS = (CKRecord *)v184;

    id v186 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v288) {
      v187 = (void *)v288[2];
    }
    else {
      v187 = 0;
    }
    id v188 = v187;
    uint64_t v189 = [v186 initWithRecordType:v188 recordID:v2->_serverRecordIDSecure];
    serverRecordSecure = v2->_serverRecordSecure;
    v2->_serverRecordSecure = (CKRecord *)v189;

    long long v303 = *(_OWORD *)&v2->_serverRecord;
    v304 = v2->_serverRecordSecure;
    uint64_t v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v303 count:3];
    allServerRecords = v2->_allServerRecords;
    v2->_allServerRecords = (NSArray *)v191;

    id v193 = objc_alloc(MEMORY[0x1E4F1A320]);
    v194 = (void *)[v193 initWithZoneName:*MEMORY[0x1E4F19D88] ownerName:v91];
    uint64_t v195 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"DefaultZoneStaticRecord_Client" zoneID:v194];
    defaultZoneClientRecordID = v2->_defaultZoneClientRecordID;
    v2->_defaultZoneClientRecordID = (CKRecordID *)v195;

    uint64_t v197 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"DefaultZoneStaticRecordSecure_Client" zoneID:v194];
    defaultZoneClientRecordIDSecure = v2->_defaultZoneClientRecordIDSecure;
    v2->_defaultZoneClientRecordIDSecure = (CKRecordID *)v197;

    uint64_t v199 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"DefaultZoneStaticRecord_Server" zoneID:v194];
    defaultZoneServerRecordID = v2->_defaultZoneServerRecordID;
    v2->_defaultZoneServerRecordID = (CKRecordID *)v199;

    uint64_t v201 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"DefaultZoneStaticRecordSecure_Server" zoneID:v194];
    defaultZoneServerRecordIDSecure = v2->_defaultZoneServerRecordIDSecure;
    v2->_defaultZoneServerRecordIDSecure = (CKRecordID *)v201;

    v203 = v2->_defaultZoneClientRecordIDSecure;
    v302[0] = v2->_defaultZoneClientRecordID;
    v302[1] = v203;
    uint64_t v204 = [MEMORY[0x1E4F1C978] arrayWithObjects:v302 count:2];
    allDefaultZoneClientRecordIDs = v2->_allDefaultZoneClientRecordIDs;
    v2->_allDefaultZoneClientRecordIDs = (NSArray *)v204;

    id v206 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v289) {
      v207 = (void *)v289[2];
    }
    else {
      v207 = 0;
    }
    id v208 = v207;
    uint64_t v209 = [v206 initWithRecordType:v208 recordID:v2->_defaultZoneClientRecordID];
    defaultZoneClientRecord = v2->_defaultZoneClientRecord;
    v2->_defaultZoneClientRecord = (CKRecord *)v209;

    id v211 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v289) {
      v212 = (void *)v289[2];
    }
    else {
      v212 = 0;
    }
    id v213 = v212;
    uint64_t v214 = [v211 initWithRecordType:v213 recordID:v2->_defaultZoneClientRecordIDSecure];
    defaultZoneClientRecordSecure = v2->_defaultZoneClientRecordSecure;
    v2->_defaultZoneClientRecordSecure = (CKRecord *)v214;

    id v216 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v288) {
      v217 = (void *)v288[2];
    }
    else {
      v217 = 0;
    }
    id v218 = v217;
    uint64_t v219 = [v216 initWithRecordType:v218 recordID:v2->_defaultZoneServerRecordID];
    defaultZoneServerRecord = v2->_defaultZoneServerRecord;
    v2->_defaultZoneServerRecord = (CKRecord *)v219;

    id v221 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v288) {
      v222 = (void *)v288[2];
    }
    else {
      v222 = 0;
    }
    id v223 = v222;
    uint64_t v224 = [v221 initWithRecordType:v223 recordID:v2->_defaultZoneServerRecordIDSecure];
    defaultZoneServerRecordSecure = v2->_defaultZoneServerRecordSecure;
    v2->_defaultZoneServerRecordSecure = (CKRecord *)v224;

    v226 = v2->_defaultZoneClientRecordSecure;
    v301[0] = v2->_defaultZoneClientRecord;
    v301[1] = v226;
    uint64_t v227 = [MEMORY[0x1E4F1C978] arrayWithObjects:v301 count:2];
    allDefaultZoneClientRecords = v2->_allDefaultZoneClientRecords;
    v2->_allDefaultZoneClientRecords = (NSArray *)v227;

    uint64_t v229 = [(NSArray *)v2->_allDefaultZoneClientRecords fc_dictionaryWithKeyBlock:&__block_literal_global_61_1];
    allDefaultZoneClientRecordsByID = v2->_allDefaultZoneClientRecordsByID;
    v2->_allDefaultZoneClientRecordsByID = (NSDictionary *)v229;
  }
  return v2;
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (CKDatabase)ckDatabase
{
  return self->_ckDatabase;
}

- (CKDatabase)ckDatabaseWithZoneWidePCS
{
  return self->_ckDatabaseWithZoneWidePCS;
}

- (CKDatabase)ckSecureDatabase
{
  return self->_ckSecureDatabase;
}

- (TCKDatabase)tckDatabase
{
  return self->_tckDatabase;
}

- (TCKDatabase)tckDatabaseWithZoneWidePCS
{
  return self->_tckDatabaseWithZoneWidePCS;
}

- (TCKDatabase)tckSecureDatabase
{
  return self->_tckSecureDatabase;
}

- (CKRecordID)clientRecordID
{
  return self->_clientRecordID;
}

- (CKRecordID)clientRecordIDWithZoneWidePCS
{
  return self->_clientRecordIDWithZoneWidePCS;
}

- (CKRecordID)clientRecordIDSecure
{
  return self->_clientRecordIDSecure;
}

- (NSArray)allClientRecordIDs
{
  return self->_allClientRecordIDs;
}

- (CKRecordID)serverRecordID
{
  return self->_serverRecordID;
}

- (CKRecordID)serverRecordIDWithZoneWidePCS
{
  return self->_serverRecordIDWithZoneWidePCS;
}

- (CKRecordID)serverRecordIDSecure
{
  return self->_serverRecordIDSecure;
}

- (NSArray)allServerRecordIDs
{
  return self->_allServerRecordIDs;
}

- (CKRecord)clientRecord
{
  return self->_clientRecord;
}

- (CKRecord)clientRecordWithZoneWidePCS
{
  return self->_clientRecordWithZoneWidePCS;
}

- (CKRecord)clientRecordSecure
{
  return self->_clientRecordSecure;
}

- (NSArray)allClientRecords
{
  return self->_allClientRecords;
}

- (NSDictionary)allClientRecordsByID
{
  return self->_allClientRecordsByID;
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (CKRecord)serverRecordWithZoneWidePCS
{
  return self->_serverRecordWithZoneWidePCS;
}

- (CKRecord)serverRecordSecure
{
  return self->_serverRecordSecure;
}

- (NSArray)allServerRecords
{
  return self->_allServerRecords;
}

- (CKRecordZoneID)clientZoneID
{
  return self->_clientZoneID;
}

- (CKRecordZoneID)clientZoneIDWithZoneWidePCS
{
  return self->_clientZoneIDWithZoneWidePCS;
}

- (CKRecordZoneID)clientZoneIDSecure
{
  return self->_clientZoneIDSecure;
}

- (NSArray)allClientZoneIDs
{
  return self->_allClientZoneIDs;
}

- (CKRecordZoneID)serverZoneID
{
  return self->_serverZoneID;
}

- (CKRecordZoneID)serverZoneIDWithZoneWidePCS
{
  return self->_serverZoneIDWithZoneWidePCS;
}

- (CKRecordZoneID)serverZoneIDSecure
{
  return self->_serverZoneIDSecure;
}

- (NSArray)allServerZoneIDs
{
  return self->_allServerZoneIDs;
}

- (CKRecordZone)clientZone
{
  return self->_clientZone;
}

- (CKRecordZone)clientZoneWithZoneWidePCS
{
  return self->_clientZoneWithZoneWidePCS;
}

- (CKRecordZone)clientZoneSecure
{
  return self->_clientZoneSecure;
}

- (NSArray)allClientZones
{
  return self->_allClientZones;
}

- (NSDictionary)allClientZonesByID
{
  return self->_allClientZonesByID;
}

- (CKRecordZone)serverZone
{
  return self->_serverZone;
}

- (CKRecordZone)serverZoneWithZoneWidePCS
{
  return self->_serverZoneWithZoneWidePCS;
}

- (CKRecordZone)serverZoneSecure
{
  return self->_serverZoneSecure;
}

- (NSArray)allServerZones
{
  return self->_allServerZones;
}

- (CKRecordID)defaultZoneClientRecordID
{
  return self->_defaultZoneClientRecordID;
}

- (CKRecordID)defaultZoneClientRecordIDSecure
{
  return self->_defaultZoneClientRecordIDSecure;
}

- (NSArray)allDefaultZoneClientRecordIDs
{
  return self->_allDefaultZoneClientRecordIDs;
}

- (CKRecordID)defaultZoneServerRecordID
{
  return self->_defaultZoneServerRecordID;
}

- (CKRecordID)defaultZoneServerRecordIDSecure
{
  return self->_defaultZoneServerRecordIDSecure;
}

- (CKRecord)defaultZoneClientRecord
{
  return self->_defaultZoneClientRecord;
}

- (CKRecord)defaultZoneClientRecordSecure
{
  return self->_defaultZoneClientRecordSecure;
}

- (NSArray)allDefaultZoneClientRecords
{
  return self->_allDefaultZoneClientRecords;
}

- (NSDictionary)allDefaultZoneClientRecordsByID
{
  return self->_allDefaultZoneClientRecordsByID;
}

- (CKRecord)defaultZoneServerRecord
{
  return self->_defaultZoneServerRecord;
}

- (CKRecord)defaultZoneServerRecordSecure
{
  return self->_defaultZoneServerRecordSecure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultZoneServerRecordSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecord, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecordsByID, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecords, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecord, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecordID, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecordIDs, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordID, 0);
  objc_storeStrong((id *)&self->_allServerZones, 0);
  objc_storeStrong((id *)&self->_serverZoneSecure, 0);
  objc_storeStrong((id *)&self->_serverZoneWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_allClientZonesByID, 0);
  objc_storeStrong((id *)&self->_allClientZones, 0);
  objc_storeStrong((id *)&self->_clientZoneSecure, 0);
  objc_storeStrong((id *)&self->_clientZoneWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_allServerZoneIDs, 0);
  objc_storeStrong((id *)&self->_serverZoneIDSecure, 0);
  objc_storeStrong((id *)&self->_serverZoneIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverZoneID, 0);
  objc_storeStrong((id *)&self->_allClientZoneIDs, 0);
  objc_storeStrong((id *)&self->_clientZoneIDSecure, 0);
  objc_storeStrong((id *)&self->_clientZoneIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientZoneID, 0);
  objc_storeStrong((id *)&self->_allServerRecords, 0);
  objc_storeStrong((id *)&self->_serverRecordSecure, 0);
  objc_storeStrong((id *)&self->_serverRecordWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_allClientRecordsByID, 0);
  objc_storeStrong((id *)&self->_allClientRecords, 0);
  objc_storeStrong((id *)&self->_clientRecordSecure, 0);
  objc_storeStrong((id *)&self->_clientRecordWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientRecord, 0);
  objc_storeStrong((id *)&self->_allServerRecordIDs, 0);
  objc_storeStrong((id *)&self->_serverRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_serverRecordIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverRecordID, 0);
  objc_storeStrong((id *)&self->_allClientRecordIDs, 0);
  objc_storeStrong((id *)&self->_clientRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_clientRecordIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientRecordID, 0);
  objc_storeStrong((id *)&self->_tckSecureDatabase, 0);
  objc_storeStrong((id *)&self->_tckDatabaseWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_tckDatabase, 0);
  objc_storeStrong((id *)&self->_ckSecureDatabase, 0);
  objc_storeStrong((id *)&self->_ckDatabaseWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_ckDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end