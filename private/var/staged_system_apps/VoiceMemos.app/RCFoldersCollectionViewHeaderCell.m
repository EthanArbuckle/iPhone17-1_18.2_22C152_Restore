@interface RCFoldersCollectionViewHeaderCell
- (BOOL)_shouldUseAccompaniedSidebarStyle;
- (BOOL)isAccessibilityElement;
- (id)_headingText;
- (id)accessibilityLabel;
- (void)restyle;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation RCFoldersCollectionViewHeaderCell

- (void)updateConfigurationUsingState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCFoldersCollectionViewHeaderCell;
  [(RCFoldersCollectionViewHeaderCell *)&v6 updateConfigurationUsingState:a3];
  if ([(RCFoldersCollectionViewHeaderCell *)self _shouldUseAccompaniedSidebarStyle]) {
    +[UIListContentConfiguration sidebarHeaderConfiguration];
  }
  else {
  v4 = +[UIListContentConfiguration groupedHeaderConfiguration];
  }
  v5 = [(RCFoldersCollectionViewHeaderCell *)self _headingText];
  [v4 setText:v5];

  [(RCFoldersCollectionViewHeaderCell *)self setContentConfiguration:v4];
}

- (void)restyle
{
}

- (BOOL)_shouldUseAccompaniedSidebarStyle
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 sidebarCollectionViewHeaderCellUsesAccompaniedSidebarStyle];

  return v3;
}

- (id)_headingText
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"MY_FOLDERS" value:&stru_100228BC8 table:0];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(RCFoldersCollectionViewHeaderCell *)self _headingText];
  unsigned __int8 v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

@end