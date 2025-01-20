@interface ICQUIiCloudPlusHeaderCell
+ (int64_t)cellStyle;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ICQUIiCloudPlusHeaderCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICQUIiCloudPlusHeaderCell;
  [(PSTableCell *)&v8 layoutSubviews];
  v3 = [MEMORY[0x263F825C8] clearColor];
  [(ICQUIiCloudPlusHeaderCell *)self setSeparatorColor:v3];

  v4 = [(ICQUIiCloudPlusHeaderCell *)self textLabel];
  v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81800]];
  [v4 setFont:v5];

  v6 = [(ICQUIiCloudPlusHeaderCell *)self textLabel];
  v7 = [MEMORY[0x263F825C8] labelColor];
  [v6 setColor:v7];

  [(ICQUIiCloudPlusHeaderCell *)self setNeedsDisplay];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUIiCloudPlusHeaderCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F602D0], v7.receiver, v7.super_class);

  v6 = [(ICQUIiCloudPlusHeaderCell *)self textLabel];
  [v6 setText:v5];
}

- (void).cxx_destruct
{
}

@end