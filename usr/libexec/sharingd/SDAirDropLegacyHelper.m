@interface SDAirDropLegacyHelper
+ (__SecKey)copyReceiverPublicKeyForIdentifier:(id)a3;
+ (id)convertWideGamutToClampedPhotoForURLs:(id)a3 outTmpDirectory:(id *)a4;
+ (id)internetLocationFile:(__CFURL *)a3;
+ (id)preprocessItems:(id)a3 forClientBundleID:(id)a4 receiverIdentifier:(id)a5 receiverSupportsURLs:(BOOL)a6 receiverIsUnknown:(BOOL)a7;
+ (id)realPathURL:(__CFURL *)a3;
+ (id)temporaryWeblocURL:(__CFURL *)a3;
+ (id)tmpDirectory;
+ (id)webURLFromInternetLocationFile:(id)a3;
+ (void)convertLivePhotoBundleIfNeeded:(id)a3 capabilities:(id)a4 conversionManager:(id)a5 queue:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
+ (void)convertMediaItemFromURL:(id)a3 forMediaCapabilities:(id)a4 conversionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 conversionManager:(id)a5 mediaCapabilities:(id)a6 supportsLivePhoto:(BOOL)a7 supportsAssetBundles:(BOOL)a8 supportsWideGamut:(BOOL)a9 queue:(id)a10 progressHandler:(id)a11 completionHandler:(id)a12;
+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 mediaCapabilities:(id)a5 supportsLivePhoto:(BOOL)a6 supportsAssetBundles:(BOOL)a7 supportsWideGamut:(BOOL)a8 completionHandler:(id)a9;
@end

@implementation SDAirDropLegacyHelper

+ (id)realPathURL:(__CFURL *)a3
{
  CFTypeRef cf = 0;
  CFURLRef v3 = CFURLCreateFilePathURL(0, a3, (CFErrorRef *)&cf);
  if (v3)
  {
    CFURLRef v4 = v3;
    bzero(buffer, 0x400uLL);
    if (CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024))
    {
      bzero(__s, 0x400uLL);
      if (realpath_DARWIN_EXTSN((const char *)buffer, __s))
      {
        size_t v5 = strlen(__s);
        Boolean v6 = sub_1001B1A10(v4);
        CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v5, v6);
        if (v7)
        {
LABEL_15:
          CFRelease(v4);
          goto LABEL_16;
        }
        v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001B12C4();
        }
      }
      else
      {
        v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001B1224((uint64_t)buffer, v8);
        }
      }
    }
    else
    {
      v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001B11BC();
      }
    }

    CFURLRef v7 = 0;
    goto LABEL_15;
  }
  v9 = airdrop_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001B114C((uint64_t)&cf, v9, v10, v11, v12, v13, v14, v15);
  }

  CFRelease(cf);
  CFURLRef v7 = 0;
LABEL_16:

  return v7;
}

+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 mediaCapabilities:(id)a5 supportsLivePhoto:(BOOL)a6 supportsAssetBundles:(BOOL)a7 supportsWideGamut:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001AD98C;
  v17[3] = &unk_1008CF840;
  id v18 = a9;
  id v15 = v18;
  LOBYTE(v16) = a8;
  +[SDAirDropLegacyHelper convertMediaItemsWithFileURLs:a3 clientBundleID:a4 conversionManager:0 mediaCapabilities:a5 supportsLivePhoto:v11 supportsAssetBundles:v10 supportsWideGamut:v16 queue:&_dispatch_main_q progressHandler:&stru_1008CF818 completionHandler:v17];
}

+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 conversionManager:(id)a5 mediaCapabilities:(id)a6 supportsLivePhoto:(BOOL)a7 supportsAssetBundles:(BOOL)a8 supportsWideGamut:(BOOL)a9 queue:(id)a10 progressHandler:(id)a11 completionHandler:(id)a12
{
  BOOL v86 = a7;
  BOOL v87 = a8;
  id v15 = a3;
  id v82 = a4;
  id v16 = a5;
  id v92 = a6;
  id v85 = a10;
  id v91 = a11;
  id v83 = a12;
  v84 = v15;
  if (SFIsDeviceAudioAccessory())
  {
    v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v18 = v15;
    id v19 = [v18 countByEnumeratingWithState:&v99 objects:v148 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v100;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v100 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v99 + 1) + 8 * i);
          v23 = objc_alloc_init(SDAirDropConvertMediaItemsResult);
          [(SDAirDropConvertMediaItemsResult *)v23 setUrl:v22];
          [v17 addObject:v23];
        }
        id v19 = [v18 countByEnumeratingWithState:&v99 objects:v148 count:16];
      }
      while (v19);
    }

    (*((void (**)(id, void *, void *, void *, void *, uint64_t, void, id, void))v83 + 2))(v83, v17, &__NSArray0__struct, &__NSArray0__struct, &__kCFBooleanFalse, 4, 0, v16, 0);
  }
  else
  {
    if (!v16)
    {
      id v16 = (id)objc_opt_new();
      v24 = +[PLPhotoLibrary systemPhotoLibrary];
      v25 = [v24 photoOutboundSharingTmpDirectoryURL];

      if (v25)
      {
        [v16 setDirectoryForTemporaryFiles:v25];
      }
      else
      {
        v26 = airdrop_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1001B132C();
        }

        v27 = +[SDAirDropLegacyHelper tmpDirectory];
        [v16 setDirectoryForTemporaryFiles:v27];
      }
    }
    v146[0] = 0;
    v146[1] = v146;
    v146[2] = 0x3032000000;
    v146[3] = sub_1001AE744;
    v146[4] = sub_1001AE754;
    id v147 = 0;
    uint64_t v142 = 0;
    v143 = &v142;
    uint64_t v144 = 0x2020000000;
    uint64_t v145 = 0;
    uint64_t v136 = 0;
    v137 = &v136;
    uint64_t v138 = 0x3032000000;
    v139 = sub_1001AE744;
    v140 = sub_1001AE754;
    id v141 = 0;
    v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
    v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
    v95 = v16;
    v30 = +[NSMutableArray array];
    dispatch_group_t v31 = dispatch_group_create();
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_1001AE75C;
    v129[3] = &unk_1008CF868;
    id v81 = v28;
    id v130 = v81;
    id v80 = v29;
    id v131 = v80;
    id v79 = v30;
    id v132 = v79;
    v134 = &v142;
    v135 = &v136;
    dispatch_group_t group = v31;
    dispatch_group_t v133 = group;
    v97 = objc_retainBlock(v129);
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id obj = v15;
    id v93 = [obj countByEnumeratingWithState:&v125 objects:v153 count:16];
    if (v93)
    {
      uint64_t v89 = PFAssetBundleFileExtension;
      uint64_t v90 = *(void *)v126;
      uint64_t v94 = PFLivePhotoBundleExtension;
      do
      {
        for (j = 0; j != v93; j = (char *)j + 1)
        {
          if (*(void *)v126 != v90) {
            objc_enumerationMutation(obj);
          }
          id v32 = *(id *)(*((void *)&v125 + 1) + 8 * (void)j);
          v33 = [v32 pathExtension];
          unsigned int v34 = [v33 isEqual:v89];

          v35 = [v32 pathExtension];
          unsigned int v36 = [v35 isEqual:v94];

          if (v34)
          {
            v37 = airdrop_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = [v32 lastPathComponent];
              *(_DWORD *)buf = 138412290;
              v150 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "attempting to send asset bundle %@", buf, 0xCu);
            }
            id v39 = [objc_alloc((Class)PFAssetBundle) initWithAssetBundleAtURL:v32];
            if (v39)
            {
              if (v87)
              {
                v40 = airdrop_log();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = [v32 lastPathComponent];
                  *(_DWORD *)buf = 138412290;
                  v150 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "receiver supports receiving asset bundle %@", buf, 0xCu);
                }
                dispatch_group_enter(group);
                ((void (*)(void *, id, void, void))v97[2])(v97, v32, 0, 0);
                char v42 = 1;
              }
              else
              {
                v43 = airdrop_log();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  v44 = [v32 lastPathComponent];
                  *(_DWORD *)buf = 138412290;
                  v150 = v44;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "receiver does not support receiving asset bundle %@. Conversion required.", buf, 0xCu);
                }
                v45 = +[NSUUID UUID];
                v46 = [v45 UUIDString];

                v47 = [v95 directoryForTemporaryFiles];
                v48 = [v47 URLByAppendingPathComponent:v46];

                id v124 = 0;
                v49 = [v39 writeDowngradedRepresentationToDirectory:v48 error:&v124];
                id v50 = v124;
                if (v50) {
                  BOOL v51 = 1;
                }
                else {
                  BOOL v51 = v49 == 0;
                }
                char v42 = v51;
                if (v51)
                {
                  v52 = airdrop_log();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v150 = v48;
                    __int16 v151 = 2112;
                    id v152 = v50;
                    _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "assetBundle returned NULL for writing downgraded version to URL: %@. Error: %@", buf, 0x16u);
                  }

                  v143[3] = 10;
                  v53 = v137;
                  id v54 = v50;
                  v55 = (void *)v53[5];
                  v53[5] = (uint64_t)v54;
                }
                else
                {
                  v56 = airdrop_log();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    v58 = [v49 lastPathComponent];
                    *(_DWORD *)buf = 138412290;
                    v150 = v58;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "asset bundle was downgraded to: %@", buf, 0xCu);
                  }
                  id v59 = v49;

                  v55 = [v59 pathExtension];
                  unsigned int v36 = [v55 isEqual:v94];
                  id v32 = v59;
                }
              }
            }
            else
            {
              char v42 = 0;
            }
          }
          else
          {
            char v42 = 0;
          }
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472;
          v118[2] = sub_1001AEB88;
          v118[3] = &unk_1008CF890;
          v60 = group;
          v119 = v60;
          id v61 = v92;
          id v120 = v61;
          id v62 = v95;
          id v121 = v62;
          id v63 = v91;
          id v122 = v63;
          v64 = v97;
          id v123 = v64;
          v65 = objc_retainBlock(v118);
          if (v36
            && (id v66 = [objc_alloc((Class)PFVideoComplement) initWithBundleAtURL:v32]) != 0)
          {
            if (v86)
            {
              v67 = airdrop_log();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                v68 = [v32 lastPathComponent];
                *(_DWORD *)buf = 138412290;
                v150 = v68;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "attempting conversion of live photo bundle %@", buf, 0xCu);
              }
              dispatch_group_enter(v60);
              v114[0] = _NSConcreteStackBlock;
              v114[1] = 3221225472;
              v114[2] = sub_1001AEBF0;
              v114[3] = &unk_1008CF8B8;
              v117 = v146;
              id v69 = v32;
              id v115 = v69;
              v116 = v64;
              +[SDAirDropLegacyHelper convertLivePhotoBundleIfNeeded:v69 capabilities:v61 conversionManager:v62 queue:v85 progressHandler:v63 completionHandler:v114];

              v70 = v115;
            }
            else
            {
              v71 = airdrop_log();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                v72 = [v32 lastPathComponent];
                *(_DWORD *)buf = 138412290;
                v150 = v72;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "attempting conversion of extracted photo from live photo bundle %@", buf, 0xCu);
              }
              v70 = [v66 imagePath];
              v73 = +[NSURL fileURLWithPath:v70];
              ((void (*)(void *, void *))v65[2])(v65, v73);
            }
          }
          else if ((v42 & 1) == 0)
          {
            ((void (*)(void *, id))v65[2])(v65, v32);
          }
        }
        id v93 = [obj countByEnumeratingWithState:&v125 objects:v153 count:16];
      }
      while (v93);
    }

    v74 = sub_1001B1BE4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001AECB0;
    block[3] = &unk_1008CF908;
    dispatch_group_t v104 = group;
    v110 = &v142;
    id v109 = v83;
    v111 = &v136;
    BOOL v113 = a9;
    id v16 = v95;
    id v105 = v16;
    id v106 = v80;
    id v107 = v81;
    id v108 = v79;
    v112 = v146;
    id v75 = v79;
    id v76 = v81;
    id v77 = v80;
    v78 = group;
    dispatch_async(v74, block);

    _Block_object_dispose(&v136, 8);
    _Block_object_dispose(&v142, 8);
    _Block_object_dispose(v146, 8);
  }
}

+ (void)convertLivePhotoBundleIfNeeded:(id)a3 capabilities:(id)a4 conversionManager:(id)a5 queue:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001AF09C;
  v15[3] = &unk_1008CF930;
  id v16 = a6;
  id v17 = a8;
  id v13 = v17;
  id v14 = v16;
  +[SDAirDropLegacyHelper convertMediaItemFromURL:a3 forMediaCapabilities:a4 conversionManager:a5 progressHandler:a7 completionHandler:v15];
}

+ (void)convertMediaItemFromURL:(id)a3 forMediaCapabilities:(id)a4 conversionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, id, void, uint64_t))a7;
  uint64_t v16 = +[PHMediaFormatConversionSource sourceForFileURL:v11];
  id v17 = (void *)v16;
  if (!v12 || !v16)
  {
    if (!v16) {
      goto LABEL_15;
    }
    v24 = airdrop_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v17 fileURL];
      v26 = [v25 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      v57 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Assuming no conversion needed for %@", buf, 0xCu);
    }
    uint64_t v27 = [v17 fileURL];
    v28 = (void *)v27;
    if (v27) {
      v29 = (void *)v27;
    }
    else {
      v29 = v11;
    }
    id v30 = v29;

    dispatch_group_t v31 = [v17 fileType];
    if ([v31 isEqualToString:@"com.apple.live-photo-bundle"])
    {
    }
    else
    {
      unsigned int v34 = [v17 fileType];
      unsigned int v35 = [v34 isEqualToString:@"com.apple.private.live-photo-bundle"];

      if (!v35)
      {
        if ([v17 containsVideoWithFormatEligibleForTranscoding]) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = (uint64_t)[v17 containsHEIFImage];
        }
        uint64_t v36 = +[NSNumber numberWithInt:v39];
        goto LABEL_31;
      }
    }
    uint64_t v36 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 containsHEIFImage]);
LABEL_31:
    uint64_t v20 = (void *)v36;
    v15[2](v15, v30, 0, v36);
LABEL_32:

    goto LABEL_33;
  }
  id v55 = 0;
  id v18 = +[PHMediaFormatConversionRequest requestForSource:v16 destinationCapabilities:v12 error:&v55];
  id v19 = v55;
  uint64_t v20 = v19;
  if (v18)
  {
    v44 = v14;
    v45 = v13;
    v21 = [v17 fileURL];
    uint64_t v22 = [v21 lastPathComponent];

    v23 = [v17 fileType];
    if ([v23 isEqualToString:@"com.apple.live-photo-bundle"])
    {
    }
    else
    {
      v37 = [v17 fileType];
      unsigned __int8 v38 = [v37 isEqualToString:@"com.apple.private.live-photo-bundle"];

      if ((v38 & 1) == 0)
      {
        [v18 setLivePhotoPairingIdentifierBehavior:5];
        char v43 = 0;
        goto LABEL_26;
      }
    }
    char v43 = 1;
LABEL_26:
    [v18 setUseTransferBehaviorUserPreference:1];
    v40 = airdrop_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v22;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Determining if conversion required for %@", buf, 0xCu);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1001AF780;
    v46[3] = &unk_1008CF980;
    id v47 = v18;
    v52 = v15;
    id v48 = v11;
    id v49 = v22;
    v41 = v22;
    id v14 = v44;
    id v53 = v44;
    id v13 = v45;
    id v50 = v45;
    id v51 = v17;
    char v54 = v43;
    id v42 = v41;
    id v30 = v18;
    [v50 preflightConversionRequest:v30 completionHandler:v46];

    goto LABEL_32;
  }

LABEL_15:
  uint64_t v32 = [v17 fileURL];
  uint64_t v20 = (void *)v32;
  if (v32) {
    id v33 = (id)v32;
  }
  else {
    id v33 = v11;
  }
  v15[2](v15, v33, 0, 0);
LABEL_33:
}

+ (id)convertWideGamutToClampedPhotoForURLs:(id)a3 outTmpDirectory:(id *)a4
{
  id v4 = a3;
  id v33 = +[NSMutableDictionary dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    id v40 = 0;
    uint64_t v8 = *(void *)v43;
    CFStringRef v9 = kUTTagClassFilenameExtension;
    id v34 = v5;
    uint64_t v37 = *(void *)v43;
    do
    {
      BOOL v10 = 0;
      id v38 = v7;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v10);
        [v11 pathExtension:v33];
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v9, v12, 0);
        if (SFIsImage())
        {
          if (!v40)
          {
            id v40 = +[SDAirDropLegacyHelper tmpDirectory];
            if (a4)
            {
              id v40 = v40;
              *a4 = v40;
            }
          }
          id v14 = [v11 lastPathComponent];
          CFURLRef v15 = [v40 URLByAppendingPathComponent:v14];

          uint64_t v16 = CGImageSourceCreateWithURL((CFURLRef)v11, 0);
          if (v16)
          {
            id v17 = v16;
            CFStringRef Type = CGImageSourceGetType(v16);
            CFURLRef v39 = v15;
            CGImageDestinationRef v19 = CGImageDestinationCreateWithURL(v15, Type, 1uLL, 0);
            if (v19)
            {
              uint64_t v20 = v19;
              CFStringRef v48 = kCGImageSourceShouldCache;
              id v49 = &__kCFBooleanFalse;
              CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
              CFDictionaryRef v22 = CGImageSourceCopyPropertiesAtIndex(v17, 0, v21);

              uint64_t v36 = [(__CFDictionary *)v22 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
              v23 = [(__CFDictionary *)v22 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
              v46[0] = kCGImageDestinationOptimizeColorForSharing;
              v46[1] = kCGImageDestinationImageMaxPixelSize;
              v47[0] = &__kCFBooleanTrue;
              [v36 floatValue];
              float v25 = v24;
              v26 = v23;
              [v23 floatValue];
              if (v25 >= *(float *)&v27) {
                *(float *)&double v27 = v25;
              }
              v28 = +[NSNumber numberWithFloat:v27];
              v47[1] = v28;
              CFDictionaryRef v29 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

              CGImageDestinationAddImageFromSource(v20, v17, 0, v29);
              LODWORD(v28) = CGImageDestinationFinalize(v20);
              CFRelease(v20);

              id v5 = v34;
              CFRelease(v17);
              CFURLRef v15 = v39;
              if (v28)
              {
                id v30 = airdrop_log();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Clamped one image", buf, 2u);
                }

                CFURLRef v15 = v39;
                dispatch_group_t v31 = +[SDAirDropLegacyHelper realPathURL:v39];
                [v33 setObject:v31 forKeyedSubscript:v11];
              }
            }
            else
            {
              CFRelease(v17);
            }
          }

          CFStringRef v9 = kUTTagClassFilenameExtension;
          uint64_t v8 = v37;
          id v7 = v38;
        }

        BOOL v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v7);
  }
  else
  {
    id v40 = 0;
  }

  return v33;
}

+ (id)tmpDirectory
{
  v2 = NSHomeDirectory();
  CFURLRef v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  id v10 = 0;
  id v4 = sub_1001B27DC(v3, &v10);
  id v5 = v10;
  id v6 = airdrop_log();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 path];
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "created temporary directory %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1001B1554();
  }

  return v4;
}

+ (id)preprocessItems:(id)a3 forClientBundleID:(id)a4 receiverIdentifier:(id)a5 receiverSupportsURLs:(BOOL)a6 receiverIsUnknown:(BOOL)a7
{
  BOOL v57 = a7;
  BOOL v58 = a6;
  id v9 = a3;
  id v10 = a4;
  id v59 = a5;
  id v62 = +[NSMutableArray array];
  id v63 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  v60 = +[NSMutableArray array];
  id v12 = objc_alloc_init(SDAirDropPreprocessItemsResult);
  [(SDAirDropPreprocessItemsResult *)v12 setSuccess:1];
  uint64_t v13 = (uint64_t)[v9 count];
  if (v13 >= 1)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    CFTypeRef cf2 = (CFTypeRef)kSFNodeProtocolFile;
    uint64_t v16 = &off_100968000;
    while (1)
    {
      if (![(SDAirDropPreprocessItemsResult *)v12 success]) {
        goto LABEL_78;
      }
      id v17 = [v9 objectAtIndexedSubscript:v15];

      CFTypeID v18 = CFURLGetTypeID();
      if (v18 != CFGetTypeID(v17))
      {
        [v11 addObject:v17];
        if (v17)
        {
          [v63 addObject:v17];
        }
        else
        {
          CFDictionaryRef v29 = airdrop_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v69 = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "### Could not create URL from item %@", buf, 0xCu);
          }
        }
        goto LABEL_49;
      }
      CFStringRef v19 = CFURLCopyScheme((CFURLRef)v17);
      if (!v19)
      {
        id v26 = [v17 absoluteString];
        id v27 = [v26 UTF8String];

        v28 = airdrop_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v69 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "SDAirDropClient: splitOutFileURLs url \"%s\" has no scheme", buf, 0xCu);
        }

        [(SDAirDropPreprocessItemsResult *)v12 setSuccess:0];
        goto LABEL_49;
      }
      CFStringRef v20 = v19;
      if (CFEqual(v19, cf2))
      {
        id v21 = v17;
        CFDictionaryRef v22 = [v21 pathExtension];
        unsigned int v23 = [v22 isEqualToString:@"webloc"];

        if (v23)
        {
          float v24 = +[SDAirDropLegacyHelper webURLFromInternetLocationFile:v21];
          if (v24)
          {
            [v11 addObject:v24];
            float v25 = +[NSURL URLWithString:v24];
            if (v25)
            {
              [v63 addObject:v25];
            }
            else
            {
              id v54 = v10;
              CFURLRef v39 = airdrop_log();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v69 = v24;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "### Could not create URL from webloc string: %@", buf, 0xCu);
              }

              id v10 = v54;
            }
          }
          else
          {
            [v62 addObject:v21];
          }
        }
        else
        {
          [v62 addObject:v21];
        }
        uint64_t v16 = &off_100968000;
        goto LABEL_39;
      }
      uint64_t v30 = ((void (__cdecl *)())v16[488])();
      if (v30)
      {
        dispatch_group_t v31 = (void *)v30;
        id v32 = ((id (__cdecl *)())v16[488])();
        int v33 = CFEqual(v20, v32);

        if (v33) {
          break;
        }
      }
      if (v58
        && (+[SDStatusMonitor sharedMonitor],
            uint64_t v36 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v37 = [v36 enableWebloc],
            v36,
            (v37 & 1) == 0))
      {
        [v11 addObject:CFURLGetString((CFURLRef)v17)];
        if (!v17)
        {
          id v47 = airdrop_log();
          uint64_t v16 = &off_100968000;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v69 = 0;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "### Could not create URL from item %@", buf, 0xCu);
          }

          goto LABEL_48;
        }
        [v63 addObject:v17];
      }
      else
      {
        id v38 = +[SDAirDropLegacyHelper internetLocationFile:v17];
        if (v38)
        {
          [v62 addObject:v38];
          [v60 addObject:v38];
        }
        else
        {
          id v40 = airdrop_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_1001B15BC(&v64, v65, v40);
          }

          [(SDAirDropPreprocessItemsResult *)v12 setSuccess:0];
        }
      }
      uint64_t v16 = &off_100968000;
LABEL_48:
      CFRelease(v20);
LABEL_49:
      if (v14 == ++v15) {
        goto LABEL_78;
      }
    }
    id v34 = airdrop_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found Credential to AirDrop", buf, 2u);
    }

    uint64_t v16 = &off_100968000;
    if ((SFIsAllowedAirDropCredentialClient() & 1) == 0)
    {
      unsigned int v35 = airdrop_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "### Sending credentials from %@ is not permitted", buf, 0xCu);
      }
      goto LABEL_42;
    }
    if (v57)
    {
      unsigned int v35 = airdrop_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1001B15FC(&v66, v67, v35);
      }
LABEL_42:

      [(SDAirDropPreprocessItemsResult *)v12 setSuccess:0];
      goto LABEL_48;
    }
    SFSharablePasswordForURL();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v41 = +[SDAirDropLegacyHelper copyReceiverPublicKeyForIdentifier:](SDAirDropLegacyHelper, "copyReceiverPublicKeyForIdentifier:");
      if (v41
        && (long long v42 = v41,
            SFSharablePasswordAirDropURLEncryptedString(),
            uint64_t v43 = objc_claimAutoreleasedReturnValue(),
            long long v44 = v42,
            long long v45 = (void *)v43,
            CFRelease(v44),
            v45))
      {
        if ([v45 length])
        {
          [v11 addObject:v45];
          id v55 = v45;
          v46 = +[NSURL URLWithString:v45];
          if (v46)
          {
            [v63 addObject:v46];
          }
          else
          {
            v52 = airdrop_log();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v69 = v55;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "### Could not create URL from credential string: %@", buf, 0xCu);
            }

            uint64_t v16 = &off_100968000;
          }

          id v51 = v55;
LABEL_72:

LABEL_39:
          goto LABEL_48;
        }
        id v56 = v21;
        CFStringRef v48 = v45;
      }
      else
      {
        id v56 = v21;
        CFStringRef v48 = 0;
      }
      id v49 = airdrop_log();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
LABEL_71:

        [(SDAirDropPreprocessItemsResult *)v12 setSuccess:0];
        id v51 = v48;
        id v21 = v56;
        goto LABEL_72;
      }
    }
    else
    {
      id v50 = airdrop_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Skipping extra encrypt due to lack of identifier", buf, 2u);
      }

      id v51 = SFSharablePasswordAirDropUnencryptedURL();
      if (v51)
      {
        [v63 addObject:v51];
        goto LABEL_72;
      }
      id v56 = v21;
      CFStringRef v48 = 0;
      id v49 = airdrop_log();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_71;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "### No credential URL to AirDrop?", buf, 2u);
    goto LABEL_71;
  }
LABEL_78:
  if ([(SDAirDropPreprocessItemsResult *)v12 success])
  {
    [(SDAirDropPreprocessItemsResult *)v12 setFiles:v62];
    [(SDAirDropPreprocessItemsResult *)v12 setLinks:v63];
    [(SDAirDropPreprocessItemsResult *)v12 setOtherStuff:v11];
    [(SDAirDropPreprocessItemsResult *)v12 setFilesToCleanup:v60];
  }

  return v12;
}

+ (id)temporaryWeblocURL:(__CFURL *)a3
{
  CFURLRef v4 = sub_1001B2DAC(0, 65537);
  if (v4)
  {
    CFURLRef v5 = v4;
    CFStringRef v6 = CFURLCopyHostName(a3);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
      if (!CFStringHasSuffix(MutableCopy, @".")) {
        CFStringTrim(MutableCopy, @".");
      }
      v19.length = CFStringGetLength(MutableCopy);
      v19.location = 0;
      CFStringFindAndReplace(MutableCopy, @".", @"-", v19, 0);
      CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%@.webloc", MutableCopy);
      if (v9)
      {
        CFStringRef v10 = v9;
        CFURLRef v11 = CFURLCreateWithFileSystemPathRelativeToBase(0, v9, kCFURLPOSIXPathStyle, 0, v5);
        if (v11)
        {
          CFURLRef v12 = v11;
          CFURLRef v13 = CFURLCopyAbsoluteURL(v11);
          CFRelease(v12);
        }
        else
        {
          uint64_t v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1001B16A4();
          }

          CFURLRef v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        CFURLRef v13 = 0;
      }
      CFRelease(MutableCopy);
      CFRelease(v7);
    }
    else
    {
      uint64_t v15 = airdrop_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001B1670();
      }

      CFURLRef v13 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001B163C();
    }

    CFURLRef v13 = 0;
  }

  return v13;
}

+ (id)internetLocationFile:(__CFURL *)a3
{
  +[SDAirDropLegacyHelper temporaryWeblocURL:](SDAirDropLegacyHelper, "temporaryWeblocURL:");
  CFURLRef v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    CFStringRef v5 = CFURLGetString(a3);
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"URL", v5);
    CFStringRef v7 = CFWriteStreamCreateWithFile(0, v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (CFWriteStreamOpen(v7))
      {
        CFErrorRef error = 0;
        if (!CFPropertyListWrite(Mutable, v8, kCFPropertyListBinaryFormat_v1_0, 0, &error))
        {
          CFStringRef v9 = airdrop_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_1001B1740((uint64_t)&error, v9, v10, v11, v12, v13, v14, v15);
          }

          CFRelease(error);
        }
        CFWriteStreamClose(v8);
      }
      else
      {
        id v17 = airdrop_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1001B170C();
        }
      }
      CFRelease(v8);
    }
    else
    {
      uint64_t v16 = airdrop_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001B16D8();
      }
    }
    CFRelease(Mutable);
  }

  return v4;
}

+ (id)webURLFromInternetLocationFile:(id)a3
{
  CFURLRef v3 = +[NSData dataWithContentsOfURL:a3];
  CFURLRef v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];

  CFStringRef v5 = [v4 objectForKeyedSubscript:@"URL"];
  CFStringRef v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

+ (__SecKey)copyReceiverPublicKeyForIdentifier:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001B17B0();
    }
    goto LABEL_12;
  }
  CFURLRef v4 = +[SDStatusMonitor sharedMonitor];
  CFStringRef v5 = (__SecCertificate *)[v4 copyCertificateForRealName:v3];

  if (!v5)
  {
    uint64_t v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001B17E4();
    }
LABEL_12:

    CFStringRef v6 = 0;
    goto LABEL_13;
  }
  CFStringRef v6 = SecCertificateCopyKey(v5);
  if (!v6)
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001B1818();
    }
  }
  CFRelease(v5);
LABEL_13:

  return v6;
}

@end