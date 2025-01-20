@interface PRPosterQuickActionsConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (PRPosterQuickActionsConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterQuickActionsConfiguration)initWithCoder:(id)a3;
- (PRPosterQuickActionsConfiguration)initWithLeadingControl:(id)a3 trailingControl:(id)a4;
- (PRQuickActionControlConfiguration)leadingControl;
- (PRQuickActionControlConfiguration)trailingControl;
- (id)_fetchCameraControl;
- (id)_fetchFlashlightControl;
- (id)_findControlIdentityForExtensionID:(id)a3 containerID:(id)a4 kind:(id)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_fetchCameraControl;
- (void)_fetchFlashlightControl;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLeadingControl:(id)a3;
- (void)setTrailingControl:(id)a3;
@end

@implementation PRPosterQuickActionsConfiguration

- (PRPosterQuickActionsConfiguration)initWithLeadingControl:(id)a3 trailingControl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PRPosterQuickActionsConfiguration;
  v8 = [(PRPosterQuickActionsConfiguration *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = (PRQuickActionControlConfiguration *)v6;
    }
    else
    {
      v10 = [(PRPosterQuickActionsConfiguration *)v8 _fetchFlashlightControl];
    }
    leadingControl = v9->_leadingControl;
    v9->_leadingControl = v10;

    if (v7)
    {
      v12 = (PRQuickActionControlConfiguration *)v7;
    }
    else
    {
      v12 = [(PRPosterQuickActionsConfiguration *)v9 _fetchCameraControl];
    }
    trailingControl = v9->_trailingControl;
    v9->_trailingControl = v12;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterQuickActionsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"leadingControl"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"trailingControl"];

  v9 = [(PRPosterQuickActionsConfiguration *)self initWithLeadingControl:v6 trailingControl:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterQuickActionsConfiguration *)self leadingControl];
  [v4 encodeObject:v5 forKey:@"leadingControl"];

  id v6 = [(PRPosterQuickActionsConfiguration *)self trailingControl];
  [v4 encodeObject:v6 forKey:@"trailingControl"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterQuickActionsConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"leadingControl"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"trailingControl"];

  v9 = [(PRPosterQuickActionsConfiguration *)self initWithLeadingControl:v6 trailingControl:v8];
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterQuickActionsConfiguration *)self leadingControl];
  [v4 encodeObject:v5 forKey:@"leadingControl"];

  id v6 = [(PRPosterQuickActionsConfiguration *)self trailingControl];
  [v4 encodeObject:v6 forKey:@"trailingControl"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterMutableQuickActionsConfiguration alloc];
  v5 = [(PRPosterQuickActionsConfiguration *)self leadingControl];
  id v6 = [(PRPosterQuickActionsConfiguration *)self trailingControl];
  id v7 = [(PRPosterQuickActionsConfiguration *)v4 initWithLeadingControl:v5 trailingControl:v6];

  return v7;
}

- (void)setLeadingControl:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_leadingControl = &self->_leadingControl;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_leadingControl, a3);
    id v7 = PRLogEditing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2050;
      uint64_t v11 = [v5 category];
      _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "Quick Actions: Set leading control to %{public}@ with category %{public}ld", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)setTrailingControl:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_trailingControl = &self->_trailingControl;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_trailingControl, a3);
    id v7 = PRLogEditing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2050;
      uint64_t v11 = [v5 category];
      _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "Quick Actions: Set trailing control to %{public}@ with category %{public}ld", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)dealloc
{
  [(CHSWidgetExtensionProvider *)self->_extensionProvider invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRPosterQuickActionsConfiguration;
  [(PRPosterQuickActionsConfiguration *)&v3 dealloc];
}

- (id)_fetchFlashlightControl
{
  v2 = [(PRPosterQuickActionsConfiguration *)self _findControlIdentityForExtensionID:@"com.apple.ControlCenter.ControlCenterControlsExtension" containerID:@"com.apple.springboard" kind:@"com.apple.ControlCenter.ControlCenterControlsExtension.flashlight"];
  if (v2)
  {
    objc_super v3 = [[PRQuickActionControlConfiguration alloc] initWithControlIdentity:v2 type:1];
  }
  else
  {
    id v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PRPosterQuickActionsConfiguration _fetchFlashlightControl](v4);
    }

    objc_super v3 = 0;
  }

  return v3;
}

- (id)_fetchCameraControl
{
  uint64_t v3 = [(PRPosterQuickActionsConfiguration *)self _findControlIdentityForExtensionID:@"com.apple.camera.LauncherControlExtension" containerID:@"com.apple.camera" kind:@"com.apple.camera.deeplink.button"];
  if (v3
    || ([(PRPosterQuickActionsConfiguration *)self _findControlIdentityForExtensionID:@"com.apple.camera.LauncherControlExtension" containerID:@"com.apple.camera" kind:@"com.apple.camera.deeplink.button"], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v3;
    id v5 = [[PRQuickActionControlConfiguration alloc] initWithControlIdentity:v3 type:2];
  }
  else
  {
    id v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PRPosterQuickActionsConfiguration _fetchCameraControl](v4);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_findControlIdentityForExtensionID:(id)a3 containerID:(id)a4 kind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_extensionProvider)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F58C68]) initIncludingVisible:1 hidden:1];
    id v12 = objc_alloc(MEMORY[0x1E4F58E50]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F58E10]);
    v14 = (void *)[v12 initWithWidgetsPredicate:v13 controlsPredicate:v11 includeIntents:1];

    objc_super v15 = (CHSWidgetExtensionProvider *)[objc_alloc(MEMORY[0x1E4F58E40]) initWithOptions:v14];
    extensionProvider = self->_extensionProvider;
    self->_extensionProvider = v15;
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:v8 containerBundleIdentifier:v9 deviceIdentifier:0];
  v18 = [(CHSWidgetExtensionProvider *)self->_extensionProvider extensions];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke;
  v32[3] = &unk_1E54DAF18;
  id v19 = v17;
  id v33 = v19;
  v20 = objc_msgSend(v18, "bs_firstObjectPassingTest:", v32);

  v21 = [v20 orderedControlDescriptors];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke_2;
  v30 = &unk_1E54DAF40;
  id v22 = v10;
  id v31 = v22;
  v23 = objc_msgSend(v21, "bs_firstObjectPassingTest:", &v27);

  if (v23)
  {
    v24 = objc_msgSend(v23, "defaultIntentReference", v27, v28, v29, v30);
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v19 kind:v22 intentReference:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (PRQuickActionControlConfiguration)leadingControl
{
  return self->_leadingControl;
}

- (PRQuickActionControlConfiguration)trailingControl
{
  return self->_trailingControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingControl, 0);
  objc_storeStrong((id *)&self->_leadingControl, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (void)_fetchFlashlightControl
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Quick Actions: Failed to fetch flashlight control", v1, 2u);
}

- (void)_fetchCameraControl
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Quick Actions: Failed to fetch camera control", v1, 2u);
}

@end