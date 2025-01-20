@interface _UIAlertControllerView
- (BOOL)_actionsReversed;
- (BOOL)alignsToKeyboard;
- (BOOL)hasDimmingView;
- (BOOL)presentedAsPopover;
- (BOOL)shouldHaveBackdropView;
- (NSAttributedString)attributedDetailMessage;
- (NSAttributedString)attributedMessage;
- (NSAttributedString)attributedTitle;
- (NSString)message;
- (NSString)title;
- (UIAlertController)alertController;
- (UIAlertControllerVisualStyle)_visualStyle;
- (UIView)_contentView;
- (UIView)_dimmingView;
- (double)effectAlpha;
- (id)_focusedAction;
- (void)_setActionsReversed:(BOOL)a3;
- (void)_setVisualStyle:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setAlignsToKeyboard:(BOOL)a3;
- (void)setEffectAlpha:(double)a3;
- (void)setHasDimmingView:(BOOL)a3;
- (void)setPresentedAsPopover:(BOOL)a3;
- (void)setShouldHaveBackdropView:(BOOL)a3;
@end

@implementation _UIAlertControllerView

- (id)_focusedAction
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (NSAttributedString)attributedDetailMessage
{
  return self->_attributedDetailMessage;
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (UIView)_contentView
{
  return (UIView *)objc_getProperty(self, a2, 464, 1);
}

- (UIView)_dimmingView
{
  return (UIView *)objc_getProperty(self, a2, 472, 1);
}

- (UIAlertControllerVisualStyle)_visualStyle
{
  return self->__visualStyle;
}

- (void)_setVisualStyle:(id)a3
{
}

- (BOOL)_actionsReversed
{
  return self->_actionsReversed;
}

- (void)_setActionsReversed:(BOOL)a3
{
  self->_actionsReversed = a3;
}

- (double)effectAlpha
{
  return self->_effectAlpha;
}

- (void)setEffectAlpha:(double)a3
{
  self->_effectAlpha = a3;
}

- (BOOL)shouldHaveBackdropView
{
  return self->_shouldHaveBackdropView;
}

- (void)setShouldHaveBackdropView:(BOOL)a3
{
  self->_shouldHaveBackdropView = a3;
}

- (BOOL)alignsToKeyboard
{
  return self->_alignsToKeyboard;
}

- (void)setAlignsToKeyboard:(BOOL)a3
{
  self->_alignsToKeyboard = a3;
}

- (BOOL)hasDimmingView
{
  return self->_hasDimmingView;
}

- (void)setHasDimmingView:(BOOL)a3
{
  self->_hasDimmingView = a3;
}

- (BOOL)presentedAsPopover
{
  return self->_presentedAsPopover;
}

- (void)setPresentedAsPopover:(BOOL)a3
{
  self->_presentedAsPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__visualStyle, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_attributedDetailMessage, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end