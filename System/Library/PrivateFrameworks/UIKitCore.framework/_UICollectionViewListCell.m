@interface _UICollectionViewListCell
- (id)_configurationForListAccessoryType:(int64_t)a3;
- (id)_customViewForAccessoryConfiguration:(id)a3;
- (id)accessoryViewForAxis:(int64_t)a3;
- (int64_t)_backgroundViewConfigurationGrouping;
- (int64_t)accessoryTypeForAxis:(int64_t)a3;
- (unint64_t)_maskedCornersForSystemBackgroundView;
- (void)_setAccessoryConfigurations:(id)a3 forAxis:(int64_t)a4;
- (void)_setBackgroundViewConfigurationGrouping:(int64_t)a3;
- (void)setAccessoryType:(int64_t)a3 forAxis:(int64_t)a4;
- (void)setAccessoryView:(id)a3 forAxis:(int64_t)a4;
@end

@implementation _UICollectionViewListCell

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  unint64_t v2 = self->__backgroundViewConfigurationGrouping - 1;
  if (v2 < 4) {
    return qword_186B93E58[v2];
  }
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListCell;
  return [(UICollectionViewCell *)&v4 _maskedCornersForSystemBackgroundView];
}

- (int64_t)_backgroundViewConfigurationGrouping
{
  return self->__backgroundViewConfigurationGrouping;
}

- (void)_setBackgroundViewConfigurationGrouping:(int64_t)a3
{
  if (self->__backgroundViewConfigurationGrouping != a3)
  {
    self->__backgroundViewConfigurationGrouping = a3;
    objc_super v4 = [(UICollectionViewCell *)self backgroundConfiguration];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(UICollectionViewCell *)self _backgroundViewConfiguration];
    }
    id v8 = v6;

    [(UICollectionViewCell *)self _applyBackgroundViewConfiguration:v8 withState:0];
    if ([(UICollectionViewCell *)self isHighlighted]
      || [(UICollectionViewCell *)self isSelected])
    {
      v7 = [(UICollectionReusableView *)self _collectionView];
      [v7 _cellBackgroundChangedForSelectionOrHighlight:self];
    }
  }
}

- (int64_t)accessoryTypeForAxis:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = [(UICollectionViewListCell *)self leadingAccessoryConfigurations];
      goto LABEL_7;
    case 1:
      v3 = [(UICollectionViewListCell *)self trailingAccessoryConfigurations];
      goto LABEL_7;
    case 2:
      v3 = [(UICollectionViewListCell *)self leadingEditingAccessoryConfigurations];
      goto LABEL_7;
    case 3:
      v3 = [(UICollectionViewListCell *)self trailingEditingAccessoryConfigurations];
LABEL_7:
      v5 = v3;
      objc_super v4 = [v3 firstObject];

      if (!v4 || ![v4 _isSystemType]) {
        goto LABEL_10;
      }
      int64_t v6 = [v4 _systemType] + 1;
      break;
    default:
      objc_super v4 = 0;
LABEL_10:
      int64_t v6 = 0;
      break;
  }

  return v6;
}

- (void)setAccessoryType:(int64_t)a3 forAxis:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(_UICollectionViewListCell *)self accessoryTypeForAxis:a4];
  if (a3)
  {
    id v8 = [(_UICollectionViewListCell *)self _configurationForListAccessoryType:a3];
    v11[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(_UICollectionViewListCell *)self _setAccessoryConfigurations:v9 forAxis:a4];
  }
  else if (v7)
  {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    [(_UICollectionViewListCell *)self _setAccessoryConfigurations:v10 forAxis:a4];
  }
}

- (id)accessoryViewForAxis:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      objc_super v4 = [(UICollectionViewListCell *)self leadingAccessoryConfigurations];
      goto LABEL_7;
    case 1:
      objc_super v4 = [(UICollectionViewListCell *)self trailingAccessoryConfigurations];
      goto LABEL_7;
    case 2:
      objc_super v4 = [(UICollectionViewListCell *)self leadingEditingAccessoryConfigurations];
      goto LABEL_7;
    case 3:
      objc_super v4 = [(UICollectionViewListCell *)self trailingEditingAccessoryConfigurations];
LABEL_7:
      int64_t v6 = v4;
      int64_t v7 = [v4 firstObject];
      v5 = [(_UICollectionViewListCell *)self _customViewForAccessoryConfiguration:v7];

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setAccessoryView:(id)a3 forAxis:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(_UICollectionViewListCell *)self accessoryViewForAxis:a4];

  if (v6)
  {
    id v8 = [[_UICellAccessoryConfigurationCustomView alloc] initWithCustomView:v6];
    [(_UICellAccessoryConfigurationCustomView *)v8 setMaintainsFixedSize:1];
    v10[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(_UICollectionViewListCell *)self _setAccessoryConfigurations:v9 forAxis:a4];
  }
  else if (v7)
  {
    [(_UICollectionViewListCell *)self _setAccessoryConfigurations:MEMORY[0x1E4F1CBF0] forAxis:a4];
  }
}

- (id)_customViewForAccessoryConfiguration:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3 && ([v3 _isSystemType] & 1) == 0)
  {
    id v6 = (objc_class *)objc_opt_class();
    _accessoryConfigurationAsClass(v4, v6);
    v5 = [(id)objc_claimAutoreleasedReturnValue() customView];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_configurationForListAccessoryType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = _UICellAccessoryConfigurationDisclosureIndicator;
      goto LABEL_9;
    case 2:
      id v3 = _UICellAccessoryConfigurationCheckmark;
      goto LABEL_9;
    case 3:
      id v3 = _UICellAccessoryConfigurationDelete;
      goto LABEL_9;
    case 4:
      id v3 = _UICellAccessoryConfigurationInsert;
      goto LABEL_9;
    case 5:
      id v3 = _UICellAccessoryConfigurationReorder;
      goto LABEL_9;
    case 6:
      id v3 = _UICellAccessoryConfigurationMultiselect;
LABEL_9:
      id v8 = objc_alloc_init(v3);
      break;
    default:
      int64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewListCell.m", 2639, @"Invalid _UICollectionViewListCellAccessoryType value: %ld", a3);

      id v8 = 0;
      break;
  }
  return v8;
}

- (void)_setAccessoryConfigurations:(id)a3 forAxis:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 0:
      [(UICollectionViewListCell *)self setLeadingAccessoryConfigurations:v6];
      goto LABEL_6;
    case 1:
      [(UICollectionViewListCell *)self setTrailingAccessoryConfigurations:v6];
      goto LABEL_6;
    case 2:
      [(UICollectionViewListCell *)self setLeadingEditingAccessoryConfigurations:v6];
      goto LABEL_6;
    case 3:
      [(UICollectionViewListCell *)self setTrailingEditingAccessoryConfigurations:v6];
LABEL_6:
      id v6 = v7;
      break;
    default:
      break;
  }
}

@end