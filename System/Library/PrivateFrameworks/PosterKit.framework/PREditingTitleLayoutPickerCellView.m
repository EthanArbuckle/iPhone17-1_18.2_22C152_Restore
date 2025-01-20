@interface PREditingTitleLayoutPickerCellView
- (PREditingTitleLayoutPickerCellView)initWithFrame:(CGRect)a3;
- (PRIncomingCallTextViewAdapter)textViewAdapter;
- (void)setFont:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation PREditingTitleLayoutPickerCellView

- (PREditingTitleLayoutPickerCellView)initWithFrame:(CGRect)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PREditingTitleLayoutPickerCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[PRIncomingCallTextViewAdapter alloc] initWithName:&stru_1ED9A3120];
    textViewAdapter = v3->_textViewAdapter;
    v3->_textViewAdapter = v4;

    v6 = [(PRIncomingCallTextViewAdapter *)v3->_textViewAdapter viewController];
    v7 = [v6 view];

    [v7 setUserInteractionEnabled:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditingTitleLayoutPickerCellView *)v3 addSubview:v7];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [v7 topAnchor];
    v18 = [(PREditingTitleLayoutPickerCellView *)v3 topAnchor];
    v8 = [v19 constraintEqualToAnchor:v18 constant:9.0];
    v21[0] = v8;
    v9 = [v7 centerXAnchor];
    v10 = [(PREditingTitleLayoutPickerCellView *)v3 centerXAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v21[1] = v11;
    v12 = [v7 bottomAnchor];
    v13 = [(PREditingTitleLayoutPickerCellView *)v3 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:-9.0];
    v21[2] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    [v17 activateConstraints:v15];
  }
  return v3;
}

- (void)setFont:(id)a3
{
}

- (void)setLayout:(unint64_t)a3
{
}

- (void)setText:(id)a3
{
}

- (PRIncomingCallTextViewAdapter)textViewAdapter
{
  return self->_textViewAdapter;
}

- (void).cxx_destruct
{
}

@end