@interface HOAppNavigationURLHandler
- (HOAppNavigationURLHandler)init;
- (HOAppNavigationURLHandler)initWithNavigator:(id)a3;
- (HOAppNavigator)navigator;
- (id)_endDateForURLComponents:(id)a3;
- (id)_openURLComponents:(id)a3;
- (id)_startDateForURLComponents:(id)a3;
- (id)notificationCenter:(id)a3 presentNotificationWithObjectURL:(id)a4;
- (id)openApplicationURL:(id)a3;
- (id)openURL:(id)a3;
- (unint64_t)lockOnboardingTypeForString:(id)a3;
- (void)notificationCenter:(id)a3 presentCustomSettingsForNotificationWithObjectURL:(id)a4;
@end

@implementation HOAppNavigationURLHandler

- (HOAppNavigationURLHandler)initWithNavigator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HOAppNavigationURLHandler;
  v5 = [(HOAppNavigationURLHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_navigator, v4);
  }

  return v6;
}

- (HOAppNavigationURLHandler)init
{
  id v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithNavigator:");
  [v4 handleFailureInMethod:a2 object:self file:@"HOAppNavigationURLHandler.m" lineNumber:41 description:@"%s is unavailable; use %@ instead"];
    "-[HOAppNavigationURLHandler init]",
    v5);

  return 0;
}

- (id)openURL:(id)a3
{
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler received request to open URL: %@.", buf, 0xCu);
  }

  v6 = [v4 host];
  unsigned int v7 = [v6 isEqualToString:@"accessorytype"];

  if (v7)
  {
    objc_super v8 = [v4 path];
    id v9 = [v8 pathComponents];

    v10 = +[HFHomeKitDispatcher sharedDispatcher];
    v11 = [v10 homeManager];
    v12 = [v11 hf_homeForURL:v4];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = +[HFHomeKitDispatcher sharedDispatcher];
      id v14 = [v15 home];
    }
    if ((unint64_t)[v9 count] >= 2)
    {
      v16 = [v9 objectAtIndexedSubscript:1];
      if ([v16 isEqualToString:@"climate"])
      {
        v17 = [(HOAppNavigationURLHandler *)self navigator];
        uint64_t v18 = +[HFAccessoryTypeGroup climateAccessoryTypeGroup];
LABEL_18:
        id v19 = (id)v18;
        v20 = [v17 showAccessoryTypeGroup:v18 forHome:v14 animated:1];
LABEL_19:

        goto LABEL_31;
      }
      if ([v16 isEqualToString:@"lights"])
      {
        v17 = [(HOAppNavigationURLHandler *)self navigator];
        uint64_t v18 = +[HFAccessoryTypeGroup lightAccessoryTypeGroup];
        goto LABEL_18;
      }
      if ([v16 isEqualToString:@"media"])
      {
        v17 = [(HOAppNavigationURLHandler *)self navigator];
        uint64_t v18 = +[HFAccessoryTypeGroup mediaAccessoryTypeGroup];
        goto LABEL_18;
      }
      if ([v16 isEqualToString:@"security"])
      {
        v17 = [(HOAppNavigationURLHandler *)self navigator];
        uint64_t v18 = +[HFAccessoryTypeGroup securityAccessoryTypeGroup];
        goto LABEL_18;
      }
      if ([v16 isEqualToString:@"water"])
      {
        v17 = [(HOAppNavigationURLHandler *)self navigator];
        uint64_t v18 = +[HFAccessoryTypeGroup waterAccessoryTypeGroup];
        goto LABEL_18;
      }
      if ([v16 isEqualToString:@"energy"])
      {
        v17 = +[NSURL hf_locationFromURL:v4];
        if (v17) {
          [v14 hf_setTemporaryEnergyLocation:v17];
        }
        id v19 = [objc_alloc((Class)HFURLComponents) initWithURL:v4];
        v21 = [v19 valueForParameter:@"from"];
        +[HUEnergyAnalytics saveViewAccessedFromURLEvent:54 deepLinkFrom:v21];
        v22 = [(HOAppNavigationURLHandler *)self navigator];
        v23 = +[HFAccessoryTypeGroup energyAccessoryTypeGroup];
        v20 = [v22 showAccessoryTypeGroup:v23 forHome:v14 animated:1];

        goto LABEL_19;
      }
    }
  }
  id v9 = [objc_alloc((Class)HFURLComponents) initWithURL:v4];
  if ([v9 destination])
  {
    v20 = [(HOAppNavigationURLHandler *)self _openURLComponents:v9];
  }
  else
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler failed to open unsupported URL: %@.", buf, 0xCu);
    }

    v28 = NSURLErrorFailingURLErrorKey;
    id v29 = v4;
    v25 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v26 = +[NSError errorWithDomain:NSURLErrorDomain code:-1002 userInfo:v25];
    v20 = +[NAFuture futureWithError:v26];
  }
LABEL_31:

  return v20;
}

- (id)_openURLComponents:(id)a3
{
  id v4 = a3;
  v5 = (HOAppNavigationURLHandler *)objc_alloc_init((Class)NAFuture);
  id v6 = [v4 destination];
  switch((unint64_t)v6)
  {
    case 0xBuLL:
      unsigned int v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Resident Device View.", buf, 2u);
      }

      objc_super v8 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v8 showAboutResidentDeviceView];
      goto LABEL_84;
    case 0xCuLL:
      v33 = +[HFHomeKitDispatcher sharedDispatcher];
      v34 = [v33 homeManager];
      id v35 = objc_alloc((Class)NSUUID);
      v36 = [v4 valueForParameter:HFURLComponentsHome];
      id v37 = [v35 initWithUUIDString:v36];
      v38 = [v34 hf_homeWithIdentifier:v37];
      v39 = v38;
      if (v38)
      {
        objc_super v8 = v38;
      }
      else
      {
        v99 = +[HFHomeKitDispatcher sharedDispatcher];
        objc_super v8 = [v99 home];
      }
      v100 = HFLogForCategory();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v8;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Face Recognition Settings for home %@.", buf, 0xCu);
      }

      v27 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v27 showFaceRecognitionSettingsForHome:v8];

      goto LABEL_83;
    case 0xDuLL:
      v10 = +[HFHomeKitDispatcher sharedDispatcher];
      v11 = [v10 homeManager];
      id v12 = objc_alloc((Class)NSUUID);
      v13 = [v4 valueForParameter:HFURLComponentsHome];
      id v14 = [v12 initWithUUIDString:v13];
      v15 = [v11 hf_homeWithIdentifier:v14];
      v16 = v15;
      if (v15)
      {
        objc_super v8 = v15;
      }
      else
      {
        v90 = +[HFHomeKitDispatcher sharedDispatcher];
        objc_super v8 = [v90 home];
      }
      v91 = HFLogForCategory();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v8;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Network Settings for home %@.", buf, 0xCu);
      }

      v27 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v27 showNetworkSettingsForHome:v8];

      goto LABEL_83;
    case 0xEuLL:
      id v40 = objc_alloc((Class)NSUUID);
      v41 = [v4 valueForParameter:HFURLComponentsHome];
      objc_super v8 = (HOAppNavigationURLHandler *)[v40 initWithUUIDString:v41];

      v42 = +[HFHomeKitDispatcher sharedDispatcher];
      v43 = [v42 homeManager];
      v44 = [v43 hf_homeWithIdentifier:v8];
      v45 = v44;
      if (v44)
      {
        v27 = v44;
      }
      else
      {
        v101 = +[HFHomeKitDispatcher sharedDispatcher];
        v27 = [v101 home];
      }
      v102 = HFLogForCategory();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v27;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to show firmware updates for home: %@", buf, 0xCu);
      }

      v103 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [v103 showSoftwareUpdateForHome:v27];

      goto LABEL_83;
    case 0xFuLL:
      v46 = HFLogForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [v4 URL];
        *(_DWORD *)buf = 138412290;
        v136 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to add accessory: %@.", buf, 0xCu);
      }
      objc_super v8 = [(HOAppNavigationURLHandler *)self navigator];
      v27 = [v4 URL];
      id v9 = [(HOAppNavigationURLHandler *)v8 addAccessoryWithURL:v27];

      goto LABEL_83;
    case 0x10uLL:
      v17 = [v4 URL];
      uint64_t v18 = [v17 path];
      if ((unint64_t)[v18 length] < 2)
      {
        objc_super v8 = 0;
      }
      else
      {
        id v19 = [v4 URL];
        v20 = [v19 path];
        objc_super v8 = [v20 substringFromIndex:1];
      }
      id v80 = [objc_alloc((Class)HMFMACAddress) initWithMACAddressString:v8];
      v81 = [v80 formattedString];

      v82 = HFLogForCategory();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v81;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to reprovision device for deviceIdentifier %@.", buf, 0xCu);
      }

      v83 = +[HFHomeKitDispatcher sharedDispatcher];
      v84 = [v83 allHomesFuture];
      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_1000251D8;
      v129[3] = &unk_1000C27A8;
      v130 = v81;
      v131 = self;
      id v132 = v4;
      v27 = v81;
      id v9 = [v84 flatMap:v129];

      goto LABEL_83;
    case 0x12uLL:
      objc_super v8 = [v4 valueForParameter:@"sender"];
      if (!v8)
      {
        v53 = +[NSString stringWithFormat:@"%@://%@&sender=", HFHomePrivateURLScheme, @"installhomepodprofile"];
        v54 = [v4 URL];
        v55 = [v54 absoluteString];
        v56 = [v55 uppercaseString];
        v57 = [v53 uppercaseString];
        unsigned int v58 = [v56 hasPrefix:v57];

        if (v58)
        {
          v59 = [v4 URL];
          v60 = [v59 absoluteString];
          [v60 substringFromIndex:[v53 length]];
          objc_super v8 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_super v8 = 0;
        }
      }
      v115 = HFLogForCategory();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v8;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to install Homepod profile: %@.", buf, 0xCu);
      }

      v27 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v27 showHomePodProfileInstallationFlowWithSender:v8];

      goto LABEL_83;
    case 0x13uLL:
      objc_super v8 = [v4 valueForParameter:@"sender"];
      v27 = [v4 valueForParameter:HFURLComponentsHomeID];
      if (v27)
      {
        id v61 = [objc_alloc((Class)NSUUID) initWithUUIDString:v27];
        if (v61)
        {
          v62 = +[HFHomeKitDispatcher sharedDispatcher];
          v63 = [v62 homeManager];
          v64 = [v63 homes];
          v133[0] = _NSConcreteStackBlock;
          v133[1] = 3221225472;
          v133[2] = sub_100025190;
          v133[3] = &unk_1000C20C0;
          id v61 = v61;
          id v134 = v61;
          v65 = [v64 na_firstObjectPassingTest:v133];

          goto LABEL_47;
        }
      }
      else
      {
        id v61 = 0;
      }
      v65 = 0;
LABEL_47:
      v85 = HFLogForCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = [v65 name];
        *(_DWORD *)buf = 138412546;
        v136 = v86;
        __int16 v137 = 2112;
        v138 = (const char *)v8;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to show HomePod software updates for home: %@ , sender:%@", buf, 0x16u);
      }
      v87 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [v87 showSoftwareUpdateForHome:v65];

LABEL_83:
      v5 = v27;
LABEL_84:

      return v9;
    case 0x16uLL:
      v66 = +[HFHomeKitDispatcher sharedDispatcher];
      v67 = [v66 homeManager];
      id v68 = objc_alloc((Class)NSUUID);
      v69 = [v4 valueForParameter:HFURLComponentsHomeID];
      id v70 = [v68 initWithUUIDString:v69];
      v71 = [v67 hf_homeWithIdentifier:v70];
      v72 = v71;
      if (v71)
      {
        objc_super v8 = v71;
      }
      else
      {
        v104 = +[HFHomeKitDispatcher sharedDispatcher];
        objc_super v8 = [v104 home];
      }
      v105 = [v4 valueForParameter:@"showEnablementSheet"];
      id v106 = [v105 BOOLValue];

      v107 = HFLogForCategory();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v108 = [v4 URL];
        *(_DWORD *)buf = 138412290;
        v136 = v108;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Personal Requests Enablement: %@.", buf, 0xCu);
      }
      v109 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v109 showSiriPersonalRequestsSettingsForHome:v8 showEnablementSheet:v106];

      goto LABEL_77;
    case 0x17uLL:
      v73 = +[HFHomeKitDispatcher sharedDispatcher];
      v74 = [v73 homeManager];
      id v75 = objc_alloc((Class)NSUUID);
      v76 = [v4 valueForParameter:HFURLComponentsHomeID];
      id v77 = [v75 initWithUUIDString:v76];
      v78 = [v74 hf_homeWithIdentifier:v77];
      v79 = v78;
      if (v78)
      {
        objc_super v8 = v78;
      }
      else
      {
        v110 = +[HFHomeKitDispatcher sharedDispatcher];
        objc_super v8 = [v110 home];
      }
      v111 = [v4 valueForParameter:@"showEnablementSheet"];
      id v112 = [v111 BOOLValue];

      v113 = HFLogForCategory();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        v114 = [v4 URL];
        *(_DWORD *)buf = 138412290;
        v136 = v114;
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Recognize My Voice Enablement: %@.", buf, 0xCu);
      }
      v109 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [(HOAppNavigationURLHandler *)v109 showRecognizeMyVoiceSettingsForHome:v8 showEnablementSheet:v112];

LABEL_77:
      v5 = v109;
      goto LABEL_84;
    case 0x1BuLL:
      id v21 = objc_alloc((Class)NSUUID);
      v22 = [v4 valueForParameter:HFURLComponentsHomeID];
      objc_super v8 = (HOAppNavigationURLHandler *)[v21 initWithUUIDString:v22];

      v23 = +[HFHomeKitDispatcher sharedDispatcher];
      v24 = [v23 homeManager];
      v25 = [v24 hf_homeWithIdentifier:v8];
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        v92 = +[HFHomeKitDispatcher sharedDispatcher];
        v27 = [v92 home];
      }
      id v93 = objc_alloc((Class)NSUUID);
      v94 = [v4 valueForParameter:HFURLComponentsAccessoryID];
      id v95 = [v93 initWithUUIDString:v94];

      v96 = [(HOAppNavigationURLHandler *)v27 hf_accessoryWithIdentifier:v95];
      v97 = HFLogForCategory();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v136 = v96;
        __int16 v137 = 2112;
        v138 = (const char *)v27;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Drop In UI for accessory %@ in home %@.", buf, 0x16u);
      }

      v98 = [(HOAppNavigationURLHandler *)self navigator];
      id v9 = [v98 showDropInUI:v96 home:v27];

      goto LABEL_83;
    case 0x1EuLL:
      objc_super v8 = [v4 valueForParameter:HFURLComponentsUserDetails];
      v28 = +[HFHomeKitDispatcher sharedDispatcher];
      v27 = [v28 home];

      if ([(HOAppNavigationURLHandler *)v8 length])
      {
        objc_initWeak((id *)buf, self);
        id v29 = +[HFHomeKitDispatcher sharedDispatcher];
        v30 = [v29 userFutureWithUniqueIdentifierStr:v8];
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_10002572C;
        v126[3] = &unk_1000C27D0;
        objc_copyWeak(&v128, (id *)buf);
        id v31 = v8;
        v127 = v31;
        v32 = [v30 flatMap:v126];
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_100025858;
        v122[3] = &unk_1000C27F8;
        objc_copyWeak(&v125, (id *)buf);
        objc_super v8 = v31;
        v123 = v8;
        v27 = v27;
        v124 = v27;
        id v9 = [v32 recover:v122];

        objc_destroyWeak(&v125);
        objc_destroyWeak(&v128);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v88 = HFLogForCategory();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v136 = self;
          __int16 v137 = 2080;
          v138 = "-[HOAppNavigationURLHandler _openURLComponents:]";
          __int16 v139 = 2112;
          v140 = v8;
          __int16 v141 = 2112;
          v142 = v27;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "(%@:%s) Couldn't find userUniqueIdentifier %@. Showing current home setting %@.", buf, 0x2Au);
        }

        v89 = [(HOAppNavigationURLHandler *)self navigator];
        id v9 = [v89 showHomeSettingsForHome:v27];
      }
      goto LABEL_83;
    default:
      v48 = [v4 valueForParameter:HFURLComponentsFromHUIS];
      unsigned __int8 v49 = [v48 BOOLValue];

      if (v6 == (id)29 || v6 == (id)20) {
        char v51 = 1;
      }
      else {
        char v51 = v49;
      }
      objc_super v8 = +[NAFuture futureWithNoResult];
      if ((v49 & 1) == 0 && v6 != (id)20 && v6 != (id)29)
      {
        uint64_t v52 = +[NAFuture futureWithBlock:&stru_1000C2838];

        objc_super v8 = (HOAppNavigationURLHandler *)v52;
      }
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_100025A48;
      v117[3] = &unk_1000C2958;
      char v121 = v51;
      v119 = self;
      id v120 = v6;
      v118 = (HOAppNavigationURLHandler *)v4;
      id v9 = [(HOAppNavigationURLHandler *)v8 flatMap:v117];

      v5 = v118;
      goto LABEL_84;
  }
}

- (id)openApplicationURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)HFURLComponents) initWithURL:v4];
  if ([v5 destination])
  {
    id v6 = [(HOAppNavigationURLHandler *)self _openURLComponents:v5];
  }
  else
  {
    unsigned int v7 = +[NSError errorWithDomain:NSURLErrorDomain code:-1002 userInfo:&__NSDictionary0__struct];
    id v6 = objc_alloc_init((Class)NAFuture);
    if (+[HFUtilities isAMac])
    {
      objc_super v8 = +[UIApplication sharedApplication];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100027714;
      v11[3] = &unk_1000C2980;
      id v12 = v4;
      id v13 = v6;
      id v14 = v7;
      [v8 openURL:v12 withCompletionHandler:v11];
    }
    else
    {
      id v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler failed to open application URL: %@.", buf, 0xCu);
      }

      [v6 finishWithError:v7];
    }
  }

  return v6;
}

- (id)notificationCenter:(id)a3 presentNotificationWithObjectURL:(id)a4
{
  return [(HOAppNavigationURLHandler *)self openURL:a4];
}

- (void)notificationCenter:(id)a3 presentCustomSettingsForNotificationWithObjectURL:(id)a4
{
  id v5 = a4;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  unsigned int v7 = [v6 homeFuture];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000278E0;
  v10[3] = &unk_1000C29D0;
  id v11 = v5;
  id v12 = self;
  id v8 = v5;
  id v9 = [v7 addSuccessBlock:v10];
}

- (unint64_t)lockOnboardingTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"all"])
  {
    if ([v3 caseInsensitiveCompare:@"walletkey"])
    {
      if ([v3 caseInsensitiveCompare:@"pincode"]) {
        unint64_t v4 = 0;
      }
      else {
        unint64_t v4 = 3;
      }
    }
    else
    {
      unint64_t v4 = 2;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (id)_startDateForURLComponents:(id)a3
{
  return _[a3 dateForParameter:HFURLComponentsStartDate];
}

- (id)_endDateForURLComponents:(id)a3
{
  return _[a3 dateForParameter:HFURLComponentsEndDate];
}

- (HOAppNavigator)navigator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigator);

  return (HOAppNavigator *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end