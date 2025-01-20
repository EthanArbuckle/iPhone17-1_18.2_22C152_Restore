@interface _UIKeyShortcutHUDCell
- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4;
- (BOOL)canBecomeFocused;
- (BOOL)drawsBackground;
- (BOOL)isBackgroundVisible;
- (BOOL)isCategoryVisible;
- (BOOL)isFlashing;
- (_UIKeyShortcutHUDCell)initWithFrame:(CGRect)a3;
- (id)configurationState;
- (id)defaultContentConfiguration;
- (int64_t)_backgroundStyleForState:(id)a3;
- (int64_t)focusItemDeferralMode;
- (void)prepareForReuse;
- (void)setCategoryVisible:(BOOL)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setFlashing:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _UIKeyShortcutHUDCell

- (_UIKeyShortcutHUDCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDCell;
  v3 = -[UICollectionViewListCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UICollectionViewCell *)v3 setAutomaticallyUpdatesContentConfiguration:0];
    [(UICollectionViewCell *)v4 setAutomaticallyUpdatesBackgroundConfiguration:0];
  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4
{
  return a4 != 5;
}

- (id)configurationState
{
  v3 = [_UIKeyShortcutHUDCellConfigurationState alloc];
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDCell;
  v4 = [(UICollectionViewCell *)&v7 configurationState];
  v5 = [(_UIKeyShortcutHUDCellConfigurationState *)v3 initWithCellConfigurationState:v4];

  [(_UIKeyShortcutHUDCellConfigurationState *)v5 setFlashing:[(_UIKeyShortcutHUDCell *)self isFlashing]];
  [(_UIKeyShortcutHUDCellConfigurationState *)v5 setCategoryVisible:[(_UIKeyShortcutHUDCell *)self isCategoryVisible]];
  [(_UIKeyShortcutHUDCellConfigurationState *)v5 setDrawsBackground:[(_UIKeyShortcutHUDCell *)self drawsBackground]];
  return v5;
}

- (void)setFlashing:(BOOL)a3
{
  if (self->_flashing != a3)
  {
    self->_flashing = a3;
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setCategoryVisible:(BOOL)a3
{
  if (self->_categoryVisible != a3)
  {
    self->_categoryVisible = a3;
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setDrawsBackground:(BOOL)a3
{
  if (self->_drawsBackground != a3)
  {
    self->_drawsBackground = a3;
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDCell;
  [(UICollectionViewListCell *)&v3 prepareForReuse];
  self->_flashing = 0;
  self->_categoryVisible = 0;
  self->_drawsBackground = 0;
}

- (BOOL)isBackgroundVisible
{
  v2 = self;
  objc_super v3 = [(_UIKeyShortcutHUDCell *)self configurationState];
  LOBYTE(v2) = [(_UIKeyShortcutHUDCell *)v2 _backgroundStyleForState:v3] != 3;

  return (char)v2;
}

- (int64_t)_backgroundStyleForState:(id)a3
{
  id v3 = a3;
  if (([v3 isFlashing] & 1) != 0
    || ([v3 isHighlighted] & 1) != 0
    || [v3 isSelected])
  {
    if (([v3 isFlashing] & 1) == 0
      && [v3 isHighlighted]
      && ([v3 isSelected] & 1) != 0)
    {
      int64_t v4 = 2;
    }
    else
    {
      int64_t v4 = ![v3 isFlashing]
        || ([v3 isHighlighted] & 1) == 0 && (objc_msgSend(v3, "isSelected") & 1) == 0;
    }
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

- (id)defaultContentConfiguration
{
  id v3 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyShortcutHUDCell;
  int64_t v4 = [(UICollectionViewListCell *)&v13 defaultContentConfiguration];
  v5 = [v4 textProperties];
  objc_super v6 = [v3 standardHUDFont];
  [v5 setFont:v6];

  [v5 setAllowsDefaultTighteningForTruncation:1];
  [v5 setAdjustsFontSizeToFitWidth:1];
  [v5 setMinimumScaleFactor:0.5];
  objc_super v7 = [v3 standardHUDTextColor];
  [v5 setColor:v7];

  [v5 setNumberOfLines:1];
  [v3 shortcutTitleToSubtitleVerticalPadding];
  objc_msgSend(v4, "setTextToSecondaryTextVerticalPadding:");
  v8 = [v4 secondaryTextProperties];
  v9 = [v3 shortcutSubtitleFont];
  [v8 setFont:v9];

  [v8 setAllowsDefaultTighteningForTruncation:1];
  [v8 setAdjustsFontSizeToFitWidth:1];
  [v8 setMinimumScaleFactor:0.5];
  v10 = [v3 shortcutSubtitleTextColor];
  [v8 setColor:v10];

  [v8 setNumberOfLines:1];
  [v3 menuCellHorizontalContentMargin];
  objc_msgSend(v4, "setDirectionalLayoutMargins:", 0.0, v11, 0.0, v11);

  return v4;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v12 = a3;
  [v12 setFocused:0];
  int64_t v4 = +[UIBackgroundConfiguration clearConfiguration];
  v5 = [v4 updatedConfigurationForState:v12];

  if ([v12 drawsBackground])
  {
    objc_super v6 = +[UIColor blackColor];
LABEL_3:
    uint64_t v7 = +[UIColor clearColor];
LABEL_4:
    v8 = (void *)v7;
    [v5 setBackgroundColor:v7];
LABEL_5:
  }
  else
  {
    int64_t v9 = [(_UIKeyShortcutHUDCell *)self _backgroundStyleForState:v12];
    objc_super v6 = +[UIColor blackColor];
    switch(v9)
    {
      case 0:
        uint64_t v7 = +[UIColor systemFillColor];
        goto LABEL_4;
      case 1:
        uint64_t v7 = +[UIColor tertiarySystemFillColor];
        goto LABEL_4;
      case 2:
        v8 = +[UIColor tertiarySystemFillColor];
        [v8 alphaComponent];
        double v11 = [v8 colorWithAlphaComponent:v10 * 0.7];
        [v5 setBackgroundColor:v11];

        goto LABEL_5;
      case 3:
        goto LABEL_3;
      default:
        break;
    }
  }
  [(UICollectionViewCell *)self setBackgroundConfiguration:v5];
}

- (BOOL)isFlashing
{
  return self->_flashing;
}

- (BOOL)isCategoryVisible
{
  return self->_categoryVisible;
}

- (BOOL)drawsBackground
{
  return self->_drawsBackground;
}

@end