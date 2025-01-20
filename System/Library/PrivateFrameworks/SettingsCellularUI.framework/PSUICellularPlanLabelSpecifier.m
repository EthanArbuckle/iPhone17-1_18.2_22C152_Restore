@interface PSUICellularPlanLabelSpecifier
- (PSUICellularPlanLabelSpecifier)initWithPlanUniversalReference:(id)a3 planManagerCache:(id)a4;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICellularPlanUniversalReference)planReference;
- (id)cellularPlanLabel:(id)a3;
- (id)getLogger;
- (void)setPlanManagerCache:(id)a3;
- (void)setPlanReference:(id)a3;
- (void)updateValuesAndTitles;
@end

@implementation PSUICellularPlanLabelSpecifier

- (PSUICellularPlanLabelSpecifier)initWithPlanUniversalReference:(id)a3 planManagerCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CELLULAR_PLAN_LABEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  uint64_t v11 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)PSUICellularPlanLabelSpecifier;
  v12 = [(PSUICellularPlanLabelSpecifier *)&v14 initWithName:v10 target:self set:0 get:sel_cellularPlanLabel_ detail:v11 cell:2 edit:0];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_planReference, a3);
    objc_storeStrong((id *)&v12->_planManagerCache, a4);
    [(PSUICellularPlanLabelSpecifier *)v12 setProperty:v12->_planReference forKey:*MEMORY[0x263F5FFF0]];
    [(PSUICellularPlanLabelSpecifier *)v12 updateValuesAndTitles];
  }

  return v12;
}

- (void)updateValuesAndTitles
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planFromReference:self->_planReference];
  v4 = (void *)MEMORY[0x263EFF980];
  v5 = [(PSUICellularPlanManagerCache *)self->_planManagerCache predefinedLabels];
  v6 = [v4 arrayWithArray:v5];

  uint64_t v7 = [v3 userLabel];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [v3 userLabel];
    char v10 = [v6 containsObject:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v3 userLabel];
      [v6 addObject:v11];
    }
  }
  v12 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "label", (void)v21);
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  v19 = [(PSUICellularPlanLabelSpecifier *)self getLogger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "updating values and titles: %@ %@", buf, 0x16u);
  }

  [(PSUICellularPlanLabelSpecifier *)self setValues:v13 titles:v12 shortTitles:v12];
  if ([v3 transferredStatus] == 4) {
    uint64_t v20 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v20 = MEMORY[0x263EFFA88];
  }
  -[PSUICellularPlanLabelSpecifier setProperty:forKey:](self, "setProperty:forKey:", v20, *MEMORY[0x263F600A8], (void)v21);
}

- (id)cellularPlanLabel:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanLabelSpecifier *)self updateValuesAndTitles];
  v4 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planFromReference:self->_planReference];
  v5 = [(PSUICellularPlanLabelSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 userLabel];
    int v9 = 138412546;
    char v10 = v6;
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "displaying user label %@ for plan item %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [v4 userLabel];

  return v7;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularPlanLabel"];
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planReference, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
}

@end