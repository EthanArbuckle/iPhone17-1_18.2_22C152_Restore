@interface VUIFocusableCollectionViewCell
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (VUIFocusableCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_updateBackgroundAndHighlightColor;
- (void)prepareForReuse;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation VUIFocusableCollectionViewCell

- (VUIFocusableCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIFocusableCollectionViewCell;
  v3 = -[VUIFocusableCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VUIFocusableCollectionViewCell *)v3 setAutoresizingMask:1];
    v4->_allowsFocus = 1;
  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)VUIFocusableCollectionViewCell;
  [(VUIFocusableCollectionViewCell *)&v2 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VUIFocusableCollectionViewCell;
  -[VUIFocusableCollectionViewCell setHighlighted:](&v16, sel_setHighlighted_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(VUIFocusableCollectionViewCell *)self contentView];
  objc_super v6 = [v5 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 setHighlighted:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_updateBackgroundAndHighlightColor
{
  objc_super v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

@end