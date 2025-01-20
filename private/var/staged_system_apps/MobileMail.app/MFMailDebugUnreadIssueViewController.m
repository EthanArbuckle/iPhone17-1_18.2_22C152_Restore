@interface MFMailDebugUnreadIssueViewController
+ (id)title;
- (UITextView)textView;
- (id)_accountInformationFromAccounts:(id)a3;
- (id)_accountUnreadCountFromAccounts:(id)a3;
- (id)_badgeCount;
- (id)_mailboxUnreadCountInformations;
- (void)_loadUnreadDebugInformation;
- (void)selectAll:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MFMailDebugUnreadIssueViewController

+ (id)title
{
  return @"Unread Issue";
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailDebugUnreadIssueViewController;
  [(MFMailDebugUnreadIssueViewController *)&v6 viewDidLoad];
  v3 = [(MFMailDebugUnreadIssueViewController *)self view];
  id v4 = objc_alloc((Class)UITextView);
  [v3 frame];
  id v5 = [v4 initWithFrame:];
  [v5 setAutoresizingMask:18];
  [v5 setEditable:0];
  [v3 addSubview:v5];
  [(MFMailDebugUnreadIssueViewController *)self setTextView:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugUnreadIssueViewController;
  [(MFMailDebugUnreadIssueViewController *)&v4 viewDidAppear:a3];
  [(MFMailDebugUnreadIssueViewController *)self _loadUnreadDebugInformation];
}

- (void)selectAll:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(MFMailDebugUnreadIssueViewController *)self textView];
  [v4 selectAll:v5];
}

- (void)_loadUnreadDebugInformation
{
  v3 = [(MFMailDebugUnreadIssueViewController *)self textView];
  [v3 setText:@"fetching unread debug informations... be patient."];

  objc_super v4 = dispatch_get_global_queue(0, 0);
  id v5 = objc_alloc_init((Class)NSMutableString);
  objc_super v6 = [(MFMailDebugUnreadIssueViewController *)self _badgeCount];
  [v5 appendFormat:@"%@\n\n", v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AE3C0;
  block[3] = &unk_100604C00;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_accountInformationFromAccounts:(id)a3
{
  id v12 = a3;
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = v12;
  id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 displayName];
        id v9 = [v7 uniqueID];
        if ([v7 isActive]) {
          CFStringRef v10 = @"active";
        }
        else {
          CFStringRef v10 = @"inactive";
        }
        [v3 appendFormat:@"\n%@ : %@ - %@", v8, v9, v10];
      }
      id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  if ([v3 length])
  {
    [v3 insertString:@"Accounts Information:" atIndex:0];
  }
  else
  {

    id v3 = 0;
  }

  return v3;
}

- (id)_accountUnreadCountFromAccounts:(id)a3
{
  id v17 = a3;
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v17;
  id v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      id v21 = v4;
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        objc_super v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v6 isActive])
        {
          v19 = [v6 allMailboxUids];
          id v7 = [v6 displayName];
          [v3 appendFormat:@"%@:", v7];

          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v8 = v19;
          id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v23;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v23 != v10) {
                  objc_enumerationMutation(v8);
                }
                id v12 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
                if ([v12 isSpecialMailboxUid]) {
                  [v12 displayNameUsingSpecialNames];
                }
                else {
                v13 = [v12 displayName];
                }
                id v14 = [v12 unreadCount];
                long long v15 = [v12 uniqueId];
                [v3 appendFormat:@"\n - %@ (%lu) %@", v13, v14, v15, v17];
              }
              id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v9);
          }

          [v3 appendString:@"\n\n"];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  if ([v3 length])
  {
    [v3 insertString:@"Accounts (unread):\n" atIndex:0];
  }
  else
  {

    id v3 = 0;
  }

  return v3;
}

- (id)_badgeCount
{
  if (pthread_main_np() != 1)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MFMailDebugUnreadIssueViewController.m" lineNumber:128 description:@"Current thread must be main"];
  }
  id v4 = +[UIApplication sharedApplication];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Badge Count: %li", [v4 applicationIconBadgeNumber]);

  return v5;
}

- (id)_mailboxUnreadCountInformations
{
  if (pthread_main_np())
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MFMailDebugUnreadIssueViewController.m" lineNumber:133 description:@"Current thread is main"];
  }
  id v4 = objc_alloc_init((Class)NSMutableString);
  uint64_t v5 = +[MFMailMessageLibrary defaultInstance];
  objc_super v6 = [v5 stringFromAllMailboxUnreadCount];
  [v4 appendFormat:@"%@\n", v6];

  if ([v4 length])
  {
    [v4 insertString:@"Mailbox Unread Count Informations from DB:\n" atIndex:0];
  }
  else
  {

    id v4 = 0;
  }

  return v4;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end