@interface TVRButtonHaptic
+ (id)hapticForView:(id)a3;
- (UIFeedbackGeneratorUserInteractionDriven)behavior;
- (void)setBehavior:(id)a3;
- (void)userInteractionBegan;
- (void)userInteractionCancelled;
- (void)userInteractionEnded;
@end

@implementation TVRButtonHaptic

+ (id)hapticForView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = v4;
  v7 = [MEMORY[0x263F08AB0] processInfo];
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 11;
  int v8 = [v7 isOperatingSystemAtLeastVersion:v11];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F82ED8]) initWithStyle:0];
    [v9 _setOutputMode:5];
  }
  else
  {
    v9 = [MEMORY[0x263F82F60] buttonBehaviorWithStyle:0 coordinateSpace:v6];
  }

  [v5 setBehavior:v9];
  return v5;
}

- (void)userInteractionBegan
{
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelled
{
}

- (UIFeedbackGeneratorUserInteractionDriven)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (void).cxx_destruct
{
}

@end