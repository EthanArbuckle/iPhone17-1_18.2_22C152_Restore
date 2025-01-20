@interface ICQFollowupViewController
- (FLFollowUpItem)item;
- (ICQUpgradeFlowManager)upgradeFlowManager;
- (id)followupCompletion;
- (id)sharedFollowUpController;
- (int64_t)requestType;
- (void)_finalizeUpgradeFlowManager:(id)a3;
- (void)clearFollowupItem:(id)a3;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)getOfferWithRequestType:(int64_t)a3 withCompletion:(id)a4;
- (void)handleRemoteUIAction:(id)a3;
- (void)icqActionPhotosOptimize:(id)a3;
- (void)icqActionPresentOptInFlow:(id)a3;
- (void)icqActionPresentOptInFlowForOffer:(id)a3 withCompletion:(id)a4;
- (void)icqActionPresentPurchaseFlow:(id)a3;
- (void)icqActionPresentPurchaseFlowForOffer:(id)a3 withCompletion:(id)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setFollowupCompletion:(id)a3;
- (void)setItem:(id)a3;
- (void)setUpgradeFlowManager:(id)a3;
- (void)startShowingServerUI:(id)a3;
- (void)teardownOffer;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQFollowupViewController

- (int64_t)requestType
{
  v3 = [(FLFollowUpItem *)self->_item uniqueIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:_ICQIdentifierPrefixPremium];

  if (v4) {
    return 2;
  }
  v6 = [(FLFollowUpItem *)self->_item uniqueIdentifier];
  unsigned int v7 = [v6 isEqualToString:_ICQIdentifierPrefixEvent];

  if (v7) {
    return 5;
  }
  else {
    return 3;
  }
}

- (id)sharedFollowUpController
{
  if (qword_10000CA10 != -1) {
    dispatch_once(&qword_10000CA10, &stru_100008328);
  }
  v2 = (void *)qword_10000CA08;
  return v2;
}

- (void)clearFollowupItem:(id)a3
{
  id v4 = a3;
  v5 = [(ICQFollowupViewController *)self sharedFollowUpController];
  v6 = [v4 uniqueIdentifier];
  v19 = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:&v19 count:1];
  id v14 = 0;
  [v5 clearPendingFollowUpItemsWithUniqueIdentifiers:v7 error:&v14];
  id v8 = v14;

  v9 = _ICQGetLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v8;
      v11 = "unable to clear followup item %@ error %@";
      v12 = v9;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    v11 = "followup item successfully cleared";
    v12 = v9;
    uint32_t v13 = 2;
    goto LABEL_6;
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, BOOL))a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = +[ICQOfferManager sharedOfferManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000446C;
  v14[3] = &unk_1000083B8;
  id v16 = &stru_100008368;
  __int16 v17 = &v18;
  v6 = v4;
  v15 = v6;
  [v5 getOfferWithCompletion:v14];

  dispatch_group_enter(v6);
  unsigned int v7 = +[ICQOfferManager sharedOfferManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000044E4;
  v10[3] = &unk_1000083E0;
  v12 = &stru_100008368;
  uint32_t v13 = &v18;
  id v8 = v6;
  v11 = v8;
  [v7 getPremiumOfferWithCompletion:v10];

  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v8, v9);
  v3[2](v3, *((unsigned char *)v19 + 24) == 0);

  _Block_object_dispose(&v18, 8);
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, uint64_t))a5;
  objc_storeStrong((id *)&self->_item, a3);
  v12 = [v10 userInfo];
  uint32_t v13 = [v12 objectForKeyedSubscript:@"ICQLinkAction"];
  self->_int64_t icqAction = _ICQActionForString();

  id v14 = [v10 userInfo];
  v15 = [v14 objectForKeyedSubscript:@"ICQLinkParameters"];
  icqActionParameters = self->_icqActionParameters;
  self->_icqActionParameters = v15;

  __int16 v17 = [v10 userInfo];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"ICQFlowServerDict"];
  icqFlowServerDict = self->_icqFlowServerDict;
  self->_icqFlowServerDict = v18;

  if ([v10 eventSource] == (id)3)
  {
    uint64_t v20 = [v9 actions];
    id v21 = [v20 indexOfObjectPassingTest:&stru_100008420];

    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = [v9 actions];
      v23 = [v22 objectAtIndex:v21];

      v24 = [v23 userInfo];
      v25 = [v24 objectForKeyedSubscript:@"ICQLinkAction"];
      self->_int64_t icqAction = _ICQActionForString();

      v26 = [v23 userInfo];
      v27 = [v26 objectForKeyedSubscript:@"ICQLinkParameters"];
      v28 = self->_icqActionParameters;
      self->_icqActionParameters = v27;

      v29 = [v23 userInfo];
      v30 = [v29 objectForKeyedSubscript:@"ICQFlowServerDict"];
      v31 = self->_icqFlowServerDict;
      self->_icqFlowServerDict = v30;
    }
  }
  v32 = _ICQGetLogSystem();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = _ICQStringForAction();
    *(_DWORD *)buf = 138412290;
    v60 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "followup: %@", buf, 0xCu);
  }
  v34 = [(NSDictionary *)self->_icqActionParameters objectForKeyedSubscript:ICQActionParameterServerLinkIdentifierKey];
  if (v34)
  {
    v35 = (void *)os_transaction_create();
    v36 = [v9 userInfo];
    v37 = _ICQStringForKey();

    v52 = v11;
    if (v37)
    {
      id v38 = v9;
      if ([v10 eventSource] == (id)3)
      {
        uint64_t v65 = ICQUpdateOfferKeyIsZeroAction;
        v66 = &off_100008658;
        id v39 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      }
      else
      {
        id v39 = 0;
      }
      v42 = _ICQGetLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v60 = v37;
        __int16 v61 = 2112;
        v62 = v34;
        __int16 v63 = 2112;
        id v64 = v39;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "ICQFollowup sending updateOfferId:%@ buttonId:%@ info:%@", buf, 0x20u);
      }

      v43 = +[ICQOfferManager sharedOfferManager];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = nullsub_2;
      v57[3] = &unk_100008390;
      id v58 = v35;
      id v41 = v35;
      [v43 updateOfferId:v37 buttonId:v34 info:v39 completion:v57];
    }
    else
    {
      id v38 = v9;
      int64_t v40 = [(ICQFollowupViewController *)self requestType];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100004D60;
      v53[3] = &unk_100008448;
      id v54 = v10;
      id v55 = v34;
      id v56 = v35;
      id v39 = v35;
      [(ICQFollowupViewController *)self getOfferWithRequestType:v40 withCompletion:v53];

      id v41 = v54;
    }

    id v9 = v38;
    v11 = v52;
  }
  int64_t icqAction = self->_icqAction;
  uint64_t v45 = 1;
  switch(icqAction)
  {
    case 'd':
    case 'g':
      +[ICQLink performAction:parameters:options:](ICQLink, "performAction:parameters:options:");
LABEL_23:
      [(ICQFollowupViewController *)self clearFollowupItem:v9];
      goto LABEL_28;
    case 'e':
    case 'n':
    case 'o':
    case 'q':
    case 'w':
    case 'x':
      break;
    case 'f':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'p':
    case 'r':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'y':
LABEL_17:
      v46 = [(NSDictionary *)self->_icqActionParameters objectForKeyedSubscript:ICQActionParameterOpenURLKey];
      v47 = +[NSURL URLWithString:v46];
      openURL = self->_openURL;
      self->_openURL = v47;

      uint64_t v45 = 0;
      break;
    case 'h':
LABEL_24:
      +[ICQLink performAction:parameters:options:](ICQLink, "performAction:parameters:options:");
      goto LABEL_28;
    case 'm':
LABEL_19:
      v49 = _ICQGetLogSystem();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = _ICQStringForAction();
        *(_DWORD *)buf = 138412290;
        v60 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "action %@ not supported directly in followup context", buf, 0xCu);
      }
LABEL_28:
      uint64_t v45 = 1;
      break;
    default:
      switch(icqAction)
      {
        case 0:
          v51 = _ICQGetLogSystem();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "action specified was none; doing nothing",
              buf,
              2u);
          }

          goto LABEL_28;
        case 1:
        case 2:
          goto LABEL_23;
        case 3:
          goto LABEL_17;
        case 4:
        case 5:
          goto LABEL_19;
        case 6:
          goto LABEL_24;
        default:
          goto LABEL_29;
      }
  }
LABEL_29:
  v11[2](v11, v45);
}

- (void)startShowingServerUI:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100005D68();
  }
  v5 = (void (**)(void, void))v4;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presenting ICQ UI", buf, 2u);
  }

  unint64_t icqAction = self->_icqAction;
  switch(icqAction)
  {
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'm':
      goto LABEL_8;
    case 'i':
    case 'p':
    case 's':
    case 'v':
    case 'y':
      goto LABEL_5;
    case 'j':
      [(ICQFollowupViewController *)self icqActionPhotosOptimize:v5];
      goto LABEL_12;
    case 'k':
      [(ICQFollowupViewController *)self icqActionPhotosCloudEnable:v5];
      goto LABEL_12;
    case 'l':
      [(ICQFollowupViewController *)self icqActionPhotosCloudUpgradeEnable:v5];
      goto LABEL_12;
    case 'n':
    case 'o':
    case 'q':
    case 't':
    case 'u':
    case 'w':
    case 'x':
      goto LABEL_12;
    case 'r':
      goto LABEL_11;
    default:
      if (icqAction > 6) {
        goto LABEL_12;
      }
      if (icqAction == 3)
      {
LABEL_5:
        [(ICQFollowupViewController *)self handleRemoteUIAction:v5];
      }
      else
      {
LABEL_8:
        id v8 = _ICQStringForAction();
        id v9 = _ICQGetLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint32_t v13 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unexpected action %@", buf, 0xCu);
        }

        id v10 = +[NSString stringWithFormat:@"unexpected action %@", v8];
        v11 = ICQCreateErrorWithMessage();
        ((void (**)(void, void *))v5)[2](v5, v11);

LABEL_11:
        [(ICQFollowupViewController *)self icqActionPresentPurchaseFlow:v5];
      }
LABEL_12:

      return;
  }
}

- (void)_finalizeUpgradeFlowManager:(id)a3
{
  id v4 = (ICQUpgradeFlowManager *)a3;
  if (self->_upgradeFlowManager != v4)
  {
    v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      upgradeFlowManager = self->_upgradeFlowManager;
      int v10 = 138412546;
      v11 = v4;
      __int16 v12 = 2112;
      uint32_t v13 = upgradeFlowManager;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICQFollowup UpgradeFlowManager did cancel for manager %@ instead of %@", (uint8_t *)&v10, 0x16u);
    }
  }
  followupCompletion = (void (**)(id, void))self->_followupCompletion;
  if (followupCompletion)
  {
    followupCompletion[2](followupCompletion, 0);
    id v8 = self->_followupCompletion;
    self->_followupCompletion = 0;
  }
  id v9 = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "upgradeFlowManagerDidCancel", v6, 2u);
  }

  [(ICQFollowupViewController *)self _finalizeUpgradeFlowManager:v4];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "upgradeFlowManagerDidComplete", v6, 2u);
  }

  [(ICQFollowupViewController *)self clearFollowupItem:self->_item];
  [(ICQFollowupViewController *)self _finalizeUpgradeFlowManager:v4];
}

- (void)handleRemoteUIAction:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICQFollowupViewController *)self requestType];
  if (v5 == 5)
  {
    unsigned int v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      id v8 = "Handling remoteUI Action for event offer";
      id v9 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_11:

    [(ICQFollowupViewController *)self icqActionPresentPurchaseFlow:v4];
    goto LABEL_12;
  }
  if (v5 != 2)
  {
    unsigned int v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v8 = "Handling remoteUI Action for regular offer";
      id v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling remoteUI Action for premium offer", buf, 2u);
  }

  [(ICQFollowupViewController *)self icqActionPresentOptInFlow:v4];
LABEL_12:
}

- (void)icqActionPresentOptInFlow:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICQFollowupViewController *)self requestType];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005594;
  v7[3] = &unk_100008498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICQFollowupViewController *)self getOfferWithRequestType:v5 withCompletion:v7];
}

- (void)icqActionPresentOptInFlowForOffer:(id)a3 withCompletion:(id)a4
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100005D94(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)icqActionPresentPurchaseFlow:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICQFollowupViewController *)self requestType];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000057BC;
  v7[3] = &unk_100008498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICQFollowupViewController *)self getOfferWithRequestType:v5 withCompletion:v7];
}

- (void)icqActionPresentPurchaseFlowForOffer:(id)a3 withCompletion:(id)a4
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100005E0C(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)getOfferWithRequestType:(int64_t)a3 withCompletion:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1:
    case 3:
      uint64_t v6 = +[ICQOfferManager sharedOfferManager];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005B3C;
      v14[3] = &unk_1000084C0;
      v15 = v5;
      [v6 getOfferForBundleIdentifier:@"com.apple.Preferences" completion:v14];

      uint64_t v7 = v15;
      break;
    case 2:
      uint64_t v8 = +[ICQOfferManager sharedOfferManager];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100005B4C;
      v12[3] = &unk_1000084E8;
      uint32_t v13 = v5;
      [v8 getPremiumOfferForBundleIdentifier:@"com.apple.Preferences" completion:v12];

      uint64_t v7 = v13;
      break;
    case 5:
      uint64_t v9 = +[ICQOfferManager sharedOfferManager];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100005B5C;
      v10[3] = &unk_1000084C0;
      uint64_t v11 = v5;
      [v9 getEventOfferWithOptions:0 completion:v10];

      uint64_t v7 = v11;
      break;
    default:
      uint64_t v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005E84(a3, v7);
      }
      break;
  }
}

- (void)icqActionPhotosOptimize:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100005F28(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)teardownOffer
{
  int64_t v2 = [(ICQFollowupViewController *)self requestType];
  if (v2 == 5)
  {
    id v3 = +[ICQOfferManager sharedOfferManager];
    [v3 teardownCachedEventOffer];
  }
  else if (v2 == 2)
  {
    id v3 = +[ICQOfferManager sharedOfferManager];
    [v3 teardownCachedPremiumOffer];
  }
  else
  {
    id v3 = +[ICQOfferManager sharedOfferManager];
    [v3 teardownCachedOffer];
  }
}

- (FLFollowUpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (ICQUpgradeFlowManager)upgradeFlowManager
{
  return self->_upgradeFlowManager;
}

- (void)setUpgradeFlowManager:(id)a3
{
}

- (id)followupCompletion
{
  return self->_followupCompletion;
}

- (void)setFollowupCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_followupCompletion, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_openURL, 0);
  objc_storeStrong((id *)&self->_icqFlowServerDict, 0);
  objc_storeStrong((id *)&self->_icqActionParameters, 0);
}

@end