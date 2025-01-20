@interface NTKDiagnosticExtensionCompanionExtension
- (id)_archiveDirectory:(id)a3 toFile:(id)a4;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation NTKDiagnosticExtensionCompanionExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = +[NSFileManager defaultManager];
  v4 = NSTemporaryDirectory();
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];
  v7 = [v4 stringByAppendingPathComponent:v6];

  v46 = v3;
  [v3 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  v40 = +[NSMutableArray array];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v63 = @"/var/mobile/Library/NanoTimeKit/";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting %@", buf, 0xCu);
  }
  v39 = [v7 stringByAppendingPathComponent:@"NanoTimeKit-Companion.zip"];
  uint64_t v8 = -[NTKDiagnosticExtensionCompanionExtension _archiveDirectory:toFile:](self, "_archiveDirectory:toFile:", @"/var/mobile/Library/NanoTimeKit/");
  if (v8) {
    [v40 addObject:v8];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v63 = @"/var/mobile/Library/Caches/NanoTimeKit/";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting %@", buf, 0xCu);
  }
  v37 = [v7 stringByAppendingPathComponent:@"Caches-NTK-Companion.zip"];
  v9 = -[NTKDiagnosticExtensionCompanionExtension _archiveDirectory:toFile:](self, "_archiveDirectory:toFile:", @"/var/mobile/Library/Caches/NanoTimeKit/");
  if (v9) {
    [v40 addObject:v9];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v63 = @"/var/mobile/Library/PhotosFace/PhotosFace.sqlite";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting %@", buf, 0xCu);
  }
  v38 = (void *)v8;
  v36 = [v7 stringByAppendingPathComponent:@"/var/mobile/Library/PhotosFace/PhotosFace.sqlite"];
  uint64_t v10 = -[NTKDiagnosticExtensionCompanionExtension _archiveDirectory:toFile:](self, "_archiveDirectory:toFile:", @"/var/mobile/Library/PhotosFace/PhotosFace.sqlite");
  if (v10) {
    [v40 addObject:v10];
  }
  v35 = (void *)v10;
  v11 = +[NSFileManager defaultManager];
  v12 = [v11 contentsOfDirectoryAtPath:@"/var/mobile/Library/Caches/NanoTimeKit/" error:0];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v12;
  id v47 = [obj countByEnumeratingWithState:&v58 objects:v75 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v59;
    v42 = v9;
    v43 = v7;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v15 = [@"/var/mobile/Library/Caches/NanoTimeKit/" stringByAppendingPathComponent:v14];
        v51 = [v7 stringByAppendingPathComponent:v14];
        objc_msgSend(v46, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
        v16 = [v46 contentsOfDirectoryAtPath:v15 error:0];
        if (v16)
        {
          uint64_t v48 = v14;
          v49 = i;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v50 = v16;
          id v53 = [v16 countByEnumeratingWithState:&v54 objects:v74 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v55;
            do
            {
              for (j = 0; j != v53; j = (char *)j + 1)
              {
                if (*(void *)v55 != v52) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
                v19 = [v15 stringByAppendingPathComponent:v18];
                v20 = +[NSData dataWithContentsOfFile:v19];
                v21 = [v19 lastPathComponent];
                v22 = [v21 stringByDeletingPathExtension];

                CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
                if (ImagesFromData)
                {
                  CFArrayRef v24 = ImagesFromData;
                  v25 = +[UIImage imageWithCGImage:CFArrayGetValueAtIndex(ImagesFromData, 0)];
                  +[NSString stringWithFormat:@"%@.png", v22];
                  v27 = v26 = v15;
                  v28 = [v51 stringByAppendingPathComponent:v27];

                  v29 = UIImagePNGRepresentation(v25);
                  [v29 writeToFile:v28 atomically:1];

                  v15 = v26;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413570;
                    CFStringRef v63 = v20;
                    __int16 v64 = 2112;
                    uint64_t v65 = v18;
                    __int16 v66 = 2112;
                    v67 = v19;
                    __int16 v68 = 2112;
                    v69 = v26;
                    __int16 v70 = 2112;
                    v71 = v25;
                    __int16 v72 = 2112;
                    v73 = v28;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fileData:%@ cpbitmapFile:%@ filePath:%@ ntkcacheDir:%@ image:%@ imageFilePath:%@", buf, 0x3Eu);
                  }

                  CFRelease(v24);
                }
              }
              id v53 = [v50 countByEnumeratingWithState:&v54 objects:v74 count:16];
            }
            while (v53);
          }
          v30 = +[NSString stringWithFormat:@"PNGs-%@-Companion.zip", v48];
          v7 = v43;
          v31 = [v43 stringByAppendingPathComponent:v30];
          v32 = [(NTKDiagnosticExtensionCompanionExtension *)self _archiveDirectory:v51 toFile:v31];

          if (v32) {
            [v40 addObject:v32];
          }

          v9 = v42;
          i = v49;
          v16 = v50;
        }
      }
      id v47 = [obj countByEnumeratingWithState:&v58 objects:v75 count:16];
    }
    while (v47);
  }

  id v33 = [v40 copy];
  return v33;
}

- (id)_archiveDirectory:(id)a3 toFile:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOMCopierNew();
  CFStringRef v12 = @"createPKZip";
  v13 = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v8 = v6;
  [v8 fileSystemRepresentation];

  id v9 = v5;
  [v9 fileSystemRepresentation];
  LODWORD(v8) = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[DEAttachmentItem attachmentWithPath:v9];
  }

  return v10;
}

@end