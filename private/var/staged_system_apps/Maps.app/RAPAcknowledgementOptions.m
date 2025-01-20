@interface RAPAcknowledgementOptions
+ (id)defaultOptions;
- (BOOL)shouldDismissAutomatically;
- (BOOL)showsInternalStatusLink;
- (NSString)message;
- (NSString)primaryButtonTitle;
- (NSString)title;
- (RAPAcknowledgementOptions)init;
- (id)_defaultMessage;
- (id)_defaultTitle;
- (int64_t)acknowledgementOptionsType;
- (void)setMessage:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RAPAcknowledgementOptions

+ (id)defaultOptions
{
  v2 = objc_alloc_init(RAPAcknowledgementOptions);

  return v2;
}

- (RAPAcknowledgementOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)RAPAcknowledgementOptions;
  v2 = [(RAPAcknowledgementOptions *)&v10 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(RAPAcknowledgementOptions *)v2 _defaultTitle];
    title = v3->_title;
    v3->_title = (NSString *)v4;

    uint64_t v6 = [(RAPAcknowledgementOptions *)v3 _defaultMessage];
    message = v3->_message;
    v3->_message = (NSString *)v6;

    primaryButtonTitle = v3->_primaryButtonTitle;
    v3->_primaryButtonTitle = (NSString *)&stru_101324E70;
  }
  return v3;
}

- (id)_defaultTitle
{
  v2 = +[UserInformationManager sharedInstance];
  unsigned int v3 = [v2 loggedIn];

  uint64_t v4 = +[NSBundle mainBundle];
  if (v3)
  {
    v5 = [v4 localizedStringForKey:@"[RAP] Title for the Thank You screen, logged in", @"localized string not found", 0 value table];
    uint64_t v6 = +[UserInformationManager sharedInstance];
    v7 = [v6 userGivenName];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);
  }
  else
  {
    v8 = [v4 localizedStringForKey:@"[RAP] Title for the Thank You screen, not logged in", @"localized string not found", 0 value table];
  }

  return v8;
}

- (id)_defaultMessage
{
  v2 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v3 = [v2 inChina];

  uint64_t v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"You’re making Maps better for everyone!";
  }
  else {
    CFStringRef v6 = @"You’re making Maps better for everyone! We’ll let you know when we’ve reviewed your report.";
  }
  v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return v7;
}

- (BOOL)shouldDismissAutomatically
{
  return 0;
}

- (BOOL)showsInternalStatusLink
{
  return 1;
}

- (int64_t)acknowledgementOptionsType
{
  return 0;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
}

@end