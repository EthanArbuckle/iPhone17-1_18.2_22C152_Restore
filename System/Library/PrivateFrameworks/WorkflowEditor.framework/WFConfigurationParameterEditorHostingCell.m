@interface WFConfigurationParameterEditorHostingCell
- (MTVisualStylingProvider)fillProvider;
- (MTVisualStylingProvider)strokeProvider;
- (UIColor)cardBackgroundColor;
- (UIColor)labelColor;
- (UIColor)overridingBackgroundColor;
- (UIView)highlighedBackgroundView;
- (WFConfigurationParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)applyStylingWithStrokeProvider:(id)a3 fillProvider:(id)a4 cardBackgroundColor:(id)a5;
- (void)reconfigureModernView;
- (void)setCardBackgroundColor:(id)a3;
- (void)setFillProvider:(id)a3;
- (void)setHighlighedBackgroundView:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setOverridingBackgroundColor:(id)a3;
- (void)setStrokeProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFConfigurationParameterEditorHostingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_highlighedBackgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
}

- (void)setOverridingBackgroundColor:(id)a3
{
}

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setHighlighedBackgroundView:(id)a3
{
}

- (UIView)highlighedBackgroundView
{
  return self->_highlighedBackgroundView;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (UIColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFConfigurationParameterEditorHostingCell;
  [(WFParameterEditorHostingCell *)&v8 traitCollectionDidChange:v4];
  v5 = [(WFConfigurationParameterEditorHostingCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(WFParameterEditorHostingCell *)self updateContext];
  }
}

- (void)reconfigureModernView
{
  v3 = [(WFParameterEditorHostingCell *)self model];
  id v4 = [(WFParameterEditorHostingCell *)self modernHostingView];
  objc_initWeak(&location, self);
  v5 = [v3 parameter];
  uint64_t v6 = [v3 state];
  uint64_t v7 = [v3 becomeFirstResponder];
  uint64_t v8 = [v3 widgetFamily];
  v9 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
  v10 = [(WFConfigurationParameterEditorHostingCell *)self overridingBackgroundColor];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__WFConfigurationParameterEditorHostingCell_reconfigureModernView__block_invoke;
  v12[3] = &unk_264BFDB10;
  objc_copyWeak(&v13, &location);
  [v4 configureConfigurationUIViewWithParameter:v5 state:v6 processing:1 shouldFocus:v7 variableProvider:0 widgetFamily:v8 fillProvider:v9 overridingCellBackgroundColor:v10 updateBlock:v12];

  v11 = [(WFParameterEditorHostingCell *)self delegate];
  [v11 parameterEditorCellDidInvalidateSize:self];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __66__WFConfigurationParameterEditorHostingCell_reconfigureModernView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained updatedParameterState:v5 isUIUpdate:a3];
}

- (void)applyStylingWithStrokeProvider:(id)a3 fillProvider:(id)a4 cardBackgroundColor:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  [(WFConfigurationParameterEditorHostingCell *)self setCardBackgroundColor:v9];
  [(WFConfigurationParameterEditorHostingCell *)self setStrokeProvider:v10];
  [(WFConfigurationParameterEditorHostingCell *)self setFillProvider:v8];
}

- (void)setCardBackgroundColor:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_cardBackgroundColor, a3);
  id v5 = [(WFConfigurationParameterEditorHostingCell *)self cardBackgroundColor];
  [v5 CGColor];
  WFCGColorPerceivedLightness();
  double v7 = v6;

  id v8 = [(WFConfigurationParameterEditorHostingCell *)self cardBackgroundColor];
  if (v8 && ((v8, v7 < 0.15) || v7 > 0.95))
  {
    id v9 = [MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
    [(WFConfigurationParameterEditorHostingCell *)self setOverridingBackgroundColor:v9];
  }
  else
  {
    [(WFConfigurationParameterEditorHostingCell *)self setOverridingBackgroundColor:0];
  }
}

- (void)setFillProvider:(id)a3
{
  id v5 = a3;
  id v6 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqual:v7];

      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v10 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
    v11 = [(WFConfigurationParameterEditorHostingCell *)self highlighedBackgroundView];
    [v10 stopAutomaticallyUpdatingView:v11];

    v12 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
    id v13 = [(WFConfigurationParameterEditorHostingCell *)self backgroundView];
    [v12 stopAutomaticallyUpdatingView:v13];

    objc_storeStrong((id *)&self->_fillProvider, a3);
    if (v8)
    {
      v14 = [(WFConfigurationParameterEditorHostingCell *)self highlighedBackgroundView];
    }
    else
    {
      v14 = 0;
    }
    [(WFConfigurationParameterEditorHostingCell *)self setSelectedBackgroundView:v14];
    if (v8) {

    }
    objc_initWeak(&location, self);
    v15 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
    v16 = [(WFConfigurationParameterEditorHostingCell *)self backgroundView];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke;
    v22 = &unk_264BFDAE8;
    objc_copyWeak(&v23, &location);
    [v15 automaticallyUpdateView:v16 withStyle:0 andObserverBlock:&v19];

    v17 = [(WFConfigurationParameterEditorHostingCell *)self fillProvider];
    v18 = [(WFConfigurationParameterEditorHostingCell *)self highlighedBackgroundView];
    [v17 automaticallyUpdateView:v18 withStyle:1];

    [(WFParameterEditorHostingCell *)self updateContext];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
LABEL_14:
}

id __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke_2;
  aBlock[3] = &unk_264BFDAC0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = _Block_copy(aBlock);
  objc_destroyWeak(&v4);
  return v1;
}

void __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = v4;
  id v6 = [WeakRetained overridingBackgroundColor];

  if (v6)
  {
    id v7 = [WeakRetained overridingBackgroundColor];
    [v8 setBackgroundColor:v7];
  }
}

- (void)setStrokeProvider:(id)a3
{
  id v5 = a3;
  id v6 = [(WFConfigurationParameterEditorHostingCell *)self strokeProvider];
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v10 = [(WFConfigurationParameterEditorHostingCell *)self strokeProvider];
    v11 = [(WFConfigurationParameterEditorHostingCell *)self contentView];
    [v10 stopAutomaticallyUpdatingView:v11];

    objc_storeStrong((id *)&self->_strokeProvider, a3);
    objc_initWeak(&location, self);
    v12 = [(WFConfigurationParameterEditorHostingCell *)self strokeProvider];
    id v13 = [(WFConfigurationParameterEditorHostingCell *)self contentView];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke;
    v14[3] = &unk_264BFDAE8;
    objc_copyWeak(&v15, &location);
    [v12 automaticallyUpdateView:v13 withStyle:0 andObserverBlock:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
LABEL_9:
}

id __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke_2;
  aBlock[3] = &unk_264BFDAC0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = _Block_copy(aBlock);
  objc_destroyWeak(&v4);
  return v1;
}

void __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = v5;
  id v8 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v8];

  char v9 = [v11 _visualStylingForContinuallyUpdatedView:v7];
  id v10 = [v9 color];
  [WeakRetained setLabelColor:v10];
}

- (void)setLabelColor:(id)a3
{
  id v5 = a3;
  id v6 = [(WFConfigurationParameterEditorHostingCell *)self labelColor];
  id v7 = v5;
  id v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_labelColor, a3);
    [(WFParameterEditorHostingCell *)self updateContext];
  }
LABEL_9:
}

- (WFConfigurationParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFConfigurationParameterEditorHostingCell;
  id v7 = [(WFParameterEditorHostingCell *)&v16 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(WFConfigurationParameterEditorHostingCell *)v7 setBackgroundView:v8];

    id v9 = [(WFConfigurationParameterEditorHostingCell *)v7 backgroundView];
    [v9 setAutoresizingMask:18];

    id v10 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(WFConfigurationParameterEditorHostingCell *)v7 setHighlighedBackgroundView:v10];

    id v11 = [(WFConfigurationParameterEditorHostingCell *)v7 highlighedBackgroundView];
    [v11 setAutoresizingMask:18];

    [(WFConfigurationParameterEditorHostingCell *)v7 setSelectionStyle:0];
    v12 = [MEMORY[0x263F825C8] clearColor];
    id v13 = [(WFConfigurationParameterEditorHostingCell *)v7 contentView];
    [v13 setBackgroundColor:v12];

    v14 = v7;
  }

  return v7;
}

@end