@interface SKUIRedeemIdManager
- (NSIndexPath)activeIndexPath;
- (SKUIClientContext)clientContext;
- (SKUIPinnedFooterView)pinnedFooterView;
- (SKUIRedeemIdManager)initWithClientContext:(id)a3;
- (SKUIRedeemIdManagerDelegate)delegate;
- (UITableView)tableView;
- (double)_heightForDisclosureFooter;
- (double)_tableViewNonFooterContentHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_disclosureAttributedString;
- (id)_nextIndexPath:(id)a3;
- (id)_pcLinkString;
- (id)_placeholderTextForIndexPath:(id)a3;
- (id)_regulationsLinkString;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_autoCapitalizationTypeForIndexPath:(id)a3;
- (int64_t)_keyboardTypeForIndexPath:(id)a3;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_returnKeyTypeForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissActiveCell;
- (void)redeemIdCell:(id)a3 didChangeToText:(id)a4;
- (void)redeemIdCell:(id)a3 didReturnWithText:(id)a4;
- (void)setActiveIndexPath:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterHidden:(BOOL)a3;
- (void)setPinnedFooterView:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SKUIRedeemIdManager

- (SKUIRedeemIdManager)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdManager initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemIdManager;
  v6 = [(SKUIRedeemIdManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (SKUIPinnedFooterView)pinnedFooterView
{
  pinnedFooterView = self->_pinnedFooterView;
  if (!pinnedFooterView)
  {
    v4 = [SKUIPinnedFooterView alloc];
    id v5 = -[SKUIPinnedFooterView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_pinnedFooterView;
    self->_pinnedFooterView = v5;

    v7 = self->_pinnedFooterView;
    v8 = [(SKUIRedeemIdManager *)self _disclosureAttributedString];
    [(SKUIPinnedFooterView *)v7 setAttributedText:v8];

    objc_super v9 = self->_pinnedFooterView;
    v10 = [(SKUIRedeemIdManager *)self tableView];
    [v10 separatorInset];
    [(SKUIPinnedFooterView *)v9 setHorizontalPadding:v11];

    pinnedFooterView = self->_pinnedFooterView;
  }

  return pinnedFooterView;
}

- (void)setTableView:(id)a3
{
  id v5 = (UITableView *)a3;
  p_tableView = &self->_tableView;
  if (self->_tableView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_tableView, a3);
    v7 = [(SKUIRedeemIdManager *)self tableView];
    [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"redeemIdCell"];

    id v5 = v8;
  }

  MEMORY[0x1F41817F8](p_tableView, v5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(SKUIRedeemIdManager *)self activeIndexPath];
  id v8 = v6;
  [(SKUIRedeemIdManager *)self setActiveIndexPath:v8];
  objc_super v9 = [v13 cellForRowAtIndexPath:v8];
  v10 = [v9 textField];
  objc_msgSend(v10, "setAutocapitalizationType:", -[SKUIRedeemIdManager _autoCapitalizationTypeForIndexPath:](self, "_autoCapitalizationTypeForIndexPath:", v8));

  [v9 becomeFirstResponder];
  if (v7 && ([v7 isEqual:v8] & 1) == 0)
  {
    double v11 = [v13 cellForRowAtIndexPath:v7];
    [v11 resignFirstResponder];
  }
  v12 = [(SKUIRedeemIdManager *)self delegate];
  [v12 redeemIdManager:self movedToRowAtIndexPath:v8];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    [(SKUIRedeemIdManager *)self _heightForDisclosureFooter];
    double v7 = v8;
  }
  else if (a4 == 2)
  {
    double v7 = 50.0;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4 == 3)
  {
    id v6 = [(SKUIRedeemIdManager *)self pinnedFooterView];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(SKUIRedeemIdManager *)self _numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    double v7 = [(SKUIRedeemIdManager *)self clientContext];
    if (v7)
    {
      double v8 = @"REDEEM_NATIONAL_ID_SECTION_NATIONAL_ID";
      goto LABEL_10;
    }
    double v11 = @"REDEEM_NATIONAL_ID_SECTION_NATIONAL_ID";
LABEL_15:
    uint64_t v9 = +[SKUIClientContext localizedStringForKey:v11 inBundles:0 inTable:@"Redeem"];
    goto LABEL_16;
  }
  if (a4 == 1)
  {
    double v7 = [(SKUIRedeemIdManager *)self clientContext];
    if (v7)
    {
      double v8 = @"REDEEM_NATIONAL_ID_SECTION_PHONE";
      goto LABEL_10;
    }
    double v11 = @"REDEEM_NATIONAL_ID_SECTION_PHONE";
    goto LABEL_15;
  }
  if (a4)
  {
    v10 = &stru_1F1C879E8;
    goto LABEL_17;
  }
  double v7 = [(SKUIRedeemIdManager *)self clientContext];
  if (!v7)
  {
    double v11 = @"REDEEM_NATIONAL_ID_SECTION_NAME";
    goto LABEL_15;
  }
  double v8 = @"REDEEM_NATIONAL_ID_SECTION_NAME";
LABEL_10:
  uint64_t v9 = [v7 localizedStringForKey:v8 inTable:@"Redeem"];
LABEL_16:
  v10 = (__CFString *)v9;

LABEL_17:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 2)
  {
    uint64_t v4 = [(SKUIRedeemIdManager *)self clientContext];
    uint64_t v5 = v4;
    if (v4) {
      [v4 localizedStringForKey:@"REDEEM_NATIONAL_ID_DESCRIPTION" inTable:@"Redeem"];
    }
    else {
    id v6 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_DESCRIPTION" inBundles:0 inTable:@"Redeem"];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"redeemIdCell" forIndexPath:v6];
  double v8 = [v7 textField];
  uint64_t v9 = [v8 text];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    double v11 = [(SKUIRedeemIdManager *)self _placeholderTextForIndexPath:v6];
    [v7 setPlaceholderText:v11];
  }
  objc_msgSend(v7, "setKeyboardType:", -[SKUIRedeemIdManager _keyboardTypeForIndexPath:](self, "_keyboardTypeForIndexPath:", v6));
  objc_msgSend(v7, "setReturnKeyType:", -[SKUIRedeemIdManager _returnKeyTypeForIndexPath:](self, "_returnKeyTypeForIndexPath:", v6));
  objc_msgSend(v7, "setAutoCapitalizationType:", -[SKUIRedeemIdManager _autoCapitalizationTypeForIndexPath:](self, "_autoCapitalizationTypeForIndexPath:", v6));
  [v7 setDelegate:self];

  return v7;
}

- (void)redeemIdCell:(id)a3 didReturnWithText:(id)a4
{
  id v14 = a4;
  uint64_t v5 = [(SKUIRedeemIdManager *)self activeIndexPath];
  id v6 = [(SKUIRedeemIdManager *)self _nextIndexPath:v5];
  double v7 = [(SKUIRedeemIdManager *)self delegate];
  [v7 redeemIdManager:self didReturnText:v14 forCellAtIndexPath:v5];

  [(SKUIRedeemIdManager *)self setActiveIndexPath:v6];
  if (v6)
  {
    double v8 = [(SKUIRedeemIdManager *)self tableView];
    uint64_t v9 = [v8 cellForRowAtIndexPath:v6];

    [v9 becomeFirstResponder];
  }
  uint64_t v10 = [(SKUIRedeemIdManager *)self tableView];
  double v11 = [v10 cellForRowAtIndexPath:v5];

  [v11 resignFirstResponder];
  if ([v14 length])
  {
    v12 = [(SKUIRedeemIdManager *)self _placeholderTextForIndexPath:v5];
    [v11 setPlaceholderText:v12];
  }
  id v13 = [(SKUIRedeemIdManager *)self delegate];
  [v13 redeemIdManager:self movedToRowAtIndexPath:v6];
}

- (void)redeemIdCell:(id)a3 didChangeToText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(SKUIRedeemIdManager *)self tableView];
  id v10 = [v8 indexPathForCell:v7];

  uint64_t v9 = [(SKUIRedeemIdManager *)self delegate];
  [v9 redeemIdManager:self didChangeToText:v6 forCellAtIndexPath:v10];
}

- (void)setFooterHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKUIRedeemIdManager *)self pinnedFooterView];
  [v4 setHidden:v3];
}

- (void)dismissActiveCell
{
  BOOL v3 = [(SKUIRedeemIdManager *)self activeIndexPath];

  if (v3)
  {
    id v4 = [(SKUIRedeemIdManager *)self tableView];
    uint64_t v5 = [(SKUIRedeemIdManager *)self activeIndexPath];
    id v6 = [v4 cellForRowAtIndexPath:v5];

    [v6 resignFirstResponder];
  }
}

- (id)_regulationsLinkString
{
  v2 = [(SKUIRedeemIdManager *)self clientContext];
  BOOL v3 = v2;
  if (v2) {
    [v2 localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE_LINK_REGULATIONS" inTable:@"Redeem"];
  }
  else {
  id v4 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE_LINK_REGULATIONS" inBundles:0 inTable:@"Redeem"];
  }

  return v4;
}

- (id)_pcLinkString
{
  v2 = [(SKUIRedeemIdManager *)self clientContext];
  BOOL v3 = v2;
  if (v2) {
    [v2 localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE_LINK_PC" inTable:@"Redeem"];
  }
  else {
  id v4 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE_LINK_PC" inBundles:0 inTable:@"Redeem"];
  }

  return v4;
}

- (id)_placeholderTextForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == 2 || v5 == 1)
  {
    id v7 = [(SKUIRedeemIdManager *)self clientContext];
    if (v7)
    {
      double v8 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_REQUIRED";
      goto LABEL_10;
    }
    double v11 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_REQUIRED";
LABEL_13:
    uint64_t v9 = +[SKUIClientContext localizedStringForKey:v11 inBundles:0 inTable:@"Redeem"];
    goto LABEL_14;
  }
  if (v5)
  {
LABEL_11:
    id v10 = &stru_1F1C879E8;
    goto LABEL_15;
  }
  uint64_t v6 = [v4 row];
  if (v6 == 1)
  {
    id v7 = [(SKUIRedeemIdManager *)self clientContext];
    if (v7)
    {
      double v8 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_FIRST_NAME";
      goto LABEL_10;
    }
    double v11 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_FIRST_NAME";
    goto LABEL_13;
  }
  if (v6) {
    goto LABEL_11;
  }
  id v7 = [(SKUIRedeemIdManager *)self clientContext];
  if (!v7)
  {
    double v11 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_LAST_NAME";
    goto LABEL_13;
  }
  double v8 = @"REDEEM_NATIONAL_ID_PLACEHOLDER_LAST_NAME";
LABEL_10:
  uint64_t v9 = [v7 localizedStringForKey:v8 inTable:@"Redeem"];
LABEL_14:
  id v10 = (__CFString *)v9;

LABEL_15:

  return v10;
}

- (id)_disclosureAttributedString
{
  BOOL v3 = [(SKUIRedeemIdManager *)self clientContext];
  id v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE" inTable:@"Redeem"];
  }
  else {
  uint64_t v5 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_DISCLOSURE" inBundles:0 inTable:@"Redeem"];
  }

  uint64_t v6 = [(SKUIRedeemIdManager *)self _pcLinkString];
  id v7 = [(SKUIRedeemIdManager *)self _regulationsLinkString];
  double v8 = [NSString stringWithValidatedFormat:v5, @"%@%@", 0, v6, v7 validFormatSpecifiers error];
  uint64_t v9 = [v8 rangeOfString:v6 options:4];
  uint64_t v23 = v10;
  uint64_t v24 = v9;
  uint64_t v11 = [v8 rangeOfString:v7 options:4];
  uint64_t v13 = v12;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  id v15 = objc_alloc_init(MEMORY[0x1E4FA82F8]);
  id v26 = 0;
  v16 = [v15 valueForKey:@"redeemPartnerTerms" error:&v26];
  id v17 = v26;
  v18 = v17;
  if (v17 || !v16) {
    NSLog(&cfstr_UnableToLoadNa.isa, v17);
  }
  else {
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v16, v11, v13);
  }
  id v25 = v18;
  v19 = [v15 valueForKey:@"redeemPartnerInfo" error:&v25];
  id v20 = v25;

  if (v20 || !v19) {
    NSLog(&cfstr_UnableToLoadNa_0.isa, v20);
  }
  else {
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v19, v24, v23);
  }
  v21 = (void *)[v14 copy];

  return v21;
}

- (id)_nextIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKUIRedeemIdManager *)self tableView];
  uint64_t v6 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  id v7 = [(SKUIRedeemIdManager *)self tableView];
  uint64_t v8 = [v7 numberOfSections];

  if ([v4 row] < (unint64_t)(v6 - 1))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v10 = [v4 row] + 1;
    uint64_t v11 = [v4 section];
    uint64_t v12 = v9;
    uint64_t v13 = v10;
LABEL_5:
    id v17 = [v12 indexPathForRow:v13 inSection:v11];
    goto LABEL_7;
  }
  id v14 = [(SKUIRedeemIdManager *)self activeIndexPath];
  unint64_t v15 = [v14 section] + 1;

  if (v15 < v8 - 1)
  {
    v16 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = [v4 section] + 1;
    uint64_t v12 = v16;
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  id v17 = 0;
LABEL_7:

  return v17;
}

- (double)_heightForDisclosureFooter
{
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 statusBarFrame];
  double v5 = v4;

  uint64_t v6 = [(SKUIRedeemIdManager *)self tableView];
  [v6 bounds];
  double v8 = v7 - v5;

  [(SKUIRedeemIdManager *)self _tableViewNonFooterContentHeight];
  double v10 = v9 + 150.0;
  double v11 = v8 - v9;
  if (v10 <= v8) {
    double v12 = v11;
  }
  else {
    double v12 = 150.0;
  }
  uint64_t v13 = [(SKUIRedeemIdManager *)self tableView];
  [v13 contentInset];
  double v15 = v12 - v14;

  return v15;
}

- (double)_tableViewNonFooterContentHeight
{
  BOOL v3 = [(SKUIRedeemIdManager *)self tableView];
  uint64_t v4 = [v3 numberOfSections];

  if (!v4) {
    return 0.0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    if (v5 != 3)
    {
      double v7 = [(SKUIRedeemIdManager *)self tableView];
      [v7 rectForSection:v5];
      double v9 = v8;

      double v6 = v6 + v9;
    }
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_1C1CCBC50[a3];
  }
}

- (int64_t)_keyboardTypeForIndexPath:(id)a3
{
  unint64_t v3 = [a3 section];
  if (v3 > 2) {
    return 0;
  }
  else {
    return qword_1C1CCBC70[v3];
  }
}

- (int64_t)_returnKeyTypeForIndexPath:(id)a3
{
  unint64_t v3 = [a3 section];
  if (v3 > 2) {
    return 0;
  }
  else {
    return qword_1C1CCBC88[v3];
  }
}

- (int64_t)_autoCapitalizationTypeForIndexPath:(id)a3
{
  unint64_t v3 = [a3 section];
  if (v3 > 2) {
    return 0;
  }
  else {
    return qword_1C1CCBCA0[v3];
  }
}

- (SKUIRedeemIdManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIRedeemIdManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSIndexPath)activeIndexPath
{
  return self->_activeIndexPath;
}

- (void)setActiveIndexPath:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (void)setPinnedFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedFooterView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemIdManager initWithClientContext:]";
}

@end