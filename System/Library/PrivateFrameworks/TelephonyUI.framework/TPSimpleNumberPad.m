@interface TPSimpleNumberPad
+ (id)_numberPadCharacters;
- (BOOL)showsDeleteButton;
- (Class)numberPadButtonClass;
- (TPSimpleNumberPad)initWithButtons:(id)a3;
- (TPSimpleNumberPad)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (TPSimpleNumberPadDelegate)delegate;
- (void)_deleteButtonClicked:(id)a3 withEvent:(id)a4;
- (void)_updateDeleteButton;
- (void)buttonUp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumberButtonsEnabled:(BOOL)a3;
- (void)setShowsDeleteButton:(BOOL)a3;
@end

@implementation TPSimpleNumberPad

+ (id)_numberPadCharacters
{
  if (_numberPadCharacters_onceToken != -1) {
    dispatch_once(&_numberPadCharacters_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_numberPadCharacters_numberPadCharacters;
  return v2;
}

void __41__TPSimpleNumberPad__numberPadCharacters__block_invoke()
{
  v14[12] = *MEMORY[0x1E4F143B8];
  v13 = [NSNumber numberWithInt:0];
  v14[0] = v13;
  v12 = [NSNumber numberWithInt:1];
  v14[1] = v12;
  v0 = [NSNumber numberWithInt:2];
  v14[2] = v0;
  v1 = [NSNumber numberWithInt:3];
  v14[3] = v1;
  v2 = [NSNumber numberWithInt:4];
  v14[4] = v2;
  v3 = [NSNumber numberWithInt:5];
  v14[5] = v3;
  v4 = [NSNumber numberWithInt:6];
  v14[6] = v4;
  v5 = [NSNumber numberWithInt:7];
  v14[7] = v5;
  v6 = [NSNumber numberWithInt:8];
  v14[8] = v6;
  v7 = [NSNumber numberWithInt:13];
  v14[9] = v7;
  v8 = [NSNumber numberWithInt:10];
  v14[10] = v8;
  v9 = [NSNumber numberWithInt:13];
  v14[11] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:12];
  v11 = (void *)_numberPadCharacters_numberPadCharacters;
  _numberPadCharacters_numberPadCharacters = v10;
}

- (TPSimpleNumberPad)initWithButtons:(id)a3
{
  v5 = [NSString stringWithFormat:@"Please call -[PHVoicemailSetupPINNumberPad initWithFrame:]"];
  NSLog(&cfstr_TuassertionFai.isa, v5);

  if (_TUAssertShouldCrashApplication())
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TPSimpleNumberPad.m" lineNumber:59 description:@"Please call -[PHVoicemailSetupPINNumberPad initWithFrame:]"];
  }
  return 0;
}

- (TPSimpleNumberPad)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = +[TPSimpleNumberPad _numberPadCharacters];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(objc_alloc(-[TPSimpleNumberPad numberPadButtonClass](self, "numberPadButtonClass")), "initForCharacter:style:", (int)objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v16), "intValue"), a4);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v14);
  }

  v45.receiver = self;
  v45.super_class = (Class)TPSimpleNumberPad;
  v18 = [(TPNumberPad *)&v45 initWithButtons:v11];
  v19 = v18;
  if (v18)
  {
    -[TPSimpleNumberPad setFrame:](v18, "setFrame:", x, y, width, height);
    uint64_t v20 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    deleteButton = v19->_deleteButton;
    v19->_deleteButton = (UIButton *)v20;

    [(UIButton *)v19->_deleteButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v19->_deleteButton setBackgroundColor:v22];

    LODWORD(v23) = 1148846080;
    [(UIButton *)v19->_deleteButton setContentCompressionResistancePriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIButton *)v19->_deleteButton setContentCompressionResistancePriority:1 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIButton *)v19->_deleteButton setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(UIButton *)v19->_deleteButton setContentHuggingPriority:1 forAxis:v26];
    v27 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    v28 = [(UIButton *)v19->_deleteButton titleLabel];
    [v28 setFont:v27];

    v29 = v19->_deleteButton;
    v30 = TelephonyUIBundle();
    v31 = [v30 localizedStringForKey:@"DELETE" value:&stru_1F1E807C8 table:@"General"];
    [(UIButton *)v29 setTitle:v31 forState:0];

    v32 = v19->_deleteButton;
    v33 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
    [(UIButton *)v32 setTintColor:v33];

    v34 = v19->_deleteButton;
    v35 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
    [(UIButton *)v34 setTitleColor:v35 forState:0];

    [(UIButton *)v19->_deleteButton addTarget:v19 action:sel__deleteButtonClicked_withEvent_ forControlEvents:64];
    [(TPSimpleNumberPad *)v19 addSubview:v19->_deleteButton];
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v37 = v19->_deleteButton;
    v38 = [v11 objectAtIndexedSubscript:8];
    v39 = [v36 constraintWithItem:v37 attribute:9 relatedBy:0 toItem:v38 attribute:9 multiplier:1.0 constant:0.0];
    [(TPSimpleNumberPad *)v19 addConstraint:v39];

    v40 = (void *)MEMORY[0x1E4F28DC8];
    v41 = v19->_deleteButton;
    v42 = [v11 objectAtIndexedSubscript:10];
    v43 = [v40 constraintWithItem:v41 attribute:10 relatedBy:0 toItem:v42 attribute:10 multiplier:1.0 constant:0.0];
    [(TPSimpleNumberPad *)v19 addConstraint:v43];

    [(TPSimpleNumberPad *)v19 _updateDeleteButton];
  }

  return v19;
}

- (Class)numberPadButtonClass
{
  return (Class)objc_opt_class();
}

- (void)buttonUp:(id)a3
{
  id v7 = a3;
  v4 = [(TPSimpleNumberPad *)self delegate];

  if (v4)
  {
    v5 = [(TPSimpleNumberPad *)self delegate];
    v6 = TPStringForNumberPadCharacter([v7 character]);
    [v5 simpleNumberPad:self buttonPressedWithCharacter:v6];
  }
}

- (void)_deleteButtonClicked:(id)a3 withEvent:(id)a4
{
  v5 = [(TPSimpleNumberPad *)self delegate];

  if (v5)
  {
    id v6 = [(TPSimpleNumberPad *)self delegate];
    [v6 simpleNumberPadDeletePressed:self];
  }
}

- (void)_updateDeleteButton
{
  deleteButton = self->_deleteButton;
  BOOL v4 = [(TPSimpleNumberPad *)self showsDeleteButton];
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  [(UIButton *)deleteButton setAlpha:v5];
  id v6 = self->_deleteButton;
  BOOL v7 = [(TPSimpleNumberPad *)self showsDeleteButton];
  [(UIButton *)v6 setEnabled:v7];
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  if (self->_showsDeleteButton != a3)
  {
    self->_showsDeleteButton = a3;
    [(TPSimpleNumberPad *)self _updateDeleteButton];
  }
}

- (void)setNumberButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TPNumberPad *)self numberButtonsEnabled] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPSimpleNumberPad;
    [(TPNumberPad *)&v15 setNumberButtonsEnabled:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v5 = [(TPNumberPad *)self buttons];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      uint64_t v9 = v3 ^ 1;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setGreyedOut:v9];
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (TPSimpleNumberPadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSimpleNumberPadDelegate *)a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void).cxx_destruct
{
}

@end