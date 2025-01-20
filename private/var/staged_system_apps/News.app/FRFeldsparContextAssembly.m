@interface FRFeldsparContextAssembly
- (FRFeldsparContext)feldsparContext;
- (FRFeldsparContextAssembly)initWithContext:(id)a3 privateDataUpdateCoordinator:(id)a4;
- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator;
- (void)loadInRegistry:(id)a3;
- (void)setPrivateDataUpdateCoordinator:(id)a3;
@end

@implementation FRFeldsparContextAssembly

- (FRFeldsparContextAssembly)initWithContext:(id)a3 privateDataUpdateCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FRFeldsparContextAssembly;
  v9 = [(FRFeldsparContextAssembly *)&v11 init];
  if (v9)
  {
    if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000781D4();
      if (!v8)
      {
LABEL_5:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000780F4();
        }
      }
    }
    else if (!v8)
    {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v9->_privateDataUpdateCoordinator, a4);
  }

  return v9;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = [(FRFeldsparContextAssembly *)self feldsparContext];
  v6 = [v4 publicContainer];
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100054910;
  v100[3] = &unk_1000C9088;
  id v7 = v5;
  id v101 = v7;
  id v8 = [v6 registerProtocol:&OBJC_PROTOCOL___FRFeldsparContext factory:v100];

  v9 = [v4 publicContainer];
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_100054918;
  v98[3] = &unk_1000C90B0;
  id v10 = v7;
  id v99 = v10;
  objc_super v11 = [v9 registerProtocol:&OBJC_PROTOCOL___FCFavoritesPersonalizer factory:v98];
  id v12 = [v11 inScope:2];

  v13 = [v4 publicContainer];
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_100018CBC;
  v96[3] = &unk_1000C90D8;
  id v14 = v10;
  id v97 = v14;
  v15 = [v13 registerProtocol:&OBJC_PROTOCOL___FCAutoFavoritesPreparer name:@"legacy" factory:v96];
  id v16 = [v15 inScope:2];

  v17 = [v4 publicContainer];
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100018CB4;
  v94[3] = &unk_1000C9100;
  id v18 = v14;
  id v95 = v18;
  v19 = [v17 registerProtocol:&OBJC_PROTOCOL___FCPersonalizationAllowlistProvider factory:v94];
  id v20 = [v19 inScope:2];

  v21 = [v4 publicContainer];
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_100018CAC;
  v92[3] = &unk_1000C9128;
  id v22 = v18;
  id v93 = v22;
  v23 = [v21 registerProtocol:&OBJC_PROTOCOL___FCPersonalizationBundleIDMappingProvider factory:v92];
  id v24 = [v23 inScope:2];

  v25 = [v4 publicContainer];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100018CA4;
  v90[3] = &unk_1000C9150;
  id v26 = v22;
  id v91 = v26;
  v27 = [v25 registerProtocol:&OBJC_PROTOCOL___FCPersonalizationURLMappingProvider factory:v90];
  id v28 = [v27 inScope:2];

  v29 = [v4 publicContainer];
  uint64_t v30 = objc_opt_class();
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100018C9C;
  v88[3] = &unk_1000C9178;
  id v31 = v26;
  id v89 = v31;
  v32 = [v29 registerClass:v30 factory:v88];
  id v33 = [v32 inScope:3];

  v34 = [v4 publicContainer];
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100054920;
  v86[3] = &unk_1000C91A0;
  id v35 = v31;
  id v87 = v35;
  id v36 = [v34 registerProtocol:&OBJC_PROTOCOL___TSAppMonitorManagerType factory:v86];

  v37 = [v4 publicContainer];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100054928;
  v84[3] = &unk_1000C91C8;
  id v38 = v35;
  id v85 = v38;
  id v39 = [v37 registerProtocol:&OBJC_PROTOCOL___NUSpotlightManager factory:v84];

  v40 = [v4 publicContainer];
  uint64_t v41 = objc_opt_class();
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100018CCC;
  v82[3] = &unk_1000C91F0;
  id v42 = v38;
  id v83 = v42;
  id v43 = [v40 registerClass:v41 factory:v82];

  v44 = [v4 publicContainer];
  uint64_t v45 = objc_opt_class();
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100018990;
  v80[3] = &unk_1000C9218;
  id v46 = v42;
  id v81 = v46;
  id v47 = [v44 registerClass:v45 factory:v80];

  v48 = [v4 publicContainer];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100018CC4;
  v78[3] = &unk_1000C9240;
  id v49 = v46;
  id v79 = v49;
  id v50 = [v48 registerProtocol:&OBJC_PROTOCOL___NYSessionAccessing factory:v78];

  v51 = [v4 publicContainer];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100054930;
  v76[3] = &unk_1000C9268;
  id v77 = v49;
  id v52 = v49;
  id v53 = [v51 registerProtocol:&OBJC_PROTOCOL___TSPrefetchedArticlesServiceType factory:v76];

  v54 = [v52 cloudContext];
  v55 = [v4 publicContainer];
  uint64_t v56 = objc_opt_class();
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10000D380;
  v74[3] = &unk_1000C9290;
  id v57 = v54;
  id v75 = v57;
  v58 = [v55 registerClass:v56 factory:v74];
  id v59 = [v58 inScope:2];

  v60 = [v4 privateContainer];
  id v61 = [v60 registerProtocol:&OBJC_PROTOCOL___FRLimitedPersonalizationDataGeneratorType factory:&stru_1000C92D0];

  v62 = [v4 publicContainer];

  uint64_t v63 = objc_opt_class();
  v68 = _NSConcreteStackBlock;
  uint64_t v69 = 3221225472;
  v70 = sub_10000BA48;
  v71 = &unk_1000C92F8;
  id v72 = v57;
  v73 = self;
  id v64 = v57;
  v65 = [v62 registerClass:v63 factory:&v68];
  v66 = [v65 inScope:2 v68, v69, v70, v71];
  id v67 = [v66 withConfiguration:&stru_1000C9338];
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);

  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end