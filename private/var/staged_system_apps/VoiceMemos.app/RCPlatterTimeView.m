@interface RCPlatterTimeView
- (CGRect)_currentTimeLabelTightFrame;
- (NSLayoutConstraint)stopButtonHeightConstraint;
- (NSLayoutConstraint)stopButtonToLeadingConstraint;
- (NSLayoutConstraint)stopButtonWidthConstraint;
- (NSLayoutConstraint)timeLabelCenterYConstraint;
- (NSLayoutConstraint)timeLabelToLeadingConstraint;
- (NSLayoutConstraint)timeLabelToStopButtonConstraint;
- (NSLayoutConstraint)timeLabelTopToObstructedAreaBottomConstraint;
- (NSLayoutConstraint)timeLabelTopToTopConstraint;
- (NSLayoutXAxisAnchor)trailingCustomConcentricLayoutAnchor;
- (RCPlatterStopButton)stopButton;
- (RCPlatterTimeView)initWithPresentationStyle:(unint64_t)a3;
- (RCPlatterTimeViewDelegate)delegate;
- (RCTimeLabel)currentTimeLabel;
- (id)_createCurrentTimeLabel;
- (id)_createStopButton;
- (id)_labelFontForState:(unint64_t)a3 presentationStyle:(unint64_t)a4;
- (id)_labelTextColorForState:(unint64_t)a3 presentationStyle:(unint64_t)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (unint64_t)presentationStyle;
- (unint64_t)state;
- (void)_constrainTimeLabelTopToObstructedAreaBottomIfNeeded;
- (void)_hideStopButton;
- (void)_hideTimeLabel;
- (void)_setupSubviews;
- (void)_showStopButton;
- (void)_showTimeLabel;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateLabelFont;
- (void)didTapOnStopButton:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentTimeLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationStyle:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setStopButton:(id)a3;
- (void)setStopButtonHeightConstraint:(id)a3;
- (void)setStopButtonToLeadingConstraint:(id)a3;
- (void)setStopButtonWidthConstraint:(id)a3;
- (void)setTimeLabelCenterYConstraint:(id)a3;
- (void)setTimeLabelToLeadingConstraint:(id)a3;
- (void)setTimeLabelToStopButtonConstraint:(id)a3;
- (void)setTimeLabelTopToObstructedAreaBottomConstraint:(id)a3;
- (void)setTimeLabelTopToTopConstraint:(id)a3;
- (void)updateTime:(double)a3;
@end

@implementation RCPlatterTimeView

- (RCPlatterTimeView)initWithPresentationStyle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RCPlatterTimeView;
  v4 = -[RCPlatterTimeView initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    [(RCPlatterTimeView *)v4 setPresentationStyle:a3];
    [(RCPlatterTimeView *)v5 _setupSubviews];
    v6 = self;
    v11 = v6;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    id v8 = [(RCPlatterTimeView *)v5 registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCPlatterTimeView;
  [(RCPlatterTimeView *)&v3 layoutSubviews];
  [(RCPlatterTimeView *)self _constrainTimeLabelTopToObstructedAreaBottomIfNeeded];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  self->_state = a3;
  switch(a3)
  {
    case 2uLL:
      if (![(RCPlatterTimeView *)self presentationStyle]) {
        [(RCPlatterTimeView *)self _hideTimeLabel];
      }
      v5 = [(RCPlatterTimeView *)self systemApertureElementContext];
      v4 = [v5 transitionContext];

      if (v4 && [v4 fromLayoutMode] == (id)4)
      {
        v6 = +[RCRecorderStyleProvider sharedStyleProvider];
        [v6 platterEmptyViewToCheckmarkTransitionDuration];
        double v8 = v7;

        v9 = [(RCPlatterTimeView *)self stopButton];
        [v9 transitionToState:2 viaState:0 transitionDuration:v8];
      }
      else
      {
        v9 = [(RCPlatterTimeView *)self stopButton];
        [v9 setState:2];
      }

      [(RCPlatterTimeView *)self _showStopButton];
      goto LABEL_14;
    case 1uLL:
      [(RCPlatterTimeView *)self _showTimeLabel];
      objc_super v10 = [(RCPlatterTimeView *)self stopButton];
      [v10 setState:1];

      [(RCPlatterTimeView *)self _showStopButton];
      break;
    case 0uLL:
      [(RCPlatterTimeView *)self _showTimeLabel];
      [(RCPlatterTimeView *)self _hideStopButton];
      v4 = [(RCPlatterTimeView *)self stopButton];
      [v4 setState:0];
LABEL_14:

      break;
  }

  [(RCPlatterTimeView *)self _updateLabelFont];
}

- (void)updateTime:(double)a3
{
  v4 = RCLocalizedDuration();
  v5 = [(RCPlatterTimeView *)self currentTimeLabel];
  [v5 setText:v4];

  UIAXTimeStringForDuration();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = AXLocalizeDurationTime();
  double v7 = [(RCPlatterTimeView *)self currentTimeLabel];
  double v8 = [v7 accessibilityValue];
  unsigned __int8 v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    objc_super v10 = [(RCPlatterTimeView *)self currentTimeLabel];
    [v10 setAccessibilityValue:v6];

    v11 = [(RCPlatterTimeView *)self delegate];
    [v11 accessibilityValueDidChange];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
}

- (void)_setupSubviews
{
  objc_super v3 = [(RCPlatterTimeView *)self _createCurrentTimeLabel];
  [(RCPlatterTimeView *)self setCurrentTimeLabel:v3];
  LODWORD(v4) = 1144750080;
  [v3 setContentHuggingPriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v5];
  v6 = [(RCPlatterTimeView *)self _createStopButton];
  [(RCPlatterTimeView *)self setStopButton:v6];
  [(RCPlatterTimeView *)self addSubview:v6];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = [v6 trailingAnchor];
  double v8 = [(RCPlatterTimeView *)self trailingAnchor];
  v55 = [v7 constraintEqualToAnchor:v8];

  unsigned __int8 v9 = [v6 centerYAnchor];
  objc_super v10 = [(RCPlatterTimeView *)self centerYAnchor];
  v53 = [v9 constraintEqualToAnchor:v10];

  v11 = [v6 topAnchor];
  id v12 = [(RCPlatterTimeView *)self topAnchor];
  v52 = [v11 constraintGreaterThanOrEqualToAnchor:v12];

  v13 = [v6 leadingAnchor];
  v14 = [(RCPlatterTimeView *)self leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [(RCPlatterTimeView *)self setStopButtonToLeadingConstraint:v15];

  v16 = [v6 heightAnchor];
  v17 = [v16 constraintEqualToConstant:0.0];
  [(RCPlatterTimeView *)self setStopButtonHeightConstraint:v17];

  v54 = v6;
  v18 = [v6 widthAnchor];
  v19 = [v18 constraintEqualToConstant:0.0];
  [(RCPlatterTimeView *)self setStopButtonWidthConstraint:v19];

  v20 = [(RCPlatterTimeView *)self stopButton];
  [v20 setAlpha:0.0];

  [(RCPlatterTimeView *)self addSubview:v3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [v3 _tightBoundingBoxLayoutGuide];
  v22 = [v21 leadingAnchor];
  v23 = [(RCPlatterTimeView *)self leadingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [(RCPlatterTimeView *)self setTimeLabelToLeadingConstraint:v24];

  v25 = [(RCPlatterTimeView *)self timeLabelToLeadingConstraint];
  LODWORD(v26) = 1148846080;
  [v25 setPriority:v26];

  v27 = [v3 topAnchor];
  v28 = [(RCPlatterTimeView *)self topAnchor];
  v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28];
  [(RCPlatterTimeView *)self setTimeLabelTopToTopConstraint:v29];

  v30 = [v3 _tightBoundingBoxLayoutGuide];
  v31 = [v30 topAnchor];
  v32 = [(RCPlatterTimeView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
  v33 = [v32 bottomAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [(RCPlatterTimeView *)self setTimeLabelTopToObstructedAreaBottomConstraint:v34];

  v35 = [v3 centerYAnchor];
  v36 = [(RCPlatterTimeView *)self centerYAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [(RCPlatterTimeView *)self setTimeLabelCenterYConstraint:v37];

  v38 = [v3 heightAnchor];
  v39 = [(RCPlatterTimeView *)self heightAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];

  LODWORD(v41) = 1132003328;
  [v40 setPriority:v41];
  v42 = [v6 leadingAnchor];
  v43 = [v3 trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43 constant:0.0];
  [(RCPlatterTimeView *)self setTimeLabelToStopButtonConstraint:v44];

  v56[0] = v55;
  v56[1] = v53;
  v56[2] = v52;
  v45 = [(RCPlatterTimeView *)self stopButtonHeightConstraint];
  v56[3] = v45;
  v46 = [(RCPlatterTimeView *)self stopButtonWidthConstraint];
  v56[4] = v46;
  v47 = [(RCPlatterTimeView *)self timeLabelToLeadingConstraint];
  v56[5] = v47;
  v48 = [(RCPlatterTimeView *)self timeLabelTopToTopConstraint];
  v56[6] = v48;
  v49 = [(RCPlatterTimeView *)self timeLabelCenterYConstraint];
  v56[7] = v49;
  v56[8] = v40;
  v50 = [(RCPlatterTimeView *)self timeLabelToStopButtonConstraint];
  v56[9] = v50;
  v51 = +[NSArray arrayWithObjects:v56 count:10];
  +[NSLayoutConstraint activateConstraints:v51];
}

- (NSLayoutXAxisAnchor)trailingCustomConcentricLayoutAnchor
{
  v2 = [(RCPlatterTimeView *)self stopButton];
  objc_super v3 = [v2 centerXAnchor];

  return (NSLayoutXAxisAnchor *)v3;
}

- (id)_createCurrentTimeLabel
{
  objc_super v3 = objc_alloc_init(RCTimeLabel);
  double v4 = [(RCPlatterTimeView *)self _labelFontForState:[(RCPlatterTimeView *)self state] presentationStyle:[(RCPlatterTimeView *)self presentationStyle]];
  [(RCTimeLabel *)v3 setFont:v4];

  double v5 = [(RCPlatterTimeView *)self _labelTextColorForState:[(RCPlatterTimeView *)self state] presentationStyle:[(RCPlatterTimeView *)self presentationStyle]];
  [(RCTimeLabel *)v3 setTextColor:v5];

  v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"CURRENT_POSITION" value:&stru_100228BC8 table:0];
  [(RCTimeLabel *)v3 setAccessibilityLabel:v7];

  double v8 = [(RCTimeLabel *)v3 layer];
  [v8 setAllowsHitTesting:0];

  return v3;
}

- (id)_createStopButton
{
  objc_super v3 = -[RCPlatterStopButton initWithFrame:]([RCPlatterStopButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RCPlatterStopButton *)v3 setDelegate:self];

  return v3;
}

- (void)_updateLabelFont
{
  objc_super v3 = [(RCPlatterTimeView *)self _labelFontForState:[(RCPlatterTimeView *)self state] presentationStyle:[(RCPlatterTimeView *)self presentationStyle]];
  double v4 = [(RCPlatterTimeView *)self currentTimeLabel];
  [v4 setFont:v3];

  id v6 = [(RCPlatterTimeView *)self _labelTextColorForState:[(RCPlatterTimeView *)self state] presentationStyle:[(RCPlatterTimeView *)self presentationStyle]];
  double v5 = [(RCPlatterTimeView *)self currentTimeLabel];
  [v5 setTextColor:v6];
}

- (id)_labelFontForState:(unint64_t)a3 presentationStyle:(unint64_t)a4
{
  id v6 = [(RCPlatterTimeView *)self traitCollection];
  double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v8 = v7;
  if (a3 == 1 || a3 == 2 && a4 == 1)
  {
    uint64_t v9 = [v7 platterTimeLabelCustomModeFontForTraitCollection:v6];
  }
  else
  {
    uint64_t v9 = [v7 platterTimeLabelCompactModeFontForTraitCollection:v6];
  }
  objc_super v10 = (void *)v9;

  return v10;
}

- (id)_labelTextColorForState:(unint64_t)a3 presentationStyle:(unint64_t)a4
{
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v7 = v6;
  if (a3 == 2 && a4 == 1)
  {
    uint64_t v8 = [v6 platterStatusMessageStateTimeLabelColor];
  }
  else
  {
    uint64_t v8 = [v6 platterDefaultTimeLabelColor];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (void)_showStopButton
{
  id v17 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v17 platterStopButtonHeight];
  double v4 = v3;
  [(RCPlatterTimeView *)self SBUISA_standardInteritemPadding];
  double v6 = v5;
  if ((id)[(RCPlatterTimeView *)self state] == (id)2)
  {
    double v7 = [(RCPlatterTimeView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
    [v7 layoutFrame];
    BOOL IsEmpty = CGRectIsEmpty(v19);

    if (!IsEmpty)
    {
      [v17 platterCheckmarkHeightMultiplier];
      double v10 = v9;
      v11 = [(RCPlatterTimeView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
      [v11 layoutFrame];
      double v4 = v10 * v12;

      double v6 = 0.0;
    }
  }
  v13 = [(RCPlatterTimeView *)self stopButtonWidthConstraint];
  [v13 setConstant:v4];

  v14 = [(RCPlatterTimeView *)self stopButtonHeightConstraint];
  [v14 setConstant:v4];

  v15 = [(RCPlatterTimeView *)self timeLabelToStopButtonConstraint];
  [v15 setConstant:v6];

  v16 = [(RCPlatterTimeView *)self stopButton];
  [v16 setAlpha:1.0];
}

- (void)_hideStopButton
{
  double v3 = [(RCPlatterTimeView *)self stopButtonWidthConstraint];
  [v3 setConstant:0.0];

  double v4 = [(RCPlatterTimeView *)self stopButtonHeightConstraint];
  [v4 setConstant:0.0];

  double v5 = [(RCPlatterTimeView *)self timeLabelToStopButtonConstraint];
  [v5 setConstant:0.0];

  id v6 = [(RCPlatterTimeView *)self stopButton];
  [v6 setAlpha:0.0];
}

- (void)_showTimeLabel
{
  double v3 = [(RCPlatterTimeView *)self currentTimeLabel];
  unsigned int v4 = [v3 isHidden];

  if (v4)
  {
    double v5 = [(RCPlatterTimeView *)self currentTimeLabel];
    [v5 setHidden:0];

    id v6 = [(RCPlatterTimeView *)self timeLabelToLeadingConstraint];
    [v6 setActive:1];

    id v7 = [(RCPlatterTimeView *)self stopButtonToLeadingConstraint];
    [v7 setActive:0];
  }
}

- (void)_hideTimeLabel
{
  double v3 = [(RCPlatterTimeView *)self currentTimeLabel];
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    double v5 = [(RCPlatterTimeView *)self currentTimeLabel];
    [v5 setHidden:1];

    id v6 = [(RCPlatterTimeView *)self timeLabelToLeadingConstraint];
    [v6 setActive:0];

    id v7 = [(RCPlatterTimeView *)self stopButtonToLeadingConstraint];
    [v7 setActive:1];
  }
}

- (void)_constrainTimeLabelTopToObstructedAreaBottomIfNeeded
{
  double v3 = [(RCPlatterTimeView *)self currentTimeLabel];
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    [(RCPlatterTimeView *)self _currentTimeLabelTightFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    v13 = [(RCPlatterTimeView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
    [v13 layoutFrame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v30.origin.x = v6;
    v30.origin.y = v8;
    v30.size.double width = v10;
    v30.size.height = v12;
    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.double width = v19;
    v32.size.height = v21;
    CGRect v31 = CGRectIntersection(v30, v32);
    double width = v31.size.width;
    unint64_t v23 = [(RCPlatterTimeView *)self state];
    v24 = [(RCPlatterTimeView *)self timeLabelTopToObstructedAreaBottomConstraint];
    v25 = v24;
    if (v23 == 1 && width > 0.0)
    {
      [v24 setActive:1];

      double v26 = [(RCPlatterTimeView *)self timeLabelCenterYConstraint];
      id v28 = v26;
      uint64_t v27 = 0;
    }
    else
    {
      [v24 setActive:0];

      double v26 = [(RCPlatterTimeView *)self timeLabelCenterYConstraint];
      id v28 = v26;
      uint64_t v27 = 1;
    }
    [v26 setActive:v27];
  }
}

- (CGRect)_currentTimeLabelTightFrame
{
  double v3 = [(RCPlatterTimeView *)self currentTimeLabel];
  unsigned __int8 v4 = [v3 _tightBoundingBoxLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(RCPlatterTimeView *)self currentTimeLabel];
  [v13 convertRect:self toView:v6, v8, v10, v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)didTapOnStopButton:(id)a3
{
  id v3 = [(RCPlatterTimeView *)self delegate];
  [v3 didTapStopRecordingButton];
}

- (id)accessibilityLabel
{
  if ([(RCPlatterTimeView *)self state])
  {
    v9.receiver = self;
    v9.super_class = (Class)RCPlatterTimeView;
    id v3 = [(RCPlatterTimeView *)&v9 accessibilityLabel];
  }
  else
  {
    unsigned __int8 v4 = [(RCPlatterTimeView *)self currentTimeLabel];
    double v5 = [v4 accessibilityLabel];
    double v6 = [(RCPlatterTimeView *)self currentTimeLabel];
    double v7 = [v6 accessibilityValue];
    id v3 = +[NSString stringWithFormat:@"%@, %@", v5, v7];
  }

  return v3;
}

- (id)accessibilityElements
{
  id v3 = [(RCPlatterTimeView *)self currentTimeLabel];
  v7[0] = v3;
  unsigned __int8 v4 = [(RCPlatterTimeView *)self stopButton];
  v7[1] = v4;
  double v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (RCPlatterTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCPlatterTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (RCTimeLabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (void)setCurrentTimeLabel:(id)a3
{
}

- (RCPlatterStopButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
}

- (NSLayoutConstraint)timeLabelToLeadingConstraint
{
  return self->_timeLabelToLeadingConstraint;
}

- (void)setTimeLabelToLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeLabelToStopButtonConstraint
{
  return self->_timeLabelToStopButtonConstraint;
}

- (void)setTimeLabelToStopButtonConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeLabelTopToTopConstraint
{
  return self->_timeLabelTopToTopConstraint;
}

- (void)setTimeLabelTopToTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeLabelTopToObstructedAreaBottomConstraint
{
  return self->_timeLabelTopToObstructedAreaBottomConstraint;
}

- (void)setTimeLabelTopToObstructedAreaBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeLabelCenterYConstraint
{
  return self->_timeLabelCenterYConstraint;
}

- (void)setTimeLabelCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)stopButtonToLeadingConstraint
{
  return self->_stopButtonToLeadingConstraint;
}

- (void)setStopButtonToLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stopButtonWidthConstraint
{
  return self->_stopButtonWidthConstraint;
}

- (void)setStopButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)stopButtonHeightConstraint
{
  return self->_stopButtonHeightConstraint;
}

- (void)setStopButtonHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stopButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stopButtonToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelTopToObstructedAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelToStopButtonConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end