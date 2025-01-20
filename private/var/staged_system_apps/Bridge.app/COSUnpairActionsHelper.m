@interface COSUnpairActionsHelper
+ (void)applyUnpairActionsForContext:(id)a3 withCompletion:(id)a4;
+ (void)checkIfWatch:(id)a3 hasPlanWithBlock:(id)a4;
+ (void)presentApplePayLocallyStoredValueOfflineWarningIfNeededForContext:(id)a3 completionHandler:(id)a4;
+ (void)presentUnpairOrResetErrorMessage:(id)a3 fromController:(id)a4 withCompletion:(id)a5;
+ (void)promptWhetherToPreserveCellPlansPriorToUnpairForWatch:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
@end

@implementation COSUnpairActionsHelper

+ (void)applyUnpairActionsForContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 device];
  unsigned __int8 v9 = [v6 markAsMissing];
  v10 = [v6 presentingViewController];
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 0;
  v11 = [v8 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v12 = [v11 BOOLValue];

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10010DDD4;
  v48[3] = &unk_100247548;
  id v13 = v8;
  id v49 = v13;
  unsigned __int8 v54 = v9;
  id v14 = v10;
  id v50 = v14;
  id v15 = v7;
  id v52 = v15;
  v53 = v55;
  id v16 = v6;
  id v51 = v16;
  v17 = objc_retainBlock(v48);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10010E34C;
  v40[3] = &unk_1002475C0;
  unsigned __int8 v47 = v12;
  id v18 = v13;
  id v41 = v18;
  id v19 = v15;
  id v43 = v19;
  v45 = v55;
  id v46 = a1;
  id v20 = v16;
  id v42 = v20;
  v21 = v17;
  id v44 = v21;
  v22 = objc_retainBlock(v40);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10010E71C;
  v34[3] = &unk_100247610;
  id v39 = a1;
  id v23 = v20;
  id v35 = v23;
  v24 = v22;
  id v36 = v24;
  id v25 = v19;
  id v37 = v25;
  v38 = v55;
  v26 = objc_retainBlock(v34);
  v27 = objc_opt_class();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10010E804;
  v30[3] = &unk_100247638;
  id v28 = v25;
  id v31 = v28;
  v33 = v55;
  v29 = v26;
  id v32 = v29;
  [v27 promptWhetherToPreserveCellPlansPriorToUnpairForWatch:v18 presentingViewController:v14 completionHandler:v30];

  _Block_object_dispose(v55, 8);
}

+ (void)presentApplePayLocallyStoredValueOfflineWarningIfNeededForContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = pbb_manualunpairing_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "+[COSUnpairActionsHelper presentApplePayLocallyStoredValueOfflineWarningIfNeededForContext:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  v8 = [UIApp activeWatch];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v5 device];
  if (!v9) {
    goto LABEL_7;
  }
  v10 = (void *)v9;
  v11 = [v5 device];
  unsigned int v12 = [v11 isEqual:v8];

  if (v12)
  {
    id v13 = [v5 presentingViewController];
    id v14 = [v5 device];
    +[BPSApplePayLocallyStoredValueManager presentApplePayLocallyStoredValueOfflineWarningIfNeededInController:v13 forPairedDevice:v14 withCompletion:v6];
  }
  else
  {
LABEL_7:
    if (v6) {
      v6[2](v6, 1);
    }
  }
}

+ (void)checkIfWatch:(id)a3 hasPlanWithBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = pbb_manualunpairing_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking if watch has plan for Device", buf, 2u);
  }

  *(void *)buf = 0;
  v38 = buf;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100015E0C;
  id v41 = sub_100015D84;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100015E0C;
  v35[4] = sub_100015D84;
  id v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100015E0C;
  v33 = sub_100015D84;
  dispatch_source_t v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v8 = v30[5];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  v10 = v30[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10010EDD8;
  handler[3] = &unk_100246970;
  id v28 = &v29;
  id v11 = v6;
  id v27 = v11;
  dispatch_source_set_event_handler(v10, handler);
  unsigned int v12 = v30[5];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10010EE4C;
  v21[3] = &unk_100247660;
  id v22 = v11;
  id v23 = &v29;
  v24 = v35;
  id v25 = buf;
  id v13 = v11;
  dispatch_source_set_cancel_handler(v12, v21);
  id v14 = dispatch_get_global_queue(25, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10010EF68;
  v16[3] = &unk_1002476D8;
  id v17 = v5;
  id v18 = &v29;
  id v19 = buf;
  id v20 = v35;
  id v15 = v5;
  dispatch_async(v14, v16);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(buf, 8);
}

+ (void)promptWhetherToPreserveCellPlansPriorToUnpairForWatch:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    char HasCapabilityForString = BPSDeviceHasCapabilityForString();
    unsigned int v12 = pbb_manualunpairing_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (HasCapabilityForString)
    {
      if (v13)
      {
        *(_DWORD *)buf = 136315138;
        v30 = "+[COSUnpairActionsHelper promptWhetherToPreserveCellPlansPriorToUnpairForWatch:presentingViewController:co"
              "mpletionHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10010F7E4;
      v25[3] = &unk_100244830;
      id v14 = v8;
      id v26 = v14;
      id v15 = v10;
      id v28 = v15;
      id v16 = v9;
      id v27 = v16;
      id v17 = objc_retainBlock(v25);
      id v18 = [v14 valueForProperty:NRDevicePropertyIsActive];
      unsigned __int8 v19 = [v18 BOOLValue];

      if (v19)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10010FAC0;
        v21[3] = &unk_100247700;
        id v23 = v17;
        id v24 = v15;
        id v22 = v16;
        [a1 checkIfWatch:v14 hasPlanWithBlock:v21];
      }
      else
      {
        id v20 = pbb_manualunpairing_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Presenting ambiguous cellular plan alert; Watch is not active",
            buf,
            2u);
        }

        ((void (*)(void *))v17[2])(v17);
      }
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not prompting whether to delete plans; Watch does not have Cellular capability",
          buf,
          2u);
      }

      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
  }
}

+ (void)presentUnpairOrResetErrorMessage:(id)a3 fromController:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010FF6C;
  block[3] = &unk_100244830;
  id v13 = a4;
  id v14 = a5;
  id v12 = v7;
  id v8 = v13;
  id v9 = v14;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end