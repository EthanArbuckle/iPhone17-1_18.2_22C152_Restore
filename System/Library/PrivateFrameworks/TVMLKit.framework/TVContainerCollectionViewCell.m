@interface TVContainerCollectionViewCell
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (BOOL)selectSubviews;
- (TVContainerCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setFocused:(BOOL)a3 animated:(BOOL)a4 context:(id)a5 coordinator:(id)a6;
- (void)setSelectSubviews:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation TVContainerCollectionViewCell

- (TVContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVContainerCollectionViewCell;
  result = -[TVContainerCollectionViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_selectSubviews = 1;
    result->_allowsFocus = 1;
  }
  return result;
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)TVContainerCollectionViewCell;
  BOOL v3 = [(TVContainerCollectionViewCell *)&v5 canBecomeFocused];
  if (v3) {
    LOBYTE(v3) = self->_allowsFocus;
  }
  return v3;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  v7 = [(TVContainerCollectionViewCell *)self selectingView];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TVContainerCollectionViewCell;
    uint64_t v9 = [(TVContainerCollectionViewCell *)&v12 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  v10 = (void *)v9;

  return v10;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVContainerCollectionViewCell *)self setFocused:[(TVContainerCollectionViewCell *)self isFocused] animated:1 context:v7 coordinator:v6];
}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4 context:(id)a5 coordinator:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(TVContainerCollectionViewCell *)self selectingView];
  v13 = (void *)v12;
  if (self->_selectSubviews)
  {
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 setSelected:v8 animated:v7 focusUpdateContext:v10 withAnimationCoordinator:v11];
      }
      else {
        [v13 setSelected:v8 animated:1 withAnimationCoordinator:v11];
      }
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v14 = [(TVContainerCollectionViewCell *)self contentView];
      v15 = [v14 subviews];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * i) setSelected:v8 animated:1 withAnimationCoordinator:v11];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v17);
      }
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  [(TVContainerCollectionViewCell *)&v9 pressesBegan:v6 withEvent:a4];
  if ([v6 count] == 1)
  {
    BOOL v7 = [v6 anyObject];
    uint64_t v8 = [v7 type];

    if (v8 == 4) {
      [(TVContainerCollectionViewCell *)self _showPressState];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  [(TVContainerCollectionViewCell *)&v9 pressesEnded:v6 withEvent:a4];
  if ([v6 count] == 1)
  {
    BOOL v7 = [v6 anyObject];
    uint64_t v8 = [v7 type];

    if (v8 == 4) {
      [(TVContainerCollectionViewCell *)self _clearPressState];
    }
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  [(TVContainerCollectionViewCell *)&v9 pressesCancelled:v6 withEvent:a4];
  if ([v6 count] == 1)
  {
    BOOL v7 = [v6 anyObject];
    uint64_t v8 = [v7 type];

    if (v8 == 4) {
      [(TVContainerCollectionViewCell *)self _clearPressState];
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TVContainerCollectionViewCell;
  [(TVContainerCollectionViewCell *)&v3 prepareForReuse];
  self->_allowsFocus = 1;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (BOOL)selectSubviews
{
  return self->_selectSubviews;
}

- (void)setSelectSubviews:(BOOL)a3
{
  self->_selectSubviews = a3;
}

@end