@interface MSDCodeEntryView
+ (id)generatorFieldFont;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (MSDCodeEntryView)initWithDelegate:(id)a3;
- (MSDCodeEntryViewDelegate)delegate;
- (NSArray)activeConstraints;
- (NSArray)generatorFields;
- (NSMutableString)stringValue;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (void)_syncStringValueToLabels;
- (void)clearEntry;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)jiggleAView;
- (void)setActiveConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeneratorFields:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)updateConstraints;
@end

@implementation MSDCodeEntryView

+ (id)generatorFieldFont
{
  uint64_t v2 = *MEMORY[0x263F1D2F8];
  v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2F8]];
  [v3 scaledValueForValue:24.0];
  double v5 = v4;

  v6 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v2 addingSymbolicTraits:0 options:2];
  v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:v5];

  return v7;
}

- (MSDCodeEntryView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSDCodeEntryView;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = -[MSDCodeEntryView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], v6, v7, v8);
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(MSDCodeEntryView *)v9 setStringValue:v10];

    [(MSDCodeEntryView *)v9 setActiveConstraints:0];
    [(MSDCodeEntryView *)v9 setDelegate:v4];
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    v12 = [(id)objc_opt_class() generatorFieldFont];
    [(MSDCodeEntryView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v13 = 6;
    do
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v14 setFont:v12];
      [v14 setText:@"–"];
      [v14 setTextAlignment:1];
      [(MSDCodeEntryView *)v9 addSubview:v14];
      [v11 addObject:v14];

      --v13;
    }
    while (v13);
    v15 = (void *)[v11 copy];
    [(MSDCodeEntryView *)v9 setGeneratorFields:v15];

    LODWORD(v16) = 1144750080;
    [(MSDCodeEntryView *)v9 setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(MSDCodeEntryView *)v9 setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1144750080;
    [(MSDCodeEntryView *)v9 setContentCompressionResistancePriority:1 forAxis:v18];
    LODWORD(v19) = 1132068864;
    [(MSDCodeEntryView *)v9 setContentHuggingPriority:1 forAxis:v19];
  }
  return v9;
}

- (void)clearEntry
{
  v3 = [(MSDCodeEntryView *)self stringValue];
  [v3 setString:&stru_26EC8FB50];

  [(MSDCodeEntryView *)self _syncStringValueToLabels];
}

- (void)jiggleAView
{
  id v13 = [(MSDCodeEntryView *)self layer];
  v3 = [MEMORY[0x263F15890] animation];
  [v3 setMass:1.20000005];
  [v3 setStiffness:1200.0];
  [v3 setDamping:12.0];
  [v3 setDuration:1.39999998];
  [v3 setVelocity:0.0];
  [v3 setFillMode:*MEMORY[0x263F15AA0]];
  [v3 setDelegate:self];
  LODWORD(v4) = 30.0;
  double v5 = [NSNumber numberWithFloat:v4];
  [v3 setFromValue:v5];

  double v6 = [NSNumber numberWithFloat:0.0];
  [v3 setToValue:v6];

  double v7 = [MEMORY[0x263F15918] functionWithName:*MEMORY[0x263F16078]];
  [v3 setValueFunction:v7];

  LODWORD(v8) = 1028389654;
  LODWORD(v9) = 990057071;
  LODWORD(v10) = 1059712716;
  LODWORD(v11) = 1.0;
  v12 = [MEMORY[0x263F15808] functionWithControlPoints:v8 :v9 :v10 :v11];
  [v3 setTimingFunction:v12];

  [v3 setKeyPath:@"transform"];
  [v13 addAnimation:v3 forKey:@"shake"];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)MSDCodeEntryView;
  BOOL v2 = [(MSDCodeEntryView *)&v5 becomeFirstResponder];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C710] activeKeyboard];
    [v3 setReturnKeyEnabled:0];
  }
  return v2;
}

- (int64_t)keyboardType
{
  return 4;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (BOOL)hasText
{
  BOOL v2 = [(MSDCodeEntryView *)self stringValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MSDCodeEntryView *)self stringValue];
  uint64_t v6 = [v5 length];

  if (v6 != 6 && ([v4 isEqualToString:@"\n"] & 1) == 0)
  {
    double v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    double v8 = [v7 invertedSet];

    if ([v4 rangeOfCharacterFromSet:v8] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 length])
      {
        double v9 = [(MSDCodeEntryView *)self stringValue];
        [v9 appendString:v4];

        [(MSDCodeEntryView *)self _syncStringValueToLabels];
        double v10 = [(MSDCodeEntryView *)self stringValue];
        uint64_t v11 = [v10 length];

        if (v11 == 6)
        {
          v12 = dispatch_get_global_queue(21, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __31__MSDCodeEntryView_insertText___block_invoke;
          block[3] = &unk_264D88200;
          block[4] = self;
          dispatch_async(v12, block);
        }
      }
    }
  }
}

void __31__MSDCodeEntryView_insertText___block_invoke(uint64_t a1)
{
  sleep(1u);
  id v3 = [*(id *)(a1 + 32) delegate];
  BOOL v2 = [*(id *)(a1 + 32) stringValue];
  [v3 didEnterCode:v2 forEntry:*(void *)(a1 + 32)];
}

- (void)deleteBackward
{
  id v3 = [(MSDCodeEntryView *)self stringValue];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    objc_super v5 = [(MSDCodeEntryView *)self stringValue];
    uint64_t v6 = [(MSDCodeEntryView *)self stringValue];
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    [(MSDCodeEntryView *)self _syncStringValueToLabels];
  }
}

- (void)updateConstraints
{
  v33[1] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)MSDCodeEntryView;
  [(MSDCodeEntryView *)&v31 updateConstraints];
  id v3 = [(MSDCodeEntryView *)self activeConstraints];

  unint64_t v4 = 0x263F08000uLL;
  if (v3)
  {
    objc_super v5 = (void *)MEMORY[0x263F08938];
    uint64_t v6 = [(MSDCodeEntryView *)self activeConstraints];
    [v5 deactivateConstraints:v6];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = 0;
  uint64_t v9 = *MEMORY[0x263F1D2F8];
  do
  {
    unint64_t v10 = v4;
    uint64_t v11 = *(void **)(v4 + 2360);
    if (v8)
    {
      v12 = [(MSDCodeEntryView *)self generatorFields];
      id v13 = [v12 objectAtIndexedSubscript:v8];
      v14 = [(MSDCodeEntryView *)self generatorFields];
      v15 = [v14 firstObject];
      double v16 = [v11 constraintWithItem:v13 attribute:11 relatedBy:0 toItem:v15 attribute:11 multiplier:1.0 constant:0.0];
      [v7 addObject:v16];
    }
    else
    {
      v32 = @"generatorLabel";
      v12 = [(MSDCodeEntryView *)self generatorFields];
      id v13 = [v12 objectAtIndexedSubscript:0];
      v33[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v15 = [v11 constraintsWithVisualFormat:@"V:|[generatorLabel]|" options:0 metrics:0 views:v14];
      [v7 addObjectsFromArray:v15];
    }

    unint64_t v4 = v10;
    double v17 = *(void **)(v10 + 2360);
    double v18 = [(MSDCodeEntryView *)self generatorFields];
    double v19 = [v18 objectAtIndexedSubscript:v8];
    v20 = [MEMORY[0x263F1C668] metricsForTextStyle:v9];
    [v20 scaledValueForValue:14.5];
    v22 = [v17 constraintWithItem:v19 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v21];
    [v7 addObject:v22];

    v23 = [(MSDCodeEntryView *)self generatorFields];
    v24 = [v23 objectAtIndexedSubscript:v8];
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"codeGeneratorLabel%d", v8);
    [v30 setObject:v24 forKey:v25];

    ++v8;
  }
  while (v8 != 6);
  v26 = [*(id *)(v10 + 2360) constraintsWithVisualFormat:@"|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|" options:0x10000 metrics:&unk_26EC99160 views:v30];
  [v7 addObjectsFromArray:v26];
  v27 = (void *)[v7 copy];
  [(MSDCodeEntryView *)self setActiveConstraints:v27];

  v28 = *(void **)(v10 + 2360);
  v29 = [(MSDCodeEntryView *)self activeConstraints];
  [v28 activateConstraints:v29];
}

- (void)_syncStringValueToLabels
{
  for (unint64_t i = 0; i != 6; ++i)
  {
    unint64_t v4 = [(MSDCodeEntryView *)self stringValue];
    unint64_t v5 = [v4 length];

    if (i >= v5)
    {
      uint64_t v6 = [(MSDCodeEntryView *)self generatorFields];
      id v7 = [v6 objectAtIndexedSubscript:i];
      [v7 setText:@"–"];
    }
    else
    {
      uint64_t v6 = [(MSDCodeEntryView *)self stringValue];
      id v7 = objc_msgSend(v6, "substringWithRange:", i, 1);
      uint64_t v8 = [(MSDCodeEntryView *)self generatorFields];
      uint64_t v9 = [v8 objectAtIndexedSubscript:i];
      [v9 setText:v7];
    }
  }
  [(MSDCodeEntryView *)self setNeedsUpdateConstraints];
}

- (NSMutableString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSArray)generatorFields
{
  return self->_generatorFields;
}

- (void)setGeneratorFields:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (MSDCodeEntryViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_generatorFields, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end