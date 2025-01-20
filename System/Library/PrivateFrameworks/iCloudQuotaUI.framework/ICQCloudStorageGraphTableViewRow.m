@interface ICQCloudStorageGraphTableViewRow
- (ICQCloudStorageGraphTableViewRow)init;
- (ICQCloudStorageGraphTableViewRow)initWithAccount:(id)a3;
- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6;
- (id)tableCell;
@end

@implementation ICQCloudStorageGraphTableViewRow

- (ICQCloudStorageGraphTableViewRow)init
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v5 = [(ICQCloudStorageGraphTableViewRow *)self initWithAccount:v4];
  return v5;
}

- (ICQCloudStorageGraphTableViewRow)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQCloudStorageGraphTableViewRow;
  v6 = [(RUIElement *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    tableCellLock = v7->_tableCellLock;
    v7->_tableCellLock = v8;
  }
  return v7;
}

- (id)tableCell
{
  [(NSLock *)self->_tableCellLock lock];
  tableCell = self->_tableCell;
  if (tableCell)
  {
    v4 = tableCell;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)ICQCloudStorageGraphTableViewRow;
    v4 = [(RUITableViewRow *)&v25 tableCell];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
      [v6 setIdentifier:@"CLOUD_STORAGE_GRAPH"];
      [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      uint64_t v7 = MEMORY[0x263EFFA88];
      [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F25C68]];
      [v6 setProperty:v7 forKey:*MEMORY[0x263F600A8]];
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"CASTLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
      [v6 setProperty:v9 forKey:*MEMORY[0x263F602D0]];

      [v6 setProperty:v5 forKey:*MEMORY[0x263F602B0]];
      [(UITableViewCell *)v5 setSpecifier:v6];
      [(UITableViewCell *)v5 refreshCellContentsWithSpecifier:v6];
      v10 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v10 startAnimating];
      [(UITableViewCell *)v5 setAccessoryView:v10];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__11;
      v23 = __Block_byref_object_dispose__11;
      id v24 = (id)[objc_alloc(MEMORY[0x263F888D0]) initWithAccount:self->_account];
      objc_super v11 = (void *)v20[5];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke;
      v15[3] = &unk_264923A28;
      v12 = v5;
      v16 = v12;
      id v13 = v6;
      id v17 = v13;
      v18 = &v19;
      [v11 fetchStorageSummaryWithCompletion:v15];

      _Block_object_dispose(&v19, 8);
    }
    objc_storeStrong((id *)&self->_tableCell, v4);
  }
  [(NSLock *)self->_tableCellLock unlock];
  return v4;
}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2;
  block[3] = &unk_264923A00;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  id v14 = v6;
  uint64_t v15 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessoryView:0];
  [*(id *)(a1 + 40) setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F25C68]];
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = [v2 displayLabel];
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:*MEMORY[0x263F602D0]];

    v4 = [*(id *)(a1 + 48) totalStorage];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:*MEMORY[0x263F25C50]];

    id v5 = [*(id *)(a1 + 48) freeStorage];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*MEMORY[0x263F25C48]];

    id v6 = [*(id *)(a1 + 48) usedStorage];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:*MEMORY[0x263F25C60]];

    uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "icqui_AAUIiCloudMediaUsageInfo");
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:*MEMORY[0x263F25C58]];
  }
  else
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2_cold_1(a1, v7);
    }
  }

  [*(id *)(a1 + 32) setSpecifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) refreshCellContentsWithSpecifier:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  v10 = [(ICQCloudStorageGraphTableViewRow *)self tableCell];
  [v9 _contentWidthForCell:v10 forRowAtIndexPath:v8];
  double v12 = v11;

  id v13 = [(ICQCloudStorageGraphTableViewRow *)self tableCell];
  LODWORD(v14) = 1112014848;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, 0.0, v14, v15);
  *(float *)&double v12 = v16;

  return *(float *)&v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
  objc_storeStrong((id *)&self->_tableCellLock, 0);
}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "No summary response received, Can't show storage graph. Error: %@", (uint8_t *)&v3, 0xCu);
}

@end