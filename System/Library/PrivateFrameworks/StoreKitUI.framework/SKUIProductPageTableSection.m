@interface SKUIProductPageTableSection
- (BOOL)isExpanded;
- (SKUIClientContext)clientContext;
- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation SKUIProductPageTableSection

- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  id v5 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)))
  {
    if (v5) {
      goto LABEL_5;
    }
LABEL_11:
    double v15 = 80.0;
    goto LABEL_12;
  }
  -[SKUIProductPageTableSection heightForTextLayout:isExpanded:](v6, v7, v8, v9, v10, v11, v12, v13);
  if (!v5) {
    goto LABEL_11;
  }
LABEL_5:
  if (a4 || ![v5 requiresTruncation]) {
    [v5 textSize];
  }
  else {
    [v5 truncatedSize];
  }
  double v15 = v14 + 10.0 + 22.0 + 2.0 + 12.0;
LABEL_12:

  return v15;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIProductPageTableSection selectionActionForTableView:indexPath:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  return 0;
}

- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableSection textBoxTableViewCellForTableView:indexPath:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 dequeueReusableCellWithIdentifier:@"TB"];
  if (!v13)
  {
    uint64_t v13 = [[SKUITextBoxTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"TB"];
    double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(SKUITableViewCell *)v13 setBottomBorderColor:v14];

    [(SKUITextBoxTableViewCell *)v13 setSelectionStyle:0];
  }

  return v13;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
}

- (void)heightForTextLayout:(uint64_t)a3 isExpanded:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)selectionActionForTableView:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)textBoxTableViewCellForTableView:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end