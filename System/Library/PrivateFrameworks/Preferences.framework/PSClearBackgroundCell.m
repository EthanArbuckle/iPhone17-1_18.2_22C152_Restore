@interface PSClearBackgroundCell
- (PSClearBackgroundCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PSClearBackgroundCell

- (PSClearBackgroundCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PSClearBackgroundCell;
  v4 = [(PSClearBackgroundCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PSTableCell *)v4 titleLabel];
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [v6 setBackgroundColor:v7];

    v8 = [(PSClearBackgroundCell *)v5 detailTextLabel];
    v9 = [MEMORY[0x1E4F428B8] clearColor];
    [v8 setBackgroundColor:v9];
  }
  return v5;
}

@end