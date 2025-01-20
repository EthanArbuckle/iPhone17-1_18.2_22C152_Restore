@interface PUIReportSensorAppController
- (NSString)bundleID;
- (PUIReportSensorAppController)init;
- (PUIReportSensorManager)manager;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation PUIReportSensorAppController

- (PUIReportSensorAppController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUIReportSensorAppController;
  v2 = [(PUIReportSensorAppController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:@"PUIReportSensorManagerDataHasChangedNotification" object:0];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v48 = (int)*MEMORY[0x1E4F92F08];
    v57 = objc_opt_new();
    v4 = objc_opt_new();
    objc_super v5 = [(PUIReportSensorAppController *)self bundleID];

    if (!v5)
    {
      v6 = [(PUIReportSensorAppController *)self specifier];
      v7 = [v6 objectForKeyedSubscript:@"PUIReportAppIDKey"];
      [(PUIReportSensorAppController *)self setBundleID:v7];

      v8 = [(PUIReportSensorAppController *)self specifier];
      v9 = [v8 objectForKeyedSubscript:@"PUIReportSensorManagerKey"];
      [(PUIReportSensorAppController *)self setManager:v9];
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [(PUIReportSensorAppController *)self bundleID];
    PUIAnalyticsLogView(v11, v12, 0);

    v13 = [(PUIReportSensorAppController *)self manager];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __42__PUIReportSensorAppController_specifiers__block_invoke;
    v64[3] = &unk_1E6E9DD30;
    v64[4] = self;
    uint64_t v14 = [v13 eventsFiltered:v64];

    v15 = [(PUIReportSensorAppController *)self manager];
    v46 = (void *)v14;
    v16 = [v15 categoriesAndLatestDatesFromEvents:v14];

    v17 = (void *)MEMORY[0x1E4F92E70];
    v18 = PUI_LocalizedStringForAppReport(@"PAST_7_DAYS");
    uint64_t v19 = [v17 groupSpecifierWithID:@"CATEGORIES" name:v18];

    v47 = v4;
    v45 = (void *)v19;
    [v4 addObject:v19];
    v55 = objc_opt_new();
    v56 = v16;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = [v16 allKeys];
    uint64_t v20 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v54 = *(void *)v61;
      uint64_t v52 = *MEMORY[0x1E4F931A0];
      uint64_t v53 = *MEMORY[0x1E4F931D0];
      uint64_t v50 = *MEMORY[0x1E4F931C0];
      uint64_t v49 = *MEMORY[0x1E4F93190];
      uint64_t v22 = *MEMORY[0x1E4F93250];
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v61 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x1E4F92E70];
          v26 = +[PUIReportSensorManager localizedStringForCategory:v24];
          v27 = [v25 preferenceSpecifierNamed:v26 target:self set:0 get:sel_valueForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

          [v27 setIdentifier:v24];
          v28 = [(PUIReportSensorAppController *)self manager];
          [v27 setObject:v28 forKeyedSubscript:@"PUIReportSensorManagerKey"];

          v29 = [(PUIReportSensorAppController *)self bundleID];
          [v27 setObject:v29 forKeyedSubscript:@"PUIReportAppIDKey"];

          v30 = +[PUIReportSensorManager iconTypeIdentifierForCategory:v24];

          if (v30)
          {
            v31 = +[PUIReportSensorManager iconTypeIdentifierForCategory:v24];
            v32 = v27;
            v33 = v31;
            uint64_t v34 = v52;
LABEL_13:
            [v32 setObject:v33 forKeyedSubscript:v34];

            [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v53];
            goto LABEL_14;
          }
          v35 = +[PUIReportSensorManager applicationBundleIdentifierForCategory:v24];

          if (v35)
          {
            v31 = +[PUIReportSensorManager applicationBundleIdentifierForCategory:v24];
            v32 = v27;
            v33 = v31;
            uint64_t v34 = v50;
            goto LABEL_13;
          }
          v39 = +[PUIReportSensorManager iconForCategory:v24];
          [v27 setObject:v39 forKeyedSubscript:v49];

LABEL_14:
          v36 = [v56 objectForKeyedSubscript:v24];
          v37 = [MEMORY[0x1E4F1C9C8] now];
          v38 = [v57 localizedStringForDate:v36 relativeToDate:v37];
          [v27 setObject:v38 forKeyedSubscript:v22];

          [v55 addObject:v27];
          ++v23;
        }
        while (v21 != v23);
        uint64_t v40 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
        uint64_t v21 = v40;
      }
      while (v40);
    }

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __42__PUIReportSensorAppController_specifiers__block_invoke_2;
    v58[3] = &unk_1E6E9DD58;
    id v59 = v56;
    id v41 = v56;
    [v55 sortUsingComparator:v58];
    [v47 addObjectsFromArray:v55];
    v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v48);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v48) = (Class)v47;
    id v43 = v47;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v48);
  }
  return v3;
}

uint64_t __42__PUIReportSensorAppController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 access];
  v4 = [v3 accessor];
  objc_super v5 = [v4 identifier];
  v6 = [*(id *)(a1 + 32) bundleID];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

uint64_t __42__PUIReportSensorAppController_specifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [a3 identifier];
  v8 = [v5 objectForKeyedSubscript:v7];
  v9 = *(void **)(a1 + 32);
  v10 = [v6 identifier];

  v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
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
}

@end