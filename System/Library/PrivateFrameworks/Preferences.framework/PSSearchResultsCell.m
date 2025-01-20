@interface PSSearchResultsCell
- (BOOL)shouldIndentContent;
- (BOOL)shouldIndentSeparator;
- (PSSearchResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setShouldIndentContent:(BOOL)a3;
- (void)setShouldIndentSeparator:(BOOL)a3;
@end

@implementation PSSearchResultsCell

- (PSSearchResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)PSSearchResultsCell;
  v4 = [(PSSearchResultsCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PSSearchResultsCell *)v4 textLabel];
    [v6 setNumberOfLines:0];

    v7 = [MEMORY[0x1E4F428B8] clearColor];
    v8 = [(PSSearchResultsCell *)v5 textLabel];
    [v8 setBackgroundColor:v7];

    v9 = [(PSSearchResultsCell *)v5 detailTextLabel];
    [v9 setNumberOfLines:1];

    v10 = [MEMORY[0x1E4F428B8] clearColor];
    v11 = [(PSSearchResultsCell *)v5 detailTextLabel];
    [v11 setBackgroundColor:v10];

    v12 = +[PSListController appearance];
    v13 = [v12 textColor];

    if (v13)
    {
      v14 = [(PSSearchResultsCell *)v5 _accessibilityHigherContrastTintColorForColor:v13];
      v15 = [(PSSearchResultsCell *)v5 textLabel];
      [v15 setTextColor:v14];
    }
    v16 = +[PSListController appearance];
    v17 = [v16 altTextColor];

    if (v17)
    {
      v18 = [(PSSearchResultsCell *)v5 _accessibilityHigherContrastTintColorForColor:v17];
      v19 = [(PSSearchResultsCell *)v5 detailTextLabel];
      [v19 setTextColor:v18];
    }
    v20 = +[PSListController appearance];
    v21 = [v20 cellHighlightColor];

    if (v21)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      [v22 setBackgroundColor:v21];
      [(PSSearchResultsCell *)v5 setSelectedBackgroundView:v22];
    }
  }
  return v5;
}

- (void)prepareForReuse
{
  self->_shouldIndentContent = 0;
  self->_shouldIndentSeparator = 0;
  v2.receiver = self;
  v2.super_class = (Class)PSSearchResultsCell;
  [(PSSearchResultsCell *)&v2 prepareForReuse];
}

- (BOOL)shouldIndentContent
{
  return self->_shouldIndentContent;
}

- (void)setShouldIndentContent:(BOOL)a3
{
  self->_shouldIndentContent = a3;
}

- (BOOL)shouldIndentSeparator
{
  return self->_shouldIndentSeparator;
}

- (void)setShouldIndentSeparator:(BOOL)a3
{
  self->_shouldIndentSeparator = a3;
}

@end