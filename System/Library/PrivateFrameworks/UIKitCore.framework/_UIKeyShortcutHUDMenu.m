@interface _UIKeyShortcutHUDMenu
+ (BOOL)supportsSecureCoding;
+ (_UIKeyShortcutHUDMenu)menuWithUIMenu:(id)a3 children:(id)a4;
- (BOOL)isEmpty;
- (NSArray)children;
- (_UIKeyShortcutHUDMenu)init;
- (_UIKeyShortcutHUDMenu)initWithCoder:(id)a3;
- (id)menuByReplacingChildren:(id)a3;
- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIKeyShortcutHUDMenu

+ (_UIKeyShortcutHUDMenu)menuWithUIMenu:(id)a3 children:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) uiMenuElement];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  v15 = [v6 menuByReplacingChildren:v8];

  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____UIKeyShortcutHUDMenu;
  v16 = objc_msgSendSuper2(&v19, sel_elementWithUIMenuElement_, v15);
  v17 = (void *)v16[2];
  v16[2] = v9;

  return (_UIKeyShortcutHUDMenu *)v16;
}

- (_UIKeyShortcutHUDMenu)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDMenu;
  v2 = [(_UIKeyShortcutHUDMenu *)&v6 init];
  v3 = v2;
  if (v2)
  {
    children = v2->_children;
    v2->_children = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(_UIKeyShortcutHUDMenu *)self children];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)menuByReplacingChildren:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyShortcutHUDMenu *)self uiMenu];
  objc_super v6 = +[_UIKeyShortcutHUDMenu menuWithUIMenu:v5 children:v4];

  return v6;
}

- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4
{
  if (a3) {
    (*((void (**)(id, _UIKeyShortcutHUDMenu *))a3 + 2))(a3, self);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDMenu;
  id v4 = a3;
  [(_UIKeyShortcutHUDMenuElement *)&v6 encodeWithCoder:v4];
  v5 = [(_UIKeyShortcutHUDMenu *)self children];
  [v4 encodeObject:v5 forKey:@"children"];
}

- (_UIKeyShortcutHUDMenu)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyShortcutHUDMenu;
  v5 = [(_UIKeyShortcutHUDMenuElement *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = self;
    v8 = self;
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"children"];
    children = v5->_children;
    v5->_children = (NSArray *)v10;
  }
  return v5;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
}

@end