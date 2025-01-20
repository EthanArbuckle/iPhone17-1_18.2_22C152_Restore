@interface RTTUIReplyActionCell
- (RTTUIReplyActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 andDelegate:(id)a5;
- (RTTUIReplyActionCellDelegate)delegate;
- (double)adjustedHeight;
- (void)setDelegate:(id)a3;
@end

@implementation RTTUIReplyActionCell

- (RTTUIReplyActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 andDelegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)RTTUIReplyActionCell;
  v9 = [(RTTUIReplyActionCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v9)
  {
    v10 = [MEMORY[0x263F1C550] clearColor];
    [(RTTUIReplyActionCell *)v9 setBackgroundColor:v10];

    [(RTTUIReplyActionCell *)v9 setDelegate:v8];
  }

  return v9;
}

- (double)adjustedHeight
{
  return 0.0;
}

- (RTTUIReplyActionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTTUIReplyActionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end