@interface SFCollaborationCloudSharingRequest
+ (BOOL)supportsSecureCoding;
- (CKContainerSetupInfo)setupInfo;
- (CKShare)share;
- (NSArray)emailAddresses;
- (NSArray)options;
- (NSArray)phoneNumbers;
- (NSData)appIconData;
- (NSNumber)accessType;
- (NSNumber)allowOthersToInvite;
- (NSNumber)permissionType;
- (NSString)activityType;
- (NSString)appName;
- (NSURL)fileOrFolderURL;
- (NSUUID)collaborationItemIdentifier;
- (SFCollaborationCloudSharingRequest)initWithCoder:(id)a3;
- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 activityType:(id)a8;
- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9 activityType:(id)a10 appName:(id)a11 appIconData:(id)a12;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCollaborationCloudSharingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9 activityType:(id)a10 appName:(id)a11 appIconData:(id)a12
{
  id v48 = a3;
  id v18 = a4;
  *((void *)&v47 + 1) = a5;
  *(void *)&long long v47 = a6;
  id v46 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v45 = a12;
  v52.receiver = self;
  v52.super_class = (Class)SFCollaborationCloudSharingRequest;
  v23 = [(SFCollaborationCloudSharingRequest *)&v52 init];
  if (v23)
  {
    uint64_t v24 = [v48 copy];
    collaborationItemIdentifier = v23->_collaborationItemIdentifier;
    v23->_collaborationItemIdentifier = (NSUUID *)v24;

    uint64_t v26 = [v18 copy];
    options = v23->_options;
    v23->_options = (NSArray *)v26;

    objc_storeStrong((id *)&v23->_fileOrFolderURL, a5);
    objc_storeStrong((id *)&v23->_share, a6);
    objc_storeStrong((id *)&v23->_setupInfo, a7);
    uint64_t v28 = [v19 copy];
    phoneNumbers = v23->_phoneNumbers;
    v23->_phoneNumbers = (NSArray *)v28;

    uint64_t v30 = [v20 copy];
    emailAddresses = v23->_emailAddresses;
    v23->_emailAddresses = (NSArray *)v30;

    uint64_t v32 = [v21 copy];
    activityType = v23->_activityType;
    v23->_activityType = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    appName = v23->_appName;
    v23->_appName = (NSString *)v34;

    objc_storeStrong((id *)&v23->_appIconData, a12);
    if (v47 != 0)
    {
      id v50 = 0;
      id v51 = 0;
      id v49 = 0;
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:v18 accessType:&v51 permissionType:&v50 allowOthersToInvite:&v49];
      v36 = (NSNumber *)v51;
      v37 = (NSNumber *)v50;
      v38 = (NSNumber *)v49;
      accessType = v23->_accessType;
      v23->_accessType = v36;
      v40 = v36;

      permissionType = v23->_permissionType;
      v23->_permissionType = v37;
      v42 = v37;

      allowOthersToInvite = v23->_allowOthersToInvite;
      v23->_allowOthersToInvite = v38;
    }
  }

  return v23;
}

- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 activityType:(id)a8
{
  return [(SFCollaborationCloudSharingRequest *)self initWithCollaborationItemIdentifier:a3 options:a4 fileOrFolderURL:a5 share:a6 setupInfo:a7 phoneNumbers:MEMORY[0x1E4F1CBF0] emailAddresses:MEMORY[0x1E4F1CBF0] activityType:a8 appName:0 appIconData:0];
}

- (SFCollaborationCloudSharingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborationItemIdentifier"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v8 = (void *)get_SWCollaborationOptionsGroupClass_softClass;
  uint64_t v40 = get_SWCollaborationOptionsGroupClass_softClass;
  if (!get_SWCollaborationOptionsGroupClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    uint64_t v34 = __get_SWCollaborationOptionsGroupClass_block_invoke;
    v35 = &unk_1E5BBBFF8;
    v36 = &v37;
    __get_SWCollaborationOptionsGroupClass_block_invoke((uint64_t)&v32);
    v8 = (void *)v38[3];
  }
  v29 = self;
  v31 = (void *)v5;
  id v9 = v8;
  _Block_object_dispose(&v37, 8);
  v10 = objc_msgSend(v6, "setWithObjects:", v7, v9, 0);
  uint64_t v28 = [v4 decodeObjectOfClasses:v10 forKey:@"options"];

  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileOrFolderURL"];
  uint64_t v26 = [v4 decodeObjectOfClass:getCKShareClass() forKey:@"share"];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v11 = (void *)getCKContainerSetupInfoClass_softClass_1;
  uint64_t v40 = getCKContainerSetupInfoClass_softClass_1;
  if (!getCKContainerSetupInfoClass_softClass_1)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    uint64_t v34 = __getCKContainerSetupInfoClass_block_invoke_1;
    v35 = &unk_1E5BBBFF8;
    v36 = &v37;
    __getCKContainerSetupInfoClass_block_invoke_1((uint64_t)&v32);
    v11 = (void *)v38[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v37, 8);
  v25 = [v4 decodeObjectOfClass:v12 forKey:@"setupInfo"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  uint64_t v24 = [v4 decodeObjectOfClasses:v15 forKey:@"phoneNumbers"];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  id v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  id v19 = [v4 decodeObjectOfClasses:v18 forKey:@"emailAddresses"];

  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
  id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIconData"];
  uint64_t v30 = [(SFCollaborationCloudSharingRequest *)v29 initWithCollaborationItemIdentifier:v31 options:v28 fileOrFolderURL:v27 share:v26 setupInfo:v25 phoneNumbers:v24 emailAddresses:v19 activityType:v20 appName:v21 appIconData:v22];

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:collaborationItemIdentifier forKey:@"collaborationItemIdentifier"];
  [v5 encodeObject:self->_options forKey:@"options"];
  [v5 encodeObject:self->_fileOrFolderURL forKey:@"fileOrFolderURL"];
  [v5 encodeObject:self->_share forKey:@"share"];
  [v5 encodeObject:self->_setupInfo forKey:@"setupInfo"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_accessType forKey:@"accessType"];
  [v5 encodeObject:self->_permissionType forKey:@"permissionType"];
  [v5 encodeObject:self->_allowOthersToInvite forKey:@"allowOthersToInvite"];
  [v5 encodeObject:self->_activityType forKey:@"activityType"];
  [v5 encodeObject:self->_appName forKey:@"appName"];
  [v5 encodeObject:self->_appIconData forKey:@"appIconData"];
}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSArray)options
{
  return self->_options;
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

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
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

- (NSString)activityType
{
  return self->_activityType;
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
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_permissionType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_setupInfo, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_fileOrFolderURL, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end