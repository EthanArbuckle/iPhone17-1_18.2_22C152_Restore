@interface UIKeyboardEmojiSplitCategoryPicker
- (BOOL)whiteText;
- (UIKeyboardEmojiSplitCategoryPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (id)symbolForRow:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForRow:(int64_t)a3 fallback:(BOOL)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setRenderConfig:(id)a3;
- (void)setWhiteText:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCategorySelectedIndicator:(int64_t)a3;
- (void)updateToCategory:(int64_t)a3;
@end

@implementation UIKeyboardEmojiSplitCategoryPicker

- (UIKeyboardEmojiSplitCategoryPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  v13 = -[UIKeyboardEmojiSplit initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    [v12 setClipCorners:10];
    [(UIKBKeyView *)v13 updateForKeyplane:v11 key:v12];
    v14 = [(UIKeyboardEmojiSplit *)v13 picker];
    [v14 setDelegate:v13];

    v15 = [(UIKeyboardEmojiSplit *)v13 picker];
    [v15 setDataSource:v13];

    v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 6.0);
    v17 = [(UIKeyboardEmojiSplit *)v13 picker];
    [v17 setTableHeaderView:v16];

    v18 = [(UIKeyboardEmojiSplit *)v13 picker];
    [v18 setTableFooterView:v16];

    v19 = [(UIKeyboardEmojiSplit *)v13 picker];
    [v19 setScrollEnabled:1];

    v13->_whiteText = 0;
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v13 selector:sel_receiveNotifictaion_ name:@"UIKeyboardEmojiDidScrollNotification" object:0];

    v21 = v13;
  }

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardEmojiDidScrollNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  [(UIKBKeyView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  [(UIView *)&v18 didMoveToWindow];
  v3 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  objc_super v4 = [v3 lastViewedCategory];
  self->_double currentSelected = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v4 categoryType]);

  v5 = [(UIKeyboardEmojiSplit *)self picker];
  double currentSelected = (double)(uint64_t)self->_currentSelected;
  v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v8 = [v7 preferencesActions];
  [v8 rivenSizeFactor:34.0];
  double v10 = v9 * currentSelected;
  id v11 = [(UIKeyboardEmojiSplit *)self picker];
  [v11 contentSize];
  double v13 = v12;
  double v14 = (double)(uint64_t)self->_currentSelected;
  v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v16 = [v15 preferencesActions];
  [v16 rivenSizeFactor:34.0];
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0, 0.0, v10, v13, v17 * v14);
}

- (void)updateToCategory:(int64_t)a3
{
  self->_lastUsedCategordouble y = a3;
  self->_double currentSelected = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:");
  [(UIKeyboardEmojiSplitCategoryPicker *)self updateCategorySelectedIndicator:a3];
}

- (void)updateCategorySelectedIndicator:(int64_t)a3
{
  v5 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = [(UIKeyboardEmojiSplit *)self picker];
      double v9 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
      double v10 = [v8 cellForRowAtIndexPath:v9];

      objc_msgSend(v10, "setPressIndicatorHidden:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", i) != a3);
    }
  }
  id v11 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  int64_t v12 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", [v11 count] - 6);

  if (v12 == a3)
  {
    id v29 = [(UIKeyboardEmojiSplit *)self picker];
    double v13 = [(UIKeyboardEmojiSplit *)self picker];
    [v13 contentSize];
    double v15 = v14;
    v16 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v17 = [v16 preferencesActions];
    [v17 rivenSizeFactor:34.0];
    objc_msgSend(v29, "scrollRectToVisible:animated:", 1, 0.0, 0.0, v15, v18);
  }
  else
  {
    if (+[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:5] != a3)return; {
    id v29 = [(UIKeyboardEmojiSplit *)self picker];
    }
    double v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v16 = [v13 preferencesActions];
    [v16 rivenSizeFactor:34.0];
    double v20 = v19 * 3.0;
    double v17 = [(UIKeyboardEmojiSplit *)self picker];
    [v17 contentSize];
    double v22 = v21;
    objc_super v23 = [(UIKeyboardEmojiSplit *)self picker];
    [v23 contentSize];
    double v25 = v24;
    v26 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v27 = [v26 preferencesActions];
    [v27 rivenSizeFactor:34.0];
    objc_msgSend(v29, "scrollRectToVisible:animated:", 1, 0.0, v20, v22, v25 - v28);
  }
}

- (id)titleForRow:(int64_t)a3 fallback:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = _MergedGlobals_11_10;
  if (!_MergedGlobals_11_10)
  {
    v7 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = __59__UIKeyboardEmojiSplitCategoryPicker_titleForRow_fallback___block_invoke;
    double v22 = &unk_1E52F9E90;
    id v10 = v8;
    id v23 = v10;
    id v11 = v9;
    id v24 = v11;
    [v7 enumerateObjectsUsingBlock:&v19];
    int64_t v12 = (void *)_MergedGlobals_11_10;
    _MergedGlobals_11_10 = (uint64_t)v10;
    id v13 = v10;

    double v14 = (void *)qword_1EB25D3B8;
    qword_1EB25D3B8 = (uint64_t)v11;
    id v15 = v11;

    uint64_t v6 = _MergedGlobals_11_10;
  }
  if (v4) {
    v16 = (void *)qword_1EB25D3B8;
  }
  else {
    v16 = (void *)v6;
  }
  double v17 = objc_msgSend(v16, "objectAtIndex:", a3, v19, v20, v21, v22);
  return v17;
}

void __59__UIKeyboardEmojiSplitCategoryPicker_titleForRow_fallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  BOOL v4 = *(void **)(a1 + 32);
  v5 = +[UIKeyboardEmojiCategory displayName:v3];
  [v4 addObject:v5];

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = +[UIKeyboardEmojiCategory fallbackDisplayName:v3];
  [v6 addObject:v7];
}

- (id)symbolForRow:(int64_t)a3
{
  BOOL v4 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:a3]);
  v5 = [(UIKBKeyView *)self renderConfig];
  uint64_t v6 = +[UIKeyboardEmojiGraphics emojiCategoryImagePath:v4 forRenderConfig:v5];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = -[UIKeyboardEmojiSplitCategoryPicker titleForRow:fallback:](self, "titleForRow:fallback:", [v5 row], 0);
  id v7 = [[UIKeyboardEmojiSplitCategoryCell alloc] initWithStyle:0 reuseIdentifier:v6];
  v8 = -[UIKeyboardEmojiSplitCategoryPicker symbolForRow:](self, "symbolForRow:", [v5 row]);
  double v9 = _UIImageWithName(v8);
  id v10 = [(UIKeyboardEmojiSplitCategoryCell *)v7 symbol];
  [v10 setImage:v9];

  uint64_t v35 = *(void *)off_1E52D2040;
  id v11 = [off_1E52D39B8 systemFontOfSize:14.0];
  v36[0] = v11;
  int64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  [v6 sizeWithAttributes:v12];
  double v14 = v13;

  id v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v16 = [v15 preferencesActions];
  [v16 rivenSizeFactor:ceil(v14)];
  double v18 = v17;
  uint64_t v19 = [(UIKeyboardEmojiSplitCategoryCell *)v7 title];
  [v19 bounds];
  double v21 = v20;

  if (v18 > v21)
  {
    uint64_t v22 = -[UIKeyboardEmojiSplitCategoryPicker titleForRow:fallback:](self, "titleForRow:fallback:", [v5 row], 1);

    uint64_t v6 = (void *)v22;
  }
  [(UIKeyboardEmojiSplitCategoryCell *)v7 setTitleText:v6];
  -[UIKeyboardEmojiSplitCategoryCell setPressIndicatorHidden:](v7, "setPressIndicatorHidden:", [v5 row] != self->_currentSelected);
  BOOL v23 = [(UIKeyboardEmojiSplitCategoryPicker *)self whiteText];
  id v24 = [(UIKeyboardEmojiSplitCategoryCell *)v7 symbol];
  double v25 = [v24 image];
  if (v23)
  {
    v26 = +[UIColor whiteColor];
    v27 = [v25 _flatImageWithColor:v26];
    double v28 = [(UIKeyboardEmojiSplitCategoryCell *)v7 symbol];
    [v28 setImage:v27];

    +[UIColor whiteColor];
  }
  else
  {
    id v29 = +[UIColor blackColor];
    v30 = [v25 _flatImageWithColor:v29];
    v31 = [(UIKeyboardEmojiSplitCategoryCell *)v7 symbol];
    [v31 setImage:v30];

    +[UIColor blackColor];
  v32 = };
  v33 = [(UIKeyboardEmojiSplitCategoryCell *)v7 title];
  [v33 setTextColor:v32];

  [(UIKeyboardEmojiSplitCategoryCell *)v7 setSelectedCircleBlendMode:[(UIKeyboardEmojiSplitCategoryPicker *)self whiteText] ^ 1];
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", [v5 row]);
  id v7 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v7 reloadForCategory:v6 withSender:self];

  unint64_t v8 = [v5 row];
  self->_double currentSelected = v8;
  [(UIKeyboardEmojiSplitCategoryPicker *)self updateCategorySelectedIndicator:v6];
  id v10 = +[UIKeyboardImpl activeInstance];
  double v9 = [v10 feedbackGenerator];
  [v9 actionOccurred:1];
}

- (void)setRenderConfig:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  id v4 = a3;
  [(UIKBKeyView *)&v8 setRenderConfig:v4];
  uint64_t v5 = objc_msgSend(v4, "whiteText", v8.receiver, v8.super_class);

  [(UIKeyboardEmojiSplitCategoryPicker *)self setWhiteText:v5];
  int64_t v6 = [(UIKeyboardEmojiSplit *)self picker];
  [v6 reloadData];

  id v7 = [(UIKeyboardEmojiSplit *)self picker];
  [v7 setNeedsDisplay];

  if (self->_lastUsedCategory) {
    -[UIKeyboardEmojiSplitCategoryPicker updateCategorySelectedIndicator:](self, "updateCategorySelectedIndicator:");
  }
}

- (BOOL)whiteText
{
  return self->_whiteText;
}

- (void)setWhiteText:(BOOL)a3
{
  self->_whiteText = a3;
}

@end