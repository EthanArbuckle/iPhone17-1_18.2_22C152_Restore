@interface PhotosStoryDiagnosticsExtension
+ (BOOL)isAppleInternal;
+ (id)descriptionForFilename:(id)a3;
+ (id)displayNameForFilename:(id)a3;
- (BOOL)repositoryIsEmpty:(id)a3 fileManager:(id)a4;
- (id)annotatedAttachmentsForParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)diagnosticAttachmentsForMemoryLocalIdentifier:(id)a3;
- (id)internalFullDiagnostics;
- (id)memoryDiagnosticsRepositoryPathForMemoryLocalIdentifier:(id)a3;
@end

@implementation PhotosStoryDiagnosticsExtension

- (BOOL)repositoryIsEmpty:(id)a3 fileManager:(id)a4
{
  NSURLResourceKey v13 = NSURLIsDirectoryKey;
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = 1;
  v8 = +[NSArray arrayWithObjects:&v13 count:1];
  uint64_t v12 = 0;
  v9 = [v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v8 options:4 error:&v12];

  uint64_t v10 = v12;
  if (!v10) {
    BOOL v7 = [v9 count] == 0;
  }

  return v7;
}

- (id)memoryDiagnosticsRepositoryPathForMemoryLocalIdentifier:(id)a3
{
  id v24 = a3;
  v3 = [@"/var/mobile/Media/PhotoData/internal/storydiagnostics/" stringByAppendingString:PNStoryDiagnosticsIndexFileName];
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3];
  id v29 = 0;
  id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v29];
  id v6 = v29;
  objc_opt_class();
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v20 = v6;
    v21 = v5;
    id v22 = v4;
    v23 = v3;
    id v8 = v5;
    v9 = [v8 allKeys];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      BOOL v7 = 0;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v15 = [v8 objectForKeyedSubscript:v14];
          v16 = [v15 objectForKeyedSubscript:@"generatedMemoryIdentifiers"];
          v17 = v16;
          if (v16 && [v16 count] && objc_msgSend(v17, "containsObject:", v24))
          {
            uint64_t v18 = [@"/var/mobile/Media/PhotoData/internal/storydiagnostics/" stringByAppendingString:v14];

            BOOL v7 = (void *)v18;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }
    else
    {
      BOOL v7 = 0;
    }

    id v4 = v22;
    v3 = v23;
    id v6 = v20;
    id v5 = v21;
  }

  return v7;
}

- (id)diagnosticAttachmentsForMemoryLocalIdentifier:(id)a3
{
  id v4 = (char *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[PhotosStoryDiagnosticsExtension diagnosticAttachmentsForMemoryLocalIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  id v5 = [(PhotosStoryDiagnosticsExtension *)self memoryDiagnosticsRepositoryPathForMemoryLocalIdentifier:v4];
  if (v5)
  {
    long long v26 = v4;
    id v28 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = v5;
    id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
    id v7 = objc_alloc_init((Class)NSFileManager);
    NSURLResourceKey v42 = NSURLIsRegularFileKey;
    id v8 = +[NSArray arrayWithObjects:&v42 count:1];
    id v34 = 0;
    v23 = v7;
    id v24 = v6;
    v9 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v8 options:4 error:&v34];
    id v10 = v34;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          v15 = v10;
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v17 = [v16 lastPathComponent];
          uint64_t v18 = +[PhotosStoryDiagnosticsExtension displayNameForFilename:v17];
          if (v18)
          {
            v19 = +[PhotosStoryDiagnosticsExtension descriptionForFilename:v17];
            id v29 = v10;
            +[DEAnnotation annotateURL:v16 displayName:v18 description:&stru_1000042C0 iconType:@"text" additionalInfo:0 error:&v29];
            id v10 = v29;

            if (v10)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = (const char *)v10;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed with error %@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v36 = (const char *)v16;
              __int16 v37 = 2112;
              v38 = v18;
              __int16 v39 = 2112;
              v40 = v19;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Annotation successful for %@, display name: %@, description: %@", buf, 0x20u);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "No display name for %@", buf, 0xCu);
          }
          id v20 = +[DEAttachmentItem attachmentWithPathURL:v16];
          [v28 addObject:v20];
        }
        id v12 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v12);
    }

    id v21 = v28;
    id v5 = v25;
    id v4 = v26;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "No repository path for given memory local identifier: %@", buf, 0xCu);
    }
    id v21 = &__NSArray0__struct;
  }

  return v21;
}

- (id)internalFullDiagnostics
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [objc_alloc((Class)NSURL) initWithString:@"/var/mobile/Media/PhotoData/internal/storydiagnostics/"];
  id v5 = objc_alloc_init((Class)NSFileManager);
  NSURLResourceKey v22 = NSURLIsDirectoryKey;
  id v6 = +[NSArray arrayWithObjects:&v22 count:1];
  id v21 = 0;
  id v7 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:4 error:&v21];
  id v8 = v21;

  if (v8)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100002AF8;
    v17 = &unk_1000041E0;
    uint64_t v18 = self;
    id v19 = v5;
    id v10 = v3;
    id v20 = v10;
    [v7 enumerateObjectsUsingBlock:&v14];
    id v11 = objc_msgSend(@"/var/mobile/Media/PhotoData/internal/storydiagnostics/", "stringByAppendingString:", PNStoryDiagnosticsIndexFileName, v14, v15, v16, v17, v18);
    id v12 = +[DEAttachmentItem attachmentWithPath:v11];
    [v10 addObject:v12];
    id v9 = v10;
  }
  return v9;
}

- (id)annotatedAttachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[PhotosStoryDiagnosticsExtension annotatedAttachmentsForParameters:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  id v5 = [(PhotosStoryDiagnosticsExtension *)self attachmentsForParameters:v4];
  id v6 = objc_alloc((Class)DEAnnotatedGroup);
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu Text Files", [v5 count]);
  id v8 = [v6 initWithDisplayName:@"Memory Movie Details" localizedDescription:v7 iconType:0 additionalInfo:0 attachmentItems:v5];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v9 = [v8 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Returning DEAnnotatedGroup %@", buf, 0xCu);
  }
  return v8;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v4 objectForKeyedSubscript:PNStoryDiagnosticsExtensionParameterName];

  id v7 = [v6 firstObject];
  if (v7)
  {
    id v8 = [(PhotosStoryDiagnosticsExtension *)self diagnosticAttachmentsForMemoryLocalIdentifier:v7];
    [v5 addObjectsFromArray:v8];
  }
  if (+[PhotosStoryDiagnosticsExtension isAppleInternal](PhotosStoryDiagnosticsExtension, "isAppleInternal")&& ![v5 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "No attachment retrieved, falling back to full story diagnostics", v11, 2u);
    }
    id v9 = [(PhotosStoryDiagnosticsExtension *)self internalFullDiagnostics];
    [v5 addObjectsFromArray:v9];
  }
  return v5;
}

- (id)attachmentList
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (+[PhotosStoryDiagnosticsExtension isAppleInternal])
  {
    id v4 = [(PhotosStoryDiagnosticsExtension *)self internalFullDiagnostics];
    [v3 addObjectsFromArray:v4];
  }
  return v3;
}

+ (id)descriptionForFilename:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:PNNonInternalDiagnosticsAmbiguityFileName])
  {
    CFStringRef v4 = @"Missing Details";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsMusicFileName])
  {
    CFStringRef v4 = @"Song Information";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsKeyAssetFileName])
  {
    CFStringRef v4 = @"Description of the Cover Photo";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsMemoryFileName])
  {
    CFStringRef v4 = @"Memory Information";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsAssetsFileName])
  {
    CFStringRef v4 = @"Assets Information";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsTraitsAndTokensFileName])
  {
    CFStringRef v4 = @"Key Details";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsPromptFileName])
  {
    CFStringRef v4 = @"Description used";
  }
  else
  {
    CFStringRef v4 = &stru_1000042C0;
  }

  return (id)v4;
}

+ (id)displayNameForFilename:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:PNNonInternalDiagnosticsAmbiguityFileName])
  {
    CFStringRef v4 = @"Missing Details";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsMusicFileName])
  {
    CFStringRef v4 = @"Song Name";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsKeyAssetFileName])
  {
    CFStringRef v4 = @"Cover Photo Description";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsMemoryFileName])
  {
    CFStringRef v4 = @"Titles Type Playback";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsAssetsFileName])
  {
    CFStringRef v4 = @"Source Quality";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsTraitsAndTokensFileName])
  {
    CFStringRef v4 = @"Key Details";
  }
  else if ([v3 isEqualToString:PNNonInternalDiagnosticsPromptFileName])
  {
    CFStringRef v4 = @"Description";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

+ (BOOL)isAppleInternal
{
  if (qword_1000081F8 != -1) {
    dispatch_once(&qword_1000081F8, &stru_100004220);
  }
  return byte_1000081F0;
}

@end