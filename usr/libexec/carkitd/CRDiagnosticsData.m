@interface CRDiagnosticsData
+ (id)_carPlayLogsFolderURL;
+ (id)makeDiagnosticsFolderForTime:(id)a3;
+ (void)removeDiagnosticsFoldersBeforeTime:(id)a3;
- (AFAccount)siriAccount;
- (BOOL)addAttachment:(id)a3;
- (BOOL)addAttachment:(id)a3 asFilename:(id)a4;
- (BOOL)addTextAttachment:(id)a3 asFilename:(id)a4;
- (BOOL)isCAFToolTreeCompletionCalled;
- (BOOL)isMapsActive;
- (BOOL)isVehicleDataSession;
- (BOOL)vehicleSupportsStartSession;
- (CRDiagnosticsData)init;
- (NSDate)date;
- (NSMutableArray)attachmentURLs;
- (NSString)activeBundleIdentifier;
- (NSString)additionalDescription;
- (NSString)focusModeDescription;
- (NSString)locationDescription;
- (NSString)timestamp;
- (NSString)transcription;
- (NSURL)baseFolderURL;
- (id)_getCreationDateForAttachmentURL:(id)a3;
- (id)description;
- (unint64_t)transportType;
- (void)_markPurgeable:(id)a3;
- (void)setActiveBundleIdentifier:(id)a3;
- (void)setAdditionalDescription:(id)a3;
- (void)setFocusModeDescription:(id)a3;
- (void)setIsCAFToolTreeCompletionCalled:(BOOL)a3;
- (void)setIsVehicleDataSession:(BOOL)a3;
- (void)setLocationDescription:(id)a3;
- (void)setMapsActive:(BOOL)a3;
- (void)setSiriAccount:(id)a3;
- (void)setTranscription:(id)a3;
- (void)setTransportType:(unint64_t)a3;
- (void)setVehicleSupportsStartSession:(BOOL)a3;
@end

@implementation CRDiagnosticsData

+ (id)_carPlayLogsFolderURL
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 URLsForDirectory:5 inDomains:1];
  v4 = [v3 firstObject];

  v5 = [v4 URLByAppendingPathComponent:@"Logs/com.apple.CarPlay" isDirectory:1];

  return v5;
}

+ (id)makeDiagnosticsFolderForTime:(id)a3
{
  id v4 = a3;
  v5 = [a1 _carPlayLogsFolderURL];
  if (v5)
  {
    v6 = CRStringForDate();
    v7 = +[NSString stringWithFormat:@"CarPlay-%@", v6];
    v8 = [v5 URLByAppendingPathComponent:v7];

    v9 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v11 = v16;

    if (v10)
    {
      v12 = CarDiagnosticsLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Created logging folder: %@", buf, 0xCu);
      }

      id v13 = v8;
    }
    else
    {
      v14 = CarGeneralLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10007542C((uint64_t)v11, v14);
      }

      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)removeDiagnosticsFoldersBeforeTime:(id)a3
{
  id v4 = a3;
  v5 = [a1 _carPlayLogsFolderURL];
  if (v5)
  {
    v6 = +[NSCalendar currentCalendar];
    uint64_t v7 = [v6 dateByAddingUnit:16 value:-7 toDate:v4 options:0];

    v35 = (void *)v7;
    if (v7)
    {
      v8 = CarDiagnosticsLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing any logging folders before %@", buf, 0xCu);
      }

      v9 = +[NSFileManager defaultManager];
      NSURLResourceKey v10 = NSURLCreationDateKey;
      NSURLResourceKey v50 = NSURLCreationDateKey;
      id v11 = +[NSArray arrayWithObjects:&v50 count:1];
      id v43 = 0;
      v12 = [v9 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v11 options:0 error:&v43];
      id v13 = v43;

      if (v12)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        obj = v12;
        id v14 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
        if (!v14) {
          goto LABEL_30;
        }
        id v15 = v14;
        v32 = v12;
        v33 = v5;
        id v34 = v4;
        uint64_t v16 = *(void *)v40;
        v17 = &AnalyticsSendEvent_ptr;
        while (1)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            NSURLResourceKey v48 = v10;
            v20 = [v17[406] arrayWithObjects:&v48 count:1];
            id v38 = v13;
            v21 = [v19 resourceValuesForKeys:v20 error:&v38];
            id v22 = v38;

            if (!v21)
            {
              v24 = CarGeneralLogging();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v45 = (uint64_t)v19;
                __int16 v46 = 2112;
                id v47 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error reading metadata for %@: %@", buf, 0x16u);
              }
LABEL_19:
              id v13 = v22;
              goto LABEL_25;
            }
            v23 = [v21 objectForKey:v10];
            v24 = v23;
            if (!v23) {
              goto LABEL_19;
            }
            id v25 = v15;
            uint64_t v26 = v16;
            v27 = [v23 earlierDate:v35];
            unsigned int v28 = [v27 isEqual:v24];

            if (v28)
            {
              v29 = +[NSFileManager defaultManager];
              id v37 = v22;
              unsigned int v30 = [v29 removeItemAtURL:v19 error:&v37];
              id v13 = v37;

              if (v30)
              {
                v31 = CarDiagnosticsLogging();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v45 = (uint64_t)v19;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Removed logging folder: %@", buf, 0xCu);
                }
              }
              else
              {
                v31 = CarGeneralLogging();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v45 = (uint64_t)v19;
                  __int16 v46 = 2112;
                  id v47 = v13;
                  _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to remove logging folder %@: %@", buf, 0x16u);
                }
              }
              v17 = &AnalyticsSendEvent_ptr;
              uint64_t v16 = v26;
            }
            else
            {
              id v13 = v22;
              uint64_t v16 = v26;
            }
            id v15 = v25;
            NSURLResourceKey v10 = NSURLCreationDateKey;
LABEL_25:
          }
          id v15 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (!v15)
          {
            v5 = v33;
            id v4 = v34;
            v12 = v32;
            goto LABEL_30;
          }
        }
      }
      obj = CarGeneralLogging();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        sub_1000754A4((uint64_t)v13, obj);
      }
LABEL_30:
    }
  }
}

- (CRDiagnosticsData)init
{
  v15.receiver = self;
  v15.super_class = (Class)CRDiagnosticsData;
  v2 = [(CRDiagnosticsData *)&v15 init];
  if (!v2) {
    goto LABEL_3;
  }
  uint64_t v3 = +[NSDate date];
  date = v2->_date;
  v2->_date = (NSDate *)v3;

  v5 = [(CRDiagnosticsData *)v2 date];
  uint64_t v6 = CRStringForDate();
  timestamp = v2->_timestamp;
  v2->_timestamp = (NSString *)v6;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  attachmentURLs = v2->_attachmentURLs;
  v2->_attachmentURLs = v8;

  NSURLResourceKey v10 = [(CRDiagnosticsData *)v2 date];
  uint64_t v11 = +[CRDiagnosticsData makeDiagnosticsFolderForTime:v10];
  baseFolderURL = v2->_baseFolderURL;
  v2->_baseFolderURL = (NSURL *)v11;

  id v13 = [(CRDiagnosticsData *)v2 baseFolderURL];

  if (v13) {
LABEL_3:
  }
    id v13 = v2;

  return v13;
}

- (void)_markPurgeable:(id)a3
{
  id v3 = a3;
  id v7 = 0;
  unsigned __int8 v4 = [v3 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsPurgeableKey error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007551C();
    }
  }
}

- (BOOL)addAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  LOBYTE(self) = [(CRDiagnosticsData *)self addAttachment:v4 asFilename:v5];

  return (char)self;
}

- (BOOL)addAttachment:(id)a3 asFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100075584();
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    id v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000755B8();
    }
LABEL_9:
    unsigned __int8 v12 = 0;
    goto LABEL_13;
  }
  v9 = [(CRDiagnosticsData *)self baseFolderURL];
  NSURLResourceKey v10 = [v9 URLByAppendingPathComponent:v8];

  uint64_t v11 = +[NSFileManager defaultManager];
  id v16 = 0;
  unsigned __int8 v12 = [v11 moveItemAtURL:v6 toURL:v10 error:&v16];
  id v13 = v16;

  if (v12)
  {
    [(CRDiagnosticsData *)self _markPurgeable:v10];
    id v14 = [(CRDiagnosticsData *)self attachmentURLs];
    [v14 addObject:v10];
  }
  else
  {
    id v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000755EC();
    }
  }

LABEL_13:
  return v12;
}

- (id)_getCreationDateForAttachmentURL:(id)a3
{
  id v3 = [a3 path];
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v10 = 0;
    id v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
    id v6 = v10;

    if (v6)
    {
      id v7 = CarGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100075654();
      }
    }
    v8 = [v5 objectForKeyedSubscript:NSFileCreationDate];
  }
  else
  {
    id v6 = 0;
    v8 = 0;
  }

  return v8;
}

- (BOOL)addTextAttachment:(id)a3 asFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [(CRDiagnosticsData *)self baseFolderURL];
    id v10 = [v9 URLByAppendingPathComponent:v8];

    id v15 = 0;
    unsigned __int8 v11 = [v6 writeToURL:v10 atomically:1 encoding:4 error:&v15];
    unsigned __int8 v12 = v15;
    if (v11)
    {
      [(CRDiagnosticsData *)self _markPurgeable:v10];
      id v13 = [(CRDiagnosticsData *)self attachmentURLs];
      [v13 addObject:v10];
    }
    else
    {
      id v13 = CarGeneralLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000756F0();
      }
    }
  }
  else
  {
    unsigned __int8 v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000756BC();
    }
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"timestamp: %@, attachmentURLs: %@, activeBundleID: %@, transcription: %@", self->_timestamp, self->_attachmentURLs, self->_activeBundleIdentifier, self->_transcription];
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (NSURL)baseFolderURL
{
  return self->_baseFolderURL;
}

- (NSMutableArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (NSString)activeBundleIdentifier
{
  return self->_activeBundleIdentifier;
}

- (void)setActiveBundleIdentifier:(id)a3
{
}

- (AFAccount)siriAccount
{
  return self->_siriAccount;
}

- (void)setSiriAccount:(id)a3
{
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
}

- (NSString)focusModeDescription
{
  return self->_focusModeDescription;
}

- (void)setFocusModeDescription:(id)a3
{
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (BOOL)isMapsActive
{
  return self->_mapsActive;
}

- (void)setMapsActive:(BOOL)a3
{
  self->_mapsActive = a3;
}

- (BOOL)vehicleSupportsStartSession
{
  return self->_vehicleSupportsStartSession;
}

- (void)setVehicleSupportsStartSession:(BOOL)a3
{
  self->_vehicleSupportsStartSession = a3;
}

- (NSString)additionalDescription
{
  return self->_additionalDescription;
}

- (void)setAdditionalDescription:(id)a3
{
}

- (BOOL)isCAFToolTreeCompletionCalled
{
  return self->_isCAFToolTreeCompletionCalled;
}

- (void)setIsCAFToolTreeCompletionCalled:(BOOL)a3
{
  self->_isCAFToolTreeCompletionCalled = a3;
}

- (BOOL)isVehicleDataSession
{
  return self->_isVehicleDataSession;
}

- (void)setIsVehicleDataSession:(BOOL)a3
{
  self->_isVehicleDataSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDescription, 0);
  objc_storeStrong((id *)&self->_focusModeDescription, 0);
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_siriAccount, 0);
  objc_storeStrong((id *)&self->_activeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
  objc_storeStrong((id *)&self->_baseFolderURL, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end