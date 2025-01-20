@interface MFUserActivityBrowseMailboxRoute
+ (OS_os_log)log;
- (MFUserActivityBrowseMailboxRoute)initWithMailboxPickerController:(id)a3;
- (id)browseMailboxForActivityPayload:(id)a3 activityType:(id)a4 scrollToMessage:(BOOL)a5;
@end

@implementation MFUserActivityBrowseMailboxRoute

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FFC3C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699DF8 != -1) {
    dispatch_once(&qword_100699DF8, block);
  }
  v2 = (void *)qword_100699DF0;

  return (OS_os_log *)v2;
}

- (MFUserActivityBrowseMailboxRoute)initWithMailboxPickerController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFUserActivityBrowseMailboxRoute;
  v6 = [(MFUserActivityBrowseMailboxRoute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mailboxPickerController, a3);
  }

  return v7;
}

- (id)browseMailboxForActivityPayload:(id)a3 activityType:(id)a4 scrollToMessage:(BOOL)a5
{
  BOOL v38 = a5;
  id v42 = a3;
  id v39 = a4;
  v7 = [v42 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeyFocusedMessageID];
  v50[0] = v39;
  v49[0] = @"ceActivityType";
  v49[1] = @"ceActivityIsHandoff";
  id v8 = [v7 length];
  objc_super v9 = &off_10062AC50;
  if (!v8) {
    objc_super v9 = &off_10062AC68;
  }
  v50[1] = v9;
  v41 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  uint64_t v10 = [v42 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType];
  v40 = (void *)v10;
  if (v10)
  {
    if ([MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes isEqualToString:v10])
    {
      v11 = +[FavoriteItem itemForUnifiedMailboxWithType:7 selected:0];
      v12 = [(MailboxPickerOutlineController *)self->_mailboxPickerController favoriteItemSelectionTarget];
      [v12 selectCombinedMailboxWithType:7 item:v11 animated:0];
    }
    else if ([MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeVIP isEqualToString:v10])
    {
      v11 = +[FavoriteItem itemForSharedMailboxWithType:1 selected:0];
      v22 = [(MailboxPickerOutlineController *)self->_mailboxPickerController favoriteItemSelectionTarget];
      [v22 selectCombinedInboxWithSourceType:1 item:v11 animated:0];
    }
    else
    {
      v11 = +[MFUserActivityBrowseMailboxRoute log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(Browse Activity) Unknown special source type. Assuming generic.", buf, 2u);
      }
    }

LABEL_27:
    v24 = 0;
    if (v7 && v38)
    {
      v30 = +[NSURL URLWithString:v7];
      v31 = [v30 mf_messageCriterion];
      if (v31)
      {

        v24 = 0;
      }
      else
      {
        v24 = +[NSError mailHandoffErrorWithActivityContextInfo:v41, @"Couldn't generate criterion for message scroll position for handoff. URL: %@", v30 errorFormat];
      }
    }
    goto LABEL_45;
  }
  [v42 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL];
  v37 = v36 = self;
  v13 = +[NSURL URLWithString:](NSURL, "URLWithString:");
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v14 = +[MailAccount mailAccounts];
  id v15 = [v14 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
LABEL_8:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(v14);
      }
      v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
      v19 = [v18 uniqueID];
      v20 = [v13 host];
      unsigned __int8 v21 = [v19 isEqualToString:v20];

      if (v21) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v14 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v15) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v23 = v18;

    if (!v23) {
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [v13 pathComponents];
      id v25 = v23;
      v26 = [v24 objectAtIndexedSubscript:2];
      v27 = [v25 mailboxForFolderID:v26];
    }
    else
    {
      v24 = [v13 path];
      if ((unint64_t)[v24 length] >= 3
        && [v24 characterAtIndex:0] == 47)
      {
        uint64_t v32 = [v24 substringFromIndex:1];

        v24 = (void *)v32;
      }
      v27 = [v23 mailboxUidForRelativePath:v24 create:0];
    }

    if (v27)
    {
      v33 = [(MailboxPickerOutlineController *)v36->_mailboxPickerController favoriteItemSelectionTarget];
      [v33 selectMailbox:v27 item:0 animated:0];
      int v29 = 0;
    }
    else
    {
      if ([v7 length]) {
        CFStringRef v34 = @"Wasn't able to resolve mailbox for Browse Activity from handoff. Got URL: %@";
      }
      else {
        CFStringRef v34 = @"Wasn't able to resolve mailbox for Browse Activity for siri shortcut. Got URL: %@";
      }
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v13);
      v24 = +[NSError mailHandoffErrorWithActivityContextInfo:v41 errorFormat:v33];
      int v29 = 1;
    }
  }
  else
  {
LABEL_14:

LABEL_20:
    if ([v7 length]) {
      CFStringRef v28 = @"Wasn't able to resolve account for Browse Activity from handoff. Got URL: %@";
    }
    else {
      CFStringRef v28 = @"Wasn't able to resolve account for Browse Activity for siri shortcut. Got URL: %@";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v13);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = +[NSError mailHandoffErrorWithActivityContextInfo:v41 errorFormat:v23];
    int v29 = 1;
  }

  if (!v29) {
    goto LABEL_27;
  }
LABEL_45:

  return v24;
}

- (void).cxx_destruct
{
}

@end