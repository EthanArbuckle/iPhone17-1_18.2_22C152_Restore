@interface ICQUIManageStorageListCell
+ (int64_t)cellStyle;
- (id)getLazyIcon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ICQUIManageStorageListCell

- (id)getLazyIcon
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(PSSpecifier *)self->_currentSpecifier objectForKeyedSubscript:@"DRILLDOWN_APP_INFO"];
  if (![v3 fetchLocally]) {
    goto LABEL_11;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 bundleIds];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5)
  {
LABEL_10:

LABEL_11:
    v10 = [ICQUIDrilldownImage alloc];
    v13.receiver = self;
    v13.super_class = (Class)ICQUIManageStorageListCell;
    id v4 = [(PSTableCell *)&v13 getLazyIcon];
    uint64_t v9 = -[ICQUIDrilldownImage initWithCGImage:](v10, "initWithCGImage:", [v4 CGImage]);
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = +[_ICQUIHelperFunctions appIconWithSize:forBundleID:](_ICQUIHelperFunctions, "appIconWithSize:forBundleID:", *(void *)(*((void *)&v14 + 1) + 8 * v8), 29.0, 29.0);
    if (v9) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
LABEL_12:
  v11 = (void *)v9;

  return v11;
}

+ (int64_t)cellStyle
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpecifier, a3);
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIManageStorageListCell;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v5];
  uint64_t v6 = [(ICQUIManageStorageListCell *)self detailTextLabel];
  uint64_t v7 = [v5 propertyForKey:*MEMORY[0x263F602C8]];

  [v6 setText:v7];
  uint64_t v8 = [(ICQUIManageStorageListCell *)self imageView];
  [v8 setContentMode:1];

  [(ICQUIManageStorageListCell *)self setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end