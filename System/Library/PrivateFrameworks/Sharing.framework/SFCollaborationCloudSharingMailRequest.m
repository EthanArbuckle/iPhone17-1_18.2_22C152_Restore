@interface SFCollaborationCloudSharingMailRequest
+ (BOOL)supportsSecureCoding;
- (CKContainerSetupInfo)setupInfo;
- (CKShare)share;
- (NSData)appIconData;
- (NSNumber)accessType;
- (NSNumber)allowOthersToInvite;
- (NSNumber)permissionType;
- (NSString)appName;
- (NSURL)fileOrFolderURL;
- (NSURL)sharingURL;
- (NSUUID)collaborationItemIdentifier;
- (SFCollaborationCloudSharingMailRequest)initWithCloudSharingRequest:(id)a3 result:(id)a4;
- (SFCollaborationCloudSharingMailRequest)initWithCoder:(id)a3;
- (SFCollaborationCloudSharingMailRequest)initWithCollaborationItemIdentifier:(id)a3 fileOrFolderURL:(id)a4 share:(id)a5 setupInfo:(id)a6 sharingURL:(id)a7 accessType:(id)a8 permissionType:(id)a9 allowOthersToInvite:(id)a10 appName:(id)a11 appIconData:(id)a12;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCollaborationCloudSharingMailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingMailRequest)initWithCollaborationItemIdentifier:(id)a3 fileOrFolderURL:(id)a4 share:(id)a5 setupInfo:(id)a6 sharingURL:(id)a7 accessType:(id)a8 permissionType:(id)a9 allowOthersToInvite:(id)a10 appName:(id)a11 appIconData:(id)a12
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v28 = a5;
  id v34 = a5;
  id v33 = a6;
  id v29 = a7;
  id v32 = a7;
  id v31 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)SFCollaborationCloudSharingMailRequest;
  v22 = [(SFCollaborationCloudSharingMailRequest *)&v37 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_collaborationItemIdentifier, a3);
    objc_storeStrong((id *)&v23->_fileOrFolderURL, obj);
    objc_storeStrong((id *)&v23->_share, v28);
    objc_storeStrong((id *)&v23->_setupInfo, a6);
    objc_storeStrong((id *)&v23->_sharingURL, v29);
    objc_storeStrong((id *)&v23->_accessType, a8);
    objc_storeStrong((id *)&v23->_permissionType, a9);
    objc_storeStrong((id *)&v23->_allowOthersToInvite, a10);
    uint64_t v24 = [v20 copy];
    appName = v23->_appName;
    v23->_appName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_appIconData, a12);
  }

  return v23;
}

- (SFCollaborationCloudSharingMailRequest)initWithCloudSharingRequest:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 collaborationItemIdentifier];
  id v19 = [v7 fileOrFolderURL];
  v9 = [v6 share];
  id v18 = [v7 setupInfo];
  v10 = [v6 sharingURL];

  v11 = [v7 accessType];
  v12 = [v7 permissionType];
  v13 = [v7 allowOthersToInvite];
  v14 = [v7 appName];
  v15 = [v7 appIconData];

  v17 = [(SFCollaborationCloudSharingMailRequest *)self initWithCollaborationItemIdentifier:v8 fileOrFolderURL:v19 share:v9 setupInfo:v18 sharingURL:v10 accessType:v11 permissionType:v12 allowOthersToInvite:v13 appName:v14 appIconData:v15];
  return v17;
}

- (SFCollaborationCloudSharingMailRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborationItemIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileOrFolderURL"];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v7 = (void *)getCKShareClass_softClass;
  uint64_t v32 = getCKShareClass_softClass;
  if (!getCKShareClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getCKShareClass_block_invoke;
    v27 = &unk_1E5BBBFF8;
    id v28 = &v29;
    __getCKShareClass_block_invoke((uint64_t)&v24);
    id v7 = (void *)v30[3];
  }
  id v20 = self;
  v22 = (void *)v6;
  v23 = (void *)v5;
  id v8 = v7;
  _Block_object_dispose(&v29, 8);
  id v19 = [v4 decodeObjectOfClass:v8 forKey:@"share"];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v9 = (void *)getCKContainerSetupInfoClass_softClass;
  uint64_t v32 = getCKContainerSetupInfoClass_softClass;
  if (!getCKContainerSetupInfoClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getCKContainerSetupInfoClass_block_invoke;
    v27 = &unk_1E5BBBFF8;
    id v28 = &v29;
    __getCKContainerSetupInfoClass_block_invoke((uint64_t)&v24);
    v9 = (void *)v30[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v29, 8);
  v11 = [v4 decodeObjectOfClass:v10 forKey:@"setupInfo"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingURL"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessType"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"permissionType"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowOthersToInvite"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIconData"];
  id v21 = [(SFCollaborationCloudSharingMailRequest *)v20 initWithCollaborationItemIdentifier:v23 fileOrFolderURL:v22 share:v19 setupInfo:v11 sharingURL:v12 accessType:v13 permissionType:v14 allowOthersToInvite:v15 appName:v16 appIconData:v17];

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:collaborationItemIdentifier forKey:@"collaborationItemIdentifier"];
  [v5 encodeObject:self->_fileOrFolderURL forKey:@"fileOrFolderURL"];
  [v5 encodeObject:self->_share forKey:@"share"];
  [v5 encodeObject:self->_setupInfo forKey:@"setupInfo"];
  [v5 encodeObject:self->_sharingURL forKey:@"sharingURL"];
  [v5 encodeObject:self->_accessType forKey:@"accessType"];
  [v5 encodeObject:self->_permissionType forKey:@"permissionType"];
  [v5 encodeObject:self->_allowOthersToInvite forKey:@"allowOthersToInvite"];
  [v5 encodeObject:self->_appName forKey:@"appName"];
  [v5 encodeObject:self->_appIconData forKey:@"appIconData"];
}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSURL)fileOrFolderURL
{
  return self->_fileOrFolderURL;
}

- (CKShare)share
{
  return self->_share;
}

- (CKContainerSetupInfo)setupInfo
{
  return self->_setupInfo;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (NSNumber)accessType
{
  return self->_accessType;
}

- (NSNumber)permissionType
{
  return self->_permissionType;
}

- (NSNumber)allowOthersToInvite
{
  return self->_allowOthersToInvite;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_permissionType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_setupInfo, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_fileOrFolderURL, 0);

  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end