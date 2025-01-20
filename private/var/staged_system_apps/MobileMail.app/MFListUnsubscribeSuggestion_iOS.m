@interface MFListUnsubscribeSuggestion_iOS
+ (id)log;
- (EMContentRepresentation)contentRepresentation;
- (id)_createConfirmationViewController;
- (id)suggestionCategoryImage;
- (id)suggestionDismissAction;
- (id)suggestionPrimaryAction;
- (void)_showErrorAlert:(id)a3;
- (void)ignore;
- (void)setContentRepresentation:(id)a3;
- (void)unsubscribe;
@end

@implementation MFListUnsubscribeSuggestion_iOS

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019D3F4;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699AE0 != -1) {
    dispatch_once(&qword_100699AE0, block);
  }
  v2 = (void *)qword_100699AD8;

  return v2;
}

- (id)suggestionPrimaryAction
{
  v3 = [(id)objc_opt_class() suggestionPrimaryActionString];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019D53C;
  v6[3] = &unk_10060B898;
  v6[4] = self;
  v4 = +[SGSuggestionAction actionWithTitle:v3 handler:v6];

  return v4;
}

- (id)suggestionDismissAction
{
  v3 = [(id)objc_opt_class() suggestionDismissActionTitle];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019D6B4;
  v6[3] = &unk_10060B898;
  v6[4] = self;
  v4 = +[SGSuggestionAction actionWithTitle:v3 handler:v6];

  return v4;
}

- (id)suggestionCategoryImage
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  v3 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", kMFMobileMailBundleIdentifier, 5);

  return v3;
}

- (id)_createConfirmationViewController
{
  v3 = [(MFListUnsubscribeSuggestion_iOS *)self listUnsubscribeCommand];
  v4 = +[MFListUnsubscribeMessageGenerator_iOS senderForCommand:v3];

  v5 = [(id)objc_opt_class() unsubscribeTitleAlertString];
  v6 = [(MFListUnsubscribeSuggestion_iOS *)self unsubscribeMessageAlertString];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

  v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"ALERT_UNSUBSCRIBE_CONFIRM" value:&stru_100619928 table:@"Main"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10019DA44;
  v16[3] = &unk_100608C40;
  objc_copyWeak(&v17, &location);
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v16];

  [v8 addAction:v11];
  [v8 addAction:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

- (void)unsubscribe
{
  v3 = [(MFListUnsubscribeSuggestion_iOS *)self contentRepresentation];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019DB44;
  v5[3] = &unk_100604F70;
  v5[4] = self;
  id v4 = [v3 performUnsubscribeAction:1 completion:v5];
}

- (void)ignore
{
  v3 = [(MFListUnsubscribeSuggestion_iOS *)self contentRepresentation];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019DD68;
  v6[3] = &unk_100604F70;
  v6[4] = self;
  id v4 = [v3 performUnsubscribeAction:0 completion:v6];

  v5.receiver = self;
  v5.super_class = (Class)MFListUnsubscribeSuggestion_iOS;
  [(MFListUnsubscribeSuggestion_iOS *)&v5 ignore];
}

- (void)_showErrorAlert:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019DEE0;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (void)setContentRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end