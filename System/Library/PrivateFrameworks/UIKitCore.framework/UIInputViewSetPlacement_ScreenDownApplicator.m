@interface UIInputViewSetPlacement_ScreenDownApplicator
- (UIEdgeInsets)inputAccessoryPadding;
@end

@implementation UIInputViewSetPlacement_ScreenDownApplicator

- (UIEdgeInsets)inputAccessoryPadding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  v3 = [WeakRetained hostView];
  v4 = [v3 traitCollection];
  +[UIInputViewSetPlacement_FloatingAssistantApplicator inputAccessoryPaddingForTraitCollection:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

@end