@interface CarUserInputCell
- (BOOL)_siriButtonShouldBeExpanded;
- (BOOL)canBecomeFocused;
- (BOOL)isKeyboardDisabled;
- (CarUserInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CarUserInputCellDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (void)_externalDeviceChanged:(id)a3;
- (void)_handleDictationSelectPressGesture:(id)a3;
- (void)_handleDictationTouchGesture:(id)a3;
- (void)_handleKeyboardSelectPressGesture:(id)a3;
- (void)_handleKeyboardTouchGesture:(id)a3;
- (void)_installGestureRecognizers;
- (void)_updateConstraintsAnimated:(BOOL)a3 alongWithAnimation:(id)a4 completion:(id)a5;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)setKeyboardDisabled:(BOOL)a3;
- (void)setKeyboardDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarUserInputCell

- (CarUserInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v77.receiver = self;
  v77.super_class = (Class)CarUserInputCell;
  v4 = [(CarUserInputCell *)&v77 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarUserInputCell *)v4 setFocusStyle:1];
    [(CarUserInputCell *)v5 setSelectionStyle:0];
    v6 = +[UIColor clearColor];
    [(CarUserInputCell *)v5 setBackgroundColor:v6];

    v7 = +[UIColor clearColor];
    v8 = [(CarUserInputCell *)v5 contentView];
    [v8 setBackgroundColor:v7];

    v9 = -[CarDictationButton initWithFrame:]([CarDictationButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dictationButton = v5->_dictationButton;
    v5->_dictationButton = v9;

    [(CarDictationButton *)v5->_dictationButton setAccessibilityIdentifier:@"DictationButton"];
    [(CarDictationButton *)v5->_dictationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(CarDictationButton *)v5->_dictationButton layer];
    [v11 setCornerCurve:kCACornerCurveContinuous];

    v12 = [(CarDictationButton *)v5->_dictationButton layer];
    [v12 setCornerRadius:4.0];

    v13 = +[UIColor _carSystemFocusLabelColor];
    [(CarFocusableControl *)v5->_dictationButton setFocusedTintColor:v13];

    v14 = +[UIColor _carSystemFocusColor];
    [(CarFocusableControl *)v5->_dictationButton setUnfocusedTintColor:v14];

    v15 = +[UIColor _carSystemFocusColor];
    [(CarFocusableControl *)v5->_dictationButton setFocusedBackgroundColor:v15];

    v16 = +[UIColor _carSystemQuaternaryColor];
    [(CarFocusableControl *)v5->_dictationButton setUnfocusedBackgroundColor:v16];

    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"CarPlay_Dictation" value:@"localized string not found" table:0];
    v82[0] = v18;
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"CarPlay_Siri" value:@"localized string not found" table:0];
    v82[1] = v20;
    v21 = +[NSArray arrayWithObjects:v82 count:2];
    [(CarDictationButton *)v5->_dictationButton setAccessibilityUserInputLabels:v21];

    v22 = [(CarUserInputCell *)v5 contentView];
    [v22 addSubview:v5->_dictationButton];

    uint64_t v23 = +[CarFocusableButton button];
    keyboardButton = v5->_keyboardButton;
    v5->_keyboardButton = (CarFocusableButton *)v23;

    [(CarFocusableButton *)v5->_keyboardButton setAccessibilityIdentifier:@"KeyboardButton"];
    [(CarFocusableButton *)v5->_keyboardButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = +[UIColor _carSystemQuaternaryColor];
    [(CarFocusableButton *)v5->_keyboardButton setNonFocusedBackgroundColor:v25];

    [(CarFocusableButton *)v5->_keyboardButton setModifiesBackgroundColor:1];
    v26 = [(CarFocusableButton *)v5->_keyboardButton layer];
    [v26 setCornerCurve:kCACornerCurveContinuous];

    v27 = [(CarFocusableButton *)v5->_keyboardButton layer];
    [v27 setCornerRadius:4.0];

    v28 = [(CarFocusableButton *)v5->_keyboardButton imageView];
    [v28 setContentMode:1];

    v29 = v5->_keyboardButton;
    v30 = +[UIImage _mapsCar_systemImageNamed:@"keyboard" textStyle:UIFontTextStyleTitle3];
    [(CarFocusableButton *)v29 setImage:v30 forState:0];

    v31 = +[NSBundle mainBundle];
    v32 = [v31 localizedStringForKey:@"CarPlay_Keyboard" value:@"localized string not found" table:0];
    v81 = v32;
    v33 = +[NSArray arrayWithObjects:&v81 count:1];
    [(CarFocusableButton *)v5->_keyboardButton setAccessibilityUserInputLabels:v33];

    v34 = [(CarUserInputCell *)v5 contentView];
    [v34 addSubview:v5->_keyboardButton];

    v35 = [(CarUserInputCell *)v5 contentView];
    v36 = [v35 trailingAnchor];
    v37 = [(CarDictationButton *)v5->_dictationButton trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v80 = v38;
    uint64_t v39 = +[NSArray arrayWithObjects:&v80 count:1];
    keyboardDisabledConstraints = v5->_keyboardDisabledConstraints;
    v5->_keyboardDisabledConstraints = (NSArray *)v39;

    v41 = [(CarFocusableButton *)v5->_keyboardButton leadingAnchor];
    v42 = [(CarDictationButton *)v5->_dictationButton trailingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:2.0];
    v79[0] = v43;
    v44 = [(CarDictationButton *)v5->_dictationButton widthAnchor];
    v45 = [(CarFocusableButton *)v5->_keyboardButton widthAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v79[1] = v46;
    uint64_t v47 = +[NSArray arrayWithObjects:v79 count:2];
    keyboardEnabledConstraints = v5->_keyboardEnabledConstraints;
    v5->_keyboardEnabledConstraints = (NSArray *)v47;

    +[NSLayoutConstraint activateConstraints:v5->_keyboardEnabledConstraints];
    v75 = [(CarDictationButton *)v5->_dictationButton leadingAnchor];
    v76 = [(CarUserInputCell *)v5 contentView];
    v74 = [v76 leadingAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v78[0] = v73;
    v72 = [(CarUserInputCell *)v5 contentView];
    v71 = [v72 trailingAnchor];
    v70 = [(CarFocusableButton *)v5->_keyboardButton trailingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v78[1] = v69;
    v67 = [(CarDictationButton *)v5->_dictationButton topAnchor];
    v68 = [(CarUserInputCell *)v5 contentView];
    v66 = [v68 topAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v78[2] = v65;
    v64 = [(CarFocusableButton *)v5->_keyboardButton topAnchor];
    v63 = [(CarDictationButton *)v5->_dictationButton topAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v78[3] = v62;
    v61 = [(CarUserInputCell *)v5 contentView];
    v60 = [v61 bottomAnchor];
    v49 = [(CarDictationButton *)v5->_dictationButton bottomAnchor];
    v50 = [v60 constraintEqualToSystemSpacingBelowAnchor:v49 multiplier:1.0];
    v78[4] = v50;
    v51 = [(CarDictationButton *)v5->_dictationButton heightAnchor];
    v52 = [(CarFocusableButton *)v5->_keyboardButton heightAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v78[5] = v53;
    v54 = [(CarDictationButton *)v5->_dictationButton heightAnchor];
    v55 = [v54 constraintEqualToConstant:36.0];
    v78[6] = v55;
    v56 = +[NSArray arrayWithObjects:v78 count:7];
    +[NSLayoutConstraint activateConstraints:v56];

    v57 = +[NSNotificationCenter defaultCenter];
    [v57 addObserver:v5 selector:"_externalDeviceChanged:" name:@"MapsExternalDeviceUpdated" object:0];

    v58 = +[MapsExternalDevice sharedInstance];
    -[CarUserInputCell setKeyboardDisabled:](v5, "setKeyboardDisabled:", [v58 disableSoftwareKeyboard]);

    [(CarUserInputCell *)v5 _installGestureRecognizers];
  }
  return v5;
}

- (BOOL)_siriButtonShouldBeExpanded
{
  return self->_keyboardDisabled;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CarUserInputCell;
  [(CarUserInputCell *)&v3 didMoveToWindow];
  [(CarUserInputCell *)self _installGestureRecognizers];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarUserInputCell;
  [(CarUserInputCell *)&v4 traitCollectionDidChange:a3];
  [(CarUserInputCell *)self _installGestureRecognizers];
}

- (void)_installGestureRecognizers
{
  [(CarFocusableButton *)self->_keyboardButton removeAllGestureRecognizers];
  [(CarDictationButton *)self->_dictationButton removeAllGestureRecognizers];
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleKeyboardSelectPressGesture:"];
  [v3 setAllowedPressTypes:&off_1013AD4D0];
  [(CarFocusableButton *)self->_keyboardButton addGestureRecognizer:v3];
  id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleKeyboardTouchGesture:"];
  [v4 setAllowedTouchTypes:&off_1013AD4E8];
  [(CarFocusableButton *)self->_keyboardButton addGestureRecognizer:v4];
  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleDictationSelectPressGesture:"];

  [v6 setAllowedPressTypes:&off_1013AD500];
  [(CarDictationButton *)self->_dictationButton addGestureRecognizer:v6];
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleDictationTouchGesture:"];

  [v5 setAllowedTouchTypes:&off_1013AD518];
  [(CarDictationButton *)self->_dictationButton addGestureRecognizer:v5];
}

- (void)_externalDeviceChanged:(id)a3
{
  id v4 = +[MapsExternalDevice sharedInstance];
  -[CarUserInputCell setKeyboardDisabled:animated:](self, "setKeyboardDisabled:animated:", [v4 disableSoftwareKeyboard], 1);
}

- (void)setKeyboardDisabled:(BOOL)a3
{
}

- (void)setKeyboardDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_keyboardDisabled != a3)
  {
    self->_keyboardDisabled = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1003906F8;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    [(CarUserInputCell *)self _updateConstraintsAnimated:a4 alongWithAnimation:v4 completion:0];
  }
}

- (void)_updateConstraintsAnimated:(BOOL)a3 alongWithAnimation:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  unsigned int v10 = [(CarUserInputCell *)self _siriButtonShouldBeExpanded];
  currentKeyboardConstraints = self->_currentKeyboardConstraints;
  if (currentKeyboardConstraints
    && v10 == [(NSArray *)currentKeyboardConstraints isEqualToArray:self->_keyboardDisabledConstraints])
  {
    v12 = 0;
  }
  else
  {
    v12 = v26;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100390978;
    v26[3] = &unk_1012E6300;
    char v27 = v10;
    v26[4] = self;
  }
  v13 = objc_retainBlock(v12);
  v14 = [(CarUserInputCell *)self contentView];
  [v14 bringSubviewToFront:self->_dictationButton];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100390A2C;
  v22[3] = &unk_1012E6CE0;
  id v15 = v8;
  v22[4] = self;
  id v23 = v15;
  char v25 = v10;
  v16 = v13;
  id v24 = v16;
  v17 = objc_retainBlock(v22);
  v18 = v17;
  if (v6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100390AB4;
    v20[3] = &unk_1012E5F78;
    v20[4] = self;
    v21 = v17;
    +[UIView animateWithDuration:v20 animations:v9 completion:0.2];
  }
  else
  {
    ((void (*)(void *))v17[2])(v17);
    v19 = [(CarUserInputCell *)self contentView];
    [v19 setNeedsLayout];

    if (v9) {
      v9[2](v9, 1);
    }
  }
}

- (void)_handleDictationSelectPressGesture:(id)a3
{
  id v4 = [(CarUserInputCell *)self delegate];
  [v4 userInputCell:self didSelectAction:0 usingInteractionModel:2];
}

- (void)_handleDictationTouchGesture:(id)a3
{
  id v4 = [(CarUserInputCell *)self delegate];
  [v4 userInputCell:self didSelectAction:0 usingInteractionModel:1];
}

- (void)_handleKeyboardSelectPressGesture:(id)a3
{
  id v4 = [(CarUserInputCell *)self delegate];
  [v4 userInputCell:self didSelectAction:1 usingInteractionModel:2];
}

- (void)_handleKeyboardTouchGesture:(id)a3
{
  id v4 = [(CarUserInputCell *)self delegate];
  [v4 userInputCell:self didSelectAction:1 usingInteractionModel:1];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  dictationButton = self->_dictationButton;
  v2 = +[NSArray arrayWithObjects:&dictationButton count:1];

  return (NSArray *)v2;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarUserInputCell *)self _siriButtonShouldBeExpanded])
  {
    dictationButton = self->_dictationButton;
    p_dictationButton = &dictationButton;
    uint64_t v4 = 1;
  }
  else
  {
    keyboardButton = self->_keyboardButton;
    id v8 = self->_dictationButton;
    v9 = keyboardButton;
    p_dictationButton = &v8;
    uint64_t v4 = 2;
  }
  BOOL v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_dictationButton, v4, v8, v9, dictationButton);

  return (NSArray *)v6;
}

- (CarUserInputCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarUserInputCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isKeyboardDisabled
{
  return self->_keyboardDisabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentKeyboardConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardEnabledConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardDisabledConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);

  objc_storeStrong((id *)&self->_dictationButton, 0);
}

@end