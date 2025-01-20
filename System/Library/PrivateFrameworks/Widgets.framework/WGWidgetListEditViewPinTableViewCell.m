@interface WGWidgetListEditViewPinTableViewCell
- (UISwitch)pinSwitch;
- (WGWidgetListEditViewPinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation WGWidgetListEditViewPinTableViewCell

- (WGWidgetListEditViewPinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v47[2] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)WGWidgetListEditViewPinTableViewCell;
  v4 = [(WGWidgetListEditViewPinTableViewCell *)&v45 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v44 = [(WGWidgetListEditViewPinTableViewCell *)v4 contentView];
    v6 = (UISwitch *)objc_alloc_init(MEMORY[0x263F1CA10]);
    pinSwitch = v5->_pinSwitch;
    v5->_pinSwitch = v6;

    [(UISwitch *)v5->_pinSwitch setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UISwitch *)v5->_pinSwitch sizeToFit];
    v8 = objc_alloc_init(WGWidgetPinningTeachingAnimationView);
    [(WGWidgetPinningTeachingAnimationView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1148846080;
    [(WGWidgetPinningTeachingAnimationView *)v8 setContentHuggingPriority:0 forAxis:v9];
    pinImageView = v5->_pinImageView;
    v5->_pinImageView = v8;
    v43 = v8;

    id v11 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"WIDGETS_PIN_TITLE" value:&stru_26D5C79B8 table:@"Widgets"];
    [v11 setText:v13];

    v14 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    [v11 setFont:v14];

    id v15 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"WIDGETS_PIN_MESSAGE" value:&stru_26D5C79B8 table:@"Widgets"];
    [v15 setText:v17];

    v18 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v15 setFont:v18];

    [v15 setNumberOfLines:0];
    id v19 = objc_alloc(MEMORY[0x263F1C9B8]);
    v47[0] = v11;
    v47[1] = v15;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    v21 = (void *)[v19 initWithArrangedSubviews:v20];

    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v21 setAxis:1];
    id v22 = objc_alloc(MEMORY[0x263F1C9B8]);
    v46[0] = v43;
    v46[1] = v21;
    v46[2] = v5->_pinSwitch;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
    v24 = (void *)[v22 initWithArrangedSubviews:v23];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setAxis:0];
    [v24 setAlignment:3];
    [v24 setSpacing:30.0];
    [v44 addSubview:v24];
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v26 = [v24 leadingAnchor];
    v27 = [v44 leadingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:30.0];
    [v25 addObject:v28];

    v29 = [v44 trailingAnchor];
    v30 = [v24 trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:23.0];
    [v25 addObject:v31];

    v32 = [v24 topAnchor];
    v33 = [v44 topAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:28.0];
    [v25 addObject:v34];

    v35 = [v44 bottomAnchor];
    v36 = [v24 bottomAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:28.0];
    [v25 addObject:v37];

    v38 = [(WGWidgetPinningTeachingAnimationView *)v43 widthAnchor];
    v39 = [v38 constraintEqualToConstant:61.0];
    [v25 addObject:v39];

    v40 = [(WGWidgetPinningTeachingAnimationView *)v43 heightAnchor];
    v41 = [v40 constraintEqualToConstant:50.0];
    [v25 addObject:v41];

    [MEMORY[0x263F08938] activateConstraints:v25];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetListEditViewPinTableViewCell;
  [(WGWidgetListEditViewPinTableViewCell *)&v3 prepareForReuse];
  [(WGWidgetListEditViewPinTableViewCell *)self stopAnimating];
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (UISwitch)pinSwitch
{
  return self->_pinSwitch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinSwitch, 0);
  objc_storeStrong((id *)&self->_pinImageView, 0);
}

@end