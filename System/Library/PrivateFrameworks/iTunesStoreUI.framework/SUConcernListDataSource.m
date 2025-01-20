@interface SUConcernListDataSource
- (NSArray)concerns;
- (SUConcernListDataSource)init;
- (SUTextViewCell)textViewCell;
- (double)cellHeightForIndexPath:(id)a3;
- (id)_titleCellForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)selectedConcernIndex;
- (int64_t)tableViewStyle;
- (void)dealloc;
- (void)setConcerns:(id)a3;
- (void)setSelectedConcernIndex:(int64_t)a3;
@end

@implementation SUConcernListDataSource

- (SUConcernListDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUConcernListDataSource;
  result = [(SUTableDataSource *)&v3 init];
  if (result) {
    result->_selectedConcernIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  self->_concerns = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUConcernListDataSource;
  [(SUTableDataSource *)&v3 dealloc];
}

- (SUTextViewCell)textViewCell
{
  result = self->_textViewCell;
  if (!result)
  {
    self->_textViewCell = [[SUTextViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    -[SUTextContentView setPlaceholder:](-[SUTextViewCell textContentView](self->_textViewCell, "textContentView"), "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"COMMENTS_PLACEHOLDER", &stru_26DB8C5F8, 0));
    return self->_textViewCell;
  }
  return result;
}

- (id)cellForIndexPath:(id)a3
{
  uint64_t v5 = [a3 section];
  if (v5 == 1)
  {
    return [(SUConcernListDataSource *)self textViewCell];
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [(SUConcernListDataSource *)self _titleCellForIndexPath:a3];
  }
}

- (double)cellHeightForIndexPath:(id)a3
{
  if ([a3 section] == 1) {
    return 150.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUConcernListDataSource;
  [(SUTableDataSource *)&v6 cellHeightForIndexPath:a3];
  return result;
}

- (int64_t)numberOfSections
{
  if ([(NSArray *)self->_concerns count]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  if (a3 != 1)
  {
    if (!a3) {
      return [(NSArray *)self->_concerns count];
    }
    return 0;
  }
  return a3;
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (id)_titleCellForIndexPath:(id)a3
{
  uint64_t v4 = [a3 row];
  uint64_t v5 = (SUTableCell *)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "dequeueReusableCellWithIdentifier:", @"0");
  if (!v5) {
    uint64_t v5 = [[SUTableCell alloc] initWithStyle:0 reuseIdentifier:@"0"];
  }
  objc_super v6 = (void *)[(SUTableCell *)v5 textLabel];
  [v6 setAdjustsFontSizeToFitWidth:1];
  [v6 setMinimumScaleFactor:0.75];
  objc_msgSend(v6, "setText:", objc_msgSend(-[NSArray objectAtIndex:](self->_concerns, "objectAtIndex:", v4), "title"));
  if (v4 == [(SUConcernListDataSource *)self selectedConcernIndex])
  {
    [(SUTableCell *)v5 setAccessoryType:3];
    uint64_t v7 = [MEMORY[0x263F1C550] colorWithRed:0.196078431 green:0.309803922 blue:0.521568627 alpha:1.0];
  }
  else
  {
    [(SUTableCell *)v5 setAccessoryType:0];
    uint64_t v7 = [MEMORY[0x263F1C550] blackColor];
  }
  [v6 setTextColor:v7];
  return v5;
}

- (NSArray)concerns
{
  return self->_concerns;
}

- (void)setConcerns:(id)a3
{
}

- (int64_t)selectedConcernIndex
{
  return self->_selectedConcernIndex;
}

- (void)setSelectedConcernIndex:(int64_t)a3
{
  self->_selectedConcernIndex = a3;
}

@end