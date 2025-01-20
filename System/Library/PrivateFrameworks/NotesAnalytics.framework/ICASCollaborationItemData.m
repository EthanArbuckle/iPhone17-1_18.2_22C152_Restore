@interface ICASCollaborationItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationItemData)initWithCollaborationItemType:(id)a3;
- (ICASCollaborationItemType)collaborationItemType;
- (id)toDict;
@end

@implementation ICASCollaborationItemData

- (ICASCollaborationItemData)initWithCollaborationItemType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASCollaborationItemData;
  v6 = [(ICASCollaborationItemData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collaborationItemType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"CollaborationItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"collaborationItemType";
  v3 = [(ICASCollaborationItemData *)self collaborationItemType];
  if (v3)
  {
    uint64_t v4 = [(ICASCollaborationItemData *)self collaborationItemType];
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

- (ICASCollaborationItemType)collaborationItemType
{
  return self->_collaborationItemType;
}

- (void).cxx_destruct
{
}

@end