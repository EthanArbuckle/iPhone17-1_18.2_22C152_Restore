@interface UIMenuController
+ (UIMenuController)sharedMenuController;
- (BOOL)isMenuVisible;
- (CGRect)menuFrame;
- (NSArray)menuItems;
- (UIMenuController)init;
- (UIMenuControllerArrowDirection)arrowDirection;
- (id)_asCalloutBarDelegate;
- (void)hideMenu;
- (void)hideMenuFromView:(UIView *)targetView;
- (void)setArrowDirection:(UIMenuControllerArrowDirection)arrowDirection;
- (void)setMenuVisible:(BOOL)menuVisible;
- (void)setMenuVisible:(BOOL)menuVisible animated:(BOOL)animated;
- (void)setTargetRect:(CGRect)targetRect inView:(UIView *)targetView;
- (void)showMenuFromView:(UIView *)targetView rect:(CGRect)targetRect;
- (void)update;
@end

@implementation UIMenuController

+ (UIMenuController)sharedMenuController
{
  v2 = (void *)__sharedMenuController;
  if (!__sharedMenuController)
  {
    v3 = objc_alloc_init(_UIEditMenuInteractionMenuController);
    v4 = (void *)__sharedMenuController;
    __sharedMenuController = (uint64_t)v3;

    v2 = (void *)__sharedMenuController;
  }
  return (UIMenuController *)v2;
}

- (UIMenuController)init
{
  if (__sharedMenuController)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIMenuController.m" lineNumber:88 description:@"There can only be one UIMenuController instance."];
  }
  if ([(UIMenuController *)self isMemberOfClass:objc_opt_class()])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIMenuController.m" lineNumber:89 description:@"UIMenuController does not support direct initialization."];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIMenuController;
  return [(UIMenuController *)&v7 init];
}

- (void)setMenuVisible:(BOOL)menuVisible
{
}

- (void)setMenuVisible:(BOOL)menuVisible animated:(BOOL)animated
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", menuVisible, animated);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 100, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController setMenuVisible:animated:]");
}

- (void)setTargetRect:(CGRect)targetRect inView:(UIView *)targetView
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", targetView, targetRect.origin.x, targetRect.origin.y, targetRect.size.width, targetRect.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 105, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController setTargetRect:inView:]");
}

- (void)showMenuFromView:(UIView *)targetView rect:(CGRect)targetRect
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", targetView, targetRect.origin.x, targetRect.origin.y, targetRect.size.width, targetRect.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 110, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController showMenuFromView:rect:]");
}

- (void)hideMenuFromView:(UIView *)targetView
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", targetView);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 115, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController hideMenuFromView:]");
}

- (void)hideMenu
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 120, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController hideMenu]");
}

- (void)update
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIMenuController.m", 125, @"%s needs to be implemented by a concrete subclass.", "-[UIMenuController update]");
}

- (NSArray)menuItems
{
  return 0;
}

- (CGRect)menuFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_asCalloutBarDelegate
{
  return 0;
}

- (UIMenuControllerArrowDirection)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(UIMenuControllerArrowDirection)arrowDirection
{
  self->_arrowDirection = arrowDirection;
}

- (BOOL)isMenuVisible
{
  return self->_menuVisible;
}

@end