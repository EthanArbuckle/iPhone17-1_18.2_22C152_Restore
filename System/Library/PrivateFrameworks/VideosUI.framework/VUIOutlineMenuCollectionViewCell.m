@interface VUIOutlineMenuCollectionViewCell
- (BOOL)shouldAppearAsHeader;
- (NSString)imageName;
- (NSString)title;
- (void)_updateViewConfigurationsWithState:(unint64_t)a3;
- (void)prepareForReuse;
- (void)setImageName:(id)a3;
- (void)setShouldAppearAsHeader:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIOutlineMenuCollectionViewCell

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)VUIOutlineMenuCollectionViewCell;
  [(VUIOutlineMenuCollectionViewCell *)&v5 prepareForReuse];
  title = self->_title;
  self->_title = 0;

  imageName = self->_imageName;
  self->_imageName = 0;

  self->_shouldAppearAsHeader = 0;
  [(VUIOutlineMenuCollectionViewCell *)self setTrailingAccessoryConfigurations:MEMORY[0x1E4F1CBF0]];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  [(VUIOutlineMenuCollectionViewCell *)self _setNeedsConfigurationStateUpdate];
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
  [(VUIOutlineMenuCollectionViewCell *)self _setNeedsConfigurationStateUpdate];
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VUIOutlineMenuCollectionViewCell;
  [(VUIOutlineMenuCollectionViewCell *)&v10 _updateViewConfigurationsWithState:a3];
  v4 = [MEMORY[0x1E4FB1FF8] outlineCellConfiguration];
  if (self->_shouldAppearAsHeader)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1FF8] outlineRootParentCellConfiguration];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB2028]) initWithCellSelectionTogglesExpansionState:1];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(VUIOutlineMenuCollectionViewCell *)self setTrailingAccessoryConfigurations:v7];
    v4 = (void *)v5;
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:self->_imageName];
    v7 = [v4 imageView];
    [v7 setImage:v6];
  }

  title = self->_title;
  v9 = [v4 textLabel];
  [v9 setText:title];

  [(VUIOutlineMenuCollectionViewCell *)self _setContentViewConfiguration:v4];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)shouldAppearAsHeader
{
  return self->_shouldAppearAsHeader;
}

- (void)setShouldAppearAsHeader:(BOOL)a3
{
  self->_shouldAppearAsHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end