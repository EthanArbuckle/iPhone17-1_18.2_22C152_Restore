@interface PUIReportSensorEventsController
- (NSString)bundleID;
- (NSString)category;
- (PUIReportSensorEventsController)init;
- (PUIReportSensorManager)manager;
- (id)headerForCategory:(id)a3;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation PUIReportSensorEventsController

- (PUIReportSensorEventsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUIReportSensorEventsController;
  v2 = [(PUIReportSensorEventsController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:@"PUIReportSensorManagerDataHasChangedNotification" object:0];
  }
  return v2;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v59 = (int)*MEMORY[0x1E4F92F08];
    v4 = objc_opt_new();
    objc_super v5 = [(PUIReportSensorEventsController *)v2 category];

    if (!v5)
    {
      v6 = [(PUIReportSensorEventsController *)v2 specifier];
      v7 = [v6 identifier];
      [(PUIReportSensorEventsController *)v2 setCategory:v7];

      v8 = [(PUIReportSensorEventsController *)v2 specifier];
      v9 = [v8 objectForKeyedSubscript:@"PUIReportAppIDKey"];
      [(PUIReportSensorEventsController *)v2 setBundleID:v9];

      v10 = [(PUIReportSensorEventsController *)v2 specifier];
      v11 = [v10 objectForKeyedSubscript:@"PUIReportSensorManagerKey"];
      [(PUIReportSensorEventsController *)v2 setManager:v11];
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [(PUIReportSensorEventsController *)v2 bundleID];
    v15 = [(PUIReportSensorEventsController *)v2 category];
    PUIAnalyticsLogView(v13, v14, v15);

    v16 = [(PUIReportSensorEventsController *)v2 manager];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __45__PUIReportSensorEventsController_specifiers__block_invoke;
    v77[3] = &unk_1E6E9DD30;
    v77[4] = v2;
    v17 = [v16 eventsFiltered:v77];

    v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_17];

    v19 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"EVENTS_HEADER_GROUP"];
    v20 = [(PUIReportSensorEventsController *)v2 category];
    v21 = [(PUIReportSensorEventsController *)v2 headerForCategory:v20];
    [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    v57 = v19;
    [v4 addObject:v19];
    v22 = (void *)MEMORY[0x1E4F92E70];
    v23 = PUI_LocalizedStringForAppReport(@"PAST_7_DAYS");
    uint64_t v24 = [v22 groupSpecifierWithID:@"EVENTS_GROUP" name:v23];

    v58 = v4;
    v56 = (void *)v24;
    [v4 addObject:v24];
    v25 = objc_opt_new();
    [v25 setTimeStyle:0];
    [v25 setDateStyle:2];
    v70 = v25;
    [v25 setDoesRelativeDateFormatting:1];
    v26 = objc_opt_new();
    [v26 setTimeStyle:1];
    v69 = v26;
    [v26 setDateStyle:0];
    v27 = objc_opt_new();
    [v27 setDateStyle:0];
    v65 = v27;
    [v27 setTimeStyle:1];
    v71 = objc_opt_new();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v18;
    uint64_t v28 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v72 = *(void *)v74;
      uint64_t v68 = *MEMORY[0x1E4F93250];
      uint64_t v63 = *MEMORY[0x1E4F93520];
      uint64_t v61 = *MEMORY[0x1E4F93528];
      uint64_t v62 = *MEMORY[0x1E4F93538];
      v64 = v2;
      do
      {
        uint64_t v30 = 0;
        uint64_t v66 = v29;
        do
        {
          if (*(void *)v74 != v72) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v73 + 1) + 8 * v30);
          v32 = [v31 access];
          v33 = [v32 identifier];
          v34 = [v33 UUIDString];

          v35 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4072988 target:v2 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v36 = v31;
            v37 = (void *)MEMORY[0x1E4F1C9C8];
            [v36 startTime];
            v38 = objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
            v39 = [v69 stringFromDate:v38];
            v40 = [v36 access];
            if ([v40 accessCount])
            {
              if (isGreenTeaSKU_once != -1) {
                dispatch_once(&isGreenTeaSKU_once, &__block_literal_global_93);
              }
              int v41 = isGreenTeaSKU_deviceIsChinaSKU;

              if (v41)
              {
                v42 = NSString;
                v43 = [v36 access];
                v44 = [v42 localizedStringWithFormat:@"%@ (%lu)", v39, objc_msgSend(v43, "accessCount")];
                goto LABEL_30;
              }
            }
            else
            {
            }
            v46 = (void *)MEMORY[0x1E4F1C9C8];
            [v36 endTime];
            v43 = objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
            v44 = [v65 stringFromDate:v38 toDate:v43];
            if (isGreenTeaSKU_once != -1) {
              dispatch_once(&isGreenTeaSKU_once, &__block_literal_global_93);
            }
            if (isGreenTeaSKU_deviceIsChinaSKU && ![v71 count])
            {
              v47 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v63, v62, v61, 0);
              v48 = [(PUIReportSensorEventsController *)v2 category];
              if ([v47 containsObject:v48])
              {
                char v60 = [v44 isEqualToString:v39];

                if ((v60 & 1) == 0)
                {
                  v49 = (void *)MEMORY[0x1E4F92E70];
                  v50 = [v70 stringFromDate:v38];
                  v47 = [v49 preferenceSpecifierNamed:v50 target:v64 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

                  v51 = [v69 stringFromDate:v43];
                  [v47 setObject:v51 forKeyedSubscript:v68];

                  [v71 addObject:v47];
                  goto LABEL_28;
                }
              }
              else
              {

LABEL_28:
              }
              v2 = v64;
            }
LABEL_30:
            [v35 setObject:v44 forKeyedSubscript:v68];

            uint64_t v29 = v66;
LABEL_31:

            [v35 setIdentifier:v34];
            v52 = [v70 stringFromDate:v38];
            [v35 setName:v52];

            [v71 addObject:v35];
            goto LABEL_32;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = (void *)MEMORY[0x1E4F1C9C8];
            [v31 startTime];
            v38 = objc_msgSend(v45, "dateWithTimeIntervalSinceReferenceDate:");
            id v36 = [v69 stringFromDate:v38];
            [v35 setObject:v36 forKeyedSubscript:v68];
            goto LABEL_31;
          }
          v38 = _PUILoggingFacility();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v79 = "-[PUIReportSensorEventsController specifiers]";
            __int16 v80 = 2112;
            v81 = v31;
            _os_log_impl(&dword_1E4AD5000, v38, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record type, %@", buf, 0x16u);
          }
LABEL_32:

          ++v30;
        }
        while (v29 != v30);
        uint64_t v29 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v29);
    }

    [v58 addObjectsFromArray:v71];
    v53 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v59);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v59) = (Class)v58;
    id v54 = v58;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v59);
  }
  return v3;
}

uint64_t __45__PUIReportSensorEventsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 access];
  objc_super v5 = [v4 accessor];
  v6 = [v5 identifier];
  v7 = [*(id *)(a1 + 32) bundleID];
  if ([v6 isEqual:v7])
  {
    v8 = [v3 access];
    v9 = [v8 category];
    v10 = [*(id *)(a1 + 32) category];
    uint64_t v11 = [v9 isEqual:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

BOOL __45__PUIReportSensorEventsController_specifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 startTime];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.79769313e308;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v5 startTime];
  }
  else {
    double v8 = 1.79769313e308;
  }
  BOOL v9 = v7 < v8;

  return v9;
}

- (id)headerForCategory:(id)a3
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F93538];
  v12[0] = *MEMORY[0x1E4F93520];
  v12[1] = v4;
  v13[0] = @"EVENTS_HEADER_TEXT_LOCATION";
  v13[1] = @"EVENTS_HEADER_TEXT_PHOTOS";
  uint64_t v5 = *MEMORY[0x1E4F93530];
  v12[2] = *MEMORY[0x1E4F93510];
  v12[3] = v5;
  v13[2] = @"EVENTS_HEADER_TEXT_CAMERA";
  v13[3] = @"EVENTS_HEADER_TEXT_MICROPHONE";
  uint64_t v6 = *MEMORY[0x1E4F93528];
  v12[4] = *MEMORY[0x1E4F93518];
  v12[5] = v6;
  v13[4] = @"EVENTS_HEADER_TEXT_CONTACTS";
  v13[5] = @"EVENTS_HEADER_TEXT_MEDIA_LIBRARY";
  v12[6] = *MEMORY[0x1E4F93540];
  v13[6] = @"EVENTS_HEADER_TEXT_SCREEN_RECORDING";
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
  double v8 = [v7 objectForKeyedSubscript:v3];

  if (v8)
  {
    BOOL v9 = [v7 objectForKeyedSubscript:v3];
    PUI_LocalizedStringForAppReport(v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = _PUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PUIReportSensorEventsController headerForCategory:]((uint64_t)v3, v9);
    }
    v10 = &stru_1F4072988;
  }

  return v10;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (PUIReportSensorManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)headerForCategory:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[PUIReportSensorEventsController headerForCategory:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s: no header string for category: %@", (uint8_t *)&v2, 0x16u);
}

@end