@interface THNotesNoSearchResultContainerView
- (CGSize)intrinsicContentSize;
- (THNotesNoSearchResultsContainerSizeProvider)sizeProvider;
- (void)setSizeProvider:(id)a3;
@end

@implementation THNotesNoSearchResultContainerView

- (CGSize)intrinsicContentSize
{
  v3 = [(THNotesNoSearchResultContainerView *)self sizeProvider];

  [(THNotesNoSearchResultsContainerSizeProvider *)v3 sizeForContainerView:self];
  result.height = v5;
  result.width = v4;
  return result;
}

- (THNotesNoSearchResultsContainerSizeProvider)sizeProvider
{
  return self->_sizeProvider;
}

- (void)setSizeProvider:(id)a3
{
  self->_sizeProvider = (THNotesNoSearchResultsContainerSizeProvider *)a3;
}

@end