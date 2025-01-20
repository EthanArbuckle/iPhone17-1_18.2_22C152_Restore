@interface ICASPdfAttachmentData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPdfAttachmentData)initWithAttachmentID:(id)a3 hasActivity:(id)a4;
- (NSNumber)hasActivity;
- (NSString)attachmentID;
- (id)toDict;
@end

@implementation ICASPdfAttachmentData

- (ICASPdfAttachmentData)initWithAttachmentID:(id)a3 hasActivity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPdfAttachmentData;
  v9 = [(ICASPdfAttachmentData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentID, a3);
    objc_storeStrong((id *)&v10->_hasActivity, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PdfAttachmentData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"attachmentID";
  v3 = [(ICASPdfAttachmentData *)self attachmentID];
  if (v3)
  {
    uint64_t v4 = [(ICASPdfAttachmentData *)self attachmentID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"hasActivity";
  v12[0] = v4;
  v6 = [(ICASPdfAttachmentData *)self hasActivity];
  if (v6)
  {
    uint64_t v7 = [(ICASPdfAttachmentData *)self hasActivity];
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

- (NSNumber)hasActivity
{
  return self->_hasActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasActivity, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end