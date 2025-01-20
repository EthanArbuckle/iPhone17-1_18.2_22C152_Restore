@interface WFParameterValuePickerTableViewCell
- (BOOL)disablesSeparatorIconInset;
- (BOOL)isContainedInState;
- (UIViewController)parentViewController;
- (WFCodableAttributeBackedSubstitutableState)state;
- (WFParameterValuePickable)parameter;
- (WFParameterValuePickerTableViewCellDelegate)delegate;
- (id)configurationState;
- (id)defaultContentConfiguration;
- (void)setContainedInState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablesSeparatorIconInset:(BOOL)a3;
- (void)setParameter:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setState:(id)a3;
- (void)tintColorDidChange;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation WFParameterValuePickerTableViewCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

- (void)setDisablesSeparatorIconInset:(BOOL)a3
{
  self->_disablesSeparatorIconInset = a3;
}

- (BOOL)disablesSeparatorIconInset
{
  return self->_disablesSeparatorIconInset;
}

- (void)setDelegate:(id)a3
{
}

- (WFParameterValuePickerTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFParameterValuePickerTableViewCellDelegate *)WeakRetained;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)isContainedInState
{
  return self->_containedInState;
}

- (WFCodableAttributeBackedSubstitutableState)state
{
  return self->_state;
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFParameterValuePickerTableViewCell;
  [(WFParameterValuePickerTableViewCell *)&v3 tintColorDidChange];
  [(WFParameterValuePickerTableViewCell *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"parameter"];
  v6 = [v4 objectForKeyedSubscript:@"state"];
  v7 = [v4 objectForKeyedSubscript:@"parentViewController"];
  v8 = [v4 objectForKeyedSubscript:@"containedInState"];
  uint64_t v9 = [v8 BOOLValue];

  v10 = [v4 objectForKeyedSubscript:@"delegate"];
  v11 = [(WFParameterValuePickerTableViewCell *)self defaultContentConfiguration];
  v12 = [v11 updatedConfigurationForState:v4];

  v13 = objc_msgSend(v5, "wf_pickerLocalizedTitleForState:", v6);
  [v12 setText:v13];

  v14 = objc_msgSend(v5, "wf_pickerLocalizedSubtitleForState:", v6);
  [v12 setSecondaryText:v14];

  v15 = objc_msgSend(v5, "wf_pickerLocalizedImageForState:", v6);
  v16 = [v15 platformImage];
  if (objc_msgSend(v5, "wf_alwaysScaleIconImage"))
  {
    [v16 size];
    if (v17 < 29.0)
    {
      [v16 size];
      if (v18 < 29.0)
      {
        [v16 size];
        double v20 = 29.0 / v19;
        [v16 size];
        double v22 = fmin(v20, 29.0 / v21);
        [v16 size];
        double v24 = v23 * v22;
        [v16 size];
        v36 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v24, v22 * v25);
        uint64_t v37 = [v16 renderingMode];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __69__WFParameterValuePickerTableViewCell_updateConfigurationUsingState___block_invoke;
        v38[3] = &unk_264BFD6B8;
        id v39 = v16;
        v26 = [v36 imageWithActions:v38];
        v16 = [v26 imageWithRenderingMode:v37];
      }
    }
  }
  [v12 setImage:v15];
  [v16 size];
  double v28 = fmin(v27, 29.0);
  [v16 size];
  double v30 = fmax(v28, fmin(v29, 29.0));
  uint64_t v31 = [v15 displayStyle];
  double v32 = 15.0;
  if (v31 == 1) {
    double v32 = 2.0;
  }
  [v12 setCornerRadius:ceil(v30 / v32)];
  objc_msgSend(v12, "setForceImageScaling:", objc_msgSend(v5, "wf_alwaysScaleIconImage"));
  objc_msgSend(v12, "setUsesInsetGroupedTableStyle:", objc_msgSend(v5, "wf_usesGroupTableViewStyle"));
  if (!v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v33 = objc_msgSend(v5, "wf_pickerLocalizedIconForState:", v6);
    [v12 setIcon:v33];
  }
  [v12 setParentViewController:v7];
  [v12 setContainedInState:v9];
  [v12 setDelegate:v10];
  [(WFParameterValuePickerTableViewCell *)self layoutMargins];
  BOOL v34 = [(WFParameterValuePickerTableViewCell *)self disablesSeparatorIconInset];
  if (v16 || v34)
  {
    if (v34) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v35 = [v12 icon];

  if (v35) {
LABEL_13:
  }
    [v12 usesInsetGroupedTableStyle];
LABEL_14:
  WFConvertEdgeInsetsToRTLIfNeeded();
  -[WFParameterValuePickerTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  [(WFParameterValuePickerTableViewCell *)self setContentConfiguration:v12];
}

void __69__WFParameterValuePickerTableViewCell_updateConfigurationUsingState___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 format];
  [v3 bounds];
  objc_msgSend(v2, "drawInRect:");
}

- (id)defaultContentConfiguration
{
  id v3 = objc_alloc_init(WFParameterValuePickerTableViewCellConfiguration);
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  int v5 = objc_msgSend(v4, "wf_isWidgetConfigurationExtensionBundle");

  v6 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v7 = (void *)MEMORY[0x263F81708];
  if (v5) {
    [MEMORY[0x263F81708] labelFontSize];
  }
  else {
    double v8 = 17.0;
  }
  uint64_t v9 = [v7 systemFontOfSize:v8];
  v10 = [v6 scaledFontForFont:v9 maximumPointSize:36.0];
  [(WFParameterValuePickerTableViewCellConfiguration *)v3 setTextFont:v10];

  v11 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83588]];
  v12 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  v13 = [v11 scaledFontForFont:v12 maximumPointSize:24.0];
  [(WFParameterValuePickerTableViewCellConfiguration *)v3 setSecondaryTextFont:v13];

  [(WFParameterValuePickerTableViewCellConfiguration *)v3 setContainedInState:0];
  v14 = [(WFParameterValuePickerTableViewCell *)self parameter];
  -[WFParameterValuePickerTableViewCellConfiguration setUsesToggleForSelection:](v3, "setUsesToggleForSelection:", objc_msgSend(v14, "wf_usesTogglesForSelection"));

  v15 = [MEMORY[0x263F825C8] labelColor];
  [(WFParameterValuePickerTableViewCellConfiguration *)v3 setTextColor:v15];

  v16 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(WFParameterValuePickerTableViewCellConfiguration *)v3 setSecondaryTextColor:v16];

  return v3;
}

- (void)setParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)&self->_parentViewController);
  id v6 = v4;
  id obj = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    objc_storeWeak((id *)&self->_parentViewController, obj);
    [(WFParameterValuePickerTableViewCell *)self setNeedsUpdateConfiguration];
  }
LABEL_9:
}

- (void)setContainedInState:(BOOL)a3
{
  if (self->_containedInState != a3)
  {
    BOOL v3 = a3;
    self->_containedInState = a3;
    id v5 = [(WFParameterValuePickerTableViewCell *)self parameter];
    int v6 = objc_msgSend(v5, "wf_usesTogglesForSelection");

    if (v6)
    {
      [(WFParameterValuePickerTableViewCell *)self setNeedsUpdateConfiguration];
    }
    else
    {
      if (v3) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 0;
      }
      [(WFParameterValuePickerTableViewCell *)self setAccessoryType:v7];
    }
  }
}

- (void)setState:(id)a3
{
  id v5 = a3;
  int v6 = self->_state;
  uint64_t v7 = (WFCodableAttributeBackedSubstitutableState *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(WFCodableAttributeBackedSubstitutableState *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_state, a3);
    [(WFParameterValuePickerTableViewCell *)self setNeedsUpdateConfiguration];
  }
LABEL_9:
}

- (void)setParameter:(id)a3
{
  id v5 = a3;
  int v6 = self->_parameter;
  uint64_t v7 = (WFParameterValuePickable *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(WFParameterValuePickable *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_parameter, a3);
    [(WFParameterValuePickerTableViewCell *)self setNeedsUpdateConfiguration];
  }
LABEL_9:
}

- (id)configurationState
{
  v10.receiver = self;
  v10.super_class = (Class)WFParameterValuePickerTableViewCell;
  BOOL v3 = [(WFParameterValuePickerTableViewCell *)&v10 configurationState];
  id v4 = [(WFParameterValuePickerTableViewCell *)self state];
  [v3 setCustomState:v4 forKey:@"state"];

  id v5 = [(WFParameterValuePickerTableViewCell *)self parameter];
  [v3 setCustomState:v5 forKey:@"parameter"];

  int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFParameterValuePickerTableViewCell isContainedInState](self, "isContainedInState"));
  [v3 setCustomState:v6 forKey:@"containedInState"];

  uint64_t v7 = [(WFParameterValuePickerTableViewCell *)self parentViewController];
  [v3 setCustomState:v7 forKey:@"parentViewController"];

  char v8 = [(WFParameterValuePickerTableViewCell *)self delegate];
  [v3 setCustomState:v8 forKey:@"delegate"];

  return v3;
}

@end