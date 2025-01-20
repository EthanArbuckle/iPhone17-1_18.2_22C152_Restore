@interface UIBridgedAnimatable
- (BOOL)isFinished;
- (CALayer)layer;
- (CAPresentationModifier)presentationModifier;
- (NSString)key;
- (UIBridgedAnimatable)initWithLayer:(id)a3 key:(id)a4 fromValue:(id)a5 toValue:(id)a6 completion:(id)a7;
- (UIVectorOperatable)fromValue;
- (UIVectorOperatable)toValue;
- (id)completion;
- (void)animationDidFinish:(BOOL)a3;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setFromValue:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLayer:(id)a3;
- (void)setPresentationModifier:(id)a3;
- (void)setToValue:(id)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIBridgedAnimatable

- (UIBridgedAnimatable)initWithLayer:(id)a3 key:(id)a4 fromValue:(id)a5 toValue:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)UIBridgedAnimatable;
  v18 = [(UIBridgedAnimatable *)&v31 init];
  v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_layer, a3);
    objc_storeStrong((id *)&v19->_key, a4);
    uint64_t v20 = [v15 copy];
    fromValue = v19->_fromValue;
    v19->_fromValue = (UIVectorOperatable *)v20;

    uint64_t v22 = [v16 copy];
    toValue = v19->_toValue;
    v19->_toValue = (UIVectorOperatable *)v22;

    v24 = _Block_copy(v17);
    id completion = v19->_completion;
    v19->_id completion = v24;

    id v26 = objc_alloc(MEMORY[0x1E4F39C48]);
    v27 = [(UIVectorOperatable *)v19->_fromValue getValue];
    uint64_t v28 = [v26 initWithKeyPath:v14 initialValue:v27 additive:0];
    presentationModifier = v19->_presentationModifier;
    v19->_presentationModifier = (CAPresentationModifier *)v28;

    v19->_isFinished = 0;
    [(CALayer *)v19->_layer addPresentationModifier:v19->_presentationModifier];
  }

  return v19;
}

- (void)dealloc
{
  if (!self->_isFinished)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"UIBridgedAnimatable.m", 57, @"UIBridgedAnimatable was deallocated before animationDidFinish: (%@)", self->_key object file lineNumber description];
  }
  [(CALayer *)self->_layer removePresentationModifier:self->_presentationModifier];
  v5.receiver = self;
  v5.super_class = (Class)UIBridgedAnimatable;
  [(UIBridgedAnimatable *)&v5 dealloc];
}

- (void)updateWithProgress:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(UIBridgedAnimatable *)self toValue];
  id v17 = (id)[v6 copy];

  v7 = [(UIBridgedAnimatable *)self fromValue];
  v8 = (void *)[v7 copy];
  v9 = [v8 multiplyByScalar:-1.0];
  id v10 = (id)[v17 addVector:v9];

  id v11 = (id)[v17 multiplyByScalar:a3];
  v12 = [(UIBridgedAnimatable *)self fromValue];
  id v13 = (void *)[v12 copy];
  id v14 = (id)[v17 addVector:v13];

  id v15 = [v17 getValue];
  id v16 = [(UIBridgedAnimatable *)self presentationModifier];
  [v16 setValue:v15];

  os_unfair_lock_unlock(p_lock);
}

- (void)animationDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (![(UIBridgedAnimatable *)self isFinished])
  {
    [(UIBridgedAnimatable *)self setIsFinished:1];
    v6 = [(UIBridgedAnimatable *)self completion];
    v6[2](v6, v3);

    [(UIBridgedAnimatable *)self setCompletion:0];
  }
  os_unfair_lock_unlock(p_lock);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (UIVectorOperatable)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
}

- (UIVectorOperatable)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
}

- (CAPresentationModifier)presentationModifier
{
  return self->_presentationModifier;
}

- (void)setPresentationModifier:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_presentationModifier, 0);
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end