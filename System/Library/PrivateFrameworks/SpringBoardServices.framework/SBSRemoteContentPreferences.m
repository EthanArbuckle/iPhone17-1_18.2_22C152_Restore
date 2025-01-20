@interface SBSRemoteContentPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)dismissesOnTap;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersInlinePresentation;
- (BOOL)reducesWhitePoint;
- (BOOL)suppressesBottomEdgeContent;
- (BOOL)suppressesNotifications;
- (SBSRemoteContentPreferences)init;
- (SBSRemoteContentPreferences)initWithCoder:(id)a3;
- (SBSRemoteContentPreferences)initWithConfiguration:(id)a3;
- (int64_t)backgroundStyle;
- (int64_t)dateTimeStyle;
- (int64_t)homeGestureMode;
- (int64_t)preferredLayout;
- (int64_t)preferredNotificationListMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSRemoteContentPreferences

- (SBSRemoteContentPreferences)init
{
  return [(SBSRemoteContentPreferences *)self initWithConfiguration:MEMORY[0x1E4F1CC08]];
}

- (SBSRemoteContentPreferences)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBSRemoteContentPreferences;
  v5 = [(SBSRemoteContentPreferences *)&v29 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v4 objectForKey:@"dateTimeStyle"];
    v8 = v7;
    if (!v7) {
      v7 = &unk_1EDF594B0;
    }
    v6->_dateTimeStyle = [v7 integerValue];

    v9 = [v4 objectForKey:@"backgroundStyle"];
    v10 = v9;
    if (!v9) {
      v9 = &unk_1EDF594B0;
    }
    v6->_backgroundStyle = [v9 integerValue];

    v11 = [v4 objectForKey:@"homeGestureMode"];
    v12 = v11;
    if (!v11) {
      v11 = &unk_1EDF594C8;
    }
    v6->_homeGestureMode = [v11 integerValue];

    v13 = [v4 objectForKey:@"preferredNotificationListMode"];
    v14 = v13;
    if (!v13) {
      v13 = &unk_1EDF594B0;
    }
    v6->_preferredNotificationListMode = [v13 integerValue];

    v15 = [v4 objectForKey:@"preferredLayout"];
    v16 = v15;
    if (!v15) {
      v15 = &unk_1EDF594B0;
    }
    v6->_preferredLayout = [v15 integerValue];

    v17 = [v4 objectForKey:@"reducesWhitePoint"];
    v18 = v17;
    v19 = (void *)MEMORY[0x1E4F1CC28];
    if (!v17) {
      v17 = (void *)MEMORY[0x1E4F1CC28];
    }
    v6->_reducesWhitePoint = [v17 BOOLValue];

    v20 = [v4 objectForKey:@"suppressesNotifications"];
    v21 = v20;
    if (!v20) {
      v20 = (void *)MEMORY[0x1E4F1CC38];
    }
    v6->_suppressesNotifications = [v20 BOOLValue];

    v22 = [v4 objectForKey:@"suppressesBottomEdgeContent"];
    v23 = v22;
    if (!v22) {
      v22 = v19;
    }
    v6->_suppressesBottomEdgeContent = [v22 BOOLValue];

    v24 = [v4 objectForKey:@"dismissesOnTap"];
    v25 = v24;
    if (!v24) {
      v24 = v19;
    }
    v6->_dismissesOnTap = [v24 BOOLValue];

    v26 = [v4 objectForKey:@"prefersInlinePresentation"];
    v27 = v26;
    if (!v26) {
      v26 = v19;
    }
    v6->_prefersInlinePresentation = [v26 BOOLValue];
  }
  return v6;
}

- (SBSRemoteContentPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSRemoteContentPreferences;
  v5 = [(SBSRemoteContentPreferences *)&v7 init];
  if (v5)
  {
    v5->_dateTimeStyle = [v4 decodeIntegerForKey:@"dateTimeStyle"];
    v5->_backgroundStyle = [v4 decodeIntegerForKey:@"backgroundStyle"];
    v5->_homeGestureMode = [v4 decodeIntegerForKey:@"homeGestureMode"];
    v5->_preferredNotificationListMode = [v4 decodeIntegerForKey:@"preferredNotificationListMode"];
    v5->_preferredLayout = [v4 decodeIntegerForKey:@"preferredLayout"];
    v5->_reducesWhitePoint = [v4 decodeBoolForKey:@"reducesWhitePoint"];
    v5->_suppressesNotifications = [v4 decodeBoolForKey:@"suppressesNotifications"];
    v5->_suppressesBottomEdgeContent = [v4 decodeBoolForKey:@"suppressesBottomEdgeContent"];
    v5->_dismissesOnTap = [v4 decodeBoolForKey:@"dismissesOnTap"];
    v5->_prefersInlinePresentation = [v4 decodeBoolForKey:@"prefersInlinePresentation"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dateTimeStyle = self->_dateTimeStyle;
  id v5 = a3;
  [v5 encodeInteger:dateTimeStyle forKey:@"dateTimeStyle"];
  [v5 encodeInteger:self->_backgroundStyle forKey:@"backgroundStyle"];
  [v5 encodeInteger:self->_homeGestureMode forKey:@"homeGestureMode"];
  [v5 encodeInteger:self->_preferredNotificationListMode forKey:@"preferredNotificationListMode"];
  [v5 encodeInteger:self->_preferredLayout forKey:@"preferredLayout"];
  [v5 encodeBool:self->_reducesWhitePoint forKey:@"reducesWhitePoint"];
  [v5 encodeBool:self->_suppressesNotifications forKey:@"suppressesNotifications"];
  [v5 encodeBool:self->_suppressesBottomEdgeContent forKey:@"suppressesBottomEdgeContent"];
  [v5 encodeBool:self->_dismissesOnTap forKey:@"dismissesOnTap"];
  [v5 encodeBool:self->_prefersInlinePresentation forKey:@"prefersInlinePresentation"];
}

- (int64_t)dateTimeStyle
{
  return self->_dateTimeStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (int64_t)homeGestureMode
{
  return self->_homeGestureMode;
}

- (int64_t)preferredNotificationListMode
{
  return self->_preferredNotificationListMode;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (BOOL)reducesWhitePoint
{
  return self->_reducesWhitePoint;
}

- (BOOL)suppressesNotifications
{
  return self->_suppressesNotifications;
}

- (BOOL)suppressesBottomEdgeContent
{
  return self->_suppressesBottomEdgeContent;
}

- (BOOL)dismissesOnTap
{
  return self->_dismissesOnTap;
}

- (BOOL)prefersInlinePresentation
{
  return self->_prefersInlinePresentation;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t dateTimeStyle = self->_dateTimeStyle;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke;
  v50[3] = &unk_1E566CEE8;
  id v7 = v4;
  id v51 = v7;
  id v8 = (id)[v5 appendInteger:dateTimeStyle counterpart:v50];
  int64_t backgroundStyle = self->_backgroundStyle;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_2;
  v48[3] = &unk_1E566CEE8;
  id v10 = v7;
  id v49 = v10;
  id v11 = (id)[v5 appendInteger:backgroundStyle counterpart:v48];
  int64_t homeGestureMode = self->_homeGestureMode;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_3;
  v46[3] = &unk_1E566CEE8;
  id v13 = v10;
  id v47 = v13;
  id v14 = (id)[v5 appendInteger:homeGestureMode counterpart:v46];
  int64_t preferredNotificationListMode = self->_preferredNotificationListMode;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_4;
  v44[3] = &unk_1E566CEE8;
  id v16 = v13;
  id v45 = v16;
  id v17 = (id)[v5 appendInteger:preferredNotificationListMode counterpart:v44];
  BOOL reducesWhitePoint = self->_reducesWhitePoint;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_5;
  v42[3] = &unk_1E566CF10;
  id v19 = v16;
  id v43 = v19;
  id v20 = (id)[v5 appendBool:reducesWhitePoint counterpart:v42];
  BOOL suppressesNotifications = self->_suppressesNotifications;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_6;
  v40[3] = &unk_1E566CF10;
  id v22 = v19;
  id v41 = v22;
  id v23 = (id)[v5 appendBool:suppressesNotifications counterpart:v40];
  BOOL suppressesBottomEdgeContent = self->_suppressesBottomEdgeContent;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_7;
  v38[3] = &unk_1E566CF10;
  id v25 = v22;
  id v39 = v25;
  id v26 = (id)[v5 appendBool:suppressesBottomEdgeContent counterpart:v38];
  BOOL dismissesOnTap = self->_dismissesOnTap;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_8;
  v36[3] = &unk_1E566CF10;
  id v28 = v25;
  id v37 = v28;
  id v29 = (id)[v5 appendBool:dismissesOnTap counterpart:v36];
  BOOL prefersInlinePresentation = self->_prefersInlinePresentation;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_9;
  v34[3] = &unk_1E566CF10;
  id v35 = v28;
  id v31 = v28;
  id v32 = (id)[v5 appendBool:prefersInlinePresentation counterpart:v34];
  LOBYTE(v28) = [v5 isEqual];

  return (char)v28;
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dateTimeStyle];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundStyle];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeGestureMode];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredNotificationListMode];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) reducesWhitePoint];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressesNotifications];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressesBottomEdgeContent];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissesOnTap];
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefersInlinePresentation];
}

@end