@interface SFCollaborationCloudSharingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)existingShare;
- (CKShare)share;
- (NSError)error;
- (NSURL)sharingURL;
- (NSUUID)collaborationItemIdentifier;
- (SFCollaborationCloudSharingMailResult)mailResult;
- (SFCollaborationCloudSharingResult)initWithCoder:(id)a3;
- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 error:(id)a6 mailResult:(id)a7;
- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 existingShare:(BOOL)a6 error:(id)a7 mailResult:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)setMailResult:(id)a3;
@end

@implementation SFCollaborationCloudSharingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 error:(id)a6 mailResult:(id)a7
{
  return [(SFCollaborationCloudSharingResult *)self initWithCollaborationItemIdentifier:a3 sharingURL:a4 share:a5 existingShare:0 error:a6 mailResult:a7];
}

- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 existingShare:(BOOL)a6 error:(id)a7 mailResult:(id)a8
{
  id v14 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (!v14)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"SFCollaborationCloudSharingRequest.m" lineNumber:51 description:@"collaborationItemIdentifier is nil."];
  }
  v25.receiver = self;
  v25.super_class = (Class)SFCollaborationCloudSharingResult;
  v18 = [(SFCollaborationCloudSharingResult *)&v25 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    collaborationItemIdentifier = v18->_collaborationItemIdentifier;
    v18->_collaborationItemIdentifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_sharingURL, a4);
    objc_storeStrong((id *)&v18->_share, a5);
    v18->_existingShare = a6;
    objc_storeStrong((id *)&v18->_error, a7);
    objc_storeStrong((id *)&v18->_mailResult, a8);
  }

  return v18;
}

- (SFCollaborationCloudSharingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborationItemIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingURL"];
  v7 = [v4 decodeObjectOfClass:getCKShareClass() forKey:@"share"];
  uint64_t v8 = [v4 decodeBoolForKey:@"existingShare"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mailResult"];

  v11 = [(SFCollaborationCloudSharingResult *)self initWithCollaborationItemIdentifier:v5 sharingURL:v6 share:v7 existingShare:v8 error:v9 mailResult:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:collaborationItemIdentifier forKey:@"collaborationItemIdentifier"];
  [v5 encodeObject:self->_sharingURL forKey:@"sharingURL"];
  [v5 encodeObject:self->_share forKey:@"share"];
  [v5 encodeBool:self->_existingShare forKey:@"existingShare"];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeObject:self->_mailResult forKey:@"mailResult"];
}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (CKShare)share
{
  return self->_share;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)existingShare
{
  return self->_existingShare;
}

- (SFCollaborationCloudSharingMailResult)mailResult
{
  return self->_mailResult;
}

- (void)setMailResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);

  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end