@interface SBDodgingModifier
+ (id)contextProtocol;
+ (id)newEventResponse;
+ (id)queryProtocol;
- (BOOL)runsInternalVerificationAfterEventDispatch;
- (id)_handleEvent:(id)a3;
- (id)handleAnimationCompletionEvent:(id)a3;
- (id)handleCustomEvent:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handlePreferenceChangeEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleRotationEvent:(id)a3;
@end

@implementation SBDodgingModifier

+ (id)contextProtocol
{
  return &unk_1F334FC60;
}

+ (id)queryProtocol
{
  return &unk_1F334FB90;
}

- (id)_handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifier;
  id v5 = [(SBChainableModifier *)&v8 _handleEvent:v4];
  switch([v4 type])
  {
    case 0:
      v6 = [(SBDodgingModifier *)self handleInsertionEvent:v4];
      goto LABEL_8;
    case 1:
      v6 = [(SBDodgingModifier *)self handleRemovalEvent:v4];
      goto LABEL_8;
    case 2:
      v6 = [(SBDodgingModifier *)self handleCustomEvent:v4];
      goto LABEL_8;
    case 3:
      v6 = [(SBDodgingModifier *)self handleAnimationCompletionEvent:v4];
      goto LABEL_8;
    case 4:
      v6 = [(SBDodgingModifier *)self handleRotationEvent:v4];
      goto LABEL_8;
    case 5:
      v6 = [(SBDodgingModifier *)self handlePreferenceChangeEvent:v4];
LABEL_8:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return 0;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBDodgingModifierEventResponse);
}

- (id)handleInsertionEvent:(id)a3
{
  return 0;
}

- (id)handleRemovalEvent:(id)a3
{
  return 0;
}

- (id)handleCustomEvent:(id)a3
{
  return 0;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  return 0;
}

- (id)handleRotationEvent:(id)a3
{
  return 0;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  return 0;
}

@end