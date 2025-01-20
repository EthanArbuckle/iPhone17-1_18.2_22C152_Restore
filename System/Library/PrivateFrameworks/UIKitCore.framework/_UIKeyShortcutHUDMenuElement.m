@interface _UIKeyShortcutHUDMenuElement
+ (BOOL)supportsSecureCoding;
+ (id)elementWithUIMenuElement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (UIMenuElement)uiMenuElement;
- (_UIKeyShortcutHUDMenuElement)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIKeyShortcutHUDMenuElement

+ (id)elementWithUIMenuElement:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (NSString)title
{
  v2 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];
  id v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  v2 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];
  id v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDMenuElement;
  id v3 = [(_UIKeyShortcutHUDMenuElement *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];

  if (v5)
  {
    v6 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];
    [v4 appendFormat:@": %@", v6];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIKeyShortcutHUDMenuElement *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];
      v7 = [(_UIKeyShortcutHUDMenuElement *)v5 uiMenuElement];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(UIMenuElement *)self->_uiMenuElement hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyShortcutHUDMenuElement *)self uiMenuElement];
  [v4 encodeObject:v5 forKey:@"menuElement"];
}

- (_UIKeyShortcutHUDMenuElement)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyShortcutHUDMenuElement *)self init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"menuElement"];
    uiMenuElement = v5->_uiMenuElement;
    v5->_uiMenuElement = (UIMenuElement *)v7;
  }
  return v5;
}

- (UIMenuElement)uiMenuElement
{
  return self->_uiMenuElement;
}

- (void).cxx_destruct
{
}

@end