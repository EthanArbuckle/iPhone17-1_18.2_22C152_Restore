@interface _PTUIChoiceCell
- (_PTUIChoiceCell)initWithReuseIdentifier:(id)a3;
- (void)prepareForReuse;
- (void)setChecked:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _PTUIChoiceCell

- (_PTUIChoiceCell)initWithReuseIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PTUIChoiceCell;
  return [(_PTUIChoiceCell *)&v4 initWithStyle:1 reuseIdentifier:a3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_PTUIChoiceCell;
  [(_PTUIChoiceCell *)&v3 prepareForReuse];
  [(_PTUIChoiceCell *)self setChecked:0];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_PTUIChoiceCell *)self textLabel];
  [v5 setText:v4];
}

- (void)setChecked:(BOOL)a3
{
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [(_PTUIChoiceCell *)self setAccessoryType:v5];
  id v7 = [(_PTUIChoiceCell *)self textLabel];
  if (a3) {
    [(_PTUIChoiceCell *)self tintColor];
  }
  else {
  v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  [v7 setTextColor:v6];
}

@end