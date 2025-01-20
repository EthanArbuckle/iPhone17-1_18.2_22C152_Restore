@interface MTSettingsController
- (BOOL)isEnabledForGroupWithIdentifier:(id)a3;
- (MTSettingsControllerDelegate)delegate;
- (NSArray)order;
- (NSDictionary)groups;
- (NSMutableSet)disabledGroups;
- (void)addGroup:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5;
- (void)reloadGroupWithIdentifier:(id)a3;
- (void)removeGroupWithIdentifier:(id)a3;
- (void)removeSettingAtIndex:(unint64_t)a3 fromGroupWithIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisabledGroups:(id)a3;
- (void)setEnabled:(BOOL)a3 forGroupWithIdentifier:(id)a4;
- (void)setGroups:(id)a3;
- (void)setHeaderAction:(id)a3 forGroupWithIdentifier:(id)a4;
- (void)setOrder:(id)a3;
- (void)setValue:(id)a3 forSettingWithIdentifier:(id)a4 inGroup:(id)a5;
@end

@implementation MTSettingsController

- (void)reloadGroupWithIdentifier:(id)a3
{
  id v8 = a3;
  v4 = [(MTSettingsController *)self groups];
  v5 = [v4 objectForKeyedSubscript:v8];

  if (v5)
  {
    v6 = [v5 settingsHandler];

    if (v6) {
      [v5 setGroupSettings:0];
    }
    v7 = [(MTSettingsController *)self delegate];
    [v7 settingsController:self reloadedGroupWithIdentifier:v8];
  }
}

- (BOOL)isEnabledForGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(MTSettingsController *)self disabledGroups];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (void)setEnabled:(BOOL)a3 forGroupWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  if (-[MTSettingsController isEnabledForGroupWithIdentifier:](self, "isEnabledForGroupWithIdentifier:") != v4)
  {
    disabledGroups = self->_disabledGroups;
    if (v4)
    {
      [(NSMutableSet *)disabledGroups removeObject:v11];
    }
    else
    {
      id v7 = v11;
      if (!disabledGroups)
      {
        id v8 = +[NSMutableSet set];
        v9 = self->_disabledGroups;
        self->_disabledGroups = v8;

        id v7 = v11;
        disabledGroups = self->_disabledGroups;
      }
      [(NSMutableSet *)disabledGroups addObject:v7];
    }
    v10 = [(MTSettingsController *)self delegate];
    [v10 settingsController:self reloadedGroupWithIdentifier:v11];
  }
}

- (void)setHeaderAction:(id)a3 forGroupWithIdentifier:(id)a4
{
  groups = self->_groups;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NSDictionary *)groups objectForKeyedSubscript:v7];
  [v10 setHeaderAction:v8];
  v9 = [(MTSettingsController *)self delegate];
  [v9 settingsController:self didChangeHeaderAction:v8 inGroupWithIdentifier:v7];
}

- (void)addGroup:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5
{
  order = self->_order;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(NSArray *)order mutableCopy];
  [v13 insertObject:v9 atIndex:a5];
  [(MTSettingsController *)self setOrder:v13];
  id v11 = [(NSDictionary *)self->_groups mutableCopy];
  [v11 setObject:v10 forKey:v9];

  [(MTSettingsController *)self setGroups:v11];
  v12 = [(MTSettingsController *)self delegate];
  [v12 settingsController:self addedGroup:v10 atIndex:a5];
}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [(NSArray *)self->_order mutableCopy];
  id v5 = [v4 indexOfObject:v9];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    [v4 removeObject:v9];
    [(MTSettingsController *)self setOrder:v4];
    id v7 = [(NSDictionary *)self->_groups mutableCopy];
    [v7 removeObjectForKey:v9];
    [(MTSettingsController *)self setGroups:v7];
    id v8 = [(MTSettingsController *)self delegate];
    [v8 settingsController:self removedGroupAtIndex:v6];
  }
}

- (void)removeSettingAtIndex:(unint64_t)a3 fromGroupWithIdentifier:(id)a4
{
  groups = self->_groups;
  id v7 = a4;
  id v11 = [(NSDictionary *)groups objectForKeyedSubscript:v7];
  id v8 = [v11 groupSettings];
  id v9 = [v8 mutableCopy];

  [v9 removeObjectAtIndex:a3];
  [v11 setGroupSettings:v9];
  id v10 = [(MTSettingsController *)self delegate];
  [v10 settingsController:self removedSettingAtIndex:a3 inGroupWithIdentifier:v7];
}

- (void)setValue:(id)a3 forSettingWithIdentifier:(id)a4 inGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSDictionary *)self->_groups objectForKeyedSubscript:v10];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1000570CC;
  v28 = sub_100057330;
  id v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v12 = [v11 groupSettings];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100129CAC;
  v16[3] = &unk_1005525E8;
  id v13 = v9;
  id v17 = v13;
  v18 = &v24;
  v19 = &v20;
  [v12 enumerateObjectsUsingBlock:v16];

  v14 = (void *)v25[5];
  if (v14)
  {
    [v14 setValue:v8];
    v15 = [(MTSettingsController *)self delegate];
    [v15 settingsController:self didChangeSettingValueAtIndex:v21[3] inGroupWithIdentifier:v10];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
}

- (MTSettingsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTSettingsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)disabledGroups
{
  return self->_disabledGroups;
}

- (void)setDisabledGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_order, 0);

  objc_storeStrong((id *)&self->_groups, 0);
}

@end