@interface PXPeopleNamePickerCell
- (NSArray)baseConstraints;
- (PXPeopleNamePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)titleLabel;
- (void)prepareForReuse;
- (void)setBaseConstraints:(id)a3;
@end

@implementation PXPeopleNamePickerCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseConstraints, 0);
  objc_destroyWeak((id *)&self->_titleLabel);
}

- (void)setBaseConstraints:(id)a3
{
}

- (NSArray)baseConstraints
{
  return self->_baseConstraints;
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);
  return (UILabel *)WeakRetained;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleNamePickerCell;
  [(PXPeopleNamePickerCell *)&v3 prepareForReuse];
  [(PXPeopleNamePickerCell *)self setNeedsUpdateConstraints];
}

- (PXPeopleNamePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleNamePickerCell;
  v4 = [(PXPeopleNamePickerCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v6 = [(PXPeopleNamePickerCell *)v4 contentView];
    [v6 addSubview:v5];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0 weight:*MEMORY[0x1E4FB09D0]];
    [v5 setFont:v7];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v5, 0);
    uint64_t v10 = [v8 constraintsWithVisualFormat:@"|-[titleLabel]-|" options:1024 metrics:0 views:v9];

    [v6 addConstraints:v10];
    baseConstraints = v4->_baseConstraints;
    v4->_baseConstraints = (NSArray *)v10;

    objc_storeWeak((id *)&v4->_titleLabel, v5);
  }
  return v4;
}

@end