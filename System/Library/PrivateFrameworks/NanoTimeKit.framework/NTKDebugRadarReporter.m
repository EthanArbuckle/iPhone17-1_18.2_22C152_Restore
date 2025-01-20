@interface NTKDebugRadarReporter
+ (BOOL)_archiveDirectory:(id)a3 toFile:(id)a4;
- (BOOL)addAttachmentAtURL:(id)a3 error:(id *)a4;
- (BOOL)present;
- (NSMutableArray)additionalInformationStrings;
- (NSMutableArray)attachmentURLs;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)radarTitle;
- (NSURL)temporaryDirectoryURLToCleanup;
- (NTKDebugRadarReporter)initWithRadarTitle:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5;
- (void)appendInformationToDescription:(id)a3;
- (void)setAdditionalInformationStrings:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setAttachmentURLs:(id)a3;
- (void)setRadarTitle:(id)a3;
- (void)setTemporaryDirectoryURLToCleanup:(id)a3;
@end

@implementation NTKDebugRadarReporter

+ (BOOL)_archiveDirectory:(id)a3 toFile:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOMCopierNew();
  v19 = @"createPKZip";
  v20[0] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v8 = v5;
  [v8 fileSystemRepresentation];
  id v9 = v6;
  [v9 fileSystemRepresentation];
  int v10 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v10)
  {
    v11 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_error_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_ERROR, "Arching %@ to %@ failed %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  return v10 == 0;
}

- (NTKDebugRadarReporter)initWithRadarTitle:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)NTKDebugRadarReporter;
  v11 = [(NTKDebugRadarReporter *)&v36 init];
  int v13 = v11;
  if (v11)
  {
    if (NTKInternalBuild(v11, v12))
    {
      uint64_t v14 = [v8 copy];
      radarTitle = v13->_radarTitle;
      v13->_radarTitle = (NSString *)v14;

      uint64_t v16 = [v9 copy];
      alertTitle = v13->_alertTitle;
      v13->_alertTitle = (NSString *)v16;

      v35[1] = &v37;
      uint64_t v18 = [[NSString alloc] initWithFormat:v10 arguments:&v37];
      alertMessage = v13->_alertMessage;
      v13->_alertMessage = (NSString *)v18;

      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      attachmentURLs = v13->_attachmentURLs;
      v13->_attachmentURLs = (NSMutableArray *)v20;

      uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
      additionalInformationStrings = v13->_additionalInformationStrings;
      v13->_additionalInformationStrings = (NSMutableArray *)v22;

      v24 = [MEMORY[0x1E4F29128] UUID];
      v25 = [v24 UUIDString];

      v26 = NSTemporaryDirectory();
      v27 = [v26 stringByAppendingPathComponent:v25];
      v28 = [MEMORY[0x1E4F28CB8] defaultManager];
      v35[0] = 0;
      char v29 = [v28 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:v35];
      id v30 = v35[0];

      if (v29)
      {
        uint64_t v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27];
        temporaryDirectoryURLToCleanup = v13->_temporaryDirectoryURLToCleanup;
        v13->_temporaryDirectoryURLToCleanup = (NSURL *)v31;
      }
      else
      {
        v33 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[NTKDebugRadarReporter initWithRadarTitle:alertTitle:alertMessage:]();
        }

        temporaryDirectoryURLToCleanup = v13->_temporaryDirectoryURLToCleanup;
        v13->_temporaryDirectoryURLToCleanup = 0;
      }
    }
    else
    {
      v25 = _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[NTKDebugRadarReporter initWithRadarTitle:alertTitle:alertMessage:](v25);
      }
    }
  }
  return v13;
}

- (BOOL)addAttachmentAtURL:(id)a3 error:(id *)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (NTKInternalBuild(v6, v7))
  {
    uint64_t v8 = *MEMORY[0x1E4F1C5C0];
    v54[0] = *MEMORY[0x1E4F1C5C0];
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    id v45 = 0;
    id v10 = [v6 resourceValuesForKeys:v9 error:&v45];
    id v11 = v45;

    if (v10)
    {
      uint64_t v12 = [v10 objectForKeyedSubscript:v8];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F1C5D0]];

      if (v13)
      {
        uint64_t v14 = [(NTKDebugRadarReporter *)self temporaryDirectoryURLToCleanup];
        __int16 v15 = [v6 lastPathComponent];
        uint64_t v16 = [v14 URLByAppendingPathComponent:v15];

        __int16 v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v44 = 0;
        char v18 = [v17 copyItemAtURL:v6 toURL:v16 error:&v44];
        id v19 = v44;

        if (v18)
        {
          uint64_t v20 = [(NTKDebugRadarReporter *)self attachmentURLs];
          [v20 addObject:v16];
        }
        else
        {
          uint64_t v20 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v49 = v6;
            __int16 v50 = 2112;
            v51 = v16;
            __int16 v52 = 2112;
            id v53 = v19;
            _os_log_error_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_ERROR, "Couldn't copy attachment %@ to %@ - %@", buf, 0x20u);
          }
        }

LABEL_23:
        goto LABEL_24;
      }
      uint64_t v31 = [v10 objectForKeyedSubscript:v8];
      int v32 = [v31 isEqualToString:*MEMORY[0x1E4F1C5B8]];

      if (v32)
      {
        v33 = [(NTKDebugRadarReporter *)self temporaryDirectoryURLToCleanup];
        v34 = [v6 lastPathComponent];
        uint64_t v16 = [v33 URLByAppendingPathComponent:v34];

        v35 = [v6 absoluteURL];
        id v19 = [v35 path];

        objc_super v36 = [v16 absoluteURL];
        uint64_t v37 = [v36 path];
        v38 = [v37 stringByAppendingPathExtension:@"zip"];

        char v18 = +[NTKDebugRadarReporter _archiveDirectory:v19 toFile:v38];
        if (v18)
        {
          v39 = [(NTKDebugRadarReporter *)self attachmentURLs];
          [v39 addObject:v16];
        }
        else
        {
          v39 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[NTKDebugRadarReporter addAttachmentAtURL:error:]();
          }
        }

        goto LABEL_23;
      }
      if (a4)
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28798];
        uint64_t v46 = *MEMORY[0x1E4F289D0];
        id v47 = v6;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a4 = [v40 errorWithDomain:v41 code:79 userInfo:v42];
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E4F1CA60];
      id v22 = v6;
      id v23 = v11;
      v24 = [v21 dictionaryWithCapacity:2];
      v25 = (void *)[v22 copy];

      [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
      v26 = (void *)[v23 copy];

      [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = (void *)[v24 copy];
      char v29 = [v27 errorWithDomain:@"NTKDebugRadarReporterErrorDomain" code:102 userInfo:v28];

      id v30 = v29;
      char v18 = 0;
      *a4 = v30;
LABEL_24:

      goto LABEL_25;
    }
    char v18 = 0;
    goto LABEL_24;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    char v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v18 = 0;
  }
LABEL_25:

  return v18;
}

- (void)appendInformationToDescription:(id)a3
{
  id v4 = a3;
  if (NTKInternalBuild(v4, v5))
  {
    id v6 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v8];
    uint64_t v7 = [(NTKDebugRadarReporter *)self additionalInformationStrings];
    [v7 addObject:v6];
  }
}

- (BOOL)present
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (NTKInternalBuild(self, a2))
  {
    CFOptionFlags v59 = 0;
    v3 = [(NTKDebugRadarReporter *)self alertTitle];
    id v4 = [(NTKDebugRadarReporter *)self alertMessage];
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v3, v4, @"File Bug", @"Cancel", 0, &v59);

    CFOptionFlags v5 = v59;
    BOOL v6 = v59 == 0;
    uint64_t v7 = _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "User chose not to report bug. Removing temporary files.", buf, 2u);
      }

      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v10 = [(NTKDebugRadarReporter *)self temporaryDirectoryURLToCleanup];
      [v9 removeItemAtURL:v10 error:0];
      goto LABEL_28;
    }
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "User chose to report bug. Submitting request to Tap to Radar.", buf, 2u);
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v9 setScheme:@"tap-to-radar"];
    [v9 setHost:@"new"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:@"Watch Faces"];
    [v10 addObject:v11];

    uint64_t v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:@"All"];
    [v10 addObject:v12];

    int v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:@"568147"];
    [v10 addObject:v13];

    uint64_t v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:@"Serious Bug"];
    [v10 addObject:v14];

    __int16 v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducibility" value:@"Not Applicable"];
    [v10 addObject:v15];

    uint64_t v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"AutoDiagnostics" value:@"phone,watch"];
    [v10 addObject:v16];

    __int16 v17 = [(NTKDebugRadarReporter *)self additionalInformationStrings];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      id v19 = NSString;
      uint64_t v20 = [(NTKDebugRadarReporter *)self additionalInformationStrings];
      v21 = [v20 componentsJoinedByString:@"\n\n"];
      id v22 = [v19 stringWithFormat:@"Summary: \n\nSteps to Reproduce: \n\nNotes:\n\n%@", v21];
    }
    else
    {
      id v22 = @"Summary: \n\nSteps to Reproduce: ";
    }
    id v53 = v22;
    id v23 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:v22];
    [v10 addObject:v23];

    v24 = (void *)MEMORY[0x1E4F290C8];
    v25 = [(NTKDebugRadarReporter *)self radarTitle];
    v26 = [v24 queryItemWithName:@"Title" value:v25];
    [v10 addObject:v26];

    v27 = [MEMORY[0x1E4F290C8] queryItemWithName:@"IncludeDevicePrefixInTitle" value:@"YES"];
    [v10 addObject:v27];

    v28 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ExtensionIdentifiers" value:@"com.apple.NanoTimeKitCompanion.NTKDiagnosticExtensionCompanion"];
    [v10 addObject:v28];

    char v29 = (void *)MEMORY[0x1E4F1CA48];
    id v30 = [(NTKDebugRadarReporter *)self attachmentURLs];
    uint64_t v31 = objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int v32 = [(NTKDebugRadarReporter *)self attachmentURLs];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v56 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = [*(id *)(*((void *)&v55 + 1) + 8 * i) absoluteURL];
          v38 = [v37 path];
          [v31 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v34);
    }

    v39 = [v31 componentsJoinedByString:@","];
    if ([v31 count])
    {
      v40 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Attachments" value:v39];
      [v10 addObject:v40];
    }
    uint64_t v41 = (void *)[v10 copy];
    [v9 setQueryItems:v41];

    v42 = [v9 URL];
    v43 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v54 = 0;
    int v44 = [v43 openURL:v42 withOptions:MEMORY[0x1E4F1CC08] error:&v54];
    id v45 = v54;

    uint64_t v46 = _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      v48 = v53;
      if (v47)
      {
        *(_DWORD *)buf = 138412290;
        v61 = v42;
        id v49 = "Successfully launched Tap-to-Radar: %@";
        __int16 v50 = v46;
        uint32_t v51 = 12;
LABEL_26:
        _os_log_impl(&dword_1BC5A9000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
      }
    }
    else
    {
      v48 = v53;
      if (v47)
      {
        *(_DWORD *)buf = 138412546;
        v61 = v42;
        __int16 v62 = 2112;
        id v63 = v45;
        id v49 = "Failed to launch Tap-to-Radar: %@: %@";
        __int16 v50 = v46;
        uint32_t v51 = 22;
        goto LABEL_26;
      }
    }

LABEL_28:
    return v6;
  }
  return 0;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
}

- (NSMutableArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void)setAttachmentURLs:(id)a3
{
}

- (NSMutableArray)additionalInformationStrings
{
  return self->_additionalInformationStrings;
}

- (void)setAdditionalInformationStrings:(id)a3
{
}

- (NSURL)temporaryDirectoryURLToCleanup
{
  return self->_temporaryDirectoryURLToCleanup;
}

- (void)setTemporaryDirectoryURLToCleanup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURLToCleanup, 0);
  objc_storeStrong((id *)&self->_additionalInformationStrings, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
}

- (void)initWithRadarTitle:alertTitle:alertMessage:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't make directory for %@ - %@");
}

- (void)initWithRadarTitle:(os_log_t)log alertTitle:alertMessage:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKDebugRadarReporter is unavailable.", v1, 2u);
}

- (void)addAttachmentAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't archive directory attachment %@ to %@");
}

@end