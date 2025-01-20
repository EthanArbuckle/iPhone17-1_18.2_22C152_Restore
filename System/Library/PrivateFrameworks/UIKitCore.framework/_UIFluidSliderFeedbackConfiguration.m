@interface _UIFluidSliderFeedbackConfiguration
+ (id)defaultConfiguration;
- (NSString)hidDetentFeedbackPatternName;
- (NSString)hidEdgeFeedbackPatternName;
- (_UIFeedbackDiscretePlayable)detentFeedback;
- (_UIFeedbackDiscretePlayable)maxEdgeFeedback;
- (_UIFeedbackDiscretePlayable)minEdgeFeedback;
- (_UIFeedbackDiscretePlayable)selectionFeedback;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)hidFeedbackPatternNameKeyPaths;
- (void)setHidDetentFeedbackPatternName:(id)a3;
- (void)setHidEdgeFeedbackPatternName:(id)a3;
- (void)setdetentFeedback:(id)a3;
- (void)setmaxEdgeFeedback:(id)a3;
- (void)setminEdgeFeedback:(id)a3;
- (void)setselectionFeedback:(id)a3;
@end

@implementation _UIFluidSliderFeedbackConfiguration

+ (id)defaultConfiguration
{
  v2 = [a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_516];
  [v2 setRequiredPeripheralSupportLevel:1];
  return v2;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIFluidSliderFeedbackConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v8 hidFeedbackPatternNameKeyPaths];
  v3 = NSStringFromSelector(sel_hidEdgeFeedbackPatternName);
  v9[0] = v3;
  v4 = NSStringFromSelector(sel_hidDetentFeedbackPatternName);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(_UIFluidSliderFeedbackConfiguration *)self detentFeedback];
  if ([v8 isEqual:v9])
  {

LABEL_4:
    uint64_t v12 = [(_UIFluidSliderFeedbackConfiguration *)self hidDetentFeedbackPatternName];
    goto LABEL_6;
  }
  v10 = [(_UIFluidSliderFeedbackConfiguration *)self selectionFeedback];
  int v11 = [v8 isEqual:v10];

  if (v11) {
    goto LABEL_4;
  }
  uint64_t v12 = [(_UIFluidSliderFeedbackConfiguration *)self hidEdgeFeedbackPatternName];
LABEL_6:
  v13 = (void *)v12;
  v14 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:v12 deviceType:a4 senderID:a5];

  return v14;
}

- (void)setmaxEdgeFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  maxEdgeFeedback = self->_maxEdgeFeedback;
  self->_maxEdgeFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)maxEdgeFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  maxEdgeFeedback = self->_maxEdgeFeedback;
  return maxEdgeFeedback;
}

- (void)setdetentFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  detentFeedback = self->_detentFeedback;
  self->_detentFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)detentFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  detentFeedback = self->_detentFeedback;
  return detentFeedback;
}

- (void)setselectionFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  selectionFeedback = self->_selectionFeedback;
  self->_selectionFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)selectionFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  selectionFeedback = self->_selectionFeedback;
  return selectionFeedback;
}

- (void)setminEdgeFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  minEdgeFeedback = self->_minEdgeFeedback;
  self->_minEdgeFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)minEdgeFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  minEdgeFeedback = self->_minEdgeFeedback;
  return minEdgeFeedback;
}

- (NSString)hidEdgeFeedbackPatternName
{
  return self->_hidEdgeFeedbackPatternName;
}

- (void)setHidEdgeFeedbackPatternName:(id)a3
{
}

- (NSString)hidDetentFeedbackPatternName
{
  return self->_hidDetentFeedbackPatternName;
}

- (void)setHidDetentFeedbackPatternName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidDetentFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_hidEdgeFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_minEdgeFeedback, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);
  objc_storeStrong((id *)&self->_detentFeedback, 0);
  objc_storeStrong((id *)&self->_maxEdgeFeedback, 0);
}

@end