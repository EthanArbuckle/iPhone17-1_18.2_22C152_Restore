@interface PKTableViewCellWithValue1Style
- (PKTableViewCellWithValue1Style)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PKTableViewCellWithValue1Style

- (PKTableViewCellWithValue1Style)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithValue1Style;
  v4 = [(PKTableViewCellWithValue1Style *)&v8 initWithStyle:1 reuseIdentifier:a4];
  v5 = [(PKTableViewCellWithValue1Style *)v4 textLabel];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  v6 = [(PKTableViewCellWithValue1Style *)v4 detailTextLabel];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  return v4;
}

@end