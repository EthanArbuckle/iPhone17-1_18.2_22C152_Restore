@interface VUIListCollectionViewCell
- (BOOL)shouldAppearSelected;
- (UIColor)backgroundColor;
- (UIColor)highlightedBackgroundColor;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldAppearSelected:(BOOL)a3;
@end

@implementation VUIListCollectionViewCell

- (void)setShouldAppearSelected:(BOOL)a3
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    -[VUIListCollectionViewCell setSelected:](self, "setSelected:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v4 = self->_shouldAppearSelected || a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIListCollectionViewCell;
  [(VUIListCollectionViewCell *)&v7 setHighlighted:v4];
  if (self->_highlightedBackgroundColor && self->_backgroundColor)
  {
    v5 = [(VUIListCollectionViewCell *)self contentView];
    if (v4 | [(VUIListCollectionViewCell *)self isSelected]) {
      p_highlightedBackgroundColor = &self->_highlightedBackgroundColor;
    }
    else {
      p_highlightedBackgroundColor = &self->_backgroundColor;
    }
    [v5 setBackgroundColor:*p_highlightedBackgroundColor];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VUIListCollectionViewCell;
  -[VUIListCollectionViewCell setSelected:](&v18, sel_setSelected_);
  if (self->_highlightedBackgroundColor && self->_backgroundColor)
  {
    v5 = [(VUIListCollectionViewCell *)self contentView];
    v6 = v5;
    if (v3) {
      p_highlightedBackgroundColor = &self->_highlightedBackgroundColor;
    }
    else {
      p_highlightedBackgroundColor = &self->_backgroundColor;
    }
    [v5 setBackgroundColor:*p_highlightedBackgroundColor];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(VUIListCollectionViewCell *)self contentView];
  v9 = [v8 subviews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setHighlighted:v3];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUIListCollectionViewCell;
  [(VUIListCollectionViewCell *)&v3 prepareForReuse];
  self->_shouldAppearSelected = 0;
  if ([(VUIListCollectionViewCell *)self isHighlighted]) {
    [(VUIListCollectionViewCell *)self setHighlighted:0];
  }
  if ([(VUIListCollectionViewCell *)self isSelected]) {
    [(VUIListCollectionViewCell *)self setSelected:0];
  }
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end