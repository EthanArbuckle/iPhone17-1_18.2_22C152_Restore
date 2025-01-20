@interface PUIStyleTitleLayoutPickerButton
- (PUIStyleTitleLayoutPickerButton)initWithFrame:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation PUIStyleTitleLayoutPickerButton

- (PUIStyleTitleLayoutPickerButton)initWithFrame:(CGRect)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)PUIStyleTitleLayoutPickerButton;
  v3 = -[PUIStylePickerButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v4 = (void *)getPRIncomingCallTextViewAdapterWrapperClass_softClass;
    uint64_t v27 = getPRIncomingCallTextViewAdapterWrapperClass_softClass;
    if (!getPRIncomingCallTextViewAdapterWrapperClass_softClass)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke;
      v23[3] = &unk_265470CF8;
      v23[4] = &v24;
      __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke((uint64_t)v23);
      v4 = (void *)v25[3];
    }
    v5 = v4;
    _Block_object_dispose(&v24, 8);
    uint64_t v6 = [[v5 alloc] initWithName:&stru_270801C00];
    textViewAdapter = v3->_textViewAdapter;
    v3->_textViewAdapter = (PUIIncomingCallTextViewAdapter *)v6;

    v8 = [(PUIIncomingCallTextViewAdapter *)v3->_textViewAdapter viewController];
    v9 = [v8 view];

    [v9 setUserInteractionEnabled:0];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStyleTitleLayoutPickerButton *)v3 addSubview:v9];
    v19 = (void *)MEMORY[0x263F08938];
    v21 = [v9 topAnchor];
    v20 = [(PUIStyleTitleLayoutPickerButton *)v3 topAnchor];
    v10 = [v21 constraintEqualToAnchor:v20 constant:9.0];
    v28[0] = v10;
    v11 = [v9 centerXAnchor];
    v12 = [(PUIStyleTitleLayoutPickerButton *)v3 centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v28[1] = v13;
    v14 = [v9 bottomAnchor];
    v15 = [(PUIStyleTitleLayoutPickerButton *)v3 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:-9.0];
    v28[2] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    [v19 activateConstraints:v17];
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

- (void).cxx_destruct
{
}

@end