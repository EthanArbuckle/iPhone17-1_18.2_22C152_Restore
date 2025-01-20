@interface UITabBarItemStateAppearance
- (NSArray)itemEffects;
- (NSDictionary)badgeTextAttributes;
- (NSDictionary)titleTextAttributes;
- (UIColor)badgeBackgroundColor;
- (UIColor)iconColor;
- (UIOffset)badgePositionAdjustment;
- (UIOffset)badgeTitlePositionAdjustment;
- (UIOffset)titlePositionAdjustment;
- (UITabBarItemStateAppearance)init;
- (_UITabBarItemData)_data;
- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5;
- (void)_clearOwner;
- (void)_setData:(id)a3;
- (void)_writeToStorage:(id)a3;
- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor;
- (void)setBadgePositionAdjustment:(UIOffset)badgePositionAdjustment;
- (void)setBadgeTextAttributes:(NSDictionary *)badgeTextAttributes;
- (void)setBadgeTitlePositionAdjustment:(UIOffset)badgeTitlePositionAdjustment;
- (void)setIconColor:(UIColor *)iconColor;
- (void)setItemEffects:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment;
- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes;
@end

@implementation UITabBarItemStateAppearance

- (void)_clearOwner
{
  self->_owner = 0;
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  v4 = titleTextAttributes;
  if (![(NSDictionary *)v4 count])
  {

    v4 = 0;
  }
  v5 = [(_UITabBarItemData *)self->_data titleTextAttributesForState:self->_state];
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      char v9 = [(NSDictionary *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__UITabBarItemStateAppearance_setTitleTextAttributes___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_11:
}

- (void)setIconColor:(UIColor *)iconColor
{
  v4 = iconColor;
  v5 = [(_UITabBarItemData *)self->_data iconColorForState:self->_state];
  v6 = v4;
  v7 = v5;
  if (v7 == v6)
  {
  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      BOOL v9 = [(UIColor *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__UITabBarItemStateAppearance_setIconColor___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_9:
}

- (void)_writeToStorage:(id)a3
{
  owner = self->_owner;
  if (owner)
  {
    [(UITabBarItemAppearance *)owner _writeToStorage:a3];
  }
  else
  {
    data = self->_data;
    v6 = (void (**)(id))a3;
    v7 = [(_UIBarAppearanceData *)data writableInstance];
    v8 = self->_data;
    self->_data = v7;

    v6[2](v6);
  }
}

uint64_t __54__UITabBarItemStateAppearance_setTitleTextAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setTitleTextAttributes:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

uint64_t __44__UITabBarItemStateAppearance_setIconColor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setIconColor:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_setData:(id)a3
{
}

- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5
{
  v8 = (UITabBarItemAppearance *)a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITabBarItemStateAppearance;
  v10 = [(UITabBarItemStateAppearance *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_owner = v8;
    objc_storeStrong((id *)&v10->_data, a4);
    v11->_state = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEffects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (UITabBarItemStateAppearance)init
{
  return 0;
}

- (NSDictionary)titleTextAttributes
{
  return (NSDictionary *)[(_UITabBarItemData *)self->_data titleTextAttributesForState:self->_state];
}

- (UIOffset)titlePositionAdjustment
{
  [(_UITabBarItemData *)self->_data titlePositionAdjustmentForState:self->_state];
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical = titlePositionAdjustment.vertical;
  double horizontal = titlePositionAdjustment.horizontal;
  [(_UITabBarItemData *)self->_data titlePositionAdjustmentForState:self->_state];
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__UITabBarItemStateAppearance_setTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E52DD178;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v9];
  }
}

uint64_t __58__UITabBarItemStateAppearance_setTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setTitlePositionAdjustment:forState:", *(void *)(*(void *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIColor)iconColor
{
  return (UIColor *)[(_UITabBarItemData *)self->_data iconColorForState:self->_state];
}

- (NSDictionary)badgeTextAttributes
{
  return (NSDictionary *)[(_UITabBarItemData *)self->_data badgeTextAttributesForState:self->_state];
}

- (void)setBadgeTextAttributes:(NSDictionary *)badgeTextAttributes
{
  v4 = badgeTextAttributes;
  if (![(NSDictionary *)v4 count])
  {

    v4 = 0;
  }
  v5 = [(_UITabBarItemData *)self->_data badgeTextAttributesForState:self->_state];
  double v6 = v4;
  double v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      char v9 = [(NSDictionary *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__UITabBarItemStateAppearance_setBadgeTextAttributes___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_11:
}

uint64_t __54__UITabBarItemStateAppearance_setBadgeTextAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setBadgeTextAttributes:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (UIOffset)badgeTitlePositionAdjustment
{
  [(_UITabBarItemData *)self->_data badgeTitlePositionAdjustmentForState:self->_state];
  result.double vertical = v3;
  result.double horizontal = v2;
  return result;
}

- (void)setBadgeTitlePositionAdjustment:(UIOffset)badgeTitlePositionAdjustment
{
  double vertical = badgeTitlePositionAdjustment.vertical;
  double horizontal = badgeTitlePositionAdjustment.horizontal;
  [(_UITabBarItemData *)self->_data badgeTitlePositionAdjustmentForState:self->_state];
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__UITabBarItemStateAppearance_setBadgeTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E52DD178;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v9];
  }
}

uint64_t __63__UITabBarItemStateAppearance_setBadgeTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setBadgeTitlePositionAdjustment:forState:", *(void *)(*(void *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIColor)badgeBackgroundColor
{
  return (UIColor *)[(_UITabBarItemData *)self->_data badgeBackgroundColorForState:self->_state];
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor
{
  v4 = badgeBackgroundColor;
  v5 = [(_UITabBarItemData *)self->_data badgeBackgroundColorForState:self->_state];
  double v6 = v4;
  double v7 = v5;
  if (v7 == v6)
  {
  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      BOOL v9 = [(UIColor *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__UITabBarItemStateAppearance_setBadgeBackgroundColor___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_9:
}

uint64_t __55__UITabBarItemStateAppearance_setBadgeBackgroundColor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setBadgeBackgroundColor:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (UIOffset)badgePositionAdjustment
{
  [(_UITabBarItemData *)self->_data badgePositionAdjustmentForState:self->_state];
  result.double vertical = v3;
  result.double horizontal = v2;
  return result;
}

- (void)setBadgePositionAdjustment:(UIOffset)badgePositionAdjustment
{
  double vertical = badgePositionAdjustment.vertical;
  double horizontal = badgePositionAdjustment.horizontal;
  [(_UITabBarItemData *)self->_data badgePositionAdjustmentForState:self->_state];
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__UITabBarItemStateAppearance_setBadgePositionAdjustment___block_invoke;
    v9[3] = &unk_1E52DD178;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    [(UITabBarItemStateAppearance *)self _writeToStorage:v9];
  }
}

uint64_t __58__UITabBarItemStateAppearance_setBadgePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setBadgePositionAdjustment:forState:", *(void *)(*(void *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (_UITabBarItemData)_data
{
  return self->_data;
}

- (NSArray)itemEffects
{
  return self->_itemEffects;
}

- (void)setItemEffects:(id)a3
{
}

@end