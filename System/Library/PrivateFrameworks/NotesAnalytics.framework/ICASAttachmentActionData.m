@interface ICASAttachmentActionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASActionType)actionType;
- (ICASAttachmentActionData)initWithActionType:(id)a3;
- (id)toDict;
@end

@implementation ICASAttachmentActionData

- (ICASAttachmentActionData)initWithActionType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASAttachmentActionData;
  v6 = [(ICASAttachmentActionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_actionType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"AttachmentActionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"actionType";
  v3 = [(ICASAttachmentActionData *)self actionType];
  if (v3)
  {
    uint64_t v4 = [(ICASAttachmentActionData *)self actionType];
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

- (ICASActionType)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
}

@end