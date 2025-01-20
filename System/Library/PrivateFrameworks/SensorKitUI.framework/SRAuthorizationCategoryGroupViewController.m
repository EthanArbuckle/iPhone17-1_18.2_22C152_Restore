@interface SRAuthorizationCategoryGroupViewController
- (BOOL)indexPathIsInWriterSection:(id)a3;
- (NSArray)sortedReaderAuthorizationServices;
- (NSArray)sortedWriterAuthorizationServices;
- (NSBundle)appBundle;
- (NSMutableDictionary)readerAuthState;
- (NSMutableDictionary)writerAuthState;
- (SRAuthorizationCategoryGroupViewController)init;
- (SRAuthorizationStore)authStore;
- (id)serviceFromIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)readerAuthSectionStart;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)usageSectionStart;
- (int64_t)writerAuthSectionStart;
- (void)authorizationSwitchToggledWithValue:(BOOL)a3 indexPath:(id)a4;
- (void)confirmAuthChangeForService:(id)a3 value:(BOOL)a4 indexPath:(id)a5 setOverride:(BOOL)a6;
- (void)dealloc;
- (void)openPrivacy;
- (void)setAppBundle:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setReaderAuthState:(id)a3;
- (void)setSortedReaderAuthorizationServices:(id)a3;
- (void)setSortedWriterAuthorizationServices:(id)a3;
- (void)setWriterAuthState:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation SRAuthorizationCategoryGroupViewController

- (SRAuthorizationCategoryGroupViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationCategoryGroupViewController;
  return [(SRAuthorizationCategoryGroupViewController *)&v3 initWithStyle:2];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationCategoryGroupViewController;
  [(SRAuthorizationCategoryGroupViewController *)&v3 viewDidLoad];
  -[SRAuthorizationCategoryGroupViewController setSortedReaderAuthorizationServices:](self, "setSortedReaderAuthorizationServices:", objc_msgSend(MEMORY[0x263EFF8C0], "skui_sortedServices:", -[NSMutableDictionary allKeys](-[SRAuthorizationCategoryGroupViewController readerAuthState](self, "readerAuthState"), "allKeys")));
  -[SRAuthorizationCategoryGroupViewController setSortedWriterAuthorizationServices:](self, "setSortedWriterAuthorizationServices:", objc_msgSend(MEMORY[0x263EFF8C0], "skui_sortedServices:", -[NSMutableDictionary allKeys](-[SRAuthorizationCategoryGroupViewController writerAuthState](self, "writerAuthState"), "allKeys")));
}

- (void)dealloc
{
  [(SRAuthorizationCategoryGroupViewController *)self setAppBundle:0];
  [(SRAuthorizationCategoryGroupViewController *)self setSortedReaderAuthorizationServices:0];
  [(SRAuthorizationCategoryGroupViewController *)self setSortedWriterAuthorizationServices:0];
  [(SRAuthorizationCategoryGroupViewController *)self setReaderAuthState:0];
  [(SRAuthorizationCategoryGroupViewController *)self setWriterAuthState:0];
  [(SRAuthorizationCategoryGroupViewController *)self setAuthStore:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationCategoryGroupViewController;
  [(SRAuthorizationCategoryGroupViewController *)&v3 dealloc];
}

- (int64_t)usageSectionStart
{
  if ([(NSMutableDictionary *)[(SRAuthorizationCategoryGroupViewController *)self readerAuthState] count])
  {
    return 0;
  }
  else
  {
    return -1;
  }
}

- (int64_t)writerAuthSectionStart
{
  if ([(NSMutableDictionary *)[(SRAuthorizationCategoryGroupViewController *)self writerAuthState] count])
  {
    return [(SRAuthorizationCategoryGroupViewController *)self usageSectionStart] + 1;
  }
  else
  {
    return -1;
  }
}

- (int64_t)readerAuthSectionStart
{
  if ([(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart] == -1) {
    return [(SRAuthorizationCategoryGroupViewController *)self usageSectionStart] + 1;
  }
  int64_t v3 = [(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart];
  return [(NSMutableDictionary *)[(SRAuthorizationCategoryGroupViewController *)self writerAuthState] count]+ v3;
}

- (BOOL)indexPathIsInWriterSection:(id)a3
{
  uint64_t v5 = [a3 section];
  if (v5 < [(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart]) {
    return 0;
  }
  uint64_t v7 = [a3 section];
  return v7 < [(SRAuthorizationCategoryGroupViewController *)self readerAuthSectionStart];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(SRAuthorizationCategoryGroupViewController *)self usageSectionStart] == a4)
  {
    uint64_t v6 = 31;
  }
  else if ([(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart] == a4)
  {
    uint64_t v6 = 32;
  }
  else
  {
    if ([(SRAuthorizationCategoryGroupViewController *)self readerAuthSectionStart] != a4) {
      return 0;
    }
    uint64_t v6 = 33;
  }
  uint64_t v7 = NSString;
  return (id)objc_msgSend(v7, "srui_localizedStringForCode:", v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4 = [(SRAuthorizationCategoryGroupViewController *)self usageSectionStart];
  uint64_t v5 = [(NSMutableDictionary *)[(SRAuthorizationCategoryGroupViewController *)self writerAuthState] count];
  uint64_t v6 = [(NSMutableDictionary *)[(SRAuthorizationCategoryGroupViewController *)self readerAuthState] count];
  if (v4 == -1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  return v7 + v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(SRAuthorizationCategoryGroupViewController *)self usageSectionStart] == a4) {
    return 1;
  }
  if ([(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart] == a4) {
    return 3;
  }
  if ([(SRAuthorizationCategoryGroupViewController *)self readerAuthSectionStart] <= a4) {
    return 3;
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7 = [a4 section];
  uint64_t v8 = [a4 row];
  if (v7 == [(SRAuthorizationCategoryGroupViewController *)self usageSectionStart])
  {
    v9 = [SRAppUsageCell alloc];
    v10 = (objc_class *)objc_opt_class();
    v11 = [(SRAppUsageCell *)v9 initWithStyle:0 reuseIdentifier:NSStringFromClass(v10)];
    [(UILabel *)[(SRAppUsageCell *)v11 label] setText:[(NSBundle *)[(SRAuthorizationCategoryGroupViewController *)self appBundle] sk_usageDescription]];
    id v12 = [(NSBundle *)[(SRAuthorizationCategoryGroupViewController *)self appBundle] srui_localizedPrivacyPolicyLinkTitle];
    if (v12)
    {
      -[UIButton setTitle:forState:](-[SRAppUsageCell button](v11, "button"), "setTitle:forState:", [NSString stringWithFormat:@"\n%@", v12], 0);
      [(UIButton *)[(SRAppUsageCell *)v11 button] addTarget:self action:sel_openPrivacy forControlEvents:64];
      [(UIButton *)[(SRAppUsageCell *)v11 button] setAccessibilityTraits:*MEMORY[0x263F1CF10]];
      [(UILabel *)[(UIButton *)[(SRAppUsageCell *)v11 button] titleLabel] setLineBreakMode:0];
      [(UILabel *)[(UIButton *)[(SRAppUsageCell *)v11 button] titleLabel] setNumberOfLines:0];
      objc_msgSend((id)-[SRAuthorizationCategoryGroupViewController tableView](self, "tableView"), "separatorInset");
      double v14 = v13;
      double v16 = v15;
      v17 = (void *)[(SRAppUsageCell *)v11 contentView];
      double v18 = 16.0;
LABEL_19:
      objc_msgSend(v17, "setLayoutMargins:", v18, v14, 16.0, v16);
      return v11;
    }
    goto LABEL_12;
  }
  id v19 = [(SRAuthorizationCategoryGroupViewController *)self serviceFromIndexPath:a4];
  if (!v19)
  {
LABEL_12:
    v25 = objc_opt_new();
    return v25;
  }
  id v20 = v19;
  if ([(SRAuthorizationCategoryGroupViewController *)self indexPathIsInWriterSection:a4])
  {
    v21 = [(SRAuthorizationCategoryGroupViewController *)self writerAuthState];
  }
  else
  {
    v21 = [(SRAuthorizationCategoryGroupViewController *)self readerAuthState];
  }
  uint64_t v22 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v20];
  v23 = +[SRAuthorizationGroup authorizationGroupWithServiceName:v20];
  if (v8 != 2)
  {
    v24 = v23;
    if (v8 == 1)
    {
      uint64_t v28 = *MEMORY[0x263F1D260];
      uint64_t v29 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260] addingSymbolicTraits:2 options:2];
      uint64_t v30 = [MEMORY[0x263F1C658] fontWithDescriptor:v29 size:0.0];
      uint64_t v31 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v28];
      v11 = +[SRAuthorizationCategoryDetailCell categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:](SRAuthorizationCategoryDetailCell, "categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:", v24, -[SRAuthorizationCategoryGroupViewController appBundle](self, "appBundle"), v30, v31, [MEMORY[0x263F1C550] secondaryLabelColor], 0);
      objc_msgSend((id)-[SRAuthorizationCategoryGroupViewController tableView](self, "tableView"), "separatorInset");
      double v14 = v32;
      double v16 = v33;
      v17 = (void *)[(SRAppUsageCell *)v11 contentView];
      double v18 = 18.0;
      goto LABEL_19;
    }
    if (!v8)
    {
      v11 = +[SRAuthorizationCell authorizationCellForIndexPath:a4 title:[(SRAuthorizationGroup *)v23 localizedDisplayName] state:v22 delegate:self tableView:a3];
      objc_msgSend((id)-[SRAppUsageCell textLabel](v11, "textLabel"), "setFont:", objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C660], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x263F1D260]), "fontDescriptorWithSymbolicTraits:", 2), 0.0));
      return v11;
    }
    goto LABEL_12;
  }
  v27 = (void *)MEMORY[0x263F1CA48];
  return (id)objc_msgSend(v27, "skui_tableViewCellForDataSample:", a3);
}

- (id)serviceFromIndexPath:(id)a3
{
  BOOL v5 = -[SRAuthorizationCategoryGroupViewController indexPathIsInWriterSection:](self, "indexPathIsInWriterSection:");
  uint64_t v6 = [a3 section];
  if (!v5)
  {
    unint64_t v7 = v6 - [(SRAuthorizationCategoryGroupViewController *)self readerAuthSectionStart];
    if (v7 < [(NSArray *)[(SRAuthorizationCategoryGroupViewController *)self sortedReaderAuthorizationServices] count])
    {
      uint64_t v8 = [(SRAuthorizationCategoryGroupViewController *)self sortedReaderAuthorizationServices];
      goto LABEL_6;
    }
    return 0;
  }
  unint64_t v7 = v6 - [(SRAuthorizationCategoryGroupViewController *)self writerAuthSectionStart];
  if (v7 >= [(NSArray *)[(SRAuthorizationCategoryGroupViewController *)self sortedWriterAuthorizationServices] count])return 0; {
  uint64_t v8 = [(SRAuthorizationCategoryGroupViewController *)self sortedWriterAuthorizationServices];
  }
LABEL_6:
  return [(NSArray *)v8 objectAtIndexedSubscript:v7];
}

- (void)authorizationSwitchToggledWithValue:(BOOL)a3 indexPath:(id)a4
{
  BOOL v5 = a3;
  id v7 = [(SRAuthorizationCategoryGroupViewController *)self serviceFromIndexPath:a4];
  uint64_t v8 = [(SRAuthorizationCategoryGroupViewController *)self indexPathIsInWriterSection:a4] ^ 1;
  if (!v5)
  {
    objc_initWeak(&location, self);
    v9 = +[SRAuthorizationGroup authorizationGroupWithServiceName:v7];
    v10 = (void *)MEMORY[0x263F1C3F8];
    v11 = [(SRAuthorizationCategoryGroupViewController *)self appBundle];
    uint64_t v12 = [(SRAuthorizationCategoryGroupViewController *)self tableView];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__SRAuthorizationCategoryGroupViewController_authorizationSwitchToggledWithValue_indexPath___block_invoke;
    v14[3] = &unk_264BA2F60;
    objc_copyWeak(&v15, &location);
    BOOL v16 = v5;
    v14[4] = v7;
    v14[5] = a4;
    char v17 = v8;
    uint64_t v13 = objc_msgSend(v10, "skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:authGroup:tableView:indexPath:destructiveHandler:", v11, v9, v12, a4, v14);
    if (v13)
    {
      [(SRAuthorizationCategoryGroupViewController *)self presentViewController:v13 animated:1 completion:0];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      return;
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  [(SRAuthorizationCategoryGroupViewController *)self confirmAuthChangeForService:v7 value:v5 indexPath:a4 setOverride:v8];
}

uint64_t __92__SRAuthorizationCategoryGroupViewController_authorizationSwitchToggledWithValue_indexPath___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
  return [Weak confirmAuthChangeForService:v4 value:v3 indexPath:v5 setOverride:v6];
}

- (void)confirmAuthChangeForService:(id)a3 value:(BOOL)a4 indexPath:(id)a5 setOverride:(BOOL)a6
{
  BOOL v7 = a4;
  if ([(SRAuthorizationStore *)[(SRAuthorizationCategoryGroupViewController *)self authStore] setAuthorizationForBundleId:[(NSBundle *)[(SRAuthorizationCategoryGroupViewController *)self appBundle] bundleIdentifier] service:a3 value:a4 setOverride:a6])
  {
    BOOL v10 = [(SRAuthorizationCategoryGroupViewController *)self indexPathIsInWriterSection:a5];
    uint64_t v11 = [NSNumber numberWithBool:v7];
    if (v10) {
      uint64_t v12 = [(SRAuthorizationCategoryGroupViewController *)self writerAuthState];
    }
    else {
      uint64_t v12 = [(SRAuthorizationCategoryGroupViewController *)self readerAuthState];
    }
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:a3];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "section", a3);
  uint64_t v7 = [a4 row];
  if (v6 != [(SRAuthorizationCategoryGroupViewController *)self usageSectionStart] && v7 == 2)
  {
    id v8 = +[SRSampleViewController sampleViewControllerForAuthGroup:](SRSampleViewController, "sampleViewControllerForAuthGroup:", +[SRAuthorizationGroup authorizationGroupWithServiceName:[(SRAuthorizationCategoryGroupViewController *)self serviceFromIndexPath:a4]]);
    v9 = (void *)[(SRAuthorizationCategoryGroupViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (void)openPrivacy
{
  uint64_t v3 = (void *)[MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v4 = [(NSBundle *)[(SRAuthorizationCategoryGroupViewController *)self appBundle] sk_privacyURL];
  [v3 openURL:v4 withOptions:0];
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
}

- (NSMutableDictionary)readerAuthState
{
  return self->_readerAuthState;
}

- (void)setReaderAuthState:(id)a3
{
}

- (NSMutableDictionary)writerAuthState
{
  return self->_writerAuthState;
}

- (void)setWriterAuthState:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setAuthStore:(id)a3
{
}

- (NSArray)sortedReaderAuthorizationServices
{
  return self->_sortedReaderAuthorizationServices;
}

- (void)setSortedReaderAuthorizationServices:(id)a3
{
}

- (NSArray)sortedWriterAuthorizationServices
{
  return self->_sortedWriterAuthorizationServices;
}

- (void)setSortedWriterAuthorizationServices:(id)a3
{
}

@end