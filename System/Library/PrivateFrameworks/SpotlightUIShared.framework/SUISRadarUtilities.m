@interface SUISRadarUtilities
+ (id)filePathForCapturedPhotosIndexInfo;
+ (id)filePathForCapturedScreenshot;
+ (id)filePathForWrittenData:(id)a3 to:(id)a4;
+ (id)internalReleaseAgreementText;
+ (id)pathToSpotlightFiles;
+ (id)rankingDiagnosticsFilePath;
+ (id)resultSectionsFilePath;
+ (void)fileRadarWithCommand:(id)a3;
+ (void)logRankingDiagnosticsWithSections:(id)a3;
+ (void)logResultSectionsWithSections:(id)a3 rankingManager:(id)a4;
@end

@implementation SUISRadarUtilities

+ (void)fileRadarWithCommand:(id)a3
{
  v48[7] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08BD0];
  id v4 = a3;
  v46 = [v4 componentName];
  v45 = [v3 queryItemWithName:@"ComponentName" value:v46];
  v48[0] = v45;
  v5 = (void *)MEMORY[0x263F08BD0];
  v44 = [v4 componentVersion];
  v43 = [v5 queryItemWithName:@"ComponentVersion" value:v44];
  v48[1] = v43;
  v6 = (void *)MEMORY[0x263F08BD0];
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "componentID"));
  v41 = [v42 stringValue];
  v40 = [v6 queryItemWithName:@"ComponentID" value:v41];
  v48[2] = v40;
  v7 = (void *)MEMORY[0x263F08BD0];
  v39 = [v4 classification];
  v8 = [v7 queryItemWithName:@"Classification" value:v39];
  v48[3] = v8;
  v9 = (void *)MEMORY[0x263F08BD0];
  v10 = [v4 reproducibility];
  v11 = [v9 queryItemWithName:@"Reproducibility" value:v10];
  v48[4] = v11;
  v12 = (void *)MEMORY[0x263F08BD0];
  v13 = [v4 title];
  v14 = [v12 queryItemWithName:@"Title" value:v13];
  v48[5] = v14;
  v15 = (void *)MEMORY[0x263F08BD0];
  v16 = [v4 problemDescription];
  v17 = [v15 queryItemWithName:@"Description" value:v16];
  v48[6] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:7];
  v19 = (void *)[v18 mutableCopy];

  v20 = [v4 extensionIdentifiers];
  v21 = [v20 componentsJoinedByString:@","];

  v22 = [MEMORY[0x263F08BD0] queryItemWithName:@"ExtensionIdentifiers" value:v21];
  [v19 addObject:v22];

  v23 = [v4 sections];
  v24 = [v4 rankingManager];
  [a1 logResultSectionsWithSections:v23 rankingManager:v24];

  v25 = [v4 sections];

  [a1 logRankingDiagnosticsWithSections:v25];
  v26 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  v27 = [a1 resultSectionsFilePath];
  v28 = [v27 path];
  [v26 addObject:v28];

  v29 = [a1 rankingDiagnosticsFilePath];
  v30 = [v29 path];
  [v26 addObject:v30];

  v31 = +[SUISRadarUtilities filePathForCapturedScreenshot];
  if (v31) {
    [v26 addObject:v31];
  }
  v32 = [v26 componentsJoinedByString:@","];
  v33 = [MEMORY[0x263F08BD0] queryItemWithName:@"Attachments" value:v32];
  [v19 addObject:v33];

  v34 = objc_opt_new();
  [v34 setScheme:@"tap-to-radar"];
  [v34 setHost:@"new"];
  [v34 setQueryItems:v19];
  v35 = (void *)MEMORY[0x263F67C78];
  v36 = (void *)MEMORY[0x263F679B0];
  v37 = [v34 URL];
  v38 = [v36 punchoutWithURL:v37];
  [v35 openPunchout:v38];
}

+ (void)logResultSectionsWithSections:(id)a3 rankingManager:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v25 = a4;
  v6 = [MEMORY[0x263F089D8] string];
  [v6 appendString:@"Results:\n"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v6 appendString:@"\n"];
        v11 = [v10 title];
        v12 = [v10 bundleIdentifier];
        objc_msgSend(v6, "appendFormat:", @"%@ <%@> maxInitiallyVisibleResults: %lu, isInitiallyHidden; %d\n",
          v11,
          v12,
          [v10 maxInitiallyVisibleResults],
          [v10 isInitiallyHidden]);

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v13 = [v10 results];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [*(id *)(*((void *)&v29 + 1) + 8 * j) ttrDescription];
              [v6 appendFormat:@"\t%@", v18];

              [v6 appendString:@"\n"];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v15);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  v19 = [v25 CEPValuesForTTR];
  [v6 appendString:v19];

  v20 = SSDefaultsGetResources();
  v21 = [v20 getTTRLogs];
  [v6 appendString:v21];

  v22 = [a1 resultSectionsFilePath];
  id v28 = 0;
  [v6 writeToURL:v22 atomically:1 encoding:10 error:&v28];
  id v23 = v28;

  if (v23) {
    NSLog(&stru_26E2AB6D8.isa, v23);
  }
}

+ (void)logRankingDiagnosticsWithSections:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v11 = [v10 results];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v56 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = [*(id *)(*((void *)&v55 + 1) + 8 * j) rankingItem];
              [v5 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v7);
  }

  v17 = [MEMORY[0x263F08850] defaultManager];
  v18 = [a1 pathToSpotlightFiles];
  uint64_t v19 = [v18 path];

  v43 = (void *)v19;
  v44 = v17;
  [v17 contentsOfDirectoryAtPath:v19 error:0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v45 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v45);
        }
        v24 = *(void **)(*((void *)&v51 + 1) + 8 * k);
        id v25 = [a1 rankingDiagnosticsFilePath];
        v26 = [v25 pathComponents];
        uint64_t v27 = [v26 lastObject];
        int v28 = [v24 isEqualToString:v27];

        if (v28)
        {
          long long v29 = [NSString stringWithFormat:@"%@/%@", v43, v24];
          [v44 removeItemAtPath:v29 error:0];
        }
      }
      uint64_t v21 = [v45 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v21);
  }
  long long v30 = [a1 rankingDiagnosticsFilePath];
  long long v31 = [v30 path];

  if ([v5 count])
  {
    if ([v31 length])
    {
      [v31 UTF8String];
      uint64_t v32 = json_writer_create_with_path();
      if (v32)
      {
        uint64_t v33 = v32;
        json_writer_begin_array();
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v34 = v5;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v48;
          do
          {
            for (uint64_t m = 0; m != v36; ++m)
            {
              if (*(void *)v48 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void **)(*((void *)&v47 + 1) + 8 * m);
              v40 = [v39 identifier];
              v41 = [v39 L2FeatureVector];
              if ([v40 length]) {
                BOOL v42 = v41 == 0;
              }
              else {
                BOOL v42 = 1;
              }
              if (!v42)
              {
                json_writer_begin_dictionary();
                json_writer_add_key();
                [v40 UTF8String];
                json_writer_add_string();
                [v41 serializeToJSON:v33 options:2];
                json_writer_end_dictionary();
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v63 count:16];
          }
          while (v36);
        }

        json_writer_end_array();
        json_writer_dispose();
      }
    }
  }
}

+ (id)pathToSpotlightFiles
{
  if (pathToSpotlightFiles_onceToken != -1) {
    dispatch_once(&pathToSpotlightFiles_onceToken, &__block_literal_global);
  }
  v2 = (void *)pathToSpotlightFiles_pathToSpotlightFiles;

  return v2;
}

void __42__SUISRadarUtilities_pathToSpotlightFiles__block_invoke()
{
  v0 = NSURL;
  id v3 = [@"~/Library/Application Support/com.apple.spotlight/" stringByExpandingTildeInPath];
  uint64_t v1 = [v0 fileURLWithPath:v3 isDirectory:1];
  v2 = (void *)pathToSpotlightFiles_pathToSpotlightFiles;
  pathToSpotlightFiles_pathToSpotlightFiles = v1;
}

+ (id)rankingDiagnosticsFilePath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUISRadarUtilities_rankingDiagnosticsFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (rankingDiagnosticsFilePath_onceToken != -1) {
    dispatch_once(&rankingDiagnosticsFilePath_onceToken, block);
  }
  v2 = (void *)rankingDiagnosticsFilePath_rankingDiagnosticsFilePath;

  return v2;
}

void __48__SUISRadarUtilities_rankingDiagnosticsFilePath__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pathToSpotlightFiles];
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Spotlight_Ranking_Diagnostic_Log.txt"];
  v2 = (void *)rankingDiagnosticsFilePath_rankingDiagnosticsFilePath;
  rankingDiagnosticsFilePath_rankingDiagnosticsFilePath = v1;
}

+ (id)resultSectionsFilePath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUISRadarUtilities_resultSectionsFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (resultSectionsFilePath_onceToken != -1) {
    dispatch_once(&resultSectionsFilePath_onceToken, block);
  }
  v2 = (void *)resultSectionsFilePath_resultSectionsFilePath;

  return v2;
}

void __44__SUISRadarUtilities_resultSectionsFilePath__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pathToSpotlightFiles];
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Spotlight_Result_Sections_Log.txt"];
  v2 = (void *)resultSectionsFilePath_resultSectionsFilePath;
  resultSectionsFilePath_resultSectionsFilePath = v1;
}

+ (id)filePathForWrittenData:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = NSTemporaryDirectory();
  uint64_t v8 = [v7 stringByAppendingPathComponent:v5];

  v9 = [NSURL fileURLWithPath:v8];
  id v15 = 0;
  char v10 = [v6 writeToURL:v9 options:1 error:&v15];

  id v11 = v15;
  uint64_t v12 = [v9 path];
  uint64_t v13 = (void *)v12;
  if ((v10 & 1) == 0)
  {
    NSLog(&cfstr_FailedToWriteD.isa, v12, v11);

    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)filePathForCapturedScreenshot
{
  id v3 = [MEMORY[0x263F82B60] mainScreen];
  id v4 = [v3 snapshotViewAfterScreenUpdates:0];

  [v4 frame];
  v12.width = v5;
  v12.height = v6;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
  [v4 bounds];
  objc_msgSend(v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  uint64_t v8 = UIImagePNGRepresentation(v7);
  v9 = [a1 filePathForWrittenData:v8 to:@"Spotlight-Tap-To-Radar-Screenshot.png"];

  return v9;
}

+ (id)internalReleaseAgreementText
{
  return @"I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.";
}

+ (id)filePathForCapturedPhotosIndexInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263F08B50]);
  [v3 setLaunchPath:@"/bin/bash"];
  [v3 setArguments:&unk_26E2AC1A8];
  id v4 = [MEMORY[0x263F08A80] pipe];
  [v3 setStandardOutput:v4];
  [v3 launch];
  [v3 waitUntilExit];
  CGFloat v5 = [v4 fileHandleForReading];
  CGFloat v6 = [v5 readDataToEndOfFile];

  uint64_t v7 = [a1 filePathForWrittenData:v6 to:@"search_photos_index_status.txt"];

  return v7;
}

@end