@interface ButtonCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ButtonCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ButtonCell;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:a3];
  v4 = [(ButtonCell *)self textLabel];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v4 setTextColor:v5];

  v6 = [(ButtonCell *)self textLabel];
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setHighlightedTextColor:v7];

  v8 = [(ButtonCell *)self textLabel];
  v9 = [(ButtonCell *)self traitCollection];
  if ([v9 isAXEnabled]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  [v8 setNumberOfLines:v10];

  id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v11 setBackgroundColor:v12];

  [(ButtonCell *)self setSelectedBackgroundView:v11];
}

@end