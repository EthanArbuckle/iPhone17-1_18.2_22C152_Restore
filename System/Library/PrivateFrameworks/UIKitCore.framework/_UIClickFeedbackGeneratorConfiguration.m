@interface _UIClickFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
- (_UIFeedbackDiscretePlayable)clickDownAudioFeedback;
- (_UIFeedbackDiscretePlayable)clickDownFeedback;
- (_UIFeedbackDiscretePlayable)clickDownPattern;
- (_UIFeedbackDiscretePlayable)clickUpAudioFeedback;
- (_UIFeedbackDiscretePlayable)clickUpFeedback;
- (_UIFeedbackDiscretePlayable)clickUpPattern;
- (id)feedbackKeyPaths;
- (int64_t)requiredSupportLevel;
- (void)setClickDownAudioFeedback:(id)a3;
- (void)setClickDownFeedback:(id)a3;
- (void)setClickUpAudioFeedback:(id)a3;
- (void)setClickUpFeedback:(id)a3;
- (void)setclickDownFeedback:(id)a3;
@end

@implementation _UIClickFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (_UIFeedbackDiscretePlayable)clickDownPattern
{
  v3 = +[_UIFeedbackPattern feedbackPattern];
  [v3 _setCategory:0x1ED11D500];
  v4 = [(_UIClickFeedbackGeneratorConfiguration *)self clickDownFeedback];

  if (v4)
  {
    v5 = [(_UIClickFeedbackGeneratorConfiguration *)self clickDownFeedback];
    [v3 addFeedback:v5 atTime:0.0];
  }
  v6 = [(_UIClickFeedbackGeneratorConfiguration *)self clickDownAudioFeedback];

  if (v6)
  {
    v7 = [(_UIClickFeedbackGeneratorConfiguration *)self clickDownAudioFeedback];
    [v3 addFeedback:v7 atTime:0.0];
  }
  return (_UIFeedbackDiscretePlayable *)v3;
}

- (_UIFeedbackDiscretePlayable)clickUpPattern
{
  v3 = +[_UIFeedbackPattern feedbackPattern];
  [v3 _setCategory:0x1ED11D500];
  v4 = [(_UIClickFeedbackGeneratorConfiguration *)self clickUpFeedback];

  if (v4)
  {
    v5 = [(_UIClickFeedbackGeneratorConfiguration *)self clickUpFeedback];
    [v3 addFeedback:v5 atTime:0.0];
  }
  v6 = [(_UIClickFeedbackGeneratorConfiguration *)self clickUpAudioFeedback];

  if (v6)
  {
    v7 = [(_UIClickFeedbackGeneratorConfiguration *)self clickUpAudioFeedback];
    [v3 addFeedback:v7 atTime:0.0];
  }
  return (_UIFeedbackDiscretePlayable *)v3;
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_187];
}

- (id)feedbackKeyPaths
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIClickFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorUserInteractionDrivenConfiguration *)&v8 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_clickDownPattern);
  v9[0] = v3;
  v4 = NSStringFromSelector(sel_clickUpPattern);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (void)setclickDownFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickDownFeedback = self->_clickDownFeedback;
  self->_clickDownFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)clickDownFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickDownFeedback = self->_clickDownFeedback;
  return clickDownFeedback;
}

- (void)setClickDownAudioFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickDownAudioFeedback = self->_clickDownAudioFeedback;
  self->_clickDownAudioFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)clickDownAudioFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickDownAudioFeedback = self->_clickDownAudioFeedback;
  return clickDownAudioFeedback;
}

- (void)setClickUpFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickUpFeedback = self->_clickUpFeedback;
  self->_clickUpFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)clickUpFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickUpFeedback = self->_clickUpFeedback;
  return clickUpFeedback;
}

- (void)setClickUpAudioFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickUpAudioFeedback = self->_clickUpAudioFeedback;
  self->_clickUpAudioFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)clickUpAudioFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  clickUpAudioFeedback = self->_clickUpAudioFeedback;
  return clickUpAudioFeedback;
}

- (void)setClickDownFeedback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickUpAudioFeedback, 0);
  objc_storeStrong((id *)&self->_clickUpFeedback, 0);
  objc_storeStrong((id *)&self->_clickDownAudioFeedback, 0);
  objc_storeStrong((id *)&self->_clickDownFeedback, 0);
}

@end