@interface GetMailboxIntentHandler
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (EMDaemonInterface)daemonInterface;
- (id)_convertMailboxesIntoSections:(id)a3;
- (id)_intentMailboxFromMailbox:(id)a3;
- (id)_smartMailboxesWithInboxes:(id)a3 hasVIPs:(BOOL)a4;
- (id)defaultMailboxForMFGetMailbox:(id)a3;
- (unint64_t)signpostID;
- (void)provideMailboxOptionsCollectionForMFGetMailbox:(id)a3 withCompletion:(id)a4;
- (void)setDaemonInterface:(id)a3;
@end

@implementation GetMailboxIntentHandler

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001F50;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012328 != -1) {
    dispatch_once(&qword_100012328, block);
  }
  v2 = (void *)qword_100012320;

  return (OS_os_log *)v2;
}

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002074;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012338 != -1) {
    dispatch_once(&qword_100012338, block);
  }
  v2 = (void *)qword_100012330;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EMDaemonInterface)daemonInterface
{
  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    os_signpost_id_t v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }

  return daemonInterface;
}

- (void)provideMailboxOptionsCollectionForMFGetMailbox:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = +[GetMailboxIntentHandler log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provide Mailbox Options Collection", buf, 2u);
  }

  v7 = +[EMMailbox predicateForMailboxType:7];
  v23[0] = v7;
  v8 = +[EMMailbox predicateForMailboxType:0];
  v23[1] = v8;
  v9 = +[NSArray arrayWithObjects:v23 count:2];
  v10 = +[NSCompoundPredicate orPredicateWithSubpredicates:v9];

  id v11 = objc_alloc((Class)EMQuery);
  uint64_t v12 = objc_opt_class();
  v13 = +[EMMailbox sortDescriptorForDisplayOrder];
  v22 = v13;
  v14 = +[NSArray arrayWithObjects:&v22 count:1];
  id v15 = [v11 initWithTargetClass:v12 predicate:v10 sortDescriptors:v14 queryOptions:8 label:@"GetMailboxIntentHandler"];

  v16 = [(GetMailboxIntentHandler *)self daemonInterface];
  v17 = [v16 mailboxRepository];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002468;
  v19[3] = &unk_10000C518;
  v19[4] = self;
  id v18 = v5;
  id v20 = v18;
  [v17 performQuery:v15 completionHandler:v19];
}

- (id)defaultMailboxForMFGetMailbox:(id)a3
{
  os_signpost_id_t v4 = +[GetMailboxIntentHandler signpostLog];
  os_signpost_id_t v5 = [(GetMailboxIntentHandler *)self signpostID];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VIP FOR DEFAULT WIDGET MAILBOX", "Begin get VIPs", (uint8_t *)&v24, 2u);
  }

  v6 = [(GetMailboxIntentHandler *)self daemonInterface];
  v7 = [v6 vipManager];

  v8 = [v7 allVIPWaitForResult];
  v9 = +[GetMailboxIntentHandler signpostLog];
  os_signpost_id_t v10 = [(GetMailboxIntentHandler *)self signpostID];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v11 = [v8 count];
    int v24 = 134217984;
    id v25 = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "VIP FOR DEFAULT WIDGET MAILBOX", "End get VIPs (count=%lu)", (uint8_t *)&v24, 0xCu);
  }

  if ([v8 count])
  {
    uint64_t v12 = +[GetMailboxIntentHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Default Mailbox: VIP", (uint8_t *)&v24, 2u);
    }

    v13 = [MFIntentMailbox alloc];
    v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"VIP" value:&stru_10000C818 table:0];
    v16 = +[INImage systemImageNamed:@"star"];
    v17 = [(MFIntentMailbox *)v13 initWithIdentifier:@"VIP" displayString:v15 subtitleString:0 displayImage:v16];

    [(MFIntentMailbox *)v17 setKind:5];
  }
  else
  {
    id v18 = +[GetMailboxIntentHandler log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Default Mailbox: All Inboxes", (uint8_t *)&v24, 2u);
    }

    v19 = [MFIntentMailbox alloc];
    id v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"ALL_INBOXES" value:&stru_10000C818 table:0];
    v22 = +[INImage systemImageNamed:@"tray.2"];
    v17 = [(MFIntentMailbox *)v19 initWithIdentifier:@"ALL_INBOXES" displayString:v21 subtitleString:0 displayImage:v22];

    [(MFIntentMailbox *)v17 setKind:1];
  }

  return v17;
}

- (id)_smartMailboxesWithInboxes:(id)a3 hasVIPs:(BOOL)a4
{
  BOOL v4 = a4;
  id v50 = a3;
  os_signpost_id_t v5 = +[GetMailboxIntentHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v65 = [v50 count];
    __int16 v66 = 1024;
    BOOL v67 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Get smart mailboxes for %lu inboxes, hasVIPs: %{BOOL}d", buf, 0x12u);
  }

  id v52 = objc_alloc_init((Class)NSMutableArray);
  if ((unint64_t)[v50 count] >= 2)
  {
    v6 = [MFIntentMailbox alloc];
    v7 = NSStringFromEMSmartMailboxType();
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"ALL_INBOXES" value:&stru_10000C818 table:0];
    os_signpost_id_t v10 = +[INImage systemImageNamed:@"tray.2"];
    id v11 = [(MFIntentMailbox *)v6 initWithIdentifier:v7 displayString:v9 subtitleString:0 displayImage:v10];

    [(MFIntentMailbox *)v11 setKind:1];
    uint64_t v12 = [v50 ef_map:&stru_10000C558];
    [(MFIntentMailbox *)v11 setSerializedRepresentations:v12];

    [v52 addObject:v11];
  }
  v13 = [MFIntentMailbox alloc];
  v14 = NSStringFromEMSmartMailboxType();
  id v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"FLAGGED" value:&stru_10000C818 table:0];
  v17 = +[INImage systemImageNamed:@"flag"];
  v48 = [(MFIntentMailbox *)v13 initWithIdentifier:v14 displayString:v16 subtitleString:0 displayImage:v17];

  [(MFIntentMailbox *)v48 setKind:3];
  [v52 addObject:v48];
  if (v4)
  {
    id v18 = [MFIntentMailbox alloc];
    v19 = NSStringFromEMSmartMailboxType();
    id v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"VIP" value:&stru_10000C818 table:0];
    v22 = +[INImage systemImageNamed:@"star"];
    v23 = [(MFIntentMailbox *)v18 initWithIdentifier:v19 displayString:v21 subtitleString:0 displayImage:v22];

    [(MFIntentMailbox *)v23 setKind:5];
    [v52 addObject:v23];
  }
  int v24 = [MFIntentMailbox alloc];
  id v25 = NSStringFromEMSmartMailboxType();
  v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"UNREAD" value:&stru_10000C818 table:0];
  v28 = +[INImage systemImageNamed:@"envelope.badge"];
  v51 = [(MFIntentMailbox *)v24 initWithIdentifier:v25 displayString:v27 subtitleString:0 displayImage:v28];

  [(MFIntentMailbox *)v51 setKind:4];
  v29 = [MFIntentMailbox alloc];
  v30 = NSStringFromEMSmartMailboxType();
  v31 = +[NSBundle mainBundle];
  v32 = [v31 localizedStringForKey:@"TODAY" value:&stru_10000C818 table:0];
  v33 = +[INImage systemImageNamed:@"calendar"];
  v49 = [(MFIntentMailbox *)v29 initWithIdentifier:v30 displayString:v32 subtitleString:0 displayImage:v33];

  [(MFIntentMailbox *)v49 setKind:6];
  v63[0] = v51;
  v63[1] = v49;
  v34 = +[NSArray arrayWithObjects:v63 count:2];
  [v52 addObjectsFromArray:v34];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v52;
  id v35 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v59;
    v56 = (void *)MFCombinedMailboxToday;
    v54 = (void *)MFCombinedMailboxUnread;
    v55 = (void *)MFCombinedMailboxVIP;
    v53 = (void *)MFCombinedMailboxFlagged;
    v37 = (void *)MFCombinedMailboxAllInbox;
    uint64_t v38 = EMAppleMailboxURLScheme;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v41 = [v40 kind:v48];
        id v42 = 0;
        v43 = v37;
        switch((unint64_t)v41)
        {
          case 1uLL:
            goto LABEL_17;
          case 3uLL:
            v43 = v53;
            goto LABEL_17;
          case 4uLL:
            v43 = v54;
            goto LABEL_17;
          case 5uLL:
            v43 = v55;
            goto LABEL_17;
          case 6uLL:
            v43 = v56;
LABEL_17:
            id v42 = v43;
            break;
          default:
            break;
        }
        id v44 = objc_alloc_init((Class)NSURLComponents);
        [v44 setScheme:v38];
        [v44 setHost:v42];
        v45 = [v44 URL];

        [v40 setUrl:v45];
      }
      id v35 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v35);
  }

  id v46 = [obj copy];

  return v46;
}

- (id)_convertMailboxesIntoSections:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [v4 keyEnumerator];
  v6 = [v5 allObjects];
  v7 = [v6 sortedArrayUsingComparator:&stru_10000C598];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003850;
  v11[3] = &unk_10000C5E8;
  id v8 = v4;
  id v12 = v8;
  v13 = self;
  v9 = [v7 ef_compactMap:v11];

  return v9;
}

- (id)_intentMailboxFromMailbox:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = -2;
    v7 = v5;
    do
    {
      uint64_t v8 = [v7 parent];

      ++v6;
      v7 = (void *)v8;
    }
    while (v8);
    v9 = [@"  " ef_repeatedStringTimes:v6];
    os_signpost_id_t v10 = [v5 name];
    id v11 = +[NSString stringWithFormat:@"%@%@", v9, v10];

    id v12 = [MFIntentMailbox alloc];
    v13 = [v5 objectID];
    v14 = [v13 url];
    id v15 = [v14 absoluteString];
    v16 = [(MFIntentMailbox *)v12 initWithIdentifier:v15 displayString:v11];

    v17 = [v5 objectID];
    id v18 = [v17 serializedRepresentation];
    v19 = [v18 base64EncodedStringWithOptions:0];
    v33 = v19;
    id v20 = +[NSArray arrayWithObjects:&v33 count:1];
    [(MFIntentMailbox *)v16 setSerializedRepresentations:v20];

    v21 = [v5 name];
    [(MFIntentMailbox *)v16 setName:v21];

    v22 = [v5 externalURL];
    [(MFIntentMailbox *)v16 setUrl:v22];

    id v23 = [v5 type];
    if (v23)
    {
      if (v23 == (id)7)
      {
        [(MFIntentMailbox *)v16 setKind:2];
        +[INImage systemImageNamed:@"tray"];
      }
      else
      {
        [(MFIntentMailbox *)v16 setKind:7];
        +[INImage systemImageNamed:@"folder"];
      int v24 = };
      [(MFIntentMailbox *)v16 setDisplayImage:v24];
    }
    else
    {
      [(MFIntentMailbox *)v16 setKind:7];
      int v24 = +[INImage systemImageNamed:@"folder"];
      [(MFIntentMailbox *)v16 setDisplayImage:v24];
    }

    id v25 = [v5 account];
    v26 = [v25 name];

    if (v26)
    {
      v27 = [[MFIntentAccount alloc] initWithIdentifier:v26 displayString:v26];
      v28 = [v5 account];
      v29 = [v28 objectID];
      v30 = [v29 serializedRepresentation];
      v31 = [v30 base64EncodedStringWithOptions:0];
      [(MFIntentAccount *)v27 setSerializedRepresentation:v31];

      [(MFIntentMailbox *)v16 setAccount:v27];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end