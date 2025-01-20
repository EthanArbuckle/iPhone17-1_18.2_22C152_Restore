@interface WFGlyphPickerCell
- (BOOL)isAccessibilityElement;
- (BOOL)outline;
- (WFGlyphPickerCell)initWithFrame:(CGRect)a3;
- (WFGlyphView)glyphView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)glyphCharacter;
- (void)setGlyphCharacter:(unsigned __int16)a3;
- (void)setGlyphView:(id)a3;
- (void)setOutline:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation WFGlyphPickerCell

- (void).cxx_destruct
{
}

- (void)setGlyphView:(id)a3
{
}

- (WFGlyphView)glyphView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_glyphView);
  return (WFGlyphView *)WeakRetained;
}

- (id)accessibilityLabel
{
  [(WFGlyphPickerCell *)self glyphCharacter];
  return (id)WFNameForGlyphCharacter();
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F83260];
  int v3 = [(WFGlyphPickerCell *)self isSelected];
  uint64_t v4 = *MEMORY[0x263F832A8];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFGlyphPickerCell;
  -[WFGlyphPickerCell setSelected:](&v7, sel_setSelected_);
  if (v3) {
    [MEMORY[0x263F825C8] systemGray5Color];
  }
  else {
  v5 = [MEMORY[0x263F825C8] clearColor];
  }
  v6 = [(WFGlyphPickerCell *)self contentView];
  [v6 setBackgroundColor:v5];
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(WFGlyphPickerCell *)self glyphView];
  [v5 setGlyphCharacter:v3];

  id v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v6 = [(WFGlyphPickerCell *)self glyphView];
  [v6 setGlyphColor:v7];
}

- (unsigned)glyphCharacter
{
  uint64_t v2 = [(WFGlyphPickerCell *)self glyphView];
  unsigned __int16 v3 = [v2 glyphCharacter];

  return v3;
}

- (void)setOutline:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFGlyphPickerCell *)self glyphView];
  [v4 setOutline:v3];
}

- (BOOL)outline
{
  uint64_t v2 = [(WFGlyphPickerCell *)self glyphView];
  char v3 = [v2 outline];

  return v3;
}

- (WFGlyphPickerCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)WFGlyphPickerCell;
  char v3 = -[WFGlyphPickerCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(WFGlyphView);
    -[WFGlyphView setGlyphInsets:](v4, "setGlyphInsets:", 8.0, 8.0, 8.0, 8.0);
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(WFGlyphView *)v4 setBackgroundColor:v5];

    [(WFGlyphView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(WFGlyphPickerCell *)v3 contentView];
    [v6 addSubview:v4];

    objc_storeWeak((id *)&v3->_glyphView, v4);
    id v7 = [MEMORY[0x263F825C8] clearColor];
    v8 = [(WFGlyphPickerCell *)v3 contentView];
    [v8 setBackgroundColor:v7];

    v9 = [(WFGlyphPickerCell *)v3 contentView];
    v10 = [v9 layer];
    [v10 setCornerRadius:10.0];

    uint64_t v11 = *MEMORY[0x263F15A20];
    v12 = [(WFGlyphPickerCell *)v3 contentView];
    v13 = [v12 layer];
    [v13 setCornerCurve:v11];

    v14 = _NSDictionaryOfVariableBindings(&cfstr_Glyphview.isa, v4, 0);
    v15 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[glyphView]|" options:0 metrics:0 views:v14];
    [(WFGlyphPickerCell *)v3 addConstraints:v15];

    v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[glyphView]|" options:0 metrics:0 views:v14];
    [(WFGlyphPickerCell *)v3 addConstraints:v16];

    v17 = v3;
  }

  return v3;
}

@end