@interface SBFluidSwitcherModifierTimelineEntryView
- (SBFluidSwitcherModifierTimelineEntryView)initWithFrame:(CGRect)a3 entry:(id)a4;
- (SBFluidSwitcherModifierTimelineEntryViewDelegate)delegate;
- (SBSwitcherModifierTimelineEntry)entry;
- (double)_randomFloatFromSeed:(unint64_t)a3 min:(double)a4 max:(double)a5;
- (id)_appendRecursiveDescriptionToString:(id)a3 level:(unint64_t)a4 snapshot:(id)a5;
- (id)_attributedStringsForStack:(id)a3;
- (id)_randomColorWithSeed:(unint64_t)a3;
- (void)_tap:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEntry:(id)a3;
@end

@implementation SBFluidSwitcherModifierTimelineEntryView

- (SBFluidSwitcherModifierTimelineEntryView)initWithFrame:(CGRect)a3 entry:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SBFluidSwitcherModifierTimelineEntryView;
  v11 = -[SBFluidSwitcherModifierTimelineEntryView initWithFrame:](&v61, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a4);
    id v13 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
    nameLabel = v12->_nameLabel;
    v12->_nameLabel = (UILabel *)v18;

    v20 = v12->_nameLabel;
    v21 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
    [(UILabel *)v20 setFont:v21];

    v22 = v12->_nameLabel;
    v23 = [MEMORY[0x1E4F428B8] darkGrayColor];
    [(UILabel *)v22 setTextColor:v23];

    [(UILabel *)v12->_nameLabel setTextAlignment:1];
    v24 = v12->_nameLabel;
    v25 = [v10 eventSnapshot];
    v26 = [v25 eventName];
    [(UILabel *)v24 setText:v26];

    [(SBFluidSwitcherModifierTimelineEntryView *)v12 addSubview:v12->_nameLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v14, v15, v16, v17);
    actionsLabel = v12->_actionsLabel;
    v12->_actionsLabel = (UILabel *)v27;

    [(UILabel *)v12->_actionsLabel setNumberOfLines:0];
    v29 = v12->_actionsLabel;
    v30 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    [(UILabel *)v29 setFont:v30];

    v60 = v12->_actionsLabel;
    v31 = v10;
    v32 = NSString;
    v33 = [v31 responseSnapshot];
    v34 = [v33 responseNames];
    uint64_t v35 = [v34 count];
    v36 = [v31 responseSnapshot];
    v37 = [v36 responseNames];
    v38 = [v37 componentsJoinedByString:@"\n• "];
    v39 = [v32 stringWithFormat:@"Responses: (%lu)\n• %@", v35, v38];
    [(UILabel *)v60 setText:v39];

    id v10 = v31;
    [(SBFluidSwitcherModifierTimelineEntryView *)v12 addSubview:v12->_actionsLabel];
    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v14, v15, v16, v17);
    postStackLabel = v12->_postStackLabel;
    v12->_postStackLabel = (UILabel *)v40;

    [(UILabel *)v12->_postStackLabel setNumberOfLines:0];
    v42 = v12->_postStackLabel;
    v43 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    [(UILabel *)v42 setFont:v43];

    id v44 = objc_alloc(MEMORY[0x1E4F28E48]);
    v45 = NSString;
    v46 = [v31 stackSnapshotAfterEvent];
    v47 = objc_msgSend(v45, "stringWithFormat:", @"Resulting Modifier Stack: (%lu)\n", objc_msgSend(v46, "countOfAllChildSnapshots"));
    v48 = (void *)[v44 initWithString:v47];

    v49 = [v10 stackSnapshotAfterEvent];
    v50 = [(SBFluidSwitcherModifierTimelineEntryView *)v12 _attributedStringsForStack:v49];
    [v48 appendAttributedString:v50];

    [(UILabel *)v12->_postStackLabel setAttributedText:v48];
    [(SBFluidSwitcherModifierTimelineEntryView *)v12 addSubview:v12->_postStackLabel];
    uint64_t v51 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v12 action:sel__tap_];
    tapRecognizer = v12->_tapRecognizer;
    v12->_tapRecognizer = (UITapGestureRecognizer *)v51;

    [(SBFluidSwitcherModifierTimelineEntryView *)v12 addGestureRecognizer:v12->_tapRecognizer];
    v53 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(SBFluidSwitcherModifierTimelineEntryView *)v12 setBackgroundColor:v53];

    v54 = [(SBFluidSwitcherModifierTimelineEntryView *)v12 layer];
    [v54 setCornerRadius:20.0];

    v55 = [(SBFluidSwitcherModifierTimelineEntryView *)v12 layer];
    [v55 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v56 = [(SBFluidSwitcherModifierTimelineEntryView *)v12 layer];
    [v56 setShadowRadius:10.0];

    v57 = [(SBFluidSwitcherModifierTimelineEntryView *)v12 layer];
    LODWORD(v58) = 1045220557;
    [v57 setShadowOpacity:v58];

    [(SBFluidSwitcherModifierTimelineEntryView *)v12 setClipsToBounds:0];
  }

  return v12;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherModifierTimelineEntryView;
  [(SBFluidSwitcherModifierTimelineEntryView *)&v12 layoutSubviews];
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, 10.0, 250.0, 25.0);
  [(UILabel *)self->_nameLabel frame];
  double v4 = v3 + 10.0 + 10.0;
  -[UILabel sizeThatFits:](self->_postStackLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[UILabel setFrame:](self->_postStackLabel, "setFrame:", 5.0, v4, 240.0, v5);
  [(UILabel *)self->_postStackLabel frame];
  double v7 = v4 + v6 + 10.0;
  -[UILabel sizeThatFits:](self->_actionsLabel, "sizeThatFits:", 250.0, 1.79769313e308);
  -[UILabel setFrame:](self->_actionsLabel, "setFrame:", 5.0, v7, v8, v9);
  [(UILabel *)self->_actionsLabel frame];
  [(SBFluidSwitcherModifierTimelineEntryView *)self frame];
  double v11 = v10;
  [(SBFluidSwitcherModifierTimelineEntryView *)self frame];
  [(SBFluidSwitcherModifierTimelineEntryView *)self setFrame:v11];
}

- (void)_tap:(id)a3
{
  id v4 = [(SBFluidSwitcherModifierTimelineEntryView *)self delegate];
  [v4 didSelectEntryView:self];
}

- (id)_attributedStringsForStack:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  double v6 = [(SBFluidSwitcherModifierTimelineEntryView *)self _appendRecursiveDescriptionToString:v5 level:0 snapshot:v4];

  return v6;
}

- (id)_appendRecursiveDescriptionToString:(id)a3 level:(unint64_t)a4 snapshot:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = objc_opt_new();
  if (a4)
  {
    unint64_t v11 = a4;
    do
    {
      [v10 appendString:@"   "];
      --v11;
    }
    while (v11);
  }
  [v10 appendString:@"• "];
  objc_super v12 = [v9 modifierName];
  uint64_t v13 = -[SBFluidSwitcherModifierTimelineEntryView _randomColorWithSeed:](self, "_randomColorWithSeed:", [v12 hash]);
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v34 = *MEMORY[0x1E4F42510];
  v35[0] = v13;
  uint64_t v27 = (void *)v13;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  double v16 = (void *)[v14 initWithString:v12 attributes:v15];

  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
  [v8 appendAttributedString:v17];

  [v8 appendAttributedString:v16];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  [v8 appendAttributedString:v18];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v28 = v9;
  v19 = [v9 childSnapshots];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    unint64_t v23 = a4 + 1;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        id v25 = [(SBFluidSwitcherModifierTimelineEntryView *)self _appendRecursiveDescriptionToString:v8 level:v23 snapshot:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }

  return v8;
}

- (id)_randomColorWithSeed:(unint64_t)a3
{
  double v5 = (void *)MEMORY[0x1E4F428B8];
  -[SBFluidSwitcherModifierTimelineEntryView _randomFloatFromSeed:min:max:](self, "_randomFloatFromSeed:min:max:", 0.0, 1.0);
  double v7 = v6;
  [(SBFluidSwitcherModifierTimelineEntryView *)self _randomFloatFromSeed:a3 min:0.4 max:0.9];
  double v9 = v8;
  [(SBFluidSwitcherModifierTimelineEntryView *)self _randomFloatFromSeed:a3 min:0.6 max:1.0];
  return (id)[v5 colorWithHue:v7 saturation:v9 brightness:v10 alpha:1.0];
}

- (double)_randomFloatFromSeed:(unint64_t)a3 min:(double)a4 max:(double)a5
{
  return a4 + (double)(-1640531534 * a3) * 2.32830644e-10 * (a5 - a4);
}

- (SBSwitcherModifierTimelineEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (SBFluidSwitcherModifierTimelineEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherModifierTimelineEntryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_actionsLabel, 0);
  objc_storeStrong((id *)&self->_postStackLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end