@interface _UIRemoteViewControllerSceneContext
+ (BOOL)supportsSecureCoding;
+ (id)contextForWindow:(void *)a3 inScene:;
- (BOOL)isCapturingContentForAdditionalRenderingDestination;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)systemDisplayIdentifier;
- (NSString)systemShellHostingSpaceIdentifier;
- (_UIRemoteViewControllerSceneContext)initWithCoder:(id)a3;
- (_UIRemoteViewControllerSceneContext)initWithDisplayIdentity:(id)a3 screenReferenceDisplayModeStatus:(int64_t)a4 enhancedWindowEnabled:(BOOL)a5 systemReferenceAngle:(double)a6 systemReferenceAngleMode:(unint64_t)a7 isCapturingContentForAdditionalRenderingDestination:(BOOL)a8 hardwareKeyboardExclusivityIdentifier:(id)a9 systemShellHostingSpaceIdentifier:(id)a10 systemDisplayIdentifier:(id)a11;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIRemoteViewControllerSceneContext

+ (id)contextForWindow:(void *)a3 inScene:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (v5)
  {
    v7 = (objc_class *)v6;
    v8 = [v5 screen];
    unsigned int v29 = [v5 _enhancedWindowingEnabled];
    [v4 _systemReferenceAngle];
    double v10 = v9;
    uint64_t v28 = [v4 _systemReferenceAngleMode];
    v11 = [v5 screen];
    unsigned int v26 = [v11 isCaptured];

    v12 = [v5 keyboardSceneDelegate];
    uint64_t v13 = [v12 hardwareKeyboardExclusivityIdentifier];

    id v14 = [v7 alloc];
    v27 = v8;
    v15 = [v8 displayIdentity];
    uint64_t v16 = [v8 referenceDisplayModeStatus];
    v17 = [v5 systemShellHostingEnvironment];
    v18 = [v17 systemShellHostingSpaceIdentifier];
    v19 = [v5 renderingEnvironment];
    [v19 systemDisplayIdentifier];
    v21 = id v20 = v4;
    v22 = v14;
    v23 = (void *)v13;
    v24 = (void *)[v22 initWithDisplayIdentity:v15 screenReferenceDisplayModeStatus:v16 enhancedWindowEnabled:v29 systemReferenceAngle:v28 systemReferenceAngleMode:v26 isCapturingContentForAdditionalRenderingDestination:v13 hardwareKeyboardExclusivityIdentifier:v10 systemShellHostingSpaceIdentifier:v18 systemDisplayIdentifier:v21];

    id v4 = v20;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (_UIRemoteViewControllerSceneContext)initWithDisplayIdentity:(id)a3 screenReferenceDisplayModeStatus:(int64_t)a4 enhancedWindowEnabled:(BOOL)a5 systemReferenceAngle:(double)a6 systemReferenceAngleMode:(unint64_t)a7 isCapturingContentForAdditionalRenderingDestination:(BOOL)a8 hardwareKeyboardExclusivityIdentifier:(id)a9 systemShellHostingSpaceIdentifier:(id)a10 systemDisplayIdentifier:(id)a11
{
  id v25 = a3;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)_UIRemoteViewControllerSceneContext;
  id v20 = [(_UIRemoteViewControllerSceneContext *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displayIdentity, a3);
    v21->_screenReferenceDisplayModeStatus = a4;
    v21->_enhancedWindowingEnabled = a5;
    v21->_systemReferenceAngle = a6;
    v21->_systemReferenceAngleMode = a7;
    v21->_isCapturingContentForAdditionalRenderingDestination = a8;
    objc_storeStrong((id *)&v21->_hardwareKeyboardExclusivityIdentifier, a9);
    objc_storeStrong((id *)&v21->_systemShellHostingSpaceIdentifier, a10);
    objc_storeStrong((id *)&v21->_systemDisplayIdentifier, a11);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = (id *)v4;
    uint64_t v6 = (FBSDisplayIdentity *)v5[4];
    if (v6 == self->_displayIdentity
      && v5[5] == self->_screenReferenceDisplayModeStatus
      && self->_enhancedWindowingEnabled == *((unsigned __int8 *)v5 + 9)
      && *((double *)v5 + 6) == self->_systemReferenceAngle
      && v5[7] == self->_systemReferenceAngleMode
      && self->_isCapturingContentForAdditionalRenderingDestination == [v5 isCapturingContentForAdditionalRenderingDestination])
    {
      id v7 = v5[8];
      if (BSEqualStrings())
      {
        v8 = [v5 systemShellHostingSpaceIdentifier];
        if (BSEqualStrings())
        {
          double v9 = [v5 systemDisplayIdentifier];
          char v10 = BSEqualStrings();
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayIdentity withName:@"displayIdentity"];
  id v5 = (id)objc_msgSend(v3, "ui_appendReferenceDisplayModeStatus:withName:", self->_screenReferenceDisplayModeStatus, @"screenReferenceDisplayModeStatus");
  id v6 = (id)[v3 appendBool:self->_enhancedWindowingEnabled withName:@"enhancedWindowingEnabled"];
  id v7 = _UISStringForSystemReferenceAngleMode();
  [v3 appendString:v7 withName:@"systemReferenceAngleMode"];

  id v8 = (id)[v3 appendFloat:@"systemReferenceAngle" withName:self->_systemReferenceAngle];
  id v9 = (id)[v3 appendBool:self->_isCapturingContentForAdditionalRenderingDestination withName:@"isCapturingContentForAdditionalRenderingDestination"];
  [v3 appendString:self->_hardwareKeyboardExclusivityIdentifier withName:@"hardwareKeyboardExclusivityIdentifier"];
  [v3 appendString:self->_systemShellHostingSpaceIdentifier withName:@"systemShellHostingSpaceIdentifier"];
  [v3 appendString:self->_systemDisplayIdentifier withName:@"systemDisplayIdentifier"];
  char v10 = [v3 build];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIRemoteViewControllerSceneContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UIRemoteViewControllerSceneContextDisplayIdentity"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"_UIRemoteViewControllerSceneContextScreenReferenceDisplayModeStatus"];
  uint64_t v7 = [v4 decodeBoolForKey:@"_UIRemoteViewControllerSceneContextEnhancedWindowingEnabled"];
  objc_msgSend(v4, "_ui_decodeCGFloatForKey:", @"_UIRemoteViewControllerSceneContextSystemReferenceAngle");
  double v9 = v8;
  uint64_t v10 = [v4 decodeIntegerForKey:@"_UIRemoteViewControllerSceneContextSystemReferenceAngleMode"];
  uint64_t v11 = objc_msgSend(v4, "_ui_decodeBoolForKey:defaultValue:", @"_UIRemoteViewControllerSceneContextIsCapturingContentForAdditionalRenderingDestination", 0);
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UIRemoteViewControllerSceneContextHardwareKeyboardExclusivityIdentifier"];
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UIRemoteViewControllerSceneContextSystemShellHostingSpaceIdentifier"];
  id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UIRemoteViewControllerSceneContextSystemDisplayIdentifier"];

  v15 = [[_UIRemoteViewControllerSceneContext alloc] initWithDisplayIdentity:v5 screenReferenceDisplayModeStatus:v6 enhancedWindowEnabled:v7 systemReferenceAngle:v10 systemReferenceAngleMode:v11 isCapturingContentForAdditionalRenderingDestination:v12 hardwareKeyboardExclusivityIdentifier:v9 systemShellHostingSpaceIdentifier:v13 systemDisplayIdentifier:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  displayIdentity = self->_displayIdentity;
  id v5 = a3;
  [v5 encodeObject:displayIdentity forKey:@"_UIRemoteViewControllerSceneContextDisplayIdentity"];
  [v5 encodeInteger:self->_screenReferenceDisplayModeStatus forKey:@"_UIRemoteViewControllerSceneContextScreenReferenceDisplayModeStatus"];
  [v5 encodeBool:self->_enhancedWindowingEnabled forKey:@"_UIRemoteViewControllerSceneContextEnhancedWindowingEnabled"];
  objc_msgSend(v5, "_ui_encodeCGFloat:forKey:", @"_UIRemoteViewControllerSceneContextSystemReferenceAngle", self->_systemReferenceAngle);
  [v5 encodeInteger:self->_systemReferenceAngleMode forKey:@"_UIRemoteViewControllerSceneContextSystemReferenceAngleMode"];
  [v5 encodeBool:self->_isCapturingContentForAdditionalRenderingDestination forKey:@"_UIRemoteViewControllerSceneContextIsCapturingContentForAdditionalRenderingDestination"];
  [v5 encodeObject:self->_hardwareKeyboardExclusivityIdentifier forKey:@"_UIRemoteViewControllerSceneContextHardwareKeyboardExclusivityIdentifier"];
  [v5 encodeObject:self->_systemShellHostingSpaceIdentifier forKey:@"_UIRemoteViewControllerSceneContextSystemShellHostingSpaceIdentifier"];
  [v5 encodeObject:self->_systemDisplayIdentifier forKey:@"_UIRemoteViewControllerSceneContextSystemDisplayIdentifier"];
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  return self->_isCapturingContentForAdditionalRenderingDestination;
}

- (NSString)systemShellHostingSpaceIdentifier
{
  return self->_systemShellHostingSpaceIdentifier;
}

- (NSString)systemDisplayIdentifier
{
  return self->_systemDisplayIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_systemDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_systemShellHostingSpaceIdentifier, 0);
}

@end