@interface CRDataDetectorUtilities
+ (BOOL)_shouldGroupAllEntitiesFor:(id)a3 lines:(id)a4;
+ (_NSRange)_mappedUrlificationRangeFor:(_NSRange)a3 withMapping:(id)a4;
+ (double)_personNameScoreForFullNameString:(id)a3 locale:(id)a4;
+ (double)_personNameScoreForString:(id)a3 locale:(id)a4;
+ (id)_personNameFromFullNameString:(id)a3;
+ (id)_personNameLineInRegion:(id)a3;
+ (id)_personNameLineInRegion:(id)a3 defaultLocale:(id)a4;
+ (id)_regionsForTranscript:(id)a3 inRange:(_NSRange)a4 mapping:(id)a5;
+ (id)_stringByRemovingNamePrefixes:(id)a3;
+ (id)computeDataDetectorRegionsForText:(id)a3 locale:(id)a4 transcriptComponents:(id)a5 ddQOS:(int)a6;
+ (id)computeGroupRegionsWithDataDetectorRegions:(id)a3 inRegion:(id)a4;
+ (unint64_t)_dataCountOfType:(unint64_t)a3 inRegions:(id)a4;
+ (unint64_t)_groupTypeFromChildren:(id)a3;
+ (void)debugDataDetectorForRegion:(id)a3 withImage:(id)a4 ddQOS:(int)a5;
@end

@implementation CRDataDetectorUtilities

+ (_NSRange)_mappedUrlificationRangeFor:(_NSRange)a3 withMapping:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (location >= [v6 count] || (unint64_t v7 = length + location - 1, v7 >= objc_msgSend(v6, "count")))
  {
    v13 = CROSLogForCategory(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218496;
      NSUInteger v17 = location;
      __int16 v18 = 2048;
      NSUInteger v19 = length;
      __int16 v20 = 2048;
      uint64_t v21 = [v6 count];
      _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_ERROR, "_mappedUrlificationRangeFor:withMapping: Range (%ld, %ld) out of bounds for mapping length %ld.", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v12 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = [v6 objectAtIndexedSubscript:location];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [v6 objectAtIndexedSubscript:v7];
    uint64_t v11 = [v10 unsignedIntegerValue];

    uint64_t v12 = v11 - v9 + 1;
  }

  NSUInteger v14 = v9;
  NSUInteger v15 = v12;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

+ (id)_regionsForTranscript:(id)a3 inRange:(_NSRange)a4 mapping:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  NSUInteger v10 = objc_msgSend((id)objc_opt_class(), "_mappedUrlificationRangeFor:withMapping:", location, length, v9);
  NSUInteger v12 = v11;
  v20.NSUInteger location = [v8 representedRange];
  v21.NSUInteger location = v10;
  v21.NSUInteger length = v12;
  NSRange v13 = NSIntersectionRange(v20, v21);
  NSUInteger v14 = (void *)v13.length;
  if (v13.length)
  {
    uint64_t v15 = [v8 representedRange];
    int v16 = [v8 outputRegion];
    NSUInteger v17 = objc_msgSend(v16, "outputRegionWithContentsOfCharacterRange:", v13.location - v15, v13.length);

    NSUInteger v14 = [v17 regionsSuitableForDataDetectorOutput];
  }
  return v14;
}

+ (double)_personNameScoreForString:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CRDataDetectorUtilities__personNameScoreForString_locale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58CD10 != -1) {
    dispatch_once(&qword_1EB58CD10, block);
  }
  id v8 = (id)qword_1EB58CD08;
  objc_sync_enter(v8);
  if ([v7 isEqualToString:@"en-US"]) {
    [(id)qword_1EB58CD08 personNameScoreForStringWithGazetteers:v6 locale:v7 useLastNameGazetteer:1];
  }
  else {
    [(id)qword_1EB58CD08 personNameScoreForStringWithGazetteers:v6 locale:v7 useLastNameGazetteer:0];
  }
  double v10 = v9;
  double v11 = -1.79769313e308;
  if (v9 <= -1.79769313e308 || (double v11 = v9, v9 < 0.0))
  {
    [(id)qword_1EB58CD08 personNameScoreForStringWithTagger:v6 locale:v7];
    if (v11 >= v12) {
      double v10 = v11;
    }
    else {
      double v10 = v12;
    }
  }
  objc_sync_exit(v8);

  return v10;
}

void __60__CRDataDetectorUtilities__personNameScoreForString_locale___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v0 URLForResource:@"lex-names" withExtension:@"gzt"];

  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v1 URLForResource:@"names" withExtension:@"gzt"];

  v3 = [[CRNamedEntityRecognizer alloc] initWithNameGazetteerURL:v5 lastNameGazetteerURL:v2];
  v4 = (void *)qword_1EB58CD08;
  qword_1EB58CD08 = (uint64_t)v3;
}

+ (double)_personNameScoreForFullNameString:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _personNameFromFullNameString:v5];
  if (v7)
  {
    [(id)objc_opt_class() _personNameScoreForString:v7 locale:v6];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }

  return v9;
}

+ (id)_stringByRemovingNamePrefixes:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB58CD28, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB58CD28))
  {
    qword_1EB58CD20 = objc_opt_new();
    __cxa_guard_release(&qword_1EB58CD28);
  }
  if (qword_1EB58CD18 != -1) {
    dispatch_once(&qword_1EB58CD18, &__block_literal_global_168);
  }
  id v4 = v3;
  uint64_t v5 = 0;
  NSRange v21 = v4;
LABEL_5:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = (id)qword_1EB58CD20;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v7)
  {
    uint64_t v22 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v6);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v9 hasSuffix:@"."])
        {
          double v10 = [v9 stringByAppendingString:@" "];
          v33 = v10;
          double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        }
        else
        {
          double v10 = [v9 stringByAppendingString:@". "];
          v32[0] = v10;
          double v12 = [v9 stringByAppendingString:@" "];
          v32[1] = v12;
          NSRange v13 = [v9 stringByAppendingString:@"."];
          v32[2] = v13;
          double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
        }
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = v11;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v24;
LABEL_15:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v14);
            }
            __int16 v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
            if ([v4 hasPrefix:v18]) {
              break;
            }
            if (v15 == ++v17)
            {
              uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v15) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }
          NSUInteger v19 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v18, "length"));

          ++v5;
          id v4 = v19;
          if (v5 != 3) {
            goto LABEL_5;
          }
          goto LABEL_27;
        }
LABEL_21:
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  NSUInteger v19 = v4;
LABEL_27:

  return v19;
}

void __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke()
{
  v0 = getNamePrefixes();
  id v1 = [v0 objectForKeyedSubscript:@"prefixes"];

  [v1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_174];
  [(id)qword_1EB58CD20 sortUsingComparator:&__block_literal_global_177];
}

uint64_t __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke_2()
{
  return objc_msgSend((id)qword_1EB58CD20, "addObjectsFromArray:");
}

uint64_t __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)_personNameFromFullNameString:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EB58CD38 != -1) {
    dispatch_once(&qword_1EB58CD38, &__block_literal_global_185);
  }
  if ((unint64_t)[v4 length] <= 0x23)
  {
    unint64_t v6 = [a1 _stringByRemovingNamePrefixes:v4];

    uint64_t v7 = [v6 stringByFoldingWithOptions:128 locale:0];
    if ([v7 length] && (uint64_t v8 = objc_msgSend(v7, "length"), v8 == objc_msgSend(v6, "length")))
    {
      double v9 = objc_msgSend((id)qword_1EB58CD30, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
      if ([v9 range]
        || ([v9 range], v10 < objc_msgSend(v6, "length"))
        || [v9 numberOfRanges] != 8
        || [v9 rangeAtIndex:1] == 0x7FFFFFFFFFFFFFFFLL
        || [v9 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v5 = 0;
      }
      else
      {
        uint64_t v12 = [v9 rangeAtIndex:1];
        id v14 = objc_msgSend(v6, "substringWithRange:", v12, v13);
        v19[0] = v14;
        uint64_t v15 = [v9 rangeAtIndex:3];
        uint64_t v17 = objc_msgSend(v6, "substringWithRange:", v15, v16);
        v19[1] = v17;
        __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
        id v5 = [v18 componentsJoinedByString:@" "];
      }
    }
    else
    {
      id v5 = 0;
    }

    id v4 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __57__CRDataDetectorUtilities__personNameFromFullNameString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([A-Z][A-Za-zïß-]+) +([A-Z]\\.? +|[A-Z][A-Za-zïß]+ +){0,2}([A-Z][A-Za-zïß-]+)( +(Jr|Jr.|Sr|Sr.|I|II|III|Júnior|Neto|Filho)){0,1}(,? ?([A-Z][A-Za-z.]{1,5}|[a-z][A-Z]{1,4})){0,5}" options:0 error:0];
  id v1 = (void *)qword_1EB58CD30;
  qword_1EB58CD30 = v0;
}

+ (id)_personNameLineInRegion:(id)a3
{
  id v3 = [a1 _personNameLineInRegion:a3 defaultLocale:@"en-US"];
  return v3;
}

+ (id)_personNameLineInRegion:(id)a3 defaultLocale:(id)a4
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v69 = a4;
  v73 = v5;
  if ([v5 type] == 8)
  {
    v82[0] = v5;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
  }
  else
  {
    unint64_t v6 = [v5 contentsWithTypes:8];
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
  uint64_t v8 = 0;
  if (!v7)
  {
    id v72 = 0;
    goto LABEL_41;
  }
  id v72 = 0;
  uint64_t v74 = *(void *)v77;
  double v9 = 0.0;
  do
  {
    uint64_t v75 = v7;
    for (uint64_t i = 0; i != v75; ++i)
    {
      if (*(void *)v77 != v74) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      uint64_t v12 = [v11 text];
      BOOL v13 = [v12 length] == 0;

      if (!v13)
      {
        id v14 = [v73 recognizedLocale];
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          uint64_t v17 = [v73 children];
          __int16 v18 = [v17 firstObject];
          uint64_t v19 = [v18 recognizedLocale];
          NSRange v20 = (void *)v19;
          NSRange v21 = v69;
          if (v19) {
            NSRange v21 = (void *)v19;
          }
          id v16 = v21;
        }
        uint64_t v22 = objc_opt_class();
        long long v23 = [v11 text];
        [v22 _personNameScoreForFullNameString:v23 locale:v16];
        double v25 = v24;

        if (v25 > v9)
        {
LABEL_16:
          long long v26 = v72;
          id v72 = v11;
          double v9 = v25;
          goto LABEL_23;
        }
        long long v27 = v70;
        if (!v8) {
          goto LABEL_24;
        }
        long long v26 = [v8 text];
        long long v28 = [v26 componentsSeparatedByString:@" "];
        if ([v28 count] != 1)
        {

LABEL_23:
          goto LABEL_24;
        }
        v67 = [v11 text];
        v68 = [v67 componentsSeparatedByString:@" "];
        if ([v68 count] != 1)
        {
          BOOL v38 = 0;
          goto LABEL_35;
        }
        v66 = [v8 boundingQuad];
        [v66 topLeft];
        double v30 = v29;
        v65 = [v11 boundingQuad];
        [v65 topLeft];
        double v32 = v30 - v31;
        if (v30 - v31 >= 0.0)
        {
          v64 = [v8 boundingQuad];
          [v64 topLeft];
          double v40 = v39;
          long long v27 = [v11 boundingQuad];
          [v27 topLeft];
          double v36 = v40 - v41;
        }
        else
        {
          v63 = [v8 boundingQuad];
          [v63 topLeft];
          double v34 = v33;
          v62 = [v11 boundingQuad];
          [v62 topLeft];
          double v36 = -(v34 - v35);
        }
        v70 = v27;
        v42 = [v11 boundingQuad];
        [v42 size];
        if (v36 / v43 >= 1.0)
        {

          BOOL v38 = 0;
          v51 = v70;
          v52 = v64;
          if (v32 >= 0.0) {
            goto LABEL_34;
          }
        }
        else
        {
          v61 = objc_msgSend(v11, "boundingQuad", v36 / v43);
          [v61 topLeft];
          double v45 = v44;
          v46 = [v8 boundingQuad];
          [v46 bottomLeft];
          double v48 = v47;
          v49 = [v11 boundingQuad];
          [v49 size];
          BOOL v38 = (v45 - v48) / v50 < 0.5;

          v51 = v70;
          v52 = v64;
          if (v32 >= 0.0)
          {
LABEL_34:

LABEL_35:
            if (v38)
            {
              v53 = objc_opt_class();
              v54 = [v8 text];
              v80[0] = v54;
              v55 = [v11 text];
              v80[1] = v55;
              v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
              v57 = [v56 componentsJoinedByString:@" "];
              [v53 _personNameScoreForFullNameString:v57 locale:v16];
              double v25 = v58;

              if (v25 > v9) {
                goto LABEL_16;
              }
            }
LABEL_24:
            id v37 = v11;

            uint64_t v8 = v37;
            continue;
          }
        }
        v51 = v62;
        v52 = v63;
        goto LABEL_34;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
  }
  while (v7);
LABEL_41:

  id v59 = v72;
  return v59;
}

+ (id)computeDataDetectorRegionsForText:(id)a3 locale:(id)a4 transcriptComponents:(id)a5 ddQOS:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v45 = a4;
  id v41 = a5;
  double v39 = v9;
  if ([v9 length])
  {
    unint64_t v10 = CROSLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v67 = "+[CRDataDetectorUtilities computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:]";
      __int16 v68 = 2048;
      uint64_t v69 = [v9 length];
      __int16 v70 = 2112;
      id v71 = v45;
      __int16 v72 = 2048;
      uint64_t v73 = [v41 count];
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "%s: Computing data detector regions (text-length:%lu locale:%@ #components:%lu)", buf, 0x2Au);
    }

    id v61 = 0;
    id v37 = [v9 _crDDFriendlyTextWithIndexMapping:&v61];
    id v11 = v61;
    BOOL v38 = [MEMORY[0x1E4F5F160] _crConfigForLocale:v45];
    [v38 setQos:v6];
    double v36 = objc_msgSend(MEMORY[0x1E4F5F158], "scanString:range:configuration:", v37, 0, objc_msgSend(v37, "length"), v38);
    id v43 = (id)objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v36;
    uint64_t v44 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v58;
      do
      {
        for (id i = 0; i != (id)v44; id i = (char *)i + 1)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          if ([v12 category] == 3)
          {
            uint64_t v56 = 0;
            [v12 getStreet:&v56 city:0 state:0 zip:0 country:0];
            if (!v56) {
              continue;
            }
          }
          BOOL v13 = objc_opt_new();
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v14 = v41;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v53 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v52 + 1) + 8 * j);
                uint64_t v19 = objc_opt_class();
                uint64_t v20 = [v12 urlificationRange];
                uint64_t v22 = objc_msgSend(v19, "_regionsForTranscript:inRange:mapping:", v18, v20, v21, v11);
                if (v22) {
                  [v13 addObjectsFromArray:v22];
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
            }
            while (v15);
          }

          long long v23 = +[CRDataDetectorsOutputRegion outputRegionWithDDResult:v12 children:v13 locale:v45];
          if ([v23 dataType] && objc_msgSend(v23, "dataType") != 10) {
            [v43 addObject:v23];
          }
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v44);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v47 = v41;
    uint64_t v24 = [v47 countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v49 != v25) {
            objc_enumerationMutation(v47);
          }
          long long v27 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          long long v28 = objc_opt_class();
          double v29 = [v27 outputRegion];
          double v30 = [v28 _personNameLineInRegion:v29];

          if (v30)
          {
            double v31 = [v30 text];
            double v32 = [MEMORY[0x1E4F5F150] resultFromText:v31 personName:v31 jobTitle:0 department:0 company:0];
            if (v32)
            {
              v62 = v30;
              double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
              double v34 = +[CRDataDetectorsOutputRegion outputRegionWithDataType:10 ddResult:v32 children:v33 locale:v45];

              [v43 addObject:v34];
            }
          }
        }
        uint64_t v24 = [v47 countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v24);
    }
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

+ (unint64_t)_groupTypeFromChildren:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0xC)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      char v6 = 0;
      uint64_t v7 = *(void *)v13;
      unint64_t v8 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "dataType", (void)v12) == 10)
          {
            if ((unint64_t)[v4 count] > 1) {
              goto LABEL_24;
            }
          }
          else if ([v10 dataType] == 5)
          {
            if ([v4 count])
            {
              unint64_t v8 = 2;
LABEL_24:

              goto LABEL_25;
            }
          }
          else if ([v10 dataType] == 3 {
                 || [v10 dataType] == 4
          }
                 || [v10 dataType] == 2)
          {
            char v6 = 1;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }

      if ((v6 & 1) != 0 && (unint64_t)[v4 count] > 1)
      {
        unint64_t v8 = 1;
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  unint64_t v8 = 0;
LABEL_25:

  return v8;
}

+ (unint64_t)_dataCountOfType:(unint64_t)a3 inRegions:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a4;
  unint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "dataType", (void)v11) == a3) {
          ++v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6;
}

+ (BOOL)_shouldGroupAllEntitiesFor:(id)a3 lines:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (unint64_t)[v7 count] >= 3
    && (unint64_t)[v7 count] <= 0xF
    && [a1 _dataCountOfType:10 inRegions:v6] == 1
    && (unint64_t)([a1 _dataCountOfType:3 inRegions:v6] - 1) < 3;

  return v8;
}

+ (id)computeGroupRegionsWithDataDetectorRegions:(id)a3 inRegion:(id)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v31 = a4;
  id v34 = (id)objc_opt_new();
  double v32 = [[CRTextFeatureOrderV2 alloc] initWithAngleThresholdForRotatedCrops:0.0];
  double v33 = [v31 contentsWithTypes:8];
  -[CRTextFeatureOrderV2 orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:](v32, "orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[obj count] >= 2
    && [a1 _shouldGroupAllEntitiesFor:v39 lines:v33])
  {
    id v5 = [obj objectAtIndexedSubscript:0];
    id v6 = [v5 boundingQuad];
    [v6 baselineAngle];
    id v7 = +[CRBlockOutputRegion blockWithLines:confidence:quad:baselineAngle:](CRBlockOutputRegion, "blockWithLines:confidence:quad:baselineAngle:", v33, 2, 0);

    BOOL v8 = [CRGroupRegion alloc];
    uint64_t v9 = [v7 boundingQuad];
    unint64_t v10 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:](v8, "initWithBoundingQuad:layoutDirection:subregions:", v9, [v7 layoutDirection], v33);
    v59[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];

    id obj = (id)v11;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obja = obj;
  uint64_t v40 = [obja countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v40)
  {
    uint64_t v37 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(obja);
        }
        long long v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v42 = objc_opt_new();
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v43 = v39;
        uint64_t v13 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(v43);
              }
              uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              uint64_t v17 = objc_msgSend(v12, "boundingQuad", v31);
              uint64_t v18 = [v17 denormalizedQuad];
              uint64_t v19 = [v16 boundingQuad];
              uint64_t v20 = [v19 denormalizedQuad];
              int v21 = [v18 entirelyContainsQuad:v20];

              if (v21) {
                [v42 addObject:v16];
              }
            }
            uint64_t v13 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
          }
          while (v13);
        }

        uint64_t v22 = [(id)objc_opt_class() _groupTypeFromChildren:v42];
        if (v22)
        {
          long long v23 = [MEMORY[0x1E4F1CA48] array];
          if (v22 == 2)
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            uint64_t v24 = [v12 subregions];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v45;
              do
              {
                for (uint64_t k = 0; k != v25; ++k)
                {
                  if (*(void *)v45 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v23 addObject:v28];
                  }
                }
                uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
              }
              while (v25);
            }
          }
          double v29 = [[CRDataDetectorsGroupOutputRegion alloc] initWithDDRegions:v42 children:v23 groupType:v22];
          if (v29) {
            [v34 addObject:v29];
          }
        }
      }
      uint64_t v40 = [obja countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v40);
  }

  return v34;
}

+ (void)debugDataDetectorForRegion:(id)a3 withImage:(id)a4 ddQOS:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v20 = a3;
  id v7 = a4;
  if (qword_1EB58CD48 != -1) {
    dispatch_once(&qword_1EB58CD48, &__block_literal_global_198);
  }
  BOOL v8 = [v20 text];
  uint64_t v9 = [v20 recognizedLocale];
  unint64_t v10 = [v20 transcriptComponents];
  uint64_t v11 = +[CRDataDetectorUtilities computeDataDetectorRegionsForText:v8 locale:v9 transcriptComponents:v10 ddQOS:v5];

  long long v12 = [v7 imageByOverlayingRegions:v11 strings:0 lineWidth:4.0 red:0.0 green:0.2 blue:0.8 alpha:0.8];

  uint64_t v13 = [[CRTextFeatureOrderV2 alloc] initWithAngleThresholdForRotatedCrops:0.0];
  uint64_t v14 = [v20 contentsWithTypes:8];
  long long v15 = [(CRTextFeatureOrderV2 *)v13 orderAndGroupRegions:v14];
  uint64_t v16 = [v12 imageByOverlayingRegions:v15 strings:0 lineWidth:4.0 red:0.2 green:0.8 blue:0.0 alpha:0.5];

  uint64_t v17 = +[CRDataDetectorUtilities computeGroupRegionsWithDataDetectorRegions:v11 inRegion:v20];
  uint64_t v18 = [v16 imageByOverlayingRegions:v17 strings:0 lineWidth:8.0 red:1.0 green:0.0 blue:0.0 alpha:0.8];

  uint64_t v19 = [NSString stringWithFormat:@"%@/dd_debug_%lu.png", qword_1EB58CD40, objc_msgSend(v18, "hash")];
  [v18 writeToFile:v19];
}

void __70__CRDataDetectorUtilities_debugDataDetectorForRegion_withImage_ddQOS___block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"CRDDDebug"];
  id v1 = (void *)qword_1EB58CD40;
  qword_1EB58CD40 = v0;
}

@end