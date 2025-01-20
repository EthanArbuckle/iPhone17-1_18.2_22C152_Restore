@interface MFUserActivityRouter
+ (OS_os_log)log;
- (BOOL)handoffUserActivity:(id)a3 withPayload:(id)a4;
- (ComposeNavigationController)handoffComposeController;
- (EMMessageRepository)messageRepository;
- (MFUserActivityRouter)initWithDelegate:(id)a3 messageRepository:(id)a4;
- (MFUserActivityRouterDelegate)delegate;
- (id)_currentActivityUserInfoFromSendMailIntent:(id)a3;
- (void)handoffUserActivityFailedWithType:(id)a3 error:(id)a4;
- (void)presentAlertForHandoffError:(id)a3;
- (void)presentAlertForReturnToSenderError;
- (void)recoverUIAfterHandoffFailureWithType:(id)a3;
- (void)returnToSenderErrorHandling:(id)a3 urlError:(id)a4;
- (void)returnToSenderUserActivity:(id)a3;
- (void)returnToSenderUserActivityFailedWithType:(id)a3 error:(id)a4;
- (void)routeUserActivity:(id)a3;
- (void)routeUserActivityFailedWithType:(id)a3 error:(id)a4;
- (void)routeWillContinueUserActivityWithType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandoffComposeController:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)userAcknowledgedHandoffError:(id)a3;
- (void)willHandoffUserActivityWithType:(id)a3;
- (void)willReturnToSenderActivityWithType:(id)a3;
@end

@implementation MFUserActivityRouter

- (MFUserActivityRouter)initWithDelegate:(id)a3 messageRepository:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFUserActivityRouter;
  v8 = [(MFUserActivityRouter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_messageRepository, a4);
    v10 = (MFLANHandoffAgent *)objc_alloc_init((Class)MFLANHandoffAgent);
    LANHandoffAgent = v9->_LANHandoffAgent;
    v9->_LANHandoffAgent = v10;
  }
  return v9;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100200530;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699E08 != -1) {
    dispatch_once(&qword_100699E08, block);
  }
  v2 = (void *)qword_100699E00;

  return (OS_os_log *)v2;
}

- (id)_currentActivityUserInfoFromSendMailIntent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002008DC;
  v25[3] = &unk_10060D988;
  id v5 = objc_alloc_init((Class)MFPersonTransformer);
  id v26 = v5;
  id v6 = objc_retainBlock(v25);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100200910;
  v23 = &unk_10060D9B0;
  id v7 = v4;
  id v24 = v7;
  v8 = objc_retainBlock(&v20);
  v9 = [v3 sender:v20, v21, v22, v23];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeySenderAddress, v9);

  v10 = [v3 to];
  v11 = [v10 ef_compactMap:v6];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyToRecipients, v11);

  v12 = [v3 cc];
  objc_super v13 = [v12 ef_compactMap:v6];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyCcRecipients, v13);

  v14 = [v3 bcc];
  v15 = [v14 ef_compactMap:v6];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyBccRecipients, v15);

  v16 = [v3 subject];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeySubject, v16);

  v17 = [v3 body];
  ((void (*)(void ***, void, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyMessageBody, v17);

  id v18 = v7;
  return v18;
}

- (BOOL)handoffUserActivity:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 activityType];
  v9 = [v6 interaction];
  v10 = [v9 intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v9 intent];
    uint64_t v13 = [(MFUserActivityRouter *)self _currentActivityUserInfoFromSendMailIntent:v12];

    id v14 = MSMailActivityHandoffTypeSendMail;
    id v7 = (id)v13;
    v8 = v14;
  }
  v15 = [(MFUserActivityRouter *)self delegate];
  v16 = [v15 mailboxPickerControllerForActivityRouter:self];
  v60 = [[MFUserActivityBrowseMailboxRoute alloc] initWithMailboxPickerController:v16];
  v58 = [(MFUserActivityRouter *)self handoffComposeController];
  if (!v8)
  {
    v8 = [v7 objectForKeyedSubscript:MSMailActivityHandoffTypeKey];
  }
  v17 = [v7 objectForKeyedSubscript:MSMailActivityHandoffDebugKeySimulateFailureBool];
  unsigned int v18 = [v17 BOOLValue];

  if (!v18)
  {
    v56 = v16;
    v57 = v9;
    unsigned int v21 = [MSMailActivityHandoffTypeSearch isEqualToString:v8];
    unsigned int v22 = [CSQueryContinuationActionType isEqualToString:v8];
    id v59 = objc_alloc_init((Class)NSMutableDictionary);
    [v59 setObject:v8 forKeyedSubscript:@"ceActivityType"];
    if ((v22 | v21) == 1)
    {
      v23 = [v6 userInfo];
      if (v21)
      {
        [v59 setObject:&off_10062AC80 forKeyedSubscript:@"ceActivityIsHandoff"];
      }
      else if (v22)
      {
        [v59 setObject:&off_10062AC98 forKeyedSubscript:@"ceActivityIsHandoff"];
        v29 = [v23 objectForKeyedSubscript:CSSearchQueryString];
        if (v29)
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1002016F4;
          v70[3] = &unk_10060D9D8;
          char v76 = 0;
          v71 = v60;
          id v72 = v7;
          char v77 = v22;
          id v73 = v15;
          v74 = self;
          id v75 = v29;
          id v30 = v29;
          +[UIViewController _performWithoutDeferringTransitions:v70];

          v28 = 0;
          BOOL v20 = 1;
          goto LABEL_25;
        }
      }
      v28 = +[NSError mailHandoffErrorWithActivityContextInfo:v59 errorFormat:@"Could not continue Spotlight Query Activity; null query."];
      BOOL v20 = 0;
LABEL_25:

      if (!v28) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    if ([CSSearchableItemActionType isEqualToString:v8])
    {
      [v59 setObject:&off_10062ACB0 forKeyedSubscript:@"ceActivityIsHandoff"];
      v23 = [v7 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];
      id v24 = v59;
      v25 = [(MFUserActivityRouter *)self messageRepository];
      id v26 = [v25 messageForSearchableItemIdentifier:v23];

      v27 = [v26 resultWithTimeout:0 error:5.0];
      if (v27
        && (id v24 = v59, ([v15 displayMessage:v27 fromUserActivityRouter:self] & 1) != 0))
      {
        v28 = 0;
        BOOL v20 = 1;
      }
      else
      {
        [v24 setObject:&off_10062AC98 forKeyedSubscript:@"ceActivityErrorReason"];
        v28 = +[NSError mailHandoffErrorWithActivityContextInfo:v59, @"Could not continue Spotlight Message Display Activity. Unable to find message with unique identifier: %@", v23 errorFormat];
        BOOL v20 = 0;
      }

      goto LABEL_25;
    }
    if (([MSMailActivityHandoffTypeDisplayMessage isEqualToString:v8] & 1) != 0
      || [MSMailActivityHandoffTypeDisplayMessageAttachment isEqualToString:v8])
    {
      v31 = [v7 objectForKeyedSubscript:MSMailActivityHandoffDisplayMessageKeyURL];
      [v59 setObject:&off_10062AC98 forKeyedSubscript:@"ceActivityIsHandoff"];
      if (v31)
      {
        v32 = +[NSURL URLWithString:v31];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10020180C;
        v66[3] = &unk_100607890;
        id v67 = v59;
        id v68 = v32;
        v69 = self;
        id v33 = v32;
        [v15 openURL:v33 fromUserActivityRouter:self completionHandler:v66];

LABEL_22:
        v28 = 0;
        goto LABEL_29;
      }
      uint64_t v34 = +[NSError mailHandoffErrorWithActivityContextInfo:v59 errorFormat:@"Could not continue Message Display Activity with empty messageURL value."];
      goto LABEL_28;
    }
    uint64_t v36 = MSMailActivityHandoffTypeBrowseMailbox;
    if ([MSMailActivityHandoffTypeBrowseMailbox isEqualToString:v8])
    {
      [(MFUserActivityBrowseMailboxRoute *)v60 browseMailboxForActivityPayload:v7 activityType:v36 scrollToMessage:1];
      v28 = BOOL v20 = 0;
      if (!v28) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    if ([MSMailActivityHandoffTypeComposeSansStreams isEqualToString:v8])
    {
      [v59 setObject:&off_10062AC98 forKeyedSubscript:@"ceActivityIsHandoff"];
      v31 = [v7 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyMessageData];
      if (v31)
      {
        id v33 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:2 RFC822Data:v31];
        if (v58)
        {
          v37 = [v58 _mailComposeController];
          [v37 setCompositionContext:v33];
        }
        else
        {
          [v15 showComposeWithContext:v33 fromActivityRouter:self];
        }
        goto LABEL_22;
      }
      uint64_t v34 = +[NSError mailHandoffErrorWithActivityContextInfo:v59 errorFormat:@"Received continue compose with empty message payload"];
      goto LABEL_28;
    }
    if ([MSMailActivityHandoffTypeComposeWithStreams isEqualToString:v8])
    {
      [v59 setObject:&off_10062AC98 forKeyedSubscript:@"ceActivityIsHandoff"];
      uint64_t v38 = MSMailActivityHandoffDebugKeyComposeDataPath;
      v39 = [v7 objectForKeyedSubscript:MSMailActivityHandoffDebugKeyComposeDataPath];

      BOOL v20 = (char)v58;
      v40 = +[NSUserDefaults em_userDefaults];
      unsigned int v41 = [v40 BOOLForKey:@"ComposeActivityOverLAN"];

      if (!v58)
      {
        v28 = 0;
        goto LABEL_31;
      }
      if (v39)
      {
        v31 = [v7 objectForKeyedSubscript:v38];
        v42 = +[NSFileManager defaultManager];
        unsigned int v43 = [v42 fileExistsAtPath:v31];

        if (v43)
        {
          v55 = v31;
          v44 = +[NSMutableData data];
          v45 = +[NSData dataWithContentsOfFile:v31];
          if ([v45 length])
          {
            v54 = v44;
            unsigned int v65 = bswap32([v45 length]);
            [v44 appendBytes:&v65 length:4];
            [v44 appendData:v45];
            v46 = +[NSInputStream inputStreamWithData:v44];
            v47 = +[NSOutputStream outputStreamToMemory];
            v48 = [v58 _mailComposeController];
            [v48 handleLargeMessageComposeHandoffWithInputStream:v46 outputStream:v47 error:0];

            v28 = 0;
            v44 = v54;
          }
          else
          {
            v28 = +[NSError mailHandoffErrorWithActivityContextInfo:v59, @"Could not read draft data from file: %@", v55 errorFormat];
          }

          v31 = v55;
LABEL_29:

          BOOL v20 = 0;
          if (!v28)
          {
LABEL_31:

            v16 = v56;
            v9 = v57;
            goto LABEL_32;
          }
LABEL_30:
          [(MFUserActivityRouter *)self presentAlertForHandoffError:v28];
          goto LABEL_31;
        }
        uint64_t v34 = +[NSError mailHandoffErrorWithActivityContextInfo:v59, @"Compose data file for debugging does not exist: %@.", v31 errorFormat];
LABEL_28:
        v28 = (void *)v34;
        goto LABEL_29;
      }
      if (v41)
      {
        v50 = [v7 objectForKeyedSubscript:MFLANHandoffHostnameKey];
        v51 = [v7 objectForKeyedSubscript:MFLANHandoffPortNumberKey];
        id v52 = objc_alloc_init((Class)MFLANHandoffContext);
        [v52 setHost:v50];
        [v52 setPort:[v51 unsignedShortValue]];
        LANHandoffAgent = self->_LANHandoffAgent;
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_1002018BC;
        v63[3] = &unk_10060DA00;
        id v64 = v58;
        [(MFLANHandoffAgent *)LANHandoffAgent connectToServerWithContext:v52 completion:v63];
      }
      else
      {
        kdebug_trace();
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100201960;
        v61[3] = &unk_10060DA28;
        id v62 = v58;
        [v6 getContinuationStreamsWithCompletionHandler:v61];
      }
    }
    else if ([MSMailActivityHandoffTypeSendMail isEqualToString:v8])
    {
      id v49 = [objc_alloc((Class)_MFMailCompositionContext) initWithHandoffActivityPayload:v7];
      [v49 setShowContentImmediately:1];
      [v49 setCaretPosition:0x7FFFFFFFFFFFFFFFLL];
      [v49 setShowKeyboardImmediately:1];
      [v15 showComposeWithContext:v49 fromActivityRouter:self];
    }
    v28 = 0;
    BOOL v20 = 0;
    goto LABEL_31;
  }
  v19 = +[NSError mailHandoffSimulatedError];
  [v15 simulateUserActivityFailureWithType:v8 error:v19 fromActivityRouter:self];

  BOOL v20 = 0;
LABEL_32:

  return v20;
}

- (void)willHandoffUserActivityWithType:(id)a3
{
  id v14 = a3;
  id v4 = [(MFUserActivityRouter *)self delegate];
  id v5 = [v4 mailboxPickerControllerForActivityRouter:self];
  if ([MSMailActivityHandoffTypeBrowseMailbox isEqualToString:v14])
  {
    [v5 dismissAndUnfocus];
  }
  else if (([MSMailActivityHandoffTypeComposeSansStreams isEqualToString:v14] & 1) != 0 {
         || [MSMailActivityHandoffTypeComposeWithStreams isEqualToString:v14])
  }
  {
    id v6 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:9];
    id v7 = [v4 composeControllerForCompositionContext:v6 forActivityRouter:self];
    [(MFUserActivityRouter *)self setHandoffComposeController:v7];

    v8 = [(MFUserActivityRouter *)self handoffComposeController];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"LOADING" value:&stru_100619928 table:@"Main"];
    [v8 setInitialTitle:v10];

    v11 = [(MFUserActivityRouter *)self handoffComposeController];
    v12 = [v11 _mailComposeController];
    [v12 setProgressUIVisible:1 animated:0];

    uint64_t v13 = [(MFUserActivityRouter *)self handoffComposeController];
    [v4 presentComposeController:v13 forUserActivityRouter:self];
  }
}

- (void)handoffUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MFUserActivityRouter log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 ef_publicDescription];
    int v11 = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Hand-Off _handleHandoffError: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if (objc_msgSend(v7, "mf_isSpotlightHandoffError"))
  {
    [(MFUserActivityRouter *)self recoverUIAfterHandoffFailureWithType:v6];
    v10 = +[MFUserActivityRouter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Hand-Off Will not present alert since it's a spotlight continuation error.", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    [(MFUserActivityRouter *)self presentAlertForHandoffError:v7];
  }
}

- (void)presentAlertForHandoffError:(id)a3
{
  id v4 = a3;
  id v5 = [(MFUserActivityRouter *)self delegate];
  id v6 = [v5 alertOverlayControllerForActivityRouter:self];

  id v7 = +[MailHandoffAlertControllerFactory mailAlertControllerForHandoffError:v4 acknowledgmentObserver:self];
  if (v6 && v7)
  {
    v8 = +[MFUserActivityRouter log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 ef_publicDescription];
      int v11 = 138412546;
      v12 = v6;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Hand-Off Presenting alert for handoff error using overlay controller %@. error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
    [v6 presentAlertController:v7 animated:1 completion:0];
  }
  else
  {
    if (v6)
    {
      v10 = +[MFUserActivityRouter log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10045D808();
      }
    }
    else
    {
      v10 = +[MFUserActivityRouter log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10045D870();
      }
    }
  }
}

- (void)recoverUIAfterHandoffFailureWithType:(id)a3
{
  id v6 = a3;
  id v4 = [(MFUserActivityRouter *)self delegate];
  if (([v6 isEqualToString:MSMailActivityHandoffTypeComposeSansStreams] & 1) != 0
    || [v6 isEqualToString:MSMailActivityHandoffTypeComposeWithStreams])
  {
    id v5 = [(MFUserActivityRouter *)self handoffComposeController];
    [(MFUserActivityRouter *)self setHandoffComposeController:0];
    if (v5) {
      [v4 dismissComposeController:v5 forUserActivityRouter:self];
    }
  }
}

- (void)userAcknowledgedHandoffError:(id)a3
{
  [a3 mf_mailHandoffActivityType];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFUserActivityRouter recoverUIAfterHandoffFailureWithType:](self, "recoverUIAfterHandoffFailureWithType:");
}

- (void)routeUserActivity:(id)a3
{
  id v8 = a3;
  id v4 = [v8 _syRelatedUniqueIdentifier];
  if (v4 && (int v5 = _os_feature_enabled_impl(), v4, v5))
  {
    [(MFUserActivityRouter *)self returnToSenderUserActivity:v8];
    id v6 = v8;
  }
  else
  {
    id v7 = [v8 userInfo];
    [(MFUserActivityRouter *)self handoffUserActivity:v8 withPayload:v7];

    id v6 = v8;
  }
}

- (void)routeWillContinueUserActivityWithType:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(MSMailReturnToSenderActivityType, "isEqualToString:")
    && _os_feature_enabled_impl())
  {
    [(MFUserActivityRouter *)self willReturnToSenderActivityWithType:v4];
  }
  else
  {
    [(MFUserActivityRouter *)self willHandoffUserActivityWithType:v4];
  }
}

- (void)routeUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([MSMailReturnToSenderActivityType isEqualToString:v7]
    && _os_feature_enabled_impl())
  {
    [(MFUserActivityRouter *)self returnToSenderUserActivityFailedWithType:v7 error:v6];
  }
  else
  {
    [(MFUserActivityRouter *)self handoffUserActivityFailedWithType:v7 error:v6];
  }
}

- (void)returnToSenderUserActivity:(id)a3
{
  id v4 = a3;
  int v5 = [(MFUserActivityRouter *)self delegate];
  id v6 = [v4 _syRelatedUniqueIdentifier];
  id v7 = [(MFUserActivityRouter *)self messageRepository];
  id v8 = [v7 messageForSearchableItemIdentifier:v6];

  v9 = [v8 resultWithTimeout:0 error:5.0];
  if (v9)
  {
    v10 = +[MFUserActivityRouter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v9 ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ReturnToSender success: found a valid message %{public}@", buf, 0xCu);
    }
    v12 = [v4 _syDocumentProvider];

    if (v12)
    {
      __int16 v13 = [v4 _syDocumentProvider];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100202660;
      v14[3] = &unk_10060DA50;
      id v15 = v9;
      v16 = self;
      id v17 = v6;
      id v18 = v5;
      [v13 loadDocumentWithHandler:v14];
    }
    else
    {
      [v5 displayMessage:v9 fromUserActivityRouter:self];
    }
  }
  else
  {
    [(MFUserActivityRouter *)self returnToSenderErrorHandling:v6 urlError:0];
  }
}

- (void)returnToSenderErrorHandling:(id)a3 urlError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[MFUserActivityRouter log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10045D940();
    }
  }
  else
  {
    v9 = +[MFUserActivityRouter log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10045D8D8();
    }

    [(MFUserActivityRouter *)self presentAlertForReturnToSenderError];
  }
}

- (void)willReturnToSenderActivityWithType:(id)a3
{
  id v3 = +[MFUserActivityRouter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ReturnToSender will return to sender activity", v4, 2u);
  }
}

- (void)returnToSenderUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MFUserActivityRouter log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 ef_publicDescription];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ReturnToSender return to sender user activity failed with type %@ and error=%{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(MFUserActivityRouter *)self presentAlertForReturnToSenderError];
}

- (void)presentAlertForReturnToSenderError
{
  id v3 = [(MFUserActivityRouter *)self delegate];
  id v12 = [v3 alertOverlayControllerForActivityRouter:self];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"SELECTED_MESSAGE_NOT_FOUND_ERROR_TITLE" value:&stru_100619928 table:@"Main"];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SELECTED_MESSAGE_NOT_FOUND_ERROR_BODY" value:&stru_100619928 table:@"Main"];
  id v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
  id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];

  [v8 addAction:v11];
  [v12 presentAlertController:v8 animated:1 completion:0];
}

- (MFUserActivityRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFUserActivityRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ComposeNavigationController)handoffComposeController
{
  return self->_handoffComposeController;
}

- (void)setHandoffComposeController:(id)a3
{
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_handoffComposeController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_LANHandoffAgent, 0);
}

@end