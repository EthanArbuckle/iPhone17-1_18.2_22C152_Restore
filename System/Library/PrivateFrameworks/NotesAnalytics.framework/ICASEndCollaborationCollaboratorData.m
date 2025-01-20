@interface ICASEndCollaborationCollaboratorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndCollaborationCollaboratorData)initWithEndInvitedCount:(id)a3 endAcceptedCount:(id)a4;
- (NSNumber)endAcceptedCount;
- (NSNumber)endInvitedCount;
- (id)toDict;
@end

@implementation ICASEndCollaborationCollaboratorData

- (ICASEndCollaborationCollaboratorData)initWithEndInvitedCount:(id)a3 endAcceptedCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASEndCollaborationCollaboratorData;
  v9 = [(ICASEndCollaborationCollaboratorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endInvitedCount, a3);
    objc_storeStrong((id *)&v10->_endAcceptedCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"EndCollaborationCollaboratorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"endInvitedCount";
  v3 = [(ICASEndCollaborationCollaboratorData *)self endInvitedCount];
  if (v3)
  {
    uint64_t v4 = [(ICASEndCollaborationCollaboratorData *)self endInvitedCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"endAcceptedCount";
  v12[0] = v4;
  v6 = [(ICASEndCollaborationCollaboratorData *)self endAcceptedCount];
  if (v6)
  {
    uint64_t v7 = [(ICASEndCollaborationCollaboratorData *)self endAcceptedCount];
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

- (NSNumber)endInvitedCount
{
  return self->_endInvitedCount;
}

- (NSNumber)endAcceptedCount
{
  return self->_endAcceptedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endAcceptedCount, 0);
  objc_storeStrong((id *)&self->_endInvitedCount, 0);
}

@end