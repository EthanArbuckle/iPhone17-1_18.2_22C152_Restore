@interface NSAttributedString(NTKUtilities)
+ (id)NTKCountdownToDate:()NTKUtilities useShort:withDesignatorFont:;
+ (id)NTKDesignatorAttributedTimeWithDate:()NTKUtilities;
+ (id)NTKHyphenatableString:()NTKUtilities factor:;
+ (id)NTKReplaceTimeDesignatorAttributesFrom:()NTKUtilities withDesignatorFont:;
+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorAttributes:timeZone:options:;
+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorFont:timeZone:options:;
+ (id)_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:format:arguments:;
+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:markdownFormat:;
+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities markdownFormat:;
+ (uint64_t)NTKHyphenatableString:()NTKUtilities;
+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:;
+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:options:;
@end

@implementation NSAttributedString(NTKUtilities)

+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:options:
{
  return [MEMORY[0x1E4F28B18] NTKTimeWithDate:a3 andDesignatorFont:a4 timeZone:0 options:a5];
}

+ (id)NTKDesignatorAttributedTimeWithDate:()NTKUtilities
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F19688];
  v9[0] = MEMORY[0x1E4F1CC38];
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [MEMORY[0x1E4F28B18] NTKTimeWithDate:v4 andDesignatorAttributes:v5 timeZone:0 options:0];

  return v6;
}

+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:
{
  return [MEMORY[0x1E4F28B18] NTKTimeWithDate:a3 andDesignatorFont:a4 options:0];
}

+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorFont:timeZone:options:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    uint64_t v15 = *MEMORY[0x1E4FB06F8];
    v16[0] = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    v12 = 0;
  }
  v13 = [MEMORY[0x1E4F28B18] NTKTimeWithDate:v9 andDesignatorAttributes:v12 timeZone:v11 options:a6];

  return v13;
}

+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorAttributes:timeZone:options:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_TimeFormatterWithDate_onceToken != -1) {
    dispatch_once(&_TimeFormatterWithDate_onceToken, &__block_literal_global_9);
  }
  [(id)_TimeFormatterWithDate___formatter setOverrideDate:v9];
  id v12 = (id)_TimeFormatterWithDate___formatter;
  [v12 _setUseNarrowDesignatorTextForGerman:(a6 >> 1) & 1];
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  }
  [v12 setTimeZone:v11];
  if (a6)
  {
    v13 = [v12 timeText];
    uint64_t v16 = 0;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if ((a6 & 4) != 0)
    {
      v13 = [v12 timeAndDesignatorTextWithoutMinutesIfZero];
      uint64_t v14 = [v12 designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero];
    }
    else
    {
      v13 = [v12 timeAndDesignatorText];
      uint64_t v14 = [v12 designatorRangeInTimeAndDesignatorText];
    }
    uint64_t v17 = v14;
    uint64_t v16 = v15;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13];
  v19 = v18;
  if (v10 && v16) {
    objc_msgSend(v18, "setAttributes:range:", v10, v17, v16);
  }

  return v19;
}

+ (id)NTKReplaceTimeDesignatorAttributesFrom:()NTKUtilities withDesignatorFont:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28E48];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithAttributedString:v7];

  [v8 beginEditing];
  uint64_t v9 = *MEMORY[0x1E4F19688];
  uint64_t v10 = [v8 length];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __94__NSAttributedString_NTKUtilities__NTKReplaceTimeDesignatorAttributesFrom_withDesignatorFont___block_invoke;
  v19 = &unk_1E62C0CA8;
  id v11 = v8;
  id v20 = v11;
  id v21 = v5;
  id v12 = v5;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0x100000, &v16);
  objc_msgSend(v11, "endEditing", v16, v17, v18, v19);
  v13 = v21;
  id v14 = v11;

  return v14;
}

+ (id)NTKCountdownToDate:()NTKUtilities useShort:withDesignatorFont:
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9A8];
  id v9 = a3;
  uint64_t v10 = [v8 currentCalendar];
  id v11 = [MEMORY[0x1E4F196B0] now];
  id v12 = [v10 components:126 fromDate:v11];
  v13 = [v10 components:126 fromDate:v9];

  id v14 = [v10 components:96 fromDateComponents:v12 toDateComponents:v13 options:0];
  uint64_t v15 = [v14 hour];
  uint64_t v16 = [v14 minute];
  if (v15 < 0 || (uint64_t v17 = v16, v16 < 0))
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F28B18]);
    goto LABEL_24;
  }
  if (!(v15 | v16))
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = NTKClockFaceLocalizedString(@"COUNTDOWN_NOW", @"now");
    id v20 = (id)[v18 initWithString:v19];
LABEL_23:

    goto LABEL_24;
  }
  id v20 = (id)objc_opt_new();
  if (v15)
  {
    char v41 = a4;
    if (a4)
    {
      id v21 = @"COUNTDOWN_HOUR_SHORT";
    }
    else
    {
      v22 = @"COUNTDOWN_HOUR_MULTIPLE";
      if (v15 == 1) {
        v22 = @"COUNTDOWN_HOUR_SINGLE";
      }
      id v21 = v22;
    }
    v40 = NTKClockFaceLocalizedString(v21, @"hrs");

    id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
    v24 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%d", v15);
    v25 = (void *)[v23 initWithString:v24];
    [v20 appendAttributedString:v25];

    id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v44 = *MEMORY[0x1E4FB06F8];
    v45[0] = v7;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    v28 = (void *)[v26 initWithString:v40 attributes:v27];

    [v20 appendAttributedString:v28];
    a4 = v41;
  }
  if (v17)
  {
    if ([v20 length])
    {
      char v29 = a4;
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v20 appendAttributedString:v30];

      a4 = v29;
    }
    if (a4)
    {
      v31 = @"COUNTDOWN_MINUTE_SHORT";
    }
    else
    {
      v32 = @"COUNTDOWN_MINUTE_MULTIPLE";
      if (v17 == 1) {
        v32 = @"COUNTDOWN_MINUTE_SINGLE";
      }
      v31 = v32;
    }
    v19 = NTKClockFaceLocalizedString(v31, @"mins");

    id v33 = objc_alloc(MEMORY[0x1E4F28B18]);
    v34 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v17);
    v35 = (void *)[v33 initWithString:v34];
    [v20 appendAttributedString:v35];

    id v36 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v42 = *MEMORY[0x1E4FB06F8];
    id v43 = v7;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v38 = (void *)[v36 initWithString:v19 attributes:v37];

    [v20 appendAttributedString:v38];
    goto LABEL_23;
  }
LABEL_24:

  return v20;
}

+ (uint64_t)NTKHyphenatableString:()NTKUtilities
{
  LODWORD(a3) = NTKHyphenationDefaultFactor;
  return objc_msgSend(a1, "NTKHyphenatableString:factor:", a3);
}

+ (id)NTKHyphenatableString:()NTKUtilities factor:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v5 = (void *)MEMORY[0x1E4FB0848];
    id v6 = a4;
    *(float *)&double v7 = a1;
    uint64_t v8 = [v5 NTKHyphenationParagraphStyleWithFactor:v7];
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v13 = *MEMORY[0x1E4FB0738];
    v14[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = (void *)[v9 initWithString:v6 attributes:v10];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

+ (id)_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:format:arguments:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:a6];
  id v13 = objc_alloc_init(MEMORY[0x1E4F28B20]);
  [v13 setAllowsExtendedAttributes:1];
  v40[0] = 0;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithMarkdownString:v12 options:v13 baseURL:0 error:v40];
  id v15 = v40[0];
  uint64_t v16 = v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    uint64_t v20 = [v14 length];
    id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
    v22 = [v14 string];
    id v23 = (void *)[v21 initWithString:v22 attributes:v10];

    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke;
    aBlock[3] = &unk_1E62C0CD0;
    id v33 = v9;
    v35 = &v36;
    id v18 = v23;
    v34 = v18;
    v24 = _Block_copy(aBlock);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_2;
    v30[3] = &unk_1E62C0CF8;
    id v25 = v24;
    id v31 = v25;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", @"attributes", 0, v20, 0, v30);
    v37[3] = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_3;
    v28[3] = &unk_1E62C0D20;
    id v26 = v25;
    id v29 = v26;
    objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v20, 0, v28);
    id v19 = [v18 copy];

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    id v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[NSAttributedString(NTKUtilities) _attributedStringFromAttributesTable:defaultAttributes:format:arguments:]((uint64_t)v16, v18);
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:markdownFormat:
{
  id v9 = objc_msgSend(a1, "ntk_attributedStringFromAttributesTable:defaultAttributes:markdownFormat:arguments:", a3, a4, a5, &a9);
  return v9;
}

+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities markdownFormat:
{
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 objectForKeyedSubscript:@"default"];
  id v14 = objc_msgSend(a1, "ntk_attributedStringFromAttributesTable:defaultAttributes:markdownFormat:arguments:", v12, v13, v11, &a9);

  return v14;
}

+ (void)_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:format:arguments:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "parsing markdown failed, error = %@", (uint8_t *)&v2, 0xCu);
}

@end