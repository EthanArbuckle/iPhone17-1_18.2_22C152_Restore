@interface ICASAttachmentSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAttachmentSnapshotItemData)initWithAttachmentID:(id)a3 attachmentTypeUTI:(id)a4;
- (NSString)attachmentID;
- (NSString)attachmentTypeUTI;
- (id)toDict;
@end

@implementation ICASAttachmentSnapshotItemData

- (ICASAttachmentSnapshotItemData)initWithAttachmentID:(id)a3 attachmentTypeUTI:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASAttachmentSnapshotItemData;
  v9 = [(ICASAttachmentSnapshotItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentID, a3);
    objc_storeStrong((id *)&v10->_attachmentTypeUTI, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"AttachmentSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"attachmentID";
  v3 = [(ICASAttachmentSnapshotItemData *)self attachmentID];
  if (v3)
  {
    uint64_t v4 = [(ICASAttachmentSnapshotItemData *)self attachmentID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"attachmentTypeUTI";
  v12[0] = v4;
  v6 = [(ICASAttachmentSnapshotItemData *)self attachmentTypeUTI];
  if (v6)
  {
    uint64_t v7 = [(ICASAttachmentSnapshotItemData *)self attachmentTypeUTI];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (NSString)attachmentTypeUTI
{
  return self->_attachmentTypeUTI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentTypeUTI, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end