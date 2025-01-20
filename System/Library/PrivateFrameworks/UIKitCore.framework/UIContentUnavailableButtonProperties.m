@interface UIContentUnavailableButtonProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (CGSize)minimumSize;
- (UIAction)primaryAction;
- (UIButtonConfiguration)configuration;
- (UIButtonRole)role;
- (UIContentUnavailableButtonProperties)init;
- (UIContentUnavailableButtonProperties)initWithCoder:(id)a3;
- (UIMenu)menu;
- (__CFString)_shortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_hasButton;
- (uint64_t)_isEqualToProperties:(uint64_t)a1;
- (uint64_t)_isEqualToPropertiesQuick:(uint64_t)a1;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1;
- (void)_applyToButton:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setMenu:(UIMenu *)menu;
- (void)setMinimumSize:(CGSize)a3;
- (void)setPrimaryAction:(UIAction *)primaryAction;
- (void)setRole:(UIButtonRole)role;
@end

@implementation UIContentUnavailableButtonProperties

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(UIButtonConfiguration *)self->_configuration copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    uint64_t v7 = [(UIAction *)self->_primaryAction copy];
    v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;

    uint64_t v9 = [(UIMenu *)self->_menu copy];
    v10 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v9;

    *(unsigned char *)(v4 + 12) = self->_enabled;
    *(void *)(v4 + 40) = self->_role;
    *(CGSize *)(v4 + 56) = self->_minimumSize;
    uint64_t v11 = [(UIButtonConfiguration *)self->_defaultConfiguration copy];
    v12 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v11;

    *($E86DFEC0DF05A1DED00CBA946940B8E3 *)(v4 + 8) = self->_buttonFlags;
  }
  return (id)v4;
}

- (UIContentUnavailableButtonProperties)init
{
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v4 = _UIContentUnavailableConstantsForTraitCollection(v3);
  uint64_t v5 = [v4 defaultButtonConfigurationForTraitCollection:v3];
  id v6 = v5;
  if (self)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIContentUnavailableButtonProperties;
    uint64_t v7 = [(UIContentUnavailableButtonProperties *)&v11 init];
    self = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_configuration, v5);
      v8 = (UIButtonConfiguration *)[v6 copy];
      defaultConfiguration = self->_defaultConfiguration;
      self->_defaultConfiguration = v8;

      self->_enabled = 1;
      self->_role = 0;
      self->_minimumSize = (CGSize)*MEMORY[0x1E4F1DB30];
    }
  }

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (uint64_t)_hasButton
{
  if (!a1) {
    return 0;
  }
  id v1 = *(id *)(a1 + 16);
  if (([v1 _hasTitle] & 1) != 0
    || ([v1 _hasSubtitle] & 1) != 0
    || ([v1 _hasImage] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 showsActivityIndicator];
  }

  return v2;
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    uint64_t v9 = v3;
    if ([*(id *)(a1 + 16) isEqual:*(void *)(a1 + 48)])
    {
      if (v9) {
        uint64_t v4 = (void *)*((void *)v9 + 2);
      }
      else {
        uint64_t v4 = 0;
      }
      objc_storeStrong((id *)(a1 + 16), v4);
    }
    char v5 = *(unsigned char *)(a1 + 8);
    v3 = v9;
    if (v5)
    {
      if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v9) {
        BOOL v6 = v9[12] != 0;
      }
      else {
        BOOL v6 = 0;
      }
      *(unsigned char *)(a1 + 12) = v6;
      if ((v5 & 2) != 0)
      {
LABEL_8:
        if ((v5 & 4) != 0) {
          goto LABEL_19;
        }
LABEL_16:
        if (v9) {
          long long v8 = *(_OWORD *)(v9 + 56);
        }
        else {
          long long v8 = 0uLL;
        }
        *(_OWORD *)(a1 + 56) = v8;
        goto LABEL_19;
      }
    }
    if (v9) {
      uint64_t v7 = *((void *)v9 + 5);
    }
    else {
      uint64_t v7 = 0;
    }
    *(void *)(a1 + 40) = v7;
    if ((v5 & 4) != 0) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
LABEL_19:
}

- (uint64_t)_isEqualToProperties:(uint64_t)a1
{
  v3 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  if (-[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](a1, v3))
  {
    a1 = 1;
    goto LABEL_23;
  }
  uint64_t v4 = (void *)*((void *)v3 + 2);
  id v5 = *(id *)(a1 + 16);
  id v6 = v4;
  if (v5 == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    if (!v5 || !v6) {
      goto LABEL_21;
    }
    int v8 = [v5 isEqual:v6];

    if (!v8) {
      goto LABEL_22;
    }
  }
  uint64_t v9 = (void *)*((void *)v3 + 3);
  id v5 = *(id *)(a1 + 24);
  id v10 = v9;
  if (v5 == v10)
  {

    goto LABEL_16;
  }
  uint64_t v7 = v10;
  if (!v5 || !v10)
  {
LABEL_21:

    goto LABEL_22;
  }
  int v11 = [v5 isEqual:v10];

  if (!v11) {
    goto LABEL_22;
  }
LABEL_16:
  v12 = (void *)*((void *)v3 + 4);
  id v5 = *(id *)(a1 + 32);
  id v13 = v12;
  if (v5 == v13)
  {

    goto LABEL_25;
  }
  uint64_t v7 = v13;
  if (!v5 || !v13) {
    goto LABEL_21;
  }
  int v14 = [v5 isEqual:v13];

  if (!v14)
  {
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(unsigned __int8 *)(a1 + 12) != v3[12] || *(void *)(a1 + 40) != *((void *)v3 + 5)) {
    goto LABEL_22;
  }
  a1 = *(double *)(a1 + 64) == *((double *)v3 + 8) && *(double *)(a1 + 56) == *((double *)v3 + 7);
LABEL_23:

  return a1;
}

- (uint64_t)_isEqualToPropertiesQuick:(uint64_t)a1
{
  v3 = a2;
  uint64_t v4 = (double *)v3;
  if (!a1) {
    goto LABEL_23;
  }
  if (v3 == (void *)a1)
  {
    a1 = 1;
    goto LABEL_23;
  }
  id v5 = (void *)v3[2];
  id v6 = *(id *)(a1 + 16);
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    int v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_21;
    }
    int v9 = [v6 isEqual:v7];

    if (!v9) {
      goto LABEL_22;
    }
  }
  id v10 = (void *)*((void *)v4 + 3);
  id v6 = *(id *)(a1 + 24);
  id v11 = v10;
  if (v6 == v11)
  {

    goto LABEL_16;
  }
  int v8 = v11;
  if (!v6 || !v11)
  {
LABEL_21:

    goto LABEL_22;
  }
  int v12 = [v6 isEqual:v11];

  if (!v12) {
    goto LABEL_22;
  }
LABEL_16:
  id v13 = (void *)*((void *)v4 + 4);
  id v6 = *(id *)(a1 + 32);
  id v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_25;
  }
  int v8 = v14;
  if (!v6 || !v14) {
    goto LABEL_21;
  }
  int v15 = [v6 isEqual:v14];

  if (!v15)
  {
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v4 + 12) || *(void *)(a1 + 40) != *((void *)v4 + 5)) {
    goto LABEL_22;
  }
  a1 = *(double *)(a1 + 64) == v4[8] && *(double *)(a1 + 56) == v4[7];
LABEL_23:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableButtonProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UIContentUnavailableButtonProperties;
  id v5 = [(UIContentUnavailableButtonProperties *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (UIButtonConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAction"];
    primaryAction = v5->_primaryAction;
    v5->_primaryAction = (UIAction *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"menu"];
    menu = v5->_menu;
    v5->_menu = (UIMenu *)v10;

    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v5->_role = [v4 decodeIntegerForKey:@"role"];
    [v4 decodeCGSizeForKey:@"minimumSize"];
    v5->_minimumSize.width = v12;
    v5->_minimumSize.height = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultConfiguration"];
    defaultConfiguration = v5->_defaultConfiguration;
    v5->_defaultConfiguration = (UIButtonConfiguration *)v14;

    v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"enabled"];
    *(unsigned char *)&v5->_buttonFlags = *(unsigned char *)&v5->_buttonFlags & 0xFE | [v4 decodeBoolForKey:v16];

    v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"role"];
    if ([v4 decodeBoolForKey:v17]) {
      char v18 = 2;
    }
    else {
      char v18 = 0;
    }
    *(unsigned char *)&v5->_buttonFlags = *(unsigned char *)&v5->_buttonFlags & 0xFD | v18;

    v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumSize"];
    if ([v4 decodeBoolForKey:v19]) {
      char v20 = 4;
    }
    else {
      char v20 = 0;
    }
    *(unsigned char *)&v5->_buttonFlags = *(unsigned char *)&v5->_buttonFlags & 0xFB | v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [v5 encodeObject:configuration forKey:@"configuration"];
  [v5 encodeObject:self->_primaryAction forKey:@"primaryAction"];
  [v5 encodeObject:self->_menu forKey:@"menu"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
  [v5 encodeInteger:self->_role forKey:@"role"];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"minimumSize", self->_minimumSize.width, self->_minimumSize.height);
  [v5 encodeObject:self->_defaultConfiguration forKey:@"_defaultConfiguration"];
  uint64_t v6 = *(unsigned char *)&self->_buttonFlags & 1;
  id v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"enabled"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_buttonFlags >> 1) & 1;
  int v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"role"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(unsigned char *)&self->_buttonFlags >> 2) & 1;
  id v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumSize"];
  [v5 encodeBool:v10 forKey:v11];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIContentUnavailableButtonProperties *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self, v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIButtonConfiguration *)self->_configuration hash];
  return [(UIAction *)self->_primaryAction hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  id v5 = [(UIButtonConfiguration *)self->_configuration description];
  char v6 = [v4 stringWithFormat:@"configuration = %@", v5];
  [v3 addObject:v6];

  primaryAction = self->_primaryAction;
  if (primaryAction)
  {
    uint64_t v8 = NSString;
    int v9 = [(UIAction *)primaryAction description];
    uint64_t v10 = [v8 stringWithFormat:@"primaryAction = %@", v9];
    [v3 addObject:v10];
  }
  menu = self->_menu;
  if (menu)
  {
    CGFloat v12 = NSString;
    CGFloat v13 = [(UIMenu *)menu description];
    uint64_t v14 = [v12 stringWithFormat:@"menu = %@", v13];
    [v3 addObject:v14];
  }
  if (!self->_enabled) {
    [v3 addObject:@"enabled = NO"];
  }
  unint64_t role = self->_role;
  if (role <= 3) {
    [v3 addObject:off_1E52ED180[role]];
  }
  CGFloat width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  if (*MEMORY[0x1E4F1DB30] != width || *(double *)(MEMORY[0x1E4F1DB30] + 8) != height)
  {
    v19 = NSString;
    char v20 = NSStringFromCGSize(*(CGSize *)&width);
    v21 = [v19 stringWithFormat:@"minimumSize = %@", v20];
    [v3 addObject:v21];
  }
  if ([v3 count])
  {
    objc_super v22 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    objc_super v22 = @"none";
  }
  v23 = NSString;
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v26 = [v23 stringWithFormat:@"<%@: %p; %@>", v25, self, v22];

  return v26;
}

- (__CFString)_shortDescription
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (-[UIContentUnavailableButtonProperties _hasButton]((uint64_t)a1))
    {
      a1 = [v2->data description];
    }
    else
    {
      a1 = @"none";
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_applyToButton:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    [v3 setConfiguration:*(void *)(a1 + 16)];
    [v6 removeTarget:0 action:0 forControlEvents:0x2000];
    uint64_t v4 = *(void *)(a1 + 24);
    if (v4) {
      [v6 addAction:v4 forControlEvents:0x2000];
    }
    [v6 setMenu:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32)) {
      BOOL v5 = *(void *)(a1 + 24) == 0;
    }
    else {
      BOOL v5 = 0;
    }
    [v6 setShowsMenuAsPrimaryAction:v5];
    [v6 setEnabled:*(unsigned __int8 *)(a1 + 12)];
    [v6 setRole:*(void *)(a1 + 40)];
    id v3 = v6;
  }
}

- (void)setConfiguration:(id)a3
{
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setPrimaryAction:(UIAction *)primaryAction
{
  if (self) {
    objc_setProperty_nonatomic_copy(self, a2, primaryAction, 24);
  }
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (void)setMenu:(UIMenu *)menu
{
  if (self) {
    objc_setProperty_nonatomic_copy(self, a2, menu, 32);
  }
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setEnabled:(BOOL)enabled
{
  *(unsigned char *)&self->_buttonFlags |= 1u;
  self->_enabled = enabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setRole:(UIButtonRole)role
{
  *(unsigned char *)&self->_buttonFlags |= 2u;
  self->_unint64_t role = role;
}

- (UIButtonRole)role
{
  return self->_role;
}

- (void)setMinimumSize:(CGSize)a3
{
  *(unsigned char *)&self->_buttonFlags |= 4u;
  self->_minimumSize = a3;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end