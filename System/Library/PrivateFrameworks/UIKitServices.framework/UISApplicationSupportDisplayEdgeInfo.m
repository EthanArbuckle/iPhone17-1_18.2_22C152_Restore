@interface UISApplicationSupportDisplayEdgeInfo
+ (id)defaultDisplayEdgeInfo;
+ (id)defaultDisplayEdgeInfoForceInsets:(BOOL)a3;
- (NSNumber)homeAffordanceOverlayAllowance;
- (NSNumber)systemMinimumMargin;
- (NSString)description;
- (UISApplicationSupportDisplayEdgeInfo)initWithXPCDictionary:(id)a3;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)peripheryInsets;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeLeft;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeRight;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortrait;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortraitUpsideDown;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_copyFromOtherInfo:(id)a3;
- (void)_performIvarUpdateIfAllowed:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setHomeAffordanceOverlayAllowance:(id)a3;
- (void)setPeripheryInsets:(id)a3;
- (void)setSafeAreaInsetsLandscapeLeft:(id)a3;
- (void)setSafeAreaInsetsLandscapeRight:(id)a3;
- (void)setSafeAreaInsetsPortrait:(id)a3;
- (void)setSafeAreaInsetsPortraitUpsideDown:(id)a3;
- (void)setSystemMinimumMargin:(id)a3;
@end

@implementation UISApplicationSupportDisplayEdgeInfo

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_uint64(xdict, "UISApplicationSupportDisplayEdgeInfoFlags", self->_infoFlags.asInt);
  [(NSNumber *)self->_systemMinimumMargin doubleValue];
  xpc_dictionary_set_double(xdict, "UISApplicationSupportDisplaySystemMinimumMargin", v4);
  [(NSNumber *)self->_homeAffordanceOverlayAllowance doubleValue];
  xpc_dictionary_set_double(xdict, "UISApplicationSupportDisplayHomeAffordanceOverlayAllowance", v5);
  if (self->_peripheryInsets) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  if (self->_safeAreaInsetsPortrait) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  if (self->_safeAreaInsetsLandscapeLeft) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  if (self->_safeAreaInsetsPortraitUpsideDown) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  if (self->_safeAreaInsetsLandscapeRight) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  MEMORY[0x1F41817F8]();
}

- (UISApplicationSupportDisplayEdgeInfo)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UISApplicationSupportDisplayEdgeInfo;
  double v5 = [(UISApplicationSupportDisplayEdgeInfo *)&v21 init];
  if (v5)
  {
    v5->_infoFlags.asInt = xpc_dictionary_get_uint64(v4, "UISApplicationSupportDisplayEdgeInfoFlags");
    if (xpc_dictionary_get_double(v4, "UISApplicationSupportDisplaySystemMinimumMargin") != 0.0)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
      systemMinimumMargin = v5->_systemMinimumMargin;
      v5->_systemMinimumMargin = (NSNumber *)v6;
    }
    if (xpc_dictionary_get_double(v4, "UISApplicationSupportDisplayHomeAffordanceOverlayAllowance") != 0.0)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
      homeAffordanceOverlayAllowance = v5->_homeAffordanceOverlayAllowance;
      v5->_homeAffordanceOverlayAllowance = (NSNumber *)v8;
    }
    uint64_t v10 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    peripheryInsets = v5->_peripheryInsets;
    v5->_peripheryInsets = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v10;

    uint64_t v12 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    safeAreaInsetsPortrait = v5->_safeAreaInsetsPortrait;
    v5->_safeAreaInsetsPortrait = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v12;

    uint64_t v14 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    safeAreaInsetsLandscapeLeft = v5->_safeAreaInsetsLandscapeLeft;
    v5->_safeAreaInsetsLandscapeLeft = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v14;

    uint64_t v16 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    safeAreaInsetsPortraitUpsideDown = v5->_safeAreaInsetsPortraitUpsideDown;
    v5->_safeAreaInsetsPortraitUpsideDown = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v16;

    uint64_t v18 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    safeAreaInsetsLandscapeRight = v5->_safeAreaInsetsLandscapeRight;
    v5->_safeAreaInsetsLandscapeRight = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v18;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaInsetsLandscapeRight, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsPortraitUpsideDown, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsLandscapeLeft, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsPortrait, 0);
  objc_storeStrong((id *)&self->_homeAffordanceOverlayAllowance, 0);
  objc_storeStrong((id *)&self->_systemMinimumMargin, 0);
  objc_storeStrong((id *)&self->_peripheryInsets, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 _copyFromOtherInfo:self];
  return v4;
}

- (void)_copyFromOtherInfo:(id)a3
{
  id v4 = a3;
  double v5 = [v4 peripheryInsets];
  peripheryInsets = self->_peripheryInsets;
  self->_peripheryInsets = v5;

  v7 = [v4 systemMinimumMargin];
  systemMinimumMargin = self->_systemMinimumMargin;
  self->_systemMinimumMargin = v7;

  v9 = [v4 safeAreaInsetsPortrait];
  safeAreaInsetsPortrait = self->_safeAreaInsetsPortrait;
  self->_safeAreaInsetsPortrait = v9;

  v11 = [v4 homeAffordanceOverlayAllowance];
  homeAffordanceOverlayAllowance = self->_homeAffordanceOverlayAllowance;
  self->_homeAffordanceOverlayAllowance = v11;

  v13 = [v4 safeAreaInsetsLandscapeLeft];
  safeAreaInsetsLandscapeLeft = self->_safeAreaInsetsLandscapeLeft;
  self->_safeAreaInsetsLandscapeLeft = v13;

  v15 = [v4 safeAreaInsetsPortraitUpsideDown];
  safeAreaInsetsPortraitUpsideDown = self->_safeAreaInsetsPortraitUpsideDown;
  self->_safeAreaInsetsPortraitUpsideDown = v15;

  v17 = [v4 safeAreaInsetsLandscapeRight];
  safeAreaInsetsLandscapeRight = self->_safeAreaInsetsLandscapeRight;
  self->_safeAreaInsetsLandscapeRight = v17;

  unint64_t v19 = v4[1];
  self->_infoFlags.asInt = v19;
  LOBYTE(self->_infoFlags.asInt) = v19 & 0xFE;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortrait
{
  return self->_safeAreaInsetsPortrait;
}

- (NSNumber)homeAffordanceOverlayAllowance
{
  return self->_homeAffordanceOverlayAllowance;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)peripheryInsets
{
  return self->_peripheryInsets;
}

- (NSNumber)systemMinimumMargin
{
  return self->_systemMinimumMargin;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortraitUpsideDown
{
  return self->_safeAreaInsetsPortraitUpsideDown;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeRight
{
  return self->_safeAreaInsetsLandscapeRight;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeLeft
{
  return self->_safeAreaInsetsLandscapeLeft;
}

+ (id)defaultDisplayEdgeInfo
{
  return (id)[a1 defaultDisplayEdgeInfoForceInsets:0];
}

+ (id)defaultDisplayEdgeInfoForceInsets:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__UISApplicationSupportDisplayEdgeInfo_defaultDisplayEdgeInfoForceInsets___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  if (qword_1EB2888F0 != -1) {
    dispatch_once(&qword_1EB2888F0, block);
  }
  v3 = (void *)_MergedGlobals_14;
  return v3;
}

void __74__UISApplicationSupportDisplayEdgeInfo_defaultDisplayEdgeInfoForceInsets___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UISApplicationSupportDisplayEdgeInfo);
  v3 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = (uint64_t)v2;

  CFDictionaryRef v4 = (const __CFDictionary *)MGCopyAnswer();
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    BOOL v6 = CFDictionaryGetValue(v4, @"ArtworkDeviceSubType");
    v7 = v6;
    if (!v6 || (int v8 = [v6 intValue], v8 < 0))
    {
      CFRelease(v5);
      goto LABEL_49;
    }
    int v9 = v8;
    int v10 = 1;
    if (v8 > 2555)
    {
      if (v8 > 2777)
      {
        if (v8 == 2778 || v8 == 2796) {
          goto LABEL_20;
        }
      }
      else if (v8 == 2556 || v8 == 2688)
      {
        goto LABEL_20;
      }
    }
    else if (v8 > 2435)
    {
      if (v8 == 2436 || v8 == 2532) {
        goto LABEL_20;
      }
    }
    else if (v8 == 1792 || v8 == 2340)
    {
      goto LABEL_20;
    }
    int v10 = 0;
LABEL_20:
    if (v8 == 2732) {
      BOOL v11 = MGGetSInt32Answer() == 2;
    }
    else {
      BOOL v11 = v8 == 2388 || v8 == 2360;
    }
    BOOL v12 = v11;
    if (((v10 | v12) & 1) != 0 || !*(unsigned char *)(a1 + 32))
    {
      CFRelease(v5);
      if (!v10)
      {
LABEL_31:
        if (v12)
        {
          v13 = [[UISApplicationSupportDisplayEdgeInsetsWrapper alloc] initWithTop:0.0 left:0.0 bottom:20.0 right:0.0];
          uint64_t v14 = *(void **)(_MergedGlobals_14 + 40);
          *(void *)(_MergedGlobals_14 + 40) = v13;

          v15 = *(void **)(_MergedGlobals_14 + 32);
          *(void *)(_MergedGlobals_14 + 32) = &unk_1EE295938;
LABEL_48:
        }
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      CFRelease(v5);
      BOOL v12 = v9 == 2732;
      if ((v9 - 569) >= 2) {
        goto LABEL_31;
      }
    }
    double v16 = 44.0;
    if (v9 <= 2555)
    {
      switch(v9)
      {
        case 1792:
          uint64_t v17 = 0x4048000000000000;
          break;
        case 2340:
          uint64_t v17 = 0x4049000000000000;
          break;
        case 2532:
          goto LABEL_43;
        default:
          goto LABEL_47;
      }
      double v16 = *(double *)&v17;
      goto LABEL_47;
    }
    switch(v9)
    {
      case 2556:
        goto LABEL_42;
      case 2778:
LABEL_43:
        double v16 = 47.0;
        break;
      case 2796:
LABEL_42:
        double v16 = 59.0;
        break;
    }
LABEL_47:
    uint64_t v18 = [[UISApplicationSupportDisplayEdgeInsetsWrapper alloc] initWithTop:v16 left:0.0 bottom:34.0 right:0.0];
    unint64_t v19 = *(void **)(_MergedGlobals_14 + 40);
    *(void *)(_MergedGlobals_14 + 40) = v18;

    v20 = *(void **)(_MergedGlobals_14 + 32);
    *(void *)(_MergedGlobals_14 + 32) = &unk_1EE295928;

    objc_super v21 = [[UISApplicationSupportDisplayEdgeInsetsWrapper alloc] initWithTop:32.0 left:0.0 bottom:0.0 right:0.0];
    v15 = *(void **)(_MergedGlobals_14 + 16);
    *(void *)(_MergedGlobals_14 + 16) = v21;
    goto LABEL_48;
  }
LABEL_50:
  *(unsigned char *)(_MergedGlobals_14 + 8) |= 1u;
}

- (void)_performIvarUpdateIfAllowed:(id)a3
{
  if (self->_infoFlags.asInt)
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"UISApplicationSupportDisplayEdgeInfo.m" lineNumber:235 description:@"Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"];
  }
  else
  {
    v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
}

- (void)setPeripheryInsets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__UISApplicationSupportDisplayEdgeInfo_setPeripheryInsets___block_invoke;
  v6[3] = &unk_1E57351C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UISApplicationSupportDisplayEdgeInfo *)self _performIvarUpdateIfAllowed:v6];
}

void __59__UISApplicationSupportDisplayEdgeInfo_setPeripheryInsets___block_invoke(uint64_t a1)
{
}

- (void)setSystemMinimumMargin:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__UISApplicationSupportDisplayEdgeInfo_setSystemMinimumMargin___block_invoke;
  v6[3] = &unk_1E57351C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UISApplicationSupportDisplayEdgeInfo *)self _performIvarUpdateIfAllowed:v6];
}

void __63__UISApplicationSupportDisplayEdgeInfo_setSystemMinimumMargin___block_invoke(uint64_t a1)
{
}

- (void)setHomeAffordanceOverlayAllowance:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__UISApplicationSupportDisplayEdgeInfo_setHomeAffordanceOverlayAllowance___block_invoke;
  v6[3] = &unk_1E57351C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UISApplicationSupportDisplayEdgeInfo *)self _performIvarUpdateIfAllowed:v6];
}

void __74__UISApplicationSupportDisplayEdgeInfo_setHomeAffordanceOverlayAllowance___block_invoke(uint64_t a1)
{
}

- (void)setSafeAreaInsetsPortrait:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__UISApplicationSupportDisplayEdgeInfo_setSafeAreaInsetsPortrait___block_invoke;
  v6[3] = &unk_1E57351C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UISApplicationSupportDisplayEdgeInfo *)self _performIvarUpdateIfAllowed:v6];
}

void __66__UISApplicationSupportDisplayEdgeInfo_setSafeAreaInsetsPortrait___block_invoke(uint64_t a1)
{
}

- (void)setSafeAreaInsetsLandscapeLeft:(id)a3
{
  id v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if (self->_infoFlags.asInt)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISApplicationSupportDisplayEdgeInfo.m" lineNumber:268 description:@"Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"];
  }
  safeAreaInsetsLandscapeLeft = self->_safeAreaInsetsLandscapeLeft;
  self->_safeAreaInsetsLandscapeLeft = v5;
}

- (void)setSafeAreaInsetsPortraitUpsideDown:(id)a3
{
  id v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if (self->_infoFlags.asInt)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISApplicationSupportDisplayEdgeInfo.m" lineNumber:273 description:@"Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"];
  }
  safeAreaInsetsPortraitUpsideDown = self->_safeAreaInsetsPortraitUpsideDown;
  self->_safeAreaInsetsPortraitUpsideDown = v5;
}

- (void)setSafeAreaInsetsLandscapeRight:(id)a3
{
  id v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if (self->_infoFlags.asInt)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISApplicationSupportDisplayEdgeInfo.m" lineNumber:278 description:@"Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"];
  }
  safeAreaInsetsLandscapeRight = self->_safeAreaInsetsLandscapeRight;
  self->_safeAreaInsetsLandscapeRight = v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_systemMinimumMargin withName:@"systemMinimumMargin" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_peripheryInsets withName:@"peripheryInsets" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_safeAreaInsetsPortrait withName:@"safeAreaInsetsPortrait" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_homeAffordanceOverlayAllowance withName:@"homeAffordanceOverlayAllowance" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_safeAreaInsetsLandscapeLeft withName:@"safeAreaInsetsLandscapeLeft" skipIfNil:1];
  id v9 = (id)[v3 appendObject:self->_safeAreaInsetsPortraitUpsideDown withName:@"safeAreaInsetsPortraitUpsideDown" skipIfNil:1];
  id v10 = (id)[v3 appendObject:self->_safeAreaInsetsLandscapeRight withName:@"safeAreaInsetsLandscapeRight" skipIfNil:1];
  BOOL v11 = [v3 build];

  return (NSString *)v11;
}

@end