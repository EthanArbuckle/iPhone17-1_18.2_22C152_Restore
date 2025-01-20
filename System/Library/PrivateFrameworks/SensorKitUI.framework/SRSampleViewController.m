@interface SRSampleViewController
+ (id)sampleViewControllerForAuthGroup:(id)a3;
+ (void)initialize;
- (NSArray)sampleDataEntries;
- (NSString)note;
- (SRAuthorizationGroup)authGroup;
- (SRSampleViewController)init;
- (id)prepareEndRowWithText:(id)a3 detailText:(id)a4;
- (id)prepareExtendedRowWithText:(id)a3;
- (id)sortedKeysForDictionary:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)setAuthGroup:(id)a3;
- (void)setNote:(id)a3;
- (void)setSampleDataEntries:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SRSampleViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogSampleViewController = (uint64_t)os_log_create("com.apple.SensorKit", "SRSampleViewController");
  }
}

- (SRSampleViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SRSampleViewController;
  result = [(SRSampleViewController *)&v3 initWithStyle:1];
  if (result)
  {
    result->_sampleDataEntries = 0;
    result->_note = 0;
  }
  return result;
}

- (void)dealloc
{
  [(SRSampleViewController *)self setSampleDataEntries:0];
  [(SRSampleViewController *)self setNote:0];
  [(SRSampleViewController *)self setAuthGroup:0];
  v3.receiver = self;
  v3.super_class = (Class)SRSampleViewController;
  [(SRSampleViewController *)&v3 dealloc];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)[(SRSampleViewController *)self sampleDataEntries] objectAtIndex:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v6 = (void *)[v4 allKeys];
  return [v6 count];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(SRSampleViewController *)self sampleDataEntries];
  return [(NSArray *)v3 count];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(SRSampleViewController *)self numberOfSectionsInTableView:a3] - 1 != a4) {
    return 0;
  }
  return [(SRSampleViewController *)self note];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = -[NSArray objectAtIndex:](-[SRSampleViewController sampleDataEntries](self, "sampleDataEntries", a3), "objectAtIndex:", [a4 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = self;
    id v8 = v6;
    uint64_t v9 = 0;
LABEL_6:
    return [(SRSampleViewController *)v7 prepareEndRowWithText:v8 detailText:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend(-[SRSampleViewController sortedKeysForDictionary:](self, "sortedKeysForDictionary:", v6), "objectAtIndex:", objc_msgSend(a4, "row"));
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = self;
      id v8 = (id)v10;
      uint64_t v9 = v11;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      return [(SRSampleViewController *)self prepareExtendedRowWithText:v10];
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    v16 = objc_opt_new();
    return v16;
  }
  uint64_t v13 = objc_msgSend(NSString, "srui_localizedStringForCode:", 5);
  uint64_t v17 = 0;
  uint64_t v14 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, @"%ld", &v17, objc_msgSend(a4, "section"));
  if (!v14)
  {
    v15 = SRLogSampleViewController;
    if (os_log_type_enabled((os_log_t)SRLogSampleViewController, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v17;
      _os_log_fault_impl(&dword_230B11000, v15, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  return [(SRSampleViewController *)self prepareExtendedRowWithText:v14];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = -[NSArray objectAtIndex:](-[SRSampleViewController sampleDataEntries](self, "sampleDataEntries"), "objectAtIndex:", [a4 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(-[SRSampleViewController sortedKeysForDictionary:](self, "sortedKeysForDictionary:", v7), "objectAtIndex:", objc_msgSend(a4, "row")));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v7 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = objc_alloc_init(SRSampleViewController);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObject:v7];
    }
    [(SRSampleViewController *)v8 setSampleDataEntries:v7];
    [(SRSampleViewController *)v8 setAuthGroup:self->_authGroup];
    -[SRSampleViewController setTitle:](v8, "setTitle:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "textLabel"), "text"));
    objc_msgSend((id)-[SRSampleViewController navigationController](self, "navigationController"), "pushViewController:animated:", v8, 1);
  }
}

- (id)prepareEndRowWithText:(id)a3 detailText:(id)a4
{
  id v6 = (id)objc_msgSend((id)-[SRSampleViewController tableView](self, "tableView"), "dequeueReusableCellWithIdentifier:", @"SRSampleTableEndRowReuseIdentifier");
  if (!v6)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"SRSampleTableEndRowReuseIdentifier"];
    [v6 setAccessoryType:0];
    [v6 setSelectionStyle:0];
    objc_msgSend(v6, "setLayoutManager:", objc_msgSend(MEMORY[0x263F1CA50], "layoutManagerForTableViewCellStyle:", 3));
  }
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", a3);
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setNumberOfLines:", 0);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", a4);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setNumberOfLines:", 0);
  return v6;
}

- (id)prepareExtendedRowWithText:(id)a3
{
  id v4 = (id)objc_msgSend((id)-[SRSampleViewController tableView](self, "tableView"), "dequeueReusableCellWithIdentifier:", @"SRSampleTableExpandableRowReuseIdentifier");
  if (!v4)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SRSampleTableExpandableRowReuseIdentifier"];
    [v4 setAccessoryType:1];
    [v4 setSelectionStyle:3];
  }
  objc_msgSend((id)objc_msgSend(v4, "textLabel"), "setText:", a3);
  objc_msgSend((id)objc_msgSend(v4, "textLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v4, "textLabel"), "setNumberOfLines:", 0);
  return v4;
}

- (id)sortedKeysForDictionary:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(a3, "allKeys"));
  [v3 sortUsingComparator:&__block_literal_global_0];
  return v3;
}

uint64_t __50__SRSampleViewController_sortedKeysForDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)sampleViewControllerForAuthGroup:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setTitle:", objc_msgSend(NSString, "srui_localizedStringForCode:", 8));
  [v4 setAuthGroup:a3];
  objc_msgSend(v4, "setSampleDataEntries:", objc_msgSend(a3, "localizedSampleData"));
  v5 = objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionsForAuthorizationService:", objc_msgSend(a3, "authorizationService"));
  id v6 = (__CFString *)[MEMORY[0x263F089D8] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * v10) localizedAdditionalSampleDataNote];
        if ([v11 length]) {
          -[__CFString appendString:](v6, "appendString:", [NSString stringWithFormat:@"%@\n", v11]);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  uint64_t v12 = objc_msgSend(NSString, "srui_localizedStringForCode:", 9);
  uint64_t v13 = NSString;
  if ([(__CFString *)v6 length]) {
    uint64_t v14 = v6;
  }
  else {
    uint64_t v14 = &stru_26E558AB8;
  }
  uint64_t v15 = [(__CFString *)v6 length];
  v16 = @"\n";
  if (!v15) {
    v16 = &stru_26E558AB8;
  }
  [v4 setNote:objc_msgSend(v13, "stringWithFormat:", @"%@%@%@", v14, v16, v12)];
  return v4;
}

- (NSArray)sampleDataEntries
{
  return self->_sampleDataEntries;
}

- (void)setSampleDataEntries:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (SRAuthorizationGroup)authGroup
{
  return self->_authGroup;
}

- (void)setAuthGroup:(id)a3
{
}

@end