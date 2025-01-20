@interface ICNote(HTML)
+ (BOOL)isDefaultColor:()HTML;
+ (id)attributedStringFromHTMLString:()HTML baseURL:readerDelegate:;
+ (id)htmlStringByFixingDashedListsInHTMLString:()HTML;
+ (id)htmlStringFromAttributedString:()HTML attachmentConversionHandler:;
+ (id)mutableAttributedStringFromHTMLString:()HTML baseURL:;
+ (id)mutableAttributedStringFromHTMLString:()HTML readerDelegate:;
+ (id)tagDictionariesForAttributes:()HTML attachmentConversionHandler:;
+ (id)tagDictionaryForWrapperAroundParagraphStyle:()HTML;
+ (uint64_t)attributedStringFromHTMLString:()HTML;
+ (uint64_t)attributedStringFromHTMLString:()HTML readerDelegate:;
+ (uint64_t)hexStringForColor:()HTML;
+ (uint64_t)htmlObjectAttributesForAttachmentWithContentID:()HTML;
+ (void)fixDashedListsInAttributedString:()HTML;
+ (void)fixFontsInAttributedString:()HTML;
+ (void)fixTextColorsInAttributedString:()HTML;
+ (void)fixUnwantedCharactersInAttributedString:()HTML;
- (id)htmlStringWithAttachmentConversionHandler:()HTML;
- (id)htmlStringWithAttachments:()HTML;
- (id)htmlStringWithHTMLAttachments;
- (uint64_t)htmlString;
@end

@implementation ICNote(HTML)

- (uint64_t)htmlString
{
  return [a1 htmlStringWithAttachmentConversionHandler:&__block_literal_global_3];
}

- (id)htmlStringWithAttachments:()HTML
{
  if (a3) {
    [a1 htmlString];
  }
  else {
  v3 = [a1 htmlStringWithAttachmentConversionHandler:0];
  }
  return v3;
}

- (id)htmlStringWithAttachmentConversionHandler:()HTML
{
  id v4 = a3;
  v5 = [a1 uiAttributedString];
  v6 = [a1 managedObjectContext];
  v7 = objc_msgSend(v5, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", v6);

  v8 = [(id)objc_opt_class() htmlStringFromAttributedString:v7 attachmentConversionHandler:v4];

  return v8;
}

- (id)htmlStringWithHTMLAttachments
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ICNote_HTML__htmlStringWithHTMLAttachments__block_invoke;
  v3[3] = &unk_1E5FD9658;
  v3[4] = a1;
  v1 = [a1 htmlStringWithAttachmentConversionHandler:v3];
  return v1;
}

+ (uint64_t)attributedStringFromHTMLString:()HTML
{
  return [a1 attributedStringFromHTMLString:a3 baseURL:0 readerDelegate:0];
}

+ (uint64_t)attributedStringFromHTMLString:()HTML readerDelegate:
{
  return [a1 attributedStringFromHTMLString:a3 baseURL:0 readerDelegate:a4];
}

+ (id)attributedStringFromHTMLString:()HTML baseURL:readerDelegate:
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 htmlStringByFixingDashedListsInHTMLString:a3];
  if (v9) {
    [a1 mutableAttributedStringFromHTMLString:v10 readerDelegate:v9];
  }
  else {
  v11 = [a1 mutableAttributedStringFromHTMLString:v10 baseURL:v8];
  }
  [a1 fixDashedListsInAttributedString:v11];
  [a1 fixUnwantedCharactersInAttributedString:v11];
  [a1 fixFontsInAttributedString:v11];
  [a1 fixTextColorsInAttributedString:v11];

  return v11;
}

+ (uint64_t)htmlObjectAttributesForAttachmentWithContentID:()HTML
{
  return [NSString stringWithFormat:@" type=\"application/x-apple-msg-attachment\" data=\"cid:%@\"", a3];
}

+ (id)mutableAttributedStringFromHTMLString:()HTML baseURL:
{
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v9 = +[ICHTMLConverterClient sharedClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ICNote_HTML__mutableAttributedStringFromHTMLString_baseURL___block_invoke;
  v15[3] = &unk_1E5FD9680;
  v17 = &v23;
  v18 = &v19;
  v10 = v7;
  v16 = v10;
  [v9 attributedStringFromHTMLString:v5 baseURL:v6 timeoutDate:v8 completionBlock:v15];

  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v10, v11);
  if (!*((unsigned char *)v20 + 24))
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ICNote(HTML) mutableAttributedStringFromHTMLString:baseURL:](v12);
    }
  }
  id v13 = (id)v24[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

+ (id)mutableAttributedStringFromHTMLString:()HTML readerDelegate:
{
  id v5 = a4;
  id v6 = [a3 dataUsingEncoding:4];
  dispatch_semaphore_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:*MEMORY[0x1E4FB0708] forKeyedSubscript:*MEMORY[0x1E4FB06D8]];
  [v7 setObject:&unk_1F09A4040 forKeyedSubscript:*MEMORY[0x1E4FB06D0]];
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F83270]];
  }
  id v12 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithData:v6 options:v7 documentAttributes:0 error:&v12];
  id v9 = v12;
  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ICNote(HTML) mutableAttributedStringFromHTMLString:readerDelegate:]((uint64_t)v9, v10);
    }
  }
  return v8;
}

+ (id)htmlStringByFixingDashedListsInHTMLString:()HTML
{
  id v3 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"<style>ul.Apple-dash-list, ul.Apple-dash-list ul { list-style-type: %@; }</style>",
  id v4 = @"upper-roman");
  uint64_t v6 = [v3 rangeOfString:@"<head>"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_semaphore_t v7 = [NSString stringWithFormat:@"%@%@", v4, v3];
  }
  else
  {
    uint64_t v8 = v5;
    id v9 = [NSString stringWithFormat:@"<head>%@", v4];
    dispatch_semaphore_t v7 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v6, v8, v9);
  }
  return v7;
}

+ (void)fixDashedListsInAttributedString:()HTML
{
  id v3 = a3;
  if (!fixDashedListsInAttributedString__NSTextListClass) {
    fixDashedListsInAttributedString__NSTextListClass = (uint64_t)NSClassFromString(&cfstr_Nstextlist.isa);
  }
  uint64_t v4 = *MEMORY[0x1E4FB0738];
  uint64_t v5 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICNote_HTML__fixDashedListsInAttributedString___block_invoke;
  v7[3] = &unk_1E5FD96A8;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v7);
}

+ (void)fixUnwantedCharactersInAttributedString:()HTML
{
  id v3 = a3;
  id v5 = [v3 mutableString];
  uint64_t v4 = [v3 length];

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @" ", @" ", 0, 0, v4);
}

+ (void)fixFontsInAttributedString:()HTML
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
  id v5 = [v4 fontDescriptor];
  uint64_t v6 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [v3 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__ICNote_HTML__fixFontsInAttributedString___block_invoke;
  v11[3] = &unk_1E5FD96D0;
  id v12 = v3;
  id v13 = v4;
  id v14 = v5;
  id v8 = v5;
  id v9 = v4;
  id v10 = v3;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0x100000, v11);
}

+ (void)fixTextColorsInAttributedString:()HTML
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 copy];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  uint64_t v6 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ICNote_HTML__fixTextColorsInAttributedString___block_invoke;
  v8[3] = &unk_1E5FD96F8;
  id v9 = v3;
  id v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v8);
}

+ (id)htmlStringFromAttributedString:()HTML attachmentConversionHandler:
{
  id v5 = a3;
  id v49 = a4;
  v48 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"img", 0);
  if (![v5 length])
  {
    id v42 = (id)objc_opt_new();
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = *MEMORY[0x1E4FB06B0];
  uint64_t v9 = objc_msgSend(v5, "ic_range");
  uint64_t v11 = v10;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke;
  v61[3] = &unk_1E5FD9720;
  id v47 = v7;
  id v62 = v47;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v8, v9, v11, 0, v61);
  id v12 = (void *)[v5 mutableCopy];
  uint64_t v13 = objc_msgSend(v5, "ic_range");
  objc_msgSend(v12, "removeAttribute:range:", v8, v13, v14);
  v51 = v12;
  v15 = [v12 string];
  uint64_t v16 = objc_msgSend(v15, "paragraphRangeForRange:", 0, 0);
  uint64_t v18 = v17;

  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_27;
  }
  uint64_t v50 = v18;
  unint64_t v20 = 0;
  id v45 = v5;
  do
  {
    uint64_t v21 = [v51 attribute:*MEMORY[0x1E4F83220] atIndex:v16 effectiveRange:0];
    unint64_t v22 = 0;
    if ([v21 isList] && (v23 = objc_msgSend(v21, "indent"), unint64_t v22 = v23 + 1, v23 + 1 > v20))
    {
      uint64_t v24 = v23 - v20 + 1;
      do
      {
        int v25 = [v21 style];
        if ([v21 style] == 102) {
          v26 = @"ol";
        }
        else {
          v26 = @"ul";
        }
        v27 = v26;
        [v19 addObject:v27];
        if (v25 == 101) {
          [v6 appendFormat:@"<%@ class=\"%@\">\n", v27, @"Apple-dash-list"];
        }
        else {
          [v6 appendFormat:@"<%@>\n", v27, v44];
        }

        --v24;
      }
      while (v24);
    }
    else
    {
      if (v22 >= v20) {
        goto LABEL_18;
      }
      do
      {
        --v20;
        id v28 = [v19 lastObject];
        [v19 removeLastObject];
        [v6 appendFormat:@"</%@>\n", v28];
      }
      while (v22 < v20);
    }
    unint64_t v20 = v22;
LABEL_18:
    v29 = [a1 tagDictionaryForWrapperAroundParagraphStyle:v21];
    v30 = [v29 objectForKeyedSubscript:@"TagName"];
    uint64_t v31 = [v29 objectForKeyedSubscript:@"Attributes"];
    v32 = (void *)v31;
    v33 = &stru_1F0973378;
    if (v31) {
      v33 = (__CFString *)v31;
    }
    v34 = v33;

    v44 = v34;
    [v6 appendFormat:@"<%@%@>", v30];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_2;
    v52[3] = &unk_1E5FD9770;
    v58 = a1;
    id v57 = v49;
    id v35 = v6;
    id v53 = v35;
    id v54 = v48;
    id v36 = v51;
    id v55 = v36;
    id v56 = v47;
    uint64_t v59 = v16;
    uint64_t v60 = v50;
    objc_msgSend(v36, "enumerateAttributesInRange:options:usingBlock:", v16, v50, 0, v52);
    [v35 appendFormat:@"</%@>", v30];
    [v35 appendString:@"\n"];
    unint64_t v37 = v16 + v50;
    if (v37 >= [v36 length])
    {
      uint64_t v50 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v38 = [v36 string];
      uint64_t v16 = objc_msgSend(v38, "paragraphRangeForRange:", v37, 0);
      uint64_t v50 = v39;
    }
  }
  while (v16 != 0x7FFFFFFFFFFFFFFFLL);
  id v5 = v45;
  if ((uint64_t)v20 >= 1)
  {
    unint64_t v40 = v20 + 1;
    do
    {
      v41 = [v19 lastObject];
      [v19 removeLastObject];
      [v35 appendFormat:@"</%@>\n", v41];

      --v40;
    }
    while (v40 > 1);
  }
LABEL_27:
  id v42 = v6;

LABEL_29:
  return v42;
}

+ (id)tagDictionaryForWrapperAroundParagraphStyle:()HTML
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  int v5 = [v3 isList];

  if (v5) {
    uint64_t v6 = @"li";
  }
  else {
    uint64_t v6 = @"div";
  }
  [v4 setObject:v6 forKeyedSubscript:@"TagName"];
  return v4;
}

+ (id)tagDictionariesForAttributes:()HTML attachmentConversionHandler:
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83210]];
  char v10 = [v9 intValue];

  if (v10)
  {
    v69 = @"TagName";
    v70[0] = @"b";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    [v8 addObject:v11];
  }
  if ((v10 & 2) != 0)
  {
    v67 = @"TagName";
    v68 = @"i";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    [v8 addObject:v12];
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83240]];

  if (v13)
  {
    v65 = @"TagName";
    v66 = @"u";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    [v8 addObject:v14];
  }
  v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83228]];

  if (v15)
  {
    v63 = @"TagName";
    v64 = @"strike";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    [v8 addObject:v16];
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83208]];
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v19 = [v17 fontName];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    uint64_t v21 = [v17 fontName];
    [v18 appendFormat:@" face=\"%@\"", v21];
  }
  unint64_t v22 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83218]];

  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4FB1618] colorWithCGColor:v22];
    if (([a1 isDefaultColor:v23] & 1) == 0)
    {
      uint64_t v24 = [a1 hexStringForColor:v23];
      [v18 appendFormat:@" color=\"#%@\"", v24];
    }
  }
  if ([v18 length])
  {
    v61[0] = @"TagName";
    v61[1] = @"Attributes";
    v62[0] = @"font";
    v62[1] = v18;
    int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
    [v8 addObject:v25];
  }
  [v17 pointSize];
  if (v26 > 0.0)
  {
    v59[1] = @"Attributes";
    v60[0] = @"span";
    v59[0] = @"TagName";
    v27 = NSString;
    [v17 pointSize];
    v29 = objc_msgSend(v27, "stringWithFormat:", @" style=\"font-size: %.0Fpx\"", v28);
    v60[1] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
    [v8 addObject:v30];
  }
  uint64_t v31 = (void *)MEMORY[0x1E4FB06B8];
  if (v7)
  {
    v32 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
    v33 = v32;
    if (v32)
    {
      v34 = [v32 attachmentIdentifier];
      id v49 = 0;
      uint64_t v50 = @"object";
      v48 = v7;
      id v35 = v7[2](v7, v34, &v50, &v49);
      id v36 = v50;
      id v37 = v49;
      if (v35 && v36)
      {
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v38 setObject:v36 forKeyedSubscript:@"TagName"];
        [v38 setObject:v35 forKeyedSubscript:@"Attributes"];
        if (v37) {
          [v38 setObject:v37 forKeyedSubscript:@"TextContent"];
        }
        [v8 addObject:v38];
      }
      id v7 = v48;
      uint64_t v31 = (void *)MEMORY[0x1E4FB06B8];
    }
  }
  uint64_t v39 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  int v40 = [v39 style];
  if (v39)
  {
    int v41 = v40;
    id v42 = [v6 objectForKeyedSubscript:*v31];

    if (!v42)
    {
      switch(v41)
      {
        case 0:
          id v57 = @"TagName";
          v58 = @"h1";
          v43 = (void *)MEMORY[0x1E4F1C9E8];
          v44 = &v58;
          id v45 = &v57;
          goto LABEL_35;
        case 1:
          id v55 = @"TagName";
          id v56 = @"h2";
          v43 = (void *)MEMORY[0x1E4F1C9E8];
          v44 = &v56;
          id v45 = &v55;
          goto LABEL_35;
        case 2:
          id v53 = @"TagName";
          id v54 = @"h3";
          v43 = (void *)MEMORY[0x1E4F1C9E8];
          v44 = &v54;
          id v45 = &v53;
          goto LABEL_35;
        case 4:
          v51 = @"TagName";
          v52 = @"tt";
          v43 = (void *)MEMORY[0x1E4F1C9E8];
          v44 = &v52;
          id v45 = &v51;
LABEL_35:
          v46 = [v43 dictionaryWithObjects:v44 forKeys:v45 count:1];
          [v8 addObject:v46];

          break;
        default:
          break;
      }
    }
  }

  return v8;
}

+ (BOOL)isDefaultColor:()HTML
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    Components = CGColorGetComponents((CGColorRef)[v3 CGColor]);
    BOOL v6 = 0;
    if (*Components == 0.0 && Components[1] == 0.0) {
      BOOL v6 = Components[2] == 0.0;
    }
  }

  return v6;
}

+ (uint64_t)hexStringForColor:()HTML
{
  Components = CGColorGetComponents((CGColorRef)[a3 CGColor]);
  return objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X", (int)(*Components * 255.0), (int)(Components[1] * 255.0), (int)(Components[2] * 255.0));
}

+ (void)mutableAttributedStringFromHTMLString:()HTML baseURL:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Couldn't convert the attributed string within the timeout window.", v1, 2u);
}

+ (void)mutableAttributedStringFromHTMLString:()HTML readerDelegate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error converting HTML to attributed string: %@", (uint8_t *)&v2, 0xCu);
}

@end