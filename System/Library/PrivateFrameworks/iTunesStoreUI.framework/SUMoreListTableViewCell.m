@interface SUMoreListTableViewCell
- (SUMoreListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation SUMoreListTableViewCell

- (SUMoreListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUMoreListTableViewCell;
  v4 = [(SUMoreListTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[(SUMoreListTableViewCell *)v4 textLabel];
    objc_msgSend(v6, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 18.0));
    objc_msgSend(v6, "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.301960784, 1.0));
  }
  return v5;
}

- (void)layoutSubviews
{
  v3 = (void *)[(SUMoreListTableViewCell *)self textLabel];
  if ([(SUMoreListTableViewCell *)self isHighlighted])
  {
    [v3 setShadowColor:0];
    double v4 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    objc_msgSend(v3, "setShadowColor:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
    double v5 = 1.0;
    double v4 = 0.0;
  }
  objc_msgSend(v3, "setShadowOffset:", v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)SUMoreListTableViewCell;
  [(SUMoreListTableViewCell *)&v6 layoutSubviews];
}

@end