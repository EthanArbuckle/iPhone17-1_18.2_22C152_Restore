@interface CACCustomCommandApplicationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isModalInPresentation;
- (CACCustomCommandApplicationViewController)init;
- (CACCustomCommandApplicationViewControllerDelegate)delegate;
- (CACSpokenCommandItem)commandItem;
- (NSArray)sortedIdentifiers;
- (NSArray)sortedNames;
- (NSDictionary)applicationIdentifiersToNames;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setApplicationIdentifiersToNames:(id)a3;
- (void)setCommandItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSortedIdentifiers:(id)a3;
- (void)setSortedNames:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CACCustomCommandApplicationViewController

- (CACCustomCommandApplicationViewController)init
{
  v2 = [(CACCustomCommandApplicationViewController *)self initWithStyle:1];
  if (v2)
  {
    v3 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Application"];
    [(CACCustomCommandApplicationViewController *)v2 setTitle:v3];
  }
  return v2;
}

- (void)setApplicationIdentifiersToNames:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v5 = (NSDictionary *)a3;
  if (self->_applicationIdentifiersToNames != v5)
  {
    objc_storeStrong((id *)&self->_applicationIdentifiersToNames, a3);
    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSDictionary count](v5, "count") + 1);
    [v6 addObject:@"com.apple.speech.SystemWideScope"];
    v7 = [(NSDictionary *)v5 allKeys];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __78__CACCustomCommandApplicationViewController_setApplicationIdentifiersToNames___block_invoke;
    v24[3] = &unk_264D11A90;
    v8 = v5;
    v25 = v8;
    v9 = [v7 sortedArrayUsingComparator:v24];

    [v6 addObjectsFromArray:v9];
    [(CACCustomCommandApplicationViewController *)self setSortedIdentifiers:v6];
    v10 = (void *)MEMORY[0x263EFF980];
    v11 = [(CACCustomCommandApplicationViewController *)self sortedIdentifiers];
    v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

    v13 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.AnyApplication"];
    [v12 addObject:v13];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          [v12 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v16);
    }

    [(CACCustomCommandApplicationViewController *)self setSortedNames:v12];
  }
}

uint64_t __78__CACCustomCommandApplicationViewController_setApplicationIdentifiersToNames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CACCustomCommandApplicationViewController;
  [(CACCustomCommandApplicationViewController *)&v5 viewDidLoad];
  v3 = [(CACCustomCommandApplicationViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"ApplicationCell"];

  v4 = [(CACCustomCommandApplicationViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"AnyCell"];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  v4 = [(CACCustomCommandApplicationViewController *)self sortedNames];
  int64_t v5 = [v4 count] - 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section]) {
    v8 = @"ApplicationCell";
  }
  else {
    v8 = @"AnyCell";
  }
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [v6 row];
  if (v10) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = v11;
  }
  v13 = [(CACCustomCommandApplicationViewController *)self sortedNames];
  id v14 = [v13 objectAtIndexedSubscript:v12];
  uint64_t v15 = [v9 textLabel];
  [v15 setText:v14];

  uint64_t v16 = [(CACCustomCommandApplicationViewController *)self commandItem];
  uint64_t v17 = [v16 customScope];
  v18 = [(CACCustomCommandApplicationViewController *)self sortedIdentifiers];
  v19 = [v18 objectAtIndexedSubscript:v12];
  if ([v17 isEqualToString:v19]) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 0;
  }
  [v9 setAccessoryType:v20];

  if ([v6 section])
  {
    long long v21 = (void *)MEMORY[0x263F827E8];
    long long v22 = [(CACCustomCommandApplicationViewController *)self sortedIdentifiers];
    long long v23 = [v22 objectAtIndexedSubscript:v12];
    v24 = [MEMORY[0x263F82B60] mainScreen];
    [v24 scale];
    v25 = objc_msgSend(v21, "_applicationIconImageForBundleIdentifier:format:scale:", v23, 0);

    v26 = [v9 imageView];
    [v26 setImage:v25];

    uint64_t v27 = [v9 imageView];
    v28 = [v27 layer];
    [v28 setMasksToBounds:1];

    v29 = [v9 imageView];
    v30 = [v29 layer];
    [v30 setCornerRadius:5.0];
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 row];
  if (v6) {
    uint64_t v8 = v7 + 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = [(CACCustomCommandApplicationViewController *)self sortedIdentifiers];
  uint64_t v10 = [v9 objectAtIndexedSubscript:v8];
  uint64_t v11 = [(CACCustomCommandApplicationViewController *)self commandItem];
  [v11 setCustomScope:v10];

  uint64_t v12 = [(CACCustomCommandApplicationViewController *)self tableView];
  v13 = [v12 cellForRowAtIndexPath:v5];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = [(CACCustomCommandApplicationViewController *)self tableView];
  uint64_t v15 = [v14 visibleCells];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
        if (v20 == v13) {
          uint64_t v21 = 3;
        }
        else {
          uint64_t v21 = 0;
        }
        [v20 setAccessoryType:v21];
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  long long v22 = [(CACCustomCommandApplicationViewController *)self tableView];
  [v22 deselectRowAtIndexPath:v5 animated:1];

  long long v23 = [(CACCustomCommandApplicationViewController *)self delegate];
  [v23 didUpdateCommandItemForApplicationViewController:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCustomCommandApplicationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCustomCommandApplicationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CACSpokenCommandItem)commandItem
{
  return self->_commandItem;
}

- (void)setCommandItem:(id)a3
{
}

- (NSDictionary)applicationIdentifiersToNames
{
  return self->_applicationIdentifiersToNames;
}

- (NSArray)sortedNames
{
  return self->_sortedNames;
}

- (void)setSortedNames:(id)a3
{
}

- (NSArray)sortedIdentifiers
{
  return self->_sortedIdentifiers;
}

- (void)setSortedIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedNames, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiersToNames, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end