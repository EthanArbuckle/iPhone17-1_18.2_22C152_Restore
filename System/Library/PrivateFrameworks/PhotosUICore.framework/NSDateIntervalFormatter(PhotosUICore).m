@interface NSDateIntervalFormatter(PhotosUICore)
- (__CFString)px_dateTemplateForGranularity:()PhotosUICore abbreviated:onlyCalendarUnit:;
- (id)_px_localizedCapitalizedString:()PhotosUICore;
- (id)_px_substitutions;
- (id)px_attributedStringFromDateInterval:()PhotosUICore defaultAttributes:emphasizedAttributes:;
- (uint64_t)_px_isChineseYearTemplate;
- (uint64_t)px_customizesAttributedString;
- (uint64_t)px_dateTemplateForGranularity:()PhotosUICore abbreviated:;
@end

@implementation NSDateIntervalFormatter(PhotosUICore)

- (__CFString)px_dateTemplateForGranularity:()PhotosUICore abbreviated:onlyCalendarUnit:
{
  if (a3 == 4)
  {
    v5 = @"y";
  }
  else
  {
    if (a3 == 8)
    {
      v6 = @"MMMMy";
      if (a4) {
        v6 = @"MMMy";
      }
      v7 = @"MMM";
      if (!a4) {
        v7 = @"MMMM";
      }
      if (a5) {
        v6 = v7;
      }
    }
    else
    {
      if (a3 != 16)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSDateIntervalFormatter+PhotosUICore.m", 49, @"unsupported granularity %i", a3);

        abort();
      }
      if (a5)
      {
        v5 = @"d";
        goto LABEL_17;
      }
      v6 = @"dMMMMy";
      if (a4) {
        v6 = @"dMMMy";
      }
    }
    v5 = v6;
  }
LABEL_17:
  return v5;
}

- (uint64_t)px_dateTemplateForGranularity:()PhotosUICore abbreviated:
{
  return objc_msgSend(a1, "px_dateTemplateForGranularity:abbreviated:onlyCalendarUnit:", a3, a4, 0);
}

- (id)px_attributedStringFromDateInterval:()PhotosUICore defaultAttributes:emphasizedAttributes:
{
  id v8 = a3;
  id v64 = a4;
  id v9 = a5;
  v10 = [a1 dateTemplate];
  v63 = [a1 locale];
  v11 = [v63 languageCode];
  if (!objc_msgSend(a1, "_px_isChineseYearTemplate")) {
    goto LABEL_6;
  }
  v12 = [a1 calendar];
  v13 = [v8 startDate];
  v14 = [v12 components:4 fromDate:v13];

  v15 = [v8 endDate];
  v16 = [v12 components:4 fromDate:v15];

  uint64_t v17 = [v14 year];
  if (v17 == [v16 year])
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%li至%li", objc_msgSend(v14, "year"), objc_msgSend(v16, "year"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (!v18)
  {
LABEL_6:
    uint64_t v19 = [a1 stringFromDateInterval:v8];
    v20 = (void *)v19;
    v21 = &stru_1F00B0030;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v18 = v21;
  }
  v22 = objc_msgSend(a1, "_px_substitutions");
  if ([v22 count])
  {
    v23 = (void *)[(__CFString *)v18 mutableCopy];
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    char v92 = 0;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke;
    v86[3] = &unk_1E5DB5170;
    id v24 = v23;
    id v87 = v24;
    v88 = &v89;
    [v22 enumerateKeysAndObjectsUsingBlock:v86];
    if (*((unsigned char *)v90 + 24))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_2;
      aBlock[3] = &unk_1E5DB5198;
      id v85 = v24;
      v25 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
      v25[2](v25, @"  ", @" ");
      v25[2](v25, @"  ", @" ");
      v25[2](v25, @"  ", @" ");
      v25[2](v25, @"  ", @" ");
    }
    v26 = (__CFString *)v24;

    _Block_object_dispose(&v89, 8);
    v18 = v26;
  }
  v27 = objc_msgSend(a1, "_px_localizedCapitalizedString:", v18);

  if ([v10 isEqualToString:@"MMMMy"])
  {
    v61 = v10;
    v59 = v22;
    if (px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__onceToken != -1) {
      dispatch_once(&px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__onceToken, &__block_literal_global_66121);
    }
    v28 = [(id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages objectForKeyedSubscript:v11];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_4;
    v81[3] = &unk_1E5DB51C0;
    v58 = v27;
    id v29 = v27;
    id v82 = v29;
    id v83 = v28;
    id v56 = v28;
    v30 = _Block_copy(v81);
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v29 attributes:v9];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_5;
    v76[3] = &unk_1E5DB51E8;
    id v32 = v29;
    id v77 = v32;
    id v80 = v30;
    id v33 = v31;
    id v78 = v33;
    v62 = v9;
    id v34 = v64;
    id v79 = v34;
    id v57 = v30;
    v35 = (void (**)(void *, void *))_Block_copy(v76);
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_6;
    v72[3] = &unk_1E5DB5238;
    id v36 = v32;
    id v73 = v36;
    id v37 = v33;
    id v74 = v37;
    id v38 = v34;
    id v75 = v38;
    v39 = (void (**)(void *, id))_Block_copy(v72);
    id v40 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v41 = [a1 locale];
    [v40 setLocale:v41];

    [v40 setDateFormat:@"y"];
    v42 = [v8 startDate];
    [v40 stringFromDate:v42];
    v44 = v43 = v8;
    v60 = v11;
    v35[2](v35, v44);

    v45 = [v43 endDate];
    v46 = [v40 stringFromDate:v45];
    v35[2](v35, v46);

    v39[2](v39, v56);
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_8;
    v70[3] = &unk_1E5DB5260;
    id v71 = v36;
    v47 = _Block_copy(v70);
    uint64_t v48 = [v37 length];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_9;
    v65[3] = &unk_1E5DB5288;
    id v49 = v38;
    id v9 = v62;
    id v66 = v49;
    id v69 = v47;
    id v50 = v37;
    id v67 = v50;
    id v68 = v62;
    id v51 = v47;
    uint64_t v52 = v48;
    id v8 = v43;
    objc_msgSend(v50, "enumerateAttributesInRange:options:usingBlock:", 0, v52, 0, v65);
    v53 = v68;
    id v54 = v50;

    v11 = v60;
    v27 = v58;

    v10 = v61;
    v22 = v59;
  }
  else
  {
    id v54 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v27 attributes:v9];
  }

  return v54;
}

- (id)_px_substitutions
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke;
  v13 = &unk_1E5DD08D8;
  v14 = a1;
  uint64_t v15 = a2;
  if (_px_substitutions_onceToken != -1) {
    dispatch_once(&_px_substitutions_onceToken, &v10);
  }
  v3 = objc_msgSend(a1, "locale", v10, v11, v12, v13, v14, v15);
  v4 = [v3 localeIdentifier];

  v5 = [(id)_px_substitutions_substitutionsByLocaleIdentifier objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = (void *)_px_substitutions_substitutionsByLocaleIdentifier;
    v7 = [v4 componentsSeparatedByString:@"_"];
    id v8 = [v7 firstObject];
    v5 = [v6 objectForKeyedSubscript:v8];
  }
  return v5;
}

- (id)_px_localizedCapitalizedString:()PhotosUICore
{
  id v4 = a3;
  if (_px_localizedCapitalizedString__onceToken != -1) {
    dispatch_once(&_px_localizedCapitalizedString__onceToken, &__block_literal_global_149);
  }
  v5 = [a1 locale];
  uint64_t v6 = _px_localizedCapitalizedString__languagesWithCustomCapitalization;
  v7 = [v5 languageCode];
  LOBYTE(v6) = [(id)v6 containsObject:v7];

  if (v6)
  {
    id v8 = (void *)[v4 mutableCopy];
    if (_px_localizedCapitalizedString__token != -1) {
      dispatch_once(&_px_localizedCapitalizedString__token, &__block_literal_global_178);
    }
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 1;
    uint64_t v9 = [v4 length];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_3;
    v14[3] = &unk_1E5DB52B0;
    v18 = v19;
    id v10 = v8;
    id v15 = v10;
    id v16 = v5;
    id v17 = v4;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 3, v14);
    id v11 = v17;
    id v12 = v10;

    _Block_object_dispose(v19, 8);
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

- (uint64_t)_px_isChineseYearTemplate
{
  v2 = [a1 locale];
  v3 = [v2 languageCode];

  id v4 = [a1 dateTemplate];
  if ([v4 isEqualToString:@"y"])
  {
    if ([v3 isEqualToString:@"yue"]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v3 isEqualToString:@"zh"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)px_customizesAttributedString
{
  if (objc_msgSend(a1, "_px_isChineseYearTemplate")) {
    return 1;
  }
  v3 = objc_msgSend(a1, "_px_substitutions");
  BOOL v2 = [v3 count] != 0;

  return v2;
}

@end