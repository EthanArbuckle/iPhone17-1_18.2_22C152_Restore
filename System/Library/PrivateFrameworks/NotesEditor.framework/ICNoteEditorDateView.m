@interface ICNoteEditorDateView
+ (id)newDateView;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)iconHidden;
- (BOOL)isAccessibilityElement;
- (ICNote)note;
- (ICNoteDateFormatterController)formatterController;
- (ICSelectorDelayer)dateViewLayoutUpdateDelayer;
- (UIFont)font;
- (UIImageView)lockImageView;
- (UILabel)label;
- (double)cachedHeight;
- (double)dateViewMaximumWidth;
- (double)dateViewMaximumWidthOnPreviousTextChange;
- (double)preferredHeight;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)dateViewAttributes;
- (void)_updateLayout;
- (void)awakeFromNib;
- (void)contentSizeCategoryDidChange;
- (void)dateViewDidTap:(id)a3;
- (void)dealloc;
- (void)formatter:(id)a3 iconHiddenDidChange:(BOOL)a4;
- (void)formatter:(id)a3 iconImageDidChange:(id)a4;
- (void)formatter:(id)a3 textDidChange:(id)a4;
- (void)layoutSubviews;
- (void)reset;
- (void)setCachedHeight:(double)a3;
- (void)setDateViewLayoutUpdateDelayer:(id)a3;
- (void)setDateViewMaximumWidthOnPreviousTextChange:(double)a3;
- (void)setFormatterController:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLockImageView:(id)a3;
- (void)setNote:(id)a3;
- (void)updateLayoutIfNecessary;
@end

@implementation ICNoteEditorDateView

- (double)preferredHeight
{
  [(ICNoteEditorDateView *)self cachedHeight];
  if (v3 == 0.0)
  {
    v4 = [(ICNoteEditorDateView *)self superview];
    [v4 frame];
    double v6 = v5;
    v7 = [(ICNoteEditorDateView *)self label];
    [v7 setPreferredMaxLayoutWidth:v6];

    v8 = [(ICNoteEditorDateView *)self label];
    [v8 intrinsicContentSize];
    double v10 = v9;

    int v11 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    double v12 = v10 + 20.0;
    if (!v11) {
      double v12 = v10;
    }
    [(ICNoteEditorDateView *)self setCachedHeight:v12];
  }

  [(ICNoteEditorDateView *)self cachedHeight];
  return result;
}

- (double)cachedHeight
{
  return self->_cachedHeight;
}

- (void)setCachedHeight:(double)a3
{
  self->_cachedHeight = a3;
}

- (void)setNote:(id)a3
{
  v4 = (ICNote *)a3;
  [(ICNoteEditorDateView *)self setCachedHeight:0.0];
  note = self->_note;
  self->_note = v4;
  double v6 = v4;

  v7 = [(ICNoteEditorDateView *)self formatterController];
  [v7 setNote:v6];

  [(ICNoteEditorDateView *)self setHidden:v6 == 0];

  [(ICNoteEditorDateView *)self setNeedsLayout];
}

- (void)updateLayoutIfNecessary
{
  if (([MEMORY[0x263F5AE70] isRunningUnitTests] & 1) == 0)
  {
    [(ICNoteEditorDateView *)self dateViewMaximumWidth];
    double v4 = v3;
    [(ICNoteEditorDateView *)self dateViewMaximumWidthOnPreviousTextChange];
    if (v4 != v5)
    {
      double v6 = [(ICNoteEditorDateView *)self dateViewLayoutUpdateDelayer];

      if (!v6)
      {
        v7 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel__updateLayout delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.25];
        [(ICNoteEditorDateView *)self setDateViewLayoutUpdateDelayer:v7];
      }
      id v8 = [(ICNoteEditorDateView *)self dateViewLayoutUpdateDelayer];
      [v8 requestFire];
    }
  }
}

- (ICSelectorDelayer)dateViewLayoutUpdateDelayer
{
  return self->_dateViewLayoutUpdateDelayer;
}

- (double)dateViewMaximumWidthOnPreviousTextChange
{
  return self->_dateViewMaximumWidthOnPreviousTextChange;
}

- (void)setDateViewLayoutUpdateDelayer:(id)a3
{
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorDateView;
  [(ICNoteEditorDateView *)&v7 layoutSubviews];
  double v3 = [(ICNoteEditorDateView *)self superview];
  [v3 frame];
  double v5 = v4;
  double v6 = [(ICNoteEditorDateView *)self label];
  [v6 setPreferredMaxLayoutWidth:v5];
}

- (void)formatter:(id)a3 textDidChange:(id)a4
{
  double v10 = (__CFString *)a4;
  double v5 = [(ICNoteEditorDateView *)self label];
  double v6 = [v5 text];
  char v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    if (v10) {
      id v8 = v10;
    }
    else {
      id v8 = &stru_26C10E100;
    }
    double v9 = [(ICNoteEditorDateView *)self label];
    [v9 setText:v8];

    [(ICNoteEditorDateView *)self setCachedHeight:0.0];
  }
  [(ICNoteEditorDateView *)self dateViewMaximumWidth];
  -[ICNoteEditorDateView setDateViewMaximumWidthOnPreviousTextChange:](self, "setDateViewMaximumWidthOnPreviousTextChange:");
}

- (void)setDateViewMaximumWidthOnPreviousTextChange:(double)a3
{
  self->_dateViewMaximumWidthOnPreviousTextChange = a3;
}

- (id)dateViewAttributes
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F814F0];
  v2 = [(ICNoteEditorDateView *)self label];
  double v3 = [v2 font];
  v7[0] = v3;
  double v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)formatter:(id)a3 iconHiddenDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ICNoteEditorDateView *)self lockImageView];
  [v5 setHidden:v4];
}

- (void)awakeFromNib
{
  v25.receiver = self;
  v25.super_class = (Class)ICNoteEditorDateView;
  [(ICNoteEditorDateView *)&v25 awakeFromNib];
  [(ICNoteEditorDateView *)self setCachedHeight:0.0];
  double v3 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForDateText");
  BOOL v4 = [(ICNoteEditorDateView *)self label];
  [v4 setFont:v3];

  id v5 = [(ICNoteEditorDateView *)self label];
  uint64_t v6 = [v5 font];
  char v7 = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v7 & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[self.label.font ic_fontHasSingleLineA]" functionName:"-[ICNoteEditorDateView awakeFromNib]" simulateCrash:1 showAlert:0 format:@"font should have a single-line a attribute"];
  }
  id v8 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
  double v9 = [(ICNoteEditorDateView *)self label];
  [v9 setTextColor:v8];

  double v10 = [(ICNoteEditorDateView *)self label];
  [v10 setTextAlignment:1];

  int v11 = [(ICNoteEditorDateView *)self label];
  [v11 setText:&stru_26C10E100];

  double v12 = [(ICNoteEditorDateView *)self label];
  v13 = [v12 textColor];
  v14 = [(ICNoteEditorDateView *)self lockImageView];
  [v14 setTintColor:v13];

  v15 = [(ICNoteEditorDateView *)self lockImageView];
  [v15 setContentMode:1];

  v16 = (void *)MEMORY[0x263F82818];
  v17 = [(ICNoteEditorDateView *)self label];
  v18 = [v17 font];
  v19 = [v16 configurationWithFont:v18 scale:1];
  v20 = [(ICNoteEditorDateView *)self lockImageView];
  [v20 setPreferredSymbolConfiguration:v19];

  v21 = objc_alloc_init(ICNoteDateFormatterController);
  [(ICNoteEditorDateView *)self setFormatterController:v21];

  v22 = [(ICNoteEditorDateView *)self formatterController];
  [v22 setDelegate:self];

  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:self selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x263F83428] object:0];

  v24 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_dateViewDidTap_];
  [(ICNoteEditorDateView *)self addGestureRecognizer:v24];
}

- (double)dateViewMaximumWidth
{
  v2 = [(ICNoteEditorDateView *)self label];
  [v2 preferredMaxLayoutWidth];
  double v4 = v3;

  return v4;
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (UIImageView)lockImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setFormatterController:(id)a3
{
}

- (void)_updateLayout
{
  id v2 = [(ICNoteEditorDateView *)self formatterController];
  [v2 updateDate];
}

- (ICNoteDateFormatterController)formatterController
{
  return self->_formatterController;
}

+ (id)newDateView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F086E0] bundleForClass:a1];
  double v4 = NSStringFromClass((Class)a1);
  id v5 = [v3 loadNibNamed:v4 owner:a1 options:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICNoteEditorDateView newDateView]", 1, 0, @"Unable to load date view", (void)v14);
  id v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (void)v14);

  return v12;
}

- (void)setLockImageView:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorDateView;
  [(ICNoteEditorDateView *)&v4 dealloc];
}

- (void)reset
{
  [(ICNoteEditorDateView *)self setCachedHeight:0.0];
  double v3 = [(ICNoteEditorDateView *)self formatterController];
  [v3 setNote:0];

  id v5 = [(ICNoteEditorDateView *)self note];
  objc_super v4 = [(ICNoteEditorDateView *)self formatterController];
  [v4 setNote:v5];
}

- (void)formatter:(id)a3 iconImageDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteEditorDateView *)self lockImageView];
  [v6 setImage:v5];
}

- (void)dateViewDidTap:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorDateView *)self label];
  [v4 locationInView:v5];
  double v7 = v6;

  uint64_t v8 = [(ICNoteEditorDateView *)self label];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  if (v7 > CGRectGetMinX(v19) + -5.0)
  {
    v20.origin.x = v10;
    v20.origin.y = v12;
    v20.size.width = v14;
    v20.size.height = v16;
    if (v7 < CGRectGetMaxX(v20) + 5.0)
    {
      id v17 = [(ICNoteEditorDateView *)self formatterController];
      [v17 toggleVisibleDateType];
    }
  }
}

- (BOOL)iconHidden
{
  id v2 = [(ICNoteEditorDateView *)self formatterController];
  char v3 = [v2 iconHidden];

  return v3;
}

- (UIFont)font
{
  id v2 = [(ICNoteEditorDateView *)self label];
  char v3 = [v2 font];

  return (UIFont *)v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorDateView;
  id v2 = [(ICNoteEditorDateView *)&v7 accessibilityContainer];
  char v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (![v4 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v5 = [v4 accessibilityContainer];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v4 = v4;

    char v3 = v4;
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v3;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  if ([(ICNoteEditorDateView *)self iconHidden])
  {
    char v3 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    char v3 = [v4 localizedStringForKey:@"Locked Note" value:&stru_26C10E100 table:0];
  }
  uint64_t v5 = [(ICNoteEditorDateView *)self label];
  double v6 = [v5 text];
  objc_super v7 = __ICAccessibilityStringForVariables();

  return v7;
}

- (id)accessibilityUserInputLabels
{
  v12[4] = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 localizedStringForKey:@"Timestamp" value:&stru_26C10E100 table:0];
  v12[0] = v4;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  double v6 = [v5 localizedStringForKey:@"Created" value:&stru_26C10E100 table:0];
  v12[1] = v6;
  objc_super v7 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"Edited" value:&stru_26C10E100 table:0];
  v12[2] = v8;
  double v9 = [(ICNoteEditorDateView *)self accessibilityLabel];
  v12[3] = v9;
  CGFloat v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  return v10;
}

- (BOOL)_accessibilityScrollToVisible
{
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    id v4 = [(ICNoteEditorDateView *)self nextResponder];
    if (v4)
    {
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v5 = [v4 nextResponder];

        id v4 = (id)v5;
        if (!v5) {
          goto LABEL_7;
        }
      }
      id v4 = v4;
    }
LABEL_7:
    [v4 showOverscrollContentAndScrollToTop];
  }
  return IsVoiceOverRunning;
}

- (void)contentSizeCategoryDidChange
{
  [(ICNoteEditorDateView *)self setCachedHeight:0.0];
  char v3 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForDateText");
  uint64_t v4 = [(ICNoteEditorDateView *)self label];
  [(id)v4 setFont:v3];

  uint64_t v5 = [(ICNoteEditorDateView *)self label];
  double v6 = [v5 font];
  LOBYTE(v4) = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v4 & 1) == 0)
  {
    objc_super v7 = (void *)MEMORY[0x263F5AE60];
    [v7 handleFailedAssertWithCondition:"[self.label.font ic_fontHasSingleLineA]" functionName:"-[ICNoteEditorDateView contentSizeCategoryDidChange]" simulateCrash:1 showAlert:0 format:@"font should have a single-line a attribute"];
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewLayoutUpdateDelayer, 0);
  objc_storeStrong((id *)&self->_formatterController, 0);
  objc_destroyWeak((id *)&self->_lockImageView);
  objc_destroyWeak((id *)&self->_label);

  objc_storeStrong((id *)&self->_note, 0);
}

@end