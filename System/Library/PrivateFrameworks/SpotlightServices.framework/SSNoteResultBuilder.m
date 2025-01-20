@interface SSNoteResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (BOOL)isLocked;
- (BOOL)isShared;
- (NSDate)modificationDate;
- (NSString)account;
- (NSString)folder;
- (NSString)formattedBody;
- (NSString)title;
- (SSNoteResultBuilder)initWithResult:(id)a3;
- (id)buildCompactCardSection;
- (id)buildInlineCardSection;
- (id)buildTitle;
- (void)setAccount:(id)a3;
- (void)setFolder:(id)a3;
- (void)setFormattedBody:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSNoteResultBuilder

+ (id)bundleId
{
  return @"com.apple.mobilenotes";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSNoteResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSNoteResultBuilder;
  v5 = [(SSResultBuilder *)&v17 initWithResult:v4];
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    v8 = [v6 whiteSpaceCondensedStringForString:v7];
    [(SSNoteResultBuilder *)v5 setTitle:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23180] withType:objc_opt_class()];
    -[SSNoteResultBuilder setIsShared:](v5, "setIsShared:", [v9 BOOLValue]);

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F23178] withType:objc_opt_class()];
    -[SSNoteResultBuilder setIsLocked:](v5, "setIsLocked:", [v10 BOOLValue]);

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22C48] withType:objc_opt_class()];
    [(SSNoteResultBuilder *)v5 setModificationDate:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    if (v12)
    {
      [(SSNoteResultBuilder *)v5 setFormattedBody:v12];
    }
    else
    {
      v13 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
      [(SSNoteResultBuilder *)v5 setFormattedBody:v13];
    }
    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F23170] withType:objc_opt_class()];
    [(SSNoteResultBuilder *)v5 setFolder:v14];

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F23168] withType:objc_opt_class()];
    [(SSNoteResultBuilder *)v5 setAccount:v15];
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v95[1] = *MEMORY[0x1E4F143B8];
  if ([(SSNoteResultBuilder *)self isLocked])
  {
    v3 = (void *)MEMORY[0x1E4F9A378];
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"LOCKED" value:&stru_1F1824018 table:@"SpotlightServices"];
    id v6 = [v3 textWithString:v5];
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  id v4 = [(SSNoteResultBuilder *)self title];
  v7 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:v4 headTruncation:1];
  v5 = v7;
  if (v7)
  {
    id v6 = v7;
    v5 = v6;
    goto LABEL_5;
  }
  v24 = (void *)MEMORY[0x1E4F9A378];
  v25 = [(SSNoteResultBuilder *)self formattedBody];
  v8 = [v24 textWithString:v25];

LABEL_6:
  v91.receiver = self;
  v91.super_class = (Class)SSNoteResultBuilder;
  v9 = [(SSResultBuilder *)&v91 buildInlineCardSection];
  if (SSSnippetModernizationEnabled())
  {
    v10 = objc_opt_new();
    v11 = [(SSNoteResultBuilder *)self modificationDate];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F9A0E0];
      v13 = NSString;
      v14 = [(SSNoteResultBuilder *)self modificationDate];
      v15 = +[SSDateFormatManager dynamicCompactStringFromDate:v14];
      v16 = [v13 stringWithFormat:@"%@  ", v15];
      objc_super v17 = [v12 textWithString:v16];
      [v10 addObject:v17];
    }
    v18 = [v8 formattedTextPieces];
    if (v18)
    {
      [v10 addObjectsFromArray:v18];
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F9A0E0];
      v27 = [v8 text];
      v28 = [v26 textWithString:v27];
      v95[0] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
      [v10 addObjectsFromArray:v29];
    }
    v30 = objc_opt_new();
    [v30 setFormattedTextPieces:v10];
    v94 = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    [v9 setDescriptions:v31];

    int v32 = isMacOS();
    v33 = objc_opt_new();
    v34 = [(SSNoteResultBuilder *)self folder];
    uint64_t v35 = [v34 length];

    if (v32)
    {
      if (v35)
      {
        v36 = [(SSNoteResultBuilder *)self folder];
        [v33 addObject:v36];
      }
      v37 = [(SSNoteResultBuilder *)self account];
      uint64_t v38 = [v37 length];

      if (v38)
      {
        v39 = [(SSNoteResultBuilder *)self account];
        [v33 addObject:v39];
      }
      v40 = [v33 componentsJoinedByString:@" · "];
      if ([v40 length])
      {
        v41 = objc_opt_new();
        v42 = [NSString stringWithFormat:@" — %@", v40];
        v85 = v41;
        [v41 setText:v42];

        v43 = [v9 title];
        v44 = [v43 formattedTextPieces];
        [v44 arrayByAddingObject:v41];
        v45 = v10;
        v46 = v33;
        v47 = v30;
        v49 = v48 = v8;
        v50 = [v9 title];
        [v50 setFormattedTextPieces:v49];

        v8 = v48;
        v30 = v47;
        v33 = v46;
        v10 = v45;

        v51 = [v9 title];
        v52 = [v51 formattedTextPieces];
        v53 = [v52 firstObject];
        [v53 setIsEmphasized:1];
      }
    }
    else
    {
      if (v35)
      {
        v54 = objc_opt_new();
        [v54 setSymbolName:@"folder"];
        [v54 setIsTemplate:1];
        v55 = objc_opt_new();
        [v55 setGlyph:v54];
        [v33 addObject:v55];
        v56 = (void *)MEMORY[0x1E4F9A0E0];
        v57 = NSString;
        [(SSNoteResultBuilder *)self folder];
        v86 = v30;
        v59 = v58 = v8;
        v60 = [v57 stringWithFormat:@" %@", v59];
        v61 = [v56 textWithString:v60];
        [v33 addObject:v61];

        v8 = v58;
        v30 = v86;
      }
      v62 = [(SSNoteResultBuilder *)self account];
      uint64_t v63 = [v62 length];

      if (v63)
      {
        v64 = (void *)MEMORY[0x1E4F9A0E0];
        v65 = NSString;
        v66 = [(SSNoteResultBuilder *)self folder];
        if ([v66 length]) {
          v67 = @" — ";
        }
        else {
          v67 = &stru_1F1824018;
        }
        v68 = [(SSNoteResultBuilder *)self account];
        v69 = [v65 stringWithFormat:@"%@%@", v67, v68];
        v70 = [v64 textWithString:v69];
        [v33 addObject:v70];
      }
      if ([v33 count])
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v71 = v33;
        uint64_t v72 = [v71 countByEnumeratingWithState:&v87 objects:v93 count:16];
        if (v72)
        {
          uint64_t v73 = v72;
          uint64_t v74 = *(void *)v88;
          do
          {
            for (uint64_t i = 0; i != v73; ++i)
            {
              if (*(void *)v88 != v74) {
                objc_enumerationMutation(v71);
              }
              [*(id *)(*((void *)&v87 + 1) + 8 * i) setIsEmphasized:1];
            }
            uint64_t v73 = [v71 countByEnumeratingWithState:&v87 objects:v93 count:16];
          }
          while (v73);
        }

        v76 = objc_opt_new();
        v77 = (void *)[v71 copy];
        [v76 setFormattedTextPieces:v77];

        [v9 setFootnote:v76];
      }
      v40 = [v9 footnote];
      if (v40) {
        uint64_t v78 = 1;
      }
      else {
        uint64_t v78 = 2;
      }
      [v30 setMaxLines:v78];
    }
  }
  else
  {
    v19 = [(SSNoteResultBuilder *)self modificationDate];

    if (v19)
    {
      v20 = +[SSDateFormatManager shortDateTimeFormatter];
      v21 = [(SSNoteResultBuilder *)self modificationDate];
      v22 = [v20 stringFromDate:v21];

      v23 = +[SSDateFormatManager dateModifiedStringFormat];
      if (SSSnippetModernizationEnabled())
      {
        v10 = 0;
      }
      else
      {
        v79 = (void *)MEMORY[0x1E4F9A378];
        v80 = objc_msgSend(NSString, "stringWithFormat:", v23, v22);
        v10 = [v79 textWithString:v80];
      }
    }
    else
    {
      v10 = 0;
    }
    v92 = v8;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    [v9 setDescriptions:v81];

    v82 = [v9 descriptions];
    v83 = [v82 firstObject];
    [v83 setMaxLines:2];

    [v9 setFootnote:v10];
  }

  return v9;
}

- (id)buildTitle
{
  v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x1E4F9A0E0];
  v5 = [(SSNoteResultBuilder *)self title];
  id v6 = [v4 textWithString:v5];

  [v6 setIsEmphasized:1];
  [v3 addObject:v6];
  if (SSSnippetModernizationEnabled())
  {
    if ([(SSNoteResultBuilder *)self isShared])
    {
      v7 = [v6 text];
      v8 = [v7 stringByAppendingString:@" "];
      [v6 setText:v8];

      v9 = objc_opt_new();
      v10 = v9;
      v11 = @"person.crop.circle";
    }
    else
    {
      if (![(SSNoteResultBuilder *)self isLocked]) {
        goto LABEL_7;
      }
      v12 = [v6 text];
      v13 = [v12 stringByAppendingString:@" "];
      [v6 setText:v13];

      v9 = objc_opt_new();
      v10 = v9;
      v11 = @"lock.fill";
    }
    [v9 setSymbolName:v11];
    [v10 setIsTemplate:1];
    v14 = objc_opt_new();
    [v14 setGlyph:v10];
    [v3 addObject:v14];
  }
LABEL_7:
  v15 = objc_opt_new();
  v16 = (void *)[v3 copy];
  [v15 setFormattedTextPieces:v16];

  return v15;
}

- (id)buildCompactCardSection
{
  v3 = objc_opt_new();
  id v4 = [(SSNoteResultBuilder *)self modificationDate];

  if (v4)
  {
    v5 = [(SSNoteResultBuilder *)self modificationDate];
    id v6 = +[SSDateFormatManager dynamicDateTimeStringsFromDate:v5];
    [v3 addObjectsFromArray:v6];
  }
  v7 = [(SSNoteResultBuilder *)self formattedBody];
  if (v7)
  {
    v8 = [(id)objc_opt_class() whiteSpaceCondensedStringForString:v7];
    [v3 addObject:v8];
  }
  v12.receiver = self;
  v12.super_class = (Class)SSNoteResultBuilder;
  v9 = [(SSResultBuilder *)&v12 buildCompactCardSection];
  v10 = [(id)objc_opt_class() richTextsFromStrings:v3];
  [v9 setDescriptions:v10];

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)formattedBody
{
  return self->_formattedBody;
}

- (void)setFormattedBody:(id)a3
{
}

- (NSString)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_formattedBody, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end