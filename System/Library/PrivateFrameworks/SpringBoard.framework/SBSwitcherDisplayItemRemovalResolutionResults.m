@interface SBSwitcherDisplayItemRemovalResolutionResults
- (NSArray)displayItems;
- (id)actionsForDisplayItem:(id)a3;
- (void)setActions:(id)a3 forDisplayItem:(id)a4;
@end

@implementation SBSwitcherDisplayItemRemovalResolutionResults

- (NSArray)displayItems
{
  return (NSArray *)[(NSMutableDictionary *)self->_displayItemToActions allKeys];
}

- (id)actionsForDisplayItem:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_displayItemToActions objectForKey:a3];
}

- (void)setActions:(id)a3 forDisplayItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  displayItemToActions = self->_displayItemToActions;
  if (v13)
  {
    if (!displayItemToActions)
    {
      v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      v11 = self->_displayItemToActions;
      self->_displayItemToActions = v10;

      id v7 = v13;
      displayItemToActions = self->_displayItemToActions;
    }
    [(NSMutableDictionary *)displayItemToActions setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)displayItemToActions removeObjectForKey:v8];
    if (![(NSMutableDictionary *)self->_displayItemToActions count])
    {
      v12 = self->_displayItemToActions;
      self->_displayItemToActions = 0;
    }
  }
}

- (void).cxx_destruct
{
}

@end