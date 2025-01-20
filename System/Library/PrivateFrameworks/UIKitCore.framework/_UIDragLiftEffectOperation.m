@interface _UIDragLiftEffectOperation
+ (id)defaultTimingParameters;
- (NSSet)items;
- (UIDragInteraction)interaction;
- (UIDragInteractionContext)context;
- (UIViewPropertyAnimator)propertyAnimator;
- (_UIDragLiftEffectOperation)initWithLiftAnimationDuration:(double)a3 liftTimingParameters:(id)a4;
- (void)setContext:(id)a3;
- (void)setInteraction:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation _UIDragLiftEffectOperation

+ (id)defaultTimingParameters
{
  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_906, @"DragLiftEffectSpringDamping"))double v2 = 19.75; {
  else
  }
    double v2 = *(double *)&qword_1EB257160;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1EB257168, @"DragLiftEffectSpringStiffness"))double v3 = 195.0; {
  else
  }
    double v3 = *(double *)&qword_1EB257170;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1EB257178, @"DragLiftEffectSpringMass"))double v4 = 1.0; {
  else
  }
    double v4 = *(double *)&qword_1EB257180;
  v5 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", v4, v3, v2, 0.0, 0.0);
  return v5;
}

- (_UIDragLiftEffectOperation)initWithLiftAnimationDuration:(double)a3 liftTimingParameters:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDragLiftEffectOperation;
  v7 = [(_UIDragLiftEffectOperation *)&v11 init];
  if (v7)
  {
    v8 = [[UIViewPropertyAnimator alloc] initWithDuration:v6 timingParameters:a3];
    propertyAnimator = v7->_propertyAnimator;
    v7->_propertyAnimator = v8;
  }
  return v7;
}

- (UIDragInteractionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (UIDragInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end