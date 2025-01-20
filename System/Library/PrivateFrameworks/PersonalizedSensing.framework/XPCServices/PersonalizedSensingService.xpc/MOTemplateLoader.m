@interface MOTemplateLoader
- (BOOL)_hasItemFromInt:(int)a3;
- (id)_createSingleTemplateFromDictionary:(id)a3;
- (id)_createTemplatesFromDictionary:(id)a3;
- (id)_loadTemplatesDictFromFilePath:(id)a3;
- (id)_traitsFromArray:(id)a3;
- (id)getTemplateDirectoryURL;
- (id)loadTemplatesFromFile:(id)a3;
- (unint64_t)_activityTypeFromString:(id)a3;
- (unint64_t)_bundleTypeFromString:(id)a3;
- (unint64_t)_patternTypeFromString:(id)a3;
- (unint64_t)_peopleClassificationFromString:(id)a3;
- (unint64_t)_photoTraitFromString:(id)a3;
- (unint64_t)_placeTypeFromString:(id)a3;
- (unint64_t)_timeFromString:(id)a3;
- (void)getTemplateDirectoryURL;
@end

@implementation MOTemplateLoader

- (id)loadTemplatesFromFile:(id)a3
{
  id v4 = a3;
  v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCLoadTemplate", "", buf, 2u);
  }

  v6 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCLoadTemplate" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v6 startSession];
  v7 = [(MOTemplateLoader *)self _loadTemplatesDictFromFilePath:v4];

  v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCLoadTemplate", "", v16, 2u);
  }

  [(MOPerformanceMeasurement *)v6 endSession];
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCCreateTemplateObjects", "", v15, 2u);
  }

  v10 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCCreateTemplateObjects" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v10 startSession];
  v11 = [(MOTemplateLoader *)self _createTemplatesFromDictionary:v7];
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCCreateTemplateObjects", "", v14, 2u);
  }

  [(MOPerformanceMeasurement *)v10 endSession];
  return v11;
}

- (id)getTemplateDirectoryURL
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundlePath];
  if (v3)
  {
    id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOTemplateLoader getTemplateDirectoryURL](v5);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_loadTemplatesDictFromFilePath:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  id v4 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v13];
  id v5 = v13;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v9 = v5;
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOTemplateLoader _loadTemplatesDictFromFilePath:]((uint64_t)v9, v7);
    }
    goto LABEL_13;
  }
  id v12 = 0;
  v8 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v12];
  id v9 = v12;
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  v7 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(MOTemplateLoader *)(uint64_t)v3 _loadTemplatesDictFromFilePath:v7];
    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "The template json file was successfully read from path, %@", buf, 0xCu);
  }
LABEL_14:

  return v8;
}

- (id)_createTemplatesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = objc_msgSend(v4, "allValues", 0);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(MOTemplateLoader *)self _createSingleTemplateFromDictionary:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v4 allValues];
    id v14 = [v13 count];
    id v15 = [v5 count];
    *(_DWORD *)buf = 134218240;
    id v22 = v14;
    __int16 v23 = 2048;
    id v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "json dictionary count, %ld, templates count, %ld", buf, 0x16u);
  }
  return v5;
}

- (id)_createSingleTemplateFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  BOOL v6 = [v4 objectForKeyedSubscript:@"accuracy"];

  double v7 = 0.0;
  double v8 = 0.0;
  if (v6)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"accuracy"];
    [v9 doubleValue];
    double v8 = v10;
  }
  v11 = [v4 objectForKeyedSubscript:@"utility"];

  if (v11)
  {
    id v12 = [v4 objectForKeyedSubscript:@"utility"];
    [v12 doubleValue];
    double v7 = v13;
  }
  id v14 = [v4 objectForKeyedSubscript:@"satisfaction"];

  double v15 = 0.0;
  double v16 = 0.0;
  if (v14)
  {
    long long v17 = [v4 objectForKeyedSubscript:@"satisfaction"];
    [v17 doubleValue];
    double v16 = v18;
  }
  long long v19 = [v4 objectForKeyedSubscript:@"generalizability"];

  if (v19)
  {
    long long v20 = [v4 objectForKeyedSubscript:@"generalizability"];
    [v20 doubleValue];
    double v15 = v21;
  }
  id v22 = [v4 objectForKeyedSubscript:@"templateString"];

  if (v22)
  {
    v68 = [v4 objectForKeyedSubscript:@"templateString"];
  }
  else
  {
    v68 = 0;
  }
  __int16 v23 = [v4 objectForKeyedSubscript:@"promptIndex"];

  if (v23)
  {
    id v24 = [v4 objectForKeyedSubscript:@"promptIndex"];
    id v67 = [v24 integerValue];
  }
  else
  {
    id v67 = 0;
  }
  v25 = [v4 objectForKeyedSubscript:@"activityType"];

  if (v25)
  {
    v26 = [v4 objectForKeyedSubscript:@"activityType"];
    unint64_t v66 = [(MOTemplateLoader *)self _activityTypeFromString:v26];
  }
  else
  {
    unint64_t v66 = 0;
  }
  v27 = [v4 objectForKeyedSubscript:@"placeType"];

  if (v27)
  {
    v28 = [v4 objectForKeyedSubscript:@"placeType"];
    unint64_t v65 = [(MOTemplateLoader *)self _placeTypeFromString:v28];
  }
  else
  {
    unint64_t v65 = 0;
  }
  v29 = [v4 objectForKeyedSubscript:@"time"];

  if (v29)
  {
    v30 = [v4 objectForKeyedSubscript:@"time"];
    unint64_t v64 = [(MOTemplateLoader *)self _timeFromString:v30];
  }
  else
  {
    unint64_t v64 = 0;
  }
  v31 = [v4 objectForKeyedSubscript:@"peopleClassification"];

  if (v31)
  {
    v32 = [v4 objectForKeyedSubscript:@"peopleClassification"];
    unint64_t v63 = [(MOTemplateLoader *)self _peopleClassificationFromString:v32];
  }
  else
  {
    unint64_t v63 = 0;
  }
  v33 = [v4 objectForKeyedSubscript:@"bundleType"];

  if (v33)
  {
    v34 = [v4 objectForKeyedSubscript:@"bundleType"];
    unint64_t v62 = [(MOTemplateLoader *)self _bundleTypeFromString:v34];
  }
  else
  {
    unint64_t v62 = 0;
  }
  v35 = [v4 objectForKeyedSubscript:@"personName"];

  v36 = (void *)v5;
  if (v35)
  {
    v37 = [v4 objectForKeyedSubscript:@"personName"];
    id v38 = [v37 intValue];

    unsigned __int8 v61 = [(MOTemplateLoader *)self _hasItemFromInt:v38];
  }
  else
  {
    unsigned __int8 v61 = 0;
  }
  v39 = [v4 objectForKeyedSubscript:@"placeName"];

  if (v39)
  {
    v39 = [v4 objectForKeyedSubscript:@"placeName"];
    id v40 = [v39 intValue];

    LOBYTE(v39) = [(MOTemplateLoader *)self _hasItemFromInt:v40];
  }
  v41 = [v4 objectForKeyedSubscript:@"cityName"];

  if (v41)
  {
    v41 = [v4 objectForKeyedSubscript:@"cityName"];
    id v42 = [v41 intValue];

    LOBYTE(v41) = [(MOTemplateLoader *)self _hasItemFromInt:v42];
  }
  v43 = [v4 objectForKeyedSubscript:@"timeReference"];

  if (v43)
  {
    v43 = [v4 objectForKeyedSubscript:@"timeReference"];
    id v44 = [v43 intValue];

    LOBYTE(v43) = [(MOTemplateLoader *)self _hasItemFromInt:v44];
  }
  v45 = [v4 objectForKeyedSubscript:@"patternType"];

  if (v45)
  {
    v46 = [v4 objectForKeyedSubscript:@"patternType"];
    v45 = [(MOTemplateLoader *)self _patternTypeFromString:v46];
  }
  v47 = [v4 objectForKeyedSubscript:@"globalTraits"];

  if (v47)
  {
    v48 = [v4 objectForKeyedSubscript:@"globalTraits"];
    if ([v48 count])
    {
      v49 = [(MOTemplateLoader *)self _traitsFromArray:v48];
      id v50 = [v49 mutableCopy];

      v36 = v50;
    }
  }
  v51 = [v4 objectForKeyedSubscript:@"personalTraits"];

  if (v51)
  {
    v52 = [v4 objectForKeyedSubscript:@"personalTraits"];
    unint64_t v53 = [(MOTemplateLoader *)self _photoTraitFromString:v52];
  }
  else
  {
    unint64_t v53 = 0;
  }
  v54 = v68;
  if (v68)
  {
    v55 = [MOTemplate alloc];
    v56 = +[NSUUID UUID];
    BYTE3(v60) = (_BYTE)v43;
    BYTE2(v60) = (_BYTE)v41;
    BYTE1(v60) = (_BYTE)v39;
    LOBYTE(v60) = v61;
    v54 = -[MOTemplate initWithTemplateIdentifier:patternType:placeType:activityType:time:bundleType:peopleClassification:hasPersonName:hasPlaceName:hasCityName:hasTimeReference:templateString:utility:accuracy:satisfaction:generalizability:promptIndex:](v55, "initWithTemplateIdentifier:patternType:placeType:activityType:time:bundleType:peopleClassification:hasPersonName:hasPlaceName:hasCityName:hasTimeReference:templateString:utility:accuracy:satisfaction:generalizability:promptIndex:", v56, v45, v65, v66, v64, v62, v7, v8, v16, v15, v63, v60, v68, v67);

    [(MOTemplate *)v54 setPhotoTrait:v53];
    if ([v36 count]) {
      [(MOTemplate *)v54 setGlobalTraits:v36];
    }
    v57 = [v4 objectForKeyedSubscript:@"templateVersion"];

    if (v57)
    {
      v58 = [v4 objectForKeyedSubscript:@"templateVersion"];
      -[MOTemplate setPromptVersion:](v54, "setPromptVersion:", [v58 integerValue]);
    }
  }

  return v54;
}

- (id)_traitsFromArray:(id)a3
{
  id v3 = a3;
  id v17 = (id)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v10 = objc_opt_new();
        v11 = [v9 objectForKeyedSubscript:@"title"];

        if (v11)
        {
          v11 = [v9 objectForKeyedSubscript:@"title"];
        }
        id v12 = [v9 objectForKeyedSubscript:@"queries"];

        if (v12)
        {
          double v13 = [v9 objectForKeyedSubscript:@"queries"];
          id v14 = [v13 mutableCopy];

          double v10 = v14;
        }
        if (v11)
        {
          double v15 = [[MOGlobalTrait alloc] initWithTitle:v11 queries:v10];
          if (v15) {
            [v17 addObject:v15];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v17;
}

- (unint64_t)_activityTypeFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"walking"];
  if ([v3 isEqualToString:@"strength training"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"cycling"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"running"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"HIIT"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"elliptical"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"yoga"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"swimming"]) {
    uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"hiking"]) {
    unint64_t v5 = 9;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"workout"];

  if (v6) {
    return 10;
  }
  else {
    return v5;
  }
}

- (unint64_t)_placeTypeFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"restaurant"];
  if ([v3 isEqualToString:@"store"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"hotel"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"airport"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"park"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"cafe"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"food market"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"fitness center"]) {
    uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"university"]) {
    uint64_t v4 = 9;
  }
  if ([v3 isEqualToString:@"school"]) {
    uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"amusement park"]) {
    uint64_t v4 = 11;
  }
  if ([v3 isEqualToString:@"movie theater"]) {
    uint64_t v4 = 12;
  }
  if ([v3 isEqualToString:@"theater"]) {
    uint64_t v4 = 13;
  }
  if ([v3 isEqualToString:@"museum"]) {
    uint64_t v4 = 14;
  }
  if ([v3 isEqualToString:@"beach"]) {
    uint64_t v4 = 15;
  }
  if ([v3 isEqualToString:@"home"]) {
    uint64_t v4 = 16;
  }
  if ([v3 isEqualToString:@"work"]) {
    uint64_t v4 = 17;
  }
  if ([v3 isEqualToString:@"aquarium"]) {
    uint64_t v4 = 18;
  }
  if ([v3 isEqualToString:@"bakery"]) {
    uint64_t v4 = 19;
  }
  if ([v3 isEqualToString:@"brewery"]) {
    uint64_t v4 = 20;
  }
  if ([v3 isEqualToString:@"campground"]) {
    uint64_t v4 = 21;
  }
  if ([v3 isEqualToString:@"fire station"]) {
    uint64_t v4 = 22;
  }
  if ([v3 isEqualToString:@"library"]) {
    uint64_t v4 = 23;
  }
  if ([v3 isEqualToString:@"marina"]) {
    uint64_t v4 = 24;
  }
  if ([v3 isEqualToString:@"national park"]) {
    uint64_t v4 = 25;
  }
  if ([v3 isEqualToString:@"nightlife"]) {
    uint64_t v4 = 26;
  }
  if ([v3 isEqualToString:@"playground"]) {
    uint64_t v4 = 27;
  }
  if ([v3 isEqualToString:@"stadium"]) {
    uint64_t v4 = 28;
  }
  if ([v3 isEqualToString:@"winery"]) {
    uint64_t v4 = 29;
  }
  if ([v3 isEqualToString:@"zoo"]) {
    uint64_t v4 = 30;
  }
  if ([v3 isEqualToString:@"golf"]) {
    uint64_t v4 = 31;
  }
  if ([v3 isEqualToString:@"mini golf"]) {
    uint64_t v4 = 32;
  }
  if ([v3 isEqualToString:@"bowling"]) {
    uint64_t v4 = 33;
  }
  if ([v3 isEqualToString:@"planetarium"]) {
    uint64_t v4 = 34;
  }
  if ([v3 isEqualToString:@"baseball"]) {
    uint64_t v4 = 35;
  }
  if ([v3 isEqualToString:@"basketball"]) {
    unint64_t v5 = 36;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"national monument"];

  if (v6) {
    return 37;
  }
  else {
    return v5;
  }
}

- (unint64_t)_timeFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"morning"];
  if ([v3 isEqualToString:@"afternoon"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"evening"]) {
    unint64_t v5 = 3;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"night"];

  if (v6) {
    return 4;
  }
  else {
    return v5;
  }
}

- (unint64_t)_peopleClassificationFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"family"];
  if ([v3 isEqualToString:@"friends"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"kids"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"colleagues"]) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"pet"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (unint64_t)_bundleTypeFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"outing"];
  if ([v3 isEqualToString:@"trip"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"shopping"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"dining"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"time at home"]) {
    unint64_t v5 = 5;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"contact"];

  if (v6) {
    return 6;
  }
  else {
    return v5;
  }
}

- (unint64_t)_patternTypeFromString:(id)a3
{
  return [a3 isEqualToString:@"outing routine"];
}

- (BOOL)_hasItemFromInt:(int)a3
{
  return a3 == 1;
}

- (unint64_t)_photoTraitFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"Wedding"];
  if ([v3 isEqualToString:@"Birthday"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"Celebration"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"Ceremony"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"Holiday"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"Thanksgiving"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"Halloween"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"Christmas"]) {
    uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"Festival"]) {
    uint64_t v4 = 9;
  }
  if ([v3 isEqualToString:@"Concert"]) {
    uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"Parade"]) {
    uint64_t v4 = 11;
  }
  if ([v3 isEqualToString:@"Cooking"]) {
    uint64_t v4 = 12;
  }
  if ([v3 isEqualToString:@"Eating"]) {
    uint64_t v4 = 13;
  }
  if ([v3 isEqualToString:@"Camping"]) {
    uint64_t v4 = 14;
  }
  if ([v3 isEqualToString:@"Graduation"]) {
    uint64_t v4 = 15;
  }
  if ([v3 isEqualToString:@"Thanksgiving Dinner"]) {
    uint64_t v4 = 16;
  }
  if ([v3 isEqualToString:@"Carnival"]) {
    uint64_t v4 = 17;
  }
  if ([v3 isEqualToString:@"Easter Egg"]) {
    uint64_t v4 = 18;
  }
  if ([v3 isEqualToString:@"Jack O Lantern"]) {
    uint64_t v4 = 19;
  }
  if ([v3 isEqualToString:@"BabyReading"]) {
    uint64_t v4 = 20;
  }
  if ([v3 isEqualToString:@"ChildReading"]) {
    uint64_t v4 = 21;
  }
  if ([v3 isEqualToString:@"BabyBedtimeCuddles"]) {
    uint64_t v4 = 22;
  }
  if ([v3 isEqualToString:@"ChildBedtimeCuddles"]) {
    uint64_t v4 = 23;
  }
  if ([v3 isEqualToString:@"Board Game"]) {
    uint64_t v4 = 24;
  }
  if ([v3 isEqualToString:@"Swimming"]) {
    uint64_t v4 = 25;
  }
  if ([v3 isEqualToString:@"SwimmingBeach"]) {
    uint64_t v4 = 26;
  }
  if ([v3 isEqualToString:@"SwimmingPool"]) {
    uint64_t v4 = 27;
  }
  if ([v3 isEqualToString:@"Surfing"]) {
    uint64_t v4 = 28;
  }
  if ([v3 isEqualToString:@"Underwater Diving"]) {
    uint64_t v4 = 29;
  }
  if ([v3 isEqualToString:@"Snorkeling"]) {
    uint64_t v4 = 30;
  }
  if ([v3 isEqualToString:@"Scuba"]) {
    uint64_t v4 = 31;
  }
  if ([v3 isEqualToString:@"Skiing"]) {
    uint64_t v4 = 32;
  }
  if ([v3 isEqualToString:@"Snowboarding"]) {
    uint64_t v4 = 33;
  }
  if ([v3 isEqualToString:@"Sledding"]) {
    uint64_t v4 = 34;
  }
  if ([v3 isEqualToString:@"Snow Person"]) {
    uint64_t v4 = 35;
  }
  if ([v3 isEqualToString:@"Snowball"]) {
    uint64_t v4 = 36;
  }
  if ([v3 isEqualToString:@"SnowPlay"]) {
    uint64_t v4 = 37;
  }
  if ([v3 isEqualToString:@"Hiking"]) {
    uint64_t v4 = 38;
  }
  if ([v3 isEqualToString:@"Dancing"]) {
    uint64_t v4 = 39;
  }
  if ([v3 isEqualToString:@"ChildPlay"]) {
    uint64_t v4 = 40;
  }
  if ([v3 isEqualToString:@"BabyPlay"]) {
    uint64_t v4 = 41;
  }
  if ([v3 isEqualToString:@"Fireworks"]) {
    uint64_t v4 = 42;
  }
  if ([v3 isEqualToString:@"Sunrise"]) {
    uint64_t v4 = 43;
  }
  if ([v3 isEqualToString:@"Sunset Sunrise"]) {
    uint64_t v4 = 44;
  }
  if ([v3 isEqualToString:@"Rainbow"]) {
    uint64_t v4 = 45;
  }
  if ([v3 isEqualToString:@"Waterfall"]) {
    uint64_t v4 = 46;
  }
  if ([v3 isEqualToString:@"Lunar Eclipse"]) {
    uint64_t v4 = 47;
  }
  if ([v3 isEqualToString:@"Eclipse"]) {
    uint64_t v4 = 48;
  }
  if ([v3 isEqualToString:@"Celestial Body"]) {
    uint64_t v4 = 49;
  }
  if ([v3 isEqualToString:@"Star"]) {
    uint64_t v4 = 50;
  }
  if ([v3 isEqualToString:@"Wildlife"]) {
    uint64_t v4 = 51;
  }
  if ([v3 isEqualToString:@"Flower"]) {
    uint64_t v4 = 52;
  }
  if ([v3 isEqualToString:@"Blizzard"]) {
    uint64_t v4 = 53;
  }
  if ([v3 isEqualToString:@"Snow"]) {
    uint64_t v4 = 54;
  }
  if ([v3 isEqualToString:@"Underwater"]) {
    uint64_t v4 = 55;
  }
  if ([v3 isEqualToString:@"Basketball"]) {
    uint64_t v4 = 56;
  }
  if ([v3 isEqualToString:@"Soccer"]) {
    uint64_t v4 = 57;
  }
  if ([v3 isEqualToString:@"Football"]) {
    uint64_t v4 = 58;
  }
  if ([v3 isEqualToString:@"Baseball"]) {
    uint64_t v4 = 59;
  }
  if ([v3 isEqualToString:@"Hockey"]) {
    uint64_t v4 = 60;
  }
  if ([v3 isEqualToString:@"Ice Hockey"]) {
    uint64_t v4 = 61;
  }
  if ([v3 isEqualToString:@"Cycling"]) {
    uint64_t v4 = 62;
  }
  if ([v3 isEqualToString:@"Cake Decorating"]) {
    uint64_t v4 = 63;
  }
  if ([v3 isEqualToString:@"Bowling"]) {
    uint64_t v4 = 64;
  }
  if ([v3 isEqualToString:@"Karaoke"]) {
    uint64_t v4 = 65;
  }
  if ([v3 isEqualToString:@"Golf"]) {
    uint64_t v4 = 66;
  }
  if ([v3 isEqualToString:@"Baby"]) {
    uint64_t v4 = 67;
  }
  if ([v3 isEqualToString:@"Vineyard"]) {
    uint64_t v4 = 68;
  }
  if ([v3 isEqualToString:@"Log Cabin"]) {
    uint64_t v4 = 69;
  }
  if ([v3 isEqualToString:@"Nightclub"]) {
    uint64_t v4 = 70;
  }
  if ([v3 isEqualToString:@"Farm"]) {
    uint64_t v4 = 71;
  }
  if ([v3 isEqualToString:@"Mountain Biking"]) {
    uint64_t v4 = 72;
  }
  if ([v3 isEqualToString:@"Mountain Bike"]) {
    uint64_t v4 = 73;
  }
  if ([v3 isEqualToString:@"Ski Mountaineering"]) {
    uint64_t v4 = 74;
  }
  if ([v3 isEqualToString:@"Mountain"]) {
    uint64_t v4 = 75;
  }
  if ([v3 isEqualToString:@"Forest"]) {
    uint64_t v4 = 76;
  }
  if ([v3 isEqualToString:@"Parasailing"]) {
    uint64_t v4 = 77;
  }
  if ([v3 isEqualToString:@"Sailing"]) {
    uint64_t v4 = 78;
  }
  if ([v3 isEqualToString:@"Kayaking"]) {
    uint64_t v4 = 79;
  }
  if ([v3 isEqualToString:@"Cruise Ship"]) {
    uint64_t v4 = 80;
  }
  if ([v3 isEqualToString:@"Shore"]) {
    uint64_t v4 = 81;
  }
  if ([v3 isEqualToString:@"Carousel"]) {
    unint64_t v5 = 82;
  }
  else {
    unint64_t v5 = v4;
  }
  unsigned int v6 = [v3 isEqualToString:@"Ferris Wheel"];

  if (v6) {
    return 83;
  }
  else {
    return v5;
  }
}

- (void)getTemplateDirectoryURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to get directory for template file.", v1, 2u);
}

- (void)_loadTemplatesDictFromFilePath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not read the template JSON file, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_loadTemplatesDictFromFilePath:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't parse teample JSON to dictionary. %@, error, %@", (uint8_t *)&v3, 0x16u);
}

@end