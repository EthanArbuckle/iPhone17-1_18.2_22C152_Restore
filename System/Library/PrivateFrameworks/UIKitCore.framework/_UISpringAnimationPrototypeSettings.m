@interface _UISpringAnimationPrototypeSettings
+ (id)settingsControllerModule;
- (double)dampingRatio;
- (double)response;
- (id)springAnimationBehavior;
- (void)setDampingRatio:(double)a3;
- (void)setDefaultValues;
- (void)setResponse:(double)a3;
@end

@implementation _UISpringAnimationPrototypeSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UISpringAnimationPrototypeSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UISpringAnimationPrototypeSettings *)self setDampingRatio:1.0];
  [(_UISpringAnimationPrototypeSettings *)self setResponse:0.3];
}

+ (id)settingsControllerModule
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping Ratio" valueKeyPath:@"dampingRatio"];
  v4 = [v3 between:0.0 and:1.0];
  v5 = [v4 precision:3];
  v22[0] = v5;
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response" valueKeyPath:@"response"];
  v7 = [v6 between:0.0 and:10.0];
  v8 = [v7 precision:3];
  v22[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v10 = [v2 sectionWithRows:v9];

  v11 = (void *)MEMORY[0x1E4F94160];
  v21[0] = v10;
  v12 = (void *)MEMORY[0x1E4F940F8];
  v13 = [MEMORY[0x1E4F94170] action];
  v14 = [v12 rowWithTitle:@"Restore Defaults" action:v13];
  v20 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v16 = [v11 sectionWithRows:v15];
  v21[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v18 = [v11 moduleWithTitle:0 contents:v17];

  return v18;
}

- (id)springAnimationBehavior
{
  [(_UISpringAnimationPrototypeSettings *)self dampingRatio];
  double v4 = v3;
  [(_UISpringAnimationPrototypeSettings *)self response];
  return +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v4 response:v5];
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (void).cxx_destruct
{
}

@end