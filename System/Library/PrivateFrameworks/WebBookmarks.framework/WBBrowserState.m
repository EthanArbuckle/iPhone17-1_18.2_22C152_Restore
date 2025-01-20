@interface WBBrowserState
+ (BOOL)supportsSecureCoding;
- (NSArray)pinnedTabs;
- (NSArray)privatePinnedTabs;
- (NSArray)windowStates;
- (NSDictionary)pinnedTabsByProfileIdentifier;
- (WBBrowserState)init;
- (WBBrowserState)initWithCoder:(id)a3;
- (WBBrowserState)initWithPinnedTabs:(id)a3 privatePinnedTabs:(id)a4 windowStates:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPinnedTabs:(id)a3;
- (void)setPinnedTabsByProfileIdentifier:(id)a3;
- (void)setPrivatePinnedTabs:(id)a3;
- (void)setWindowStates:(id)a3;
@end

@implementation WBBrowserState

- (NSArray)windowStates
{
  return self->_windowStates;
}

- (NSArray)privatePinnedTabs
{
  return self->_privatePinnedTabs;
}

- (NSArray)pinnedTabs
{
  return self->_pinnedTabs;
}

- (WBBrowserState)initWithPinnedTabs:(id)a3 privatePinnedTabs:(id)a4 windowStates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBBrowserState;
  v11 = [(WBBrowserState *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    pinnedTabs = v11->_pinnedTabs;
    v11->_pinnedTabs = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    privatePinnedTabs = v11->_privatePinnedTabs;
    v11->_privatePinnedTabs = (NSArray *)v14;

    pinnedTabsByProfileIdentifier = v11->_pinnedTabsByProfileIdentifier;
    v11->_pinnedTabsByProfileIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v17 = [v10 copy];
    windowStates = v11->_windowStates;
    v11->_windowStates = (NSArray *)v17;

    v19 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowStates, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabs, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
}

- (WBBrowserState)init
{
  return [(WBBrowserState *)self initWithPinnedTabs:MEMORY[0x263EFFA68] privatePinnedTabs:MEMORY[0x263EFFA68] windowStates:MEMORY[0x263EFFA68]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBrowserState)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"PinnedTabs"];

  id v9 = (void *)MEMORY[0x263EFFA08];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v11 = [v9 setWithArray:v10];
  uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"PrivatePinnedTabs"];

  v13 = (void *)MEMORY[0x263EFFA08];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  v15 = [v13 setWithArray:v14];
  uint64_t v16 = [v5 decodeObjectOfClasses:v15 forKey:@"PinnedTabsByProfileUUID"];

  uint64_t v17 = (void *)MEMORY[0x263EFFA08];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v19 = [v17 setWithArray:v18];
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"WindowStatesKey"];

  objc_super v21 = [(WBBrowserState *)self initWithPinnedTabs:v8 privatePinnedTabs:v12 windowStates:v20];
  pinnedTabsByProfileIdentifier = v21->_pinnedTabsByProfileIdentifier;
  v21->_pinnedTabsByProfileIdentifier = (NSDictionary *)v16;

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  pinnedTabs = self->_pinnedTabs;
  id v5 = a3;
  [v5 encodeObject:pinnedTabs forKey:@"PinnedTabs"];
  [v5 encodeObject:self->_privatePinnedTabs forKey:@"PrivatePinnedTabs"];
  [v5 encodeObject:self->_pinnedTabsByProfileIdentifier forKey:@"PinnedTabsByProfileUUID"];
  [v5 encodeObject:self->_windowStates forKey:@"WindowStatesKey"];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WBBrowserState *)self pinnedTabs];
  uint64_t v7 = [v6 count];
  id v8 = [(WBBrowserState *)self privatePinnedTabs];
  uint64_t v9 = [v8 count];
  id v10 = [(WBBrowserState *)self windowStates];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; pinnedTabs = %zu; privatePinnedTabs = %zu; windows = %zu>",
    v5,
    self,
    v7,
    v9,
  v11 = [v10 count]);

  return v11;
}

- (void)setPinnedTabs:(id)a3
{
}

- (void)setPrivatePinnedTabs:(id)a3
{
}

- (NSDictionary)pinnedTabsByProfileIdentifier
{
  return self->_pinnedTabsByProfileIdentifier;
}

- (void)setPinnedTabsByProfileIdentifier:(id)a3
{
}

- (void)setWindowStates:(id)a3
{
}

@end