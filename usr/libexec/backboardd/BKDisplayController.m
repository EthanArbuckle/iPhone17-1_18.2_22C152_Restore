@interface BKDisplayController
+ (BKDisplayController)sharedInstance;
- ($446564691F179F0A09753BCCEB4D3730)transformLayerPropertiesForDisplay:(SEL)a3 displayInterfaceOrientation:(id)a4;
- ($F7CACAAF0F09BFB3533BE937C26B5F66)geometryForDisplayUUID:(SEL)a3;
- (BKDisplayController)init;
- (BOOL)contextIDAtCAScreenLocation:(CGPoint)a3 displayUUID:(id)a4 options:(id)a5 securityAnalysis:(id *)a6 results:(id *)a7;
- (BOOL)displayIsBlanked:(id)a3;
- (CGPoint)convertCAScreenLocation:(CGPoint)a3 toContextID:(unsigned int)a4 displayUUID:(id)a5;
- (CGPoint)convertReferenceLocation:(CGPoint)a3 toCAScreenLocationForDisplayUUID:(id)a4;
- (id)addDisplayBlankingObserver:(id)a3;
- (int64_t)hitTestCategoryForContextID:(unsigned int)a3;
- (unsigned)hostContextIDForEmbeddedContextID:(unsigned int)a3 displayUUID:(id)a4;
- (unsigned)taskPortForContextID:(unsigned int)a3 displayUUID:(id)a4;
- (void)applySceneHostSettingsToHostingChain:(id)a3;
- (void)removeSceneHostSettingsForContextID:(unsigned int)a3;
- (void)setSceneHostSettings:(id)a3;
- (void)setSceneHostSettings:(id)a3 forContextID:(unsigned int)a4;
@end

@implementation BKDisplayController

- (void)applySceneHostSettingsToHostingChain:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v19 = v4;
  v5 = [v4 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
        if (v11) {
          uint64_t v13 = *(unsigned int *)(v11 + 8);
        }
        else {
          uint64_t v13 = 0;
        }
        v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13, lock);
        v15 = [(NSMutableDictionary *)lock_sceneHostSettingsByContextID objectForKeyedSubscript:v14];

        if (v15)
        {
          id v16 = v15;

          v8 = v16;
        }
        if (v11) {
          objc_storeStrong((id *)(v11 + 16), v8);
        }

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v17 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v7 = v17;
    }
    while (v17);
  }
  else
  {
    v8 = 0;
  }

  os_unfair_lock_unlock(lock);
}

- (unsigned)hostContextIDForEmbeddedContextID:(unsigned int)a3 displayUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = +[CAWindowServer serverIfRunning];
  LODWORD(v4) = [v5 contextIdHostingContextId:v4];

  return v4;
}

- (CGPoint)convertReferenceLocation:(CGPoint)a3 toCAScreenLocationForDisplayUUID:(id)a4
{
  sub_100010B54(a4);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertCAScreenLocation:(CGPoint)a3 toContextID:(unsigned int)a4 displayUUID:(id)a5
{
  if (self)
  {
    double v5 = sub_100010C48(*(uint64_t *)&a4, a5, a3.x, a3.y);
  }
  else
  {
    double v6 = 0.0;
    double v5 = 0.0;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setSceneHostSettings:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  double v5 = BKLogTouchEvents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setSceneHostSettings: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  double v6 = (NSMutableDictionary *)[v4 mutableCopy];
  lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
  self->_lock_sceneHostSettingsByContextID = v6;

  os_unfair_lock_unlock(&self->_lock);
}

+ (BKDisplayController)sharedInstance
{
  if (qword_100122DC0 != -1) {
    dispatch_once(&qword_100122DC0, &stru_1000F58C8);
  }
  v2 = (void *)qword_100122DC8;

  return (BKDisplayController *)v2;
}

- (BOOL)contextIDAtCAScreenLocation:(CGPoint)a3 displayUUID:(id)a4 options:(id)a5 securityAnalysis:(id *)a6 results:(id *)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  *(_OWORD *)&a7->var0 = 0u;
  *(_OWORD *)&a7->var3 = 0u;
  *(_OWORD *)&a7->var5.m11 = 0u;
  *(_OWORD *)&a7->var5.m13 = 0u;
  *(_OWORD *)&a7->var5.m21 = 0u;
  *(_OWORD *)&a7->var5.m23 = 0u;
  *(_OWORD *)&a7->var5.m31 = 0u;
  *(_OWORD *)&a7->var5.m33 = 0u;
  *(_OWORD *)&a7->var5.m41 = 0u;
  *(_OWORD *)&a7->var5.m43 = 0u;
  *(_OWORD *)&a7->var6.m11 = 0u;
  *(_OWORD *)&a7->var6.m13 = 0u;
  *(_OWORD *)&a7->var6.m21 = 0u;
  *(_OWORD *)&a7->var6.m23 = 0u;
  *(_OWORD *)&a7->var6.m31 = 0u;
  *(_OWORD *)&a7->var6.m33 = 0u;
  *(_OWORD *)&a7->var6.m41 = 0u;
  *(_OWORD *)&a7->var6.m43 = 0u;
  *(_OWORD *)&a7->var7 = 0u;
  if (a6) {
    *a6 = 0;
  }
  id v14 = a5;
  id v15 = v13;
  if (self)
  {
    id v16 = +[CAWindowServer serverIfRunning];
    id v17 = v16;
    if (v15) {
      [v16 displayWithUniqueId:v15];
    }
    else {
      sub_100010DDC();
    }
    self = (BKDisplayController *)objc_claimAutoreleasedReturnValue();
  }
  v18 = -[BKDisplayController hitTestAtPosition:options:](self, "hitTestAtPosition:options:", v14, x, y);

  if (!v18) {
    goto LABEL_71;
  }
  v19 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestContextId];
  a7->var0 = [v19 unsignedIntValue];

  long long v20 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestSlotId];
  a7->var1 = [v20 unsignedIntValue];

  a7->var2 = sub_100009EBC(a7->var0);
  if (a6)
  {
    id v83 = 0;
    long long v21 = +[BKSWindowServerHitTestSecurityAnalysis securityAnalysisFromCAHitTestDictionary:v18 errorString:&v83];
    id v22 = v83;
    *a6 = v21;
    if (v22)
    {
      long long v23 = BKLogTouchEvents();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (a7->var1)
  {
    v24 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestDetectedOcclusion];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    unsigned __int8 v29 = [v28 BOOLValue];
    a7->var7 = v29;
    a7->var3 = 0;
    v30 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeOpacity];
    uint64_t v31 = objc_opt_class();
    id v32 = v30;
    if (v31)
    {
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
    id v34 = v33;

    if (v34)
    {
      [v34 floatValue];
      a7->var4 = v35;
      a7->var3 |= 2uLL;
    }
    v82 = v34;
    v36 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeLayerTransform];
    uint64_t v37 = objc_opt_class();
    id v38 = v36;
    if (v37)
    {
      if (objc_opt_isKindOfClass()) {
        v39 = v38;
      }
      else {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
    }
    id v40 = v39;

    if (v40)
    {
      [v40 CATransform3DValue];
      long long v41 = v89;
      *(_OWORD *)&a7->var5.m31 = v88;
      *(_OWORD *)&a7->var5.m33 = v41;
      long long v42 = v91;
      *(_OWORD *)&a7->var5.m41 = v90;
      *(_OWORD *)&a7->var5.m43 = v42;
      long long v43 = v85;
      *(_OWORD *)&a7->var5.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var5.m13 = v43;
      long long v44 = v87;
      *(_OWORD *)&a7->var5.m21 = v86;
      *(_OWORD *)&a7->var5.m23 = v44;
      a7->var3 |= 0x10uLL;
    }
    v81 = v40;
    v45 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeContentsTransform];
    uint64_t v46 = objc_opt_class();
    id v47 = v45;
    if (v46)
    {
      if (objc_opt_isKindOfClass()) {
        v48 = v47;
      }
      else {
        v48 = 0;
      }
    }
    else
    {
      v48 = 0;
    }
    id v49 = v48;

    if (v49)
    {
      [v49 CATransform3DValue];
      long long v50 = v89;
      *(_OWORD *)&a7->var6.m31 = v88;
      *(_OWORD *)&a7->var6.m33 = v50;
      long long v51 = v91;
      *(_OWORD *)&a7->var6.m41 = v90;
      *(_OWORD *)&a7->var6.m43 = v51;
      long long v52 = v85;
      *(_OWORD *)&a7->var6.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var6.m13 = v52;
      long long v53 = v87;
      *(_OWORD *)&a7->var6.m21 = v86;
      *(_OWORD *)&a7->var6.m23 = v53;
      a7->var3 |= 0x20uLL;
    }
    v54 = [v18 objectForKeyedSubscript:@"hitTestInsecureFiltered" v49];
    uint64_t v55 = objc_opt_class();
    id v56 = v54;
    if (v55)
    {
      if (objc_opt_isKindOfClass()) {
        v57 = v56;
      }
      else {
        v57 = 0;
      }
    }
    else
    {
      v57 = 0;
    }
    id v58 = v57;

    if (v58)
    {
      a7->var8 = [v58 BOOLValue];
      a7->var3 |= 4uLL;
    }
    v59 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestLayerBackgroundAverage];
    uint64_t v60 = objc_opt_class();
    id v61 = v59;
    if (v60)
    {
      if (objc_opt_isKindOfClass()) {
        v62 = v61;
      }
      else {
        v62 = 0;
      }
    }
    else
    {
      v62 = 0;
    }
    id v63 = v62;

    v64 = [v18 objectForKeyedSubscript:kCAWindowServerHitTestLayerBackgroundStandardDeviation];
    uint64_t v65 = objc_opt_class();
    id v66 = v64;
    v67 = self;
    if (v65)
    {
      if (objc_opt_isKindOfClass()) {
        v68 = v66;
      }
      else {
        v68 = 0;
      }
    }
    else
    {
      v68 = 0;
    }
    id v69 = v68;

    v70 = [v18 objectForKeyedSubscript:@"hitTestBackgroundAverageContrastThreshold"];
    uint64_t v71 = objc_opt_class();
    id v72 = v70;
    if (v71)
    {
      if (objc_opt_isKindOfClass()) {
        v73 = v72;
      }
      else {
        v73 = 0;
      }
    }
    else
    {
      v73 = 0;
    }
    id v74 = v73;

    if (v63 && v69 && v74)
    {
      [v63 floatValue];
      a7->var9 = v75;
      [v69 floatValue];
      a7->var10 = v76;
      [v74 floatValue];
      a7->var11 = v77;
      a7->var3 |= 8uLL;
    }

    self = v67;
  }
  if (a7->var0 && a7->var2 + 1 > 1)
  {
    BOOL v78 = 1;
  }
  else
  {
LABEL_71:
    BOOL v78 = 0;
    a7->var0 = 0;
  }

  return v78;
}

- (unsigned)taskPortForContextID:(unsigned int)a3 displayUUID:(id)a4
{
  return sub_100009EBC(*(uint64_t *)&a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_sceneHostSettingsByContextID, 0);

  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

- ($446564691F179F0A09753BCCEB4D3730)transformLayerPropertiesForDisplay:(SEL)a3 displayInterfaceOrientation:(id)a4
{
  double a = CGAffineTransformIdentity.a;
  double b = CGAffineTransformIdentity.b;
  double c = CGAffineTransformIdentity.c;
  double d = CGAffineTransformIdentity.d;
  tdouble x = CGAffineTransformIdentity.tx;
  tdouble y = CGAffineTransformIdentity.ty;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = [a4 uniqueId];
  [(BKDisplayController *)self geometryForDisplayUUID:v14];

  float64x2_t v16 = 0u;
  int8x16_t v17 = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  switch(a5)
  {
    case 4:
      float64x2_t v19 = (float64x2_t)v17;
      CGAffineTransformMakeRotation(&v20, -1.57079633);
      t1.double a = CGAffineTransformIdentity.a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      v18 = &v20;
LABEL_7:
      CGPoint result = ($446564691F179F0A09753BCCEB4D3730 *)CGAffineTransformConcat(&v24, &t1, v18);
      double a = v24.a;
      double b = v24.b;
      double c = v24.c;
      double d = v24.d;
      float64x2_t v16 = v19;
      goto LABEL_8;
    case 3:
      float64x2_t v19 = (float64x2_t)v17;
      CGAffineTransformMakeRotation(&v21, 1.57079633);
      t1.double a = CGAffineTransformIdentity.a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      v18 = &v21;
      goto LABEL_7;
    case 2:
      CGAffineTransformMakeRotation(&v22, -3.14159265);
      t1.double a = CGAffineTransformIdentity.a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      CGPoint result = ($446564691F179F0A09753BCCEB4D3730 *)CGAffineTransformConcat(&v24, &t1, &v22);
      float64x2_t v16 = 0u;
      double a = v24.a;
      double b = v24.b;
      double c = v24.c;
      double d = v24.d;
LABEL_8:
      tdouble x = v24.tx;
      tdouble y = v24.ty;
      break;
  }
  retstr->var0.double a = round(a);
  retstr->var0.double b = round(b);
  retstr->var0.double c = round(c);
  retstr->var0.double d = round(d);
  retstr->var0.tdouble x = round(tx);
  retstr->var0.tdouble y = round(ty);
  retstr->var1.origin.double x = 0.0;
  retstr->var1.origin.double y = 0.0;
  retstr->var1.size = (CGSize)vdivq_f64(v16, (float64x2_t)vdupq_lane_s64(0, 0));
  return result;
}

- ($F7CACAAF0F09BFB3533BE937C26B5F66)geometryForDisplayUUID:(SEL)a3
{
  id v5 = a4;
  retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var3.origin = 0u;
  retstr->var3.size = 0u;
  id v6 = v5;
  id v10 = v6;
  if (!v6
    || (unsigned int v7 = [v6 isEqualToString:BKSDisplayUUIDMainKey], v10, v8 = v10, v7))
  {
    int v8 = 0;
  }
  sub_100011044(v8, retstr, &retstr->var0.height, &retstr->var1, &retstr->var2, (uint64_t)&retstr->var3);

  return result;
}

- (void)removeSceneHostSettingsForContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = BKLogTouchEvents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "removeSceneHostSettingsForContextID:%X", (uint8_t *)v7, 8u);
  }

  id v6 = +[NSNumber numberWithUnsignedInt:v3];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_sceneHostSettingsByContextID removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSceneHostSettings:(id)a3 forContextID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v7 = BKLogTouchEvents();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "setSceneHostSettingsForContextID:%X %{public}@", (uint8_t *)v9, 0x12u);
  }

  int v8 = +[NSNumber numberWithUnsignedInt:v4];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_sceneHostSettingsByContextID setObject:v6 forKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)hitTestCategoryForContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  sub_10004FA1C();
  uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    os_unfair_lock_lock(v4 + 4);
    id v6 = *(void **)&v5[6]._os_unfair_lock_opaque;
    if (v6)
    {
      unsigned int v7 = +[NSNumber numberWithUnsignedInt:v3];
      int v8 = [v6 objectForKey:v7];
      id v9 = [v8 integerValue];
    }
    else
    {
      id v9 = 0;
    }
    os_unfair_lock_unlock(v5 + 4);
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (id)addDisplayBlankingObserver:(id)a3
{
  id v4 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    id v6 = +[BSCompoundAssertion assertionWithIdentifier:@"backboardd.display-blanking"];
    unsigned int v7 = self->_observerAssertion;
    self->_observerAssertion = v6;

    observerAssertion = self->_observerAssertion;
  }
  int v8 = [(id)objc_opt_class() description];
  id v9 = [(BSCompoundAssertion *)observerAssertion acquireForReason:v8 withContext:v4];

  return v9;
}

- (BOOL)displayIsBlanked:(id)a3
{
  uint64_t v3 = sub_100010CB8(a3, (uint64_t)"BKDisplayIsDisplayBlanked");
  unsigned __int8 v4 = [v3 isBlanked];

  return v4;
}

- (BKDisplayController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayController;
  v2 = [(BKDisplayController *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    unsigned __int8 v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_sceneHostSettingsByContextID = v3->_lock_sceneHostSettingsByContextID;
    v3->_lock_sceneHostSettingsByContextID = v4;
  }
  return v3;
}

@end