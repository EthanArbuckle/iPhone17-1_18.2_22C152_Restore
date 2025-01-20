@interface MapsRadarDraft
+ (BOOL)isTapToRadarAuthorized;
+ (BOOL)isTapToRadarKitSupported;
- (BOOL)collectFullLogArchive;
- (CLLocation)locationOfIssue;
- (MapsRadarAttachment)metadataAttachment;
- (MapsRadarComponent)component;
- (MapsRadarDraft)init;
- (NSArray)attachments;
- (NSArray)collaborationContactHandles;
- (NSArray)deviceClasses;
- (NSArray)keywords;
- (NSArray)screenshots;
- (NSDate)timeOfIssue;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)descriptionText;
- (NSString)title;
- (NSURL)tapToRadarURL;
- (RadarDraft)tapToRadarKitDraft;
- (int64_t)classification;
- (int64_t)reproducibility;
- (void)_launchTapToRadarKitWithDisplayReason:(id)a3;
- (void)_launchURLScheme;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)addAttachment:(id)a3;
- (void)addAttachments:(id)a3;
- (void)addCollaborationContactHandle:(id)a3;
- (void)addCollaborationContactHandles:(id)a3;
- (void)addDeviceClass:(id)a3;
- (void)addDeviceClasses:(id)a3;
- (void)addKeyword:(id)a3;
- (void)addKeywords:(id)a3;
- (void)addScreenshot:(id)a3;
- (void)addScreenshots:(id)a3;
- (void)launchTTRWithDisplayReason:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setClassification:(int64_t)a3;
- (void)setCollaborationContactHandles:(id)a3;
- (void)setCollectFullLogArchive:(BOOL)a3;
- (void)setComponent:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDeviceClasses:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setReproducibility:(int64_t)a3;
- (void)setScreenshots:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapsRadarDraft

+ (BOOL)isTapToRadarKitSupported
{
  return objc_opt_class() != 0;
}

+ (BOOL)isTapToRadarAuthorized
{
  if (![a1 isTapToRadarKitSupported]) {
    return 0;
  }
  v2 = +[TapToRadarService shared];
  v3 = [v2 serviceSettings];
  BOOL v4 = [v3 authorizationStatus] == (id)3;

  return v4;
}

- (RadarDraft)tapToRadarKitDraft
{
  if ([(id)objc_opt_class() isTapToRadarKitSupported]
    && [(id)objc_opt_class() isTapToRadarAuthorized])
  {
    id v3 = objc_alloc_init((Class)RadarDraft);
    [v3 setIsUserInitiated:1];
    BOOL v4 = [(MapsRadarDraft *)self title];
    [v3 setTitle:v4];

    v5 = [(MapsRadarDraft *)self descriptionText];
    [v3 setProblemDescription:v5];

    v6 = [(MapsRadarDraft *)self component];

    if (v6)
    {
      id v7 = objc_alloc((Class)RadarComponent);
      v8 = [(MapsRadarDraft *)self component];
      v9 = [v8 name];
      v10 = [(MapsRadarDraft *)self component];
      v11 = [v10 version];
      v12 = [(MapsRadarDraft *)self component];
      v13 = [v12 ID];
      id v14 = [v7 initWithName:v9 version:v11 identifier:[v13 integerValue]];
      [v3 setComponent:v14];
    }
    else
    {
      v8 = +[NSBundle mainBundle];
      v9 = [v8 bundleIdentifier];
      [v3 setBundleID:v9];
    }

    int64_t v15 = [(MapsRadarDraft *)self classification];
    if ((unint64_t)(v15 - 1) >= 0xA) {
      int64_t v16 = 0;
    }
    else {
      int64_t v16 = v15;
    }
    [v3 setClassification:v16];
    int64_t v17 = [(MapsRadarDraft *)self reproducibility];
    if ((unint64_t)(v17 - 1) >= 6) {
      int64_t v18 = 0;
    }
    else {
      int64_t v18 = v17;
    }
    [v3 setReproducibility:v18];
    v19 = [(MapsRadarDraft *)self attachments];
    v20 = +[NSMutableArray array];
    v21 = [(MapsRadarDraft *)self screenshots];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = [(MapsRadarDraft *)self screenshots];
      v24 = sub_100099700(v23, &stru_1012F1F30);
      [v20 addObjectsFromArray:v24];
    }
    v25 = [(MapsRadarDraft *)self metadataAttachment];
    if (v25)
    {
      uint64_t v26 = [v19 arrayByAddingObject:v25];

      v19 = (void *)v26;
    }
    if ([v19 count])
    {
      v27 = sub_100099700(v19, &stru_1012F1F70);
      [v20 addObjectsFromArray:v27];
    }
    [v3 setAttachments:v20];
    v28 = [(MapsRadarDraft *)self keywords];
    v29 = sub_100099700(v28, &stru_1012F1FB0);
    [v3 setKeywords:v29];

    if ([(MapsRadarDraft *)self collectFullLogArchive]) {
      uint64_t v30 = 6;
    }
    else {
      uint64_t v30 = 0;
    }
    [v3 setAutoDiagnostics:v30];
    v31 = [(MapsRadarDraft *)self timeOfIssue];
    [v3 setTimeOfIssue:v31];

    [v3 setDeleteOnAttach:1];
    v32 = [(MapsRadarDraft *)self collaborationContactHandles];
    [v3 setCollaborationContactHandles:v32];

    v33 = [(MapsRadarDraft *)self deviceClasses];
    uint64_t v34 = [v33 containsObject:@"iPhone"];
    if ([v33 containsObject:@"iPad"]) {
      v34 |= 2uLL;
    }
    if ([v33 containsObject:@"Watch"]) {
      v34 |= 4uLL;
    }
    if ([v33 containsObject:@"AppleTV"]) {
      v34 |= 8uLL;
    }
    if ([v33 containsObject:@"HomePod"]) {
      v34 |= 0x10uLL;
    }
    if ([v33 containsObject:@"Mac"]) {
      v34 |= 0x20uLL;
    }
    if ([v33 containsObject:@"Vision"]) {
      uint64_t v35 = v34 | 0x40;
    }
    else {
      uint64_t v35 = v34;
    }
    [v3 setRemoteDeviceClasses:v35];

    [v3 setShouldCaptureDumpDisplay:1];
    [v3 setShouldCaptureScreenshot:1];
    [v3 setDiagnosticExtensionIDs:&off_1013ADC68];
  }
  else
  {
    id v3 = 0;
  }

  return (RadarDraft *)v3;
}

- (NSURL)tapToRadarURL
{
  id v3 = objc_alloc_init((Class)NSURLComponents);
  [v3 setScheme:@"tap-to-radar"];
  [v3 setHost:@"new"];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc((Class)NSURLQueryItem);
  uint64_t v6 = [(MapsRadarDraft *)self title];
  id v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_101324E70;
  }
  id v9 = [v5 initWithName:@"Title" value:v8];
  [v4 addObject:v9];

  v10 = [(MapsRadarDraft *)self descriptionText];
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = objc_alloc((Class)NSURLQueryItem);
    v13 = [(MapsRadarDraft *)self descriptionText];
    id v14 = [v12 initWithName:@"Description" value:v13];
    [v4 addObject:v14];
  }
  if ([(MapsRadarDraft *)self classification])
  {
    unint64_t v15 = [(MapsRadarDraft *)self classification];
    if (v15 > 0xA) {
      CFStringRef v16 = @"Security";
    }
    else {
      CFStringRef v16 = off_1012F2C88[v15];
    }
    id v17 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:v16];
    [v4 addObject:v17];
  }
  if ([(MapsRadarDraft *)self reproducibility])
  {
    unint64_t v18 = [(MapsRadarDraft *)self reproducibility];
    if (v18 > 6) {
      CFStringRef v19 = @"Always";
    }
    else {
      CFStringRef v19 = off_1012F2CE0[v18];
    }
    id v20 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:v19];
    [v4 addObject:v20];
  }
  v21 = [(MapsRadarDraft *)self attachments];
  id v22 = [(MapsRadarDraft *)self screenshots];
  id v23 = [v22 count];

  if (v23)
  {
    id v24 = objc_alloc((Class)NSURLQueryItem);
    v25 = [(MapsRadarDraft *)self screenshots];
    uint64_t v26 = sub_100099700(v25, &stru_1012F2BE8);
    v27 = [v26 componentsJoinedByString:@","];
    id v28 = [v24 initWithName:@"Screenshot" value:v27];
    [v4 addObject:v28];
  }
  v29 = [(MapsRadarDraft *)self metadataAttachment];
  if (v29)
  {
    uint64_t v30 = [v21 arrayByAddingObject:v29];

    v21 = (void *)v30;
  }
  if ([v21 count])
  {
    id v31 = objc_alloc((Class)NSURLQueryItem);
    v32 = sub_100099700(v21, &stru_1012F2C28);
    v33 = [v32 componentsJoinedByString:@","];
    id v34 = [v31 initWithName:@"Attachments" value:v33];
    [v4 addObject:v34];
  }
  uint64_t v35 = [(MapsRadarDraft *)self keywords];
  id v36 = [v35 count];

  if (v36)
  {
    v37 = [(MapsRadarDraft *)self keywords];
    v38 = sub_100099700(v37, &stru_1012F2C48);
    v39 = +[NSSet setWithArray:v38];
    v40 = [v39 allObjects];

    id v41 = objc_alloc((Class)NSURLQueryItem);
    v42 = [v40 componentsJoinedByString:@","];
    id v43 = [v41 initWithName:@"Keywords" value:v42];
    [v4 addObject:v43];
  }
  v44 = [(MapsRadarDraft *)self component];

  if (v44)
  {
    id v45 = objc_alloc((Class)NSURLQueryItem);
    v46 = [(MapsRadarDraft *)self component];
    v47 = [v46 name];
    id v48 = [v45 initWithName:@"ComponentName" value:v47];
    [v4 addObject:v48];

    id v49 = objc_alloc((Class)NSURLQueryItem);
    v50 = [(MapsRadarDraft *)self component];
    v51 = [v50 version];
    id v52 = [v49 initWithName:@"ComponentVersion" value:v51];
    [v4 addObject:v52];

    id v53 = objc_alloc((Class)NSURLQueryItem);
    v54 = [(MapsRadarDraft *)self component];
    v55 = [v54 ID];
    v56 = [v55 stringValue];
    id v57 = [v53 initWithName:@"ComponentID" value:v56];
    [v4 addObject:v57];
  }
  if ([(MapsRadarDraft *)self collectFullLogArchive])
  {
    id v58 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"full-log-archive"];
    [v4 addObject:v58];
  }
  v59 = [(MapsRadarDraft *)self collaborationContactHandles];
  id v60 = [v59 count];

  if (v60)
  {
    id v61 = objc_alloc((Class)NSURLQueryItem);
    v62 = [(MapsRadarDraft *)self collaborationContactHandles];
    v63 = [v62 componentsJoinedByString:@","];
    id v64 = [v61 initWithName:@"CollaborationContactHandles" value:v63];
    [v4 addObject:v64];
  }
  v65 = [(MapsRadarDraft *)self deviceClasses];
  id v66 = [v65 count];

  if (v66)
  {
    id v67 = objc_alloc((Class)NSURLQueryItem);
    v68 = [(MapsRadarDraft *)self deviceClasses];
    v69 = [v68 componentsJoinedByString:@","];
    id v70 = [v67 initWithName:@"DeviceClasses" value:v69];
    [v4 addObject:v70];
  }
  id v71 = objc_alloc((Class)NSURLQueryItem);
  v72 = +[NSBundle mainBundle];
  v73 = [v72 bundleIdentifier];
  id v74 = [v71 initWithName:@"BundleID" value:v73];
  [v4 addObject:v74];

  id v75 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"DeleteOnAttach" value:@"1"];
  [v4 addObject:v75];

  id v76 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
  [v4 addObject:v76];

  id v77 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ExtensionIdentifiers" value:@"com.apple.DiagnosticExtensions.StackShot,com.apple.DiagnosticExtensions.Syslog,com.apple.DiagnosticExtensions.CrashLogs"];
  [v4 addObject:v77];

  if (qword_10160F348 != -1) {
    dispatch_once(&qword_10160F348, &stru_1012F2C68);
  }
  id v78 = objc_alloc((Class)NSURLQueryItem);
  v79 = (void *)qword_10160F340;
  v80 = [(MapsRadarDraft *)self timeOfIssue];
  v81 = [v79 stringFromDate:v80];
  id v82 = [v78 initWithName:@"TimeOfIssue" value:v81];
  [v4 addObject:v82];

  [v3 setQueryItems:v4];
  v83 = [v3 URL];

  return (NSURL *)v83;
}

- (MapsRadarDraft)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsRadarDraft;
  v2 = [(MapsRadarDraft *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    timeOfIssue = v2->_timeOfIssue;
    v2->_timeOfIssue = (NSDate *)v3;

    id v5 = +[MKLocationManager sharedLocationManager];
    uint64_t v6 = [v5 lastLocation];
    locationOfIssue = v2->_locationOfIssue;
    v2->_locationOfIssue = (CLLocation *)v6;

    v2->_collectFullLogArchive = GEOConfigGetBOOL();
  }
  return v2;
}

- (NSString)descriptionText
{
  if (self->_descriptionText) {
    CFStringRef descriptionText = (const __CFString *)self->_descriptionText;
  }
  else {
    CFStringRef descriptionText = &stru_101324E70;
  }
  id v4 = +[NSMutableString stringWithString:descriptionText];
  locationOfIssue = self->_locationOfIssue;
  if (locationOfIssue)
  {
    [(CLLocation *)locationOfIssue coordinate];
    uint64_t v7 = v6;
    [(CLLocation *)self->_locationOfIssue coordinate];
    [v4 appendFormat:@"\nDevice location: %f, %f", v7, v8];
  }

  return (NSString *)v4;
}

- (NSArray)attachments
{
  if (self->_attachments) {
    return self->_attachments;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (NSArray)screenshots
{
  if (self->_screenshots) {
    return self->_screenshots;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (NSArray)keywords
{
  if (self->_keywords) {
    return self->_keywords;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (NSArray)collaborationContactHandles
{
  if (self->_collaborationContactHandles) {
    return self->_collaborationContactHandles;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (NSArray)deviceClasses
{
  if (self->_deviceClasses) {
    return self->_deviceClasses;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)addAttachment:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v11 = "-[MapsRadarDraft addAttachment:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 80;
      __int16 v16 = 2080;
      id v17 = "attachment != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MapsRadarDraft *)self addAttachments:v5];
}

- (void)addAttachments:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "-[MapsRadarDraft addAttachments:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 86;
      __int16 v16 = 2080;
      id v17 = "attachments != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v5 = [(MapsRadarDraft *)self attachments];
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];
  [(MapsRadarDraft *)self setAttachments:v6];
}

- (void)addScreenshot:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v11 = "-[MapsRadarDraft addScreenshot:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 92;
      __int16 v16 = 2080;
      id v17 = "screenshot != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MapsRadarDraft *)self addScreenshots:v5];
}

- (void)addScreenshots:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "-[MapsRadarDraft addScreenshots:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 98;
      __int16 v16 = 2080;
      id v17 = "screenshots != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v5 = [(MapsRadarDraft *)self screenshots];
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];
  [(MapsRadarDraft *)self setScreenshots:v6];
}

- (void)addKeyword:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v11 = "-[MapsRadarDraft addKeyword:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 104;
      __int16 v16 = 2080;
      id v17 = "keyword != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MapsRadarDraft *)self addKeywords:v5];
}

- (void)addKeywords:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "-[MapsRadarDraft addKeywords:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 110;
      __int16 v16 = 2080;
      id v17 = "keywords != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v5 = [(MapsRadarDraft *)self keywords];
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];
  [(MapsRadarDraft *)self setKeywords:v6];
}

- (void)addCollaborationContactHandle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v11 = "-[MapsRadarDraft addCollaborationContactHandle:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 116;
      __int16 v16 = 2080;
      id v17 = "collaborationContactHandle != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MapsRadarDraft *)self addCollaborationContactHandles:v5];
}

- (void)addCollaborationContactHandles:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "-[MapsRadarDraft addCollaborationContactHandles:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 122;
      __int16 v16 = 2080;
      id v17 = "collaborationContactHandles != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v5 = [(MapsRadarDraft *)self collaborationContactHandles];
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];
  [(MapsRadarDraft *)self setCollaborationContactHandles:v6];
}

- (void)addDeviceClass:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v11 = "-[MapsRadarDraft addDeviceClass:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 128;
      __int16 v16 = 2080;
      id v17 = "deviceClass != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MapsRadarDraft *)self addDeviceClasses:v5];
}

- (void)addDeviceClasses:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "-[MapsRadarDraft addDeviceClasses:]";
      __int16 v12 = 2080;
      v13 = "MapsRadarDraft.m";
      __int16 v14 = 1024;
      int v15 = 134;
      __int16 v16 = 2080;
      id v17 = "deviceClasses != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v5 = [(MapsRadarDraft *)self deviceClasses];
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];
  [(MapsRadarDraft *)self setDeviceClasses:v6];
}

- (MapsRadarAttachment)metadataAttachment
{
  v2 = [(MapsRadarDraft *)self attachments];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&stru_101314B68];

  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"yyyy.MM.dd HH:mm:ss.SSS Z"];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A2A134;
    v10[3] = &unk_101314B90;
    id v11 = v4;
    id v5 = v4;
    uint64_t v6 = sub_100099700(v3, v10);
    uint64_t v7 = [v6 componentsJoinedByString:@"\n"];

    uint64_t v8 = +[MapsRadarTextAttachment attachmentWithFileName:@"metadata.txt" text:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (MapsRadarAttachment *)v8;
}

- (NSString)description
{
  v2 = self;
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_1000923E4;
  id v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarDraft *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(MapsRadarDraft *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@", "];
  __int16 v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_100A2A874;
  id v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarDraft *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(MapsRadarDraft *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@"\n"];
  __int16 v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  uint64_t v8 = (void (**)(id, const __CFString *, NSString *))a3;
  v8[2](v8, @"title", self->_title);
  v8[2](v8, @"description text", self->_descriptionText);
  v8[2](v8, @"component", (NSString *)&self->_component->super.isa);
  unint64_t classification = self->_classification;
  if (classification > 0xA) {
    CFStringRef v5 = @"Security";
  }
  else {
    CFStringRef v5 = *(&off_101314BB0 + classification);
  }
  v8[2](v8, @"classification", &v5->isa);
  unint64_t reproducibility = self->_reproducibility;
  if (reproducibility > 6) {
    CFStringRef v7 = @"Always";
  }
  else {
    CFStringRef v7 = *(&off_101314C08 + reproducibility);
  }
  v8[2](v8, @"reproducibility", &v7->isa);
  v8[2](v8, @"keywords", (NSString *)&self->_keywords->super.isa);
  v8[2](v8, @"attachments", (NSString *)&self->_attachments->super.isa);
  v8[2](v8, @"screenshots", (NSString *)&self->_screenshots->super.isa);
  v8[2](v8, @"time of issue", (NSString *)&self->_timeOfIssue->super.isa);
  v8[2](v8, @"location of issue", (NSString *)&self->_locationOfIssue->super.isa);
  v8[2](v8, @"collaboration contact handles", (NSString *)&self->_collaborationContactHandles->super.isa);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void)setDescriptionText:(id)a3
{
}

- (MapsRadarComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_unint64_t classification = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_unint64_t reproducibility = a3;
}

- (void)setAttachments:(id)a3
{
}

- (void)setScreenshots:(id)a3
{
}

- (void)setKeywords:(id)a3
{
}

- (NSDate)timeOfIssue
{
  return self->_timeOfIssue;
}

- (CLLocation)locationOfIssue
{
  return self->_locationOfIssue;
}

- (BOOL)collectFullLogArchive
{
  return self->_collectFullLogArchive;
}

- (void)setCollectFullLogArchive:(BOOL)a3
{
  self->_collectFullLogArchive = a3;
}

- (void)setCollaborationContactHandles:(id)a3
{
}

- (void)setDeviceClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClasses, 0);
  objc_storeStrong((id *)&self->_collaborationContactHandles, 0);
  objc_storeStrong((id *)&self->_locationOfIssue, 0);
  objc_storeStrong((id *)&self->_timeOfIssue, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)launchTTRWithDisplayReason:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL()) {
    [(MapsRadarDraft *)self _launchTapToRadarKitWithDisplayReason:v4];
  }
  else {
    [(MapsRadarDraft *)self _launchURLScheme];
  }
}

- (void)_launchTapToRadarKitWithDisplayReason:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_100AD16D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Will launch TTR via TapToRadarKit", buf, 0xCu);
  }

  if (!+[MapsRadarDraft isTapToRadarKitSupported])
  {
    uint64_t v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v22 = (MapsRadarDraft *)"-[MapsRadarDraft(TTR) _launchTapToRadarKitWithDisplayReason:]";
      __int16 v23 = 2080;
      id v24 = "MapsRadarDraft+TTR.m";
      __int16 v25 = 1024;
      int v26 = 45;
      __int16 v27 = 2080;
      id v28 = "MapsRadarDraft.isTapToRadarKitSupported";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!+[MapsRadarDraft isTapToRadarAuthorized])
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v22 = (MapsRadarDraft *)"-[MapsRadarDraft(TTR) _launchTapToRadarKitWithDisplayReason:]";
      __int16 v23 = 2080;
      id v24 = "MapsRadarDraft+TTR.m";
      __int16 v25 = 1024;
      int v26 = 46;
      __int16 v27 = 2080;
      id v28 = "MapsRadarDraft.isTapToRadarAuthorized";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v6 = [(MapsRadarDraft *)self tapToRadarKitDraft];
  if (v6)
  {
    objc_initWeak((id *)buf, self);
    CFStringRef v7 = +[TapToRadarService shared];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100AD1728;
    v19[3] = &unk_101316D00;
    objc_copyWeak(&v20, (id *)buf);
    [v7 createDraft:v6 forProcessNamed:@"Maps" withDisplayReason:v4 completionHandler:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v22 = (MapsRadarDraft *)"-[MapsRadarDraft(TTR) _launchTapToRadarKitWithDisplayReason:]";
      __int16 v23 = 2080;
      id v24 = "MapsRadarDraft+TTR.m";
      __int16 v25 = 1024;
      int v26 = 48;
      __int16 v27 = 2080;
      id v28 = "draft != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v22 = (MapsRadarDraft *)v16;
        id v17 = (void *)v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v18 = sub_100AD16D4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      id v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}p] Error creating TapToRadarKit draft", buf, 0xCu);
    }
  }
}

- (void)_launchURLScheme
{
  id v3 = sub_100AD16D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Will launch TTR via URL", buf, 0xCu);
  }

  id v4 = [(MapsRadarDraft *)self tapToRadarURL];
  if (v4)
  {
    objc_initWeak((id *)buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100AD1C14;
    v10[3] = &unk_1012EB690;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v4;
    +[UIApplication _maps_unlockApplicationWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    CFStringRef v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v14 = (MapsRadarDraft *)"-[MapsRadarDraft(TTR) _launchURLScheme]";
      __int16 v15 = 2080;
      uint64_t v16 = "MapsRadarDraft+TTR.m";
      __int16 v17 = 1024;
      int v18 = 69;
      __int16 v19 = 2080;
      id v20 = "tapToRadarURL != nil";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v14 = (MapsRadarDraft *)v7;
        uint64_t v8 = (void *)v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v9 = sub_100AD16D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      __int16 v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] Error creating TTR URL", buf, 0xCu);
    }
  }
}

@end