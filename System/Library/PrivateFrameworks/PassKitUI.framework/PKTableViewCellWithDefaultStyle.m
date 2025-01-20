@interface PKTableViewCellWithDefaultStyle
- (PKTableViewCellWithDefaultStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PKTableViewCellWithDefaultStyle

- (PKTableViewCellWithDefaultStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithDefaultStyle;
  v4 = [(PKTableViewCellWithDefaultStyle *)&v8 initWithStyle:0 reuseIdentifier:a4];
  v5 = [(PKTableViewCellWithDefaultStyle *)v4 textLabel];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  v6 = [(PKTableViewCellWithDefaultStyle *)v4 detailTextLabel];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  return v4;
}

@end