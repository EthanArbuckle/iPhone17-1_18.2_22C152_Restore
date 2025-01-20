@interface PKPeerPayment3DStore
+ (PKPeerPayment3DStore)sharedInstance;
- (BOOL)_shouldMonitorMotion;
- (PKPeerPayment3DStore)init;
- (id)_init;
- (id)material;
- (id)nodeForCharacter:(id)a3;
- (void)_setMonitorMotion:(BOOL)a3;
- (void)_updateMonitorMotion;
- (void)charactersForText:(id)a3 completion:(id)a4 synchronously:(BOOL)a5;
- (void)motionManager:(id)a3 didReceiveMotion:(id)a4;
- (void)newSceneWithCompletion:(id)a3 synchronously:(BOOL)a4;
- (void)relinquishScene:(id)a3;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidBecomeInactive:(id)a3;
@end

@implementation PKPeerPayment3DStore

+ (PKPeerPayment3DStore)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_store;

  return (PKPeerPayment3DStore *)v2;
}

uint64_t __38__PKPeerPayment3DStore_sharedInstance__block_invoke()
{
  sharedInstance_store = [[PKPeerPayment3DStore alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (PKPeerPayment3DStore)init
{
  return 0;
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPayment3DStore;
  v2 = [(PKPeerPayment3DStore *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v3->_cache;
    v3->_cache = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeScenes = v3->_activeScenes;
    v3->_activeScenes = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v10 = dispatch_queue_create("passkituifoundation.3dstore.loading", v9);
    sceneLoadingQueue = v3->_sceneLoadingQueue;
    v3->_sceneLoadingQueue = (OS_dispatch_queue *)v10;

    +[PKPeerPayment3DScene staticRollPitch];
    *(void *)v3->_lastRollPitch = v12;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
    *(_OWORD *)v3->_anon_30 = v13;
    *(_OWORD *)&v3->_anon_30[16] = v14;
    *(_OWORD *)&v3->_anon_30[32] = v15;
    *(_OWORD *)&v3->_anon_30[48] = v16;
    long long v17 = *(_OWORD *)&v3->_anon_30[16];
    *(_OWORD *)v3->_anon_80 = *(_OWORD *)v3->_anon_30;
    *(_OWORD *)&v3->_anon_80[16] = v17;
    long long v18 = *(_OWORD *)&v3->_anon_30[48];
    *(_OWORD *)&v3->_anon_80[32] = *(_OWORD *)&v3->_anon_30[32];
    *(_OWORD *)&v3->_anon_80[48] = v18;
    +[PKPeerPayment3DScene skewForRollPitch:*(double *)v3->_lastRollPitch];
    *(void *)v3->_skew = v19;
    *(void *)v3->_staticSkew = v19;
  }
  return v3;
}

- (void)newSceneWithCompletion:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(id, void *))a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke;
  v14[3] = &unk_2644F8D48;
  v14[4] = self;
  v7 = (void (**)(void))MEMORY[0x223C3D8D0](v14);
  v8 = v7;
  if (v4)
  {
    v9 = v7[2](v7);
    v6[2](v6, v9);
  }
  else
  {
    sceneLoadingQueue = self->_sceneLoadingQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_2;
    v11[3] = &unk_2644F8D70;
    v11[4] = self;
    uint64_t v12 = v7;
    long long v13 = v6;
    dispatch_async(sceneLoadingQueue, v11);

    v9 = v12;
  }
}

PKPeerPayment3DScene *__61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(PKPeerPayment3DScene);
  [(PKPeerPayment3DScene *)v2 setCurrentRollPitch:*(double *)(*(void *)(a1 + 32) + 120)];
  -[PKPeerPayment3DScene setCurrentRotationMatrix:](v2, "setCurrentRotationMatrix:", *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 64), *(double *)(*(void *)(a1 + 32) + 80), *(double *)(*(void *)(a1 + 32) + 96));
  [(PKPeerPayment3DScene *)v2 setCurrentSkew:*(double *)(*(void *)(a1 + 32) + 112)];

  return v2;
}

void __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_2(void *a1)
{
  v2 = (*(void (**)(void))(a1[5] + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  [*(id *)(a1[4] + 16) addObject:v2];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_3;
  block[3] = &unk_2644F8CF8;
  block[4] = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);
  [v2 setPaused:0];
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMonitorMotion];
}

- (void)relinquishScene:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_activeScenes removeObjectIdenticalTo:v5];

  BOOL v6 = [(PKPeerPayment3DStore *)self _shouldMonitorMotion];
  os_unfair_lock_unlock(p_lock);

  [(PKPeerPayment3DStore *)self _setMonitorMotion:v6];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v5 = a3;
  [v5 setPaused:0];
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_activeScenes indexOfObjectIdenticalTo:v5] == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_activeScenes addObject:v5];
  }
  BOOL v4 = [(PKPeerPayment3DStore *)self _shouldMonitorMotion];
  os_unfair_lock_unlock(&self->_lock);
  [(PKPeerPayment3DStore *)self _setMonitorMotion:v4];
}

- (void)sceneDidBecomeInactive:(id)a3
{
  id v4 = a3;
  [v4 setPaused:1];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_activeScenes removeObjectIdenticalTo:v4];

  BOOL v5 = [(PKPeerPayment3DStore *)self _shouldMonitorMotion];
  os_unfair_lock_unlock(&self->_lock);

  [(PKPeerPayment3DStore *)self _setMonitorMotion:v5];
}

- (BOOL)_shouldMonitorMotion
{
  return [(NSMutableArray *)self->_activeScenes count] != 0;
}

- (void)_updateMonitorMotion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(PKPeerPayment3DStore *)self _shouldMonitorMotion];
  os_unfair_lock_unlock(p_lock);

  [(PKPeerPayment3DStore *)self _setMonitorMotion:v4];
}

- (void)_setMonitorMotion:(BOOL)a3
{
  if (self->_monitorMotion != a3)
  {
    BOOL v3 = a3;
    self->_monitorMotion = a3;
    BOOL v5 = +[PKMotionManager sharedManager];
    id v6 = v5;
    if (v3) {
      [v5 registerClient:self];
    }
    else {
      [v5 unregisterClient:self];
    }
  }
}

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  BOOL v5 = objc_msgSend(a4, "attitude", a3);
  [v5 quaternion];
  float64_t v48 = v7;
  float64_t v49 = v6;
  long long v46 = v9;
  float64_t v47 = v8;

  _Q1.f64[0] = v47;
  *(void *)&_Q1.f64[1] = v46;
  _Q0.f64[0] = v49;
  _Q0.f64[1] = v48;
  _Q4 = veorq_s8((int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(_Q0), _Q1), (int8x16_t)xmmword_21EEE7820);
  _S3 = 1050015257;
  _S5 = 1064617455;
  _S6 = 0;
  __asm { FMLA            S0, S6, V4.S[2] }
  _V7.S[1] = 0x80000000;
  __asm
  {
    FMLA            S0, S7, V4.S[1]
    FMLA            S1, S5, V4.S[1]
  }
  _S6 = -1097468391;
  __asm
  {
    FMLA            S1, S6, V4.S[2]
    FMLA            S2, S5, V4.S[2]
    FMLA            S2, S3, V4.S[1]
    FMLA            S3, S5, V4.S[3]
    FMLA            S3, S7, V4.S[1]
    FMLA            S3, S7, V4.S[2]
  }
  uint64_t v56 = 0;
  int v57 = 1065353216;
  *(void *)&v60.x = &v56;
  *(void *)&v60.q[2] = 1;
  GLKQuaternionRotateVector3Array(v60, v27, v28);
  float v30 = *((float *)&v56 + 1);
  float v29 = *(float *)&v56;
  if (*(float *)&v56 > 0.6) {
    float v29 = 0.6;
  }
  if (*(float *)&v56 < -0.6) {
    float v29 = -0.6;
  }
  if (*((float *)&v56 + 1) > 0.6) {
    float v30 = 0.6;
  }
  if (*((float *)&v56 + 1) >= -0.6) {
    float v31 = v30;
  }
  else {
    float v31 = -0.6;
  }
  float v50 = asinf(v29);
  float v32 = asinf(v31);
  uint64_t v33 = *(void *)self->_lastRollPitch;
  *(float *)&double v34 = v50;
  if (vabds_f32(v50, *(float *)&v33) > 0.01 || vabds_f32(v32, *((float *)&v33 + 1)) > 0.01)
  {
    *((float *)&v34 + 1) = v32;
    double v51 = v34;
    *(double *)self->_lastRollPitch = v34;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:", v34, v46);
    *(_OWORD *)self->_anon_30 = v35;
    *(_OWORD *)&self->_anon_30[16] = v36;
    *(_OWORD *)&self->_anon_30[32] = v37;
    *(_OWORD *)&self->_anon_30[48] = v38;
    +[PKPeerPayment3DScene skewForRollPitch:v51];
    *(void *)self->_skew = v39;
    os_unfair_lock_lock(&self->_lock);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v40 = (void *)[(NSMutableArray *)self->_activeScenes copy];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          objc_msgSend(v45, "setCurrentRotationMatrix:", *(double *)self->_anon_30, *(double *)&self->_anon_30[16], *(double *)&self->_anon_30[32], *(double *)&self->_anon_30[48]);
          [v45 setCurrentSkew:*(double *)self->_skew];
          [v45 setCurrentRollPitch:v51];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v42);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)material
{
  v19[2] = *MEMORY[0x263EF8340];
  textMaterial = self->_textMaterial;
  if (!textMaterial)
  {
    BOOL v4 = [MEMORY[0x263F16A80] material];
    BOOL v5 = self->_textMaterial;
    self->_textMaterial = v4;

    double v6 = self->_textMaterial;
    v18[0] = *MEMORY[0x263F16BD8];
    double v7 = NSString;
    double v8 = PKPassKitUIFoundationBundle();
    long long v9 = [v8 URLForResource:@"TextShader" withExtension:@"txt"];
    dispatch_queue_t v10 = [v7 stringWithContentsOfURL:v9 encoding:1 error:0];
    v19[0] = v10;
    v18[1] = *MEMORY[0x263F16BE0];
    v11 = NSString;
    uint64_t v12 = PKPassKitUIFoundationBundle();
    long long v13 = [v12 URLForResource:@"TextGeometry" withExtension:@"txt"];
    long long v14 = [v11 stringWithContentsOfURL:v13 encoding:1 error:0];
    v19[1] = v14;
    long long v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(SCNMaterial *)v6 setShaderModifiers:v15];

    [(SCNMaterial *)self->_textMaterial setValue:&unk_26D086BC0 forKey:@"colorAmount"];
    textMaterial = self->_textMaterial;
  }
  long long v16 = (void *)[(SCNMaterial *)textMaterial copy];

  return v16;
}

- (void)charactersForText:(id)a3 completion:(id)a4 synchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_queue_t v10 = (void (**)(void, void))v9;
  if (v8 && v9)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke;
    void v19[3] = &unk_2644F8D98;
    v19[4] = self;
    uint64_t v11 = MEMORY[0x223C3D8D0](v19);
    uint64_t v12 = (void *)v11;
    if (v5)
    {
      long long v13 = (*(void (**)(uint64_t, id))(v11 + 16))(v11, v8);
      ((void (**)(void, void *))v10)[2](v10, v13);
    }
    else
    {
      sceneLoadingQueue = self->_sceneLoadingQueue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke_2;
      v15[3] = &unk_2644F8DC0;
      long long v17 = v10;
      id v18 = v12;
      id v16 = v8;
      dispatch_async(sceneLoadingQueue, v15);

      long long v13 = v17;
    }
  }
}

id __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v3 length])
  {
    for (unint64_t i = 0; [v3 length] > i; ++i)
    {
      double v7 = objc_msgSend(v3, "substringWithRange:", i, 1);
      id v8 = [v5 objectForKey:v7];
      if (!v8)
      {
        id v8 = [*(id *)(a1 + 32) nodeForCharacter:v7];
        if (!v8)
        {
          id v9 = 0;
          goto LABEL_7;
        }
        [v5 setObject:v8 forKey:v7];
      }
      id v9 = [v8 clone];
LABEL_7:
      dispatch_queue_t v10 = +[PKPeerPayment3DCharacter characterWithCharacter:v7 node:v9];
      [v4 addObject:v10];
    }
  }
  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

void __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[5];
  (*(void (**)(void, void))(a1[6] + 16))(a1[6], a1[4]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)nodeForCharacter:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = [(NSCache *)self->_cache objectForKey:v4];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [MEMORY[0x263EFF9D0] null];
    int v8 = PKEqualObjects();

    if (v8)
    {

      double v6 = 0;
LABEL_16:
      id v9 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    dispatch_queue_t v10 = NSString;
    uint64_t v11 = +[xF objectForKeyedSubscript:v4];
    if (v11)
    {
      uint64_t v12 = +[xF objectForKeyedSubscript:v4];
      long long v13 = [v10 stringWithFormat:@"Character%@", v12];
    }
    else
    {
      long long v13 = [v10 stringWithFormat:@"Character%@", v4];
    }

    long long v14 = PKPassKitUIFoundationBundle();
    long long v15 = [v14 URLForResource:v13 withExtension:@"scn"];

    if (v15)
    {
      id v16 = [MEMORY[0x263F16AD8] sceneWithURL:v15 options:0 error:0];
      long long v17 = [v16 rootNode];

      id v18 = [v17 childNodes];
      double v6 = [v18 objectAtIndexedSubscript:0];

      [v6 setName:v4];
      [(NSCache *)self->_cache setObject:v6 forKey:v4];
    }
    else
    {
      cache = self->_cache;
      v20 = [MEMORY[0x263EFF9D0] null];
      [(NSCache *)cache setObject:v20 forKey:v4];

      objc_super v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v4;
        _os_log_impl(&dword_21EEBD000, v21, OS_LOG_TYPE_DEFAULT, "Missing character for %{public}@", buf, 0xCu);
      }

      double v6 = 0;
    }

    if (!v6) {
      goto LABEL_16;
    }
  }
  id v9 = [v6 clone];
  v22 = [v9 geometry];
  v23 = (void *)[v22 copy];
  [v9 setGeometry:v23];

LABEL_17:
LABEL_18:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneLoadingQueue, 0);
  objc_storeStrong((id *)&self->_textMaterial, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_activeScenes, 0);
}

@end