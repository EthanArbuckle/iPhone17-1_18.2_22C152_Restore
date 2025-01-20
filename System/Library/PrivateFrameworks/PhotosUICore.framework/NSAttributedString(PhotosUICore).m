@interface NSAttributedString(PhotosUICore)
+ (id)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:italicizedAttributes:;
+ (id)px_stringWithFormat:()PhotosUICore defaultAttributes:arguments:;
+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:;
+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:;
+ (uint64_t)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:;
+ (void)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:sizeClass:;
- (BOOL)px_rangeExists:()PhotosUICore;
- (id)px_attributedStringByAddingAttributes:()PhotosUICore;
- (id)px_attributedStringByApplyingCapitalization:()PhotosUICore;
- (id)px_attributedStringByDeletingCharactersInSet:()PhotosUICore;
- (id)px_attributedStringWithParagraphLineBreakMode:()PhotosUICore;
- (id)px_bulletPrefixAttributedStringWithBulletAttributes:()PhotosUICore isLeftToRight:;
- (id)px_stringByReplacingOccurrencesOfString:()PhotosUICore withString:;
- (uint64_t)px_containsAttribute:()PhotosUICore;
- (void)px_sizeWithProposedWidth:()PhotosUICore maximumLines:drawingOptions:;
@end

@implementation NSAttributedString(PhotosUICore)

- (id)px_attributedStringByApplyingCapitalization:()PhotosUICore
{
  id v4 = a1;
  v5 = v4;
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      v15 = (void *)[v4 mutableCopy];
      v16 = [v5 string];
      uint64_t v17 = [v5 length];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __80__NSAttributedString_PhotosUICore__px_attributedStringByApplyingCapitalization___block_invoke;
      v27[3] = &unk_1E5DAEB80;
      id v18 = v15;
      id v28 = v18;
      uint64_t v29 = 2;
      objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 1027, v27);

      id v6 = v18;
      goto LABEL_15;
    }
    if (a3 == 1)
    {
      id v6 = (id)[v4 mutableCopy];
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      if ([v5 length])
      {
        v7 = 0;
        do
        {
          uint64_t v8 = v31;
          if (v31)
          {
            v9 = [v5 string];
            v10 = objc_msgSend(v9, "substringWithRange:", v30, v31);

            v11 = objc_msgSend(v10, "px_stringByApplyingCapitalization:", 1);

            v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v7];
            objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v30, v31, v12);

            uint64_t v8 = v31;
          }
          v13 = [v5 attributesAtIndex:v8 + v30 effectiveRange:&v30];

          unint64_t v14 = v31 + v30;
          v7 = v13;
        }
        while (v14 < [v5 length]);
      }
      goto LABEL_14;
    }
LABEL_12:
    id v6 = v5;
    goto LABEL_15;
  }
  v19 = [v4 string];
  uint64_t v20 = objc_msgSend(v19, "px_firstLetterRange");
  uint64_t v22 = v21;

  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  id v6 = (id)[v5 mutableCopy];
  v23 = [v5 string];
  v24 = objc_msgSend(v23, "substringWithRange:", v20, v22);
  v25 = objc_msgSend(v24, "px_stringByApplyingCapitalization:", 3);
  objc_msgSend(v6, "replaceCharactersInRange:withString:", v20, v22, v25);

LABEL_14:
LABEL_15:
  return v6;
}

- (void)px_sizeWithProposedWidth:()PhotosUICore maximumLines:drawingOptions:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a1 attributesAtIndex:0 effectiveRange:0];
  [&stru_1F00B0030 stringByPaddingToLength:a4 - 1 withString:@"\n" startingAtIndex:0];
  objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:attributes:", objc_claimAutoreleasedReturnValue(), v9), "boundingRectWithSize:options:context:", a5, 0, a2, INFINITY);
  objc_msgSend(a1, "boundingRectWithSize:options:context:", a5, 0, a2, v10);
  if (a1)
  {
    v11 = [a1 attributesAtIndex:0 effectiveRange:0];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    v13 = [a1 string];
    unint64_t v14 = _PXLanguageRequiringLineHeightAdjustmentsForString();

    if (v12) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      uint64_t v20 = v12;
    }
    else
    {
      v16 = [v12 fontDescriptor];
      uint64_t v21 = *MEMORY[0x1E4F24480];
      v22[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v18 = [v16 fontDescriptorByAddingAttributes:v17];

      v19 = (void *)MEMORY[0x1E4FB08E0];
      [v12 pointSize];
      uint64_t v20 = objc_msgSend(v19, "fontWithDescriptor:size:", v18);

      if (v20)
      {
        if (CTFontGetLanguageAwareOutsets()) {
          PXEdgeInsetsMake();
        }
      }
    }
  }
  PXEdgeInsetsInsetSize();
}

- (uint64_t)px_containsAttribute:()PhotosUICore
{
  id v4 = a3;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = [a1 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NSAttributedString_PhotosUICore__px_containsAttribute___block_invoke;
  v8[3] = &unk_1E5DAEBA8;
  v8[4] = &v9;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v8);
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)px_rangeExists:()PhotosUICore
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)[a1 length];
}

- (id)px_bulletPrefixAttributedStringWithBulletAttributes:()PhotosUICore isLeftToRight:
{
  id v6 = a3;
  v7 = (void *)[a1 mutableCopy];
  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (a4)
  {
    uint64_t v9 = (void *)[v8 initWithString:@"● " attributes:v6];

    [v7 insertAttributedString:v9 atIndex:0];
  }
  else
  {
    uint64_t v9 = (void *)[v8 initWithString:@" ●" attributes:v6];

    [v7 appendAttributedString:v9];
  }

  return v7;
}

- (id)px_stringByReplacingOccurrencesOfString:()PhotosUICore withString:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"NSAttributedString+PhotosUICore.m", 139, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];
  }
  uint64_t v9 = (void *)[a1 mutableCopy];
  double v10 = [v9 string];
  uint64_t v11 = [v10 rangeOfString:v7];
  uint64_t v13 = v12;

  while (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v13, v8);
    unint64_t v14 = [v9 string];
    uint64_t v11 = [v14 rangeOfString:v7];
    uint64_t v13 = v15;
  }
  v16 = (void *)[v9 copy];

  return v16;
}

- (id)px_attributedStringByDeletingCharactersInSet:()PhotosUICore
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSAttributedString+PhotosUICore.m", 124, @"Invalid parameter not satisfying: %@", @"characterSet" object file lineNumber description];
  }
  id v6 = (void *)[a1 mutableCopy];
  id v7 = [v6 string];
  uint64_t v8 = [v7 rangeOfCharacterFromSet:v5];
  uint64_t v10 = v9;

  while (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "deleteCharactersInRange:", v8, v10);
    uint64_t v11 = [v6 string];
    uint64_t v8 = [v11 rangeOfCharacterFromSet:v5];
    uint64_t v10 = v12;
  }
  uint64_t v13 = (void *)[v6 copy];

  return v13;
}

- (id)px_attributedStringWithParagraphLineBreakMode:()PhotosUICore
{
  id v4 = a1;
  uint64_t v5 = [v4 length];
  id v6 = (void *)MEMORY[0x1E4FB0738];
  if (v5 < 1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v4 attribute:*MEMORY[0x1E4FB0738] atIndex:v5 - 1 effectiveRange:0];
  }
  if ([v7 lineBreakMode] != a3)
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    uint64_t v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    }
    uint64_t v11 = v10;

    [v11 setLineBreakMode:a3];
    uint64_t v12 = (void *)[v4 mutableCopy];
    objc_msgSend(v12, "addAttribute:value:range:", *v6, v11, 0, v5);

    id v4 = v12;
  }

  return v4;
}

- (id)px_attributedStringByAddingAttributes:()PhotosUICore
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "addAttributes:range:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

+ (void)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:sizeClass:
{
}

+ (uint64_t)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:
{
  return objc_msgSend(a1, "px_thumbnailVideoDurationAttributedString:layoutDirection:sizeClass:", a3, a4, 0);
}

+ (id)px_stringWithFormat:()PhotosUICore defaultAttributes:arguments:
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  id v109 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v111 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v126 objects:v130 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v127 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v13);
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<#$^|"];
          [v15 appendString:v14];
          [v15 appendString:@"|^$#>"];
          [v111 setObject:v13 forKey:v15];
          [v8 addObject:v15];
        }
        else
        {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v126 objects:v130 count:16];
    }
    while (v10);
  }

  if (![v8 count])
  {
    id v16 = v110;
    id v19 = v110;
    id v20 = 0;
    goto LABEL_21;
  }
  id v16 = v110;
  if ([v8 count] == 1)
  {
    uint64_t v17 = NSString;
    id v125 = 0;
    id v18 = [v8 objectAtIndexedSubscript:0];
    id v19 = [v17 localizedStringWithValidatedFormat:v110, @"%@", &v125, v18 validFormatSpecifiers error];
    id v20 = v125;
LABEL_20:

    goto LABEL_21;
  }
  if ([v8 count] == 2)
  {
    uint64_t v21 = NSString;
    id v124 = 0;
    id v18 = [v8 objectAtIndexedSubscript:0];
    uint64_t v22 = [v8 objectAtIndexedSubscript:1];
    id v19 = [v21 localizedStringWithValidatedFormat:v110, @"%@ %@", &v124, v18, v22 validFormatSpecifiers error];
    id v20 = v124;
LABEL_19:

    goto LABEL_20;
  }
  if ([v8 count] == 3)
  {
    v23 = NSString;
    id v123 = 0;
    id v18 = [v8 objectAtIndexedSubscript:0];
    uint64_t v22 = [v8 objectAtIndexedSubscript:1];
    v24 = [v8 objectAtIndexedSubscript:2];
    id v19 = [v23 localizedStringWithValidatedFormat:v110, @"%@ %@ %@", &v123, v18, v22, v24 validFormatSpecifiers error];
    id v20 = v123;

    goto LABEL_19;
  }
  if ([v8 count] == 4)
  {
    v50 = NSString;
    id v122 = 0;
    v51 = [v8 objectAtIndexedSubscript:0];
    v52 = [v8 objectAtIndexedSubscript:1];
    v53 = [v8 objectAtIndexedSubscript:2];
    v54 = [v8 objectAtIndexedSubscript:3];
    uint64_t v55 = [v50 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@", &v122, v51, v52, v53, v54 validFormatSpecifiers error];
    id v20 = v122;

    id v19 = (id)v55;
LABEL_41:

    goto LABEL_21;
  }
  if ([v8 count] == 5)
  {
    v56 = NSString;
    id v121 = 0;
    v51 = [v8 objectAtIndexedSubscript:0];
    v57 = [v8 objectAtIndexedSubscript:1];
    v58 = [v8 objectAtIndexedSubscript:2];
    v59 = [v8 objectAtIndexedSubscript:3];
    v60 = [v8 objectAtIndexedSubscript:4];
    uint64_t v61 = [v56 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@", &v121, v51, v57, v58, v59, v60 validFormatSpecifiers error];
    id v20 = v121;
LABEL_40:

    id v19 = (id)v61;
    goto LABEL_41;
  }
  if ([v8 count] == 6)
  {
    v62 = NSString;
    id v120 = 0;
    v51 = [v8 objectAtIndexedSubscript:0];
    v57 = [v8 objectAtIndexedSubscript:1];
    v58 = [v8 objectAtIndexedSubscript:2];
    v59 = [v8 objectAtIndexedSubscript:3];
    v60 = [v8 objectAtIndexedSubscript:4];
    v63 = [v8 objectAtIndexedSubscript:5];
    uint64_t v61 = [v62 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@ %@", &v120, v51, v57, v58, v59, v60, v63 validFormatSpecifiers error];
    id v64 = v120;

    id v20 = v64;
    goto LABEL_40;
  }
  if ([v8 count] == 7)
  {
    v65 = NSString;
    id v119 = 0;
    uint64_t v66 = [v8 objectAtIndexedSubscript:0];
    v67 = [v8 objectAtIndexedSubscript:1];
    v106 = [v8 objectAtIndexedSubscript:2];
    v68 = [v8 objectAtIndexedSubscript:3];
    v69 = [v8 objectAtIndexedSubscript:4];
    v70 = [v8 objectAtIndexedSubscript:5];
    v71 = [v8 objectAtIndexedSubscript:6];
    v72 = (void *)v66;
    uint64_t v73 = [v65 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@ %@ %@", &v119, v66, v67, v106, v68, v69, v70, v71 validFormatSpecifiers error];
    id v20 = v119;

    id v19 = (id)v73;
  }
  else
  {
    if ([v8 count] == 8)
    {
      v107 = NSString;
      id v118 = 0;
      uint64_t v99 = [v8 objectAtIndexedSubscript:0];
      v74 = [v8 objectAtIndexedSubscript:1];
      v102 = [v8 objectAtIndexedSubscript:2];
      v75 = [v8 objectAtIndexedSubscript:3];
      v76 = [v8 objectAtIndexedSubscript:4];
      v77 = [v8 objectAtIndexedSubscript:5];
      v78 = [v8 objectAtIndexedSubscript:6];
      v79 = [v8 objectAtIndexedSubscript:7];
      uint64_t v80 = [v107 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@ %@ %@ %@", &v118, v99, v74, v102, v75, v76, v77, v78, v79 validFormatSpecifiers error];
      id v20 = v118;

      id v19 = (id)v80;
      v81 = (void *)v99;
    }
    else
    {
      if ([v8 count] == 9)
      {
        v103 = NSString;
        id v117 = 0;
        uint64_t v108 = [v8 objectAtIndexedSubscript:0];
        v82 = [v8 objectAtIndexedSubscript:1];
        v100 = [v8 objectAtIndexedSubscript:2];
        v97 = [v8 objectAtIndexedSubscript:3];
        v83 = [v8 objectAtIndexedSubscript:4];
        v84 = [v8 objectAtIndexedSubscript:5];
        v85 = [v8 objectAtIndexedSubscript:6];
        v86 = [v8 objectAtIndexedSubscript:7];
        v87 = [v8 objectAtIndexedSubscript:8];
        uint64_t v88 = [v103 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@ %@ %@ %@ %@", &v117, v108, v82, v100, v97, v83, v84, v85, v86, v87 validFormatSpecifiers error];
        id v20 = v117;

        id v19 = (id)v88;
      }
      else
      {
        if ([v8 count] != 10)
        {
          uint64_t v25 = *MEMORY[0x1E4F1C3A8];
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"px_stringWithFormat cannot take more than 10 input args"];
          id v20 = 0;
          goto LABEL_24;
        }
        v101 = NSString;
        id v116 = 0;
        uint64_t v108 = [v8 objectAtIndexedSubscript:0];
        v104 = [v8 objectAtIndexedSubscript:1];
        v98 = [v8 objectAtIndexedSubscript:2];
        v96 = [v8 objectAtIndexedSubscript:3];
        v89 = [v8 objectAtIndexedSubscript:4];
        v90 = [v8 objectAtIndexedSubscript:5];
        v91 = [v8 objectAtIndexedSubscript:6];
        v92 = [v8 objectAtIndexedSubscript:7];
        v93 = [v8 objectAtIndexedSubscript:8];
        v94 = [v8 objectAtIndexedSubscript:9];
        uint64_t v95 = [v101 localizedStringWithValidatedFormat:v110, @"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@", &v116, v108, v104, v98, v96, v89, v90, v91, v92, v93, v94 validFormatSpecifiers error];
        id v20 = v116;

        id v19 = (id)v95;
      }
      v81 = (void *)v108;
    }
  }
LABEL_21:
  if (!v19)
  {
    uint64_t v25 = *MEMORY[0x1E4F1C3A8];
LABEL_24:
    v105 = v20;
    [MEMORY[0x1E4F1CA00] raise:v25, @"px_stringWithFormat failed to make validated localized string with %td arguments for format: %@: %@", objc_msgSend(v8, "count"), v16, v20 format];
    id v19 = 0;
    goto LABEL_25;
  }
  v105 = v20;
LABEL_25:
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = [v19 length];
  uint64_t v28 = objc_msgSend(v19, "rangeOfString:options:range:", @"|^$#>", 6, 0, v27);
  if (v29)
  {
    uint64_t v30 = v28;
    uint64_t v31 = v29;
    uint64_t v32 = objc_msgSend(v19, "rangeOfString:options:range:", @"<#$^|", 6, 0, v28);
    if (v33)
    {
      uint64_t v34 = v32;
      do
      {
        uint64_t v35 = v30 + v31;
        v36 = objc_msgSend(v19, "substringWithRange:", v30 + v31, v27 - (v30 + v31));
        [v26 addObject:v36];
        v37 = v19;
        v38 = objc_msgSend(v19, "substringWithRange:", v34, v35 - v34);
        v39 = [v111 objectForKey:v38];
        if (v39)
        {
          [v26 addObject:v39];
          uint64_t v27 = v34;
        }
        else
        {
          [v26 addObject:@"|^$#>"];
          uint64_t v27 = v30;
        }

        id v19 = v37;
        uint64_t v40 = objc_msgSend(v37, "rangeOfString:options:range:", @"|^$#>", 6, 0, v27);
        if (!v41) {
          break;
        }
        uint64_t v30 = v40;
        uint64_t v31 = v41;
        uint64_t v34 = objc_msgSend(v37, "rangeOfString:options:range:", @"<#$^|", 6, 0, v40);
      }
      while (v42);
    }
  }
  v43 = objc_msgSend(v19, "substringWithRange:", 0, v27);
  [v26 addObject:v43];

  id v44 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __84__NSAttributedString_PhotosUICore__px_stringWithFormat_defaultAttributes_arguments___block_invoke;
  v113[3] = &unk_1E5DCD2C0;
  id v45 = v44;
  id v114 = v45;
  id v115 = v109;
  id v46 = v109;
  [v26 enumerateObjectsWithOptions:2 usingBlock:v113];
  v47 = v115;
  id v48 = v45;

  return v48;
}

+ (id)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:italicizedAttributes:
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[PXAttributedStringHTMLParser alloc] initWithHTMLString:v12 defaultAttributes:v11];

  [(PXAttributedStringHTMLParser *)v13 setEmphasizedAttributes:v10];
  [(PXAttributedStringHTMLParser *)v13 setItalicizedAttributes:v9];

  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F00B0030 attributes:v11];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __130__NSAttributedString_PhotosUICore__px_attributedStringWithHTMLString_defaultAttributes_emphasizedAttributes_italicizedAttributes___block_invoke;
  v23[3] = &unk_1E5DCD810;
  id v15 = v14;
  id v24 = v15;
  [(PXAttributedStringHTMLParser *)v13 setParsedAttributedStringBlock:v23];
  [(PXAttributedStringHTMLParser *)v13 parse];
  id v16 = +[PXApplicationSettings sharedInstance];
  int v17 = [v16 wantsPseudostringsWithSpecialCharacters];

  if (v17)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v20 = +[PXApplicationSettings sharedInstance];
    uint64_t v21 = [v20 stringWithSpecialCharacters];
    uint64_t v22 = (void *)[v19 initWithString:v21];
    [v15 insertAttributedString:v22 atIndex:0];
  }
  return v15;
}

+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", a3, a4, a5, 0);
}

+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:
{
  return objc_msgSend(a1, "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:", a3, a4, 0);
}

@end