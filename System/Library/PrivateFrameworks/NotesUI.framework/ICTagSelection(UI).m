@interface ICTagSelection(UI)
- (id)boldFontForTextStyle:()UI;
- (id)fontForTextStyle:()UI;
- (id)summaryWithJoinOperatorMenu:()UI usingTextStyle:foregroundColor:;
@end

@implementation ICTagSelection(UI)

- (id)summaryWithJoinOperatorMenu:()UI usingTextStyle:foregroundColor:
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v54[0] = *MEMORY[0x1E4FB06F8];
  v12 = [a1 fontForTextStyle:v8];
  v54[1] = *MEMORY[0x1E4FB0700];
  v55[0] = v12;
  v55[1] = v9;
  unint64_t v13 = 0x1E4F1C000uLL;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
  v15 = [v10 dictionaryWithDictionary:v14];

  uint64_t v16 = [a1 mode];
  switch(v16)
  {
    case 2:
      id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
      v22 = (void *)MEMORY[0x1E4F83770];
      v23 = @"Show untagged notes only.";
LABEL_8:
      v17 = [v22 localizedFrameworkStringForKey:v23 value:v23 table:0 allowSiri:1];
      id v24 = v21;
      goto LABEL_9;
    case 1:
      id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
      v22 = (void *)MEMORY[0x1E4F83770];
      v23 = @"Show notes with tags.";
      goto LABEL_8;
    case 0:
      if ((unint64_t)[a1 selectedTagCount] >= 3)
      {
        v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS %lu selected tags." value:@"Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS %lu selected tags." table:0 allowSiri:1];
        id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
        v19 = objc_msgSend(NSString, "localizedStringWithFormat:", v17, objc_msgSend(a1, "selectedTagCount"));
        id v20 = (id)[v18 initWithString:v19 attributes:v15];

        goto LABEL_10;
      }
      if ([a1 selectedTagCount])
      {
        if ([a1 selectedTagCount] == 1) {
          v35 = @"Show notes that match the selected tag: %@.";
        }
        else {
          v35 = @"Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags: %@.";
        }
        v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v35 value:v35 table:0 allowSiri:1];
        v36 = [MEMORY[0x1E4F1CA48] array];
        v37 = [MEMORY[0x1E4F1CA60] dictionary];
        v38 = [a1 hashtagPrefixedDisplayTexts];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke;
        v49[3] = &unk_1E5FDAE38;
        id v50 = v37;
        id v51 = v36;
        id v44 = v36;
        id v39 = v37;
        [v38 enumerateObjectsUsingBlock:v49];

        v43 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@", ", @", ", 0, 1 value table allowSiri];
        v42 = [v44 componentsJoinedByString:v43];
        v40 = objc_msgSend(NSString, "localizedStringWithFormat:", v17, v42);
        v41 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v40 attributes:v15];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke_2;
        v45[3] = &unk_1E5FDAE60;
        v45[4] = a1;
        id v46 = v8;
        id v47 = v9;
        id v20 = v41;
        id v48 = v20;
        [v39 enumerateKeysAndObjectsUsingBlock:v45];

        unint64_t v13 = 0x1E4F1C000;
LABEL_10:

        if (a3) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
      v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags." value:@"Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags." table:0 allowSiri:1];
      id v24 = objc_alloc(MEMORY[0x1E4F28E48]);
LABEL_9:
      id v20 = (id)[v24 initWithString:v17 attributes:v15];
      goto LABEL_10;
  }
  id v20 = 0;
  if (a3) {
    goto LABEL_15;
  }
LABEL_13:
  v25 = [v20 string];
  uint64_t v26 = [v25 rangeOfString:ICTagSelectionMenuReplacementSubstring];
  uint64_t v28 = v27;

  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v52 = v11;
    v29 = [a1 boldFontForTextStyle:v8];
    v53 = v29;
    v30 = [*(id *)(v13 + 2536) dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    objc_msgSend(v20, "addAttributes:range:", v30, v26, v28);

    [a1 tagOperator];
    v31 = ICLocalizedStringFromICTagSelectionOperator();
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v26, v28, v31);
  }
LABEL_15:
  if (v20) {
    uint64_t v32 = [v20 copy];
  }
  else {
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0973378];
  }
  v33 = (void *)v32;

  return v33;
}

- (id)fontForTextStyle:()UI
{
  v0 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
  v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  return v1;
}

- (id)boldFontForTextStyle:()UI
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForStyle:symbolicTraits:", a3, 2);
  v4 = objc_msgSend(v3, "ic_fontWithSingleLineA");

  return v4;
}

@end