@interface SSMailResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (NSArray)recipientEmails;
- (NSArray)recipients;
- (NSDate)creationDate;
- (NSString)author;
- (NSString)authorEmail;
- (NSString)body;
- (NSString)subject;
- (SSMailResultBuilder)initWithResult:(id)a3;
- (id)buildCompactCardSection;
- (id)buildInlineCardSection;
- (id)buildRecipientsString;
- (id)buildThumbnail;
- (id)fallbackTitleString;
- (id)resultAppBundleId;
- (unint64_t)numberOfLinesForDescriptions;
- (void)setAuthor:(id)a3;
- (void)setAuthorEmail:(id)a3;
- (void)setBody:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setRecipientEmails:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation SSMailResultBuilder

+ (id)bundleId
{
  return @"com.apple.mobilemail";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSMailResultBuilder;
  if (objc_msgSendSuper2(&v8, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 resultBundleId];
    char v5 = [v6 isEqualToString:@"com.apple.email.SearchIndexer"];
  }
  return v5;
}

- (SSMailResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSMailResultBuilder;
  char v5 = [(SSResultBuilder *)&v26 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22B30] withType:objc_opt_class()];
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22B18] withType:objc_opt_class()];
    objc_super v8 = [v4 valueForAttribute:*MEMORY[0x1E4F234B0] withType:objc_opt_class()];
    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F234A8] withType:objc_opt_class()];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = [(SSResultBuilder *)v5 result];
      id v11 = [v12 valueForAttribute:*MEMORY[0x1E4F233C8] withType:objc_opt_class()];
    }
    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSMailResultBuilder *)v5 setCreationDate:v13];

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
    [(SSMailResultBuilder *)v5 setBody:v14];

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F235C0] withType:objc_opt_class()];
    if (v15)
    {
      [(SSMailResultBuilder *)v5 setSubject:v15];
    }
    else
    {
      v16 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
      [(SSMailResultBuilder *)v5 setSubject:v16];
    }
    v17 = [v11 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v11;
    }
    else {
      id v18 = 0;
    }
    [(SSMailResultBuilder *)v5 setRecipientEmails:v18];

    v19 = [v8 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v8;
    }
    else {
      v20 = 0;
    }
    [(SSMailResultBuilder *)v5 setRecipients:v20];

    v21 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [v7 firstObject];
      [(SSMailResultBuilder *)v5 setAuthorEmail:v22];
    }
    else
    {
      [(SSMailResultBuilder *)v5 setAuthorEmail:0];
    }

    v23 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [v6 firstObject];
      [(SSMailResultBuilder *)v5 setAuthor:v24];
    }
    else
    {
      [(SSMailResultBuilder *)v5 setAuthor:0];
    }
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  id v4 = [(SSMailResultBuilder *)self subject];
  char v5 = [v3 whiteSpaceCondensedStringForString:v4];

  v33 = v5;
  if (v5)
  {
    v6 = [MEMORY[0x1E4F9A0E0] textWithString:v5];
    [v6 setIsEmphasized:1];
    char v5 = objc_opt_new();
    v35[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v5 setFormattedTextPieces:v7];

    objc_super v8 = objc_opt_new();
    if (v5 && (isMacOS() & 1) == 0)
    {
      [v8 addObject:v5];
      v9 = [v8 lastObject];
      [v9 setMaxLines:1];
    }
  }
  else
  {
    objc_super v8 = objc_opt_new();
    v6 = 0;
  }
  v10 = [(SSMailResultBuilder *)self body];

  if (v10)
  {
    id v11 = [(SSMailResultBuilder *)self body];
    v12 = [(SSResultBuilder *)self matchedStrings];
    v13 = [v12 firstObject];
    if ([v11 isEqual:v13])
    {
      v14 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:0 headTruncation:1];
    }
    else
    {
      v14 = 0;
    }

    v15 = [v14 formattedTextPieces];

    if (v15)
    {
      [v8 addObject:v14];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F9A378];
      v17 = [(SSMailResultBuilder *)self body];
      id v18 = [v16 textWithString:v17];
      [v8 addObject:v18];
    }
    if (SSSnippetModernizationEnabled()) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    v20 = [v8 lastObject];
    [v20 setMaxLines:v19];
  }
  v21 = objc_opt_new();
  v22 = [(SSMailResultBuilder *)self author];
  if (v22
    || ([(SSMailResultBuilder *)self authorEmail],
        (v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v23 = [MEMORY[0x1E4F9A0E0] textWithString:v22];
    [v23 setIsEmphasized:1];
    [v21 addObject:v23];
  }
  if (v6 && isMacOS())
  {
    v24 = [MEMORY[0x1E4F9A0E0] textWithString:@" — "];
    [v21 addObject:v24];

    [v6 setIsEmphasized:0];
    [v21 addObject:v6];
  }
  v25 = objc_opt_new();
  [v25 setFormattedTextPieces:v21];
  v34.receiver = self;
  v34.super_class = (Class)SSMailResultBuilder;
  objc_super v26 = [(SSResultBuilder *)&v34 buildInlineCardSection];
  [v26 setTitle:v25];
  [v26 setDescriptions:v8];
  v27 = [(SSMailResultBuilder *)self creationDate];
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E4F9A0E0];
    v29 = [(SSMailResultBuilder *)self creationDate];
    v30 = +[SSDateFormatManager dynamicCompactStringFromDate:v29];
    v31 = [v28 textWithString:v30];
    [v26 setSecondaryTitle:v31];
  }
  else
  {
    [v26 setSecondaryTitle:0];
  }

  [v26 setIsSecondaryTitleDetached:1];
  return v26;
}

- (id)buildCompactCardSection
{
  v3 = [(SSMailResultBuilder *)self subject];
  if ([v3 length]) {
    [(SSMailResultBuilder *)self subject];
  }
  else {
  id v4 = [(SSMailResultBuilder *)self fallbackTitleString];
  }

  char v5 = objc_opt_new();
  v6 = [(SSMailResultBuilder *)self creationDate];
  if (v6)
  {
    v7 = +[SSDateFormatManager dynamicCompactStringFromDate:v6];
    [v5 addObject:v7];
  }
  objc_super v8 = [(SSMailResultBuilder *)self author];
  if (v8
    || ([(SSMailResultBuilder *)self authorEmail],
        (objc_super v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 addObject:v8];
  }
  v9 = [(SSMailResultBuilder *)self buildRecipientsString];
  if (v9) {
    [v5 addObject:v9];
  }
  v14.receiver = self;
  v14.super_class = (Class)SSMailResultBuilder;
  v10 = [(SSResultBuilder *)&v14 buildCompactCardSection];
  id v11 = [MEMORY[0x1E4F9A378] textWithString:v4];
  [v10 setTitle:v11];

  v12 = [(id)objc_opt_class() richTextsFromStrings:v5];
  [v10 setDescriptions:v12];

  return v10;
}

- (id)buildRecipientsString
{
  v3 = [(SSMailResultBuilder *)self recipients];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v3 count];
  if (!v4 || (unint64_t v6 = v5, ![v3 count]))
  {
    v7 = [(SSMailResultBuilder *)self recipientEmails];
    uint64_t v8 = [v7 firstObject];

    unint64_t v6 = [v7 count];
    id v4 = (void *)v8;
  }
  if (v4 && v6 >= 2)
  {
    v9 = NSString;
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"MAIL_RECIPIENT_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v11, v4, v6);

    id v4 = (void *)v12;
  }

  return v4;
}

- (id)fallbackTitleString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"NO_SUBJECT" value:&stru_1F1824018 table:@"SpotlightServices"];

  return v3;
}

- (id)buildThumbnail
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSMailResultBuilder *)self authorEmail];
  id v4 = +[SSContactStore contactWithEmail:v3];

  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    unint64_t v6 = [v4 identifier];
    v14[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setContactIdentifiers:v7];

    [v5 setThreeDTouchEnabled:1];
  }
  else
  {
    uint64_t v8 = [(SSMailResultBuilder *)self author];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      v10 = [(SSMailResultBuilder *)self author];
      id v11 = +[SSNameFormatManager contactFromName:v10];

      uint64_t v5 = objc_opt_new();
      uint64_t v12 = [MEMORY[0x1E4F1B910] stringFromContact:v11 style:1002];
      [v5 setMonogramLetters:v12];
    }
    else
    {
      uint64_t v5 = objc_opt_new();
    }
  }

  return v5;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (id)resultAppBundleId
{
  return @"com.apple.mobilemail";
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)authorEmail
{
  return self->_authorEmail;
}

- (void)setAuthorEmail:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipientEmails
{
  return self->_recipientEmails;
}

- (void)setRecipientEmails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientEmails, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_authorEmail, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end