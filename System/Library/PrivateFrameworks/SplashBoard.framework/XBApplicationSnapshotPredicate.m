@interface XBApplicationSnapshotPredicate
+ (id)predicate;
- (BOOL)_hasClientObjectForKey:(unint64_t)a3;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)isFullScreen;
- (CGSize)referenceSize;
- (NSString)description;
- (NSString)launchInterfaceIdentifier;
- (NSString)name;
- (NSString)requiredOSVersion;
- (NSString)scheme;
- (XBApplicationSnapshotPredicate)init;
- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets;
- (double)imageScale;
- (id)_clientObjectForKey:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)userInterfaceStyle;
- (unint64_t)contentTypeMask;
- (unint64_t)interfaceOrientationMask;
- (unint64_t)statusBarState;
- (unint64_t)statusBarStateMask;
- (void)_removeClientObjectForKey:(unint64_t)a3;
- (void)_setClientObject:(id)a3 forKey:(unint64_t)a4;
- (void)setContentTypeMask:(unint64_t)a3;
- (void)setCustomSafeAreaInsets:(id)a3;
- (void)setImageScale:(double)a3;
- (void)setInterfaceOrientationMask:(unint64_t)a3;
- (void)setLaunchInterfaceIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRequiredOSVersion:(id)a3;
- (void)setScheme:(id)a3;
- (void)setStatusBarState:(unint64_t)a3;
- (void)setStatusBarStateMask:(unint64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation XBApplicationSnapshotPredicate

- (void).cxx_destruct
{
}

- (unint64_t)statusBarStateMask
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:8];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)interfaceOrientationMask
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:4];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (CGSize)referenceSize
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:5];
  [v2 CGSizeValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_35;
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:7])
  {
    unint64_t v5 = [(XBApplicationSnapshotPredicate *)self contentTypeMask];
    if ((v5 & (1 << [v4 contentType])) == 0) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:4])
  {
    unint64_t v6 = [(XBApplicationSnapshotPredicate *)self interfaceOrientationMask];
    if ((v6 & (1 << [v4 interfaceOrientation])) == 0) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:5])
  {
    [(XBApplicationSnapshotPredicate *)self referenceSize];
    double v8 = v7;
    double v10 = v9;
    [v4 referenceSize];
    LOBYTE(v12) = 0;
    if (v8 != v13 || v10 != v11) {
      goto LABEL_36;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:1])
  {
    v14 = [(XBApplicationSnapshotPredicate *)self name];
    v15 = [v4 name];
    int v16 = BSEqualStrings();

    if (!v16) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:2])
  {
    v17 = [(XBApplicationSnapshotPredicate *)self scheme];
    v18 = [v4 scheme];
    int v19 = BSEqualStrings();

    if (!v19) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:9])
  {
    v20 = [(XBApplicationSnapshotPredicate *)self requiredOSVersion];
    if (v20)
    {
    }
    else
    {
      v36 = [v4 requiredOSVersion];

      if (v36) {
        goto LABEL_35;
      }
    }
    v21 = [v4 requiredOSVersion];
    v22 = [(XBApplicationSnapshotPredicate *)self requiredOSVersion];
    uint64_t v23 = [v21 compare:v22 options:64];

    if (v23 == 1) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:3])
  {
    v24 = [(XBApplicationSnapshotPredicate *)self launchInterfaceIdentifier];
    v25 = [v4 launchInterfaceIdentifier];
    int v26 = BSEqualStrings();

    if (!v26) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:6])
  {
    [(XBApplicationSnapshotPredicate *)self imageScale];
    [v4 imageScale];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:8])
  {
    uint64_t v27 = [(XBApplicationSnapshotPredicate *)self statusBarStateMask];
    v28 = [v4 statusBarSettings];
    int v12 = XBStatusBarStateMaskMatchesSettings(v27, v28);

    if (!v12) {
      goto LABEL_36;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:10])
  {
    v29 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:10];
    v30 = [v4 creationDate];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_35;
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:12])
  {
    int64_t v32 = [(XBApplicationSnapshotPredicate *)self userInterfaceStyle];
    uint64_t v33 = [v4 userInterfaceStyle];
    if (v32)
    {
      if (v33 && v32 != v33)
      {
LABEL_35:
        LOBYTE(v12) = 0;
        goto LABEL_36;
      }
    }
  }
  if ([(XBApplicationSnapshotPredicate *)self _hasClientObjectForKey:13])
  {
    v34 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:13];
    if (v34 && [v4 contentType] != 2)
    {
      v38 = [v4 customSafeAreaInsets];
      char v39 = [v34 isEqual:v38];

      if ((v39 & 1) == 0) {
        goto LABEL_33;
      }
    }
    else
    {
      v35 = [v4 customSafeAreaInsets];

      if (v35)
      {
LABEL_33:
        LOBYTE(v12) = 0;
LABEL_40:

        goto LABEL_36;
      }
    }
    LOBYTE(v12) = 1;
    goto LABEL_40;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (BOOL)_hasClientObjectForKey:(unint64_t)a3
{
  uint64_t v3 = [(BSMutableSettings *)self->_clientSettings flagForSetting:a3];
  return MEMORY[0x270F2D1F0](v3);
}

- (unint64_t)contentTypeMask
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:7];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)_clientObjectForKey:(unint64_t)a3
{
  return (id)[(BSMutableSettings *)self->_clientSettings objectForSetting:a3];
}

- (NSString)requiredOSVersion
{
  return (NSString *)[(XBApplicationSnapshotPredicate *)self _clientObjectForKey:9];
}

- (int64_t)userInterfaceStyle
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:12];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (double)imageScale
{
  v2 = [(XBApplicationSnapshotPredicate *)self _clientObjectForKey:6];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSString)scheme
{
  return (NSString *)[(XBApplicationSnapshotPredicate *)self _clientObjectForKey:2];
}

- (void)setReferenceSize:(CGSize)a3
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", a3.width, a3.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:5];
}

- (void)setContentTypeMask:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:7];
}

- (void)_setClientObject:(id)a3 forKey:(unint64_t)a4
{
  -[BSMutableSettings setObject:forSetting:](self->_clientSettings, "setObject:forSetting:", a3);
  clientSettings = self->_clientSettings;
  [(BSMutableSettings *)clientSettings setFlag:1 forSetting:a4];
}

+ (id)predicate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (XBApplicationSnapshotPredicate)init
{
  v6.receiver = self;
  v6.super_class = (Class)XBApplicationSnapshotPredicate;
  id v2 = [(XBApplicationSnapshotPredicate *)&v6 init];
  if (v2)
  {
    double v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x263F3F680]);
    clientSettings = v2->_clientSettings;
    v2->_clientSettings = v3;
  }
  return v2;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:12];
}

- (void)setStatusBarStateMask:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:8];
}

- (void)setInterfaceOrientationMask:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:4];
  }
  else
  {
    [(XBApplicationSnapshotPredicate *)self _removeClientObjectForKey:4];
  }
}

- (void)setScheme:(id)a3
{
  id v4 = (id)[a3 copy];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:2];
}

- (void)setCustomSafeAreaInsets:(id)a3
{
}

- (void)setImageScale:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:6];
}

- (void)setRequiredOSVersion:(id)a3
{
  id v4 = (id)[a3 copy];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:9];
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotPredicate *)self descriptionWithMultilinePrefix:0];
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:1];
}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(XBApplicationSnapshotPredicate *)self _setClientObject:v4 forKey:3];
}

- (void)setStatusBarState:(unint64_t)a3
{
  uint64_t v4 = XBStatusBarStateMaskForStatusBarState(a3);
  [(XBApplicationSnapshotPredicate *)self setStatusBarStateMask:v4];
}

- (NSString)name
{
  return (NSString *)[(XBApplicationSnapshotPredicate *)self _clientObjectForKey:1];
}

- (NSString)launchInterfaceIdentifier
{
  return (NSString *)[(XBApplicationSnapshotPredicate *)self _clientObjectForKey:3];
}

- (BOOL)isFullScreen
{
  return 0;
}

- (unint64_t)statusBarState
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [(XBApplicationSnapshotPredicate *)self statusBarStateMask];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__XBApplicationSnapshotPredicate_statusBarState__block_invoke;
  v5[3] = &unk_2646A5D00;
  v5[4] = &v6;
  XBEnumerateStatusBarStatesMatchingMask(v2, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__XBApplicationSnapshotPredicate_statusBarState__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return (XBDisplayEdgeInsetsWrapper *)[(XBApplicationSnapshotPredicate *)self _clientObjectForKey:13];
}

- (void)_removeClientObjectForKey:(unint64_t)a3
{
  [(BSMutableSettings *)self->_clientSettings setObject:0 forSetting:a3];
  clientSettings = self->_clientSettings;
  [(BSMutableSettings *)clientSettings setFlag:0x7FFFFFFFFFFFFFFFLL forSetting:a3];
}

- (id)succinctDescription
{
  uint64_t v2 = [(XBApplicationSnapshotPredicate *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F3F658] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(XBApplicationSnapshotPredicate *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(XBApplicationSnapshotPredicate *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__XBApplicationSnapshotPredicate_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_2646A5BC0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  double v7 = v11;
  id v8 = v6;

  return v8;
}

id __72__XBApplicationSnapshotPredicate_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:1])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    unint64_t v3 = [*(id *)(a1 + 32) name];
    id v4 = (id)[v2 appendObject:v3 withName:@"name" skipIfNil:0];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:2])
  {
    unint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) scheme];
    id v7 = (id)[v5 appendObject:v6 withName:@"scheme" skipIfNil:0];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:3])
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) launchInterfaceIdentifier];
    id v10 = (id)[v8 appendObject:v9 withName:@"launchInterfaceIdentifier" skipIfNil:0];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:9])
  {
    id v11 = *(void **)(a1 + 40);
    int v12 = [*(id *)(a1 + 32) requiredOSVersion];
    id v13 = (id)[v11 appendObject:v12 withName:@"requiredOSVersion" skipIfNil:0];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:4]) {
    id v14 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientationMask"), @"orientationMask");
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:7])
  {
    v15 = *(void **)(a1 + 40);
    int v16 = XBApplicationSnapshotContentTypeMaskDescription([*(id *)(a1 + 32) contentTypeMask]);
    id v17 = (id)[v15 appendObject:v16 withName:@"contentTypeMask"];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:8])
  {
    v18 = *(void **)(a1 + 40);
    int v19 = XBStatusBarStateMaskDescription([*(id *)(a1 + 32) statusBarStateMask]);
    id v20 = (id)[v18 appendObject:v19 withName:@"statusBarStateMask"];
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:5])
  {
    v21 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) referenceSize];
    id v22 = (id)objc_msgSend(v21, "appendSize:withName:", @"size");
  }
  if ([*(id *)(a1 + 32) _hasClientObjectForKey:6])
  {
    uint64_t v23 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) imageScale];
    id v24 = (id)objc_msgSend(v23, "appendFloat:withName:decimalPrecision:", @"scale", 1);
  }
  id result = (id)[*(id *)(a1 + 32) _hasClientObjectForKey:12];
  if (result) {
    return (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"), @"userInterfaceStyle");
  }
  return result;
}

@end