@interface STUIStatusBarCycleLayerAnimation
+ (id)cycleAnimationWithLayer:(id)a3 animation:(id)a4 key:(id)a5;
- (CAAnimation)animation;
- (CAAnimation)originalAnimation;
- (CALayer)layer;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)key;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAnimation:(id)a3;
- (void)setKey:(id)a3;
- (void)setLayer:(id)a3;
- (void)setOriginalAnimation:(id)a3;
@end

@implementation STUIStatusBarCycleLayerAnimation

+ (id)cycleAnimationWithLayer:(id)a3 animation:(id)a4 key:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  v12 = [MEMORY[0x1E4F39B38] animation];
  v16[0] = v9;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v12 setAnimations:v13];

  [v9 duration];
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setAutoreverses:", objc_msgSend(v9, "autoreverses"));
  [v11 setLayer:v10];

  [v11 setAnimation:v12];
  [v11 setOriginalAnimation:v9];
  v14 = [NSString stringWithFormat:@"%@-%p", v8, v11];

  [v11 setKey:v14];
  return v11;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarCycleLayerAnimation *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarCycleLayerAnimation *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarCycleLayerAnimation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarCycleLayerAnimation *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarCycleLayerAnimation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarCycleLayerAnimation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(STUIStatusBarCycleLayerAnimation *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__STUIStatusBarCycleLayerAnimation__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __84__STUIStatusBarCycleLayerAnimation__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) key];
  [v2 appendString:v3 withName:@"key"];

  BOOL v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) animation];
  id v5 = (id)[v4 appendObject:v6 withName:@"animation"];
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
}

- (CAAnimation)originalAnimation
{
  return self->_originalAnimation;
}

- (void)setOriginalAnimation:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_originalAnimation, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end