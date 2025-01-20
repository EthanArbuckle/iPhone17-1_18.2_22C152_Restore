@interface ICASAttachmentData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAttachmentData)initWithAttachmentSummary:(id)a3;
- (NSArray)attachmentSummary;
- (id)toDict;
@end

@implementation ICASAttachmentData

- (ICASAttachmentData)initWithAttachmentSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASAttachmentData;
  v6 = [(ICASAttachmentData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attachmentSummary, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"AttachmentData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"attachmentSummary";
  v3 = [(ICASAttachmentData *)self attachmentSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASAttachmentData *)self attachmentSummary];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (NSArray)attachmentSummary
{
  return self->_attachmentSummary;
}

- (void).cxx_destruct
{
}

@end