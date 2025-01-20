@interface CACCommandImportExportUtilities
+ (BOOL)isSupportedCommandType:(id)a3;
+ (id)defaultExportURL;
+ (id)exportToURL:(id)a3;
+ (id)importFromURL:(id)a3;
+ (unint64_t)maximumNumberOfAllowedEntries;
@end

@implementation CACCommandImportExportUtilities

+ (unint64_t)maximumNumberOfAllowedEntries
{
  return 1000;
}

+ (BOOL)isSupportedCommandType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [&unk_26EB4D100 containsObject:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)defaultExportURL
{
  v2 = NSURL;
  id v3 = NSString;
  char v4 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.defaultExportedFileName"];
  v5 = [v3 stringWithFormat:@"~/%@", v4];
  v6 = [v5 stringByExpandingTildeInPath];
  v7 = [v6 stringByAppendingPathExtension:kCACCommandsFileExtensionVCCommands];
  v8 = [v2 fileURLWithPath:v7 isDirectory:0];

  return v8;
}

+ (id)importFromURL:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = [MEMORY[0x263F1D920] typeWithFilenameExtension:kCACCommandsFileExtensionVCCommands];
  id v82 = 0;
  uint64_t v5 = *MEMORY[0x263EFF608];
  id v81 = 0;
  int v6 = [v3 getResourceValue:&v82 forKey:v5 error:&v81];
  id v7 = v82;
  id v8 = v81;
  if (!v6 || ![v7 conformsToType:v4])
  {
    v15 = [CACImportExportResult alloc];
    v16 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.cannotReadFile"];
    v17 = [(CACImportExportResult *)v15 initWithError:v8 title:v16 message:0];

    uint64_t v9 = 0;
    if (!v8)
    {
LABEL_8:
      v14 = v17;
      goto LABEL_9;
    }
LABEL_6:
    v18 = [[CACImportExportResult alloc] initWithError:v8 title:0 message:0];
    goto LABEL_36;
  }
  id v80 = v8;
  uint64_t v9 = [objc_alloc(NSDictionary) initWithContentsOfURL:v3 error:&v80];
  unint64_t v10 = (unint64_t)v80;

  if (v9 | v10)
  {
    v17 = 0;
    id v8 = (id)v10;
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v11 = [CACImportExportResult alloc];
  v12 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.cannotReadFile"];
  uint64_t v13 = [(CACImportExportResult *)v11 initWithError:0 title:v12 message:0];

  v14 = (void *)v13;
  uint64_t v9 = 0;
LABEL_9:
  if (objc_opt_respondsToSelector())
  {
    v17 = [(id)v9 objectForKey:kCACCommandsFileExportCommandsKey];
  }
  else
  {
    v17 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(CACImportExportResult *)v17 count])
  {
    v60 = v14;
    uint64_t v61 = v9;
    id v62 = v7;
    v63 = v4;
    id v64 = v3;
    v67 = [MEMORY[0x263EFF9A0] dictionary];
    v66 = [MEMORY[0x263EFF9A0] dictionary];
    v65 = +[CACPreferences sharedPreferences];
    v19 = [v65 allCustomCommandProperties];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = [(CACImportExportResult *)v17 allKeys];
    uint64_t v20 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
    unint64_t v21 = 0x264D10000uLL;
    v68 = v19;
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v77 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          v26 = [(CACImportExportResult *)v17 objectForKey:v25];
          unint64_t v27 = v21;
          v28 = *(void **)(v21 + 2720);
          v29 = [v26 objectForKey:@"CustomType"];
          LODWORD(v28) = [v28 isSupportedCommandType:v29];

          if (v28)
          {
            v30 = [v19 objectForKey:v25];
            v31 = v30;
            if (v30)
            {
              v32 = v17;
              v33 = [v30 objectForKey:@"CustomModifyDate"];
              v34 = [v26 objectForKey:@"CustomModifyDate"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 compare:v34] == -1) {
                  [v66 setObject:v26 forKey:v25];
                }
              }

              v17 = v32;
              v19 = v68;
            }
            else
            {
              [v67 setObject:v26 forKey:v25];
            }
          }
          unint64_t v21 = v27;
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
      }
      while (v22);
    }

    uint64_t v35 = [v19 count];
    v36 = v67;
    unint64_t v37 = [v67 count] + v35;
    if (v37 <= [*(id *)(v21 + 2720) maximumNumberOfAllowedEntries])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__CACCommandImportExportUtilities_importFromURL___block_invoke;
      block[3] = &unk_264D117C0;
      id v44 = v65;
      id v74 = v44;
      id v45 = v67;
      id v75 = v45;
      v46 = MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], block);
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __49__CACCommandImportExportUtilities_importFromURL___block_invoke_2;
      v70[3] = &unk_264D117C0;
      id v71 = v44;
      v42 = v66;
      id v47 = v66;
      id v72 = v47;
      dispatch_async(v46, v70);

      uint64_t v48 = [v45 count];
      uint64_t v49 = [v47 count] + v48;
      v50 = [CACImportExportResult alloc];
      v51 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importCompleteAlertTitle"];
      v18 = [(CACImportExportResult *)v50 initWithError:0 title:v51 message:0];

      id v7 = v62;
      if (v49)
      {
        v52 = NSString;
        v53 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importCompleteAlertDescription"];
        v54 = objc_msgSend(v52, "stringWithValidatedFormat:validFormatSpecifiers:error:", v53, @"%ld", 0, v49);
        [(CACImportExportResult *)v18 setMessage:v54];
      }
      else
      {
        v53 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importCompleteAlertDescriptionNoEntries"];
        [(CACImportExportResult *)v18 setMessage:v53];
      }
      char v4 = v63;
      id v3 = v64;
      uint64_t v9 = v61;

      v58 = v74;
    }
    else
    {
      unint64_t v38 = [v19 count];
      id v7 = v62;
      if (v38 >= [*(id *)(v21 + 2720) maximumNumberOfAllowedEntries])
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v39 = [*(id *)(v21 + 2720) maximumNumberOfAllowedEntries];
        uint64_t v40 = v39 - [v19 count];
      }
      char v4 = v63;
      id v3 = v64;
      v55 = [CACImportExportResult alloc];
      v56 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importOverflowFailAlertTitle"];
      v18 = [(CACImportExportResult *)v55 initWithError:0 title:v56 message:0];

      if (v40)
      {
        v57 = NSString;
        v58 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importOverflowFailAlertDescription"];
        v59 = objc_msgSend(v57, "stringWithValidatedFormat:validFormatSpecifiers:error:", v58, @"%ld", 0, v40);
        [(CACImportExportResult *)v18 setMessage:v59];
      }
      else
      {
        v58 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importOverflowFailNoNewAlertDescription"];
        [(CACImportExportResult *)v18 setMessage:v58];
      }
      uint64_t v9 = v61;
      v42 = v66;
    }
  }
  else
  {
    v41 = [CACImportExportResult alloc];
    v36 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.importCompleteAlertDescriptionNoEntries"];
    v18 = [(CACImportExportResult *)v41 initWithError:0 title:v36 message:0];
    v42 = v14;
  }

  id v8 = 0;
LABEL_36:

  return v18;
}

uint64_t __49__CACCommandImportExportUtilities_importFromURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOrUpdateCommandPropertiesFromImportedTable:*(void *)(a1 + 40)];
}

uint64_t __49__CACCommandImportExportUtilities_importFromURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOrUpdateCommandPropertiesFromImportedTable:*(void *)(a1 + 40)];
}

+ (id)exportToURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = +[CACPreferences sharedPreferences];
    uint64_t v5 = [v4 allCustomCommandProperties];

    if ([v5 count])
    {
      int v6 = [MEMORY[0x263EFF9A0] dictionary];
      id v7 = NSNumber;
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      id v8 = objc_msgSend(v7, "numberWithDouble:");
      [v6 setObject:v8 forKey:kCACCommandsFileExportDateKey];

      id v9 = objc_alloc(NSDictionary);
      unint64_t v10 = [NSURL fileURLWithPath:@"/System/Library/CoreServices/SystemVersion.plist"];
      v11 = (void *)[v9 initWithContentsOfURL:v10 error:0];

      if (v11) {
        [v6 setObject:v11 forKey:kCACCommandsFileExportSystemKey];
      }
      [v6 setObject:v5 forKey:kCACCommandsFileExportCommandsKey];
      id v17 = 0;
      [v6 writeToURL:v3 error:&v17];
      id v12 = v17;
      if (v12) {
        uint64_t v13 = [[CACImportExportResult alloc] initWithError:v12 title:0 message:0];
      }
      else {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    v14 = [CACImportExportResult alloc];
    v15 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandImportExport.failedToCreateURL"];
    uint64_t v13 = [(CACImportExportResult *)v14 initWithError:0 title:v15 message:0];
  }
  return v13;
}

@end