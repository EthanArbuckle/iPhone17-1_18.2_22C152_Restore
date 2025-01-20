@interface _UIPreviewInteractionForceLevelClassifier
- (BOOL)wantsUnclampedForceValues;
- (_UIPreviewInteractionForceLevelClassifier)init;
- (id)transformerFromTouchForceMessageToProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4;
- (void)observeTouchWithForceValue:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5;
- (void)reset;
@end

@implementation _UIPreviewInteractionForceLevelClassifier

- (_UIPreviewInteractionForceLevelClassifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionForceLevelClassifier;
  v2 = [(_UIForceLevelClassifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_UIPreviewInteractionForceLevelClassifier *)v2 reset];
    v4 = v3;
  }

  return v3;
}

- (void)observeTouchWithForceValue:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  stateRecognizer = self->_stateRecognizer;
  if (!stateRecognizer)
  {
    v11 = objc_alloc_init(_UIPreviewInteractionStateRecognizer);
    v12 = self->_stateRecognizer;
    self->_stateRecognizer = v11;

    stateRecognizer = self->_stateRecognizer;
  }
  -[_UIPreviewInteractionStateRecognizer evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:](stateRecognizer, "evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:", a3, a4, x, y);
  int64_t v13 = [(_UIPreviewInteractionStateRecognizer *)self->_stateRecognizer currentState];
  if ((unint64_t)(v13 - 1) >= 3) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = v13;
  }
  [(_UIForceLevelClassifier *)self setCurrentForceLevel:v14];
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionForceLevelClassifier;
  [(_UIForceLevelClassifier *)&v4 reset];
  stateRecognizer = self->_stateRecognizer;
  self->_stateRecognizer = 0;

  [(_UIForceLevelClassifier *)self setCurrentForceLevel:0];
}

- (BOOL)wantsUnclampedForceValues
{
  return 1;
}

- (id)transformerFromTouchForceMessageToProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4
{
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4F28EF8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke;
  v8[3] = &unk_1E52F12C0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  objc_super v6 = [v5 mapValuesWithBlock:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

- (void).cxx_destruct
{
}

@end