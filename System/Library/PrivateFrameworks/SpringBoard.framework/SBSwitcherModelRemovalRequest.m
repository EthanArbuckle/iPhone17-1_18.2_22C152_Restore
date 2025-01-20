@interface SBSwitcherModelRemovalRequest
- (NSArray)appLayouts;
- (id)actionForAppLayout:(id)a3;
- (void)setAction:(id)a3 forAppLayout:(id)a4;
@end

@implementation SBSwitcherModelRemovalRequest

- (NSArray)appLayouts
{
  return (NSArray *)[(NSMutableDictionary *)self->_appLayoutToAction allKeys];
}

- (id)actionForAppLayout:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_appLayoutToAction objectForKey:a3];
}

- (void)setAction:(id)a3 forAppLayout:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  appLayoutToAction = self->_appLayoutToAction;
  if (v13)
  {
    if (!appLayoutToAction)
    {
      v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      v11 = self->_appLayoutToAction;
      self->_appLayoutToAction = v10;

      id v7 = v13;
      appLayoutToAction = self->_appLayoutToAction;
    }
    [(NSMutableDictionary *)appLayoutToAction setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)appLayoutToAction removeObjectForKey:v8];
    if (![(NSMutableDictionary *)self->_appLayoutToAction count])
    {
      v12 = self->_appLayoutToAction;
      self->_appLayoutToAction = 0;
    }
  }
}

- (void).cxx_destruct
{
}

@end