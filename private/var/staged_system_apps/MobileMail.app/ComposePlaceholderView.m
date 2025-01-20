@interface ComposePlaceholderView
- (CGRect)placeholderRectInView:(id)a3;
- (ComposePlaceholderView)initWithFrame:(CGRect)a3 subject:(id)a4 modelFuture:(id)a5;
- (EFFuture)modelFuture;
- (EFPromise)contentLoadingPromise;
- (MFComposeFromView)fromField;
- (MFComposeMultiView)multiField;
- (MFComposeSubjectView)subjectField;
- (MFMailComposeRecipientTextView)bccField;
- (MFMailComposeRecipientTextView)ccField;
- (MFMailComposeToField)toField;
- (UIImageView)snapshotImageView;
- (UINavigationBar)navigationBar;
- (UIView)placeholderView;
- (WKNavigation)expectedContentNavigation;
- (id)snapshotContentUsingWebView:(id)a3;
- (void)_createSubviews;
- (void)_setSubject:(id)a3;
- (void)_updateHeadersWithModel:(id)a3;
- (void)_updateIndividualFieldsWithModel:(id)a3;
- (void)_updateMultiFieldWithModel:(id)a3;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)configureLeadingPlaceholderWithSize:(CGSize)a3;
- (void)layoutSubviews;
- (void)setBccField:(id)a3;
- (void)setCcField:(id)a3;
- (void)setContentLoadingPromise:(id)a3;
- (void)setExpectedContentNavigation:(id)a3;
- (void)setFromField:(id)a3;
- (void)setModelFuture:(id)a3;
- (void)setMultiField:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setSnapshotImageView:(id)a3;
- (void)setSubjectField:(id)a3;
- (void)setToField:(id)a3;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation ComposePlaceholderView

- (ComposePlaceholderView)initWithFrame:(CGRect)a3 subject:(id)a4 modelFuture:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ComposePlaceholderView;
  v13 = -[ComposePlaceholderView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modelFuture, a5);
    [(ComposePlaceholderView *)v14 _createSubviews];
    [(ComposePlaceholderView *)v14 _setSubject:v11];
  }

  return v14;
}

- (void)_createSubviews
{
  v3 = +[UIColor systemBackgroundColor];
  [(ComposePlaceholderView *)self setBackgroundColor:v3];

  [(ComposePlaceholderView *)self setUserInteractionEnabled:0];
  v4 = [objc_alloc((Class)UINavigationBar) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  navigationBar = self->_navigationBar;
  self->_navigationBar = v4;

  [(ComposePlaceholderView *)self addSubview:self->_navigationBar];
  id v6 = objc_alloc_init((Class)UINavigationItem);
  id v34 = v6;
  v7 = +[NSArray arrayWithObjects:&v34 count:1];
  [(UINavigationBar *)self->_navigationBar setItems:v7];

  [(ComposePlaceholderView *)self bounds];
  double Width = CGRectGetWidth(v35);
  +[MFMailComposeView preferredHeaderHeight];
  double v10 = v9;
  id v11 = [objc_alloc((Class)MFMailComposeToField) initWithFrame:0.0, 0.0, Width, v9];
  toField = self->_toField;
  self->_toField = v11;

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"TO" value:&stru_100619928 table:@"Main"];
  [(MFMailComposeToField *)self->_toField setLabel:v14];

  [(MFMailComposeToField *)self->_toField setIndicatesUnsafeRecipientsWhenCollapsed:1];
  [(MFMailComposeToField *)self->_toField setEnabled:0];
  [(ComposePlaceholderView *)self addSubview:self->_toField];
  v15 = [objc_alloc((Class)MFComposeMultiView) initWithFrame:0.0, 0.0, Width, v10];
  multiField = self->_multiField;
  self->_multiField = v15;

  [(MFComposeMultiView *)self->_multiField setUserInteractionEnabled:0];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"CC/BCC" value:&stru_100619928 table:@"Main"];
  [(MFComposeMultiView *)self->_multiField setLabel:v18];

  [(ComposePlaceholderView *)self addSubview:self->_multiField];
  v19 = [objc_alloc((Class)MFMailComposeRecipientTextView) initWithFrame:0.0, 0.0, Width, v10];
  ccField = self->_ccField;
  self->_ccField = v19;

  [(MFMailComposeRecipientTextView *)self->_ccField setIndicatesUnsafeRecipientsWhenCollapsed:1];
  [(MFMailComposeRecipientTextView *)self->_ccField setEnabled:0];
  [(MFMailComposeRecipientTextView *)self->_ccField setHidden:1];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"CC" value:&stru_100619928 table:@"Main"];
  [(MFMailComposeRecipientTextView *)self->_ccField setLabel:v22];

  [(ComposePlaceholderView *)self addSubview:self->_ccField];
  v23 = [objc_alloc((Class)MFMailComposeRecipientTextView) initWithFrame:0.0, 0.0, Width, v10];
  bccField = self->_bccField;
  self->_bccField = v23;

  [(MFMailComposeRecipientTextView *)self->_bccField setIndicatesUnsafeRecipientsWhenCollapsed:1];
  [(MFMailComposeRecipientTextView *)self->_bccField setEnabled:0];
  [(MFMailComposeRecipientTextView *)self->_bccField setHidden:1];
  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"BCC" value:&stru_100619928 table:@"Main"];
  [(MFMailComposeRecipientTextView *)self->_bccField setLabel:v26];

  [(ComposePlaceholderView *)self addSubview:self->_bccField];
  v27 = [objc_alloc((Class)MFComposeFromView) initWithFrame:0.0, 0.0, Width, v10];
  fromField = self->_fromField;
  self->_fromField = v27;

  [(MFComposeFromView *)self->_fromField setUserInteractionEnabled:0];
  [(MFComposeFromView *)self->_fromField setHidden:1];
  [(ComposePlaceholderView *)self addSubview:self->_fromField];
  v29 = [objc_alloc((Class)MFComposeSubjectView) initWithFrame:0.0, 0.0, Width, v10];
  subjectField = self->_subjectField;
  self->_subjectField = v29;

  [(MFComposeSubjectView *)self->_subjectField setEnabled:0];
  [(MFComposeSubjectView *)self->_subjectField setDelegate:self];
  [(ComposePlaceholderView *)self addSubview:self->_subjectField];
  v31 = [objc_alloc((Class)UIImageView) initWithFrame:0.0, 0.0, Width, v10];
  snapshotImageView = self->_snapshotImageView;
  self->_snapshotImageView = v31;

  v33 = +[UIColor systemBackgroundColor];
  [(UIImageView *)self->_snapshotImageView setBackgroundColor:v33];

  [(ComposePlaceholderView *)self addSubview:self->_snapshotImageView];
}

- (void)configureLeadingPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_placeholderView = (id *)&self->_placeholderView;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    [(UIView *)placeholderView bounds];
    id v8 = *p_placeholderView;
    [v8 setBounds:0.0, 0.0, width, height];
  }
  else
  {
    if (a3.width == CGSizeZero.width && a3.height == CGSizeZero.height)
    {
      id v10 = 0;
      id v12 = 0;
    }
    else
    {
      id v10 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, a3.width, a3.height];
      id v12 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v10];
    }
    objc_storeStrong(p_placeholderView, v10);
    id v11 = [(UINavigationBar *)self->_navigationBar topItem];
    [v11 setLeftBarButtonItem:v12];
  }
}

- (CGRect)placeholderRectInView:(id)a3
{
  id v4 = a3;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    [(UIView *)placeholderView bounds];
    [v4 convertRect:self->_placeholderView fromView:];
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)ComposePlaceholderView;
  [(ComposePlaceholderView *)&v29 layoutSubviews];
  [(ComposePlaceholderView *)self bounds];
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  double v7 = CGRectGetWidth(v32);
  double v8 = [(ComposePlaceholderView *)self navigationBar];
  [v8 setFrame:0.0, 0.0, v7, 50.0];

  double v9 = [(ComposePlaceholderView *)self toField];
  v31[0] = v9;
  double v10 = [(ComposePlaceholderView *)self multiField];
  v31[1] = v10;
  id v11 = [(ComposePlaceholderView *)self ccField];
  v31[2] = v11;
  double v12 = [(ComposePlaceholderView *)self bccField];
  v31[3] = v12;
  v13 = [(ComposePlaceholderView *)self fromField];
  v31[4] = v13;
  double v14 = [(ComposePlaceholderView *)self subjectField];
  v31[5] = v14;
  double v15 = +[NSArray arrayWithObjects:v31 count:6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    double v19 = 50.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isHidden", (void)v25) & 1) == 0)
        {
          [v21 bounds];
          double v22 = CGRectGetHeight(v33);
          [v21 setFrame:0.0 v19, v7, v22];
          double v19 = v19 + v22;
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v17);
  }
  else
  {
    double v19 = 50.0;
  }

  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v23 = CGRectGetHeight(v34);
  v24 = [(ComposePlaceholderView *)self snapshotImageView];
  [v24 setFrame:0.0, v19, v7, v23 - v19];
}

- (void)_updateHeadersWithModel:(id)a3
{
  id v7 = a3;
  id v4 = [v7 toRecipients];
  v5 = [(ComposePlaceholderView *)self toField];
  [v5 setRecipients:v4];

  if ([v7 shouldUseMultiField])
  {
    [(ComposePlaceholderView *)self _updateMultiFieldWithModel:v7];
  }
  else
  {
    double v6 = [(ComposePlaceholderView *)self multiField];
    [v6 setHidden:1];

    [(ComposePlaceholderView *)self _updateIndividualFieldsWithModel:v7];
    [(ComposePlaceholderView *)self setNeedsLayout];
  }
}

- (void)_updateMultiFieldWithModel:(id)a3
{
  id v12 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CC/BCC" value:&stru_100619928 table:@"Main"];

  if ([v12 showSenderAddress])
  {
    double v6 = [v12 senderAddress];

    if (v6)
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"CC/BCC/FROM" value:&stru_100619928 table:@"Main"];

      v5 = (void *)v8;
    }
  }
  double v9 = [(ComposePlaceholderView *)self multiField];
  double v10 = [v12 senderAddress];
  [v9 setAccountDescription:v10];

  id v11 = [(ComposePlaceholderView *)self multiField];
  [v11 setLabel:v5];
}

- (void)_updateIndividualFieldsWithModel:(id)a3
{
  id v18 = a3;
  id v4 = [v18 ccRecipients];
  id v5 = [v4 count];

  if (v5)
  {
    double v6 = [v18 ccRecipients];
    id v7 = [(ComposePlaceholderView *)self ccField];
    [v7 setRecipients:v6];

    uint64_t v8 = [(ComposePlaceholderView *)self ccField];
    [v8 setHidden:0];
  }
  double v9 = [v18 bccRecipients];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [v18 bccRecipients];
    id v12 = [(ComposePlaceholderView *)self bccField];
    [v12 setRecipients:v11];

    v13 = [(ComposePlaceholderView *)self bccField];
    [v13 setHidden:0];
  }
  if ([v18 showSenderAddress])
  {
    double v14 = [v18 senderAddress];

    if (v14)
    {
      double v15 = [v18 senderAddress];
      id v16 = [(ComposePlaceholderView *)self fromField];
      [v16 setSelectedAddress:v15];

      id v17 = [(ComposePlaceholderView *)self fromField];
      [v17 setHidden:0];
    }
  }
}

- (void)_setSubject:(id)a3
{
  id v6 = a3;
  id v13 = v6;
  if (v6)
  {
    unsigned int v7 = 0;
    int v8 = 0;
    double v9 = v6;
  }
  else
  {
    unsigned int v7 = +[UIDevice mf_isPad];
    v3 = NSBundle;
    +[NSBundle bundleForClass:objc_opt_class()];
    if (v7) {
      v3 = {;
    }
      [v3 localizedStringForKey:@"NEW_MESSAGE_LONG" value:&stru_100619928 table:@"Main"];
    }
    else {
      id v4 = {;
    }
      [v4 localizedStringForKey:@"NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
    double v9 = };
    int v8 = v7 ^ 1;
  }
  id v10 = [(ComposePlaceholderView *)self navigationBar];
  id v11 = [v10 topItem];
  [v11 setTitle:v9];

  if (v8)
  {
  }
  if (v7)
  {
  }
  id v12 = [(ComposePlaceholderView *)self subjectField];
  [v12 setText:v13];
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v20 = a3;
  id v7 = [(ComposePlaceholderView *)self subjectField];

  int v8 = v20;
  if (v7 == v20)
  {
    double v9 = [(ComposePlaceholderView *)self subjectField];
    [v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v22.origin.CGFloat x = v11;
    v22.origin.CGFloat y = v13;
    v22.size.double width = v15;
    v22.size.double height = v17;
    double MinY = CGRectGetMinY(v22);
    double v19 = [(ComposePlaceholderView *)self subjectField];
    [v19 setFrame:CGRectMake(0.0, MinY, width, height)];

    int v8 = v20;
  }
}

- (id)snapshotContentUsingWebView:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(ComposePlaceholderView *)self modelFuture];
  id v6 = +[EFScheduler mainThreadScheduler];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100062F60;
  v21[3] = &unk_1006045C8;
  objc_copyWeak(&v23, &location);
  id v7 = v4;
  id v22 = v7;
  int v8 = [v5 onScheduler:v6 then:v21];

  double v9 = +[EFScheduler mainThreadScheduler];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000630E0;
  v19[3] = &unk_1006045F0;
  id v10 = v7;
  id v20 = v10;
  CGFloat v11 = [v8 onScheduler:v9 then:v19];

  double v12 = +[EFScheduler mainThreadScheduler];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100063184;
  v16[3] = &unk_100604640;
  objc_copyWeak(&v18, &location);
  id v13 = v10;
  id v17 = v13;
  double v14 = [v11 onScheduler:v12 then:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v14;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = [(ComposePlaceholderView *)self contentLoadingPromise];
  id v4 = +[NSNull null];
  [v5 finishWithResult:v4];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v7 = a5;
  id v6 = [(ComposePlaceholderView *)self contentLoadingPromise];
  [v6 finishWithError:v7];
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (EFFuture)modelFuture
{
  return self->_modelFuture;
}

- (void)setModelFuture:(id)a3
{
}

- (EFPromise)contentLoadingPromise
{
  return self->_contentLoadingPromise;
}

- (void)setContentLoadingPromise:(id)a3
{
}

- (WKNavigation)expectedContentNavigation
{
  return self->_expectedContentNavigation;
}

- (void)setExpectedContentNavigation:(id)a3
{
}

- (MFMailComposeToField)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
}

- (MFComposeMultiView)multiField
{
  return self->_multiField;
}

- (void)setMultiField:(id)a3
{
}

- (MFMailComposeRecipientTextView)ccField
{
  return self->_ccField;
}

- (void)setCcField:(id)a3
{
}

- (MFMailComposeRecipientTextView)bccField
{
  return self->_bccField;
}

- (void)setBccField:(id)a3
{
}

- (MFComposeFromView)fromField
{
  return self->_fromField;
}

- (void)setFromField:(id)a3
{
}

- (MFComposeSubjectView)subjectField
{
  return self->_subjectField;
}

- (void)setSubjectField:(id)a3
{
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_multiField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_expectedContentNavigation, 0);
  objc_storeStrong((id *)&self->_contentLoadingPromise, 0);
  objc_storeStrong((id *)&self->_modelFuture, 0);

  objc_storeStrong((id *)&self->_navigationBar, 0);
}

@end