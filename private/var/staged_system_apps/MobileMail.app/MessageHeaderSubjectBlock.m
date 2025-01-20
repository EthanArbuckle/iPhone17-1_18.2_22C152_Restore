@interface MessageHeaderSubjectBlock
- (MessageHeaderSubjectBlock)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)firstBaselineConstraint;
- (NSLayoutConstraint)lastBaselineConstraint;
- (UILabel)subjectLabel;
- (UIStackView)subjectStackView;
- (UITextView)subjectTextView;
- (double)_subjectMaxOffset;
- (id)_contextForDDDetectionController;
- (id)_subjectFont;
- (void)_updateFonts;
- (void)_updateSubjectText;
- (void)createPrimaryViews;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)initializePrimaryLayoutConstraints;
- (void)prepareForReuse;
- (void)setDisplayMetrics:(id)a3;
- (void)setFirstBaselineConstraint:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setLastBaselineConstraint:(id)a3;
- (void)setSeparatorIsHidden:(BOOL)a3;
- (void)setSubjectLabel:(id)a3;
- (void)setSubjectStackView:(id)a3;
- (void)setSubjectTextView:(id)a3;
@end

@implementation MessageHeaderSubjectBlock

- (MessageHeaderSubjectBlock)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MessageHeaderSubjectBlock;
  v3 = -[MessageHeaderSubjectBlock initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];
  }
  [(MessageHeaderSubjectBlock *)v3 setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewSubjectBlock];
  return v3;
}

- (void)createPrimaryViews
{
  v22.receiver = self;
  v22.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v22 createPrimaryViews];
  v3 = +[UIStackView mf_baselineAlignedVerticalStackView];
  [(MessageHeaderSubjectBlock *)self setSubjectStackView:v3];

  v4 = [(MessageHeaderSubjectBlock *)self subjectStackView];
  [(MessageHeaderSubjectBlock *)self addSubview:v4];

  id v5 = objc_alloc((Class)UITextView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[UIColor mailComposeTextViewBackgroundColor];
  [v9 setBackgroundColor:v10];

  [v9 setClipsToBounds:0];
  [v9 setScrollEnabled:0];
  [v9 setSelectable:1];
  [v9 setEditable:0];
  [v9 setDataDetectorTypes:-1];
  v11 = [v9 textContainer];
  [v11 setMaximumNumberOfLines:13];

  v12 = [v9 textContainer];
  [v12 setLineFragmentPadding:0.0];

  v13 = [v9 textContainer];
  [v13 setLineBreakMode:4];

  v14 = +[UIColor labelColor];
  [v9 setTextColor:v14];

  uint64_t v15 = MSAccessibilityIdentifierMailMessageViewSubjectLabel;
  [v9 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageViewSubjectLabel];
  v16 = [v9 linkTextAttributes];
  id v17 = [v16 mutableCopy];

  [v17 setObject:&__kCFBooleanTrue forKey:NSUnderlineStyleAttributeName];
  [v9 setLinkTextAttributes:v17];
  v18 = [(MessageHeaderSubjectBlock *)self subjectStackView];
  [v18 addArrangedSubview:v9];

  [(MessageHeaderSubjectBlock *)self setSubjectTextView:v9];
  id v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = +[UIColor clearColor];
  [v19 setBackgroundColor:v20];

  [v19 setClipsToBounds:0];
  [v19 setNumberOfLines:13];
  [v19 setLineBreakMode:4];
  v21 = +[UIColor labelColor];
  [v19 setTextColor:v21];

  [v19 setAccessibilityIdentifier:v15];
  [(MessageHeaderSubjectBlock *)self setSubjectLabel:v19];
  [(MessageHeaderSubjectBlock *)self _updateFonts];
}

- (void)initializePrimaryLayoutConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v23 initializePrimaryLayoutConstraints];
  v3 = [(MessageHeaderSubjectBlock *)self subjectStackView];
  [(MessageHeaderSubjectBlock *)self _subjectMaxOffset];
  double v5 = v4;
  objc_super v6 = [v3 firstBaselineAnchor];
  v7 = [(MessageHeaderSubjectBlock *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [(MessageHeaderSubjectBlock *)self setFirstBaselineConstraint:v8];

  id v9 = [(MessageHeaderSubjectBlock *)self bottomAnchor];
  v10 = [v3 lastBaselineAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [(MessageHeaderSubjectBlock *)self setLastBaselineConstraint:v11];

  objc_super v22 = [v3 leadingAnchor];
  v21 = [(MessageHeaderSubjectBlock *)self layoutMarginsGuide];
  v12 = [v21 leadingAnchor];
  v13 = [v22 constraintEqualToAnchor:v12 constant:-v5];
  v24[0] = v13;
  v14 = [v3 trailingAnchor];
  uint64_t v15 = [(MessageHeaderSubjectBlock *)self layoutMarginsGuide];
  v16 = [v15 trailingAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16 constant:v5];
  v24[1] = v17;
  v18 = [(MessageHeaderSubjectBlock *)self firstBaselineConstraint];
  v24[2] = v18;
  id v19 = [(MessageHeaderSubjectBlock *)self lastBaselineConstraint];
  v24[3] = v19;
  v20 = +[NSArray arrayWithObjects:v24 count:4];

  +[NSLayoutConstraint activateConstraints:v20];
}

- (void)setDisplayMetrics:(id)a3
{
  id v4 = a3;
  double v5 = [(MessageHeaderSubjectBlock *)self displayMetrics];
  v22.receiver = self;
  v22.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v22 setDisplayMetrics:v4];
  objc_super v6 = [(MessageHeaderSubjectBlock *)self displayMetrics];
  if (v6)
  {
    [v4 firstSeparatorToSubjectBaseline];
    double v8 = v7;
    [v5 firstSeparatorToSubjectBaseline];
    if (v8 != v9)
    {

LABEL_5:
      v14 = [(MessageHeaderSubjectBlock *)self displayMetrics];
      [v14 firstSeparatorToSubjectBaseline];
      double v16 = v15;
      id v17 = [(MessageHeaderSubjectBlock *)self firstBaselineConstraint];
      [v17 setConstant:v16];

      v18 = [(MessageHeaderSubjectBlock *)self displayMetrics];
      [v18 headerBottomPadding];
      double v20 = v19;
      v21 = [(MessageHeaderSubjectBlock *)self lastBaselineConstraint];
      [v21 setConstant:v20];

      goto LABEL_6;
    }
    [v4 headerBottomPadding];
    double v11 = v10;
    [v5 headerBottomPadding];
    double v13 = v12;

    if (v11 != v13) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v3 setSeparatorIsHidden:1];
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MessageHeaderSubjectBlock *)self interactivelyResizing];
  v10.receiver = self;
  v10.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v10 setInteractivelyResizing:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      objc_super v6 = [(MessageHeaderSubjectBlock *)self subjectTextView];
      [(MessageHeaderSubjectBlock *)self subjectLabel];
    }
    else
    {
      objc_super v6 = [(MessageHeaderSubjectBlock *)self subjectLabel];
      [(MessageHeaderSubjectBlock *)self subjectTextView];
    double v7 = };
    double v8 = [(MessageHeaderSubjectBlock *)self subjectStackView];
    [v8 removeArrangedSubview:v6];

    [v6 removeFromSuperview];
    double v9 = [(MessageHeaderSubjectBlock *)self subjectStackView];
    [v9 addArrangedSubview:v7];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v3 prepareForReuse];
  [(MessageHeaderSubjectBlock *)self setHidden:0];
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageHeaderSubjectBlock;
  [(MessageHeaderSubjectBlock *)&v5 displayMessageUsingViewModel:v4];
  [(MessageHeaderSubjectBlock *)self _updateSubjectText];
}

- (double)_subjectMaxOffset
{
  return 7.0;
}

- (void)_updateSubjectText
{
  objc_super v3 = [(MessageHeaderSubjectBlock *)self viewModel];
  id v11 = [v3 subject];

  if ([v11 length])
  {
    id v4 = +[DDDetectionController sharedController];
    objc_super v5 = [(MessageHeaderSubjectBlock *)self _contextForDDDetectionController];
    objc_super v6 = [(MessageHeaderSubjectBlock *)self subjectTextView];
    [v4 setContext:v5 forContainer:v6];

    double v7 = +[ECSubjectFormatter subjectStringForDisplayForSubject:v11];
  }
  else
  {
    double v8 = +[NSBundle mainBundle];
    double v7 = [v8 localizedStringForKey:@"NO_SUBJECT" value:&stru_100619928 table:@"Main"];
  }
  double v9 = [(MessageHeaderSubjectBlock *)self subjectTextView];
  [v9 setText:v7];

  objc_super v10 = [(MessageHeaderSubjectBlock *)self subjectLabel];
  [v10 setText:v7];
}

- (id)_contextForDDDetectionController
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MessageHeaderSubjectBlock *)self viewModel];
  objc_super v5 = [v4 subject];
  objc_super v6 = [v5 subjectWithoutPrefix];

  double v7 = [(MessageHeaderSubjectBlock *)self viewModel];
  double v8 = [v7 dateSent];

  if (v6) {
    [v3 setObject:v6 forKey:kDataDetectorsEventTitleKey];
  }
  if (v8) {
    [v3 setObject:v8 forKey:kDataDetectorsReferenceDateKey];
  }
  if (![v3 count])
  {

    objc_super v3 = 0;
  }

  return v3;
}

- (void)_updateFonts
{
  id v5 = [(MessageHeaderSubjectBlock *)self _subjectFont];
  objc_super v3 = [(MessageHeaderSubjectBlock *)self subjectTextView];
  [v3 setFont:v5];

  id v4 = [(MessageHeaderSubjectBlock *)self subjectLabel];
  [v4 setFont:v5];
}

- (id)_subjectFont
{
  objc_super v3 = +[MFFontMetricCache sharedFontMetricCache];
  id v4 = [(MessageHeaderSubjectBlock *)self displayMetrics];
  unsigned int v5 = [v4 hasCompactLayout];

  if (v5) {
    objc_super v6 = &stru_1006091E0;
  }
  else {
    objc_super v6 = &stru_100609200;
  }
  if (v5) {
    CFStringRef v7 = @"MessageHeaderSubjectBlock.compactSubjectFont";
  }
  else {
    CFStringRef v7 = @"MessageHeaderSubjectBlock.regularSubjectFont";
  }
  double v8 = [v3 cachedFont:v6 forKey:v7];

  return v8;
}

- (UIStackView)subjectStackView
{
  return self->_subjectStackView;
}

- (void)setSubjectStackView:(id)a3
{
}

- (UITextView)subjectTextView
{
  return self->_subjectTextView;
}

- (void)setSubjectTextView:(id)a3
{
}

- (UILabel)subjectLabel
{
  return self->_subjectLabel;
}

- (void)setSubjectLabel:(id)a3
{
}

- (NSLayoutConstraint)firstBaselineConstraint
{
  return self->_firstBaselineConstraint;
}

- (void)setFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)lastBaselineConstraint
{
  return self->_lastBaselineConstraint;
}

- (void)setLastBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_subjectTextView, 0);

  objc_storeStrong((id *)&self->_subjectStackView, 0);
}

@end