@interface SBHFocusMode
- (BOOL)customizedHomeScreenPagesEnabled;
- (BOOL)hidesOnlyDeniedApplicationBadges;
- (BOOL)isSleepFocus;
- (BOOL)showsOnlyAllowedApplicationBadges;
- (BOOL)wantsListVisible:(id)a3;
- (NSArray)lists;
- (NSMutableSet)allowedApplicationBundleIdentifiers;
- (NSMutableSet)deniedApplicationBundleIdentifiers;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)symbol;
- (SBFolder)folder;
- (SBHFocusMode)initWithIdentifier:(id)a3 folder:(id)a4;
- (SBIconListModel)dockList;
- (UIColor)color;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)source;
- (void)addToList:(id)a3;
- (void)removeFromList:(id)a3;
- (void)setAllowedApplicationBundleIdentifiers:(id)a3;
- (void)setColor:(id)a3;
- (void)setDeniedApplicationBundleIdentifiers:(id)a3;
- (void)setDockList:(id)a3;
- (void)setFolder:(id)a3;
- (void)setHidesOnlyDeniedApplicationBadges:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShowsOnlyAllowedApplicationBadges:(BOOL)a3;
- (void)setSleepFocus:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setSymbol:(id)a3;
@end

@implementation SBHFocusMode

- (SBHFocusMode)initWithIdentifier:(id)a3 folder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHFocusMode;
    v9 = [(SBHFocusMode *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, a3);
      objc_storeStrong(p_isa + 10, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)customizedHomeScreenPagesEnabled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHFocusMode *)self folder];
  [v3 lists];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[SBHFocusMode wantsListVisible:](self, "wantsListVisible:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)addToList:(id)a3
{
  id v4 = a3;
  id v7 = [v4 focusModeIdentifiers];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
  uint64_t v6 = [(SBHFocusMode *)self identifier];
  [v5 addObject:v6];

  [v4 setFocusModeIdentifiers:v5];
}

- (void)removeFromList:(id)a3
{
  id v4 = a3;
  id v7 = [v4 focusModeIdentifiers];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
  uint64_t v6 = [(SBHFocusMode *)self identifier];
  [v5 removeObject:v6];

  [v4 setFocusModeIdentifiers:v5];
}

- (BOOL)wantsListVisible:(id)a3
{
  id v4 = [a3 focusModeIdentifiers];
  uint64_t v5 = [(SBHFocusMode *)self identifier];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (NSArray)lists
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHFocusMode *)self folder];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v3, "lists", 0);
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
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(SBHFocusMode *)self wantsListVisible:v10]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSString)description
{
  return (NSString *)[(SBHFocusMode *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHFocusMode *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHFocusMode *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHFocusMode *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBHFocusMode *)self identifier];
  [v4 appendString:v5 withName:@"identifier"];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isSleepFocus
{
  return self->_sleepFocus;
}

- (void)setSleepFocus:(BOOL)a3
{
  self->_sleepFocus = a3;
}

- (BOOL)showsOnlyAllowedApplicationBadges
{
  return self->_showsOnlyAllowedApplicationBadges;
}

- (void)setShowsOnlyAllowedApplicationBadges:(BOOL)a3
{
  self->_showsOnlyAllowedApplicationBadges = a3;
}

- (BOOL)hidesOnlyDeniedApplicationBadges
{
  return self->_hidesOnlyDeniedApplicationBadges;
}

- (void)setHidesOnlyDeniedApplicationBadges:(BOOL)a3
{
  self->_hidesOnlyDeniedApplicationBadges = a3;
}

- (NSMutableSet)allowedApplicationBundleIdentifiers
{
  return self->_allowedApplicationBundleIdentifiers;
}

- (void)setAllowedApplicationBundleIdentifiers:(id)a3
{
}

- (NSMutableSet)deniedApplicationBundleIdentifiers
{
  return self->_deniedApplicationBundleIdentifiers;
}

- (void)setDeniedApplicationBundleIdentifiers:(id)a3
{
}

- (SBIconListModel)dockList
{
  return self->_dockList;
}

- (void)setDockList:(id)a3
{
}

- (SBFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_dockList, 0);
  objc_storeStrong((id *)&self->_deniedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end