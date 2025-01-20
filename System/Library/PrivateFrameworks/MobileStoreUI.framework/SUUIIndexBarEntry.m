@interface SUUIIndexBarEntry
+ (id)entryWithAttributedString:(id)a3;
+ (id)entryWithImage:(id)a3;
+ (id)placeholderEntryWithSize:(CGSize)a3;
+ (id)systemCombinedEntry;
- (BOOL)isEqual:(id)a3;
- (CGSize)_calculatedContentSize;
- (CGSize)contentSize;
- (CGSize)size;
- (NSAttributedString)entryAttributedString;
- (UIColor)tintColor;
- (UIEdgeInsets)contentEdgeInsets;
- (UIImage)entryImage;
- (int64_t)entryType;
- (int64_t)visibilityPriority;
- (unint64_t)hash;
- (void)_drawInRect:(CGRect)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setEntryType:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setVisibilityPriority:(int64_t)a3;
@end

@implementation SUUIIndexBarEntry

+ (id)entryWithAttributedString:(id)a3
{
  id v3 = a3;
  v4 = [[SUUIAttributedStringIndexBarEntry alloc] initWithAttributedString:v3];

  return v4;
}

+ (id)entryWithImage:(id)a3
{
  id v3 = a3;
  v4 = [[SUUIImageIndexBarEntry alloc] initWithImage:v3];

  return v4;
}

+ (id)placeholderEntryWithSize:(CGSize)a3
{
  id v3 = -[SUUIPlaceholderIndexBarEntry initWithPlaceholderSize:]([SUUIPlaceholderIndexBarEntry alloc], "initWithPlaceholderSize:", a3.width, a3.height);
  return v3;
}

+ (id)systemCombinedEntry
{
  v2 = objc_alloc_init(SUUISystemCombinedIndexBarEntry);
  return v2;
}

- (unint64_t)hash
{
  return (self->_entryType ^ self->_visibilityPriority) + 52314;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUUIIndexBarEntry *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_visibilityPriority == self->_visibilityPriority
      && v4->_entryType == self->_entryType;
  }

  return v5;
}

- (CGSize)contentSize
{
  if (self->_hasValidContentSize)
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  else
  {
    [(SUUIIndexBarEntry *)self _calculatedContentSize];
    self->_contentSize.double width = width;
    self->_contentSize.double height = height;
    self->_hasValidContentSize = 1;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSAttributedString)entryAttributedString
{
  return 0;
}

- (UIImage)entryImage
{
  return 0;
}

- (void)setTintColor:(id)a3
{
  id v5 = a3;
  uint64_t tintColor = (uint64_t)self->_tintColor;
  if ((id)tintColor != v5)
  {
    id v7 = v5;
    uint64_t tintColor = [(id)tintColor isEqual:v5];
    id v5 = v7;
    if ((tintColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      uint64_t tintColor = [(SUUIIndexBarEntry *)self _tintColorDidChange];
      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](tintColor, v5);
}

- (CGSize)size
{
  [(SUUIIndexBarEntry *)self contentSize];
  double v4 = v3 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  double v6 = v5 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (UIColor)tintColor
{
  uint64_t tintColor = self->_tintColor;
  if (tintColor)
  {
    double v3 = tintColor;
  }
  else
  {
    double v3 = [MEMORY[0x263F825C8] blackColor];
  }
  return v3;
}

- (CGSize)_calculatedContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_drawInRect:(CGRect)a3
{
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(int64_t)a3
{
  self->_entryType = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
}

@end