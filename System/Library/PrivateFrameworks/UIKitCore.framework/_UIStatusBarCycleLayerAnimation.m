@interface _UIStatusBarCycleLayerAnimation
+ (id)cycleAnimationWithLayer:(id)a3 animation:(id)a4 key:(id)a5;
- (CAAnimation)animation;
- (CAAnimation)originalAnimation;
- (CALayer)layer;
- (NSString)key;
- (id)description;
- (void)setAnimation:(id)a3;
- (void)setKey:(id)a3;
- (void)setLayer:(id)a3;
- (void)setOriginalAnimation:(id)a3;
@end

@implementation _UIStatusBarCycleLayerAnimation

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

- (id)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_layer);
  v8[0] = v3;
  v4 = NSStringFromSelector("key");
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return v6;
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