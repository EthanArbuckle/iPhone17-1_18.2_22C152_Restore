@interface VehicleDisambiguationTask
+ (int64_t)creationPreference;
- (void)displayDisambiguationPromptIfNeededFromChromeViewController:(id)a3;
@end

@implementation VehicleDisambiguationTask

+ (int64_t)creationPreference
{
  return 1;
}

- (void)displayDisambiguationPromptIfNeededFromChromeViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (MapsFeature_IsEnabled_EVRouting())
    {
      if (!self->_didDisplayVehicleDisambiguation)
      {
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v4);
        +[MapsExternalAccessory sharedInstance];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10069C300;
        v44[3] = &unk_1012F4468;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v45 = v9;
        v10 = objc_retainBlock(v44);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10069C5D0;
        v41[3] = &unk_1012F4550;
        objc_copyWeak(&v43, (id *)buf);
        v42 = &stru_1012F44A8;
        v11 = objc_retainBlock(v41);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10069C6CC;
        v36[3] = &unk_1012F45A0;
        objc_copyWeak(&v40, (id *)buf);
        v12 = v10;
        id v38 = v12;
        id v13 = v9;
        id v37 = v13;
        v14 = v11;
        id v39 = v14;
        v15 = objc_retainBlock(v36);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10069CB70;
        v31[3] = &unk_1012F4680;
        objc_copyWeak(&v35, &location);
        id v16 = v13;
        id v32 = v16;
        v17 = v14;
        id v33 = v17;
        v18 = v12;
        id v34 = v18;
        v19 = objc_retainBlock(v31);
        v20 = +[VGVirtualGarageService sharedService];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10069D480;
        v25[3] = &unk_1012F46C8;
        id v21 = v16;
        id v26 = v21;
        v27 = &stru_1012F44A8;
        v22 = v18;
        id v28 = v22;
        v23 = v15;
        id v29 = v23;
        v24 = v19;
        id v30 = v24;
        [v20 virtualGarageGetGarageWithReply:v25];

        objc_destroyWeak(&v35);
        objc_destroyWeak(&v40);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_20;
      }
      v5 = sub_100576D94();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Won't present disambiguation because we've already done this during this app launch.", buf, 2u);
      }
    }
    else
    {
      v5 = sub_100576D94();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Won't present disambiguation because EV routing is not enabled.", buf, 2u);
      }
    }
  }
  else
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "-[VehicleDisambiguationTask displayDisambiguationPromptIfNeededFromChromeViewController:]";
      __int16 v49 = 2080;
      v50 = "VehicleDisambiguationTask.m";
      __int16 v51 = 1024;
      int v52 = 36;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v48 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v5 = sub_100576D94();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Tried to display disambiguation, but did not have a chrome to display on.", buf, 2u);
    }
  }

LABEL_20:
}

@end