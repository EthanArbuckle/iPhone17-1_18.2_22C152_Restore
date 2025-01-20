@interface OBStackedIconTextList
- (OBStackedIconTextList)initWithFrame:(CGRect)a3;
- (double)iconTextPadding;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)dataDetectorTypes;
- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 attributedText:(id)a5;
- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setIconTextPadding:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSpacing;
@end

@implementation OBStackedIconTextList

- (OBStackedIconTextList)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBStackedIconTextList;
  v3 = -[OBStackedIconTextList initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    entries = v3->_entries;
    v3->_entries = (NSMutableArray *)v4;

    v3->_itemSpacing = 32.0;
    [(OBStackedIconTextList *)v3 setAxis:1];
    v3->_iconTextPadding = 12.0;
    [(OBStackedIconTextList *)v3 setBaselineRelativeArrangement:1];
    [(OBStackedIconTextList *)v3 updateSpacing];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBStackedIconTextList;
  [(OBStackedIconTextList *)&v4 traitCollectionDidChange:a3];
  [(OBStackedIconTextList *)self updateSpacing];
}

- (void)updateSpacing
{
  id v3 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2950]];
  [v3 scaledValueForValue:30.0];
  -[OBStackedIconTextList setSpacing:](self, "setSpacing:");
}

- (id)viewForFirstBaselineLayout
{
  id v3 = [(OBStackedIconTextList *)self subviews];
  objc_super v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 textView];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBStackedIconTextList;
    uint64_t v5 = [(OBStackedIconTextList *)&v8 viewForFirstBaselineLayout];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)viewForLastBaselineLayout
{
  id v3 = [(OBStackedIconTextList *)self subviews];
  objc_super v4 = [v3 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 textView];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBStackedIconTextList;
    uint64_t v5 = [(OBStackedIconTextList *)&v8 viewForLastBaselineLayout];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setIconTextPadding:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_iconTextPadding != a3)
  {
    self->_iconTextPadding = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v4 = [(OBStackedIconTextList *)self subviews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setPadding:a3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  long long v11 = -[OBIconTextView initWithIcon:iconSize:text:dataDetectorTypes:]([OBIconTextView alloc], "initWithIcon:iconSize:text:dataDetectorTypes:", v10, v9, [(OBStackedIconTextList *)self dataDetectorTypes], width, height);

  [(OBIconTextView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBIconTextView *)v11 setPadding:self->_iconTextPadding];
  [(OBStackedIconTextList *)self addArrangedSubview:v11];
  [(NSMutableArray *)self->_entries addObject:v11];
}

- (void)addEntryWithIcon:(id)a3 iconSize:(CGSize)a4 attributedText:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  long long v12 = -[OBIconTextView initWithIcon:iconSize:text:dataDetectorTypes:]([OBIconTextView alloc], "initWithIcon:iconSize:text:dataDetectorTypes:", v10, 0, [(OBStackedIconTextList *)self dataDetectorTypes], width, height);

  [(OBIconTextView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v11 = [(OBIconTextView *)v12 textView];
  [v11 setAttributedText:v9];

  [(OBIconTextView *)v12 setPadding:self->_iconTextPadding];
  [(OBStackedIconTextList *)self addArrangedSubview:v12];
  [(NSMutableArray *)self->_entries addObject:v12];
}

- (double)iconTextPadding
{
  return self->_iconTextPadding;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (void).cxx_destruct
{
}

@end