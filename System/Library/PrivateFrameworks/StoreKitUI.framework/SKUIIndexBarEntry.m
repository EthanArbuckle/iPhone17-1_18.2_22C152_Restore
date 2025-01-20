@interface SKUIIndexBarEntry
+ (id)entryWithAttributedString:(id)a3;
+ (id)entryWithImage:(id)a3;
+ (id)placeholderEntryWithSize:(CGSize)a3;
+ (id)systemCombinedEntry;
+ (void)systemCombinedEntry;
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
- (void)contentSize;
- (void)entryAttributedString;
- (void)entryImage;
- (void)hash;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setEntryType:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setVisibilityPriority:(int64_t)a3;
- (void)size;
- (void)tintColor;
@end

@implementation SKUIIndexBarEntry

+ (id)entryWithAttributedString:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntry entryWithAttributedString:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = [[SKUIAttributedStringIndexBarEntry alloc] initWithAttributedString:v3];

  return v12;
}

+ (id)entryWithImage:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntry entryWithImage:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = [[SKUIImageIndexBarEntry alloc] initWithImage:v3];

  return v12;
}

+ (id)placeholderEntryWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIIndexBarEntry placeholderEntryWithSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = -[SKUIPlaceholderIndexBarEntry initWithPlaceholderSize:]([SKUIPlaceholderIndexBarEntry alloc], "initWithPlaceholderSize:", width, height);

  return v13;
}

+ (id)systemCombinedEntry
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIIndexBarEntry systemCombinedEntry];
      }
    }
  }
  uint64_t v10 = objc_alloc_init(SKUISystemCombinedIndexBarEntry);

  return v10;
}

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIIndexBarEntry *)v3 hash];
      }
    }
  }
  return (self->_entryType ^ self->_visibilityPriority) + 52314;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SKUIIndexBarEntry *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIIndexBarEntry isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v13 = (objc_opt_isKindOfClass() & 1) != 0
       && v4->_visibilityPriority == self->_visibilityPriority
       && v4->_entryType == self->_entryType;
  }

  return v13;
}

- (CGSize)contentSize
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIIndexBarEntry *)v3 contentSize];
      }
    }
  }
  if (self->_hasValidContentSize)
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  else
  {
    [(SKUIIndexBarEntry *)self _calculatedContentSize];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIIndexBarEntry *)v2 entryAttributedString];
      }
    }
  }
  return 0;
}

- (UIImage)entryImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIIndexBarEntry *)v2 entryImage];
      }
    }
  }
  return 0;
}

- (void)setTintColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIIndexBarEntry setTintColor:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  tintColor = self->_tintColor;
  if (tintColor != v5 && ([(UIColor *)tintColor isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    [(SKUIIndexBarEntry *)self _tintColorDidChange];
  }
}

- (CGSize)size
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIIndexBarEntry *)v3 size];
      }
    }
  }
  [(SKUIIndexBarEntry *)self contentSize];
  double v12 = v11 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  double v14 = v13 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.double height = v14;
  result.double width = v12;
  return result;
}

- (UIColor)tintColor
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIIndexBarEntry *)v3 tintColor];
      }
    }
  }
  tintColor = self->_tintColor;
  if (tintColor)
  {
    double v12 = tintColor;
  }
  else
  {
    double v12 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v12;
}

- (CGSize)_calculatedContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
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

+ (void)entryWithAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)entryWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)placeholderEntryWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)systemCombinedEntry
{
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contentSize
{
}

- (void)entryAttributedString
{
}

- (void)entryImage
{
}

- (void)setTintColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)size
{
}

- (void)tintColor
{
}

@end