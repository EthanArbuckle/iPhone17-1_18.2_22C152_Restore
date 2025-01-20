@interface CarAlertViewController
+ (id)_calloutFixedFontWithSymbolicTraits:(unsigned int)a3;
+ (id)_messageAttributes;
+ (id)_messageAttributesSmallText;
+ (id)_textAttributes;
+ (id)_titleAttributes;
- (CarAlertViewController)init;
- (CarAlertViewController)initWithResultBlock:(id)a3;
- (CarButtonGridView)buttonGrid;
- (NSArray)actions;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSAttributedString)alertAttributedMessage;
- (NSMutableArray)buttons;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (UIButton)preferredButton;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)backButtonRecognizer;
- (id)_buttonFont;
- (id)_buttonWithTitle:(id)a3 index:(int64_t)a4;
- (id)_messageAttributedString;
- (id)_messageAttributedStringSmallText;
- (id)_titleAttributedString;
- (id)resultBlock;
- (int64_t)tag;
- (void)_buttonTapped:(id)a3;
- (void)_dismissWithResult:(int64_t)a3 buttonIndex:(int64_t)a4;
- (void)_handleBackButtonPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateSubviews;
- (void)dismiss;
- (void)reset;
- (void)setActions:(id)a3;
- (void)setAlertAttributedMessage:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setBackButtonRecognizer:(id)a3;
- (void)setButtonGrid:(id)a3;
- (void)setButtons:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setPreferredButton:(id)a3;
- (void)setResultBlock:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)supersede;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarAlertViewController

- (CarAlertViewController)init
{
  return [(CarAlertViewController *)self initWithResultBlock:0];
}

- (CarAlertViewController)initWithResultBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarAlertViewController;
  v5 = [(CarAlertViewController *)&v11 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [v4 copy];
    id resultBlock = v5->_resultBlock;
    v5->_id resultBlock = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buttons = v5->_buttons;
    v5->_buttons = v8;
  }
  return v5;
}

- (void)setAlertTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  alertTitle = self->_alertTitle;
  self->_alertTitle = v4;

  [(CarAlertViewController *)self _updateSubviews];
}

- (void)setAlertMessage:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  alertMessage = self->_alertMessage;
  self->_alertMessage = v4;

  [(CarAlertViewController *)self _updateSubviews];
}

- (void)setActions:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_actions, a3);
  if ([v10 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v10 objectAtIndexedSubscript:v5];
      v7 = [v6 title];
      v8 = [(CarAlertViewController *)self _buttonWithTitle:v7 index:v5];

      [v8 setCancels:[v6 cancels]];
      v9 = [(CarAlertViewController *)self buttons];
      [v9 addObject:v8];

      if (([v6 cancels] & 1) == 0) {
        [(CarAlertViewController *)self setPreferredButton:v8];
      }

      ++v5;
    }
    while (v5 < (unint64_t)[v10 count]);
  }
  [(CarAlertViewController *)self _updateSubviews];
}

+ (id)_textAttributes
{
  id v2 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v2 setAlignment:1];
  [v2 setLineBreakMode:0];
  v7[0] = NSForegroundColorAttributeName;
  v3 = +[UIColor labelColor];
  v7[1] = NSParagraphStyleAttributeName;
  v8[0] = v3;
  v8[1] = v2;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  unint64_t v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  return v5;
}

+ (id)_titleAttributes
{
  id v2 = [a1 _textAttributes];
  NSAttributedStringKey v6 = NSFontAttributeName;
  v3 = +[UIFont _maps_boldSystemFontWithFixedSize:22.0];
  v7 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 addEntriesFromDictionary:v4];

  return v2;
}

- (id)_titleAttributedString
{
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = [(CarAlertViewController *)self alertTitle];
  unint64_t v5 = [(id)objc_opt_class() _titleAttributes];
  id v6 = [v3 initWithString:v4 attributes:v5];

  return v6;
}

+ (id)_calloutFixedFontWithSymbolicTraits:(unsigned int)a3
{
  id v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout addingSymbolicTraits:*(void *)&a3 options:0];
  id v4 = +[UIFont fontWithDescriptor:v3 size:16.0];

  return v4;
}

+ (id)_messageAttributes
{
  id v3 = [a1 _textAttributes];
  NSAttributedStringKey v7 = NSFontAttributeName;
  id v4 = [a1 _calloutFixedFontWithSymbolicTraits:0];
  v8 = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 addEntriesFromDictionary:v5];

  return v3;
}

- (id)_messageAttributedString
{
  id v3 = [(CarAlertViewController *)self alertAttributedMessage];

  if (v3)
  {
    id v4 = [(CarAlertViewController *)self alertAttributedMessage];
  }
  else
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    id v6 = [(CarAlertViewController *)self alertMessage];
    NSAttributedStringKey v7 = [(id)objc_opt_class() _messageAttributes];
    id v4 = [v5 initWithString:v6 attributes:v7];
  }

  return v4;
}

+ (id)_messageAttributesSmallText
{
  id v2 = [a1 _textAttributes];
  NSAttributedStringKey v6 = NSFontAttributeName;
  id v3 = +[UIFont systemFontOfSize:12.0];
  NSAttributedStringKey v7 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 addEntriesFromDictionary:v4];

  return v2;
}

- (id)_messageAttributedStringSmallText
{
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = [(CarAlertViewController *)self alertMessage];
  id v5 = [(id)objc_opt_class() _messageAttributesSmallText];
  id v6 = [v3 initWithString:v4 attributes:v5];

  return v6;
}

- (id)_buttonWithTitle:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  NSAttributedStringKey v7 = +[CarFocusableButton button];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setModifiesBackgroundColor:1];
  v8 = +[UIColor _carSystemQuaternaryColor];
  [v7 setNonFocusedBackgroundColor:v8];

  v9 = +[UIColor _carSystemQuaternaryColor];
  [v7 setBackgroundColor:v9];

  id v10 = +[UIColor _carSystemFocusColor];
  [v7 setTintColor:v10];

  [v7 _setContinuousCornerRadius:8.0];
  objc_super v11 = [(CarAlertViewController *)self _buttonFont];
  v12 = [v7 titleLabel];
  [v12 setFont:v11];

  [v7 setTitle:v6 forState:0];
  [v7 setIndex:a4];
  [v7 addTarget:self action:"_buttonTapped:" forControlEvents:64];
  v13 = [v7 widthAnchor];
  v14 = [v13 constraintLessThanOrEqualToConstant:241.0];
  v19[0] = v14;
  v15 = [v7 heightAnchor];
  v16 = [v15 constraintEqualToConstant:40.0];
  v19[1] = v16;
  v17 = +[NSArray arrayWithObjects:v19 count:2];
  [v7 addConstraints:v17];

  return v7;
}

- (id)_buttonFont
{
  id v2 = objc_opt_class();

  return [v2 _calloutFixedFontWithSymbolicTraits:2];
}

- (void)_buttonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 index];
  unsigned int v6 = [v4 cancels];

  [(CarAlertViewController *)self _dismissWithResult:v6 buttonIndex:v5];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CarAlertViewController;
  [(CarAlertViewController *)&v6 viewDidLoad];
  id v3 = [(CarAlertViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarAlertView"];

  id v4 = [(CarAlertViewController *)self view];
  id v5 = +[UIColor tableBackgroundColor];
  [v4 setBackgroundColor:v5];

  [(CarAlertViewController *)self _setupSubviews];
  [(CarAlertViewController *)self _setupConstraints];
  [(CarAlertViewController *)self _updateSubviews];
}

- (void)_setupSubviews
{
  id v3 = objc_alloc_init((Class)UILabel);
  [(CarAlertViewController *)self setTitleLabel:v3];

  id v4 = [(CarAlertViewController *)self titleLabel];
  [v4 setAccessibilityIdentifier:@"TitleLabel"];

  id v5 = [(CarAlertViewController *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(CarAlertViewController *)self titleLabel];
  [v6 setNumberOfLines:0];

  NSAttributedStringKey v7 = [(CarAlertViewController *)self view];
  v8 = [(CarAlertViewController *)self titleLabel];
  [v7 addSubview:v8];

  id v9 = objc_alloc_init((Class)UILabel);
  [(CarAlertViewController *)self setMessageLabel:v9];

  id v10 = [(CarAlertViewController *)self messageLabel];
  [v10 setAccessibilityIdentifier:@"MessageLabel"];

  objc_super v11 = [(CarAlertViewController *)self messageLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(CarAlertViewController *)self messageLabel];
  [v12 setNumberOfLines:0];

  v13 = [(CarAlertViewController *)self view];
  v14 = [(CarAlertViewController *)self messageLabel];
  [v13 addSubview:v14];

  v15 = -[CarButtonGridView initWithFrame:]([CarButtonGridView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarAlertViewController *)self setButtonGrid:v15];

  v16 = [(CarAlertViewController *)self buttonGrid];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v18 = [(CarAlertViewController *)self view];
  v17 = [(CarAlertViewController *)self buttonGrid];
  [v18 addSubview:v17];
}

- (void)_updateSubviews
{
  if (![(CarAlertViewController *)self isViewLoaded]) {
    return;
  }
  uint64_t v3 = [(CarAlertViewController *)self alertTitle];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(CarAlertViewController *)self titleLabel];
    objc_super v6 = [v5 text];
    NSAttributedStringKey v7 = [(CarAlertViewController *)self alertTitle];
    unsigned __int8 v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      v12 = [(CarAlertViewController *)self titleLabel];
      [v12 setHidden:0];

      objc_super v11 = [(CarAlertViewController *)self titleLabel];
      v13 = [(CarAlertViewController *)self _titleAttributedString];
      [v11 setAttributedText:v13];

      goto LABEL_7;
    }
  }
  id v9 = [(CarAlertViewController *)self alertTitle];

  if (!v9)
  {
    id v10 = [(CarAlertViewController *)self titleLabel];
    [v10 setHidden:1];

    objc_super v11 = [(CarAlertViewController *)self titleLabel];
    [v11 setText:0];
LABEL_7:
  }
  uint64_t v14 = [(CarAlertViewController *)self alertAttributedMessage];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(CarAlertViewController *)self messageLabel];
    v17 = [v16 attributedText];
    id v18 = [(CarAlertViewController *)self alertAttributedMessage];
    unsigned __int8 v19 = [v17 isEqualToAttributedString:v18];

    if ((v19 & 1) == 0)
    {
      v30 = [(CarAlertViewController *)self messageLabel];
      [v30 setHidden:0];

      uint64_t v31 = [(CarAlertViewController *)self alertAttributedMessage];
LABEL_17:
      v26 = (void *)v31;
      v33 = [(CarAlertViewController *)self messageLabel];
      [v33 setAttributedText:v26];

      goto LABEL_18;
    }
  }
  uint64_t v20 = [(CarAlertViewController *)self alertMessage];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(CarAlertViewController *)self messageLabel];
    v23 = [v22 text];
    v24 = [(CarAlertViewController *)self alertMessage];
    unsigned __int8 v25 = [v23 isEqualToString:v24];

    if ((v25 & 1) == 0)
    {
      v32 = [(CarAlertViewController *)self messageLabel];
      [v32 setHidden:0];

      uint64_t v31 = [(CarAlertViewController *)self _messageAttributedString];
      goto LABEL_17;
    }
  }
  v26 = [(CarAlertViewController *)self alertMessage];
  if (v26)
  {
LABEL_18:

    goto LABEL_19;
  }
  v27 = [(CarAlertViewController *)self alertAttributedMessage];

  if (!v27)
  {
    v28 = [(CarAlertViewController *)self messageLabel];
    [v28 setHidden:1];

    v29 = [(CarAlertViewController *)self messageLabel];
    [v29 setText:0];

    v26 = [(CarAlertViewController *)self messageLabel];
    [v26 setAttributedText:0];
    goto LABEL_18;
  }
LABEL_19:
  v34 = [(CarAlertViewController *)self buttonGrid];
  v35 = [v34 buttons];
  v36 = [(CarAlertViewController *)self buttons];
  unsigned __int8 v37 = [v35 isEqualToArray:v36];

  if ((v37 & 1) == 0)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v38 = [(CarAlertViewController *)self buttons];
    id v39 = [v38 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v52;
      do
      {
        v42 = 0;
        do
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v42);
          v44 = [(CarAlertViewController *)self buttonGrid];
          [v44 addButton:v43];

          if ([v43 cancels])
          {
            v45 = [(CarAlertViewController *)self backButtonRecognizer];

            if (!v45)
            {
              id v46 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleBackButtonPressed:"];
              [(CarAlertViewController *)self setBackButtonRecognizer:v46];

              v47 = [(CarAlertViewController *)self backButtonRecognizer];
              [v47 setAllowedPressTypes:&off_1013AE790];

              v48 = [(CarAlertViewController *)self view];
              v49 = [(CarAlertViewController *)self backButtonRecognizer];
              [v48 addGestureRecognizer:v49];
            }
          }
          v42 = (char *)v42 + 1;
        }
        while (v40 != v42);
        id v40 = [v38 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v40);
    }
  }
  v50 = [(CarAlertViewController *)self view];
  [v50 setNeedsLayout];
}

- (void)reset
{
  uint64_t v3 = [(CarAlertViewController *)self backButtonRecognizer];

  if (v3)
  {
    id v4 = [(CarAlertViewController *)self view];
    id v5 = [(CarAlertViewController *)self backButtonRecognizer];
    [v4 removeGestureRecognizer:v5];

    [(CarAlertViewController *)self setBackButtonRecognizer:0];
  }
  objc_storeWeak((id *)&self->_preferredButton, 0);
  [(NSMutableArray *)self->_buttons removeAllObjects];
  [(CarButtonGridView *)self->_buttonGrid resetButtons];
  alertTitle = self->_alertTitle;
  self->_alertTitle = 0;

  alertMessage = self->_alertMessage;
  self->_alertMessage = 0;

  alertAttributedMessage = self->_alertAttributedMessage;
  self->_alertAttributedMessage = 0;

  id resultBlock = self->_resultBlock;
  self->_id resultBlock = 0;

  [(CarAlertViewController *)self _updateSubviews];
}

- (void)_setupConstraints
{
  id v72 = objc_alloc_init((Class)UILayoutGuide);
  uint64_t v3 = [(CarAlertViewController *)self view];
  [v3 addLayoutGuide:v72];

  v71 = [(CarAlertViewController *)self titleLabel];
  v69 = [v71 firstBaselineAnchor];
  v70 = [(CarAlertViewController *)self view];
  v68 = [v70 safeAreaLayoutGuide];
  v67 = [v68 topAnchor];
  v66 = [v69 constraintEqualToAnchor:v67 constant:40.0];
  v73[0] = v66;
  v65 = [(CarAlertViewController *)self titleLabel];
  v62 = [v65 leadingAnchor];
  v64 = [(CarAlertViewController *)self view];
  v63 = [v64 safeAreaLayoutGuide];
  v61 = [v63 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:12.0];
  v73[1] = v60;
  v59 = [(CarAlertViewController *)self view];
  v58 = [v59 safeAreaLayoutGuide];
  v56 = [v58 trailingAnchor];
  v57 = [(CarAlertViewController *)self titleLabel];
  v55 = [v57 trailingAnchor];
  long long v54 = [v56 constraintEqualToAnchor:v55 constant:12.0];
  v73[2] = v54;
  long long v53 = [(CarAlertViewController *)self messageLabel];
  long long v51 = [v53 firstBaselineAnchor];
  long long v52 = [(CarAlertViewController *)self titleLabel];
  v50 = [v52 lastBaselineAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:30.0];
  v73[3] = v49;
  v48 = [(CarAlertViewController *)self messageLabel];
  id v46 = [v48 leadingAnchor];
  v47 = [(CarAlertViewController *)self view];
  v45 = [v47 safeAreaLayoutGuide];
  v44 = [v45 leadingAnchor];
  v43 = [v46 constraintEqualToAnchor:v44 constant:12.0];
  v73[4] = v43;
  v42 = [(CarAlertViewController *)self view];
  uint64_t v41 = [v42 safeAreaLayoutGuide];
  id v39 = [v41 trailingAnchor];
  id v40 = [(CarAlertViewController *)self messageLabel];
  v38 = [v40 trailingAnchor];
  unsigned __int8 v37 = [v39 constraintEqualToAnchor:v38 constant:12.0];
  v73[5] = v37;
  v36 = [(CarAlertViewController *)self buttonGrid];
  v34 = [v36 topAnchor];
  v35 = [(CarAlertViewController *)self messageLabel];
  v33 = [v35 lastBaselineAnchor];
  v32 = [v34 constraintGreaterThanOrEqualToAnchor:v33 constant:14.0];
  v73[6] = v32;
  v30 = [(CarAlertViewController *)self buttonGrid];
  v27 = [v30 leadingAnchor];
  v29 = [(CarAlertViewController *)self view];
  v28 = [v29 safeAreaLayoutGuide];
  v26 = [v28 leadingAnchor];
  unsigned __int8 v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26 constant:20.0];
  v73[7] = v25;
  v24 = [(CarAlertViewController *)self view];
  v23 = [v24 safeAreaLayoutGuide];
  v21 = [v23 trailingAnchor];
  v22 = [(CarAlertViewController *)self buttonGrid];
  uint64_t v20 = [v22 trailingAnchor];
  unsigned __int8 v19 = [v21 constraintGreaterThanOrEqualToAnchor:v20 constant:20.0];
  v73[8] = v19;
  id v18 = [(CarAlertViewController *)self buttonGrid];
  v17 = [v18 widthAnchor];
  v16 = [v17 constraintEqualToConstant:360.0];
  v73[9] = v16;
  v15 = [(CarAlertViewController *)self buttonGrid];
  uint64_t v14 = [v15 centerXAnchor];
  id v4 = [(CarAlertViewController *)self view];
  id v5 = [v4 safeAreaLayoutGuide];
  objc_super v6 = [v5 centerXAnchor];
  NSAttributedStringKey v7 = [v14 constraintEqualToAnchor:v6];
  v73[10] = v7;
  unsigned __int8 v8 = [(CarAlertViewController *)self view];
  id v9 = [v8 safeAreaLayoutGuide];
  id v10 = [v9 bottomAnchor];
  objc_super v11 = [(CarAlertViewController *)self buttonGrid];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:35.0];
  v73[11] = v13;
  uint64_t v31 = +[NSArray arrayWithObjects:v73 count:12];

  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3 = [(CarAlertViewController *)self alertAttributedMessage];

  if (!v3)
  {
    id v12 = [(CarAlertViewController *)self messageLabel];
    [v12 frame];
    if (v4 > 0.0)
    {
      id v5 = [(CarAlertViewController *)self messageLabel];
      [v5 intrinsicContentSize];
      double v7 = v6;
      unsigned __int8 v8 = [(CarAlertViewController *)self messageLabel];
      [v8 frame];
      double v10 = v9;

      if (v7 <= v10) {
        return;
      }
      id v12 = [(CarAlertViewController *)self messageLabel];
      objc_super v11 = [(CarAlertViewController *)self _messageAttributedStringSmallText];
      [v12 setAttributedText:v11];
    }
  }
}

- (void)dismiss
{
}

- (void)_dismissWithResult:(int64_t)a3 buttonIndex:(int64_t)a4
{
  double v7 = [(CarAlertViewController *)self resultBlock];

  if (v7)
  {
    unsigned __int8 v8 = [(CarAlertViewController *)self resultBlock];
    v8[2](v8, self, a3, a4);
  }
}

- (void)supersede
{
}

- (void)_handleBackButtonPressed:(id)a3
{
  double v4 = [(CarAlertViewController *)self buttons];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C12D18;
  v5[3] = &unk_10131B858;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarAlertViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(CarAlertViewController *)self buttons];
    double v4 = [(CarAlertViewController *)self buttons];
    id v5 = [v4 indexesOfObjectsPassingTest:&stru_10131B898];
    double v6 = [v3 objectsAtIndexes:v5];
  }
  else
  {
    double v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarAlertViewController *)self isViewLoaded]
    && ([(CarAlertViewController *)self preferredButton],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = objc_msgSend(v3, "_maps_isVisible"),
        v3,
        v4))
  {
    id v5 = [(CarAlertViewController *)self preferredButton];
    unsigned __int8 v8 = v5;
    double v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    double v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSAttributedString)alertAttributedMessage
{
  return self->_alertAttributedMessage;
}

- (void)setAlertAttributedMessage:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (CarButtonGridView)buttonGrid
{
  return self->_buttonGrid;
}

- (void)setButtonGrid:(id)a3
{
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIButton)preferredButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredButton);

  return (UIButton *)WeakRetained;
}

- (void)setPreferredButton:(id)a3
{
}

- (UITapGestureRecognizer)backButtonRecognizer
{
  return self->_backButtonRecognizer;
}

- (void)setBackButtonRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButtonRecognizer, 0);
  objc_destroyWeak((id *)&self->_preferredButton);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_buttonGrid, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_alertAttributedMessage, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);

  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end