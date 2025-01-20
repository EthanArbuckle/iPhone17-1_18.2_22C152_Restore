@interface RAPReportComposerCommentTableViewCell
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (NSString)commentText;
- (NSString)placeholderText;
- (RAPReportComposerCommentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)preferredHeight;
- (id)textDidChange;
- (int)analyticTarget;
- (unint64_t)maximumTextLength;
- (void)_setFont;
- (void)_textDidChange;
- (void)beginEditingCommentIfPossible;
- (void)setAnalyticTarget:(int)a3;
- (void)setCommentText:(id)a3;
- (void)setMaximumTextLength:(unint64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setPropertiesFromQuestion:(id)a3;
- (void)setTextDidChange:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
@end

@implementation RAPReportComposerCommentTableViewCell

- (double)preferredHeight
{
  v2 = [(TextViewWithPlaceholderText *)self->_textView font];
  [v2 _mapkit_scaledValueForValue:146.0];
  double v4 = v3;

  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width = a3.width;
  [(RAPReportComposerCommentTableViewCell *)self intrinsicContentSize];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(RAPReportComposerCommentTableViewCell *)self preferredHeight];
  double v3 = v2;
  double v4 = UITableViewAutomaticDimension;
  result.height = v3;
  result.CGFloat width = v4;
  return result;
}

- (RAPReportComposerCommentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v39.receiver = self;
  v39.super_class = (Class)RAPReportComposerCommentTableViewCell;
  double v4 = [(RAPReportComposerCommentTableViewCell *)&v39 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    v4->_maximumTextLength = -1;
    [(RAPReportComposerCommentTableViewCell *)v4 setSelectionStyle:0];
    v6 = [TextViewWithPlaceholderText alloc];
    v7 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    [v7 bounds];
    v8 = -[TextViewWithPlaceholderText initWithFrame:](v6, "initWithFrame:");
    textView = v5->_textView;
    v5->_textView = v8;

    [(TextViewWithPlaceholderText *)v5->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TextViewWithPlaceholderText *)v5->_textView setDelegate:v5];
    v10 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_textView];

    v11 = [(TextViewWithPlaceholderText *)v5->_textView heightAnchor];
    [(RAPReportComposerCommentTableViewCell *)v5 preferredHeight];
    uint64_t v12 = [v11 constraintEqualToConstant:];
    heightConstraint = v5->_heightConstraint;
    v5->_heightConstraint = (NSLayoutConstraint *)v12;

    v37 = [(TextViewWithPlaceholderText *)v5->_textView leadingAnchor];
    v38 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    v36 = [v38 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:5.0];
    v40[0] = v35;
    v33 = [(TextViewWithPlaceholderText *)v5->_textView trailingAnchor];
    v34 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    v32 = [v34 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:-5.0];
    v40[1] = v31;
    v30 = [(TextViewWithPlaceholderText *)v5->_textView topAnchor];
    v14 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    v15 = [v14 topAnchor];
    v16 = [v30 constraintEqualToAnchor:v15 constant:10.0];
    v40[2] = v16;
    v17 = [(TextViewWithPlaceholderText *)v5->_textView bottomAnchor];
    v18 = [(RAPReportComposerCommentTableViewCell *)v5 contentView];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19 constant:-10.0];
    v40[3] = v20;
    v40[4] = v5->_heightConstraint;
    v21 = +[NSArray arrayWithObjects:v40 count:5];
    +[NSLayoutConstraint activateConstraints:v21];

    [(RAPReportComposerCommentTableViewCell *)v5 _setFont];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v5 selector:"_setFont" name:UIContentSizeCategoryDidChangeNotification object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v5 selector:"_textDidChange" name:UITextViewTextDidChangeNotification object:v5->_textView];

    [(NSLayoutConstraint *)v5->_heightConstraint setActive:1];
    v24 = [(RAPReportComposerCommentTableViewCell *)v5 traitCollection];
    id v25 = [v24 userInterfaceIdiom];

    if (v25 == (id)5)
    {
      -[TextViewWithPlaceholderText setTextContainerInset:](v5->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
      v26 = +[UIColor systemGray6Color];
      [(TextViewWithPlaceholderText *)v5->_textView setBackgroundColor:v26];

      v27 = [(TextViewWithPlaceholderText *)v5->_textView layer];
      [v27 setCornerRadius:7.5];

      [(TextViewWithPlaceholderText *)v5->_textView setClipsToBounds:1];
      v28 = +[UIColor clearColor];
      [(RAPReportComposerCommentTableViewCell *)v5 setBackgroundColor:v28];
    }
  }
  return v5;
}

- (void)_setFont
{
  double v3 = +[RAPFontManager regularTitleFont];
  [(TextViewWithPlaceholderText *)self->_textView setFont:v3];

  double v4 = [(TextViewWithPlaceholderText *)self->_textView font];
  double v5 = [(TextViewWithPlaceholderText *)self->_textView placeholderLabel];
  [v5 setFont:v4];

  v6 = [(TextViewWithPlaceholderText *)self->_textView placeholderLabel];
  v7 = +[UIColor tertiaryLabelColor];
  [v6 setTextColor:v7];

  [(RAPReportComposerCommentTableViewCell *)self preferredHeight];
  heightConstraint = self->_heightConstraint;

  -[NSLayoutConstraint setConstant:](heightConstraint, "setConstant:");
}

- (void)setPropertiesFromQuestion:(id)a3
{
  id v9 = a3;
  [(RAPReportComposerCommentTableViewCell *)self setMaximumTextLength:+[RAPCommentQuestion maximumCommentLength]];
  double v4 = [v9 commentsPlaceholderText];
  [(RAPReportComposerCommentTableViewCell *)self setPlaceholderText:v4];

  double v5 = [v9 comment];
  v6 = [(RAPReportComposerCommentTableViewCell *)self commentText];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [v9 comment];
    [(RAPReportComposerCommentTableViewCell *)self setCommentText:v8];
  }
}

- (void)_textDidChange
{
  id v7 = [(RAPReportComposerCommentTableViewCell *)self commentText];
  double v3 = +[RAPCommentQuestion validatedComment:v7];
  if (([v7 isEqualToString:v3] & 1) == 0) {
    [(RAPReportComposerCommentTableViewCell *)self setCommentText:v3];
  }
  double v4 = [(RAPReportComposerCommentTableViewCell *)self textDidChange];

  if (v4)
  {
    double v5 = [(RAPReportComposerCommentTableViewCell *)self textDidChange];
    v6 = [(RAPReportComposerCommentTableViewCell *)self commentText];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  if ([(RAPReportComposerCommentTableViewCell *)self analyticTarget])
  {
    uint64_t v4 = [(RAPReportComposerCommentTableViewCell *)self analyticTarget];
    +[GEOAPPortal captureUserAction:10182 target:v4 value:0];
  }
}

- (void)beginEditingCommentIfPossible
{
}

- (NSString)commentText
{
  return (NSString *)[(TextViewWithPlaceholderText *)self->_textView text];
}

- (NSString)placeholderText
{
  double v2 = [(TextViewWithPlaceholderText *)self->_textView placeholderLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setCommentText:(id)a3
{
}

- (void)setPlaceholderText:(id)a3
{
  textView = self->_textView;
  id v5 = a3;
  v6 = [(TextViewWithPlaceholderText *)textView placeholderLabel];
  [v6 setText:v5];

  id v7 = self->_textView;

  [(TextViewWithPlaceholderText *)v7 setNeedsLayout];
}

- (id)textDidChange
{
  return self->_textDidChange;
}

- (void)setTextDidChange:(id)a3
{
}

- (unint64_t)maximumTextLength
{
  return self->_maximumTextLength;
}

- (void)setMaximumTextLength:(unint64_t)a3
{
  self->_maximumTextLength = a3;
}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textDidChange, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end