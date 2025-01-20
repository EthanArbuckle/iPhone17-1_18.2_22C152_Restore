@interface SHSheetRemoteSceneSettings
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)settingsWithConfigurationBlock:(id)a3;
+ (id)settingsWithSessionContext:(id)a3 presnetationStyle:(int64_t)a4 hostProcessType:(int64_t)a5 customizationGroups:(id)a6 collaborationOptions:(id)a7 cloudShareRequest:(id)a8;
- (NSArray)customizationGroups;
- (SFCollaborationCloudSharingRequest)cloudShareRequest;
- (SHSheetRemoteSceneSettings)initWithBSXPCCoder:(id)a3;
- (SHSheetUIServiceClientContext)sessionContext;
- (_SWCollaborationShareOptions)collaborationOptions;
- (int64_t)hostProcessType;
- (int64_t)presentationStyle;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setCloudShareRequest:(id)a3;
- (void)setCollaborationOptions:(id)a3;
- (void)setCustomizationGroups:(id)a3;
- (void)setHostProcessType:(int64_t)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSessionContext:(id)a3;
@end

@implementation SHSheetRemoteSceneSettings

+ (id)settingsWithConfigurationBlock:(id)a3
{
  v3 = (void (**)(id, SHSheetRemoteSceneSettings *))a3;
  v4 = objc_alloc_init(SHSheetRemoteSceneSettings);
  v3[2](v3, v4);

  return v4;
}

+ (id)settingsWithSessionContext:(id)a3 presnetationStyle:(int64_t)a4 hostProcessType:(int64_t)a5 customizationGroups:(id)a6 collaborationOptions:(id)a7 cloudShareRequest:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = objc_alloc_init((Class)a1);
  [v18 setSessionContext:v17];

  [v18 setPresentationStyle:a4];
  [v18 setHostProcessType:a5];
  [v18 setCollaborationOptions:v15];

  [v18 setCloudShareRequest:v14];
  [v18 setCustomizationGroups:v16];

  return v18;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetRemoteSceneSettings *)self sessionContext];
  [v4 encodeObject:v5 forKey:@"sessionContext"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetRemoteSceneSettings hostProcessType](self, "hostProcessType"), @"hostProcessType");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetRemoteSceneSettings presentationStyle](self, "presentationStyle"), @"presentationStyle");
  v6 = [(SHSheetRemoteSceneSettings *)self collaborationOptions];
  [v4 encodeObject:v6 forKey:@"collaborationOptions"];

  v7 = [(SHSheetRemoteSceneSettings *)self cloudShareRequest];
  [v4 encodeObject:v7 forKey:@"cloudShareRequest"];

  id v8 = [(SHSheetRemoteSceneSettings *)self customizationGroups];
  [v4 encodeCollection:v8 forKey:@"customizationGroups"];
}

- (SHSheetRemoteSceneSettings)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetRemoteSceneSettings *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionContext"];
  [(SHSheetRemoteSceneSettings *)v5 setSessionContext:v6];

  -[SHSheetRemoteSceneSettings setHostProcessType:](v5, "setHostProcessType:", [v4 decodeInt64ForKey:@"hostProcessType"]);
  -[SHSheetRemoteSceneSettings setPresentationStyle:](v5, "setPresentationStyle:", [v4 decodeInt64ForKey:@"presentationStyle"]);
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)get_SWCollaborationShareOptionsClass_softClass;
  uint64_t v18 = get_SWCollaborationShareOptionsClass_softClass;
  if (!get_SWCollaborationShareOptionsClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __get_SWCollaborationShareOptionsClass_block_invoke;
    v14[3] = &unk_1E5A216E8;
    v14[4] = &v15;
    __get_SWCollaborationShareOptionsClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"collaborationOptions"];
  [(SHSheetRemoteSceneSettings *)v5 setCollaborationOptions:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudShareRequest"];
  [(SHSheetRemoteSceneSettings *)v5 setCloudShareRequest:v10];

  uint64_t v11 = objc_opt_class();
  v12 = [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"customizationGroups"];
  [(SHSheetRemoteSceneSettings *)v5 setCustomizationGroups:v12];

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (void)setHostProcessType:(int64_t)a3
{
  self->_hostProcessType = a3;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
}

- (_SWCollaborationShareOptions)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
}

- (SFCollaborationCloudSharingRequest)cloudShareRequest
{
  return self->_cloudShareRequest;
}

- (void)setCloudShareRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudShareRequest, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
}

@end