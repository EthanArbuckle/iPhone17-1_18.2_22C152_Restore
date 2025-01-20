@interface SBSwitcherModelRemovalResults
- (BOOL)willHideDisplayItem:(id)a3;
- (NSArray)appLayouts;
- (SBSwitcherModelRemovalResults)init;
- (id)replacementAppLayoutForAppLayout:(id)a3;
- (void)executeActionForAppLayout:(id)a3;
- (void)removeAppLayout:(id)a3;
- (void)setAction:(id)a3 forAppLayout:(id)a4;
- (void)setHide:(BOOL)a3 forDisplayItem:(id)a4;
- (void)setReplacementAppLayout:(id)a3 forAppLayout:(id)a4;
@end

@implementation SBSwitcherModelRemovalResults

- (SBSwitcherModelRemovalResults)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherModelRemovalResults;
  v2 = [(SBSwitcherModelRemovalResults *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    appLayouts = v2->_appLayouts;
    v2->_appLayouts = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    appLayoutToAction = v2->_appLayoutToAction;
    v2->_appLayoutToAction = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    displayItemToHide = v2->_displayItemToHide;
    v2->_displayItemToHide = (NSMutableDictionary *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    appLayoutToReplacement = v2->_appLayoutToReplacement;
    v2->_appLayoutToReplacement = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (NSArray)appLayouts
{
  return (NSArray *)[(NSMutableSet *)self->_appLayouts allObjects];
}

- (void)setAction:(id)a3 forAppLayout:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSwitcherModelRemovalResults.m", 40, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  appLayoutToAction = self->_appLayoutToAction;
  uint64_t v9 = (void *)MEMORY[0x1D948C7A0]();
  [(NSMutableDictionary *)appLayoutToAction setObject:v9 forKey:v7];

  [(NSMutableSet *)self->_appLayouts addObject:v7];
}

- (void)removeAppLayout:(id)a3
{
}

- (void)setHide:(BOOL)a3 forDisplayItem:(id)a4
{
  BOOL v4 = a3;
  displayItemToHide = self->_displayItemToHide;
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)displayItemToHide setObject:v8 forKey:v7];
}

- (void)setReplacementAppLayout:(id)a3 forAppLayout:(id)a4
{
}

- (void)executeActionForAppLayout:(id)a3
{
  id v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_appLayoutToAction, "objectForKey:");
  BOOL v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [(NSMutableDictionary *)self->_appLayoutToAction removeObjectForKey:v5];
    v4[2](v4);
  }
}

- (BOOL)willHideDisplayItem:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_displayItemToHide objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)replacementAppLayoutForAppLayout:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_appLayoutToReplacement objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutToReplacement, 0);
  objc_storeStrong((id *)&self->_displayItemToHide, 0);
  objc_storeStrong((id *)&self->_appLayoutToAction, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
}

@end