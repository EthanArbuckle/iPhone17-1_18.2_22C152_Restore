@interface FedStatsCohortFactory
+ (id)cohortQueryFieldByName:(id)a3;
+ (id)sharedInstance;
- (FedStatsCohortFactory)init;
- (NSDictionary)cohortObjects;
@end

@implementation FedStatsCohortFactory

- (FedStatsCohortFactory)init
{
  v73[65] = *MEMORY[0x263EF8340];
  v71.receiver = self;
  v71.super_class = (Class)FedStatsCohortFactory;
  result = [(FedStatsCohortFactory *)&v71 init];
  if (result)
  {
    v72[0] = @"locale";
    v70 = result;
    v69 = +[FedStatsCohortQueryLocale cohortInstance];
    v73[0] = v69;
    v72[1] = @"deviceType";
    v68 = +[FedStatsCohortQueryDeviceType cohortInstance];
    v73[1] = v68;
    v72[2] = @"bitsOfURL";
    v67 = +[FedStatsCohortQueryURLBits cohortQueryFieldWithKey:](FedStatsCohortQueryURLBits, "cohortQueryFieldWithKey:");
    v73[2] = v67;
    v72[3] = @"bundleID";
    v66 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[3] = v66;
    v72[4] = @"sessionType";
    v65 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[4] = v65;
    v72[5] = @"sessionState";
    v64 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[5] = v64;
    v72[6] = @"supportsBackgrounding";
    v63 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[6] = v63;
    v72[7] = @"supportsStateRestoration";
    v62 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[7] = v62;
    v72[8] = @"eventName";
    v61 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[8] = v61;
    v72[9] = @"measure";
    v60 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[9] = v60;
    v72[10] = @"extra";
    v59 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[10] = v59;
    v72[11] = @"issuer";
    v58 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[11] = v58;
    v72[12] = @"dayOfWeek";
    v57 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[12] = v57;
    v72[13] = @"hourOfDay";
    v56 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[13] = v56;
    v72[14] = @"geohash";
    v55 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[14] = v55;
    v72[15] = @"country";
    v54 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[15] = v54;
    v72[16] = @"timeZone";
    v53 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[16] = v53;
    v72[17] = @"interfaceType";
    v52 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[17] = v52;
    v72[18] = @"radioType";
    v51 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[18] = v51;
    v72[19] = @"radioBand";
    v50 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[19] = v50;
    v72[20] = @"addressFamily";
    v49 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[20] = v49;
    v72[21] = @"lang";
    v48 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[21] = v48;
    v72[22] = @"platform";
    v47 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[22] = v47;
    v72[23] = @"performanceEvent";
    v46 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[23] = v46;
    v72[24] = @"signal";
    v45 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[24] = v45;
    v72[25] = @"userAgent";
    v44 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[25] = v44;
    v72[26] = @"countryCode";
    v43 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[26] = v43;
    v72[27] = @"error";
    v42 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[27] = v42;
    v72[28] = @"localeIdentifier";
    v41 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[28] = v41;
    v72[29] = @"contentType";
    v40 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[29] = v40;
    v72[30] = @"ageGroup";
    v39 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[30] = v39;
    v72[31] = @"eventDirection";
    v38 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[31] = v38;
    v72[32] = @"isNativeArchitecture";
    v37 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[32] = v37;
    v72[33] = @"dyldPlatform";
    v36 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[33] = v36;
    v72[34] = @"type";
    v35 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[34] = v35;
    v72[35] = @"numOfMediaApps";
    v34 = +[FedStatsCohortQueryInstalledApps cohortInstance];
    v73[35] = v34;
    v72[36] = @"numOfPhoneApps";
    v33 = +[FedStatsCohortQueryInstalledApps cohortInstance];
    v73[36] = v33;
    v72[37] = @"screenDistance";
    v32 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[37] = v32;
    v72[38] = @"action";
    v31 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[38] = v31;
    v72[39] = @"gestureAssessment";
    v30 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[39] = v30;
    v72[40] = @"livenessAssessment";
    v29 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[40] = v29;
    v72[41] = @"passiveGestureAssessment";
    v28 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[41] = v28;
    v72[42] = @"passiveLivenessAssessment";
    v27 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[42] = v27;
    v72[43] = @"property";
    v26 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[43] = v26;
    v72[44] = @"accessedPropertyDirectly";
    v25 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[44] = v25;
    v72[45] = @"suggestionType";
    v24 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[45] = v24;
    v72[46] = @"footprint";
    v23 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[46] = v23;
    v72[47] = @"pageCount";
    v22 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[47] = v22;
    v72[48] = @"protocol";
    v21 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[48] = v21;
    v72[49] = @"MCC";
    v20 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[49] = v20;
    v72[50] = @"MNC";
    v19 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[50] = v19;
    v72[51] = @"matchedEmNumSource";
    v18 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[51] = v18;
    v72[52] = @"sip380Procedure";
    v17 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[52] = v17;
    v72[53] = @"sip380RedirectedURN";
    v16 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[53] = v16;
    v72[54] = @"category";
    v15 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[54] = v15;
    v72[55] = @"previous";
    v3 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[55] = v3;
    v72[56] = @"scope";
    v4 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[56] = v4;
    v72[57] = @"language";
    v5 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[57] = v5;
    v72[58] = @"memoryGenerated";
    v6 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[58] = v6;
    v72[59] = @"memoryShared";
    v7 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[59] = v7;
    v72[60] = @"memoryWatched";
    v8 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[60] = v8;
    v72[61] = @"focusRegionType";
    v9 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[61] = v9;
    v72[62] = @"styleSelectionType";
    v10 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[62] = v10;
    v72[63] = @"userLibraryAgeInDays";
    v11 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[63] = v11;
    v72[64] = @"cardShownOrEngaged";
    v12 = +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v73[64] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:65];
    cohortObjects = v70->_cohortObjects;
    v70->_cohortObjects = (NSDictionary *)v13;

    return v70;
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__FedStatsCohortFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __39__FedStatsCohortFactory_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (id)cohortQueryFieldByName:(id)a3
{
  id v3 = a3;
  v4 = +[FedStatsCohortFactory sharedInstance];
  v5 = [v4 cohortObjects];
  v6 = [v5 objectForKey:v3];

  return v6;
}

- (NSDictionary)cohortObjects
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end