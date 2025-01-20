@interface SUSFollowUpExtensionViewController
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
@end

@implementation SUSFollowUpExtensionViewController

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  id v35 = 0;
  objc_storeStrong(&v35, a5);
  objc_storeStrong((id *)&v38->_activeAction, v36);
  id v5 = location[0];
  SULogInfo();
  id v6 = objc_msgSend(v36, "identifier", v5);
  SULogInfo();

  id v27 = objc_msgSend(v36, "identifier", v6);
  unsigned __int8 v28 = [v27 isEqualToString:@"com.followup.install_now_action"];

  if (v28)
  {
    SULogInfo();
    v24 = &_dispatch_main_q;
    dispatch_sync((dispatch_queue_t)v24, &stru_100004388);
  }
  else
  {
    id v22 = [v36 identifier];
    unsigned __int8 v23 = [v22 isEqualToString:@"com.followup.install_later_action"];

    if (v23)
    {
      id v34 = 0;
      SULogInfo();
      id v33 = objc_alloc_init((Class)FLFollowUpController);
      id v32 = v34;
      unsigned __int8 v21 = [v33 clearNotificationForItem:location[0] error:&v32];
      objc_storeStrong(&v34, v32);
      if ((v21 & 1) == 0)
      {
        id v7 = location[0];
        id v8 = v34;
        SULogInfo();
      }
      id v17 = v33;
      id v19 = objc_msgSend(location[0], "uniqueIdentifier", v7, v8);
      id v40 = v19;
      v18 = +[NSArray arrayWithObjects:&v40 count:1];
      id v31 = v34;
      unsigned __int8 v20 = objc_msgSend(v17, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:");
      objc_storeStrong(&v34, v31);

      if ((v20 & 1) == 0) {
        SULogInfo();
      }
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
    }
    else
    {
      id v15 = [v36 identifier];
      unsigned __int8 v16 = [v15 isEqualToString:@"com.followup.clear_item_action"];

      if (v16)
      {
        SULogInfo();
        id v30 = objc_alloc_init((Class)FLFollowUpController);
        id v12 = v30;
        id v14 = [location[0] uniqueIdentifier];
        id v39 = v14;
        v13 = +[NSArray arrayWithObjects:&v39 count:1];
        objc_msgSend(v12, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:");

        objc_storeStrong(&v30, 0);
      }
      else
      {
        id v10 = [v36 identifier];
        unsigned __int8 v11 = [v10 isEqualToString:@"com.followup.go_to_update_pane"];

        SULogInfo();
        if (v11)
        {
          v29 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
          id v9 = +[LSApplicationWorkspace defaultWorkspace];
          objc_msgSend(v9, "openSensitiveURL:withOptions:", v29);

          objc_storeStrong((id *)&v29, 0);
        }
      }
    }
  }
  (*((void (**)(id, uint64_t))v35 + 2))(v35, 1);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end