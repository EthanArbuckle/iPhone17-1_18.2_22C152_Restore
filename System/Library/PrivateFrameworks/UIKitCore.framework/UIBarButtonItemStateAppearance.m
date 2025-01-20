@interface UIBarButtonItemStateAppearance
- (NSArray)itemEffects;
- (NSDictionary)titleTextAttributes;
- (UIBarButtonItemStateAppearance)init;
- (UIImage)backgroundImage;
- (UIOffset)backgroundImagePositionAdjustment;
- (UIOffset)titlePositionAdjustment;
- (_UIBarButtonItemData)data;
- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5;
- (void)_clearOwner;
- (void)_writeToStorage:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setBackgroundImagePositionAdjustment:(UIOffset)backgroundImagePositionAdjustment;
- (void)setData:(id)a3;
- (void)setItemEffects:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment;
- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes;
@end

@implementation UIBarButtonItemStateAppearance

- (UIBarButtonItemStateAppearance)init
{
  return 0;
}

- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5
{
  v8 = (UIBarButtonItemAppearance *)a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIBarButtonItemStateAppearance;
  v10 = [(UIBarButtonItemStateAppearance *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_owner = v8;
    objc_storeStrong((id *)&v10->_data, a4);
    v11->_state = a5;
  }

  return v11;
}

- (void)_clearOwner
{
  self->_owner = 0;
}

- (void)_writeToStorage:(id)a3
{
  owner = self->_owner;
  if (owner)
  {
    [(UIBarButtonItemAppearance *)owner _writeToStorage:a3];
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

- (NSDictionary)titleTextAttributes
{
  return (NSDictionary *)[(_UIBarButtonItemData *)self->_data titleTextAttributesForState:self->_state];
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  v4 = titleTextAttributes;
  if (![(NSDictionary *)v4 count])
  {

    v4 = 0;
  }
  v5 = [(_UIBarButtonItemData *)self->_data titleTextAttributesForState:self->_state];
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
    v10[2] = __57__UIBarButtonItemStateAppearance_setTitleTextAttributes___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UIBarButtonItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_11:
}

uint64_t __57__UIBarButtonItemStateAppearance_setTitleTextAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setTitleTextAttributes:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (UIOffset)titlePositionAdjustment
{
  [(_UIBarButtonItemData *)self->_data titlePositionAdjustmentForState:self->_state];
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical = titlePositionAdjustment.vertical;
  double horizontal = titlePositionAdjustment.horizontal;
  [(_UIBarButtonItemData *)self->_data titlePositionAdjustmentForState:self->_state];
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__UIBarButtonItemStateAppearance_setTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E52DD178;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    [(UIBarButtonItemStateAppearance *)self _writeToStorage:v9];
  }
}

uint64_t __61__UIBarButtonItemStateAppearance_setTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setTitlePositionAdjustment:forState:", *(void *)(*(void *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIImage)backgroundImage
{
  return (UIImage *)[(_UIBarButtonItemData *)self->_data backgroundImageForState:self->_state];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  v4 = backgroundImage;
  v5 = [(_UIBarButtonItemData *)self->_data backgroundImageForState:self->_state];
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
      BOOL v9 = [(UIImage *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__UIBarButtonItemStateAppearance_setBackgroundImage___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    v11 = v6;
    [(UIBarButtonItemStateAppearance *)self _writeToStorage:v10];
  }
LABEL_9:
}

uint64_t __53__UIBarButtonItemStateAppearance_setBackgroundImage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setBackgroundImage:*(void *)(a1 + 40) forState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (UIOffset)backgroundImagePositionAdjustment
{
  [(_UIBarButtonItemData *)self->_data backgroundImagePositionAdjustmentForState:self->_state];
  result.double vertical = v3;
  result.double horizontal = v2;
  return result;
}

- (void)setBackgroundImagePositionAdjustment:(UIOffset)backgroundImagePositionAdjustment
{
  double vertical = backgroundImagePositionAdjustment.vertical;
  double horizontal = backgroundImagePositionAdjustment.horizontal;
  [(_UIBarButtonItemData *)self->_data backgroundImagePositionAdjustmentForState:self->_state];
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__UIBarButtonItemStateAppearance_setBackgroundImagePositionAdjustment___block_invoke;
    v9[3] = &unk_1E52DD178;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    [(UIBarButtonItemStateAppearance *)self _writeToStorage:v9];
  }
}

uint64_t __71__UIBarButtonItemStateAppearance_setBackgroundImagePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setBackgroundImagePositionAdjustment:forState:", *(void *)(*(void *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (_UIBarButtonItemData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)itemEffects
{
  return self->_itemEffects;
}

- (void)setItemEffects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEffects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end