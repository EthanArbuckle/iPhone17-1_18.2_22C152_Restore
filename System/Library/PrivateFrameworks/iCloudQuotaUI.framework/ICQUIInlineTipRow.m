@interface ICQUIInlineTipRow
- (ICQUIInlineTipRow)init;
- (UIView)tipView;
- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6;
- (id)tableCell;
- (void)setTipView:(id)a3;
@end

@implementation ICQUIInlineTipRow

- (ICQUIInlineTipRow)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICQUIInlineTipRow;
  result = [(RUIElement *)&v3 init];
  if (result) {
    result->_tableCellLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)tableCell
{
  p_tableCellLock = &self->_tableCellLock;
  os_unfair_lock_lock(&self->_tableCellLock);
  tableCell = self->_tableCell;
  if (tableCell)
  {
    v5 = tableCell;
    os_unfair_lock_unlock(p_tableCellLock);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICQUIInlineTipRow;
    v6 = [(RUITableViewRow *)&v13 tableCell];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)MEMORY[0x263F5FC40];
      v8 = v6;
      v9 = [v7 preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
      [v9 setIdentifier:@"TIP_HOST_CELL_MS"];
      [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
      [v9 setProperty:v8 forKey:*MEMORY[0x263F602B0]];
      [v9 setObject:self->_tipView forKeyedSubscript:@"ICQUITipView"];
      [(UITableViewCell *)v8 setSpecifier:v9];
      [(UITableViewCell *)v8 refreshCellContentsWithSpecifier:v9];
    }
    v10 = self->_tableCell;
    self->_tableCell = v6;
    v11 = v6;

    os_unfair_lock_unlock(p_tableCellLock);
    v5 = self->_tableCell;
  }
  return v5;
}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  [(UITableViewCell *)self->_tableCell intrinsicContentSize];
  return v6;
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipView, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

@end