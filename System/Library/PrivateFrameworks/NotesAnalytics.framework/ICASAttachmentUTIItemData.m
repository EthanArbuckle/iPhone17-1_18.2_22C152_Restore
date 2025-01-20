@interface ICASAttachmentUTIItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAttachmentUTIItemData)initWithUti:(id)a3 countOfAttachments:(id)a4;
- (NSNumber)countOfAttachments;
- (NSString)uti;
- (id)toDict;
@end

@implementation ICASAttachmentUTIItemData

- (ICASAttachmentUTIItemData)initWithUti:(id)a3 countOfAttachments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASAttachmentUTIItemData;
  v9 = [(ICASAttachmentUTIItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uti, a3);
    objc_storeStrong((id *)&v10->_countOfAttachments, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"AttachmentUTIItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"uti";
  v3 = [(ICASAttachmentUTIItemData *)self uti];
  if (v3)
  {
    uint64_t v4 = [(ICASAttachmentUTIItemData *)self uti];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"countOfAttachments";
  v12[0] = v4;
  v6 = [(ICASAttachmentUTIItemData *)self countOfAttachments];
  if (v6)
  {
    uint64_t v7 = [(ICASAttachmentUTIItemData *)self countOfAttachments];
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

- (NSString)uti
{
  return self->_uti;
}

- (NSNumber)countOfAttachments
{
  return self->_countOfAttachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfAttachments, 0);
  objc_storeStrong((id *)&self->_uti, 0);
}

@end