@interface SFCollaborationCloudSharingMailResult
+ (BOOL)supportsSecureCoding;
- (CKContainerID)containerID;
- (NSError)error;
- (NSNumber)allowOthersToInvite;
- (NSNumber)canEdit;
- (NSString)body;
- (NSString)subject;
- (SFCollaborationCloudSharingMailResult)initWithCoder:(id)a3;
- (SFCollaborationCloudSharingMailResult)initWithSubject:(id)a3 body:(id)a4 containerID:(id)a5 canEdit:(id)a6 allowOthersToInvite:(id)a7 error:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCollaborationCloudSharingMailResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingMailResult)initWithSubject:(id)a3 body:(id)a4 containerID:(id)a5 canEdit:(id)a6 allowOthersToInvite:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SFCollaborationCloudSharingMailResult;
  v19 = [(SFCollaborationCloudSharingMailResult *)&v26 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    subject = v19->_subject;
    v19->_subject = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    body = v19->_body;
    v19->_body = (NSString *)v22;

    objc_storeStrong((id *)&v19->_containerID, a5);
    objc_storeStrong((id *)&v19->_canEdit, a6);
    objc_storeStrong((id *)&v19->_allowOthersToInvite, a7);
    objc_storeStrong((id *)&v19->_error, a8);
  }

  return v19;
}

- (SFCollaborationCloudSharingMailResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v7 = (void *)getCKContainerIDClass_softClass;
  uint64_t v19 = getCKContainerIDClass_softClass;
  if (!getCKContainerIDClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getCKContainerIDClass_block_invoke;
    v15[3] = &unk_1E5BBBFF8;
    v15[4] = &v16;
    __getCKContainerIDClass_block_invoke((uint64_t)v15);
    v7 = (void *)v17[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v16, 8);
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"containerID"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canEdit"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowOthersToInvite"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v13 = [(SFCollaborationCloudSharingMailResult *)self initWithSubject:v5 body:v6 containerID:v9 canEdit:v10 allowOthersToInvite:v11 error:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  subject = self->_subject;
  id v5 = a3;
  [v5 encodeObject:subject forKey:@"subject"];
  [v5 encodeObject:self->_body forKey:@"body"];
  [v5 encodeObject:self->_containerID forKey:@"containerID"];
  [v5 encodeObject:self->_canEdit forKey:@"canEdit"];
  [v5 encodeObject:self->_allowOthersToInvite forKey:@"allowOthersToInvite"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSNumber)canEdit
{
  return self->_canEdit;
}

- (NSNumber)allowOthersToInvite
{
  return self->_allowOthersToInvite;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_canEdit, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_subject, 0);
}

@end