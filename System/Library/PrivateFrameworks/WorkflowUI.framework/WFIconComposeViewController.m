@interface WFIconComposeViewController
- (UIView)bottomSeparator;
- (UIView)topSeperator;
- (WFColorPicker)colorPicker;
- (WFGlyphPicker)glyphPicker;
- (WFIconComposePreviewView)iconView;
- (WFIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFWorkflow)workflow;
- (void)colorPicker:(id)a3 didSelectColor:(id)a4;
- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4;
- (void)loadView;
- (void)pickedSegment:(id)a3;
- (void)saveIcon:(id)a3;
- (void)setBottomSeparator:(id)a3;
- (void)setColorPicker:(id)a3;
- (void)setGlyphPicker:(id)a3;
- (void)setIconView:(id)a3;
- (void)setTopSeperator:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)updateAccessibilityValue;
@end

@implementation WFIconComposeViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomSeparator);
  objc_destroyWeak((id *)&self->_topSeperator);
  objc_destroyWeak((id *)&self->_glyphPicker);
  objc_destroyWeak((id *)&self->_colorPicker);
  objc_destroyWeak((id *)&self->_iconView);
  objc_storeStrong((id *)&self->_workflow, 0);
}

- (void)setBottomSeparator:(id)a3
{
}

- (UIView)bottomSeparator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomSeparator);
  return (UIView *)WeakRetained;
}

- (void)setTopSeperator:(id)a3
{
}

- (UIView)topSeperator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topSeperator);
  return (UIView *)WeakRetained;
}

- (void)setGlyphPicker:(id)a3
{
}

- (WFGlyphPicker)glyphPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_glyphPicker);
  return (WFGlyphPicker *)WeakRetained;
}

- (void)setColorPicker:(id)a3
{
}

- (WFColorPicker)colorPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);
  return (WFColorPicker *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (WFIconComposePreviewView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (WFIconComposePreviewView *)WeakRetained;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)colorPicker:(id)a3 didSelectColor:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F854B0];
  id v6 = a4;
  id v7 = [v5 alloc];
  unsigned int v8 = [v6 RGBAValue];

  uint64_t v9 = v8;
  v10 = [(WFIconComposeViewController *)self workflow];
  v11 = [v10 icon];
  uint64_t v12 = [v11 glyphCharacter];
  v13 = [(WFIconComposeViewController *)self workflow];
  v14 = [v13 icon];
  v15 = [v14 customImageData];
  id v16 = (id)[v7 initWithBackgroundColorValue:v9 glyphCharacter:v12 customImageData:v15];

  [(WFIconComposeViewController *)self saveIcon:v16];
}

- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = objc_alloc(MEMORY[0x263F854B0]);
  id v7 = [(WFIconComposeViewController *)self workflow];
  unsigned int v8 = [v7 icon];
  uint64_t v9 = [v8 backgroundColorValue];
  v10 = [(WFIconComposeViewController *)self workflow];
  v11 = [v10 icon];
  uint64_t v12 = [v11 customImageData];
  id v13 = (id)[v6 initWithBackgroundColorValue:v9 glyphCharacter:v4 customImageData:v12];

  [(WFIconComposeViewController *)self saveIcon:v13];
}

- (void)updateAccessibilityValue
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [MEMORY[0x263F851A8] workflowPalette];
    uint64_t v4 = [(WFIconComposeViewController *)self workflow];
    v5 = [v4 icon];
    id v6 = [v5 backgroundColor];
    uint64_t v7 = [v3 indexOfObject:v6];

    unsigned int v8 = [MEMORY[0x263F851A8] workflowPaletteNames];
    id v16 = [v8 objectAtIndex:v7];

    uint64_t v9 = [(WFIconComposeViewController *)self workflow];
    v10 = [v9 icon];
    [v10 glyphCharacter];
    v11 = WFNameForGlyphCharacter();

    uint64_t v12 = NSString;
    id v13 = WFLocalizedString(@"%1$@ glyph, %2$@ background color");
    v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v11, v16);
    v15 = [(WFIconComposeViewController *)self iconView];
    [v15 setAccessibilityValue:v14];
  }
}

- (void)saveIcon:(id)a3
{
  id v4 = a3;
  v5 = [(WFIconComposeViewController *)self workflow];
  [v5 setIcon:v4];

  id v6 = [(WFIconComposeViewController *)self iconView];
  [v6 setIcon:v4];

  [(WFIconComposeViewController *)self updateAccessibilityValue];
  id v7 = [(WFIconComposeViewController *)self workflow];
  [v7 save];
}

- (void)pickedSegment:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFIconComposeViewController *)self colorPicker];
  v11[0] = v5;
  id v6 = [(WFIconComposeViewController *)self glyphPicker];
  v11[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__WFIconComposeViewController_pickedSegment___block_invoke;
  v9[3] = &unk_2649CB730;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __45__WFIconComposeViewController_pickedSegment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "selectedSegmentIndex") != a3);
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
  [(WFIconComposeViewController *)self updateAccessibilityValue];
}

- (void)loadView
{
  v80[2] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)WFIconComposeViewController;
  [(WFIconComposeViewController *)&v77 loadView];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "wf_settingsBackgroundColor");
  id v4 = [(WFIconComposeViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(WFIconComposeViewController *)self view];
  id firstValue = v5;
  [v6 addSubview:v5];

  id v7 = objc_alloc_init(WFIconComposePreviewView);
  [(WFIconComposePreviewView *)v7 setIsAccessibilityElement:1];
  [(WFIconComposePreviewView *)v7 setAccessibilityTraits:*MEMORY[0x263F83270]];
  id v8 = WFLocalizedString(@"Icon Preview");
  [(WFIconComposePreviewView *)v7 setAccessibilityLabel:v8];

  [(WFIconComposePreviewView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = [(WFIconComposeViewController *)self workflow];
  id v10 = [v9 icon];
  [(WFIconComposePreviewView *)v7 setIcon:v10];

  v11 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:7 relatedBy:0 toItem:v7 attribute:8 multiplier:1.0 constant:0.0];
  [(WFIconComposePreviewView *)v7 addConstraint:v11];

  LODWORD(v12) = 1132068864;
  v72 = v7;
  [(WFIconComposePreviewView *)v7 setContentCompressionResistancePriority:1 forAxis:v12];
  [v5 addSubview:v7];
  [(WFIconComposeViewController *)self setIconView:v7];
  id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v13 setBackgroundColor:v14];

  v15 = [(WFIconComposeViewController *)self view];
  [v15 addSubview:v13];

  id v76 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v76 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = [MEMORY[0x263F825C8] separatorColor];
  [v76 setBackgroundColor:v16];

  [v13 addSubview:v76];
  [(WFIconComposeViewController *)self setTopSeperator:v76];
  id v17 = objc_alloc(MEMORY[0x263F82BB0]);
  v18 = WFLocalizedString(@"Color");
  v80[0] = v18;
  v19 = WFLocalizedString(@"Glyph");
  v80[1] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
  v21 = (void *)[v17 initWithItems:v20];

  [v21 addTarget:self action:sel_pickedSegment_ forControlEvents:4096];
  [v21 setSelectedSegmentIndex:0];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v74 = v21;
  [v13 addSubview:v21];
  id v22 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [MEMORY[0x263F825C8] separatorColor];
  [v22 setBackgroundColor:v23];

  [v13 addSubview:v22];
  id v24 = v22;
  v71 = v22;
  [(WFIconComposeViewController *)self setBottomSeparator:v22];
  id v25 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v25 setBackgroundColor:v26];

  v27 = [(WFIconComposeViewController *)self view];
  [v27 addSubview:v25];

  v28 = -[WFGlyphPicker initWithControl:glyphDimension:sectionInset:]([WFGlyphPicker alloc], "initWithControl:glyphDimension:sectionInset:", 0, 36.0, 15.0, 15.0, 15.0, 15.0);
  [(WFGlyphPicker *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFGlyphPicker *)v28 setHidden:1];
  [(WFGlyphPicker *)v28 setDelegate:self];
  v29 = [(WFIconComposeViewController *)self workflow];
  v30 = [v29 icon];
  -[WFGlyphPicker setSelectedGlyphCharacter:](v28, "setSelectedGlyphCharacter:", [v30 glyphCharacter]);

  [v25 addSubview:v28];
  v70 = v28;
  [(WFIconComposeViewController *)self setGlyphPicker:v28];
  v31 = objc_alloc_init(WFColorPicker);
  [(WFColorPicker *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFColorPicker *)v31 setHidden:0];
  [(WFColorPicker *)v31 setDelegate:self];
  v32 = [(WFIconComposeViewController *)self workflow];
  v33 = [v32 icon];
  v34 = [v33 backgroundColor];
  [(WFColorPicker *)v31 setSelectedColor:v34];

  [v25 addSubview:v31];
  [(WFIconComposeViewController *)self setColorPicker:v31];
  [(WFIconComposeViewController *)self updateAccessibilityValue];
  v35 = [(WFIconComposeViewController *)self view];
  v73 = [v35 safeAreaLayoutGuide];

  v36 = _NSDictionaryOfVariableBindings(&cfstr_PreviewviewCon.isa, firstValue, v13, v76, v21, v24, v25, v28, v31, v73, 0);
  v78 = @"separator";
  v37 = NSNumber;
  v38 = [MEMORY[0x263F82B60] mainScreen];
  [v38 scale];
  v40 = [v37 numberWithDouble:1.0 / v39];
  v79 = v40;
  v41 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];

  v42 = [(WFIconComposeViewController *)self view];
  v43 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[previewView]|" options:0 metrics:0 views:v36];
  [v42 addConstraints:v43];

  v44 = [(WFIconComposeViewController *)self view];
  v45 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[previewView(>=50)][controlView(44)][pickerView]|" options:6 metrics:v41 views:v36];
  [v44 addConstraints:v45];

  v46 = [(WFIconComposeViewController *)self view];
  v47 = [MEMORY[0x263F08938] constraintWithItem:firstValue attribute:3 relatedBy:0 toItem:v73 attribute:3 multiplier:1.0 constant:0.0];
  [v46 addConstraint:v47];

  v48 = [(WFIconComposeViewController *)self view];
  v49 = [v25 topAnchor];
  v50 = [v73 bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:-205.0];
  [v48 addConstraint:v51];

  v52 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[glyphPicker]|" options:0 metrics:v41 views:v36];
  [v25 addConstraints:v52];

  v53 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[glyphPicker]|" options:0 metrics:v41 views:v36];
  [v25 addConstraints:v53];

  v54 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[colorPicker(320)]" options:0 metrics:v41 views:v36];
  [v25 addConstraints:v54];

  v55 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[colorPicker]|" options:0 metrics:v41 views:v36];
  [v25 addConstraints:v55];

  v56 = [MEMORY[0x263F08938] constraintWithItem:v31 attribute:9 relatedBy:0 toItem:v25 attribute:9 multiplier:1.0 constant:0.0];
  [v25 addConstraint:v56];

  v57 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[topSeparator(separator)]" options:0 metrics:v41 views:v36];
  [v13 addConstraints:v57];

  v58 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[bottomSeparator(separator)]|" options:0 metrics:v41 views:v36];
  [v13 addConstraints:v58];

  v59 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[topSeparator]|" options:0 metrics:v41 views:v36];
  [v13 addConstraints:v59];

  v60 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[bottomSeparator]|" options:0 metrics:v41 views:v36];
  [v13 addConstraints:v60];

  v61 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[segmentedControl(300)]" options:0 metrics:v41 views:v36];
  [v13 addConstraints:v61];

  v62 = [MEMORY[0x263F08938] constraintWithItem:v74 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];
  [v13 addConstraint:v62];

  v63 = [MEMORY[0x263F08938] constraintWithItem:v74 attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
  [v13 addConstraint:v63];

  v64 = [MEMORY[0x263F08938] constraintWithItem:v72 attribute:9 relatedBy:0 toItem:firstValue attribute:9 multiplier:1.0 constant:0.0];
  [firstValue addConstraint:v64];

  v65 = [MEMORY[0x263F08938] constraintWithItem:v72 attribute:10 relatedBy:0 toItem:firstValue attribute:10 multiplier:1.0 constant:0.0];
  [firstValue addConstraint:v65];

  v66 = [MEMORY[0x263F08938] constraintWithItem:v72 attribute:8 relatedBy:-1 toItem:firstValue attribute:8 multiplier:1.0 constant:-20.0];
  [firstValue addConstraint:v66];

  v67 = (void *)MEMORY[0x263F08938];
  v68 = [(WFIconComposeViewController *)self glyphPicker];
  v69 = [v67 constraintWithItem:v68 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:205.0];
  [(WFGlyphPicker *)v70 addConstraint:v69];
}

- (WFIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WFIconComposeViewController;
  id v4 = [(WFIconComposeViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = WFLocalizedString(@"Icon");
    [(WFIconComposeViewController *)v4 setTitle:v5];

    id v6 = WFLocalizedString(@"Shortcut icon editor");
    id v7 = [(WFIconComposeViewController *)v4 navigationItem];
    [v7 setAccessibilityLabel:v6];

    id v8 = v4;
  }

  return v4;
}

@end