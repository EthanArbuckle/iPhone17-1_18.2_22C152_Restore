@interface FRCoreAssembly
- (FCCloudContext)cloudContext;
- (FCConfigurationManager)configurationManager;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCOfflineModeMonitor)offlineModeMonitor;
- (FRCoreAssembly)initWithCloudContext:(id)a3 configurationManager:(id)a4 appActivityMonitor:(id)a5 networkBehaviorMonitor:(id)a6 offlineModeMonitor:(id)a7;
- (NUAppActivityMonitor)appActivityMonitor;
- (void)loadInRegistry:(id)a3;
@end

@implementation FRCoreAssembly

- (FRCoreAssembly)initWithCloudContext:(id)a3 configurationManager:(id)a4 appActivityMonitor:(id)a5 networkBehaviorMonitor:(id)a6 offlineModeMonitor:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FRCoreAssembly;
  v17 = [(FRCoreAssembly *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cloudContext, a3);
    objc_storeStrong((id *)&v18->_configurationManager, a4);
    objc_storeStrong((id *)&v18->_appActivityMonitor, a5);
    objc_storeStrong((id *)&v18->_networkBehaviorMonitor, a6);
    objc_storeStrong((id *)&v18->_offlineModeMonitor, a7);
  }

  return v18;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = [(FRCoreAssembly *)self cloudContext];
  v6 = [v4 publicContainer];
  uint64_t v7 = objc_opt_class();
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_100018FEC;
  v142[3] = &unk_1000C6430;
  id v143 = v5;
  id v8 = v5;
  v9 = [v6 registerClass:v7 factory:v142];
  id v10 = [v9 inScope:2];

  v11 = [v4 publicContainer];
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472;
  v141[2] = sub_100018FE4;
  v141[3] = &unk_1000C6458;
  v141[4] = self;
  v12 = [v11 registerClass:objc_opt_class() factory:v141];
  id v13 = [v12 inScope:2];

  id v14 = [v4 publicContainer];
  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472;
  v140[2] = sub_10002F244;
  v140[3] = &unk_1000C6458;
  v140[4] = self;
  id v15 = [v14 registerClass:objc_opt_class() factory:v140];
  id v16 = [v15 inScope:2];

  v17 = [v4 publicContainer];
  v18 = [v17 registerClass:objc_opt_class() factory:&stru_1000C6498];
  id v19 = [v18 inScope:2];

  id v20 = [v4 publicContainer];
  id v21 = [v20 registerProtocol:&OBJC_PROTOCOL___FCAppActivityMonitor factory:&stru_1000C64D8];

  v22 = [v4 publicContainer];
  id v23 = [v22 registerProtocol:&OBJC_PROTOCOL___FCBackgroundTaskable factory:&stru_1000C6518];

  v24 = [v4 publicContainer];
  id v25 = [v24 registerProtocol:&OBJC_PROTOCOL___SXAppStateMonitor factory:&stru_1000C6558];

  v26 = [v4 publicContainer];
  v27 = [v26 registerClass:objc_opt_class() factory:&stru_1000C6598];
  id v28 = [v27 inScope:2];

  v29 = [v4 publicContainer];
  v30 = [v29 registerClass:objc_opt_class() factory:&stru_1000C65D8];
  id v31 = [v30 inScope:2];

  v32 = [v4 publicContainer];
  v33 = [v32 registerClass:objc_opt_class() factory:&stru_1000C6618];
  id v34 = [v33 inScope:2];

  v35 = [v4 publicContainer];
  v36 = [v35 registerClass:objc_opt_class() factory:&stru_1000C6658];
  id v37 = [v36 inScope:2];

  v38 = [v4 publicContainer];
  v39 = [v38 registerClass:objc_opt_class() factory:&stru_1000C6698];
  id v40 = [v39 inScope:2];

  v41 = [v4 publicContainer];
  v42 = [v41 registerClass:objc_opt_class() factory:&stru_1000C66D8];
  id v43 = [v42 inScope:2];

  v44 = [v4 publicContainer];
  v45 = [v44 registerClass:objc_opt_class() factory:&stru_1000C6718];
  id v46 = [v45 inScope:2];

  v47 = [v4 publicContainer];
  v48 = [v47 registerClass:objc_opt_class() factory:&stru_1000C6758];
  id v49 = [v48 inScope:2];

  v50 = [v4 publicContainer];
  v51 = [v50 registerProtocol:&OBJC_PROTOCOL___FCPurchaseProviderType factory:&stru_1000C6798];
  id v52 = [v51 inScope:2];

  v53 = [v4 publicContainer];
  v54 = [v53 registerProtocol:&OBJC_PROTOCOL___FCPurchaseManagerType factory:&stru_1000C67D8];
  id v55 = [v54 inScope:2];

  v56 = [v4 publicContainer];
  v57 = [v56 registerClass:objc_opt_class() factory:&stru_1000C6818];
  id v58 = [v57 inScope:2];

  v59 = [v4 publicContainer];
  v60 = [v59 registerProtocol:&OBJC_PROTOCOL___FCPPTContext factory:&stru_1000C6858];
  id v61 = [v60 inScope:2];

  v62 = [v4 publicContainer];
  id v63 = [v62 registerProtocol:&OBJC_PROTOCOL___FCPaidAccessCheckerType factory:&stru_1000C6898];

  v64 = [v4 publicContainer];
  v65 = [v64 registerClass:objc_opt_class() factory:&stru_1000C68D8];
  id v66 = [v65 inScope:2];

  v67 = [v4 publicContainer];
  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472;
  v139[2] = sub_100018FDC;
  v139[3] = &unk_1000C6900;
  v139[4] = self;
  v68 = [v67 registerProtocol:&OBJC_PROTOCOL___FCMagazinesConfigurationManager factory:v139];
  id v69 = [v68 inScope:2];

  v70 = [v4 publicContainer];
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_10002F25C;
  v138[3] = &unk_1000C6928;
  v138[4] = self;
  v71 = [v70 registerProtocol:&OBJC_PROTOCOL___FCTodayFeedConfigurationManager factory:v138];
  id v72 = [v71 inScope:2];

  v73 = [v4 publicContainer];
  v137[0] = _NSConcreteStackBlock;
  v137[1] = 3221225472;
  v137[2] = sub_100018FD4;
  v137[3] = &unk_1000C6950;
  v137[4] = self;
  v74 = [v73 registerProtocol:&OBJC_PROTOCOL___FCAudioFeedConfigManager factory:v137];
  id v75 = [v74 inScope:2];

  v76 = [v4 publicContainer];
  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472;
  v136[2] = sub_100018FCC;
  v136[3] = &unk_1000C6978;
  v136[4] = self;
  v77 = [v76 registerClass:objc_opt_class() factory:v136];
  id v78 = [v77 inScope:2];

  v79 = [v4 publicContainer];
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472;
  v135[2] = sub_100018FC4;
  v135[3] = &unk_1000C6978;
  v135[4] = self;
  v80 = [v79 registerProtocol:&OBJC_PROTOCOL___FCCoreConfigurationManager factory:v135];
  id v81 = [v80 inScope:2];

  v82 = [v4 publicContainer];
  v83 = [v82 registerProtocol:&OBJC_PROTOCOL___FCTranslationManager factory:&stru_1000C69B8];
  id v84 = [v83 inScope:2];

  v85 = [v4 publicContainer];
  v86 = [v85 registerProtocol:&OBJC_PROTOCOL___FCLocalAreasManager factory:&stru_1000C69F8];
  id v87 = [v86 inScope:2];

  v88 = [v4 publicContainer];
  v89 = [v88 registerClass:objc_opt_class() factory:&stru_1000C6A38];
  id v90 = [v89 inScope:2];

  v91 = [v4 publicContainer];
  v92 = [v91 registerClass:objc_opt_class() factory:&stru_1000C6A78];
  id v93 = [v92 inScope:2];

  v94 = [v4 publicContainer];
  id v95 = [v94 registerClass:objc_opt_class() factory:&stru_1000C6AB8];

  v96 = [v4 publicContainer];
  v97 = [v96 registerProtocol:&OBJC_PROTOCOL___FCClearableReadingHistory factory:&stru_1000C6AF8];
  id v98 = [v97 inScope:2];

  v99 = [v4 publicContainer];
  id v100 = [v99 registerProtocol:&OBJC_PROTOCOL___FCArticleDownloadServiceType factory:&stru_1000C6B38];

  v101 = [v4 publicContainer];
  id v102 = [v101 registerProtocol:&OBJC_PROTOCOL___FCIssueDownloadServiceType factory:&stru_1000C6B78];

  v103 = [v4 publicContainer];
  id v104 = [v103 registerProtocol:&OBJC_PROTOCOL___FCPuzzleDownloadServiceType factory:&stru_1000C6BB8];

  v105 = [v4 publicContainer];
  v106 = [v105 registerProtocol:&OBJC_PROTOCOL___FCAVAssetPrewarming factory:&stru_1000C6BF8];
  id v107 = [v106 inScope:2];

  v108 = [v4 publicContainer];
  v109 = [v108 registerProtocol:&OBJC_PROTOCOL___FCAVAssetFactoryType factory:&stru_1000C6C38];
  id v110 = [v109 inScope:2];

  v111 = [v4 publicContainer];
  v112 = [v111 registerProtocol:&OBJC_PROTOCOL___TSSharedImageCacheType factory:&stru_1000C6C78];
  id v113 = [v112 inScope:2];

  v114 = [v4 publicContainer];
  v115 = [v114 registerProtocol:&OBJC_PROTOCOL___TSSharedImageCacheType name:@"Format" factory:&stru_1000C6C98];
  id v116 = [v115 inScope:2];

  v117 = [v4 publicContainer];
  id v118 = [v117 registerProtocol:&OBJC_PROTOCOL___FCReceiptRefresherType factory:&stru_1000C6CD8];

  v119 = [v4 publicContainer];
  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472;
  v134[2] = sub_100018F24;
  v134[3] = &unk_1000C6D00;
  v134[4] = self;
  v120 = [v119 registerProtocol:&OBJC_PROTOCOL___NUAppActivityMonitor factory:v134];
  id v121 = [v120 inScope:2];

  v122 = [v4 publicContainer];
  v123 = [v122 registerClass:objc_opt_class() factory:&stru_1000C6D40];
  id v124 = [v123 inScope:2];

  v125 = [v4 publicContainer];
  v126 = [v125 registerProtocol:&OBJC_PROTOCOL___FCNotificationPoolServiceType factory:&stru_1000C6D60];
  id v127 = [v126 inScope:2];

  v128 = [v4 privateContainer];
  v129 = [v128 registerClass:objc_opt_class() factory:&stru_1000C6DA0];
  id v130 = [v129 inScope:2];

  v131 = [v4 privateContainer];

  v133[0] = _NSConcreteStackBlock;
  v133[1] = 3221225472;
  v133[2] = sub_10002F37C;
  v133[3] = &unk_1000C6458;
  v133[4] = self;
  id v132 = [v131 registerProtocol:&OBJC_PROTOCOL___FCContentVariantProviding factory:v133];
}

- (FCConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NUAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (FCOfflineModeMonitor)offlineModeMonitor
{
  return self->_offlineModeMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineModeMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end