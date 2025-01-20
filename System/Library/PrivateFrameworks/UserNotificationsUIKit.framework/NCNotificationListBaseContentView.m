@interface NCNotificationListBaseContentView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (NCNotificationListBaseContentView)initWithFrame:(CGRect)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
- (double)_sizeMeasuringHeightForLabel:(id)a3 withNumberOfLines:(unint64_t)a4;
- (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (unint64_t)_numberOfLinesForLabel:(id)a3 maximumNumberOfLines:(unint64_t)a4 inFrame:(CGRect)a5;
- (void)_updateTextAttributesForLabel:(id)a3 withTextStyle:(id)a4 fontWeight:(double)a5 additionalTraits:(unsigned int)a6 maximumNumberOfLines:(unint64_t)a7;
- (void)_updateVisualStylingOfImageView:(id)a3 ifSymbolImageWithStyle:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)didMoveToWindow;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation NCNotificationListBaseContentView

- (NCNotificationListBaseContentView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListBaseContentView;
  v3 = -[NCNotificationListBaseContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_adjustsFontForContentSizeCategory = 1;
    v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    preferredContentSizeCategory = v4->_preferredContentSizeCategory;
    v4->_preferredContentSizeCategory = (NSString *)v6;

    v8 = [(NCNotificationListBaseContentView *)v4 layer];
    [v8 setAllowsGroupOpacity:0];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v3 = [(NCNotificationListBaseContentView *)self window];

  if (v3)
  {
    [(NCNotificationListBaseContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v3 = [(NCNotificationListBaseContentView *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(NCNotificationListBaseContentView *)self _updateTextAttributes];
    [(NCNotificationListBaseContentView *)self setNeedsLayout];
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    v4 = strokeVisualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationListBaseContentView;
    v4 = [(NCNotificationListBaseContentView *)&v6 visualStylingProviderForCategory:a3];
  }

  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84658;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  objc_super v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v11 = v6;
    v8 = v6;
    v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    objc_super v10 = strokeVisualStylingProvider;

    [(NCNotificationListBaseContentView *)self _visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v10];
    objc_super v6 = v11;
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_updateVisualStylingOfImageView:(id)a3 ifSymbolImageWithStyle:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v14 = [v12 image];
  if ([v14 isSymbolImage]) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v12 style:a4 visualStylingProvider:v13 outgoingProvider:v10];
}

- (unint64_t)_numberOfLinesForLabel:(id)a3 maximumNumberOfLines:(unint64_t)a4 inFrame:(CGRect)a5
{
  return objc_msgSend(a3, "unui_numberOfLinesInFrame:maximum:drawingContext:", a4, self->_drawingContext, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)_updateTextAttributesForLabel:(id)a3 withTextStyle:(id)a4 fontWeight:(double)a5 additionalTraits:(unsigned int)a6 maximumNumberOfLines:(unint64_t)a7
{
  if (a3)
  {
    id v11 = a3;
    id v12 = [(NCNotificationListBaseContentView *)self _preferredFont:1 textStyle:a4 weight:0 additionalTraits:a5];
    [v11 setFont:v12];

    [v11 setNumberOfLines:a7];
    [(NCNotificationListBaseContentView *)self setNeedsLayout];
  }
}

- (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x1E4FB0950];
  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  v8 = [NSNumber numberWithDouble:a5];
  v15 = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = [v7 fontDescriptorByAddingAttributes:v10];

  id v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (double)_sizeMeasuringHeightForLabel:(id)a3 withNumberOfLines:(unint64_t)a4
{
  id v5 = a3;
  objc_msgSend(v5, "unui_measuringHeightWithNumberOfLines:", a4);
  double v7 = v6;
  objc_msgSend(v5, "unui_drawingHeightWithNumberOfLines:", a4);
  double v9 = v8;

  return v7 + (v9 - v7) * 0.5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);

  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
}

@end