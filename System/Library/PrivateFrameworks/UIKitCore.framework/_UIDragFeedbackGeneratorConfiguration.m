@interface _UIDragFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSString)hidTargetUpdatedFeedbackPatternName;
- (_UIFeedbackContinuousPlayable)interactionProgressingFeedback;
- (_UIFeedbackDiscretePlayable)interactionUpdatedFeedback;
- (_UIFeedbackDiscretePlayable)targetUpdatedFeedback;
- (double)progressingFeedbackDelay;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)feedbackKeyPaths;
- (id)hidFeedbackPatternNameKeyPaths;
- (int64_t)requiredPeripheralSupportLevel;
- (int64_t)requiredSupportLevel;
- (void)setHidTargetUpdatedFeedbackPatternName:(id)a3;
- (void)setInteractionProgressingFeedback:(id)a3;
- (void)setInteractionUpdatedFeedback:(id)a3;
- (void)setProgressingFeedbackDelay:(double)a3;
- (void)setTargetUpdatedFeedback:(id)a3;
@end

@implementation _UIDragFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_188];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  id result = [(_UIFeedbackGeneratorConfiguration *)&v5 copyWithZone:a3];
  *((void *)result + 17) = *(void *)&self->_progressingFeedbackDelay;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  if ([(_UIFeedbackGeneratorConfiguration *)&v7 isEqual:v4]) {
    BOOL v5 = self->_progressingFeedbackDelay == v4[17];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)feedbackKeyPaths
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorUserInteractionDrivenConfiguration *)&v9 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_interactionProgressingFeedback);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_interactionUpdatedFeedback);
  v10[1] = v4;
  BOOL v5 = NSStringFromSelector(sel_targetUpdatedFeedback);
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  objc_super v7 = [v2 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 hidFeedbackPatternNameKeyPaths];
  v3 = NSStringFromSelector(sel_hidTargetUpdatedFeedbackPatternName);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  objc_super v9 = [(_UIDragFeedbackGeneratorConfiguration *)self targetUpdatedFeedback];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    v11 = [(_UIDragFeedbackGeneratorConfiguration *)self hidTargetUpdatedFeedbackPatternName];
    v12 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:v11 deviceType:a4 senderID:a5];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
    v12 = [(_UIFeedbackGeneratorConfiguration *)&v14 _alternateFeedback:v8 forDevice:a4 senderID:a5];
  }

  return v12;
}

- (void)setInteractionProgressingFeedback:(id)a3
{
  v4 = (_UIFeedbackContinuousPlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionProgressingFeedback = self->_interactionProgressingFeedback;
  self->_interactionProgressingFeedback = v4;
}

- (_UIFeedbackContinuousPlayable)interactionProgressingFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionProgressingFeedback = self->_interactionProgressingFeedback;
  return interactionProgressingFeedback;
}

- (void)setInteractionUpdatedFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionUpdatedFeedback = self->_interactionUpdatedFeedback;
  self->_interactionUpdatedFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)interactionUpdatedFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionUpdatedFeedback = self->_interactionUpdatedFeedback;
  return interactionUpdatedFeedback;
}

- (void)setTargetUpdatedFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  targetUpdatedFeedback = self->_targetUpdatedFeedback;
  self->_targetUpdatedFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)targetUpdatedFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  targetUpdatedFeedback = self->_targetUpdatedFeedback;
  return targetUpdatedFeedback;
}

- (void)setProgressingFeedbackDelay:(double)a3
{
  self->_progressingFeedbackDelay = a3;
}

- (double)progressingFeedbackDelay
{
  return self->_progressingFeedbackDelay;
}

- (NSString)hidTargetUpdatedFeedbackPatternName
{
  return self->_hidTargetUpdatedFeedbackPatternName;
}

- (void)setHidTargetUpdatedFeedbackPatternName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidTargetUpdatedFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_targetUpdatedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionUpdatedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionProgressingFeedback, 0);
}

@end