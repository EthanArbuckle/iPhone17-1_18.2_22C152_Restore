@interface _UISheetPresentationController
- (NSArray)_passthroughViews;
- (double)_preferredRecessedCornerRadius;
- (void)_invalidateDetents;
- (void)_sendDidChangeSelectedDetentIdentifier;
- (void)_setPassthroughViews:(id)a3;
- (void)_setPreferredRecessedCornerRadius:(double)a3;
@end

@implementation _UISheetPresentationController

- (NSArray)_passthroughViews
{
  return self->__passthroughViews;
}

- (void).cxx_destruct
{
}

- (void)_invalidateDetents
{
  v2.receiver = self;
  v2.super_class = (Class)_UISheetPresentationController;
  [(UISheetPresentationController *)&v2 _invalidateDetents];
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)_UISheetPresentationController;
  [(UISheetPresentationController *)&v4 _sendDidChangeSelectedDetentIdentifier];
  v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "_sheetPresentationController:didChangeIndexOfCurrentDetent:", self, -[UISheetPresentationController _indexOfCurrentDetent](self, "_indexOfCurrentDetent"));
  }
}

- (double)_preferredRecessedCornerRadius
{
  return self->__preferredRecessedCornerRadius;
}

- (void)_setPreferredRecessedCornerRadius:(double)a3
{
  self->__preferredRecessedCornerRadius = a3;
}

- (void)_setPassthroughViews:(id)a3
{
}

@end