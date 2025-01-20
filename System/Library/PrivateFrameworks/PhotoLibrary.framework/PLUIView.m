@interface PLUIView
- (BOOL)disableViewInPopoverRule;
- (void)didMoveToWindow;
- (void)setDisableViewInPopoverRule:(BOOL)a3;
@end

@implementation PLUIView

- (void)setDisableViewInPopoverRule:(BOOL)a3
{
  self->_disableViewInPopoverRule = a3;
}

- (BOOL)disableViewInPopoverRule
{
  return self->_disableViewInPopoverRule;
}

- (void)didMoveToWindow
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && [(PLUIView *)self window]
    && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42FF8], "viewControllerForView:", self), "parentViewController")
    && ![(PLUIView *)self disableViewInPopoverRule])
  {
    UIImagePickerEnsureViewIsInsidePopover();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLUIView;
  [(PLUIView *)&v3 didMoveToWindow];
}

@end