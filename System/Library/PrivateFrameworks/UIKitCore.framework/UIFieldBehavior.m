@interface UIFieldBehavior
+ (BOOL)_isPrimitiveBehavior;
+ (UIFieldBehavior)dragField;
+ (UIFieldBehavior)electricField;
+ (UIFieldBehavior)fieldWithEvaluationBlock:(void *)block;
+ (UIFieldBehavior)linearGravityFieldWithVector:(CGVector)direction;
+ (UIFieldBehavior)magneticField;
+ (UIFieldBehavior)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (UIFieldBehavior)radialGravityFieldWithPosition:(CGPoint)position;
+ (UIFieldBehavior)springField;
+ (UIFieldBehavior)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (UIFieldBehavior)velocityFieldWithVector:(CGVector)direction;
+ (UIFieldBehavior)vortexField;
- (BOOL)isEnabled;
- (CGFloat)animationSpeed;
- (CGFloat)falloff;
- (CGFloat)minimumRadius;
- (CGFloat)smoothness;
- (CGFloat)strength;
- (CGPoint)position;
- (CGVector)direction;
- (NSArray)items;
- (PKPhysicsField)_field;
- (UIFieldBehavior)init;
- (UIRegion)region;
- (id)_initWithField:(id)a3;
- (void)_addFieldItem:(id)a3;
- (void)_associate;
- (void)_changedParameter;
- (void)_dissociate;
- (void)addItem:(id)item;
- (void)removeItem:(id)item;
- (void)setAnimationSpeed:(CGFloat)animationSpeed;
- (void)setDirection:(CGVector)direction;
- (void)setEnabled:(BOOL)a3;
- (void)setFalloff:(CGFloat)falloff;
- (void)setMinimumRadius:(CGFloat)minimumRadius;
- (void)setPosition:(CGPoint)position;
- (void)setRegion:(UIRegion *)region;
- (void)setSmoothness:(CGFloat)smoothness;
- (void)setStrength:(CGFloat)strength;
@end

@implementation UIFieldBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

+ (UIFieldBehavior)dragField
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F91390] field];
  v4 = (void *)[v2 _initWithField:v3];

  return (UIFieldBehavior *)v4;
}

+ (UIFieldBehavior)vortexField
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F913D8] field];
  v4 = (void *)[v2 _initWithField:v3];

  return (UIFieldBehavior *)v4;
}

+ (UIFieldBehavior)radialGravityFieldWithPosition:(CGPoint)position
{
  double y = position.y;
  double x = position.x;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F913B8] field];
  v7 = (void *)[v5 _initWithField:v6];

  objc_msgSend(v7, "setPosition:", x, y);
  return (UIFieldBehavior *)v7;
}

+ (UIFieldBehavior)linearGravityFieldWithVector:(CGVector)direction
{
  ddouble y = direction.dy;
  ddouble x = direction.dx;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F913A0] field];
  v7 = (void *)[v5 _initWithField:v6];

  objc_msgSend(v7, "setDirection:", dx, dy);
  return (UIFieldBehavior *)v7;
}

+ (UIFieldBehavior)velocityFieldWithVector:(CGVector)direction
{
  ddouble y = direction.dy;
  ddouble x = direction.dx;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F913D0] fieldWithGrid:0];
  v7 = (void *)[v5 _initWithField:v6];

  objc_msgSend(v7, "setDirection:", dx, dy);
  return (UIFieldBehavior *)v7;
}

+ (UIFieldBehavior)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  id v6 = objc_alloc((Class)a1);
  v7 = [MEMORY[0x1E4F913B0] field];
  v8 = (unsigned char *)[v6 _initWithField:v7];

  v8[56] |= 1u;
  [v8 setSmoothness:smoothness];
  [v8 setAnimationSpeed:speed];
  return (UIFieldBehavior *)v8;
}

+ (UIFieldBehavior)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  id v6 = objc_alloc((Class)a1);
  v7 = [MEMORY[0x1E4F913C8] field];
  v8 = (unsigned char *)[v6 _initWithField:v7];

  v8[56] |= 1u;
  [v8 setSmoothness:smoothness];
  [v8 setAnimationSpeed:speed];
  return (UIFieldBehavior *)v8;
}

+ (UIFieldBehavior)springField
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F913C0] field];
  v4 = (void *)[v2 _initWithField:v3];

  return (UIFieldBehavior *)v4;
}

+ (UIFieldBehavior)electricField
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F91398] field];
  v4 = (void *)[v2 _initWithField:v3];

  return (UIFieldBehavior *)v4;
}

+ (UIFieldBehavior)magneticField
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F913A8] field];
  v4 = (void *)[v2 _initWithField:v3];

  return (UIFieldBehavior *)v4;
}

+ (UIFieldBehavior)fieldWithEvaluationBlock:(void *)block
{
  id v5 = block;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UIFieldBehavior.mm", 114, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v16 = 0;
  v17 = (id *)&v16;
  uint64_t v18 = 0x3042000000;
  v19 = __Block_byref_object_copy__75;
  v20 = __Block_byref_object_dispose__75;
  id v21 = 0;
  id v6 = objc_alloc((Class)a1);
  v7 = (void *)MEMORY[0x1E4F91388];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__UIFieldBehavior_fieldWithEvaluationBlock___block_invoke;
  v13[3] = &unk_1E52EC828;
  v15 = &v16;
  id v8 = v5;
  id v14 = v8;
  v9 = [v7 fieldWithCustomBatchBlock:v13];
  v10 = (void *)[v6 _initWithField:v9];

  objc_storeWeak(v17 + 5, v10);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&v21);

  return (UIFieldBehavior *)v10;
}

void __44__UIFieldBehavior_fieldWithEvaluationBlock___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (a2 >= 1 && WeakRetained)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = a2;
    do
    {
      v9 = (float *)(*(void *)a3 + v6);
      float v11 = *v9;
      float v10 = v9[1];
      v12 = (float *)(*(void *)(a3 + 16) + v6);
      float v13 = *v12;
      float v14 = v12[1];
      uint64_t v15 = *(void *)(a1 + 32);
      PKGet_PTM_RATIO();
      float v17 = (*(double (**)(uint64_t, id, double, double, double, double, double, double, double))(v15 + 16))(v15, WeakRetained, v11 * v16, v10 * v16, v13, v14, *(float *)(*(void *)(a3 + 32) + 4 * v7), *(float *)(*(void *)(a3 + 48) + 4 * v7), *(double *)(a3 + 64));
      *(float *)&double v18 = v18;
      uint64_t v19 = *(void *)(a3 + 72) + 4 * *(void *)(a3 + 80) * v7;
      *(float *)uint64_t v19 = v17;
      *(_DWORD *)(v19 + 4) = LODWORD(v18);
      *(_DWORD *)(v19 + 8) = 0;
      ++v7;
      v6 += 12;
    }
    while (v8 != v7);
  }
}

- (id)_initWithField:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    float v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIFieldBehavior.mm", 139, @"Invalid parameter not satisfying: %@", @"field" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)UIFieldBehavior;
  uint64_t v7 = [(UIDynamicBehavior *)&v15 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = v7;
    id v10 = v6;
    objc_storeStrong(v9 + 6, a3);
    float v11 = +[UIRegion infiniteRegion];
    [v9 setRegion:v11];

    [v10 setScale:0.00781250185];
    LODWORD(v12) = 1.0;
    [v10 setStrength:v12];
  }
  return v8;
}

- (UIFieldBehavior)init
{
  return 0;
}

- (void)_addFieldItem:(id)a3
{
  id v6 = a3;
  v4 = [(UIDynamicBehavior *)self dynamicAnimator];
  id v5 = [v4 _registerBodyForItem:v6];

  [v5 setUsesPreciseCollisionDetection:1];
  [v5 setResting:0];
  objc_msgSend(v5, "setFieldBitMask:", objc_msgSend(v5, "fieldBitMask") | -[PKPhysicsField categoryBitMask](self->_field, "categoryBitMask"));
}

- (PKPhysicsField)_field
{
  return self->_field;
}

- (void)_changedParameter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(UIDynamicBehavior *)self dynamicAnimator];
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(UIFieldBehavior *)self items];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [v3 _bodyForItem:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
          [v8 setResting:0];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [v3 _tickle];
  }
}

- (void)addItem:(id)item
{
  id v6 = item;
  v4 = [(UIDynamicBehavior *)self _items];
  if (([v4 containsObject:v6] & 1) == 0)
  {
    [(UIDynamicBehavior *)self _addItem:v6];
    uint64_t v5 = [(UIDynamicBehavior *)self dynamicAnimator];
    if (v5)
    {
      [(UIFieldBehavior *)self _addFieldItem:v6];
      [v5 _tickle];
    }
  }
}

- (void)removeItem:(id)item
{
  id v4 = item;
  uint64_t v5 = [(UIDynamicBehavior *)self _items];
  if ([v5 containsObject:v4])
  {
    id v6 = [(UIDynamicBehavior *)self dynamicAnimator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__UIFieldBehavior_removeItem___block_invoke;
    v7[3] = &unk_1E52EC850;
    v7[4] = self;
    [v6 _unregisterBodyForItem:v4 action:v7];
    [v6 _tickle];
    [(UIDynamicBehavior *)self _removeItem:v4];
  }
}

void __30__UIFieldBehavior_removeItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setFieldBitMask:", objc_msgSend(v3, "fieldBitMask") & ~objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "categoryBitMask"));
  [v3 setResting:0];
}

- (NSArray)items
{
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [(UIDynamicBehavior *)self _items];
  id v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (void)setPosition:(CGPoint)position
{
  CGFloat x = position.x;
  CGFloat y = position.y;
  PKGet_INV_PTM_RATIO();
  v4.f64[0] = x;
  v4.f64[1] = y;
  [(PKPhysicsField *)self->_field setPosition:COERCE_DOUBLE(vmul_n_f32(vcvt_f32_f64(v4), v5))];
  [(UIFieldBehavior *)self _changedParameter];
}

- (CGPoint)position
{
  [(PKPhysicsField *)self->_field position];
  float32x2_t v6 = v2;
  PKGet_PTM_RATIO();
  float64x2_t v4 = vmulq_n_f64(vcvtq_f64_f32(v6), v3);
  double v5 = v4.f64[1];
  result.CGFloat x = v4.f64[0];
  result.CGFloat y = v5;
  return result;
}

- (void)setRegion:(UIRegion *)region
{
  float32x2_t v6 = region;
  objc_storeStrong((id *)&self->_region, region);
  double v5 = [(UIRegion *)v6 _region];
  [(PKPhysicsField *)self->_field setRegion:v5];

  [(UIFieldBehavior *)self _changedParameter];
}

- (void)setStrength:(CGFloat)strength
{
  *(float *)&strength = strength;
  [(PKPhysicsField *)self->_field setStrength:strength];
  [(UIFieldBehavior *)self _changedParameter];
}

- (CGFloat)strength
{
  [(PKPhysicsField *)self->_field strength];
  return v2;
}

- (void)setFalloff:(CGFloat)falloff
{
  *(float *)&falloff = falloff;
  [(PKPhysicsField *)self->_field setFalloff:falloff];
  [(UIFieldBehavior *)self _changedParameter];
}

- (CGFloat)falloff
{
  [(PKPhysicsField *)self->_field falloff];
  return v2;
}

- (void)setMinimumRadius:(CGFloat)minimumRadius
{
  *(float *)&minimumRadius = minimumRadius;
  [(PKPhysicsField *)self->_field setMinimumRadius:minimumRadius];
  [(UIFieldBehavior *)self _changedParameter];
}

- (CGFloat)minimumRadius
{
  [(PKPhysicsField *)self->_field minimumRadius];
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  [(PKPhysicsField *)self->_field setEnabled:a3];
  [(UIFieldBehavior *)self _changedParameter];
}

- (BOOL)isEnabled
{
  return [(PKPhysicsField *)self->_field isEnabled];
}

- (void)setDirection:(CGVector)direction
{
  *(float *)&unsigned int v4 = direction.dx;
  *(float *)&unsigned int v5 = direction.dy;
  [(PKPhysicsField *)self->_field setDirection:COERCE_DOUBLE(__PAIR64__(v5, v4))];
  [(UIFieldBehavior *)self _changedParameter];
}

- (CGVector)direction
{
  [(PKPhysicsField *)self->_field direction];
  float64x2_t v3 = vcvtq_f64_f32(v2);
  double v4 = v3.f64[1];
  result.dCGFloat x = v3.f64[0];
  result.dCGFloat y = v4;
  return result;
}

- (void)setSmoothness:(CGFloat)smoothness
{
  if (*(unsigned char *)&self->_fieldFlags)
  {
    *(float *)&smoothness = smoothness;
    [(PKPhysicsField *)self->_field setSmoothness:smoothness];
    [(UIFieldBehavior *)self _changedParameter];
  }
}

- (CGFloat)smoothness
{
  CGFloat result = 0.0;
  if (*(unsigned char *)&self->_fieldFlags)
  {
    [(PKPhysicsField *)self->_field smoothness];
    return v3;
  }
  return result;
}

- (void)setAnimationSpeed:(CGFloat)animationSpeed
{
  if (*(unsigned char *)&self->_fieldFlags)
  {
    *(float *)&animationSpeed = animationSpeed;
    [(PKPhysicsField *)self->_field setAnimationSpeed:animationSpeed];
    [(UIFieldBehavior *)self _changedParameter];
  }
}

- (CGFloat)animationSpeed
{
  CGFloat result = 0.0;
  if (*(unsigned char *)&self->_fieldFlags)
  {
    [(PKPhysicsField *)self->_field animationSpeed];
    return v3;
  }
  return result;
}

- (void)_associate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  float v3 = [(UIDynamicBehavior *)self dynamicAnimator];
  double v4 = [v3 _world];
  [v4 addField:self->_field];

  [(UIDynamicBehavior *)self _items];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[UIFieldBehavior _addFieldItem:](self, "_addFieldItem:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_dissociate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  float v3 = [(UIDynamicBehavior *)self dynamicAnimator];
  double v4 = [v3 _world];
  [v4 removeField:self->_field];

  int v5 = [(PKPhysicsField *)self->_field categoryBitMask];
  [(UIDynamicBehavior *)self _items];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __30__UIFieldBehavior__dissociate__block_invoke;
        v11[3] = &__block_descriptor_36_e31_v16__0__PKExtendedPhysicsBody_8l;
        int v12 = v5;
        [v3 _unregisterBodyForItem:v10 action:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __30__UIFieldBehavior__dissociate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setFieldBitMask:", objc_msgSend(v3, "fieldBitMask") & ~*(_DWORD *)(a1 + 32));
}

- (UIRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end