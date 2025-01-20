@interface ICCalculateResultAttachmentView
- (id)accessibilityCustomContent;
- (id)accessibilityHint;
- (id)axValue;
- (id)calculateResultTextAttachment;
@end

@implementation ICCalculateResultAttachmentView

- (id)accessibilityHint
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Double tap to edit the expression that produced this result" value:@"Double tap to edit the expression that produced this result" table:0 allowSiri:1];
}

- (id)accessibilityCustomContent
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Expression" value:@"Expression" table:0 allowSiri:1];
  v6 = (void *)[v4 initWithString:v5];

  uint64_t v14 = *MEMORY[0x1E4FB24D8];
  v15[0] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  v9 = [(ICCalculateResultAttachmentView *)self calculateResultTextAttachment];
  v10 = [v9 expression];
  v11 = (void *)[v8 initWithString:v10 attributes:v7];

  v12 = [MEMORY[0x1E4F17478] customContentWithAttributedLabel:v6 attributedValue:v11];
  [v3 addObject:v12];

  return v3;
}

- (id)axValue
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ICCalculateResultAttachmentView *)self calculateResultTextAttachment];
  id v4 = [v3 attachment];
  char v5 = [v4 isValidCalculateAttachment];

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Calculation error" value:@"Calculation error" table:0 allowSiri:1];
    v14[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v10 = [v7 arrayWithArray:v9];

    v11 = [(ICCalculateResultAttachmentView *)self calculateResultTextAttachment];
    v12 = [v11 localizedError];

    if ([v12 length]) {
      [v10 addObject:v12];
    }
    v6 = [v10 componentsJoinedByString:@", "];
  }
  return v6;
}

- (id)calculateResultTextAttachment
{
  objc_opt_class();
  v3 = [(ICInlineAttachmentView *)self textAttachment];
  id v4 = ICDynamicCast();

  return v4;
}

@end