@interface ICASCollaborationActionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationActionData)initWithCollaborationActionType:(id)a3 collaborationInviteStep:(id)a4 collaborationMethod:(id)a5;
- (ICASCollaborationActionType)collaborationActionType;
- (ICASCollaborationInviteStep)collaborationInviteStep;
- (NSString)collaborationMethod;
- (id)toDict;
@end

@implementation ICASCollaborationActionData

- (ICASCollaborationActionData)initWithCollaborationActionType:(id)a3 collaborationInviteStep:(id)a4 collaborationMethod:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASCollaborationActionData;
  v12 = [(ICASCollaborationActionData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collaborationActionType, a3);
    objc_storeStrong((id *)&v13->_collaborationInviteStep, a4);
    objc_storeStrong((id *)&v13->_collaborationMethod, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"CollaborationActionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"collaborationActionType";
  v3 = [(ICASCollaborationActionData *)self collaborationActionType];
  if (v3)
  {
    uint64_t v4 = [(ICASCollaborationActionData *)self collaborationActionType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"collaborationInviteStep";
  v6 = [(ICASCollaborationActionData *)self collaborationInviteStep];
  if (v6)
  {
    uint64_t v7 = [(ICASCollaborationActionData *)self collaborationInviteStep];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"collaborationMethod";
  id v9 = [(ICASCollaborationActionData *)self collaborationMethod];
  if (v9)
  {
    uint64_t v10 = [(ICASCollaborationActionData *)self collaborationMethod];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASCollaborationActionType)collaborationActionType
{
  return self->_collaborationActionType;
}

- (ICASCollaborationInviteStep)collaborationInviteStep
{
  return self->_collaborationInviteStep;
}

- (NSString)collaborationMethod
{
  return self->_collaborationMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMethod, 0);
  objc_storeStrong((id *)&self->_collaborationInviteStep, 0);
  objc_storeStrong((id *)&self->_collaborationActionType, 0);
}

@end