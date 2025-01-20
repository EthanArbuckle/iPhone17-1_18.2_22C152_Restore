@interface CACVocabularyImportExportUtilities
+ (id)_localeIdentifiersRepresentedByVocabularyEntries:(id)a3;
+ (id)_vocabularyEntriesFromSimpleTextListString:(id)a3 usingLocaleIdentifier:(id)a4;
+ (id)defaultExportURL;
+ (id)exportToURL:(id)a3;
+ (id)importFromURL:(id)a3;
+ (unint64_t)_importVocabularyEntries:(id)a3 didFindOverflow:(BOOL *)a4;
+ (unint64_t)maximumNumberOfAllowedEntries;
@end

@implementation CACVocabularyImportExportUtilities

+ (unint64_t)maximumNumberOfAllowedEntries
{
  return 1000;
}

+ (id)defaultExportURL
{
  v2 = NSURL;
  v3 = NSString;
  v4 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.defaultExportedFileName"];
  v5 = [v3 stringWithFormat:@"~/%@", v4];
  v6 = [v5 stringByExpandingTildeInPath];
  v7 = [v6 stringByAppendingPathExtension:kCACVocabularyFileExtensionVCVocabulary];
  v8 = [v2 fileURLWithPath:v7 isDirectory:0];

  return v8;
}

+ (id)_localeIdentifiersRepresentedByVocabularyEntries:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "objectForKey:", @"LocaleIdentifier", (void)v15);
        v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = @"en_US";
        }
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = [v4 allObjects];

  return v13;
}

+ (id)_vocabularyEntriesFromSimpleTextListString:(id)a3 usingLocaleIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x263EFF980] array];
  v30 = v6;
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = [v5 componentsSeparatedByString:@"\r"];
    uint64_t v8 = [v5 componentsSeparatedByString:@"\n"];
    v9 = [v5 componentsSeparatedByString:@"\r\n"];
    unint64_t v10 = [v9 count];
    v29 = v7;
    v27 = v9;
    v28 = v8;
    if (v10 >= [v7 count])
    {
      unint64_t v11 = objc_msgSend(v9, "count", v9, v8, v7);
      unint64_t v12 = [v8 count];
      v13 = v9;
      if (v11 >= v12) {
        goto LABEL_6;
      }
    }
    unint64_t v14 = objc_msgSend(v7, "count", v27);
    unint64_t v15 = [v8 count];
    v13 = v7;
    if (v14 > v15 || (id v16 = (id)[v8 count], v13 = v8, v16)) {
LABEL_6:
    }
      id v16 = v13;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v22 length])
          {
            v23 = [MEMORY[0x263EFF9A0] dictionary];
            [v23 setObject:v22 forKey:@"Text"];
            [v23 setObject:v30 forKey:@"LocaleIdentifier"];
            v24 = NSNumber;
            [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
            v25 = objc_msgSend(v24, "numberWithDouble:");
            [v23 setObject:v25 forKey:@"CreationDate"];

            [v31 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }
  }
  return v31;
}

+ (unint64_t)_importVocabularyEntries:(id)a3 didFindOverflow:(BOOL *)a4
{
  v51 = a4;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v54 = [MEMORY[0x263EFF9A0] dictionary];
  v59 = +[CACPreferences sharedPreferences];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v64 = [MEMORY[0x263EFF9A0] dictionary];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v52 = v4;
  obuint64_t j = +[CACVocabularyImportExportUtilities _localeIdentifiersRepresentedByVocabularyEntries:v4];
  v60 = v5;
  uint64_t v57 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v57)
  {
    id v55 = *(id *)v82;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(id *)v82 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v6;
        uint64_t v7 = *(void *)(*((void *)&v81 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "array", v51);
        [v64 setObject:v8 forKey:v7];
        v9 = [MEMORY[0x263EFF9C0] set];
        [v5 setObject:v9 forKey:v7];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        unint64_t v10 = [v59 vocabularyEntriesForLocaleIdentifier:v7];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v88 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v78 != v13) {
                objc_enumerationMutation(v10);
              }
              unint64_t v15 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              id v16 = [v15 objectForKey:@"Text"];
              id v17 = [v16 lowercaseString];
              [v9 addObject:v17];

              [v8 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v77 objects:v88 count:16];
          }
          while (v12);
        }

        id v5 = v60;
        uint64_t v6 = v61 + 1;
      }
      while (v61 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v57);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v56 = v52;
  uint64_t v62 = [v56 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v62)
  {
    uint64_t v58 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v62; ++j)
      {
        if (*(void *)v74 != v58) {
          objc_enumerationMutation(v56);
        }
        uint64_t v19 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v19];
        v21 = [v19 objectForKey:@"LocaleIdentifier"];
        if (!v21)
        {
          v21 = @"en_US";
          [v20 setObject:@"en_US" forKey:@"LocaleIdentifier"];
        }
        v22 = objc_msgSend(v5, "objectForKey:", v21, v51);
        v23 = [v19 objectForKey:@"Text"];
        v24 = [v23 lowercaseString];

        if (v22)
        {
          if (!v24 || ([v22 containsObject:v24] & 1) != 0) {
            goto LABEL_30;
          }
        }
        else
        {
          v22 = [MEMORY[0x263EFF9C0] set];
          [v5 setObject:v22 forKey:v21];
        }
        v25 = [v64 objectForKey:v21];
        if (!v25)
        {
          v25 = [MEMORY[0x263EFF980] array];
          [v64 setObject:v25 forKey:v21];
        }
        [v22 addObject:v24];
        [v25 addObject:v20];
        v26 = NSNumber;
        v27 = [v54 objectForKey:v21];
        v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        [v54 setObject:v28 forKey:v21];

        id v5 = v60;
LABEL_30:
      }
      uint64_t v62 = [v56 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v62);
  }

  unint64_t v63 = +[CACVocabularyImportExportUtilities maximumNumberOfAllowedEntries];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v29 = [v54 allKeys];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    unint64_t v32 = 0;
    uint64_t v33 = *(void *)v70;
    while (2)
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v70 != v33) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * k);
        v36 = objc_msgSend(v64, "objectForKey:", v35, v51);
        unint64_t v37 = [v36 count];

        v38 = [v54 objectForKey:v35];
        unint64_t v39 = [v38 integerValue] + v37;

        if (v39 > v63)
        {
          if (v63 >= v37) {
            unint64_t v32 = v63 - v37;
          }
          else {
            unint64_t v32 = 0;
          }
          char v41 = 1;
          v42 = v51;
          v43 = v54;
          goto LABEL_55;
        }
        v40 = [v54 objectForKey:v35];
        v32 += [v40 integerValue];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v69 objects:v86 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v32 = 0;
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v29 = [v64 allKeys];
  uint64_t v44 = [v29 countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v66;
    v42 = v51;
    v43 = v54;
    do
    {
      for (uint64_t m = 0; m != v45; ++m)
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(v29);
        }
        uint64_t v48 = *(void *)(*((void *)&v65 + 1) + 8 * m);
        v49 = objc_msgSend(v64, "objectForKey:", v48, v51);
        [v59 setVocabularyEntries:v49 forLocaleIdentifier:v48];
      }
      uint64_t v45 = [v29 countByEnumeratingWithState:&v65 objects:v85 count:16];
    }
    while (v45);
    char v41 = 0;
  }
  else
  {
    char v41 = 0;
    v42 = v51;
    v43 = v54;
  }
LABEL_55:

  if (v42) {
    unsigned char *v42 = v41;
  }

  return v32;
}

+ (id)importFromURL:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v11 = 0;
    goto LABEL_32;
  }
  id v4 = [MEMORY[0x263F1D920] typeWithFilenameExtension:kCACVocabularyFileExtensionVCVocabulary];
  id v39 = 0;
  uint64_t v5 = *MEMORY[0x263EFF608];
  id v38 = 0;
  int v6 = [v3 getResourceValue:&v39 forKey:v5 error:&v38];
  id v7 = v39;
  id v8 = v38;
  if (!v6) {
    goto LABEL_12;
  }
  if ([v7 conformsToType:*MEMORY[0x263F1DC20]])
  {
    id v37 = v8;
    v9 = (void *)[[NSString alloc] initWithContentsOfURL:v3 encoding:4 error:&v37];
    id v10 = v37;

    if (v10)
    {
      uint64_t v11 = [[CACImportExportResult alloc] initWithError:v10 title:0 message:0];
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    if (v9)
    {
      id v33 = v7;
      long long v34 = v4;
      id v16 = +[CACPreferences sharedPreferences];
      id v17 = [v16 bestLocaleIdentifier];
      unint64_t v15 = +[CACVocabularyImportExportUtilities _vocabularyEntriesFromSimpleTextListString:v9 usingLocaleIdentifier:v17];

      uint64_t v12 = 0;
LABEL_20:
      id v8 = 0;
LABEL_21:
      unsigned __int8 v35 = 0;
      unint64_t v18 = +[CACVocabularyImportExportUtilities _importVocabularyEntries:v15 didFindOverflow:&v35];
      int v19 = v35;
      uint64_t v20 = [CACImportExportResult alloc];
      if (v19)
      {
        v21 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.importOverflowFailAlertTitle"];
        uint64_t v11 = [(CACImportExportResult *)v20 initWithError:0 title:v21 message:0];

        if (v18)
        {
          v22 = NSString;
          v23 = @"VocabularyImportExport.importOverflowFailAlertDescription";
LABEL_26:
          v25 = +[CACLocaleUtilities localizedUIStringForKey:v23];
          v26 = objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v25, @"%ld", 0, v18);
          [(CACImportExportResult *)v11 setMessage:v26];

LABEL_30:
          id v7 = v33;
          id v4 = v34;

          goto LABEL_31;
        }
        v27 = @"VocabularyImportExport.importOverflowFailNoNewAlertDescription";
      }
      else
      {
        v24 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.importCompleteAlertTitle"];
        uint64_t v11 = [(CACImportExportResult *)v20 initWithError:0 title:v24 message:0];

        if (v18)
        {
          v22 = NSString;
          v23 = @"VocabularyImportExport.importCompleteAlertDescription";
          goto LABEL_26;
        }
        v27 = @"VocabularyImportExport.importCompleteAlertDescriptionNoEntries";
      }
      v25 = +[CACLocaleUtilities localizedUIStringForKey:v27];
      [(CACImportExportResult *)v11 setMessage:v25];
      goto LABEL_30;
    }
    v29 = [CACImportExportResult alloc];
    uint64_t v30 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.cannotReadFile"];
    uint64_t v11 = [(CACImportExportResult *)v29 initWithError:0 title:v30 message:0];

    id v8 = 0;
    goto LABEL_13;
  }
  if (![v7 conformsToType:v4])
  {
LABEL_12:
    uint64_t v13 = [CACImportExportResult alloc];
    unint64_t v14 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.cannotReadFile"];
    uint64_t v11 = [(CACImportExportResult *)v13 initWithError:0 title:v14 message:0];

LABEL_13:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  id v36 = v8;
  uint64_t v12 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v3 error:&v36];
  id v10 = v36;

  if (v10)
  {
    uint64_t v11 = [[CACImportExportResult alloc] initWithError:v10 title:0 message:0];
    v9 = 0;
LABEL_10:
    id v8 = v10;
    if (!v11) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
  if (v12)
  {
    id v33 = v7;
    long long v34 = v4;
    unint64_t v15 = [v12 objectForKey:@"CACVocabularyEntries"];
    v9 = 0;
    goto LABEL_20;
  }
  uint64_t v31 = [CACImportExportResult alloc];
  unint64_t v32 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.cannotReadFile"];
  uint64_t v11 = [(CACImportExportResult *)v31 initWithError:0 title:v32 message:0];

  id v8 = 0;
LABEL_14:
  v9 = 0;
  if (!v11)
  {
LABEL_15:
    id v33 = v7;
    long long v34 = v4;
    unint64_t v15 = 0;
    goto LABEL_21;
  }
LABEL_31:

LABEL_32:
  return v11;
}

+ (id)exportToURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[CACPreferences sharedPreferences];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    int v6 = [v4 bestLocaleIdentifier];
    id v7 = [v4 vocabularyEntriesForLocaleIdentifier:v6];
    [v5 addObjectsFromArray:v7];

    if ([v5 count])
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      v9 = NSNumber;
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      id v10 = objc_msgSend(v9, "numberWithDouble:");
      [v8 setObject:v10 forKey:@"ExportDate"];

      id v11 = objc_alloc(NSDictionary);
      uint64_t v12 = [NSURL fileURLWithPath:@"/System/Library/CoreServices/SystemVersion.plist"];
      uint64_t v13 = (void *)[v11 initWithContentsOfURL:v12 error:0];

      if (v13) {
        [v8 setObject:v13 forKey:@"SystemVersion"];
      }
      [v8 setObject:v5 forKey:@"CACVocabularyEntries"];
      id v21 = 0;
      [v8 writeToURL:v3 error:&v21];
      id v14 = v21;
      if (v14) {
        unint64_t v15 = [[CACImportExportResult alloc] initWithError:v14 title:0 message:0];
      }
      else {
        unint64_t v15 = 0;
      }
    }
    else
    {
      unint64_t v18 = [CACImportExportResult alloc];
      int v19 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.exportNoEntriesAlertTitle"];
      unint64_t v15 = [(CACImportExportResult *)v18 initWithError:0 title:v19 message:0];
    }
  }
  else
  {
    id v16 = [CACImportExportResult alloc];
    id v17 = +[CACLocaleUtilities localizedUIStringForKey:@"VocabularyImportExport.failedToCreateURL"];
    unint64_t v15 = [(CACImportExportResult *)v16 initWithError:0 title:v17 message:0];
  }
  return v15;
}

@end