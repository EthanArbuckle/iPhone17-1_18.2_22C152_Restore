@interface ICLinkConverter
+ (NSString)convertAttachmentToLinkActionTitle;
+ (NSString)convertAttachmentToLinkSystemImageName;
+ (NSString)convertLinkToAttachmentActionTitle;
+ (NSString)convertLinkToAttachmentSystemImageName;
- (BOOL)canConvertAttachmentToLink:(id)a3;
- (BOOL)canConvertLinkAtLocationToAttachment:(unint64_t)a3;
- (ICAttachmentInsertionController)insertionController;
- (ICLinkConverter)initWithInsertionController:(id)a3;
- (ICTTTextStorage)textStorage;
- (void)convertAttachmentToLink:(id)a3;
- (void)convertLinkAtLocationToAttachment:(unint64_t)a3;
- (void)setInsertionController:(id)a3;
@end

@implementation ICLinkConverter

- (ICLinkConverter)initWithInsertionController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICLinkConverter;
  v5 = [(ICLinkConverter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_insertionController, v4);
  }

  return v6;
}

- (ICTTTextStorage)textStorage
{
  v2 = [(ICLinkConverter *)self insertionController];
  v3 = [v2 note];
  id v4 = [v3 textStorage];

  return (ICTTTextStorage *)v4;
}

+ (NSString)convertAttachmentToLinkActionTitle
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Convert to Plain Link" value:@"Convert to Plain Link" table:0 allowSiri:1];
}

+ (NSString)convertAttachmentToLinkSystemImageName
{
  return (NSString *)@"link";
}

- (BOOL)canConvertAttachmentToLink:(id)a3
{
  id v4 = a3;
  if (ICInternalSettingsIsLinkConversionEnabled())
  {
    v5 = [(ICLinkConverter *)self insertionController];
    v6 = [v5 note];
    if (v6 && ([v4 needsInitialFetchFromCloud] & 1) == 0)
    {
      objc_super v8 = [v4 parentAttachment];
      if (!v8 && [v4 isUsed] && objc_msgSend(v4, "isURL"))
      {
        v9 = [v4 URL];
        BOOL v7 = v9 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)convertAttachmentToLink:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICLinkConverter *)self canConvertAttachmentToLink:v4])
  {
    v5 = [v4 title];
    v6 = v5;
    if (v5)
    {
      BOOL v7 = v5;
    }
    else
    {
      BOOL v7 = [v4 urlString];
    }
    v9 = v7;

    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v22 = *MEMORY[0x1E4FB0720];
    v11 = [v4 URL];
    v23[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    objc_super v8 = [v10 initWithString:v9 attributes:v12];

    v13 = [(ICLinkConverter *)self textStorage];
    uint64_t v14 = [v4 rangeInNote];
    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v14, v15, v8);

    v16 = [(ICLinkConverter *)self textStorage];
    [v16 fixupAfterEditing];

    [MEMORY[0x1E4F832A0] deleteAttachment:v4];
    v17 = [(ICLinkConverter *)self insertionController];
    v18 = [v17 note];
    [v18 updateModificationDateAndChangeCountAndSaveImmediately];

    v19 = [(ICLinkConverter *)self textStorage];
    v20 = [v19 undoManager];
    v21 = [(id)objc_opt_class() convertAttachmentToLinkActionTitle];
    [v20 setActionName:v21];
  }
  else
  {
    objc_super v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ICLinkConverter *)self convertAttachmentToLink:v8];
    }
    v9 = v8;
  }
}

+ (NSString)convertLinkToAttachmentActionTitle
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Show Link Preview" value:@"Show Link Preview" table:0 allowSiri:1];
}

+ (NSString)convertLinkToAttachmentSystemImageName
{
  return (NSString *)@"photo";
}

- (BOOL)canConvertLinkAtLocationToAttachment:(unint64_t)a3
{
  objc_opt_class();
  v5 = [(ICLinkConverter *)self textStorage];
  v6 = [v5 attribute:*MEMORY[0x1E4FB0720] atIndex:a3 effectiveRange:0];
  BOOL v7 = ICCheckedDynamicCast();

  if (ICInternalSettingsIsLinkConversionEnabled())
  {
    objc_super v8 = [v7 scheme];
    if ([v8 isEqual:@"http"])
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [v7 scheme];
      char v9 = [v10 isEqual:@"https"];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)convertLinkAtLocationToAttachment:(unint64_t)a3
{
  if (-[ICLinkConverter canConvertLinkAtLocationToAttachment:](self, "canConvertLinkAtLocationToAttachment:"))
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    objc_opt_class();
    v5 = [(ICLinkConverter *)self textStorage];
    v6 = [v5 attribute:*MEMORY[0x1E4FB0720] atIndex:a3 effectiveRange:&v21];
    BOOL v7 = ICCheckedDynamicCast();

    objc_super v8 = [(ICLinkConverter *)self insertionController];
    char v9 = [v8 note];
    id v10 = [v9 addURLAttachmentWithURL:v7];

    v11 = [(ICLinkConverter *)self textStorage];
    v12 = objc_msgSend(v11, "attributedSubstringFromRange:", v21, v22);
    v13 = [v12 string];
    [v10 setTitle:v13];

    uint64_t v14 = [(ICLinkConverter *)self insertionController];
    id v15 = (id)objc_msgSend(v14, "addAttachment:atTextRange:", v10, v21, v22);

    v16 = [(ICLinkConverter *)self insertionController];
    v17 = [v16 note];
    [v17 updateModificationDateAndChangeCountAndSaveImmediately];

    v18 = [(ICLinkConverter *)self textStorage];
    v19 = [v18 undoManager];
    v20 = [(id)objc_opt_class() convertLinkToAttachmentActionTitle];
    [v19 setActionName:v20];
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICLinkConverter convertLinkAtLocationToAttachment:](self, v7);
    }
  }
}

- (ICAttachmentInsertionController)insertionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insertionController);
  return (ICAttachmentInsertionController *)WeakRetained;
}

- (void)setInsertionController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)convertAttachmentToLink:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = [a1 insertionController];
  v6 = [v5 note];
  BOOL v7 = [v6 shortLoggingDescription];
  objc_super v8 = [a2 shortLoggingDescription];
  int v9 = 138412546;
  id v10 = v7;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Cannot convert attachment to link {note: %@, attachment: %@}", (uint8_t *)&v9, 0x16u);
}

- (void)convertLinkAtLocationToAttachment:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [a1 insertionController];
  id v4 = [v3 note];
  v5 = [v4 shortLoggingDescription];
  int v6 = 138412290;
  BOOL v7 = v5;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Cannot convert link to attachment {note: %@}", (uint8_t *)&v6, 0xCu);
}

@end