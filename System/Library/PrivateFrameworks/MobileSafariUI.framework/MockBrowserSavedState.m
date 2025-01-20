@interface MockBrowserSavedState
- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3;
- (NSString)initalURLString;
- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3;
- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3 initialURLString:(id)a4;
- (unint64_t)tabsCount;
- (void)setInitalURLString:(id)a3;
- (void)setTabsCount:(unint64_t)a3;
@end

@implementation MockBrowserSavedState

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3
{
  v3 = [(MockBrowserSavedState *)self savedTabsStateForBrowserControllerWithUUID:a3 initialURLString:self->_initalURLString];
  return v3;
}

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3 initialURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = objc_alloc_init(MEMORY[0x1E4F78560]);
  v8 = [v6 UUIDString];
  [v21 setUUIDString:v8];

  v9 = [v21 dictionaryRepresentation];
  v20 = (void *)[v9 mutableCopy];

  v10 = [MEMORY[0x1E4F1CA48] array];
  unint64_t tabsCount = self->_tabsCount;
  if (tabsCount <= 1) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = self->_tabsCount;
  }
  if (tabsCount) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 32;
  }
  do
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F783E0]);
    v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [v15 UUIDString];
    [v14 setUUIDString:v16];

    [v14 setTitle:@"[Untitled]"];
    v17 = [v6 UUIDString];
    [v14 setOwningBrowserWindowUUIDString:v17];

    [v14 setUrl:v7];
    v18 = [v14 dictionaryRepresentation];
    [v10 addObject:v18];

    --v13;
  }
  while (v13);
  [v20 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F787C8]];
  [v20 setObject:&unk_1F3C73AD0 forKeyedSubscript:*MEMORY[0x1E4F787B8]];

  return v20;
}

- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3
{
  return 1;
}

- (unint64_t)tabsCount
{
  return self->_tabsCount;
}

- (void)setTabsCount:(unint64_t)a3
{
  self->_unint64_t tabsCount = a3;
}

- (NSString)initalURLString
{
  return self->_initalURLString;
}

- (void)setInitalURLString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end