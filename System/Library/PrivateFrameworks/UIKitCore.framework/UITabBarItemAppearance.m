@interface UITabBarItemAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UITabBarAppearance)_owningAppearance;
- (UITabBarItemAppearance)copy;
- (UITabBarItemAppearance)init;
- (UITabBarItemAppearance)initWithCoder:(NSCoder *)coder;
- (UITabBarItemAppearance)initWithStyle:(UITabBarItemAppearanceStyle)style;
- (UITabBarItemAppearance)initWithTabBarItemAppearance:(id)a3;
- (UITabBarItemStateAppearance)disabled;
- (UITabBarItemStateAppearance)focused;
- (UITabBarItemStateAppearance)highlighted;
- (UITabBarItemStateAppearance)normal;
- (UITabBarItemStateAppearance)selected;
- (_UITabBarItemData)_data;
- (id)_initWithTabBarItemData:(id)a3;
- (id)_proxyForState:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_describeInto:(id)a3;
- (void)_setData:(id)a3;
- (void)_setOwningAppearance:(id)a3;
- (void)_updateDataTo:(id)a3;
- (void)_writeToStorage:(id)a3;
- (void)configureWithDefaultForStyle:(UITabBarItemAppearanceStyle)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITabBarItemAppearance

- (void)dealloc
{
  for (uint64_t i = 8; i != 48; i += 8)
    [*(id *)((char *)&self->super.isa + i) _clearOwner];
  v4.receiver = self;
  v4.super_class = (Class)UITabBarItemAppearance;
  [(UITabBarItemAppearance *)&v4 dealloc];
}

- (_UITabBarItemData)_data
{
  return (_UITabBarItemData *)[(_UIBarAppearanceData *)self->_data markReadOnly];
}

- (id)_initWithTabBarItemData:(id)a3
{
  id v4 = a3;
  v5 = [(UITabBarItemAppearance *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->_data;
    v5->_data = (_UITabBarItemData *)v6;
  }
  return v5;
}

- (UITabBarItemAppearance)init
{
  return [(UITabBarItemAppearance *)self initWithStyle:0];
}

- (UITabBarItemAppearance)initWithStyle:(UITabBarItemAppearanceStyle)style
{
  v8.receiver = self;
  v8.super_class = (Class)UITabBarItemAppearance;
  id v4 = [(UITabBarItemAppearance *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[_UITabBarItemData standardItemDataForStyle:style];
    data = v4->_data;
    v4->_data = (_UITabBarItemData *)v5;
  }
  return v4;
}

- (void)_setOwningAppearance:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UITabBarItemAppearance *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && [(UITabBarItemAppearance *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v6 = [p_isa[6] isEqual:self->_data];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningAppearance);
  objc_storeStrong((id *)&self->_data, 0);
  uint64_t v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (UITabBarItemStateAppearance)selected
{
  return (UITabBarItemStateAppearance *)[(UITabBarItemAppearance *)self _proxyForState:2];
}

- (UITabBarItemStateAppearance)normal
{
  return (UITabBarItemStateAppearance *)[(UITabBarItemAppearance *)self _proxyForState:0];
}

- (void)_writeToStorage:(id)a3
{
  data = self->_data;
  uint64_t v5 = (void (**)(void))a3;
  char v6 = [(_UIBarAppearanceData *)data writableInstance];
  [(UITabBarItemAppearance *)self _updateDataTo:v6];

  v5[2](v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningAppearance);
  [WeakRetained _tabBarItemDataChanged:self];
}

- (void)_updateDataTo:(id)a3
{
  uint64_t v5 = (_UITabBarItemData *)a3;
  data = self->_data;
  if (data != v5)
  {
    v9 = v5;
    v7 = data;
    objc_storeStrong((id *)&self->_data, a3);
    for (uint64_t i = 8; i != 48; i += 8)
      [*(id *)((char *)&self->super.isa + i) _setData:self->_data];

    uint64_t v5 = v9;
  }
}

- (id)_proxyForState:(int64_t)a3
{
  states = self->_states;
  uint64_t v5 = self->_states[a3];
  if (!v5)
  {
    v7 = [[UITabBarItemStateAppearance alloc] _initWithOwner:self data:self->_data state:a3];
    objc_super v8 = states[a3];
    states[a3] = v7;

    uint64_t v5 = states[a3];
  }
  return v5;
}

- (UITabBarItemAppearance)initWithTabBarItemAppearance:(id)a3
{
  return (UITabBarItemAppearance *)[(UITabBarItemAppearance *)self _initWithTabBarItemData:*((void *)a3 + 6)];
}

- (UITabBarItemAppearance)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UITabBarItemAppearance;
  uint64_t v5 = [(UITabBarItemAppearance *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[_UITabBarItemData decodeFromCoder:v4 prefix:0];
    data = v5->_data;
    v5->_data = (_UITabBarItemData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITabBarItemAppearance)copy
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBarItemAppearance;
  return [(UITabBarItemAppearance *)&v3 copy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithTabBarItemAppearance:self];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UITabBarItemAppearance;
  objc_super v3 = [(UITabBarItemAppearance *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(UITabBarItemAppearance *)self _describeInto:v4];
  return v4;
}

- (unint64_t)hash
{
  return [(_UIBarAppearanceData *)self->_data hash];
}

- (void)_describeInto:(id)a3
{
}

- (UITabBarItemStateAppearance)highlighted
{
  return (UITabBarItemStateAppearance *)[(UITabBarItemAppearance *)self _proxyForState:1];
}

- (UITabBarItemStateAppearance)disabled
{
  return (UITabBarItemStateAppearance *)[(UITabBarItemAppearance *)self _proxyForState:3];
}

- (UITabBarItemStateAppearance)focused
{
  return (UITabBarItemStateAppearance *)[(UITabBarItemAppearance *)self _proxyForState:4];
}

- (void)configureWithDefaultForStyle:(UITabBarItemAppearanceStyle)style
{
  id v4 = +[_UITabBarItemData standardItemDataForStyle:style];
  [(UITabBarItemAppearance *)self _updateDataTo:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningAppearance);
  [WeakRetained _tabBarItemDataChanged:self];
}

- (void)_setData:(id)a3
{
}

- (UITabBarAppearance)_owningAppearance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningAppearance);
  return (UITabBarAppearance *)WeakRetained;
}

@end