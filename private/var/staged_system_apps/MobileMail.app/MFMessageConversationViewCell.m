@interface MFMessageConversationViewCell
+ (double)defaultCornerRadius;
- (BOOL)expanded;
- (BOOL)hasVisibleContent;
- (BOOL)interactivelyResizing;
- (BOOL)roundsCellCorners;
- (BOOL)shouldAddShadow;
- (EFFuture)predictedMailbox;
- (EMCachingContactStore)contactStore;
- (MFMessageConversationViewCell)initWithFrame:(CGRect)a3;
- (id)description;
- (void)_updateShadow;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContactStore:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setMessageFlags:(unint64_t)a3 conversationNotificationLevel:(int64_t)a4;
- (void)setPredictedMailbox:(id)a3;
- (void)setRoundsCellCorners:(BOOL)a3;
- (void)setShouldAddShadow:(BOOL)a3;
@end

@implementation MFMessageConversationViewCell

- (MFMessageConversationViewCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  result = -[MFConversationViewCell initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_shouldAddShadow = 1;
  }
  return result;
}

- (void)dealloc
{
  v3 = [(MFMessageConversationViewCell *)self predictedMailbox];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  [(MFMessageConversationViewCell *)&v4 dealloc];
}

- (void)setMessageFlags:(unint64_t)a3 conversationNotificationLevel:(int64_t)a4
{
  v7 = [(MFConversationViewCell *)self viewModel];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B1F18;
  v9[3] = &unk_10060BFF0;
  v9[4] = a3;
  v9[5] = a4;
  id v8 = [v7 copyWithFlagsModelBuilder:v9];
  [(MFConversationViewCell *)self setViewModel:v8];
}

- (BOOL)hasVisibleContent
{
  return 0;
}

- (void)setShouldAddShadow:(BOOL)a3
{
  if (self->_shouldAddShadow != a3)
  {
    self->_shouldAddShadow = a3;
    [(MFMessageConversationViewCell *)self _updateShadow];
  }
}

- (void)setRoundsCellCorners:(BOOL)a3
{
  if (self->_roundsCellCorners != a3)
  {
    self->_roundsCellCorners = a3;
    objc_super v4 = [(MFMessageConversationViewCell *)self contentView];
    id v6 = [v4 layer];

    [v6 setCornerCurve:kCACornerCurveContinuous];
    if (self->_roundsCellCorners) {
      [(id)objc_opt_class() defaultCornerRadius];
    }
    else {
      double v5 = 0.0;
    }
    [v6 setCornerRadius:v5];
  }
}

- (BOOL)expanded
{
  return 0;
}

+ (double)defaultCornerRadius
{
  return 12.0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageConversationViewCell;
  [(MFMessageConversationViewCell *)&v3 layoutSubviews];
  [(MFMessageConversationViewCell *)self _updateShadow];
}

- (void)_updateShadow
{
  id v5 = [(MFConversationViewCell *)self contentWrapperView];
  BOOL v3 = [(MFMessageConversationViewCell *)self shouldAddShadow];
  BOOL v4 = [(MFMessageConversationViewCell *)self roundsCellCorners];
  [(id)objc_opt_class() defaultCornerRadius];
  [v5 mf_applyingConversationMessageShadow:v3 shouldRoundCorners:v4];
}

- (void)prepareForReuse
{
  BOOL v3 = [(MFMessageConversationViewCell *)self predictedMailbox];
  [v3 cancel];

  [(MFMessageConversationViewCell *)self setPredictedMailbox:0];
  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  [(MFConversationViewCell *)&v4 prepareForReuse];
}

- (id)description
{
  v29.receiver = self;
  v29.super_class = (Class)MFMessageConversationViewCell;
  BOOL v3 = [(MFMessageConversationViewCell *)&v29 description];
  id v4 = [v3 mutableCopy];

  [v4 replaceOccurrencesOfString:@"baseClass = ([^;]*); " withString:@"baseClass = ([^;]*); " options:range:];
    &stru_100619928,
    1024,
    0,
    [v4 length]);
  id v5 = [(MFConversationViewCell *)self viewModel];
  id v6 = [v5 senderList];
  v7 = [v6 firstObject];

  id v8 = v7;
  v9 = [v8 emailAddressValue];
  v10 = [v9 simpleAddress];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 stringValue];
  }
  id v13 = v12;

  v28 = v13;
  v14 = +[MFUIStateCaptor sharedCaptor];
  v15 = [v14 redactedStringForString:v13];

  v16 = [(MFConversationViewCell *)self viewModel];
  v17 = [v16 messageContentRequest];
  v18 = [v17 message];

  v19 = [(MFConversationViewCell *)self viewModel];
  if (v18) {
    [v19 messageContentRequest];
  }
  else {
  v20 = [v19 messageLoadingContext];
  }
  v21 = [v20 message];

  uint64_t v22 = objc_opt_class();
  v23 = [(MFConversationViewCell *)self viewModel];
  v24 = [v23 date];
  v25 = +[NSDateFormatter ef_formatDate:v24 shortStyle:0];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; message = <%@: %p; sender = \"%@\" dateSent = \"%@\">",
    v22,
    v21,
    v15,
  v26 = v25);

  [v4 insertString:v26 atIndex:[v4 length] - 1];

  return v4;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)shouldAddShadow
{
  return self->_shouldAddShadow;
}

- (BOOL)roundsCellCorners
{
  return self->_roundsCellCorners;
}

- (BOOL)interactivelyResizing
{
  return self->_interactivelyResizing;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  self->_interactivelyResizing = a3;
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedMailbox, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end