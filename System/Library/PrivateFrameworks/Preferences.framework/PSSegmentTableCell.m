@interface PSSegmentTableCell
- (BOOL)canReload;
- (PSSegmentTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)controlValue;
- (id)newControl;
- (id)titleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
- (void)setValues:(id)a3 titleDictionary:(id)a4;
@end

@implementation PSSegmentTableCell

- (PSSegmentTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PSSegmentTableCell;
  v5 = [(PSControlTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSControlTableCell *)v5 control];
    [v7 _setAutosizeText:1];

    v8 = [(PSSegmentTableCell *)v6 textLabel];
    [v8 setHidden:1];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(PSControlTableCell *)self control];
  v6 = [(PSControlTableCell *)self control];
  uint64_t v18 = [v6 selectedSegmentIndex];

  [v5 removeAllSegments];
  v7 = [v4 values];
  v8 = [v4 titleDictionary];
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      v12 = [v7 objectAtIndex:i];
      uint64_t v13 = [v8 objectForKey:v12];
      v14 = (void *)v13;
      if (v13) {
        v15 = (void *)v13;
      }
      else {
        v15 = v12;
      }
      objc_msgSend(v5, "insertSegmentWithTitle:atIndex:animated:", v15, objc_msgSend(v5, "numberOfSegments"), 0);
    }
  }
  v16 = [v4 values];
  v17 = [v4 titleDictionary];
  [(PSSegmentTableCell *)self setValues:v16 titleDictionary:v17];

  [v5 setSelectedSegmentIndex:v18];
  v19.receiver = self;
  v19.super_class = (Class)PSSegmentTableCell;
  [(PSControlTableCell *)&v19 refreshCellContentsWithSpecifier:v4];
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)PSSegmentTableCell;
  [(PSTableCell *)&v2 prepareForReuse];
}

- (id)newControl
{
  id v2 = objc_alloc(MEMORY[0x1E4F42DD0]);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObject:&stru_1EFB51FD0];
  id v4 = (void *)[v2 initWithItems:v3];

  return v4;
}

- (id)titleLabel
{
  return 0;
}

- (BOOL)canReload
{
  int v3 = [(PSSegmentTableCell *)self isMemberOfClass:objc_opt_class()];
  if (v3) {
    LOBYTE(v3) = [(PSSegmentTableCell *)self tag] == 9;
  }
  return v3;
}

- (void)setValues:(id)a3 titleDictionary:(id)a4
{
  v6 = (NSArray *)a3;
  v7 = (NSDictionary *)a4;
  values = self->_values;
  self->_values = v6;
  uint64_t v10 = v6;

  titleDict = self->_titleDict;
  self->_titleDict = v7;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PSSegmentTableCell;
  [(PSTableCell *)&v20 layoutSubviews];
  int v3 = [(PSTableCell *)self specifier];
  id v4 = [v3 propertyForKey:@"alwaysShowSeparator"];

  if (!v4) {
    [(PSSegmentTableCell *)self setSeparatorStyle:0];
  }
  v5 = [(PSSegmentTableCell *)self contentView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  uint64_t v10 = [(PSControlTableCell *)self control];
  CGFloat v11 = *MEMORY[0x1E4F1DB28];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 scale];
  if (v14 == 2.0) {
    double v15 = 7.5;
  }
  else {
    double v15 = 7.0;
  }
  v21.origin.double x = v11;
  v21.origin.double y = v12;
  v21.size.double width = v7;
  v21.size.double height = v9;
  CGRect v22 = CGRectInset(v21, 5.0, v15);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;

  objc_msgSend(v10, "setFrame:", x, y, width, height);
}

- (id)controlValue
{
  unint64_t v3 = [(UIControl *)self->super._control selectedSegmentIndex];
  if ((v3 & 0x8000000000000000) != 0 || (unint64_t v4 = v3, v3 >= [(NSArray *)self->_values count]))
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_values objectAtIndex:v4];
  }
  return v5;
}

- (void)setValue:(id)a3
{
  id v7 = a3;
  if (self->super.super._value != v7)
  {
    objc_storeStrong(&self->super.super._value, a3);
    NSUInteger v5 = [(NSArray *)self->_values indexOfObject:v7];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v6 = 0;
    }
    else {
      NSUInteger v6 = v5;
    }
    [(UIControl *)self->super._control setSelectedSegmentIndex:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDict, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end