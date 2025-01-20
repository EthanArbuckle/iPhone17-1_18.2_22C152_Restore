@interface STContentPrivacyMediaRestrictionsDetailController
- (STContentPrivacyMediaRestrictionsDetailController)initWithRegionRatings:(id)a3;
- (STRegionRatings)regionRatings;
- (id)_getSpecifierValueForItem:(id)a3 viewModel:(id)a4 restrictionValues:(id)a5;
- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4;
- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4 titlesByValue:(id)a5 sortByTitle:(BOOL)a6;
- (id)defaultLinkListSpecifierWithItem:(id)a3 titlesByValue:(id)a4 sortByTitle:(BOOL)a5;
- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4;
- (id)getItemSpecifierValue:(id)a3;
- (id)linkListSpecifierForTVAndMoviesWithConfiguration:(id)a3 key:(id)a4 footerKey:(id)a5 titlesByValue:(id)a6;
- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5;
- (id)specifiers;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4;
- (void)setRegionRatings:(id)a3;
- (void)showWebFilterRestrictions:(id)a3;
@end

@implementation STContentPrivacyMediaRestrictionsDetailController

- (STContentPrivacyMediaRestrictionsDetailController)initWithRegionRatings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
  v6 = [(STPINListViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_regionRatings, a3);
  }

  return v7;
}

- (id)specifiers
{
  v98[2] = *MEMORY[0x263EF8340];
  v3 = [(STPINListViewController *)self coordinator];
  v4 = [v3 contentPrivacyCoordinator];
  id v5 = [v4 viewModel];
  int v6 = [v5 isLoaded];

  if (v6)
  {
    v7 = objc_opt_new();
    v8 = [(STContentPrivacyMediaRestrictionsDetailController *)self regionRatings];
    if (_os_feature_enabled_impl()) {
      objc_super v9 = @"AllowedMediaServicesLabel";
    }
    else {
      objc_super v9 = @"AllowedContentLabel";
    }
    v10 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v11 = +[STScreenTimeSettingsUIBundle bundle];
    v82 = [v11 localizedStringForKey:v9 value:&stru_26D9391A8 table:v10];
    v12 = -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:");
    [v7 addObject:v12];

    uint64_t v13 = [v8 preferredRegion];
    v87 = [v8 localizedMovieRatingsForRegion:v13];
    v86 = [v8 localizedTVRatingsForRegion:v13];
    v83 = v8;
    v81 = (void *)v13;
    v85 = [v8 localizedAppRatingsForRegion:v13];
    v97[0] = MEMORY[0x263EFFA80];
    v14 = [v11 localizedStringForKey:@"CleanLabel" value:&stru_26D9391A8 table:v10];
    v98[0] = v14;
    uint64_t v15 = MEMORY[0x263EFFA88];
    v97[1] = MEMORY[0x263EFFA88];
    v16 = [v11 localizedStringForKey:@"ExplicitLabel" value:&stru_26D9391A8 table:v10];
    v98[1] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];

    uint64_t v18 = MEMORY[0x263EFFA80];
    v95[0] = MEMORY[0x263EFFA80];
    v19 = [v11 localizedStringForKey:@"CleanLabelBooks" value:&stru_26D9391A8 table:v10];
    v95[1] = v15;
    v96[0] = v19;
    v20 = [v11 localizedStringForKey:@"ExplicitLabel" value:&stru_26D9391A8 table:v10];
    v96[1] = v20;
    v84 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];

    v93[0] = v18;
    v21 = [v11 localizedStringForKey:@"OffLabel" value:&stru_26D9391A8 table:v10];
    v94[0] = v21;
    v93[1] = MEMORY[0x263EFFA88];
    v22 = [v11 localizedStringForKey:@"OnLabel" value:&stru_26D9391A8 table:v10];
    v94[1] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];

    v80 = (void *)v17;
    v24 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.ratings" key:@"allowExplicitContent" titlesByValue:v17 sortByTitle:0];
    [v7 addObject:v24];

    v25 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.music" key:@"allowMusicVideos" titlesByValue:v23 sortByTitle:0];
    [v7 addObject:v25];

    v79 = (void *)v23;
    v26 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.music" key:@"allowMusicArtistActivity" titlesByValue:v23 sortByTitle:0];
    [v7 addObject:v26];

    v27 = [(STPINListViewController *)self coordinator];
    v28 = [v27 viewModel];
    v29 = [v28 me];
    uint64_t v30 = [v29 type];

    if (v30 == 7)
    {
      v31 = [v7 lastObject];
      [v31 setObject:@"1" forKeyedSubscript:0x26D93E7C8];
    }
    v32 = [(STContentPrivacyMediaRestrictionsDetailController *)self linkListSpecifierForTVAndMoviesWithConfiguration:@"system.ratings" key:@"ratingMovies" footerKey:@"allowShowingUndownloadedMovies" titlesByValue:v87];
    [v7 addObject:v32];

    v33 = [(STContentPrivacyMediaRestrictionsDetailController *)self linkListSpecifierForTVAndMoviesWithConfiguration:@"system.ratings" key:@"ratingTVShows" footerKey:@"allowShowingUndownloadedTV" titlesByValue:v86];
    [v7 addObject:v33];

    v34 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"media.settings" key:@"allowBookstoreErotica" titlesByValue:v84 sortByTitle:0];
    [v7 addObject:v34];

    v35 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.ratings" key:@"ratingApps" titlesByValue:v85 sortByTitle:0];
    v36 = [v35 titleDictionary];
    v37 = [v36 allKeys];
    int v38 = [v37 containsObject:&unk_26D966EF8];

    if (v38)
    {
      v39 = [v11 localizedStringForKey:@"UnratedExplanationFooter" value:&stru_26D9391A8 table:v10];
      [v35 setObject:v39 forKeyedSubscript:0x26D93E828];
    }
    v78 = v35;
    [v7 addObject:v35];
    v40 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowAppClips"];
    [v7 addObject:v40];

    v91[0] = &unk_26D966F10;
    v41 = [v11 localizedStringForKey:@"UnrestrictedAccessSpecifierName" value:&stru_26D9391A8 table:v10];
    v92[0] = v41;
    v91[1] = &unk_26D966F28;
    v42 = [v11 localizedStringForKey:@"LimitAdultWebsitesSpecifierName" value:&stru_26D9391A8 table:v10];
    v92[1] = v42;
    v91[2] = &unk_26D966F40;
    v43 = [v11 localizedStringForKey:@"AADC_AllowedWebsitesSpecifierName" value:&stru_26D9391A8 table:v10];
    v92[2] = v43;
    uint64_t v44 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];

    v76 = [v11 localizedStringForKey:@"WebContentSpecifierName" value:&stru_26D9391A8 table:v10];
    v45 = -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:");
    [v7 addObject:v45];

    v77 = (void *)v44;
    v46 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CF68 titlesByValue:v44 sortByTitle:0];
    [v7 addObject:v46];

    v47 = [v7 lastObject];
    [v47 setControllerLoadAction:sel_showWebFilterRestrictions_];

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v48 = [v11 localizedStringForKey:@"SiriLabel" value:&stru_26D9391A8 table:v10];
      v49 = [(STContentPrivacyMediaRestrictionsDetailController *)self radioGroupSpecifierWithName:v48 footerText:0 item:0];
      [v7 addObject:v49];

      v50 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"allowAssistantUserGeneratedContent"];
      [v7 addObject:v50];

      v51 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"forceAssistantProfanityFilter"];
      [v7 addObject:v51];
    }
    v75 = [v11 localizedStringForKey:@"GameCenterLabel" value:&stru_26D9391A8 table:v10];
    v52 = [(STContentPrivacyMediaRestrictionsDetailController *)self radioGroupSpecifierWithName:v75 footerText:0 item:0];
    [v7 addObject:v52];

    v89[0] = &unk_26D966F58;
    v53 = [v11 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v10];
    v90[0] = v53;
    v89[1] = &unk_26D966F70;
    v54 = [v11 localizedStringForKey:@"AllowWithFriendsOnlySpecifierName" value:&stru_26D9391A8 table:v10];
    v90[1] = v54;
    v89[2] = &unk_26D966F88;
    v55 = [v11 localizedStringForKey:@"AllowWithEveryoneSpecifierName" value:&stru_26D9391A8 table:v10];
    v90[2] = v55;
    v56 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];

    v57 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:0x26D93CF28 titlesByValue:v56 sortByTitle:0];
    [v7 addObject:v57];

    v58 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:@"allowAddingGameCenterFriends"];
    [v7 addObject:v58];

    v59 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:@"allowGameCenterFriendsSharingModification"];
    v60 = [v11 localizedStringForKey:@"ConnectWithFriendsExplanatoryFooterText" value:&stru_26D9391A8 table:v10];
    [v59 setObject:v60 forKeyedSubscript:0x26D93E828];

    v61 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v62 = [v11 localizedStringForKey:@"ConnectWithFriendsContinuedExplanatoryText" value:&stru_26D9391A8 table:v10];
    [v61 setObject:v62 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v88 = v61;
    v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
    [v59 setObject:v63 forKeyedSubscript:0x26D93E7E8];

    [v7 addObject:v59];
    v64 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.camera" key:@"allowScreenRecording"];
    [v7 addObject:v64];

    v65 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:0x26D93CF08];
    [v7 addObject:v65];

    v66 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:@"allowGameCenterPrivateMessaging"];
    v67 = [v11 localizedStringForKey:@"PrivateMessagingFooter" value:&stru_26D9391A8 table:v10];
    [v66 setObject:v67 forKeyedSubscript:*MEMORY[0x263F60280]];

    [v7 addObject:v66];
    v68 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:@"allowGameCenterProfilePrivacyModification"];
    [v7 addObject:v68];

    v69 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithConfiguration:@"system.gamecenter" key:@"allowGameCenterProfileModification"];
    [v7 addObject:v69];

    v70 = (objc_class *)[v7 copy];
    uint64_t v71 = (int)*MEMORY[0x263F5FDB8];
    v72 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71) = v70;

    id v73 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v71);
  }
  else
  {
    id v73 = (id)MEMORY[0x263EFFA68];
  }

  return v73;
}

- (void)showWebFilterRestrictions:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  id v5 = [(STPINListViewController *)self coordinator];
  [v7 setCoordinator:v5];

  [v7 setParentController:self];
  int v6 = [(STContentPrivacyMediaRestrictionsDetailController *)self rootController];
  [v7 setRootController:v6];

  [v7 setSpecifier:v4];
  [(STContentPrivacyMediaRestrictionsDetailController *)self showController:v7 animate:1];
}

- (id)getItemSpecifierValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:0x26D93CEC8];
  int v6 = [(STPINListViewController *)self coordinator];
  id v7 = [v6 contentPrivacyCoordinator];
  v8 = [v7 viewModel];

  objc_super v9 = [v4 values];

  v10 = [(STContentPrivacyMediaRestrictionsDetailController *)self _getSpecifierValueForItem:v5 viewModel:v8 restrictionValues:v9];

  return v10;
}

- (id)_getSpecifierValueForItem:(id)a3 viewModel:(id)a4 restrictionValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 valuesByRestriction];
  v12 = [v11 objectForKeyedSubscript:v8];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v9 defaultValueForRestriction:v8];
  }
  uint64_t v15 = v14;

  if ([v8 restrictionType]
    && ([v8 rmConfiguration],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:@"system.ratings"],
        v16,
        v17))
  {
    uint64_t v18 = [(STContentPrivacyMediaRestrictionsDetailController *)self regionRatings];
    v19 = [v8 payloadKey];
    id v20 = [v18 getClosestRestrictionMatch:v15 within:v10 forPayloadKey:v19];
  }
  else
  {
    id v20 = v15;
  }

  return v20;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:0x26D93CEC8];
  id v9 = [(STPINListViewController *)self coordinator];
  id v10 = [v9 contentPrivacyCoordinator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__STContentPrivacyMediaRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke;
  v19[3] = &unk_264767160;
  v19[4] = self;
  id v11 = v6;
  id v20 = v11;
  [v10 saveRestrictionValue:v7 forItem:v8 completionHandler:v19];

  if (_os_feature_enabled_impl())
  {
    v12 = [MEMORY[0x263F67088] sharedController];
    uint64_t v13 = [MEMORY[0x263F67088] sharedController];
    id v14 = [v13 viewContext];
    id v18 = 0;
    char v15 = [v12 saveContext:v14 error:&v18];
    id v16 = v18;

    if ((v15 & 1) == 0)
    {
      int v17 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[STContentPrivacyMediaRestrictionsDetailController setItemSpecifierValue:specifier:]((uint64_t)v16, v17);
      }
    }
  }
}

uint64_t __85__STContentPrivacyMediaRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifiers withObject:*(void *)(a1 + 40) waitUntilDone:0];
}

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 contentPrivacyCoordinator];
  [v4 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"MediaRestrictionsViewModelLoadedContext"];

  v5.receiver = self;
  v5.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
  [(STListViewController *)&v5 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];

  if (v5 != v4)
  {
    id v6 = [(STPINListViewController *)self coordinator];
    id v7 = [v6 contentPrivacyCoordinator];
    [v7 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"MediaRestrictionsViewModelLoadedContext"];

    v10.receiver = self;
    v10.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
    [(STPINListViewController *)&v10 setCoordinator:v4];
    id v8 = [(STPINListViewController *)self coordinator];
    id v9 = [v8 contentPrivacyCoordinator];
    [v9 addObserver:self forKeyPath:@"viewModel.isLoaded" options:0 context:@"MediaRestrictionsViewModelLoadedContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"MediaRestrictionsViewModelLoadedContext")
  {
    id v7 = [(STPINListViewController *)self coordinator];
    id v8 = [v7 contentPrivacyCoordinator];
    id v9 = [v8 viewModel];
    int v10 = [v9 isLoaded];

    if (v10)
    {
      [(STContentPrivacyMediaRestrictionsDetailController *)self reloadSpecifiers];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)defaultLinkListSpecifierWithItem:(id)a3 titlesByValue:(id)a4 sortByTitle:(BOOL)a5
{
  BOOL v5 = a5;
  v38[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v13 = [v9 uiLabel];
  v34 = v12;
  uint64_t v14 = [v12 localizedStringForKey:v13 value:&stru_26D9391A8 table:v11];

  char v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:objc_opt_class() cell:2 edit:0];
  id v16 = [(STPINListViewController *)self coordinator];
  [v15 setObject:v16 forKeyedSubscript:0x26D940528];

  uint64_t v17 = [v9 restrictionType];
  v35 = (void *)v14;
  v36 = (void *)v11;
  if (v10)
  {
    if (v5)
    {
      id v18 = [v10 keysSortedByValueUsingSelector:sel_localizedCaseInsensitiveCompare_];
    }
    else
    {
      v24 = [v10 allKeys];
      id v18 = [v24 sortedArrayUsingSelector:sel_compare_];
    }
    uint64_t v23 = [v10 objectsForKeys:v18 notFoundMarker:&stru_26D9391A8];
LABEL_9:
    id v20 = v34;
    goto LABEL_10;
  }
  uint64_t v19 = v17;
  if (v17 != 1)
  {
    if (!v17)
    {
      id v20 = v34;
      v21 = [v34 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v11];
      v22 = [v34 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v11];
      v38[0] = v21;
      v38[1] = v22;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

      id v18 = &unk_26D967630;
      goto LABEL_10;
    }
    v33 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STContentPrivacyMediaRestrictionsDetailController.m", 265, @"Unimplemented type %d", v19);

    uint64_t v23 = 0;
    id v18 = 0;
    goto LABEL_9;
  }
  id v20 = v34;
  v31 = [v34 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v11];
  v32 = [v34 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v11];
  v37[0] = v31;
  v37[1] = v32;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];

  id v18 = &unk_26D967648;
LABEL_10:
  v25 = NSNumber;
  v26 = [(STPINListViewController *)self coordinator];
  v27 = [v26 contentPrivacyCoordinator];
  v28 = [v27 viewModel];
  v29 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v28, "shouldEnableRestriction:", v9));
  [v15 setObject:v29 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v15 setObject:v18 forKeyedSubscript:@"STMediaRestrictionRanksSpecifierKey"];
  [v15 setObject:v9 forKeyedSubscript:0x26D93CEC8];
  [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v15 setValues:v18 titles:v23];

  return v15;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4 titlesByValue:(id)a5 sortByTitle:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(STPINListViewController *)self coordinator];
  char v15 = [v14 contentPrivacyCoordinator];
  id v16 = [v15 viewModel];
  uint64_t v17 = [v16 visibleRestrictionWithConfiguration:v13 key:v12];

  if (!v17)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"STContentPrivacyMediaRestrictionsDetailController.m", 281, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  id v18 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithItem:v17 titlesByValue:v11 sortByTitle:v6];

  return v18;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(STPINListViewController *)self coordinator];
  id v10 = [v9 contentPrivacyCoordinator];
  id v11 = [v10 viewModel];
  id v12 = [v11 visibleRestrictionWithConfiguration:v8 key:v7];

  if (!v12)
  {
    char v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"STContentPrivacyMediaRestrictionsDetailController.m", 289, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  id v13 = [(STContentPrivacyMediaRestrictionsDetailController *)self defaultLinkListSpecifierWithItem:v12 titlesByValue:0 sortByTitle:0];

  return v13;
}

- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263F5FC40] groupSpecifierWithName:a3];
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:0x26D93CEC8];
  }

  return v9;
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  BOOL v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);

  id v7 = objc_opt_new();

  return v7;
}

- (id)linkListSpecifierForTVAndMoviesWithConfiguration:(id)a3 key:(id)a4 footerKey:(id)a5 titlesByValue:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v37 = a5;
  id v13 = a3;
  if (([v11 isEqualToString:@"ratingMovies"] & 1) == 0
    && ([v11 isEqualToString:@"ratingTVShows"] & 1) == 0)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"STContentPrivacyMediaRestrictionsDetailController.m", 314, @"Invalid parameter not satisfying: %@", @"[key isEqualToString:@\"ratingMovies\"] || [key isEqualToString:@\"ratingTVShows\"]" object file lineNumber description];
  }
  uint64_t v14 = [(STPINListViewController *)self coordinator];
  char v15 = [v14 contentPrivacyCoordinator];
  id v16 = [v15 viewModel];
  uint64_t v17 = [v16 visibleRestrictionWithConfiguration:v13 key:v11];

  v36 = v11;
  if (!v17)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"STContentPrivacyMediaRestrictionsDetailController.m", 318, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  id v18 = [v12 allKeys];
  uint64_t v19 = [v18 sortedArrayUsingSelector:sel_compare_];

  v35 = [v12 objectsForKeys:v19 notFoundMarker:&stru_26D9391A8];

  v34 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v20 = +[STScreenTimeSettingsUIBundle bundle];
  v21 = [v17 uiLabel];
  v22 = [v20 localizedStringForKey:v21 value:&stru_26D9391A8 table:v34];

  uint64_t v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v22 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:objc_opt_class() cell:2 edit:0];
  v24 = NSNumber;
  v25 = [(STPINListViewController *)self coordinator];
  v26 = [v25 contentPrivacyCoordinator];
  [v26 viewModel];
  v28 = v27 = self;
  v29 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v28, "shouldEnableRestriction:", v17));
  [v23 setObject:v29 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v23 setObject:v19 forKeyedSubscript:@"STMediaRestrictionRanksSpecifierKey"];
  [v23 setObject:v17 forKeyedSubscript:0x26D93CEC8];
  [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v23 setObject:v37 forKeyedSubscript:0x26D93E808];

  uint64_t v30 = [(STPINListViewController *)v27 coordinator];
  [v23 setObject:v30 forKeyedSubscript:0x26D940528];

  [v23 setValues:v19 titles:v35];

  return v23;
}

- (STRegionRatings)regionRatings
{
  return (STRegionRatings *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setRegionRatings:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setItemSpecifierValue:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to save ContentPrivacyMediaRestriction settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end