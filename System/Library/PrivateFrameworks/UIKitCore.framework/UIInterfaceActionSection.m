@interface UIInterfaceActionSection
+ (id)actionsFromSections:(id)a3;
- (NSArray)actions;
- (NSString)sectionID;
- (UIInterfaceActionSection)initWithActions:(id)a3;
- (id)copyOfActions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation UIInterfaceActionSection

+ (id)actionsFromSections:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "actions", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (UIInterfaceActionSection)initWithActions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIInterfaceActionSection;
  id v5 = [(UIInterfaceActionSection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v9;
  }
  return v5;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)UIInterfaceActionSection;
  id v4 = [(UIInterfaceActionSection *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: actions=%@", v4, self->_actions];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UIInterfaceActionSection alloc];
  id v5 = [(UIInterfaceActionSection *)self copyOfActions];
  uint64_t v6 = [(UIInterfaceActionSection *)v4 initWithActions:v5];

  return v6;
}

- (id)copyOfActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(UIInterfaceActionSection *)self actions];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(UIInterfaceActionSection *)self actions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copy];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end