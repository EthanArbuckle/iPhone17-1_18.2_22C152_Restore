@interface TLKLabelItem
+ (double)minimumWidthForLabelItem;
+ (id)font;
+ (void)initialize;
+ (void)setFontValues;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGRect)frame;
- (CGSize)sizeForTargetSize:(CGSize)a3;
- (NSString)description;
- (NUISizeCache)sizeCache;
- (TLKLabelItem)init;
- (TLKRichText)richText;
- (_NSRange)columnRange;
- (double)effectiveBaselineOffsetFromContentBottom;
- (double)effectiveFirstBaselineOffsetFromContentTop;
- (double)horizontalCompressionResistance;
- (double)horizontalHuggingPriority;
- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3;
- (float)contentHuggingPriorityForAxis:(int64_t)a3;
- (id)attributedString;
- (unint64_t)row;
- (void)setColumnRange:(_NSRange)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalCompressionResistance:(double)a3;
- (void)setHorizontalHuggingPriority:(double)a3;
- (void)setRichText:(id)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSizeCache:(id)a3;
@end

@implementation TLKLabelItem

- (TLKLabelItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)TLKLabelItem;
  v2 = [(TLKLabelItem *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKLabelItem *)v2 setSizeCache:v3];
  }
  return v2;
}

+ (void)initialize
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__TLKLabelItem_initialize__block_invoke;
  v5[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v5[4] = a1;
  id v4 = (id)[v3 addObserverForName:@"TLKContentSizeCategoryDidChangeNotification" object:0 queue:0 usingBlock:v5];

  [a1 setFontValues];
}

uint64_t __26__TLKLabelItem_initialize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFontValues];
}

+ (void)setFontValues
{
  uint64_t v2 = +[TLKFontUtilities preferredFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  v3 = (void *)font;
  font = v2;

  id v5 = +[TLKLabelItem font];
  +[TLKLayoutUtilities scaledValueForValue:v5 withFont:0 view:18.0];
  minimumWidthForLabelItem = v4;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  uint64_t v2 = [(TLKLabelItem *)self richText];
  BOOL v3 = [v2 maxLines] != 1;

  return v3;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  uint64_t v2 = +[TLKLabelItem font];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  uint64_t v2 = +[TLKLabelItem font];
  [v2 descender];
  double v4 = -v3;

  return v4;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  if (a3) {
    return 999.0;
  }
  [(TLKLabelItem *)self horizontalCompressionResistance];
  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  if (a3) {
    return 999.0;
  }
  [(TLKLabelItem *)self horizontalHuggingPriority];
  return v4;
}

+ (double)minimumWidthForLabelItem
{
  return *(double *)&minimumWidthForLabelItem;
}

- (CGSize)sizeForTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1390]);
  [v6 setWrapsForTruncationMode:1];
  v7 = [(TLKLabelItem *)self richText];
  objc_msgSend(v6, "setMaximumNumberOfLines:", objc_msgSend(v7, "maxLines"));

  v8 = [(TLKLabelItem *)self attributedString];
  objc_msgSend(v8, "boundingRectWithSize:options:context:", 1, v6, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)attributedString
{
  uint64_t v2 = [(TLKLabelItem *)self richText];
  LOBYTE(v5) = 0;
  double v3 = +[TLKFontUtilities attributedStringForRichText:v2 appearance:0 prominence:0 alignment:4 font:font isButton:0 scale:0.0 isDark:v5];

  return v3;
}

+ (id)font
{
  return (id)font;
}

- (NSString)description
{
  double v3 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)TLKLabelItem;
  double v4 = [(TLKLabelItem *)&v17 description];
  uint64_t v5 = [(TLKLabelItem *)self attributedString];
  id v6 = NSStringFromRange(self->columnRange);
  [(TLKLabelItem *)self frame];
  v7 = NSStringFromCGRect(v19);
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->row];
  double v9 = (void *)MEMORY[0x1E4F28ED0];
  [(TLKLabelItem *)self horizontalHuggingPriority];
  double v11 = [v9 numberWithInteger:(uint64_t)v10];
  double v12 = (void *)MEMORY[0x1E4F28ED0];
  [(TLKLabelItem *)self horizontalCompressionResistance];
  double v14 = [v12 numberWithInteger:(uint64_t)v13];
  v15 = [v3 stringWithFormat:@"%@ string = %@ range = %@ frame = %@ row = %@ CH = %@ CR = %@", v4, v5, v6, v7, v8, v11, v14];

  return (NSString *)v15;
}

- (CGRect)frame
{
  double x = self->frame.origin.x;
  double y = self->frame.origin.y;
  double width = self->frame.size.width;
  double height = self->frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->frame = a3;
}

- (_NSRange)columnRange
{
  NSUInteger length = self->columnRange.length;
  NSUInteger location = self->columnRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->columnRange = a3;
}

- (unint64_t)row
{
  return self->row;
}

- (void)setRow:(unint64_t)a3
{
  self->row = a3;
}

- (double)horizontalHuggingPriority
{
  return self->horizontalHuggingPriority;
}

- (void)setHorizontalHuggingPriority:(double)a3
{
  self->horizontalHuggingPrioritdouble y = a3;
}

- (double)horizontalCompressionResistance
{
  return self->horizontalCompressionResistance;
}

- (void)setHorizontalCompressionResistance:(double)a3
{
  self->horizontalCompressionResistance = a3;
}

- (NUISizeCache)sizeCache
{
  return self->sizeCache;
}

- (void)setSizeCache:(id)a3
{
}

- (TLKRichText)richText
{
  return self->_richText;
}

- (void)setRichText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richText, 0);
  objc_storeStrong((id *)&self->sizeCache, 0);
}

@end