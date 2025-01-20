@interface _UIKeyShortcutHUDToolbarCell
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _UIKeyShortcutHUDToolbarCell

- (void)updateConfigurationUsingState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDToolbarCell;
  [(_UIKeyShortcutHUDCell *)&v6 updateConfigurationUsingState:a3];
  v4 = [(UICollectionViewCell *)self backgroundConfiguration];
  v5 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v5 toolbarCellCornerRadius];
  objc_msgSend(v4, "setCornerRadius:");

  [(UICollectionViewCell *)self setBackgroundConfiguration:v4];
}

@end