@interface _UISTouchAuthenticationVerifier
+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3;
+ (id)runOverriddenThresholds;
+ (id)verifierForServiceBundleId:(id)a3;
- (BOOL)shouldSuppressInauthenticTouches;
- (id)failureDescriptionForSecurityAnalysis:(uint64_t)a3 minimumOpacity:(double)a4 occlusionThreshold:(double)a5 transformGrade:;
- (id)verifyRecord:(id)a3;
- (uint64_t)_hostSupportsStrictTouchVerificationForRecord:(uint64_t)a1;
- (unint64_t)transformGradeFailureReasonsForRecord:(id)a3;
@end

@implementation _UISTouchAuthenticationVerifier

+ (id)runOverriddenThresholds
{
  self;
  if (os_variant_allows_internal_security_policies())
  {
    v2 = (void *)runOverriddenThresholds_userDefaults;
    if (!runOverriddenThresholds_userDefaults)
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
      v4 = (void *)runOverriddenThresholds_userDefaults;
      runOverriddenThresholds_userDefaults = v3;

      v2 = (void *)runOverriddenThresholds_userDefaults;
    }
    v0 = [v2 objectForKey:@"touchAuthenticationOverriddenThresholds"];
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3
{
  id v3 = a3;
  self;
  v4 = [&unk_1EE295D08 objectForKeyedSubscript:v3];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = +[_UISTouchAuthenticationVerifier runOverriddenThresholds]();
    v7 = [v6 objectForKeyedSubscript:v3];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

+ (id)verifierForServiceBundleId:(id)a3
{
  id v3 = a3;
  v4 = [(id)verifierForServiceBundleId__verifiersByServiceBundleId objectForKeyedSubscript:v3];
  if (!v4)
  {
    self;
    BOOL v5 = [&unk_1EE295D08 objectForKeyedSubscript:v3];
    v6 = +[_UISTouchAuthenticationVerifier runOverriddenThresholds]();
    v7 = [v6 objectForKeyedSubscript:v3];

    v4 = [_UISTouchAuthenticationVerifier alloc];
    unint64_t v8 = v5;
    unint64_t v9 = v7;
    if (v4)
    {
      v43.receiver = v4;
      v43.super_class = (Class)_UISTouchAuthenticationVerifier;
      v10 = objc_msgSendSuper2(&v43, sel_init);
      v4 = v10;
      if (v10)
      {
        if (v8 | v9)
        {
          v11 = (NSDictionary *)[&unk_1EE295D30 mutableCopy];
          v12 = v11;
          if (v8) {
            [(NSDictionary *)v11 addEntriesFromDictionary:v8];
          }
          if (v9) {
            [(NSDictionary *)v12 addEntriesFromDictionary:v9];
          }
          thresholds = v4->_thresholds;
          v4->_thresholds = v12;
        }
        else
        {
          thresholds = v10->_thresholds;
          v10->_thresholds = (NSDictionary *)&unk_1EE295D58;
        }

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __89___UISTouchAuthenticationVerifier_initWithBuildOverrideThresholds_runOverrideThresholds___block_invoke;
        v41[3] = &unk_1E57355A8;
        v4 = v4;
        v42 = v4;
        v14 = (void (**)(void, void, double, double))MEMORY[0x192FE1660](v41);
        v15 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"lowerScaleMultiplierLenient"];
        [v15 doubleValue];
        double v17 = v16;
        v18 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"upperScaleMultiplierLenient"];
        [v18 doubleValue];
        double v20 = v19;
        v21 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"allowsAllRotations"];
        uint64_t v22 = v14[2](v14, [v21 BOOLValue], v17, v20);
        lenientGrader = v4->_lenientGrader;
        v4->_lenientGrader = (UISTransform3DGrader *)v22;

        v24 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"lowerScaleMultiplierStrict"];
        [v24 doubleValue];
        double v26 = v25;
        v27 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"upperScaleMultiplierStrict"];
        [v27 doubleValue];
        double v29 = v28;
        v30 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"allowsAllRotations"];
        uint64_t v31 = v14[2](v14, [v30 BOOLValue], v26, v29);
        strictGrader = v4->_strictGrader;
        v4->_strictGrader = (UISTransform3DGrader *)v31;

        if (os_variant_allows_internal_security_policies())
        {
          v4->_shouldSuppressInauthenticTouches = 1;
        }
        else
        {
          v33 = [(NSDictionary *)v4->_thresholds objectForKeyedSubscript:@"suppressTouchOnCustomerOS"];
          v4->_shouldSuppressInauthenticTouches = v33 != 0;
        }
      }
    }

    v34 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
    if (!verifierForServiceBundleId__verifiersByServiceBundleId)
    {
      v35 = (void *)MEMORY[0x1E4F1CA60];
      self;
      v36 = [&unk_1EE295D08 allKeys];
      v37 = [v35 sharedKeySetForKeys:v36];
      uint64_t v38 = [v35 dictionaryWithSharedKeySet:v37];
      v39 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
      verifierForServiceBundleId__verifiersByServiceBundleId = v38;

      v34 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
    }
    [v34 setObject:v4 forKeyedSubscript:v3];
  }
  return v4;
}

- (uint64_t)_hostSupportsStrictTouchVerificationForRecord:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  v4 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"hostsForLenientTouchAuthentication"];
  if (!v4) {
    goto LABEL_7;
  }
  BOOL v5 = [v3 hostBundleId];
  if (([v4 containsObject:v5] & 1) == 0)
  {

LABEL_7:
    unint64_t v8 = [v3 hostSDKVersion];
    unint64_t v9 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"SDKVersionForStrictTouchAuthentication"];
    if ([v8 length] && objc_msgSend(v9, "length"))
    {
      v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      uint64_t v7 = [v10 isVersion:v8 greaterThanOrEqualToVersion:v9];
    }
    else
    {
      uint64_t v7 = ![v8 length] && objc_msgSend(v9, "length");
    }

    goto LABEL_15;
  }
  char v6 = [v3 hostIsInternal];

  if ((v6 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_15:

LABEL_16:
  return v7;
}

- (unint64_t)transformGradeFailureReasonsForRecord:(id)a3
{
  id v4 = a3;
  int v5 = -[_UISTouchAuthenticationVerifier _hostSupportsStrictTouchVerificationForRecord:]((uint64_t)self, v4);
  uint64_t v6 = 16;
  if (v5) {
    uint64_t v6 = 24;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  unint64_t v8 = [v4 securityAnalysis];

  if (v8) {
    [v8 cumulativeLayerTransform];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  unint64_t v9 = [v7 gradeTransform3D:v11];

  return v9;
}

- (id)failureDescriptionForSecurityAnalysis:(uint64_t)a3 minimumOpacity:(double)a4 occlusionThreshold:(double)a5 transformGrade:
{
  id v9 = a2;
  if (!a1 || !os_variant_allows_internal_security_policies())
  {
    v10 = 0;
    goto LABEL_4;
  }
  v12 = objc_opt_new();
  v10 = v12;
  if (!v9)
  {
    [v12 appendString:@" < security analysis missing >"];
    goto LABEL_4;
  }
  [v9 cumulativeOpacity];
  if (v13 < a4)
  {
    v14 = NSString;
    [v9 cumulativeOpacity];
    double v16 = [v14 stringWithFormat:@" < computed opacity %.2f%% less than %.2f%% threshold >", (float)(v15 * 100.0), a4 * 100.0];
    [v10 appendString:v16];
  }
  if ([v9 hasInsecureFilter])
  {
    double v17 = [NSString stringWithFormat:@" < insecure filter detected >"];
    [v10 appendString:v17];
  }
  if (a3)
  {
    memset(&v32, 0, sizeof(v32));
    [v9 cumulativeLayerTransform];
    CATransform3DGetAffineTransform(&transform, &v30);
    CGAffineTransformDecompose(&v32, &transform);
    v18 = objc_opt_new();
    double v19 = v18;
    if (a3)
    {
      [v18 appendString:@" non-finite"];
      if ((a3 & 2) == 0)
      {
LABEL_15:
        if ((a3 & 4) == 0) {
          goto LABEL_16;
        }
        goto LABEL_30;
      }
    }
    else if ((a3 & 2) == 0)
    {
      goto LABEL_15;
    }
    [v19 appendString:@" non-affine"];
    if ((a3 & 4) == 0)
    {
LABEL_16:
      if ((a3 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_31;
    }
LABEL_30:
    double v26 = [NSString stringWithFormat:@" invalid-rotation[%.2f]", *(void *)&v32.rotation];
    [v19 appendString:v26];

    if ((a3 & 8) == 0)
    {
LABEL_17:
      if ((a3 & 0x10) == 0)
      {
        if ((a3 & 0x20) == 0) {
          goto LABEL_19;
        }
        goto LABEL_34;
      }
LABEL_32:
      [v19 appendString:@" scale.not-allowed"];
LABEL_33:
      v27 = [NSString stringWithFormat:@" scale[width=%.2f, height=%.2f]", *(void *)&v32.scale.width, *(void *)&v32.scale.height];
      [v19 appendString:v27];

      if ((a3 & 0x20) == 0)
      {
LABEL_19:
        if ((a3 & 0x40) == 0) {
          goto LABEL_20;
        }
        goto LABEL_35;
      }
LABEL_34:
      double v28 = [NSString stringWithFormat:@" invalid-shear[%.2f]", *(void *)&v32.horizontalShear];
      [v19 appendString:v28];

      if ((a3 & 0x40) == 0)
      {
LABEL_20:
        if ((a3 & 0x80) == 0)
        {
LABEL_22:
          double v20 = [NSString stringWithFormat:@" < failed transforms: %@ >", v19];
          [v10 appendString:v20];

          goto LABEL_23;
        }
LABEL_21:
        [v19 appendString:@" invalid-shift"];
        goto LABEL_22;
      }
LABEL_35:
      double v29 = [NSString stringWithFormat:@" invalid-translation[dx=%.2f, dy=%.2f]", *(void *)&v32.translation.dx, *(void *)&v32.translation.dy];
      [v19 appendString:v29];

      if ((a3 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_31:
    [v19 appendString:@" scale.not-uniform"];
    if ((a3 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_23:
  [v9 occlusionPercentage];
  if (v21 >= a5)
  {
    uint64_t v22 = NSString;
    [v9 occlusionPercentage];
    v24 = [v22 stringWithFormat:@" < occlusion %.2f%% greater than %.2f%% threshold >", (float)(v23 * 100.0), a5 * 100.0];
    [v10 appendString:v24];
  }
  if (![v10 length])
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:sel_failureDescriptionForSecurityAnalysis_minimumOpacity_occlusionThreshold_transformGrade_ object:a1 file:@"_UISTouchAuthenticationVerifier.m" lineNumber:452 description:@"touch failed authentication but we were unable to describe why"];
  }
LABEL_4:

  return v10;
}

- (id)verifyRecord:(id)a3
{
  id v4 = a3;
  int v5 = -[_UISTouchAuthenticationVerifier _hostSupportsStrictTouchVerificationForRecord:]((uint64_t)self, v4);
  if (v5) {
    uint64_t v6 = @"minimumOpacityStrict";
  }
  else {
    uint64_t v6 = @"minimumOpacityLenient";
  }
  if (v5) {
    id v7 = @"occlusionThresholdStrict";
  }
  else {
    id v7 = @"occlusionThresholdLenient";
  }
  unint64_t v8 = [(NSDictionary *)self->_thresholds objectForKeyedSubscript:v6];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [(NSDictionary *)self->_thresholds objectForKeyedSubscript:v7];
  [v11 doubleValue];
  double v13 = v12;

  v14 = [v4 securityAnalysis];
  uint64_t v15 = [(_UISTouchAuthenticationVerifier *)self transformGradeFailureReasonsForRecord:v4];

  if (!v14
    || ([v14 cumulativeOpacity], v10 >= v16)
    || ([v14 hasInsecureFilter] & 1) != 0
    || v15
    || ([v14 occlusionPercentage], v13 <= v17))
  {
    if (os_variant_allows_internal_security_policies())
    {
      v18 = -[_UISTouchAuthenticationVerifier failureDescriptionForSecurityAnalysis:minimumOpacity:occlusionThreshold:transformGrade:]((uint64_t)self, v14, v15, v10, v13);
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
    uint64_t v19 = 1;
  }
  double v20 = [[_UISTouchAuthenticationVerifierResult alloc] initWithPassesSecurityAnalysis:v19 failureReasons:v18];

  return v20;
}

- (BOOL)shouldSuppressInauthenticTouches
{
  return self->_shouldSuppressInauthenticTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strictGrader, 0);
  objc_storeStrong((id *)&self->_lenientGrader, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
}

@end