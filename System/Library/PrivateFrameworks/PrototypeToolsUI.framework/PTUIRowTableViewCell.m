@interface PTUIRowTableViewCell
+ (double)cellHeightForRow:(id)a3;
+ (int64_t)cellStyleForRow:(id)a3;
- (PTRow)row;
- (void)dealloc;
- (void)prepareForReuse;
- (void)rowDidReload:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setRow:(id)a3;
- (void)updateCellCharacteristics;
- (void)updateDisplayedContent;
@end

@implementation PTUIRowTableViewCell

+ (double)cellHeightForRow:(id)a3
{
  return 44.0;
}

+ (int64_t)cellStyleForRow:(id)a3
{
  return 0;
}

- (void)dealloc
{
  [(PTRow *)self->_row removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PTUIRowTableViewCell;
  [(PTUIRowTableViewCell *)&v3 dealloc];
}

- (void)prepareForReuse
{
  [(PTUIRowTableViewCell *)self setRow:0];
  v3.receiver = self;
  v3.super_class = (Class)PTUIRowTableViewCell;
  [(PTUIRowTableViewCell *)&v3 prepareForReuse];
}

- (void)setRow:(id)a3
{
  v4 = (PTRow *)a3;
  [(PTRow *)self->_row removeObserver:self];
  row = self->_row;
  self->_row = v4;
  v6 = v4;

  [(PTRow *)self->_row addObserver:self];
  [(PTUIRowTableViewCell *)self updateCellCharacteristics];
  [(PTUIRowTableViewCell *)self updateDisplayedContent];

  [(PTUIRowTableViewCell *)self updateDisplayedValue];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PTUIRowTableViewCell;
  [(PTUIRowTableViewCell *)&v5 setEditing:a3 animated:a4];
  [(PTUIRowTableViewCell *)self updateCellCharacteristics];
}

- (void)updateDisplayedContent
{
  objc_super v3 = [(PTUIRowTableViewCell *)self textLabel];
  v4 = [(PTUIRowTableViewCell *)self row];
  objc_super v5 = [v4 title];
  [v3 setText:v5];

  id v8 = [(PTUIRowTableViewCell *)self imageView];
  v6 = [(PTUIRowTableViewCell *)self row];
  v7 = [v6 image];
  [v8 setImage:v7];
}

- (void)updateCellCharacteristics
{
  objc_super v3 = [(PTUIRowTableViewCell *)self textLabel];
  v4 = [MEMORY[0x263F1C658] systemFontOfSize:17.0];
  [v3 setFont:v4];

  id v7 = [(PTUIRowTableViewCell *)self row];
  objc_super v5 = [v7 action];
  if (v5 || ([v7 defaultUIAction], (objc_super v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(PTUIRowTableViewCell *)self isEditing] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(PTUIRowTableViewCell *)self setSelectionStyle:v6];
}

- (void)rowDidReload:(id)a3
{
  [(PTUIRowTableViewCell *)self updateDisplayedValue];

  [(PTUIRowTableViewCell *)self updateDisplayedContent];
}

- (PTRow)row
{
  return self->_row;
}

- (void).cxx_destruct
{
}

@end