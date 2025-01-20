@interface ICTextContentStorageDelegate
- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5;
- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4;
@end

@implementation ICTextContentStorageDelegate

uint64_t __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = a3 - *(void *)(a1 + 40);
      v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      objc_msgSend(v8, "removeAttribute:range:", *MEMORY[0x263F815F8], v7, a4);

      v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      objc_msgSend(v9, "removeAttribute:range:", *MEMORY[0x263F81570], v7, a4);
    }
  }

  return MEMORY[0x270F9A758]();
}

id __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 documentRange];
  v9 = [v8 location];
  v10 = [v7 elementRange];
  v11 = [v10 location];
  uint64_t v12 = [v6 offsetFromLocation:v9 toLocation:v11];

  v13 = *(void **)(a1 + 32);
  v14 = [v7 elementRange];
  v15 = [v14 location];
  v16 = [v7 elementRange];

  v17 = [v16 endLocation];
  uint64_t v18 = [v13 offsetFromLocation:v15 toLocation:v17];

  if (v18)
  {
    objc_opt_class();
    objc_opt_class();
    v19 = ICDynamicCast();
    v20 = [v19 textStorage];
    v21 = ICDynamicCast();

    uint64_t v22 = [v21 attribute:*MEMORY[0x263F5AB28] atIndex:v12 effectiveRange:0];
    uint64_t v23 = *MEMORY[0x263F814F0];
    [v21 attribute:*MEMORY[0x263F814F0] atIndex:v12 effectiveRange:0];
    v25 = id v24 = v5;
    objc_opt_class();
    v26 = [v21 styler];
    v27 = ICDynamicCast();

    v28 = (void *)MEMORY[0x263F5B498];
    v29 = [v27 zoomController];
    [v29 zoomFactor];
    v47 = (void *)v25;
    v48 = (void *)v22;
    uint64_t v30 = v25;
    id v5 = v24;
    v31 = objc_msgSend(v28, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v30, v22);

    id v32 = (id)[v5 mutableCopy];
    v33 = [v31 objectForKeyedSubscript:v23];
    [v32 setObject:v33 forKeyedSubscript:v23];

    uint64_t v34 = *MEMORY[0x263F81500];
    v35 = [v31 objectForKeyedSubscript:*MEMORY[0x263F81500]];
    [v32 setObject:v35 forKeyedSubscript:v34];

    [v32 setObject:0 forKeyedSubscript:*MEMORY[0x263F81520]];
    [v32 setObject:0 forKeyedSubscript:*MEMORY[0x263F815F8]];
    [v32 setObject:0 forKeyedSubscript:*MEMORY[0x263F81570]];
    [v32 setObject:0 forKeyedSubscript:*MEMORY[0x263F814A8]];
    uint64_t v36 = *MEMORY[0x263F81540];
    v37 = [v5 objectForKeyedSubscript:*MEMORY[0x263F81540]];
    v38 = v37;
    if (v37) {
      id v39 = v37;
    }
    else {
      id v39 = objc_alloc_init(MEMORY[0x263F81658]);
    }
    v40 = v39;

    v41 = (void *)[v40 mutableCopy];
    v42 = objc_msgSend(v27, "tabStopsForAttributedString:inRange:", v21, v12, v18);
    [v41 setTabStops:v42];

    v43 = [v41 tabStops];
    v44 = [v43 lastObject];
    [v44 location];
    objc_msgSend(v41, "setHeadIndent:");

    v45 = (void *)[v41 copy];
    [v32 setObject:v45 forKeyedSubscript:v36];
  }
  else
  {
    id v32 = v5;
  }

  return v32;
}

- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = [v6 textStorage];
    v10 = [v9 attribute:*MEMORY[0x263F5AB28] atIndex:location effectiveRange:0];

    v11 = [v7 textStorage];
    uint64_t v12 = *MEMORY[0x263F814A0];
    v13 = [v11 attribute:*MEMORY[0x263F814A0] atIndex:location effectiveRange:0];

    if [v10 isList] && (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass())))
    {
      v8 = 0;
    }
    else
    {
      v44 = v13;
      uint64_t v45 = v12;
      v48 = v10;
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x3032000000;
      v62 = __Block_byref_object_copy__7;
      v63 = __Block_byref_object_dispose__7;
      id v64 = 0;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke;
      aBlock[3] = &unk_2640B9CD8;
      v56 = &v59;
      id v14 = v7;
      id v55 = v14;
      NSUInteger v57 = location;
      NSUInteger v58 = length;
      v15 = (void (**)(id))_Block_copy(aBlock);
      objc_opt_class();
      v16 = [v14 textStorage];
      v49 = ICDynamicCast();

      objc_opt_class();
      v17 = [v49 textViews];
      uint64_t v18 = [v17 anyObject];
      v19 = ICDynamicCast();
      v20 = [v19 editorController];
      v21 = [v20 note];

      v47 = v21;
      uint64_t v22 = [v21 calculateDocumentController];
      uint64_t v23 = v15 + 2;
      id v24 = v15[2](v15);
      uint64_t v25 = v15[2](v15);
      uint64_t v26 = objc_msgSend(v25, "ic_range");
      objc_msgSend(v22, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v24, v26, v27, location, 0);

      v28 = [v14 textStorage];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke_2;
      v50[3] = &unk_2640B9D00;
      NSUInteger v52 = location;
      NSUInteger v53 = length;
      v29 = v15;
      v51 = v29;
      objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v45, location, length, 0, v50);
      v46 = v22;

      [v14 attributedString];
      v31 = uint64_t v30 = v47;
      uint64_t v32 = [v31 length];

      if ([v48 style] == 4 && location + length == v32)
      {
        v33 = (*v23)(v29);
        uint64_t v34 = *MEMORY[0x263F81540];
        v35 = [v33 attribute:*MEMORY[0x263F81540] atIndex:0 effectiveRange:0];

        objc_opt_class();
        uint64_t v36 = ICDynamicCast();
        v37 = (void *)[v36 mutableCopy];

        [v37 setParagraphSpacing:*MEMORY[0x263F5B560]];
        v38 = (*v23)(v29);
        id v39 = (void *)[v37 copy];
        objc_msgSend(v38, "addAttribute:value:range:", v34, v39, 0, length);

        uint64_t v30 = v47;
      }
      v40 = (void *)v60[5];
      if (v40 && [v40 length] != length) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"!updatedAttributedString || updatedAttributedString.length == range.length" functionName:"-[ICTextContentStorageDelegate textContentStorage:textParagraphWithRange:]" simulateCrash:1 showAlert:0 format:@"Text paragraph length has changed"];
      }
      if (v60[5])
      {
        id v41 = objc_alloc(MEMORY[0x263F816D8]);
        v42 = (void *)[(id)v60[5] copy];
        v8 = (void *)[v41 initWithAttributedString:v42];
      }
      else
      {
        v8 = 0;
      }

      _Block_object_dispose(&v59, 8);
      v10 = v48;
      v13 = v44;
    }
  }

  return v8;
}

id __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    id v4 = v3;
    id v5 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v4;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) attributedString];
    id v6 = objc_msgSend(v5, "attributedSubstringFromRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    uint64_t v7 = [v6 mutableCopy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v10;
}

- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke;
    v69[3] = &unk_2640B9C90;
    id v70 = v6;
    [v7 setMarkerTextAttributeOverrides:v69];
  }
  if (!ICInternalSettingsIsCollapsibleSectionsEnabled()) {
    goto LABEL_8;
  }
  uint64_t v8 = [v7 textContentManager];
  v9 = [v8 textLayoutManagers];
  char v10 = objc_msgSend(v9, "ic_containsObjectPassingTest:", &__block_literal_global_9);

  if (v10) {
    goto LABEL_8;
  }
  objc_opt_class();
  v11 = ICDynamicCast();
  uint64_t v12 = [v11 elementRange];
  v13 = v12;
  if (v12 && ([v12 isEmpty] & 1) == 0)
  {
    objc_opt_class();
    v16 = ICCheckedDynamicCast();
    uint64_t v14 = [v6 documentRange];
    v17 = [(id)v14 location];
    uint64_t v18 = [v13 location];
    uint64_t v19 = [v6 offsetFromLocation:v17 toLocation:v18];

    v20 = [v16 textStorage];
    v21 = [v20 attribute:*MEMORY[0x263F5AB28] atIndex:v19 effectiveRange:0];

    uint64_t v22 = [v21 uuid];
    if (!v22)
    {
      int v45 = 1;
      goto LABEL_30;
    }
    uint64_t v23 = (void *)v22;
    v68 = v21;
    id v24 = [v21 uuid];
    int v25 = [v16 isUUIDHidden:v24];

    if (!v25)
    {
      int v45 = 1;
LABEL_29:
      v21 = v68;
LABEL_30:

      if (!v45) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    objc_opt_class();
    objc_opt_class();
    uint64_t v26 = ICDynamicCast();
    uint64_t v27 = [v26 textStorage];
    ICDynamicCast();
    uint64_t v28 = v67 = v16;

    v29 = [v6 documentRange];
    uint64_t v30 = [v29 location];
    v31 = [v13 endLocation];
    uint64_t v32 = [v6 offsetFromLocation:v30 toLocation:v31];

    v33 = (void *)v28;
    v16 = v67;
    uint64_t v34 = [v33 string];
    v35 = objc_msgSend(v34, "substringWithRange:", v19, v32 - v19);

    if ((objc_msgSend(v35, "ic_containsNonWhitespaceCharacters") & 1) == 0)
    {
      uint64_t v36 = [v33 string];
      unint64_t v37 = [v36 length];
      unint64_t v38 = v32 + 1;

      if (v37 > v38)
      {
        v66 = v33;
        id v39 = [v33 attribute:*MEMORY[0x263F5AB28] atIndex:v38 effectiveRange:0];
        v40 = [v67 outlineController];
        uint64_t v41 = [v39 uuid];
        if (v41)
        {
          v42 = (void *)v41;
          v65 = v40;
          [v39 uuid];
          v44 = v43 = v39;
          if ([v67 isUUIDHidden:v44])
          {

            id v39 = v43;
            v40 = v65;
          }
          else
          {
            v46 = [v43 uuid];
            LODWORD(v64) = [v65 isUUIDCollapsible:v46];

            v47 = (void *)MEMORY[0x263F5AB28];
            id v39 = v43;
            v40 = v65;
            if (v64)
            {
              [v68 uuid];
              id v64 = v39;
              v49 = v48 = v47;
              v50 = [v65 closestVisibleAncestorForUUID:v49];

              v51 = objc_msgSend(v66, "attribute:atIndex:effectiveRange:", *v48, objc_msgSend(v65, "rangeForUUID:", v50), 0);
              LODWORD(v48) = [v64 style];
              unsigned int v52 = [v51 style];

              BOOL v53 = v48 >= v52;
              id v39 = v64;
              v40 = v65;
              if (!v53)
              {

                LOBYTE(v14) = 1;
                v33 = v66;
LABEL_28:

                int v45 = 0;
                goto LABEL_29;
              }
            }
          }
        }

        v33 = v66;
      }
    }
    v54 = objc_msgSend(v67, "textStorage", v64);
    int v55 = [v54 alwaysEnumerateTrailingParagraph];

    if (!v55) {
      goto LABEL_27;
    }
    v56 = [v6 documentRange];
    NSUInteger v57 = [v56 location];
    NSUInteger v58 = [v13 endLocation];
    uint64_t v59 = v33;
    uint64_t v60 = [v6 offsetFromLocation:v57 toLocation:v58];

    uint64_t v61 = [v67 textStorage];
    uint64_t v62 = [v61 length];

    BOOL v63 = v60 == v62;
    v33 = v59;
    v16 = v67;
    if (v63) {
      LOBYTE(v14) = 1;
    }
    else {
LABEL_27:
    }
      LOBYTE(v14) = 0;
    goto LABEL_28;
  }

LABEL_8:
  LOBYTE(v14) = 1;
LABEL_9:

  return v14 & 1;
}

uint64_t __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  objc_opt_class();
  v3 = ICDynamicCast();

  id v4 = [v3 textContainer];
  id v5 = ICDynamicCast();
  uint64_t v6 = [v5 insideSiriSnippet];

  return v6;
}

@end