@interface ICASStartCollaborationCollaboratorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASStartCollaborationCollaboratorData)initWithStartInvitedCount:(id)a3 startAcceptedCount:(id)a4;
- (NSNumber)startAcceptedCount;
- (NSNumber)startInvitedCount;
- (id)toDict;
@end

@implementation ICASStartCollaborationCollaboratorData

- (ICASStartCollaborationCollaboratorData)initWithStartInvitedCount:(id)a3 startAcceptedCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASStartCollaborationCollaboratorData;
  v9 = [(ICASStartCollaborationCollaboratorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startInvitedCount, a3);
    objc_storeStrong((id *)&v10->_startAcceptedCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"StartCollaborationCollaboratorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"startInvitedCount";
  v3 = [(ICASStartCollaborationCollaboratorData *)self startInvitedCount];
  if (v3)
  {
    uint64_t v4 = [(ICASStartCollaborationCollaboratorData *)self startInvitedCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"startAcceptedCount";
  v12[0] = v4;
  v6 = [(ICASStartCollaborationCollaboratorData *)self startAcceptedCount];
  if (v6)
  {
    uint64_t v7 = [(ICASStartCollaborationCollaboratorData *)self startAcceptedCount];
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

- (NSNumber)startInvitedCount
{
  return self->_startInvitedCount;
}

- (NSNumber)startAcceptedCount
{
  return self->_startAcceptedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAcceptedCount, 0);
  objc_storeStrong((id *)&self->_startInvitedCount, 0);
}

@end