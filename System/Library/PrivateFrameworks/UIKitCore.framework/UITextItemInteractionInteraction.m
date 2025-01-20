@interface UITextItemInteractionInteraction
+ (BOOL)mightResponder:(id)a3 haveInteractableTextItemAtPoint:(CGPoint)a4 precision:(unint64_t)a5;
+ (BOOL)mightResponderHaveTextItemInteractions:(id)a3;
- (BOOL)_allowItemInteractions;
@end

@implementation UITextItemInteractionInteraction

+ (BOOL)mightResponderHaveTextItemInteractions:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    if (([v3 _mightHaveInteractableItems] & 1) == 0)
    {
LABEL_7:
      BOOL v4 = 0;
      goto LABEL_8;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 || ([v3 mightHaveLinks] & 1) == 0)
  {
    goto LABEL_7;
  }
  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)_allowItemInteractions
{
  return 0;
}

+ (BOOL)mightResponder:(id)a3 haveInteractableTextItemAtPoint:(CGPoint)a4 precision:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (![a1 mightResponderHaveTextItemInteractions:v9]) {
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      char v11 = objc_msgSend(v9, "willInteractWithLinkAtPoint:", x, y);
      goto LABEL_7;
    }
LABEL_6:
    char v11 = 0;
    goto LABEL_7;
  }
  v10 = objc_msgSend(v9, "_textInteractableItemAtPoint:precision:", a5, x, y);
  char v11 = v10 != 0;

LABEL_7:
  return v11;
}

@end