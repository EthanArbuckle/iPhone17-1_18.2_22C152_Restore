@interface MapsDebugReadOnlySubtitleRow
- (int64_t)cellStyle;
- (void)configureCell:(id)a3;
@end

@implementation MapsDebugReadOnlySubtitleRow

- (int64_t)cellStyle
{
  return 3;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsDebugReadOnlySubtitleRow;
  [(MapsDebugReadOnlyValueRow *)&v11 configureCell:v4];
  v5 = [v4 contentConfiguration];
  v6 = [v4 detailTextLabel];
  v7 = [v6 text];
  id v8 = [v7 length];

  if (v8) {
    +[UIColor labelColor];
  }
  else {
  v9 = +[UIColor secondaryLabelColor];
  }
  v10 = [v5 textProperties];
  [v10 setColor:v9];

  [v4 setContentConfiguration:v5];
}

@end