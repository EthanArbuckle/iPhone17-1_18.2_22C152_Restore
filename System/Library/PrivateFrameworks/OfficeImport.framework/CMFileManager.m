@interface CMFileManager
+ (id)canonicalUrlPrefix:(id)a3;
+ (id)getTmpDirectory;
+ (id)getUrlProtocol:(id)a3;
+ (id)uniqueFileName:(id)a3;
+ (unint64_t)getFileTypeFromPath:(id)a3;
+ (unint64_t)getFileTypeFromUTI:(id)a3;
@end

@implementation CMFileManager

+ (unint64_t)getFileTypeFromPath:(id)a3
{
  v3 = [a3 pathExtension];
  if ([v3 caseInsensitiveCompare:@"doc"]
    && [v3 caseInsensitiveCompare:@"dot"])
  {
    if ([v3 caseInsensitiveCompare:@"docx"]
      && [v3 caseInsensitiveCompare:@"dotx"]
      && [v3 caseInsensitiveCompare:@"docm"]
      && [v3 caseInsensitiveCompare:@"dotm"])
    {
      if ([v3 caseInsensitiveCompare:@"xls"]
        && [v3 caseInsensitiveCompare:@"xlt"]
        && [v3 caseInsensitiveCompare:@"xla"])
      {
        if ([v3 caseInsensitiveCompare:@"xlsx"]
          && [v3 caseInsensitiveCompare:@"xltx"]
          && [v3 caseInsensitiveCompare:@"xlsm"]
          && [v3 caseInsensitiveCompare:@"xltm"])
        {
          if ([v3 caseInsensitiveCompare:@"ppt"]
            && [v3 caseInsensitiveCompare:@"pot"]
            && [v3 caseInsensitiveCompare:@"pps"])
          {
            if ([v3 caseInsensitiveCompare:@"pptx"]
              && [v3 caseInsensitiveCompare:@"pptm"]
              && [v3 caseInsensitiveCompare:@"potx"]
              && [v3 caseInsensitiveCompare:@"potm"]
              && [v3 caseInsensitiveCompare:@"ppsx"]
              && [v3 caseInsensitiveCompare:@"ppsm"])
            {
              if ([v3 caseInsensitiveCompare:@"csv"]) {
                unint64_t v4 = 0;
              }
              else {
                unint64_t v4 = 7;
              }
            }
            else
            {
              unint64_t v4 = 6;
            }
          }
          else
          {
            unint64_t v4 = 5;
          }
        }
        else
        {
          unint64_t v4 = 4;
        }
      }
      else
      {
        unint64_t v4 = 3;
      }
    }
    else
    {
      unint64_t v4 = 2;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (id)uniqueFileName:(id)a3
{
  id v3 = a3;
  CFUUIDRef v4 = CFUUIDCreate(0);
  v5 = (__CFString *)CFUUIDCreateString(0, v4);
  CFRelease(v4);
  v6 = [(__CFString *)v5 stringByAppendingFormat:@".%@", v3];

  return v6;
}

+ (id)getTmpDirectory
{
  return @"~/tmp/";
}

+ (unint64_t)getFileTypeFromUTI:(id)a3
{
  id v3 = [MEMORY[0x263F1D920] typeWithIdentifier:a3];
  if (qword_2689BCCC0 != -1) {
    dispatch_once(&qword_2689BCCC0, &__block_literal_global_106);
  }
  if ([v3 conformsToType:_MergedGlobals_53]) {
    goto LABEL_4;
  }
  if ([v3 conformsToType:qword_2689BCBE0])
  {
LABEL_6:
    unint64_t v4 = 3;
    goto LABEL_15;
  }
  if ([v3 conformsToType:qword_2689BCBE8])
  {
LABEL_8:
    unint64_t v4 = 5;
    goto LABEL_15;
  }
  if ([v3 conformsToType:qword_2689BCBF0])
  {
LABEL_10:
    unint64_t v4 = 2;
    goto LABEL_15;
  }
  if ([v3 conformsToType:qword_2689BCBF8])
  {
LABEL_12:
    unint64_t v4 = 4;
    goto LABEL_15;
  }
  if ([v3 conformsToType:qword_2689BCC00]) {
    goto LABEL_14;
  }
  if ([v3 conformsToType:qword_2689BCC08])
  {
LABEL_4:
    unint64_t v4 = 1;
    goto LABEL_15;
  }
  if (([v3 conformsToType:qword_2689BCC10] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC20] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC18] & 1) != 0
    || qword_2689BCC28 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_2689BCC30 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
    goto LABEL_10;
  }
  if (([v3 conformsToType:qword_2689BCC38] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC40] & 1) != 0)
  {
    goto LABEL_6;
  }
  if (([v3 conformsToType:qword_2689BCC48] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC58] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC50] & 1) != 0
    || qword_2689BCC60 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_2689BCC68 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
    goto LABEL_12;
  }
  if (([v3 conformsToType:qword_2689BCC70] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC78] & 1) != 0)
  {
    goto LABEL_8;
  }
  if (([v3 conformsToType:qword_2689BCC88] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC80] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC98] & 1) != 0
    || ([v3 conformsToType:qword_2689BCC90] & 1) != 0
    || ([v3 conformsToType:qword_2689BCCA0] & 1) != 0
    || qword_2689BCCA8 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_2689BCCB0 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_2689BCCB8 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
LABEL_14:
    unint64_t v4 = 6;
    goto LABEL_15;
  }
  if ([v3 conformsToType:*MEMORY[0x263F1DA20]]) {
    unint64_t v4 = 7;
  }
  else {
    unint64_t v4 = 0;
  }
LABEL_15:

  return v4;
}

void __36__CMFileManager_getFileTypeFromUTI___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.word.doc"];
  v1 = (void *)_MergedGlobals_53;
  _MergedGlobals_53 = v0;

  uint64_t v2 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.excel.xls"];
  id v3 = (void *)qword_2689BCBE0;
  qword_2689BCBE0 = v2;

  uint64_t v4 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.ppt"];
  v5 = (void *)qword_2689BCBE8;
  qword_2689BCBE8 = v4;

  uint64_t v6 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.wordprocessingml.document"];
  v7 = (void *)qword_2689BCBF0;
  qword_2689BCBF0 = v6;

  uint64_t v8 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.spreadsheetml.sheet"];
  v9 = (void *)qword_2689BCBF8;
  qword_2689BCBF8 = v8;

  uint64_t v10 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.presentation"];
  v11 = (void *)qword_2689BCC00;
  qword_2689BCC00 = v10;

  uint64_t v12 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.word.dot"];
  v13 = (void *)qword_2689BCC08;
  qword_2689BCC08 = v12;

  uint64_t v14 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.wordprocessingml.template"];
  v15 = (void *)qword_2689BCC10;
  qword_2689BCC10 = v14;

  uint64_t v16 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.wordprocessingml.document.macroenabled"];
  v17 = (void *)qword_2689BCC20;
  qword_2689BCC20 = v16;

  uint64_t v18 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.wordprocessingml.template.macroenabled"];
  v19 = (void *)qword_2689BCC18;
  qword_2689BCC18 = v18;

  uint64_t v20 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.word.openxml.document"];
  v21 = (void *)qword_2689BCC28;
  qword_2689BCC28 = v20;

  uint64_t v22 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.word.openxml.template"];
  v23 = (void *)qword_2689BCC30;
  qword_2689BCC30 = v22;

  uint64_t v24 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.excel.xlt"];
  v25 = (void *)qword_2689BCC38;
  qword_2689BCC38 = v24;

  uint64_t v26 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.excel.xla"];
  v27 = (void *)qword_2689BCC40;
  qword_2689BCC40 = v26;

  uint64_t v28 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.spreadsheetml.template"];
  v29 = (void *)qword_2689BCC48;
  qword_2689BCC48 = v28;

  uint64_t v30 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.spreadsheetml.sheet.macroenabled"];
  v31 = (void *)qword_2689BCC50;
  qword_2689BCC50 = v30;

  uint64_t v32 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.spreadsheetml.template.macroenabled"];
  v33 = (void *)qword_2689BCC58;
  qword_2689BCC58 = v32;

  uint64_t v34 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.excel.openxml.workbook"];
  v35 = (void *)qword_2689BCC60;
  qword_2689BCC60 = v34;

  uint64_t v36 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.excel.openxml.template"];
  v37 = (void *)qword_2689BCC68;
  qword_2689BCC68 = v36;

  uint64_t v38 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.pps"];
  v39 = (void *)qword_2689BCC70;
  qword_2689BCC70 = v38;

  uint64_t v40 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.pot"];
  v41 = (void *)qword_2689BCC78;
  qword_2689BCC78 = v40;

  uint64_t v42 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.template"];
  v43 = (void *)qword_2689BCC88;
  qword_2689BCC88 = v42;

  uint64_t v44 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.slideshow"];
  v45 = (void *)qword_2689BCC80;
  qword_2689BCC80 = v44;

  uint64_t v46 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.template.macroenabled"];
  v47 = (void *)qword_2689BCC90;
  qword_2689BCC90 = v46;

  uint64_t v48 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.presentation.macroenabled"];
  v49 = (void *)qword_2689BCC98;
  qword_2689BCC98 = v48;

  uint64_t v50 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.openxmlformats.presentationml.slideshow.macroenabled"];
  v51 = (void *)qword_2689BCCA0;
  qword_2689BCCA0 = v50;

  uint64_t v52 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.openxml.presentation"];
  v53 = (void *)qword_2689BCCA8;
  qword_2689BCCA8 = v52;

  uint64_t v54 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.openxml.template"];
  v55 = (void *)qword_2689BCCB0;
  qword_2689BCCB0 = v54;

  uint64_t v56 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.microsoft.powerpoint.openxml.slideshow"];
  v57 = (void *)qword_2689BCCB8;
  qword_2689BCCB8 = v56;
}

+ (id)canonicalUrlPrefix:(id)a3
{
  id v3 = a3;
  if (![v3 length]
    || (int v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1), v4 == 47)
    || v4 == 58)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 stringByAppendingString:@"/"];
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)getUrlProtocol:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":"];
  if (v5)
  {
    uint64_t v6 = [v3 substringToIndex:v4 + 1];
  }
  else
  {
    uint64_t v6 = &stru_26EBF24D8;
  }

  return v6;
}

@end