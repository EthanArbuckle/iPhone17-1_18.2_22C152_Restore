@interface SXInsertComponentLayout
- (SXEdgeSpacing)margin;
- (SXEdgeSpacing)padding;
- (SXInsertComponentLayout)initWithColumnRange:(_NSRange)a3;
- (_NSRange)columnRange;
- (_SXComponentContentInset)contentInset;
- (_SXConvertibleValue)maximumContentWidth;
- (_SXConvertibleValue)minimumHeight;
- (_SXConvertibleValue)suggestedHeight;
- (unint64_t)horizontalContentAlignment;
- (unint64_t)ignoreDocumentGutter;
- (unint64_t)ignoreDocumentMargin;
- (unint64_t)ignoreViewportPadding;
- (void)setIgnoreDocumentMargin:(unint64_t)a3;
- (void)setMargin:(id)a3;
@end

@implementation SXInsertComponentLayout

- (SXInsertComponentLayout)initWithColumnRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)SXInsertComponentLayout;
  result = [(SXInsertComponentLayout *)&v6 init];
  if (result)
  {
    result->_columnRange.NSUInteger location = location;
    result->_columnRange.NSUInteger length = length;
  }
  return result;
}

- (_SXComponentContentInset)contentInset
{
  return (_SXComponentContentInset)(*(unsigned int *)&self->_contentInset.all | ((unint64_t)self->_contentInset.bottom << 32));
}

- (_NSRange)columnRange
{
  NSUInteger length = self->_columnRange.length;
  NSUInteger location = self->_columnRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)ignoreDocumentGutter
{
  return self->_ignoreDocumentGutter;
}

- (unint64_t)ignoreDocumentMargin
{
  return self->_ignoreDocumentMargin;
}

- (void)setIgnoreDocumentMargin:(unint64_t)a3
{
  self->_ignoreDocumentMargin = a3;
}

- (_SXConvertibleValue)minimumHeight
{
  unint64_t unit = self->_minimumHeight.unit;
  double value = self->_minimumHeight.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (_SXConvertibleValue)maximumContentWidth
{
  unint64_t unit = self->_maximumContentWidth.unit;
  double value = self->_maximumContentWidth.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (SXEdgeSpacing)margin
{
  return self->_margin;
}

- (void)setMargin:(id)a3
{
}

- (unint64_t)horizontalContentAlignment
{
  return self->_horizontalContentAlignment;
}

- (_SXConvertibleValue)suggestedHeight
{
  unint64_t unit = self->_suggestedHeight.unit;
  double value = self->_suggestedHeight.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (SXEdgeSpacing)padding
{
  return self->_padding;
}

- (unint64_t)ignoreViewportPadding
{
  return self->_ignoreViewportPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_margin, 0);
}

@end