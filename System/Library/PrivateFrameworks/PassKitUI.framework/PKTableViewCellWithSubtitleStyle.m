@interface PKTableViewCellWithSubtitleStyle
- (PKTableViewCellWithSubtitleStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PKTableViewCellWithSubtitleStyle

- (PKTableViewCellWithSubtitleStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithSubtitleStyle;
  v4 = [(PKTableViewCellWithSubtitleStyle *)&v8 initWithStyle:3 reuseIdentifier:a4];
  v5 = [(PKTableViewCellWithSubtitleStyle *)v4 textLabel];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  v6 = [(PKTableViewCellWithSubtitleStyle *)v4 detailTextLabel];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  return v4;
}

@end