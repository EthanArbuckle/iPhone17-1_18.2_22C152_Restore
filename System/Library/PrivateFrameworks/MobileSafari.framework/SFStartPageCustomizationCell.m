@interface SFStartPageCustomizationCell
- (BOOL)isOn;
- (SFStartPageCustomizationCell)initWithFrame:(CGRect)a3;
- (SFStartPageCustomizationCellDelegate)delegate;
- (void)setAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)valueDidChange:(id)a3;
@end

@implementation SFStartPageCustomizationCell

- (SFStartPageCustomizationCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFStartPageCustomizationCell;
  v3 = -[SFStartPageCustomizationCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    v5 = v3->_switch;
    v3->_switch = v4;

    [(UISwitch *)v3->_switch addTarget:v3 action:sel_valueDidChange_ forControlEvents:4096];
    [(SFStartPageCustomizationCell *)v3 setAccessories:MEMORY[0x1E4F1CBF0]];
    v6 = v3;
  }

  return v3;
}

- (BOOL)isOn
{
  return [(UISwitch *)self->_switch isOn];
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self->_switch;
  uint64_t v5 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];

  [(UISwitch *)v4 setOn:v3 animated:v5];
}

- (void)setAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [v4 count];

  if (v6) {
    double v7 = 12.0;
  }
  else {
    double v7 = 0.0;
  }
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1500]), "sf_initWithCustomView:placement:trailingPadding:", self->_switch, 1, v7);
  [v5 insertObject:v8 atIndex:0];
  v9.receiver = self;
  v9.super_class = (Class)SFStartPageCustomizationCell;
  [(SFStartPageCustomizationCell *)&v9 setAccessories:v5];
}

- (void)valueDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageCustomizationCellDidChangeValue:self];
  }
}

- (SFStartPageCustomizationCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFStartPageCustomizationCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_switch, 0);
}

@end