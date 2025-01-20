@interface MOSuggestionSheetSettingsController
+ (BOOL)fetchSiginificantLocationEnablementStatus;
+ (id)onboardingSettingsBundle;
+ (int)runCommand:(id)a3;
- (BOOL)_isAnySettingEnabled;
- (MOSuggestionSheetSettingsController)init;
- (id)_getLocalizedSpecifier:(id)a3;
- (id)_getStreamToggle:(id)a3;
- (id)specifiers;
- (void)_clearHistory:(id)a3;
- (void)_clearHistoryWarmup:(id)a3;
- (void)_setStreamToggle:(id)a3 withSpecifier:(id)a4;
- (void)_setStreamToggleWarmup:(id)a3 withSpecifier:(id)a4;
- (void)didTapSuggestionNotificationSettings:(id)a3;
- (void)didTapTurnOffAll:(id)a3;
- (void)didTapTurnOffAllWarmup:(id)a3;
- (void)didTapTurnOnAll:(id)a3;
- (void)didTapTurnOnJournalingSuggestion:(id)a3;
- (void)dismissDataAccessExplanationSheet:(id)a3;
- (void)fillSupportedApplicationsArray:(id)a3 andSupportedApplicationsWithDataAccess:(id)a4;
- (void)shouldDismissOnboarding;
- (void)showDataAccessExplanationSheet:(id)a3;
- (void)showPrivacyExplanationSheet:(id)a3;
@end

@implementation MOSuggestionSheetSettingsController

+ (id)onboardingSettingsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

+ (BOOL)fetchSiginificantLocationEnablementStatus
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v3 = [MEMORY[0x263F37F08] defaultManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__MOSuggestionSheetSettingsController_fetchSiginificantLocationEnablementStatus__block_invoke;
  v7[3] = &unk_265424FD8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  [v3 fetchRoutineStateWithHandler:v7];

  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v4, v5);
  LOBYTE(v3) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __80__MOSuggestionSheetSettingsController_fetchSiginificantLocationEnablementStatus__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && !a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (int)runCommand:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v5 = v4;
  v6 = (const char **)((char *)&v13 - ((8 * v4 + 23) & 0xFFFFFFFFFFFFFFF0));
  if ((unint64_t)(8 * v4 + 8) >= 0x200) {
    size_t v7 = 512;
  }
  else {
    size_t v7 = 8 * v4 + 8;
  }
  bzero((char *)&v13 - ((8 * v4 + 23) & 0xFFFFFFFFFFFFFFF0), v7);
  v6[v5] = 0;
  if ([v3 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v3 objectAtIndexedSubscript:v8];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        +[MOSuggestionSheetSettingsController runCommand:]();
      }
      id v10 = v9;
      v6[v8] = (const char *)[v10 cStringUsingEncoding:4];

      ++v8;
    }
    while (v8 < [v3 count]);
  }
  pid_t v14 = 0;
  int v11 = posix_spawn(&v14, *v6, 0, 0, (char *const *)v6, 0);
  int v13 = v11;
  if (!v11)
  {
    waitpid(v14, &v13, 0);
    int v11 = v13;
  }

  return v11;
}

- (MOSuggestionSheetSettingsController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOSuggestionSheetSettingsController;
  v2 = [(MOSuggestionSheetSettingsController *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    supportedApplications = v2->supportedApplications;
    v2->supportedApplications = 0;

    supportedApplicationsWithDataAccess = v3->supportedApplicationsWithDataAccess;
    v3->supportedApplicationsWithDataAccess = 0;

    v3->supportedApplicationsLoading = 0;
  }
  return v3;
}

- (id)specifiers
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  v123 = +[MOOnboardingManager sharedInstance];
  unint64_t v115 = [v123 onboardingFlowCompletionStatus] & 0xFFFFFFFFFFFFFFFELL;
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  uint64_t v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PRE_ONBOARDING_NO_APP_WARMUP" name:&stru_270625C18];
  uint64_t v6 = *MEMORY[0x263F60168];
  uint64_t v7 = MEMORY[0x263EFFA88];
  uint64_t v139 = *MEMORY[0x263F60168];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
  unint64_t v8 = [v4 localizedStringForKey:@"Journaling Suggestions are only available when there is a journaling App on iPhone" value:&stru_270625C18 table:0];
  v124 = v5;
  uint64_t v137 = *MEMORY[0x263F600F8];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = [v4 localizedStringForKey:@"Turn On Journaling Suggestions" value:&stru_270625C18 table:0];
  int v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:13 edit:0];

  uint64_t v148 = *MEMORY[0x263F5FEF8];
  objc_msgSend(v11, "setProperty:forKey:", v7);
  v125 = v11;
  [v11 setButtonAction:sel_didTapTurnOnJournalingSuggestion_];
  uint64_t v12 = [v4 localizedStringForKey:@"Turn Off All" value:&stru_270625C18 table:0];
  uint64_t v13 = [v4 localizedStringForKey:@"Turn On All" value:&stru_270625C18 table:0];
  pid_t v14 = (void *)MEMORY[0x263F5FC40];
  v121 = (void *)v13;
  v122 = (void *)v12;
  if ([(MOSuggestionSheetSettingsController *)self _isAnySettingEnabled]) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v13;
  }
  v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];
  BOOL v17 = [(MOSuggestionSheetSettingsController *)self _isAnySettingEnabled];
  v18 = &selRef_didTapTurnOffAllWarmup_;
  if (!v17) {
    v18 = &selRef_didTapTurnOnAll_;
  }
  v126 = v16;
  [v16 setButtonAction:*v18];
  v120 = [v4 localizedStringForKey:@"INCLUDE SUGGESTIONS FROM" value:&stru_270625C18 table:0];
  v19 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"INCLUDE_SUGGESTIONS_FROM_GROUP");
  [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v6];
  v119 = [MEMORY[0x263F5B8B0] bundleWithIdentifier:@"com.apple.onboarding.journal"];
  v20 = [v119 privacyFlow];
  v21 = [v20 localizedButtonTitle];

  v22 = [v4 localizedStringForKey:@"Suggestions use data from apps and services you turn on, but can appear in any app using suggestions. Data used for suggestions is private and stored on-device.", &stru_270625C18, 0 value table];
  v116 = [NSString stringWithFormat:@"%@ %@", v22, v21];
  objc_msgSend(v19, "setObject:forKeyedSubscript:");
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  uint64_t v113 = *MEMORY[0x263F600C0];
  objc_msgSend(v19, "setProperty:forKey:", v24);

  v117 = v22;
  NSUInteger v25 = [v22 length] + 1;
  v118 = v21;
  v159.length = [v21 length];
  v159.location = v25;
  v26 = NSStringFromRange(v159);
  uint64_t v112 = *MEMORY[0x263F600D0];
  objc_msgSend(v19, "setProperty:forKey:", v26);

  v27 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  uint64_t v111 = *MEMORY[0x263F600E0];
  objc_msgSend(v19, "setProperty:forKey:", v27);

  uint64_t v110 = *MEMORY[0x263F600C8];
  v135 = v19;
  objc_msgSend(v19, "setProperty:forKey:", @"showPrivacyExplanationSheet:");
  v28 = (void *)MEMORY[0x263F5FC40];
  v29 = [v4 localizedStringForKey:@"Activity" value:&stru_270625C18 table:0];
  v30 = objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, sel__setStreamToggleWarmup_withSpecifier_, 0);

  uint64_t v143 = *MEMORY[0x263F60138];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", @"Activity");
  Class v31 = NSClassFromString(&cfstr_Pssubtitleswit.isa);
  uint64_t v32 = *MEMORY[0x263F5FFE0];
  uint64_t v145 = *MEMORY[0x263F5FFE0];
  [v30 setObject:v31 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  v33 = [v4 localizedStringForKey:@"Your workouts and exercise" value:&stru_270625C18 table:0];
  uint64_t v141 = *MEMORY[0x263F602C8];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v33);

  v134 = v30;
  [v30 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  v34 = (void *)MEMORY[0x263F5FC40];
  v35 = [v4 localizedStringForKey:@"Media" value:&stru_270625C18 table:0];
  v36 = [v34 preferenceSpecifierNamed:v35 target:self set:sel__setStreamToggleWarmup_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v36 setObject:@"Media" forKeyedSubscript:v143];
  [v36 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v32];
  v37 = [v4 localizedStringForKey:@"Podcasts, music, videos, and more", &stru_270625C18, 0 value table];
  [v36 setObject:v37 forKeyedSubscript:v141];

  v133 = v36;
  [v36 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  v38 = (void *)MEMORY[0x263F5FC40];
  v39 = [v4 localizedStringForKey:@"Contacts" value:&stru_270625C18 table:0];
  v40 = [v38 preferenceSpecifierNamed:v39 target:self set:sel__setStreamToggleWarmup_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v40 setObject:@"Contacts" forKeyedSubscript:v143];
  [v40 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v41 = [v4 localizedStringForKey:@"People you message and call" value:&stru_270625C18 table:0];
  [v40 setObject:v41 forKeyedSubscript:v141];

  v132 = v40;
  [v40 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  v42 = (void *)MEMORY[0x263F5FC40];
  v43 = [v4 localizedStringForKey:@"Photos" value:&stru_270625C18 table:0];
  v44 = [v42 preferenceSpecifierNamed:v43 target:self set:sel__setStreamToggleWarmup_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v44 setObject:@"Photos" forKeyedSubscript:v143];
  [v44 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v45 = [v4 localizedStringForKey:@"Library, memories and people", &stru_270625C18, 0 value table];
  [v44 setObject:v45 forKeyedSubscript:v141];

  v131 = v44;
  [v44 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  BOOL v129 = +[MOSuggestionSheetSettingsController fetchSiginificantLocationEnablementStatus];
  v46 = (void *)MEMORY[0x263F5FC40];
  v47 = [v4 localizedStringForKey:@"Significant Locations" value:&stru_270625C18 table:0];
  v48 = [v46 preferenceSpecifierNamed:v47 target:self set:sel__setStreamToggleWarmup_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v48 setObject:@"Significant Locations" forKeyedSubscript:v143];
  [v48 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v49 = [v4 localizedStringForKey:@"Places where you spend time" value:&stru_270625C18 table:0];
  [v48 setObject:v49 forKeyedSubscript:v141];

  uint64_t v50 = MEMORY[0x263EFFA88];
  [v48 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  if (v129) {
    uint64_t v51 = v50;
  }
  else {
    uint64_t v51 = MEMORY[0x263EFFA80];
  }
  v114 = v48;
  [v48 setProperty:v51 forKey:*MEMORY[0x263F600A8]];
  v52 = (void *)MEMORY[0x263F5FC40];
  v53 = [v4 localizedStringForKey:@"State of Mind" value:&stru_270625C18 table:0];
  v54 = [v52 preferenceSpecifierNamed:v53 target:self set:sel__setStreamToggleWarmup_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v54 setObject:@"State of Mind" forKeyedSubscript:v143];
  [v54 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v55 = [v4 localizedStringForKey:@"Moods and emotions you log" value:&stru_270625C18 table:0];
  [v54 setObject:v55 forKeyedSubscript:v141];

  v142 = v54;
  uint64_t v56 = MEMORY[0x263EFFA88];
  [v54 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  v57 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v57 setObject:v56 forKeyedSubscript:v139];
  v58 = [v4 localizedStringForKey:@"General prompts to reflect on gratitude, kindness, purpose, and more", &stru_270625C18, 0 value table];
  v136 = v57;
  [v57 setObject:v58 forKeyedSubscript:v137];

  v59 = (void *)MEMORY[0x263F5FC40];
  v60 = [v4 localizedStringForKey:@"Reflection Prompts" value:&stru_270625C18 table:0];
  v61 = objc_msgSend(v59, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v60, self, 0);

  [v61 setObject:@"Reflection" forKeyedSubscript:v143];
  [v61 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v130 = v61;
  [v61 setProperty:MEMORY[0x263EFFA88] forKey:v148];
  v128 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v62 = (void *)MEMORY[0x263F5FC40];
  v63 = [v4 localizedStringForKey:@"Clear History" value:&stru_270625C18 table:0];
  v64 = [v62 deleteButtonSpecifierWithName:v63 target:self action:sel__clearHistoryWarmup_];

  v127 = v64;
  [v64 setObject:&unk_270629050 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
  uint64_t v65 = [v4 localizedStringForKey:@"iPhone will discover nearby contacts to show moments spent with contacts higher up in your list of suggestions. This may also allow your contacts to discover when you’re nearby. Your name and location will not be shared." value:&stru_270625C18 table:0];
  v108 = [v4 localizedStringForKey:@"NEARBY PEOPLE" value:&stru_270625C18 table:0];
  v66 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"NEARBY_PEOPLE_GROUP");
  uint64_t v67 = MEMORY[0x263EFFA88];
  [v66 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v139];
  v140 = v66;
  v109 = (void *)v65;
  [v66 setObject:v65 forKeyedSubscript:v137];
  v68 = (void *)MEMORY[0x263F5FC40];
  v69 = [v4 localizedStringForKey:@"Prioritize Moments with Contacts" value:&stru_270625C18 table:0];
  v70 = [v68 preferenceSpecifierNamed:v69 target:self set:sel__setStreamToggle_withSpecifier_ get:sel__getStreamToggle_ detail:0 cell:6 edit:0];

  [v70 setObject:@"Prioritize Moments with Contacts" forKeyedSubscript:v143];
  [v70 setObject:NSClassFromString(&cfstr_Pssubtitleswit.isa) forKeyedSubscript:v145];
  v147 = v70;
  [v70 setProperty:v67 forKey:v148];
  v146 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v71 = (void *)MEMORY[0x263F5FC40];
  v72 = [v4 localizedStringForKey:@"Suggestion Notification Settings" value:&stru_270625C18 table:0];
  v73 = [v71 preferenceSpecifierNamed:v72 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v73 setProperty:v67 forKey:v148];
  [v73 setButtonAction:sel_didTapSuggestionNotificationSettings_];
  v149 = [v4 localizedStringForKey:@"APPS USING PRIVATE ACCESS" value:&stru_270625C18 table:0];
  v74 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"APPS_USING_PRIVATE_ACCESS_GROUP");
  v75 = [v4 localizedStringForKey:@"Learn More" value:&stru_270625C18 table:0];
  v76 = [v4 localizedStringForKey:@"Apps using Private Access for suggestions data will appear here." value:&stru_270625C18 table:0];
  v107 = [NSString stringWithFormat:@"%@ %@", v76, v75];
  objc_msgSend(v74, "setObject:forKeyedSubscript:");
  v77 = (objc_class *)objc_opt_class();
  v78 = NSStringFromClass(v77);
  [v74 setProperty:v78 forKey:v113];

  v138 = v76;
  NSUInteger v79 = [v76 length] + 1;
  v144 = v75;
  v160.length = [v75 length];
  v160.location = v79;
  v80 = NSStringFromRange(v160);
  [v74 setProperty:v80 forKey:v112];

  v81 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v74 setProperty:v81 forKey:v111];

  [v74 setProperty:@"showDataAccessExplanationSheet:" forKey:v110];
  if (!self->supportedApplicationsLoading && !self->supportedApplications && !self->supportedApplicationsWithDataAccess)
  {
    v82 = v73;
    v83 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_256D32000, v83, OS_LOG_TYPE_DEFAULT, "Triggering loading of supported applications specifiers", (uint8_t *)buf, 2u);
    }

    self->supportedApplicationsLoading = 1;
    v84 = (NSMutableArray *)objc_opt_new();
    supportedApplications = self->supportedApplications;
    self->supportedApplications = v84;

    v86 = (NSMutableArray *)objc_opt_new();
    supportedApplicationsWithDataAccess = self->supportedApplicationsWithDataAccess;
    self->supportedApplicationsWithDataAccess = v86;

    v88 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v89 = dispatch_queue_create("MOSuggestionSheetSettingsController", v88);

    objc_initWeak(buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__MOSuggestionSheetSettingsController_specifiers__block_invoke;
    block[3] = &unk_265424AC0;
    objc_copyWeak(&v155, buf);
    dispatch_async(v89, block);
    objc_destroyWeak(&v155);
    objc_destroyWeak(buf);

    v73 = v82;
  }
  if (v115 == 2)
  {
    [v3 addObject:v135];
    v90 = v126;
    [v3 addObject:v126];
    [v3 addObject:v134];
    [v3 addObject:v133];
    [v3 addObject:v132];
    [v3 addObject:v131];
    v91 = v114;
    [v3 addObject:v114];
    [v3 addObject:v142];
    [v3 addObject:v128];
    [v3 addObject:v127];
    [v3 addObject:v136];
    [v3 addObject:v130];
    [v3 addObject:v140];
    [v3 addObject:v147];
    [v3 addObject:v146];
    v92 = v73;
    [v3 addObject:v73];
    [v3 addObject:v74];
    if (!self->supportedApplicationsLoading)
    {
      v93 = self->supportedApplicationsWithDataAccess;
      if (v93)
      {
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        v94 = v93;
        uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v150 objects:v157 count:16];
        if (v95)
        {
          uint64_t v96 = v95;
          uint64_t v97 = *(void *)v151;
          do
          {
            for (uint64_t i = 0; i != v96; ++i)
            {
              if (*(void *)v151 != v97) {
                objc_enumerationMutation(v94);
              }
              [v3 addObject:*(void *)(*((void *)&v150 + 1) + 8 * i)];
            }
            uint64_t v96 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v150 objects:v157 count:16];
          }
          while (v96);
        }

        v90 = v126;
      }
    }
  }
  else
  {
    v92 = v73;
    v90 = v126;
    v91 = v114;
    if (!self->supportedApplicationsLoading)
    {
      v99 = self->supportedApplications;
      if (v99)
      {
        if ([(NSMutableArray *)v99 count])
        {
          v100 = v3;
          v101 = v125;
        }
        else
        {
          v100 = v3;
          v101 = v124;
        }
        [v100 addObject:v101];
      }
    }
  }
  uint64_t v102 = (int)*MEMORY[0x263F5FDB8];
  v103 = *(Class *)((char *)&self->super.super.super.super.super.isa + v102);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v102) = (Class)v3;
  id v104 = v3;

  id v105 = *(id *)((char *)&self->super.super.super.super.super.isa + v102);
  return v105;
}

void __49__MOSuggestionSheetSettingsController_specifiers__block_invoke(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D32000, v2, OS_LOG_TYPE_DEFAULT, "Loading of supported applications specifiers started", buf, 2u);
  }

  id v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained fillSupportedApplicationsArray:WeakRetained[173] andSupportedApplicationsWithDataAccess:WeakRetained[174]];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MOSuggestionSheetSettingsController_specifiers__block_invoke_145;
  block[3] = &unk_265424AC0;
  objc_copyWeak(&v6, v3);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
}

void __49__MOSuggestionSheetSettingsController_specifiers__block_invoke_145(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D32000, v2, OS_LOG_TYPE_DEFAULT, "Loading of supported applications specifiers complete", buf, 2u);
  }

  id v3 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "Triggering specifiers reload", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1400] = 0;
  [WeakRetained reloadSpecifiers];
}

- (void)fillSupportedApplicationsArray:(id)a3 andSupportedApplicationsWithDataAccess:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v6 = +[MOApprovedApplicationsManager sharedInstance];
  uint64_t v7 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __109__MOSuggestionSheetSettingsController_fillSupportedApplicationsArray_andSupportedApplicationsWithDataAccess___block_invoke;
  v29[3] = &unk_265425000;
  id v25 = v6;
  id v30 = v25;
  id v26 = v5;
  id v31 = v26;
  [v7 setFilter:v29];
  v27 = v7;
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = *MEMORY[0x263F60140];
    uint64_t v11 = *MEMORY[0x263F60308];
    do
    {
      uint64_t v12 = [v9 URL];
      uint64_t v13 = [MEMORY[0x263F086E0] bundleWithURL:v12];
      pid_t v14 = [v13 bundleIdentifier];
      uint64_t v15 = (void *)MEMORY[0x263F827E8];
      v16 = [MEMORY[0x263F82B60] mainScreen];
      [v16 scale];
      BOOL v17 = objc_msgSend(v15, "_applicationIconImageForBundleIdentifier:format:scale:", v14, 0);

      v18 = [v13 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
      if (isValidString(v18))
      {
        id v19 = v18;

        pid_t v14 = v19;
      }
      v20 = [v13 objectForInfoDictionaryKey:@"CFBundleName"];

      if (isValidString(v20))
      {
        id v21 = v20;

        pid_t v14 = v21;
      }
      v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];
      v23 = [v9 bundleIdentifier];
      [v22 setUserInfo:v23];

      [v22 setObject:v17 forKeyedSubscript:v10];
      [v22 setObject:v14 forKeyedSubscript:v11];
      [v28 addObject:v22];

      uint64_t v24 = [v27 nextObject];

      v9 = (void *)v24;
    }
    while (v24);
  }
}

BOOL __109__MOSuggestionSheetSettingsController_fillSupportedApplicationsArray_andSupportedApplicationsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleIdentifier];
  LODWORD(v4) = [v4 isJournalingSuggestionsAvailableForBundleIdentifier:v5];

  if (v4)
  {
    id v6 = [v3 bundleIdentifier];
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = (void *)[v6 copy];
    [v7 addObject:v8];
  }
  v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v3 bundleIdentifier];
  uint64_t v11 = [v9 getJournalingSuggestionsApprovedApplicationRecordForBundleIdentifier:v10];

  return v11 != 0;
}

- (BOOL)_isAnySettingEnabled
{
  v2 = +[MOSettingsManager sharedInstance];
  char v3 = [v2 getStateForSetting:1];
  char v4 = v3 | [v2 getStateForSetting:2];
  char v5 = [v2 getStateForSetting:3];
  char v6 = v4 | v5 | [v2 getStateForSetting:4];
  char v7 = [v2 getStateForSetting:5];
  char v8 = v7 | [v2 getStateForSetting:6];
  char v9 = v6 | v8 | [v2 getStateForSetting:9];

  return v9 & 1;
}

- (void)_clearHistoryWarmup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  char v5 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  char v6 = (void *)MEMORY[0x263F82418];
  char v7 = [v5 localizedStringForKey:@"Do you want to clear the history of Journaling Suggestions?" value:&stru_270625C18 table:0];
  char v8 = [v6 alertControllerWithTitle:v7 message:0 preferredStyle:0];

  char v9 = (void *)MEMORY[0x263F82400];
  uint64_t v10 = [v5 localizedStringForKey:@"Clear History" value:&stru_270625C18 table:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__MOSuggestionSheetSettingsController__clearHistoryWarmup___block_invoke;
  v16[3] = &unk_265425028;
  objc_copyWeak(&v18, &location);
  id v11 = v4;
  id v17 = v11;
  uint64_t v12 = [v9 actionWithTitle:v10 style:2 handler:v16];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  pid_t v14 = [v5 localizedStringForKey:@"Cancel" value:&stru_270625C18 table:0];
  uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:0];
  [v8 addAction:v15];

  [(MOSuggestionSheetSettingsController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __59__MOSuggestionSheetSettingsController__clearHistoryWarmup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearHistory:*(void *)(a1 + 32)];
}

- (void)_clearHistory:(id)a3
{
  id v12 = +[MOSettingsManager sharedInstance];
  uint64_t v4 = [v12 getStateForSetting:1];
  uint64_t v5 = [v12 getStateForSetting:2];
  uint64_t v6 = [v12 getStateForSetting:3];
  uint64_t v7 = [v12 getStateForSetting:4];
  uint64_t v8 = [v12 getStateForSetting:5];
  uint64_t v9 = [v12 getStateForSetting:6];
  uint64_t v10 = [v12 getStateForSetting:9];
  uint64_t v11 = [v12 getStateForSetting:10];
  [v12 setState:1 forSetting:1];
  [v12 setState:1 forSetting:2];
  [v12 setState:1 forSetting:3];
  [v12 setState:1 forSetting:4];
  [v12 setState:1 forSetting:5];
  [v12 setState:1 forSetting:6];
  [v12 setState:1 forSetting:9];
  [v12 setState:1 forSetting:10];
  [v12 setState:0 forSetting:1];
  [v12 setState:0 forSetting:2];
  [v12 setState:0 forSetting:3];
  [v12 setState:0 forSetting:4];
  [v12 setState:0 forSetting:5];
  [v12 setState:0 forSetting:6];
  [v12 setState:0 forSetting:9];
  [v12 setState:0 forSetting:10];
  [v12 setState:v4 forSetting:1];
  [v12 setState:v5 forSetting:2];
  [v12 setState:v6 forSetting:3];
  [v12 setState:v7 forSetting:4];
  [v12 setState:v8 forSetting:5];
  [v12 setState:v9 forSetting:6];
  [v12 setState:v10 forSetting:9];
  [v12 setState:v11 forSetting:10];
  [(MOSuggestionSheetSettingsController *)self reloadSpecifiers];
  +[MOSuggestionSheetSettingsController runCommand:&unk_270628FF0];
}

- (void)didTapTurnOnJournalingSuggestion:(id)a3
{
  char v3 = self;
  uint64_t v4 = +[MOOnboardingManager sharedInstance];
  id v5 = [v4 getSheetOnboardingViewControllerWithDelegate:v3];

  [v5 setModalInPresentation:1];
  [v5 setModalPresentationStyle:2];
  [(MOSuggestionSheetSettingsController *)v3 presentViewController:v5 animated:1 completion:0];
}

- (void)shouldDismissOnboarding
{
  [(MOSuggestionSheetSettingsController *)self dismissViewControllerAnimated:1 completion:0];
  [(MOSuggestionSheetSettingsController *)self reloadSpecifiers];
}

- (void)didTapSuggestionNotificationSettings:(id)a3
{
  [NSURL URLWithString:@"app-prefs:com.apple.momentsd.MOUserNotifications&target=com.apple.settings.notifications"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)didTapTurnOffAllWarmup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  uint64_t v6 = (void *)MEMORY[0x263F82418];
  uint64_t v7 = [v5 localizedStringForKey:@"Do you want to turn off Journaling Suggestions?" value:&stru_270625C18 table:0];
  uint64_t v8 = [v6 alertControllerWithTitle:v7 message:0 preferredStyle:0];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  uint64_t v10 = [v5 localizedStringForKey:@"Turn Off All" value:&stru_270625C18 table:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__MOSuggestionSheetSettingsController_didTapTurnOffAllWarmup___block_invoke;
  v16[3] = &unk_265425028;
  objc_copyWeak(&v18, &location);
  id v11 = v4;
  id v17 = v11;
  id v12 = [v9 actionWithTitle:v10 style:2 handler:v16];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  pid_t v14 = [v5 localizedStringForKey:@"Cancel" value:&stru_270625C18 table:0];
  uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:0];
  [v8 addAction:v15];

  [(MOSuggestionSheetSettingsController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __62__MOSuggestionSheetSettingsController_didTapTurnOffAllWarmup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didTapTurnOffAll:*(void *)(a1 + 32)];
}

- (void)didTapTurnOffAll:(id)a3
{
  id v4 = +[MOSettingsManager sharedInstance];
  [v4 setState:0 forSetting:1];
  [v4 setState:0 forSetting:2];
  [v4 setState:0 forSetting:3];
  [v4 setState:0 forSetting:4];
  [v4 setState:0 forSetting:5];
  [v4 setState:0 forSetting:6];
  [v4 setState:0 forSetting:9];
  [(MOSuggestionSheetSettingsController *)self reloadSpecifiers];
  +[MOSuggestionSheetSettingsController runCommand:&unk_270629008];
}

- (void)didTapTurnOnAll:(id)a3
{
  id v4 = +[MOSettingsManager sharedInstance];
  [v4 setState:1 forSetting:1];
  [v4 setState:1 forSetting:2];
  [v4 setState:1 forSetting:3];
  [v4 setState:1 forSetting:4];
  [v4 setState:1 forSetting:5];
  [v4 setState:1 forSetting:6];
  [v4 setState:1 forSetting:9];
  [(MOSuggestionSheetSettingsController *)self reloadSpecifiers];
  +[MOSuggestionSheetSettingsController runCommand:&unk_270629020];
}

- (void)_setStreamToggleWarmup:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 BOOLValue];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60138]];
  objc_initWeak(location, self);
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained _setStreamToggle:MEMORY[0x263EFFA88] withSpecifier:v7];

    [(MOSuggestionSheetSettingsController *)self reloadSpecifiers];
  }
  else
  {
    id v11 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
    uint64_t v12 = [(MOSuggestionSheetSettingsController *)self _getLocalizedSpecifier:v9];
    uint64_t v13 = NSString;
    pid_t v14 = [v11 localizedStringForKey:@"Turning off \"%@\" will clear history of selected data of Journaling Suggestions. Continue?" value:&stru_270625C18 table:0];
    uint64_t v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);

    v16 = NSString;
    id v17 = [v11 localizedStringForKey:@"Clear \"%@\" history" value:&stru_270625C18 table:0];
    id v28 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v12);
    id v26 = (void *)v12;

    id v18 = [v11 localizedStringForKey:@"Cancel" value:&stru_270625C18 table:0];
    v27 = v9;
    id v25 = (void *)v15;
    id v19 = [MEMORY[0x263F82418] alertControllerWithTitle:v15 message:0 preferredStyle:0];
    v20 = (void *)MEMORY[0x263F82400];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke;
    v33[3] = &unk_265425050;
    objc_copyWeak(&v36, location);
    id v21 = v7;
    id v34 = v21;
    v35 = self;
    v22 = [v20 actionWithTitle:v28 style:2 handler:v33];
    [v19 addAction:v22];

    v23 = (void *)MEMORY[0x263F82400];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke_2;
    v29[3] = &unk_265425050;
    objc_copyWeak(&v32, location);
    id v30 = v21;
    id v31 = self;
    uint64_t v24 = [v23 actionWithTitle:v18 style:1 handler:v29];
    [v19 addAction:v24];

    [(MOSuggestionSheetSettingsController *)self presentViewController:v19 animated:1 completion:0];
    uint64_t v9 = v27;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v36);
  }
  objc_destroyWeak(location);
}

uint64_t __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setStreamToggle:MEMORY[0x263EFFA80] withSpecifier:*(void *)(a1 + 32)];

  char v3 = *(void **)(a1 + 40);
  return [v3 reloadSpecifiers];
}

uint64_t __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setStreamToggle:MEMORY[0x263EFFA88] withSpecifier:*(void *)(a1 + 32)];

  char v3 = *(void **)(a1 + 40);
  return [v3 reloadSpecifiers];
}

- (void)_setStreamToggle:(id)a3 withSpecifier:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v15 = +[MOSettingsManager sharedInstance];
  uint64_t v9 = [v8 BOOLValue];

  uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60138]];

  if ([v10 isEqual:@"Activity"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 1;
LABEL_17:
    [v11 setState:v12 forSetting:v13];
    goto LABEL_18;
  }
  if ([v10 isEqual:@"Media"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 2;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"Contacts"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 3;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"Photos"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 4;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"Significant Locations"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 5;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"Prioritize Moments with Contacts"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 6;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"State of Mind"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 9;
    goto LABEL_17;
  }
  if ([v10 isEqual:@"Reflection"])
  {
    id v11 = v15;
    uint64_t v12 = v9;
    uint64_t v13 = 10;
    goto LABEL_17;
  }
  pid_t v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"MOSuggestionSheetSettingsController.m" lineNumber:630 description:@"Specifier identifier is unknown"];

LABEL_18:
  +[MOSuggestionSheetSettingsController runCommand:&unk_270629038];
}

- (id)_getStreamToggle:(id)a3
{
  id v5 = a3;
  id v6 = +[MOSettingsManager sharedInstance];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F60138]];

  if ([v7 isEqual:@"Activity"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 1;
LABEL_17:
    id v11 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "getStateForSetting:", v10));
    goto LABEL_18;
  }
  if ([v7 isEqual:@"Media"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 2;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"Contacts"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 3;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"Photos"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 4;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"Significant Locations"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 5;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"Prioritize Moments with Contacts"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 6;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"State of Mind"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 9;
    goto LABEL_17;
  }
  if ([v7 isEqual:@"Reflection"])
  {
    id v8 = NSNumber;
    uint64_t v9 = v6;
    uint64_t v10 = 10;
    goto LABEL_17;
  }
  uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2 object:self file:@"MOSuggestionSheetSettingsController.m" lineNumber:658 description:@"Specifier identifier is unknown"];

  id v11 = 0;
LABEL_18:

  return v11;
}

- (id)_getLocalizedSpecifier:(id)a3
{
  id v5 = a3;
  id v6 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  if ([v5 isEqual:@"Activity"])
  {
    id v7 = @"Activity";
LABEL_17:
    id v8 = [v6 localizedStringForKey:v7 value:&stru_270625C18 table:0];
    goto LABEL_18;
  }
  if ([v5 isEqual:@"Media"])
  {
    id v7 = @"Media";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"Contacts"])
  {
    id v7 = @"Contacts";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"Photos"])
  {
    id v7 = @"Photos";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"Significant Locations"])
  {
    id v7 = @"Significant Locations";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"Prioritize Moments with Contacts"])
  {
    id v7 = @"Prioritize Moments with Contacts";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"State of Mind"])
  {
    id v7 = @"State of Mind";
    goto LABEL_17;
  }
  if ([v5 isEqual:@"Reflection"])
  {
    id v7 = @"Reflection Prompts";
    goto LABEL_17;
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"MOSuggestionSheetSettingsController.m" lineNumber:684 description:@"Specifier identifier is unknown"];

  id v8 = &stru_270625C18;
LABEL_18:

  return v8;
}

- (void)showPrivacyExplanationSheet:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.journal"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)showDataAccessExplanationSheet:(id)a3
{
  id v12 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  id v4 = [v12 localizedStringForKey:@"Private Access & Suggestions" value:&stru_270625C18 table:0];
  id v5 = [v12 localizedStringForKey:@"Your journal only has access to suggestions when you start writing about them or save them.\n\nThe information used to create a suggestion, such as a photo or workout, is also shared with your journal at that time.\n\nApps that use Private Access to offer suggestions will appear in Journaling Suggestions settings.", &stru_270625C18, 0 value table];
  id v6 = [MEMORY[0x263F827E8] imageNamed:@"momentsPrivacy-80-masked" inBundle:v12];
  id v7 = [MEMORY[0x263F5B898] boldButton];
  id v8 = [v12 localizedStringForKey:@"Done" value:&stru_270625C18 table:0];
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:self action:sel_dismissDataAccessExplanationSheet_ forControlEvents:0x2000];
  uint64_t v9 = (OBWelcomeController *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v4 detailText:v5 icon:v6 contentLayout:2];
  uint64_t v10 = [(OBWelcomeController *)v9 buttonTray];
  [v10 addButton:v7];

  [(OBWelcomeController *)v9 setModalInPresentation:1];
  [(MOSuggestionSheetSettingsController *)self presentViewController:v9 animated:1 completion:0];
  dataAccessPresenter = self->dataAccessPresenter;
  self->dataAccessPresenter = v9;
}

- (void)dismissDataAccessExplanationSheet:(id)a3
{
  [(OBWelcomeController *)self->dataAccessPresenter dismissViewControllerAnimated:1 completion:0];
  dataAccessPresenter = self->dataAccessPresenter;
  self->dataAccessPresenter = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataAccessPresenter, 0);
  objc_storeStrong((id *)&self->supportedApplicationsWithDataAccess, 0);
  objc_storeStrong((id *)&self->supportedApplications, 0);
}

+ (void)runCommand:.cold.1()
{
}

@end