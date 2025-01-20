@interface SUUIProductPageTableSection
- (BOOL)isExpanded;
- (SUUIClientContext)clientContext;
- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation SUUIProductPageTableSection

- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4 || ![v5 requiresTruncation]) {
      [v6 textSize];
    }
    else {
      [v6 truncatedSize];
    }
    double v8 = v7 + 10.0 + 22.0 + 2.0 + 12.0;
  }
  else
  {
    double v8 = 80.0;
  }

  return v8;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"TB", a4);
  v4 = (SUUITextBoxTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[SUUITextBoxTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"TB"];
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(SUUITableViewCell *)v4 setBottomBorderColor:v5];

    [(SUUITextBoxTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (SUUIClientContext)clientContext
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

@end