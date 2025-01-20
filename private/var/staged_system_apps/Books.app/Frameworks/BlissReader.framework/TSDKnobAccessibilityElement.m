@interface TSDKnobAccessibilityElement
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isEqualToKnob:(id)a3;
- (CGRect)accessibilityFrame;
- (TSDKnobAccessibility)knob;
- (TSDKnobAccessibilityElement)initWithAccessibilityParent:(id)a3;
- (TSDKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 parentRep:(id)a4;
- (TSDRepAccessibility)parentRep;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unint64_t)knobTag;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setKnobTag:(unint64_t)a3;
- (void)setParentRep:(id)a3;
@end

@implementation TSDKnobAccessibilityElement

- (BOOL)isAccessibilityElement
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)[(TSDKnobAccessibilityElement *)self parentRep] tsaxInteractiveCanvasController] tsaxInPrintPreviewMode])
  {
    return 0;
  }
  unint64_t v4 = [(TSDKnobAccessibilityElement *)self knobTag];
  BOOL result = 0;
  if (v4 <= 0xC && ((1 << v4) & 0x13DE) != 0)
  {
    [(CALayer *)[[(TSDKnobAccessibilityElement *)self knob] tsaxLayer] opacity];
    return v5 > 0.00000011921;
  }
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(TSDKnobAccessibilityElement *)self knob];

  return [(TSDKnobAccessibility *)v2 tsaxLabel];
}

- (id)accessibilityHint
{
  if (![[(TSDKnobAccessibilityElement *)self knob] tsaxIsAdjustable]) {
    return 0;
  }

  return TSAccessibilityLocalizedString(@"knob.sizing.hint.ios");
}

- (id)accessibilityValue
{
  v2 = [(TSDKnobAccessibilityElement *)self knob];

  return [(TSDKnobAccessibility *)v2 tsaxValue];
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3 = UIAccessibilityTraitNone;
  if ([(TSDRepAccessibility *)[(TSDKnobAccessibilityElement *)self parentRep] tsaxIsLocked])
  {
    unint64_t v4 = &UIAccessibilityTraitNotEnabled;
LABEL_5:
    v3 |= *v4;
    return v3;
  }
  if ([[(TSDKnobAccessibilityElement *)self knob] tsaxIsAdjustable])
  {
    unint64_t v4 = &UIAccessibilityTraitAdjustable;
    goto LABEL_5;
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(TSDKnobAccessibilityElement *)self knob];

  [(TSDKnobAccessibility *)v2 tsaxFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityIncrement
{
  double v3 = [(TSDKnobAccessibilityElement *)self knob];
  [(TSDKnobAccessibility *)v3 tsaxCalculatedNextPositionInRepForAdjustable:1];
  -[TSDKnobAccessibility tsaxMoveKnobToRepPositionInNaturalSpace:](v3, "tsaxMoveKnobToRepPositionInNaturalSpace:");

  TSAccessibilityPostLayoutChangedNotification(self);
}

- (void)accessibilityDecrement
{
  double v3 = [(TSDKnobAccessibilityElement *)self knob];
  [(TSDKnobAccessibility *)v3 tsaxCalculatedNextPositionInRepForAdjustable:0];
  -[TSDKnobAccessibility tsaxMoveKnobToRepPositionInNaturalSpace:](v3, "tsaxMoveKnobToRepPositionInNaturalSpace:");

  TSAccessibilityPostLayoutChangedNotification(self);
}

- (TSDKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 parentRep:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDKnobAccessibilityElement;
  CGRect result = [(TSAccessibilityElement *)&v7 initWithAccessibilityParent:a4];
  if (result)
  {
    result->_parentRep = (TSDRepAccessibility *)a4;
    result->_knobTag = a3;
  }
  return result;
}

- (TSDKnobAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Use designated initializer!", v5, v6, v7, v8, v9, v11))abort(); {
  }
    }

  return [(TSDKnobAccessibilityElement *)self initWithKnobTag:0 parentRep:0];
}

- (BOOL)isEqualToKnob:(id)a3
{
  id v4 = [(TSDKnobAccessibilityElement *)self knobTag];
  return v4 == [a3 tsaxKnobTag];
}

- (TSDKnobAccessibility)knob
{
  return (TSDKnobAccessibility *)[(TSDRepAccessibility *)self->_parentRep tsaxKnobForTag:self->_knobTag];
}

- (TSDRepAccessibility)parentRep
{
  return self->_parentRep;
}

- (void)setParentRep:(id)a3
{
  self->_parentRep = (TSDRepAccessibility *)a3;
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_knobTag = a3;
}

@end