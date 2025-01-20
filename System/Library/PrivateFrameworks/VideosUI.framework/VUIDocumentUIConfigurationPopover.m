@interface VUIDocumentUIConfigurationPopover
- (BOOL)isPresentationAdjustedToSizeClass;
- (CGRect)sourceRect;
- (CGSize)preferredSize;
- (UIBarButtonItem)popOverSourceBarButtonItem;
- (UIView)sourceView;
- (unint64_t)popOverArrowDirection;
- (void)setPopOverArrowDirection:(unint64_t)a3;
- (void)setPopOverSourceBarButtonItem:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPresentationAdjustedToSizeClass:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation VUIDocumentUIConfigurationPopover

- (CGSize)preferredSize
{
  popOverSourceBarButtonItem = self->_popOverSourceBarButtonItem;
  double width = self->_preferredSize.width;
  result.height = width;
  result.double width = *(double *)&popOverSourceBarButtonItem;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  *(CGSize *)&self->_popOverSourceBarButtonItem = a3;
}

- (CGRect)sourceRect
{
  double height = self->_preferredSize.height;
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  result.size.double height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = height;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  *(CGRect *)&self->_preferredSize.double height = a3;
}

- (unint64_t)popOverArrowDirection
{
  return *(void *)&self->_presentationAdjustedToSizeClass;
}

- (void)setPopOverArrowDirection:(unint64_t)a3
{
  *(void *)&self->_presentationAdjustedToSizeClass = a3;
}

- (UIView)sourceView
{
  return (UIView *)self->_popOverArrowDirection;
}

- (void)setSourceView:(id)a3
{
}

- (UIBarButtonItem)popOverSourceBarButtonItem
{
  return (UIBarButtonItem *)self->_sourceView;
}

- (void)setPopOverSourceBarButtonItem:(id)a3
{
}

- (BOOL)isPresentationAdjustedToSizeClass
{
  return *(&self->super._presentOnPresentingVC + 1);
}

- (void)setPresentationAdjustedToSizeClass:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_popOverArrowDirection, 0);
}

@end