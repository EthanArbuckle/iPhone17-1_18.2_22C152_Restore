@interface _UITabSidebarContent
+ (id)contentForAction:(id)a3 group:(id)a4;
+ (id)contentForTab:(id)a3;
- (UIAction)action;
- (UITab)tab;
- (UITabGroup)group;
@end

@implementation _UITabSidebarContent

+ (id)contentForTab:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)contentForAction:(id)a3 group:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  v10 = (void *)v7[3];
  v7[3] = v6;

  return v7;
}

- (UITab)tab
{
  return self->_tab;
}

- (UIAction)action
{
  return self->_action;
}

- (UITabGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tab, 0);
}

@end