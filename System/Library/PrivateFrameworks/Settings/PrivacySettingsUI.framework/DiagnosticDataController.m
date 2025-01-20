@interface DiagnosticDataController
- (DiagnosticDataController)init;
- (NSArray)_allSpecifiers;
- (UISearchController)searchController;
- (id)specifiers;
- (unint64_t)_state;
- (void)_loadDiagnosticsDataWithCompletion:(id)a3;
- (void)setSearchController:(id)a3;
- (void)set_allSpecifiers:(id)a3;
- (void)set_state:(unint64_t)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation DiagnosticDataController

- (DiagnosticDataController)init
{
  v20.receiver = self;
  v20.super_class = (Class)DiagnosticDataController;
  v2 = [(DiagnosticDataController *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v2->__state = 0;
    v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"plist", @"synced", @"ips", @"metriclog", @"anon", @"crash", @"session", @"log", @"gz", 0);
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"Extensions"];
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
    v7 = (_xpc_connection_s *)v15[5];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__DiagnosticDataController_init__block_invoke;
    handler[3] = &unk_1E6E9CAE0;
    handler[4] = &v14;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume((xpc_connection_t)v15[5]);
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v15[5], v6);
    if (MEMORY[0x1E4E88C70]() != MEMORY[0x1E4F14590]
      || (xpc_dictionary_get_value(v8, "Success"), v10 = objc_claimAutoreleasedReturnValue(), (v11 = v10) == 0)
      || (BOOL value = xpc_BOOL_get_value(v10), v11, !value))
    {
      NSLog(&cfstr_CrashMoverXpcS.isa);
    }

    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

void __32__DiagnosticDataController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1E4E88C70](a2);
  if (a2 == MEMORY[0x1E4F14520] && v4 == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)DiagnosticDataController;
  [(DiagnosticDataController *)&v16 viewDidLoad];
  v3 = PUI_LocalizedStringForProblemReporting(@"PROBLEM_REPORTING_DATA");
  [(DiagnosticDataController *)self setTitle:v3];

  uint64_t v4 = [(DiagnosticDataController *)self table];
  [v4 _setDisplaysCellContentStringsOnTapAndHold:1];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  [(DiagnosticDataController *)self setSearchController:v5];

  uint64_t v6 = [(DiagnosticDataController *)self searchController];
  [v6 setSearchResultsUpdater:self];

  v7 = [(DiagnosticDataController *)self searchController];
  [v7 setObscuresBackgroundDuringPresentation:0];

  xpc_object_t v8 = [(DiagnosticDataController *)self searchController];
  v9 = [v8 searchBar];
  [v9 setAutocapitalizationType:0];

  v10 = [(DiagnosticDataController *)self searchController];
  v11 = [v10 searchBar];
  [v11 setKeyboardType:0];

  v12 = [(DiagnosticDataController *)self searchController];
  v13 = [v12 searchBar];
  [v13 setAutocorrectionType:1];

  uint64_t v14 = [(DiagnosticDataController *)self searchController];
  v15 = [(DiagnosticDataController *)self navigationItem];
  [v15 setSearchController:v14];

  [(DiagnosticDataController *)self setDefinesPresentationContext:1];
}

- (void)_loadDiagnosticsDataWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke;
  block[3] = &unk_1E6E9CB28;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  id v3 = (void (*)(void))getOSAGetSubmittableLogsSymbolLoc_ptr;
  v113 = getOSAGetSubmittableLogsSymbolLoc_ptr;
  if (!getOSAGetSubmittableLogsSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getOSAGetSubmittableLogsSymbolLoc_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getOSAGetSubmittableLogsSymbolLoc_block_invoke((uint64_t)&buf);
    id v3 = (void (*)(void))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v3)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    goto LABEL_101;
  }
  uint64_t v70 = a1;
  uint64_t v4 = v3(0);
  id v5 = [v2 arrayWithArray:v4];

  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  uint64_t v6 = (void *)getRTCReportingClass_softClass;
  v113 = (void *)getRTCReportingClass_softClass;
  if (!getRTCReportingClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getRTCReportingClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getRTCReportingClass_block_invoke((uint64_t)&buf);
    uint64_t v6 = (void *)v111[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v110, 8);
  id v109 = 0;
  v79 = [v7 _privacyLogs:&v109];
  id v76 = v109;
  if (v76)
  {
    xpc_object_t v8 = _PUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v76;
      _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "RTCReporting log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    [v5 addObjectsFromArray:v79];
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  v9 = (void *)getCloudTelemetryReporterClass_softClass;
  v113 = (void *)getCloudTelemetryReporterClass_softClass;
  if (!getCloudTelemetryReporterClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getCloudTelemetryReporterClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getCloudTelemetryReporterClass_block_invoke((uint64_t)&buf);
    v9 = (void *)v111[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v110, 8);
  id v108 = 0;
  v78 = [v10 _privacyLogs:&v108];
  id v75 = v108;
  if (v75)
  {
    v11 = _PUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v75;
      _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "CloudTelemetry log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    [v5 addObjectsFromArray:v78];
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  v12 = (void *)getAATransparencyLoggingClass_softClass;
  v113 = (void *)getAATransparencyLoggingClass_softClass;
  if (!getAATransparencyLoggingClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getAATransparencyLoggingClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getAATransparencyLoggingClass_block_invoke((uint64_t)&buf);
    v12 = (void *)v111[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v110, 8);
  id v107 = 0;
  v77 = [v13 logsWithError:&v107];
  id v74 = v107;
  if (v74)
  {
    uint64_t v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v74;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "AppAnalytics log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    [v5 addObjectsFromArray:v77];
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  v15 = (void *)get_DPReportFileManagerClass_softClass;
  v113 = (void *)get_DPReportFileManagerClass_softClass;
  if (!get_DPReportFileManagerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __get_DPReportFileManagerClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __get_DPReportFileManagerClass_block_invoke((uint64_t)&buf);
    v15 = (void *)v111[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v110, 8);
  v85 = [v16 submittedReports];
  [v5 addObjectsFromArray:v85];
  v84 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose" isDirectory:1];
  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v18 = *MEMORY[0x1E4F1C6E8];
  v19 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
  objc_super v20 = [v17 contentsOfDirectoryAtURL:v84 includingPropertiesForKeys:v19 options:4 error:0];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v20;
  uint64_t v21 = [obj countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v104 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = [*(id *)(*((void *)&v103 + 1) + 8 * i) absoluteURL];
        [v5 addObject:v24];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v103 objects:v116 count:16];
    }
    while (v21);
  }

  v83 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces" isDirectory:1];
  v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  v26 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
  v27 = [v25 contentsOfDirectoryAtURL:v83 includingPropertiesForKeys:v26 options:4 error:0];

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v89 = v27;
  uint64_t v28 = [v89 countByEnumeratingWithState:&v99 objects:v115 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v100 != v29) {
          objc_enumerationMutation(v89);
        }
        v31 = [*(id *)(*((void *)&v99 + 1) + 8 * j) absoluteURL];
        [v5 addObject:v31];
      }
      uint64_t v28 = [v89 countByEnumeratingWithState:&v99 objects:v115 count:16];
    }
    while (v28);
  }

  id v98 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  v32 = (void (*)(id *))getDESSubmissionLogFileURLsSymbolLoc_ptr;
  v113 = getDESSubmissionLogFileURLsSymbolLoc_ptr;
  if (!getDESSubmissionLogFileURLsSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getDESSubmissionLogFileURLsSymbolLoc_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getDESSubmissionLogFileURLsSymbolLoc_block_invoke((uint64_t)&buf);
    v32 = (void (*)(id *))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v32)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    goto LABEL_101;
  }
  v82 = v32(&v98);
  id v73 = v98;
  if (v73)
  {
    v33 = _PUILoggingFacility();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v73;
      _os_log_impl(&dword_1E4AD5000, v33, OS_LOG_TYPE_DEFAULT, "DES Submission Log Files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v82)
  {
    [v5 addObjectsFromArray:v82];
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  v34 = (void *)getSPMLLoggingClass_softClass;
  v113 = (void *)getSPMLLoggingClass_softClass;
  if (!getSPMLLoggingClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getSPMLLoggingClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getSPMLLoggingClass_block_invoke((uint64_t)&buf);
    v34 = (void *)v111[3];
  }
  id v35 = v34;
  _Block_object_dispose(&v110, 8);
  id v97 = 0;
  v81 = [v35 submitttedSpotlightReportsError:&v97];
  id v72 = v97;
  if (v72)
  {
    v36 = _PUILoggingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v72;
      _os_log_impl(&dword_1E4AD5000, v36, OS_LOG_TYPE_DEFAULT, "Search metadata reports not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v81)
  {
    [v5 addObjectsFromArray:v81];
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  v37 = (void *)getPLDiagnosticsClass_softClass;
  v113 = (void *)getPLDiagnosticsClass_softClass;
  if (!getPLDiagnosticsClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getPLDiagnosticsClass_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getPLDiagnosticsClass_block_invoke((uint64_t)&buf);
    v37 = (void *)v111[3];
  }
  id v38 = v37;
  _Block_object_dispose(&v110, 8);
  v39 = [v38 diagnosticsURLs];
  [v5 addObjectsFromArray:v39];

  id v96 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  v40 = (void (*)(id *))getSDRGetAllLogFileURLsSymbolLoc_ptr;
  v113 = getSDRGetAllLogFileURLsSymbolLoc_ptr;
  if (!getSDRGetAllLogFileURLsSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v118 = __getSDRGetAllLogFileURLsSymbolLoc_block_invoke;
    v119 = &unk_1E6E9C7F8;
    v120 = &v110;
    __getSDRGetAllLogFileURLsSymbolLoc_block_invoke((uint64_t)&buf);
    v40 = (void (*)(id *))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v40)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    goto LABEL_101;
  }
  v80 = v40(&v96);
  id v71 = v96;
  if (v71)
  {
    v41 = _PUILoggingFacility();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v71;
      _os_log_impl(&dword_1E4AD5000, v41, OS_LOG_TYPE_DEFAULT, "System Diagnostic Reporter logs not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v80)
  {
    [v5 addObjectsFromArray:v80];
  }
  if (getDRGetAllLogFileURLsSymbolLoc())
  {
    id v95 = 0;
    DRGetAllLogFileURLsSymbolLoc = (void (*)(id *))getDRGetAllLogFileURLsSymbolLoc();
    if (DRGetAllLogFileURLsSymbolLoc)
    {
      v43 = DRGetAllLogFileURLsSymbolLoc(&v95);
      id v44 = v95;
      if (v44)
      {
        v45 = _PUILoggingFacility();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v44;
          _os_log_impl(&dword_1E4AD5000, v45, OS_LOG_TYPE_DEFAULT, "DiagnosticPipeline logs not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (v43)
      {
        [v5 addObjectsFromArray:v43];
      }

      goto LABEL_78;
    }
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
LABEL_101:
    __break(1u);
  }
LABEL_78:
  if (![v5 count])
  {
LABEL_95:
    v66 = (void *)MEMORY[0x1E4F92E70];
    v67 = PUI_LocalizedStringForProblemReporting(@"PROBLEM_REPORTING_NO_DATA");
    v68 = [v66 preferenceSpecifierNamed:v67 target:0 set:0 get:0 detail:0 cell:13 edit:0];

    v69 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    [v68 setProperty:v69 forKey:*MEMORY[0x1E4F93130]];

    [v87 addObject:v68];
    goto LABEL_96;
  }
  [v5 sortUsingComparator:&__block_literal_global_0];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v88 = v5;
  uint64_t v46 = [v88 countByEnumeratingWithState:&v91 objects:v114 count:16];
  if (!v46)
  {

    goto LABEL_95;
  }
  char v47 = 0;
  uint64_t v48 = *(void *)v92;
  uint64_t v86 = *MEMORY[0x1E4F92DE8];
  do
  {
    for (uint64_t k = 0; k != v46; ++k)
    {
      if (*(void *)v92 != v48) {
        objc_enumerationMutation(v88);
      }
      v50 = *(void **)(*((void *)&v91 + 1) + 8 * k);
      v51 = [v50 URLByStandardizingPath];
      v52 = [v51 absoluteString];
      char v53 = [v52 hasSuffix:@"/"];

      if ((v53 & 1) == 0)
      {
        v54 = (void *)MEMORY[0x1E4F92E70];
        v55 = [v50 lastPathComponent];
        uint64_t v56 = objc_opt_class();
        v57 = [v54 preferenceSpecifierNamed:v55 target:0 set:0 get:0 detail:v56 cell:2 edit:objc_opt_class()];

        v58 = [v50 lastPathComponent];
        LODWORD(v56) = [v58 hasSuffix:@"PLSQL.pll.anon"];

        if (v56)
        {
          [v57 setDetailControllerClass:objc_opt_class()];
          uint64_t v110 = 0;
          v111 = &v110;
          uint64_t v112 = 0x2050000000;
          v59 = (void *)getPLDatabaseReaderClass_softClass;
          v113 = (void *)getPLDatabaseReaderClass_softClass;
          if (!getPLDatabaseReaderClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v118 = __getPLDatabaseReaderClass_block_invoke;
            v119 = &unk_1E6E9C7F8;
            v120 = &v110;
            __getPLDatabaseReaderClass_block_invoke((uint64_t)&buf);
            v59 = (void *)v111[3];
          }
          v60 = v59;
          _Block_object_dispose(&v110, 8);
          id v61 = [v60 alloc];
          v62 = [v50 absoluteString];
          v63 = (void *)[v61 initWithDatabaseFile:v62];

          [v57 setProperty:v63 forKey:@"powerlogReader"];
          v64 = [v63 tableNamesFromDatabase];
          [v57 setValues:v64 titles:v64];
        }
        v65 = [v50 path];
        [v57 setProperty:v65 forKey:v86];

        [v87 addObject:v57];
        char v47 = 1;
      }
    }
    uint64_t v46 = [v88 countByEnumeratingWithState:&v91 objects:v114 count:16];
  }
  while (v46);

  if ((v47 & 1) == 0) {
    goto LABEL_95;
  }
LABEL_96:
  (*(void (**)(void))(*(void *)(v70 + 32) + 16))();
}

uint64_t __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke_431(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lastPathComponent];
  uint64_t v6 = [v4 lastPathComponent];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)specifiers
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(DiagnosticDataController *)self _state];
  id v4 = (int *)MEMORY[0x1E4F92F08];
  if (!v3)
  {
    id v5 = [(DiagnosticDataController *)self _allSpecifiers];

    if (!v5)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __38__DiagnosticDataController_specifiers__block_invoke;
      v16[3] = &unk_1E6E9CB78;
      objc_copyWeak(&v17, &location);
      [(DiagnosticDataController *)self _loadDiagnosticsDataWithCompletion:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    uint64_t v6 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    v19[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v8 = *v4;
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = v7;
  }
  id v10 = [(DiagnosticDataController *)self searchController];
  if (([v10 isActive] & 1) == 0)
  {
    BOOL v11 = [(DiagnosticDataController *)self _state] == 1;

    if (!v11) {
      goto LABEL_9;
    }
    v12 = [(DiagnosticDataController *)self _allSpecifiers];
    uint64_t v13 = *v4;
    id v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = v12;
  }

LABEL_9:
  uint64_t v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v4);
  return v14;
}

void __38__DiagnosticDataController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__DiagnosticDataController_specifiers__block_invoke_2;
  v5[3] = &unk_1E6E9CB50;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __38__DiagnosticDataController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  objc_msgSend(WeakRetained, "set_allSpecifiers:", v3);

  id v4 = [WeakRetained unprotectedSpecifiers];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__DiagnosticDataController_specifiers__block_invoke_3;
  aBlock[3] = &unk_1E6E9C758;
  aBlock[4] = WeakRetained;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if ([v4 count])
  {
    [WeakRetained removeContiguousSpecifiers:v4 animated:1];
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __38__DiagnosticDataController_specifiers__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _allSpecifiers];
  [v2 insertContiguousSpecifiers:v3 atIndex:0 animated:1];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 _allSpecifiers];
  [v4 setSpecifiers:v5];

  id v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "set_state:", 1);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  id v5 = [v4 text];

  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [(DiagnosticDataController *)self _allSpecifiers];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __67__DiagnosticDataController_updateSearchResultsForSearchController___block_invoke;
    v12 = &unk_1E6E9C900;
    id v13 = v5;
    id v14 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:&v9];

    -[DiagnosticDataController setSpecifiers:](self, "setSpecifiers:", v8, v9, v10, v11, v12);
  }
  else
  {
    id v8 = [(DiagnosticDataController *)self _allSpecifiers];
    [(DiagnosticDataController *)self setSpecifiers:v8];
  }
}

void __67__DiagnosticDataController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 name];
  int v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (unint64_t)_state
{
  return self->__state;
}

- (void)set_state:(unint64_t)a3
{
  self->__state = a3;
}

- (NSArray)_allSpecifiers
{
  return self->__allSpecifiers;
}

- (void)set_allSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end