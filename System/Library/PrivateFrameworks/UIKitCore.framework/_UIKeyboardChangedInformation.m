@interface _UIKeyboardChangedInformation
+ (BOOL)supportsSecureCoding;
+ (id)animationFence;
+ (id)informationForKeyboardDown;
+ (id)informationForKeyboardPreserve:(id)a3;
+ (id)informationForKeyboardRestore:(id)a3;
+ (id)informationForKeyboardUp:(CGRect)a3 withIAV:(CGRect)a4;
+ (id)informationForKeyboardUpWithIAVHeight:(double)a3;
- (BOOL)automaticMinimizationEnabled;
- (BOOL)avoidIntersectability;
- (BOOL)isFloating;
- (BOOL)isOneness;
- (BOOL)multipleScenes;
- (BOOL)shouldRestoreKeyboard;
- (BOOL)shouldTakeSnapshot;
- (CGPoint)persistentOffset;
- (CGRect)keyboardPositionWithIAV;
- (CGRect)keyboardPositionWithRemoteIAV;
- (NSString)hostBundleIdentifier;
- (NSString)keyboardPreserveKey;
- (NSString)sourceBundleIdentifier;
- (NSString)sourceDisplayIdentifier;
- (NSString)sourceSceneIdentityString;
- (_UIKeyboardChangedInformation)initWithCoder:(id)a3;
- (_UIKeyboardChangedInformation)initWithKeyboardIAVHeight:(double)a3 onScreen:(BOOL)a4 takeSnapshot:(BOOL)a5 fence:(id)a6;
- (_UIKeyboardChangedInformation)initWithKeyboardRect:(CGRect)a3 iavPosition:(CGRect)a4 onScreen:(BOOL)a5 takeSnapshot:(BOOL)a6 fence:(id)a7;
- (double)keyboardIAVHeight;
- (id)copyWithIntersectability:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutFence;
- (id)copyWithoutIAVKeyboardRect:(CGRect)a3;
- (id)description;
- (int)hostProcessIdentifier;
- (int)processIdentifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticMinimizationEnabled:(BOOL)a3;
- (void)setAvoidIntersectability:(BOOL)a3;
- (void)setHostBundleIdentifier:(id)a3;
- (void)setHostProcessIdentifier:(int)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setIsOneness:(BOOL)a3;
- (void)setKeyboardPositionWithRemoteIAV:(CGRect)a3;
- (void)setKeyboardPreserveKey:(id)a3;
- (void)setMultipleScenes:(BOOL)a3;
- (void)setPersistentOffset:(CGPoint)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setShouldTakeSnapshot:(BOOL)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setSourceDisplayIdentifier:(id)a3;
- (void)setSourceSceneIdentityString:(id)a3;
@end

@implementation _UIKeyboardChangedInformation

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (void)dealloc
{
  [(_UIKeyboardUIInformation *)self resetAnimationFencing];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardChangedInformation;
  [(_UIKeyboardChangedInformation *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIKeyboardChangedInformation;
  [(_UIKeyboardUIInformation *)&v31 encodeWithCoder:v4];
  v5 = (void *)MEMORY[0x1E4F29238];
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  v6 = objc_msgSend(v5, "valueWithCGRect:");
  [v4 encodeObject:v6 forKey:@"Position"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"), @"OnScreen");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation multipleScenes](self, "multipleScenes"), @"MultipleScenes");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation isOneness](self, "isOneness"), @"IsOneness");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation automaticMinimizationEnabled](self, "automaticMinimizationEnabled"), @"AutomaticMinimization");
  [v4 encodeBool:self->_avoidIntersectability forKey:@"AvoidIntersectability"];
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot"), @"TakeSnapshot");
  [v4 encodeBool:self->_shouldRestoreKeyboard forKey:@"RestoreKeyboard"];
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(_UIKeyboardChangedInformation *)self keyboardPositionWithIAV];
  v34.origin.x = v15;
  v34.origin.y = v16;
  v34.size.width = v17;
  v34.size.height = v18;
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  if (!CGRectEqualToRect(v32, v34))
  {
    v19 = (void *)MEMORY[0x1E4F29238];
    [(_UIKeyboardChangedInformation *)self keyboardPositionWithIAV];
    v20 = objc_msgSend(v19, "valueWithCGRect:");
    [v4 encodeObject:v20 forKey:@"PositionIAV"];
  }
  [(_UIKeyboardChangedInformation *)self keyboardPositionWithRemoteIAV];
  if (!CGRectIsEmpty(v33))
  {
    v21 = (void *)MEMORY[0x1E4F29238];
    [(_UIKeyboardChangedInformation *)self keyboardPositionWithRemoteIAV];
    v22 = objc_msgSend(v21, "valueWithCGRect:");
    [v4 encodeObject:v22 forKey:@"PositionRemoteIAV"];
  }
  if (self->_isFloating)
  {
    [v4 encodeBool:1 forKey:@"IsFloating"];
    v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_persistentOffset.x, self->_persistentOffset.y);
    [v4 encodeObject:v23 forKey:@"PersistentOffset"];
  }
  sourceSceneIdentityString = self->_sourceSceneIdentityString;
  if (sourceSceneIdentityString) {
    [v4 encodeObject:sourceSceneIdentityString forKey:@"SourceCanvas"];
  }
  sourceDisplayIdentifier = self->_sourceDisplayIdentifier;
  if (sourceDisplayIdentifier) {
    [v4 encodeObject:sourceDisplayIdentifier forKey:@"SourceDisplay"];
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier) {
    [v4 encodeObject:sourceBundleIdentifier forKey:@"SourceBundle"];
  }
  hostBundleIdentifier = self->_hostBundleIdentifier;
  if (hostBundleIdentifier) {
    [v4 encodeObject:hostBundleIdentifier forKey:@"HostBundle"];
  }
  uint64_t hostProcessIdentifier = self->_hostProcessIdentifier;
  if (hostProcessIdentifier) {
    [v4 encodeInt:hostProcessIdentifier forKey:@"HostProcessID"];
  }
  uint64_t processIdentifier = self->_processIdentifier;
  if (processIdentifier) {
    [v4 encodeInt:processIdentifier forKey:@"ProcessID"];
  }
  keyboardPreserveKey = self->_keyboardPreserveKey;
  if (keyboardPreserveKey) {
    [v4 encodeObject:keyboardPreserveKey forKey:@"KeyboardPreserveKey"];
  }
}

- (BOOL)automaticMinimizationEnabled
{
  return self->_automaticMinimizationEnabled;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)sourceSceneIdentityString
{
  return self->_sourceSceneIdentityString;
}

- (CGRect)keyboardPositionWithIAV
{
  objc_copyStruct(v6, &self->_keyboardPositionWithIAV, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldTakeSnapshot
{
  return self->_shouldTakeSnapshot;
}

- (BOOL)multipleScenes
{
  return self->_multipleScenes;
}

- (NSString)keyboardPreserveKey
{
  return self->_keyboardPreserveKey;
}

- (CGRect)keyboardPositionWithRemoteIAV
{
  objc_copyStruct(v6, &self->_keyboardPositionWithRemoteIAV, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isOneness
{
  return self->_isOneness;
}

- (int)hostProcessIdentifier
{
  return self->_hostProcessIdentifier;
}

- (_UIKeyboardChangedInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_UIKeyboardChangedInformation;
  double v5 = [(_UIKeyboardUIInformation *)&v37 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C108260]();
    v5->_multipleScenes = [v4 decodeBoolForKey:@"MultipleScenes"];
    v5->_isOneness = [v4 decodeBoolForKey:@"IsOneness"];
    v5->_automaticMinimizationEnabled = [v4 decodeBoolForKey:@"AutomaticMinimization"];
    v5->_avoidIntersectability = [v4 decodeBoolForKey:@"AvoidIntersectability"];
    v5->_shouldTakeSnapshot = [v4 decodeBoolForKey:@"TakeSnapshot"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceCanvas"];
    sourceSceneIdentityString = v5->_sourceSceneIdentityString;
    v5->_sourceSceneIdentityString = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceDisplay"];
    sourceDisplayIdentifier = v5->_sourceDisplayIdentifier;
    v5->_sourceDisplayIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceBundle"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HostBundle"];
    hostBundleIdentifier = v5->_hostBundleIdentifier;
    v5->_hostBundleIdentifier = (NSString *)v13;

    v5->_uint64_t hostProcessIdentifier = [v4 decodeIntForKey:@"HostProcessID"];
    v5->_uint64_t processIdentifier = [v4 decodeIntForKey:@"ProcessID"];
    v5->_shouldRestoreKeyboard = [v4 decodeBoolForKey:@"RestoreKeyboard"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeyboardPreserveKey"];
    keyboardPreserveKey = v5->_keyboardPreserveKey;
    v5->_keyboardPreserveKey = (NSString *)v15;

    [(_UIKeyboardUIInformation *)v5 keyboardPosition];
    v5->_keyboardPositionWithIAV.origin.x = v17;
    v5->_keyboardPositionWithIAV.origin.y = v18;
    v5->_keyboardPositionWithIAV.size.width = v19;
    v5->_keyboardPositionWithIAV.size.height = v20;
    if ([v4 containsValueForKey:@"PositionIAV"])
    {
      v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PositionIAV"];
      [v21 CGRectValue];
      v5->_keyboardPositionWithIAV.origin.x = v22;
      v5->_keyboardPositionWithIAV.origin.y = v23;
      v5->_keyboardPositionWithIAV.size.width = v24;
      v5->_keyboardPositionWithIAV.size.height = v25;
    }
    CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v5->_keyboardPositionWithRemoteIAV.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v5->_keyboardPositionWithRemoteIAV.size = v26;
    if ([v4 containsValueForKey:@"PositionRemoteIAV"])
    {
      v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PositionRemoteIAV"];
      [v27 CGRectValue];
      v5->_keyboardPositionWithRemoteIAV.origin.x = v28;
      v5->_keyboardPositionWithRemoteIAV.origin.y = v29;
      v5->_keyboardPositionWithRemoteIAV.size.width = v30;
      v5->_keyboardPositionWithRemoteIAV.size.height = v31;
    }
    v5->_isFloating = [v4 decodeBoolForKey:@"IsFloating"];
    CGRect v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersistentOffset"];
    [v32 CGPointValue];
    v5->_persistentOffset.x = v33;
    v5->_persistentOffset.y = v34;

    v35 = v5;
  }

  return v5;
}

+ (id)informationForKeyboardDown
{
  double v3 = [_UIKeyboardChangedInformation alloc];
  id v4 = [a1 animationFence];
  double v5 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v3, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (_UIKeyboardChangedInformation)initWithKeyboardRect:(CGRect)a3 iavPosition:(CGRect)a4 onScreen:(BOOL)a5 takeSnapshot:(BOOL)a6 fence:(id)a7
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v12 = a3.size.height;
  v18.receiver = self;
  v18.super_class = (Class)_UIKeyboardChangedInformation;
  uint64_t v13 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:fence:](&v18, sel_initWithKeyboardFrame_onScreen_animated_tracking_fence_, a5, 1, 0, a7, a3.origin.x, a3.origin.y, a3.size.width);
  CGFloat v14 = v13;
  if (v13)
  {
    v13->_keyboardPositionWithIAV.origin.CGFloat x = x;
    v13->_keyboardPositionWithIAV.origin.CGFloat y = y;
    v13->_keyboardPositionWithIAV.size.CGFloat width = width;
    v13->_keyboardPositionWithIAV.size.double height = height;
    v13->_keyboardIAVHeight = height - v12;
    v13->_shouldTakeSnapshot = a6;
    uint64_t v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
    CGFloat v16 = [v15 preferencesActions];
    v14->_automaticMinimizationEnabled = [v16 automaticMinimizationEnabled];
  }
  return v14;
}

+ (id)animationFence
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPreserveKey, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceSceneIdentityString, 0);
}

- (_UIKeyboardChangedInformation)initWithKeyboardIAVHeight:(double)a3 onScreen:(BOOL)a4 takeSnapshot:(BOOL)a5 fence:(id)a6
{
  return -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](self, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", a4, a5, a6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0.0, 0.0, 0.0, a3);
}

+ (id)informationForKeyboardUpWithIAVHeight:(double)a3
{
  double v5 = [_UIKeyboardChangedInformation alloc];
  v6 = [a1 animationFence];
  uint64_t v7 = [(_UIKeyboardChangedInformation *)v5 initWithKeyboardIAVHeight:1 onScreen:1 takeSnapshot:v6 fence:a3];

  return v7;
}

+ (id)informationForKeyboardUp:(CGRect)a3 withIAV:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  uint64_t v13 = [_UIKeyboardChangedInformation alloc];
  CGFloat v14 = [a1 animationFence];
  uint64_t v15 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v13, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 1, 1, v14, v11, v10, v9, v8, x, y, width, height);

  return v15;
}

+ (id)informationForKeyboardPreserve:(id)a3
{
  id v4 = a3;
  double v5 = [_UIKeyboardChangedInformation alloc];
  v6 = [a1 animationFence];
  uint64_t v7 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  *(unsigned char *)(v7 + 246) = 0;
  double v8 = *(void **)(v7 + 296);
  *(void *)(v7 + 296) = v4;

  return (id)v7;
}

+ (id)informationForKeyboardRestore:(id)a3
{
  id v4 = a3;
  double v5 = [_UIKeyboardChangedInformation alloc];
  v6 = [a1 animationFence];
  uint64_t v7 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  *(unsigned char *)(v7 + 246) = 1;
  double v8 = *(void **)(v7 + 296);
  *(void *)(v7 + 296) = v4;

  return (id)v7;
}

- (id)copyWithoutIAVKeyboardRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc((Class)objc_opt_class());
  BOOL v9 = [(_UIKeyboardUIInformation *)self keyboardOnScreen];
  BOOL v10 = [(_UIKeyboardChangedInformation *)self shouldTakeSnapshot];
  double v11 = [(_UIKeyboardUIInformation *)self animationFence];
  uint64_t v12 = objc_msgSend(v8, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v9, v10, v11, x, y, width, height, x, y, width, height);

  *(unsigned char *)(v12 + 244) = self->_isFloating;
  *(CGPoint *)(v12 + 304) = self->_persistentOffset;
  uint64_t v13 = [(NSString *)self->_sourceSceneIdentityString copy];
  CGFloat v14 = *(void **)(v12 + 256);
  *(void *)(v12 + 256) = v13;

  uint64_t v15 = [(NSString *)self->_sourceDisplayIdentifier copy];
  CGFloat v16 = *(void **)(v12 + 264);
  *(void *)(v12 + 264) = v15;

  uint64_t v17 = [(NSString *)self->_sourceBundleIdentifier copy];
  objc_super v18 = *(void **)(v12 + 272);
  *(void *)(v12 + 272) = v17;

  uint64_t v19 = [(NSString *)self->_hostBundleIdentifier copy];
  CGFloat v20 = *(void **)(v12 + 280);
  *(void *)(v12 + 280) = v19;

  *(_DWORD *)(v12 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v12 + 252) = self->_processIdentifier;
  *(unsigned char *)(v12 + 240) = self->_avoidIntersectability;
  *(unsigned char *)(v12 + 241) = self->_multipleScenes;
  *(unsigned char *)(v12 + 242) = self->_isOneness;
  *(unsigned char *)(v12 + 243) = self->_automaticMinimizationEnabled;
  uint64_t v21 = [(NSString *)self->_keyboardPreserveKey copy];
  CGFloat v22 = *(void **)(v12 + 296);
  *(void *)(v12 + 296) = v21;

  objc_msgSend((id)v12, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v12, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v12;
}

- (id)copyWithoutFence
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = [(_UIKeyboardUIInformation *)self keyboardOnScreen];
  BOOL v21 = [(_UIKeyboardChangedInformation *)self shouldTakeSnapshot];
  CGFloat v22 = [(_UIKeyboardUIInformation *)self animationFence];
  uint64_t v23 = objc_msgSend(v3, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v20, v21, v22, v5, v7, v9, v11, v13, v15, v17, v19);

  *(unsigned char *)(v23 + 244) = self->_isFloating;
  *(CGPoint *)(v23 + 304) = self->_persistentOffset;
  uint64_t v24 = [(NSString *)self->_sourceSceneIdentityString copy];
  CGFloat v25 = *(void **)(v23 + 256);
  *(void *)(v23 + 256) = v24;

  uint64_t v26 = [(NSString *)self->_sourceDisplayIdentifier copy];
  v27 = *(void **)(v23 + 264);
  *(void *)(v23 + 264) = v26;

  uint64_t v28 = [(NSString *)self->_sourceBundleIdentifier copy];
  CGFloat v29 = *(void **)(v23 + 272);
  *(void *)(v23 + 272) = v28;

  uint64_t v30 = [(NSString *)self->_hostBundleIdentifier copy];
  CGFloat v31 = *(void **)(v23 + 280);
  *(void *)(v23 + 280) = v30;

  *(_DWORD *)(v23 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v23 + 252) = self->_processIdentifier;
  *(unsigned char *)(v23 + 240) = self->_avoidIntersectability;
  *(unsigned char *)(v23 + 241) = self->_multipleScenes;
  *(unsigned char *)(v23 + 242) = self->_isOneness;
  *(unsigned char *)(v23 + 243) = self->_automaticMinimizationEnabled;
  CGSize size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v23 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v23 + 368) = size;
  uint64_t v33 = [(NSString *)self->_keyboardPreserveKey copy];
  CGFloat v34 = *(void **)(v23 + 296);
  *(void *)(v23 + 296) = v33;

  *(unsigned char *)(v23 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v23, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v23, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v23;
}

- (id)copyWithIntersectability:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  BOOL v22 = [(_UIKeyboardUIInformation *)self keyboardOnScreen];
  BOOL v23 = [(_UIKeyboardChangedInformation *)self shouldTakeSnapshot];
  uint64_t v24 = [(_UIKeyboardUIInformation *)self animationFence];
  uint64_t v25 = objc_msgSend(v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v22, v23, v24, v7, v9, v11, v13, v15, v17, v19, v21);

  *(unsigned char *)(v25 + 244) = self->_isFloating;
  *(CGPoint *)(v25 + 304) = self->_persistentOffset;
  uint64_t v26 = [(NSString *)self->_sourceSceneIdentityString copy];
  v27 = *(void **)(v25 + 256);
  *(void *)(v25 + 256) = v26;

  uint64_t v28 = [(NSString *)self->_sourceDisplayIdentifier copy];
  CGFloat v29 = *(void **)(v25 + 264);
  *(void *)(v25 + 264) = v28;

  uint64_t v30 = [(NSString *)self->_sourceBundleIdentifier copy];
  CGFloat v31 = *(void **)(v25 + 272);
  *(void *)(v25 + 272) = v30;

  uint64_t v32 = [(NSString *)self->_hostBundleIdentifier copy];
  uint64_t v33 = *(void **)(v25 + 280);
  *(void *)(v25 + 280) = v32;

  *(_DWORD *)(v25 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v25 + 252) = self->_processIdentifier;
  *(unsigned char *)(v25 + 240) = !a3;
  *(unsigned char *)(v25 + 241) = self->_multipleScenes;
  *(unsigned char *)(v25 + 242) = self->_isOneness;
  *(unsigned char *)(v25 + 243) = self->_automaticMinimizationEnabled;
  CGSize size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v25 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v25 + 368) = size;
  uint64_t v35 = [(NSString *)self->_keyboardPreserveKey copy];
  v36 = *(void **)(v25 + 296);
  *(void *)(v25 + 296) = v35;

  *(unsigned char *)(v25 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v25, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v25, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v25;
}

- (id)description
{
  id v3 = NSString;
  v65.receiver = self;
  v65.super_class = (Class)_UIKeyboardChangedInformation;
  uint64_t v4 = [(_UIKeyboardUIInformation *)&v65 description];
  sourceSceneIdentityString = self->_sourceSceneIdentityString;
  sourceDisplayIdentifier = self->_sourceDisplayIdentifier;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  hostBundleIdentifier = self->_hostBundleIdentifier;
  uint64_t v9 = [(_UIKeyboardUIInformation *)self animationFence];
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  uint64_t v14 = StringFromCGRect(v10, v11, v12, v13);
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(_UIKeyboardChangedInformation *)self keyboardPositionWithIAV];
  v68.origin.double x = v23;
  v68.origin.double y = v24;
  v68.size.double width = v25;
  v68.size.double height = v26;
  v67.origin.double x = v16;
  v67.origin.double y = v18;
  v67.size.double width = v20;
  v67.size.double height = v22;
  v63 = (void *)v9;
  v64 = (void *)v4;
  v61 = v3;
  v62 = (void *)v14;
  v59 = sourceDisplayIdentifier;
  v60 = sourceSceneIdentityString;
  BOOL v58 = CGRectEqualToRect(v67, v68);
  v56 = hostBundleIdentifier;
  v57 = sourceBundleIdentifier;
  if (v58)
  {
    v54 = @"same";
  }
  else
  {
    [(_UIKeyboardChangedInformation *)self keyboardPositionWithIAV];
    StringFromCGRect(v27, v28, v29, v30);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  BOOL isFloating = self->_isFloating;
  if ([(_UIKeyboardUIInformation *)self keyboardOnScreen]) {
    CGFloat v31 = @"YES";
  }
  else {
    CGFloat v31 = @"NO";
  }
  uint64_t v32 = v31;
  if (self->_multipleScenes) {
    uint64_t v33 = @" multiple scenes YES;";
  }
  else {
    uint64_t v33 = &stru_1ED0E84C0;
  }
  if (self->_isOneness) {
    CGFloat v34 = @" is in Oneness screen YES;";
  }
  else {
    CGFloat v34 = &stru_1ED0E84C0;
  }
  if (self->_avoidIntersectability) {
    uint64_t v35 = @"NO";
  }
  else {
    uint64_t v35 = @"YES";
  }
  if (self->_shouldTakeSnapshot) {
    v36 = @"YES";
  }
  else {
    v36 = @"NO";
  }
  keyboardPreserveKedouble y = self->_keyboardPreserveKey;
  if (keyboardPreserveKey)
  {
    v38 = NSString;
    if (self->_shouldRestoreKeyboard) {
      v39 = @"YES";
    }
    else {
      v39 = @"NO";
    }
    v40 = v39;
    v41 = v36;
    v42 = v35;
    v43 = [v38 stringWithFormat:@"; restore %@ (with key %@)", v40, keyboardPreserveKey];
    v52 = v34;
    v50 = v33;
    v44 = v54;
    v45 = v62;
    v46 = v63;
    v47 = v64;
    objc_msgSend(v61, "stringWithFormat:", @"<%@; source canvas %@; source display %@; source bundle %@; host bundle %@; animation fence %@; position %@ (with IAV %@); floating %d; on screen %@;%@ %@ intersectable %@; snapshot %@%@>",
      v64,
      v60,
      v59,
      v57,
      v56,
      v63,
      v62,
      v54,
      isFloating,
      v32,
      v50,
      v52,
      v42,
      v41,
    v48 = v43);
  }
  else
  {
    v41 = v36;
    v53 = v34;
    v51 = v33;
    v44 = v54;
    v45 = v62;
    v46 = v63;
    v47 = v64;
    objc_msgSend(v3, "stringWithFormat:", @"<%@; source canvas %@; source display %@; source bundle %@; host bundle %@; animation fence %@; position %@ (with IAV %@); floating %d; on screen %@;%@ %@ intersectable %@; snapshot %@%@>",
      v64,
      v60,
      v59,
      v57,
      hostBundleIdentifier,
      v63,
      v62,
      v54,
      isFloating,
      v32,
      v51,
      v53,
      v35,
      v41,
    v48 = &stru_1ED0E84C0);
  }

  if (!v58) {
  return v48;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(_UIKeyboardChangedInformation *)self keyboardPositionWithIAV];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  BOOL v21 = [(_UIKeyboardUIInformation *)self keyboardOnScreen];
  BOOL v22 = [(_UIKeyboardChangedInformation *)self shouldTakeSnapshot];
  CGFloat v23 = [(_UIKeyboardUIInformation *)self animationFence];
  uint64_t v24 = objc_msgSend(v4, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v21, v22, v23, v6, v8, v10, v12, v14, v16, v18, v20);

  *(unsigned char *)(v24 + 244) = self->_isFloating;
  *(CGPoint *)(v24 + 304) = self->_persistentOffset;
  uint64_t v25 = [(NSString *)self->_sourceSceneIdentityString copy];
  CGFloat v26 = *(void **)(v24 + 256);
  *(void *)(v24 + 256) = v25;

  uint64_t v27 = [(NSString *)self->_sourceDisplayIdentifier copy];
  double v28 = *(void **)(v24 + 264);
  *(void *)(v24 + 264) = v27;

  uint64_t v29 = [(NSString *)self->_sourceBundleIdentifier copy];
  double v30 = *(void **)(v24 + 272);
  *(void *)(v24 + 272) = v29;

  uint64_t v31 = [(NSString *)self->_hostBundleIdentifier copy];
  uint64_t v32 = *(void **)(v24 + 280);
  *(void *)(v24 + 280) = v31;

  *(_DWORD *)(v24 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v24 + 252) = self->_processIdentifier;
  *(unsigned char *)(v24 + 240) = self->_avoidIntersectability;
  *(unsigned char *)(v24 + 241) = self->_multipleScenes;
  *(unsigned char *)(v24 + 242) = self->_isOneness;
  *(unsigned char *)(v24 + 243) = self->_automaticMinimizationEnabled;
  CGSize size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v24 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v24 + 368) = size;
  uint64_t v34 = [(NSString *)self->_keyboardPreserveKey copy];
  uint64_t v35 = *(void **)(v24 + 296);
  *(void *)(v24 + 296) = v34;

  *(unsigned char *)(v24 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v24, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  objc_msgSend((id)v24, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v24, "setResizing:", -[_UIKeyboardUIInformation resizing](self, "resizing"));
  return (id)v24;
}

- (void)setSourceSceneIdentityString:(id)a3
{
}

- (NSString)sourceDisplayIdentifier
{
  return self->_sourceDisplayIdentifier;
}

- (void)setSourceDisplayIdentifier:(id)a3
{
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (void)setHostBundleIdentifier:(id)a3
{
}

- (void)setHostProcessIdentifier:(int)a3
{
  self->_uint64_t hostProcessIdentifier = a3;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_uint64_t processIdentifier = a3;
}

- (BOOL)avoidIntersectability
{
  return self->_avoidIntersectability;
}

- (void)setAvoidIntersectability:(BOOL)a3
{
  self->_avoidIntersectabilitdouble y = a3;
}

- (void)setMultipleScenes:(BOOL)a3
{
  self->_multipleScenes = a3;
}

- (void)setIsOneness:(BOOL)a3
{
  self->_isOneness = a3;
}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  self->_automaticMinimizationEnabled = a3;
}

- (void)setKeyboardPositionWithRemoteIAV:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_keyboardPositionWithRemoteIAV, &v3, 32, 1, 0);
}

- (double)keyboardIAVHeight
{
  return self->_keyboardIAVHeight;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_BOOL isFloating = a3;
}

- (CGPoint)persistentOffset
{
  objc_copyStruct(v4, &self->_persistentOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPersistentOffset:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_persistentOffset, &v3, 16, 1, 0);
}

- (void)setShouldTakeSnapshot:(BOOL)a3
{
  self->_shouldTakeSnapshot = a3;
}

- (BOOL)shouldRestoreKeyboard
{
  return self->_shouldRestoreKeyboard;
}

- (void)setKeyboardPreserveKey:(id)a3
{
}

@end