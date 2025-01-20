@interface PXSuggesterDebugViewControllerCell
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (PHSuggestion)suggestion;
- (void)setSuggestion:(id)a3;
@end

@implementation PXSuggesterDebugViewControllerCell

- (void).cxx_destruct
{
}

- (void)setSuggestion:(id)a3
{
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 1016, 1);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return self->_suggestion && sel_persist_ == a3;
}

@end