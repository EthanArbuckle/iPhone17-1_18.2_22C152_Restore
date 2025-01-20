@interface UICellAccessoryPopUpMenu
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UICellAccessoryPopUpMenu)initWithCoder:(NSCoder *)coder;
- (UICellAccessoryPopUpMenu)initWithMenu:(UIMenu *)menu;
- (UIMenu)_internalMenu;
- (UIMenu)menu;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)selectedElementDidChangeHandler;
- (void)setSelectedElementDidChangeHandler:(void *)selectedElementDidChangeHandler;
@end

@implementation UICellAccessoryPopUpMenu

- (UICellAccessoryPopUpMenu)initWithMenu:(UIMenu *)menu
{
  v5 = menu;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UICellAccessory.m", 641, @"Invalid parameter not satisfying: %@", @"menu != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UICellAccessoryPopUpMenu;
  v6 = [(UICellAccessory *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [(UIMenu *)v5 copy];
    v8 = v6->_menu;
    v6->_menu = (UIMenu *)v7;

    [(UICellAccessory *)v6 setReservedLayoutWidth:0.0];
  }

  return v6;
}

- (UIMenu)menu
{
  v2 = (void *)[(UIMenu *)self->_menu copy];
  return (UIMenu *)v2;
}

- (UIMenu)_internalMenu
{
  return self->_menu;
}

- (int64_t)_systemType
{
  return 10;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 204;
}

- (id)_identifier
{
  return @"PopUpMenu";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryPopUpMenu)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"menu"];
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)UICellAccessoryPopUpMenu;
    v6 = [(UICellAccessory *)&v9 initWithCoder:v4];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_menu, v5);
    }
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryPopUpMenu;
  id v4 = a3;
  [(UICellAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_menu, @"menu", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UICellAccessoryPopUpMenu;
  id v4 = [(UICellAccessory *)&v10 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(UIMenu *)self->_menu copy];
    v6 = (void *)v4[6];
    v4[6] = v5;

    uint64_t v7 = [self->_selectedElementDidChangeHandler copy];
    v8 = (void *)v4[7];
    v4[7] = v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UICellAccessoryPopUpMenu;
  if ([(UICellAccessory *)&v14 isEqual:v4])
  {
    uint64_t v5 = v4;
    v6 = (void *)v5[6];
    uint64_t v7 = self->_menu;
    v8 = v6;
    if (v7 != v8)
    {
      objc_super v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
      }
      else
      {
        BOOL v12 = [(UIMenu *)v7 isEqual:v8];

        if (v12) {
          goto LABEL_12;
        }
      }
      BOOL v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    BOOL v11 = self->_selectedElementDidChangeHandler == (id)v5[7];
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryPopUpMenu;
  return [(UICellAccessory *)&v4 _canDirectlyUpdateExistingAccessoryViewFrom:a3];
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryPopUpMenu;
  unint64_t v3 = [(UICellAccessory *)&v5 hash];
  return [(UIMenu *)self->_menu hash] ^ v3;
}

- (void)selectedElementDidChangeHandler
{
  return self->_selectedElementDidChangeHandler;
}

- (void)setSelectedElementDidChangeHandler:(void *)selectedElementDidChangeHandler
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedElementDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end