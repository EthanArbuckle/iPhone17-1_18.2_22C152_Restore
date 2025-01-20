@interface UIInputViewSetPlacement_UndockedApplicator
- (void)applyChanges:(id)a3;
@end

@implementation UIInputViewSetPlacement_UndockedApplicator

- (void)applyChanges:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIInputViewSetPlacement_UndockedApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v11 applyChanges:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  v5 = [WeakRetained containerView];
  v6 = [v5 _window];

  [v6 slideOverWindowVerticalOffset];
  double v8 = v7;
  verticalConstraint = self->super._verticalConstraint;
  [(NSLayoutConstraint *)verticalConstraint constant];
  [(NSLayoutConstraint *)verticalConstraint setConstant:v8 + v10];
}

@end