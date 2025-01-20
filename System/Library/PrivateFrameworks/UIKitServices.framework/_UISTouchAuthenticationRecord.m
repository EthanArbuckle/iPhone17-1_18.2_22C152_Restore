@interface _UISTouchAuthenticationRecord
+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3;
+ (id)build:(id)a3;
+ (id)new;
- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis;
- (BOOL)eventLeadToSensitiveDataTransmission;
- (BOOL)hostIsInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAllowEvents;
- (NSString)description;
- (NSString)hostBundleId;
- (NSString)hostSDKVersion;
- (NSString)serviceBundleId;
- (_UISTouchAuthenticationRecord)init;
- (_UISTouchAuthenticationRecord)initWithSecurityAnalysis:(id)a3 timestamp:(double)a4 hostBundleId:(id)a5 hostSDKVersion:(id)a6 hostIsInternal:(BOOL)a7 serviceBundleId:(id)a8;
- (double)timeSinceCreation;
- (id)_init;
- (id)analyticsPayloadWithDuration:(uint64_t)a1;
- (int64_t)serviceInstanceIdentifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _UISTouchAuthenticationRecord

+ (id)build:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, id))a3;
  id v6 = -[_UISTouchAuthenticationRecord _init]([_UISMutableTouchAuthenticationRecord alloc]);
  v5[2](v5, v6);

  uint64_t v7 = [v6 copy];
  v8 = [(id)v7 serviceBundleId];

  if (!v8)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, a1, @"_UISTouchAuthenticationRecord.m", 89, @"Invalid parameter not satisfying: %@", @"[record serviceBundleId]" object file lineNumber description];
  }
  v9 = [(id)v7 serviceBundleId];
  v10 = +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:v9];

  v11 = [v10 verifyRecord:v7];
  *(unsigned char *)(v7 + 65) = [v11 passesSecurityAnalysis];
  if ([v10 shouldSuppressInauthenticTouches]) {
    char v12 = [v11 passesSecurityAnalysis];
  }
  else {
    char v12 = 1;
  }
  if ([(id)v7 hostIsInternal]) {
    char v13 = os_variant_allows_internal_security_policies() ^ 1;
  }
  else {
    char v13 = 0;
  }
  *(unsigned char *)(v7 + 66) = v13 | v12;
  if (!*(unsigned char *)(v7 + 65))
  {
    v14 = _UISViewServiceHitTestLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v16 = [(id)v7 securityAnalysis];
      uint64_t v17 = [(id)v7 hostBundleId];
      v18 = (void *)v17;
      if (v17) {
        v19 = (__CFString *)v17;
      }
      else {
        v19 = @"(unknown)";
      }
      [v15 setValue:v19 forKey:@"host"];

      if (*(void *)(v7 + 40)) {
        v20 = *(__CFString **)(v7 + 40);
      }
      else {
        v20 = @"(unknown)";
      }
      [v15 setValue:v20 forKey:@"service"];
      v21 = NSStringFromBOOL();
      [v15 setValue:v21 forKey:@"hti"];

      if (v16)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v16, "hasInsecureFilter"));
        [v15 setValue:v22 forKey:@"inf"];

        v23 = (void *)MEMORY[0x1E4F28ED0];
        [v16 cumulativeOpacity];
        *(float *)&double v25 = v24;
        double v26 = 0.0;
        BOOL v27 = v24 == 0.0;
        double v28 = 0.0;
        if (!v27)
        {
          long double v29 = fabs(*(float *)&v25);
          long double v30 = *(float *)&v25 / v29;
          double v31 = log10(v29);
          double v32 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v31));
          double v25 = round(v29 * v32);
          double v28 = v30 * (v25 / v32);
        }
        uint64_t v33 = objc_msgSend(v23, "numberWithDouble:", v28, v25);
        [v15 setValue:v33 forKey:@"a"];

        v34 = +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:*(void *)(v7 + 40)];
        LODWORD(v33) = [v34 transformGradeFailureReasonsForRecord:v7];

        v35 = NSStringFromBOOL();
        [v15 setValue:v35 forKey:@"tf"];

        memset(&v58, 0, sizeof(v58));
        [v16 cumulativeLayerTransform];
        CATransform3DGetAffineTransform(&transform, &v59);
        CGAffineTransformDecompose(&v58, &transform);
        v56 = [NSString stringWithFormat:@"%d %d %d (%.2f) %d %d (%.2f, %.2f) %d (%.2f) %d (%.2f, %.2f) %d", v33 & 1, (v33 >> 1) & 1, (v33 >> 2) & 1, *(void *)&v58.rotation, (v33 >> 3) & 1, (v33 >> 4) & 1, *(void *)&v58.scale.width, *(void *)&v58.scale.height, (v33 >> 5) & 1, *(void *)&v58.horizontalShear, (v33 >> 6) & 1, *(void *)&v58.translation.dx, *(void *)&v58.translation.dy, (v33 >> 7) & 1];
        objc_msgSend(v15, "setValue:forKey:");
        v36 = [(id)v7 securityAnalysis];
        LODWORD(v35) = [v36 occlusionMask];

        v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d %d %d %d", (v35 >> 1) & 1, (v35 >> 2) & 1, (v35 >> 3) & 1, (v35 >> 4) & 1);
        [v15 setValue:v37 forKey:@"occ_components"];
        v38 = (void *)MEMORY[0x1E4F28ED0];
        v39 = [(id)v7 securityAnalysis];
        [v39 occlusionPercentage];
        if (v40 != 0.0)
        {
          double v41 = v40;
          long double v42 = fabs(v41);
          long double v43 = v41 / v42;
          double v44 = log10(v42);
          double v45 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v44));
          double v26 = v43 * (round(v42 * v45) / v45);
        }
        v46 = [v38 numberWithDouble:v26];
        [v15 setValue:v46 forKey:@"ocp"];

        v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v16, "parentsHaveInsecureLayerProperties"));
        [v15 setValue:v47 forKey:@"pip"];

        v48 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v7 + 65)];
        [v15 setValue:v48 forKey:@"default"];

        [v15 setValue:*(void *)(v7 + 24) forKey:@"sdkVersion"];
      }

      LODWORD(v59.m11) = 134349314;
      *(void *)((char *)&v59.m11 + 4) = v7;
      WORD2(v59.m12) = 2114;
      *(void *)((char *)&v59.m12 + 6) = v15;
      _os_log_impl(&dword_191ABF000, v14, OS_LOG_TYPE_DEFAULT, "Hit test info for record %{public}p: %{public}@", (uint8_t *)&v59, 0x16u);
    }
    v49 = [v11 failureReasons];

    if (v49)
    {
      v50 = _UISViewServiceHitTestLogger();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = objc_opt_class();
        id v52 = v51;
        v53 = [v11 failureReasons];
        LODWORD(v59.m11) = 138543874;
        *(void *)((char *)&v59.m11 + 4) = v51;
        WORD2(v59.m12) = 2050;
        *(void *)((char *)&v59.m12 + 6) = v7;
        HIWORD(v59.m13) = 2114;
        *(void *)&v59.m14 = v53;
        _os_log_impl(&dword_191ABF000, v50, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> Touch failed authentication for the following reasons:%{public}@", (uint8_t *)&v59, 0x20u);
      }
    }
  }
  *(void *)(v7 + 56) = mach_continuous_time();

  return (id)v7;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"_UISTouchAuthenticationRecord.m" lineNumber:127 description:@"_UISTouchAuthenticationRecord cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)_UISTouchAuthenticationRecord;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (_UISTouchAuthenticationRecord)init
{
  uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
  v4 = [NSString stringWithUTF8String:"-[_UISTouchAuthenticationRecord init]"];
  [v3 handleFailureInFunction:v4 file:@"_UISTouchAuthenticationRecord.m" lineNumber:116 description:@"cannot directly allocate _UISTouchAuthenticationRecord"];

  return 0;
}

+ (id)new
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"+[_UISTouchAuthenticationRecord new]"];
  [v2 handleFailureInFunction:v3 file:@"_UISTouchAuthenticationRecord.m" lineNumber:121 description:@"cannot directly allocate _UISTouchAuthenticationRecord"];

  return 0;
}

- (unint64_t)hash
{
  uint64_t v3 = [(BKSWindowServerHitTestSecurityAnalysis *)self->_securityAnalysis hash];
  NSUInteger v4 = [(NSString *)self->_hostBundleId hash];
  NSUInteger v5 = [(NSString *)self->_hostSDKVersion hash];
  NSUInteger v6 = [(NSString *)self->_serviceBundleId hash];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_serviceInstanceIdentifier];
  uint64_t v8 = [v7 hash];

  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ ((unint64_t)self->_hostIsInternal << 16);
  return MEMORY[0x1F411A088](v9);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v5 = v4;
    BOOL v6 = BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && *((unsigned __int8 *)v5 + 32) == self->_hostIsInternal
      && BSEqualObjects()
      && v5[6] == self->_serviceInstanceIdentifier;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F62818] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = (id)[v10 appendObject:self->_securityAnalysis withName:@"securityAnalysis"];
  id v5 = (id)[v10 appendObject:self->_hostBundleId withName:@"hostBundleId"];
  id v6 = (id)[v10 appendObject:self->_hostSDKVersion withName:@"hostSDKVersion"];
  id v7 = (id)[v10 appendBool:self->_hostIsInternal withName:@"hostIsInternal"];
  id v8 = (id)[v10 appendObject:self->_serviceBundleId withName:@"serviceBundleId"];
  id v9 = (id)[v10 appendInteger:self->_serviceInstanceIdentifier withName:@"serviceInstanceIdentifier"];
}

- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis
{
  return self->_securityAnalysis;
}

- (NSString)hostBundleId
{
  return self->_hostBundleId;
}

- (NSString)hostSDKVersion
{
  return self->_hostSDKVersion;
}

- (BOOL)hostIsInternal
{
  return self->_hostIsInternal;
}

- (NSString)serviceBundleId
{
  return self->_serviceBundleId;
}

- (int64_t)serviceInstanceIdentifier
{
  return self->_serviceInstanceIdentifier;
}

+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3
{
  return +[_UISTouchAuthenticationVerifier shouldAuthenticateServiceBundleId:a3];
}

- (id)analyticsPayloadWithDuration:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [(id)a1 securityAnalysis];
    uint64_t v6 = [(id)a1 hostBundleId];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = @"(unknown)";
    }
    [v4 setValue:v8 forKey:@"hostBundleId"];

    if (*(void *)(a1 + 40)) {
      id v9 = *(__CFString **)(a1 + 40);
    }
    else {
      id v9 = @"(unknown)";
    }
    [v4 setValue:v9 forKey:@"serviceBundleId"];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 65)];
    [v4 setValue:v10 forKey:@"touchIsAuthentic"];

    v11 = NSStringFromBOOL();
    [v4 setValue:v11 forKey:@"hasHitTestInfo"];

    if (v5)
    {
      char v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "occlusionMask") != 0);
      [v4 setValue:v12 forKey:@"detectedOcclusion"];

      char v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v5, "hasInsecureFilter"));
      [v4 setValue:v13 forKey:@"hasInsecureFilter"];

      v14 = (void *)MEMORY[0x1E4F28ED0];
      [v5 cumulativeOpacity];
      *(float *)&double v16 = v15;
      double v17 = 0.0;
      BOOL v18 = v15 == 0.0;
      double v19 = 0.0;
      if (!v18)
      {
        long double v20 = fabs(*(float *)&v16);
        long double v21 = *(float *)&v16 / v20;
        double v22 = log10(v20);
        double v23 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v22));
        double v16 = round(v20 * v23);
        double v19 = v21 * (v16 / v23);
      }
      uint64_t v24 = objc_msgSend(v14, "numberWithDouble:", v19, v16);
      [v4 setValue:v24 forKey:@"cumulativeOpacity"];

      double v25 = +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:*(void *)(a1 + 40)];
      LODWORD(v24) = [v25 transformGradeFailureReasonsForRecord:a1];

      double v26 = NSStringFromBOOL();
      [v4 setValue:v26 forKey:@"hasInvalidTransform"];

      BOOL v27 = [MEMORY[0x1E4F28ED0] numberWithInt:v24 & 1];
      [v4 setValue:v27 forKey:@"transformFailFiniteTransform"];

      double v28 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 1) & 1];
      [v4 setValue:v28 forKey:@"transformFailAffineTransform"];

      long double v29 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 2) & 1];
      [v4 setValue:v29 forKey:@"transformFailAllowedRotation"];

      long double v30 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 3) & 1];
      [v4 setValue:v30 forKey:@"transformFailUniformScale"];

      double v31 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 4) & 1];
      [v4 setValue:v31 forKey:@"transformFailAllowedScale"];

      double v32 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 5) & 1];
      [v4 setValue:v32 forKey:@"transformFailAllowedShear"];

      uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 6) & 1];
      [v4 setValue:v33 forKey:@"transformFailAllowedTranslation"];

      v34 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 >> 7) & 1];
      [v4 setValue:v34 forKey:@"transformFailAllowedShift"];

      v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v5, "parentsHaveInsecureLayerProperties"));
      [v4 setValue:v35 forKey:@"parentsHaveInsecureLayerProperties"];

      v36 = (void *)MEMORY[0x1E4F28ED0];
      v37 = [(id)a1 securityAnalysis];
      [v37 occlusionPercentage];
      if (v38 != 0.0)
      {
        double v39 = v38;
        long double v40 = fabs(v39);
        long double v41 = v39 / v40;
        double v42 = log10(v40);
        double v43 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v42));
        double v17 = v41 * (round(v40 * v43) / v43);
      }
      double v44 = [v36 numberWithDouble:v17];
      [v4 setValue:v44 forKey:@"occlusionPercentage"];

      if (a2)
      {
        double v45 = (void *)MEMORY[0x1E4F28ED0];
        double v46 = -[_UISTouchAuthenticationRecord timeSinceCreation](a1);
        if (v46 == 0.0)
        {
          double v51 = 0.0;
        }
        else
        {
          long double v47 = fabs(v46);
          long double v48 = v46 / v47;
          double v49 = log10(v47);
          double v50 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v49));
          double v51 = v48 * (round(v47 * v50) / v50);
        }
        id v52 = [v45 numberWithDouble:v51];
        [v4 setValue:v52 forKey:@"duration"];
      }
      v53 = [(id)a1 securityAnalysis];
      unsigned int v54 = [v53 occlusionMask];

      unint64_t v55 = (unint64_t)(v54 & 4) >> 1;
      if ((v54 & 4) == 0) {
        unint64_t v55 = ((uint64_t)((unint64_t)v54 << 62) >> 63) & 3;
      }
      if ((v54 & 8) != 0) {
        uint64_t v56 = 1;
      }
      else {
        uint64_t v56 = v55;
      }
      v57 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v56];
      [v4 setValue:v57 forKey:@"occlusionType"];

      CGAffineTransformComponents v58 = [MEMORY[0x1E4F28ED0] numberWithInt:(v54 >> 1) & 1];
      [v4 setValue:v58 forKey:@"occlusionTypeLayer"];

      CATransform3D v59 = [MEMORY[0x1E4F28ED0] numberWithInt:(v54 >> 2) & 1];
      [v4 setValue:v59 forKey:@"occlusionTypeClipped"];

      uint64_t v60 = [MEMORY[0x1E4F28ED0] numberWithInt:(unint64_t)(v54 & 8) >> 3];
      [v4 setValue:v60 forKey:@"occlusionTypeBorder"];

      v61 = [MEMORY[0x1E4F28ED0] numberWithInt:(v54 >> 4) & 1];
      [v4 setValue:v61 forKey:@"occlusionTypeLayerLimit"];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (double)timeSinceCreation
{
  if (!a1) {
    return 0.0;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v2 = mach_continuous_time();
  LODWORD(v4) = info.denom;
  LODWORD(v3) = info.numer;
  return (double)(v2 - *(void *)(a1 + 56)) * (double)v3 / (double)v4 / 1000000000.0;
}

- (_UISTouchAuthenticationRecord)initWithSecurityAnalysis:(id)a3 timestamp:(double)a4 hostBundleId:(id)a5 hostSDKVersion:(id)a6 hostIsInternal:(BOOL)a7 serviceBundleId:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  double v17 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __127___UISTouchAuthenticationRecord_initWithSecurityAnalysis_timestamp_hostBundleId_hostSDKVersion_hostIsInternal_serviceBundleId___block_invoke;
  v24[3] = &unk_1E57351E8;
  id v25 = v13;
  id v26 = v14;
  BOOL v29 = a7;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  double v22 = [v17 build:v24];

  return v22;
}

- (BOOL)eventLeadToSensitiveDataTransmission
{
  return self->_eventLeadToSensitiveDataTransmission;
}

- (BOOL)shouldAllowEvents
{
  return self->_shouldAllowEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBundleId, 0);
  objc_storeStrong((id *)&self->_hostSDKVersion, 0);
  objc_storeStrong((id *)&self->_hostBundleId, 0);
  objc_storeStrong((id *)&self->_securityAnalysis, 0);
}

@end