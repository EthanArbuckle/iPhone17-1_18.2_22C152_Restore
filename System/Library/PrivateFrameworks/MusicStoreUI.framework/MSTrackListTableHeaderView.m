@interface MSTrackListTableHeaderView
- (NSString)title;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setTitle:(id)a3;
- (void)sizeToFit;
@end

@implementation MSTrackListTableHeaderView

- (void)dealloc
{
  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTrackListTableHeaderView;
  [(MSTrackListTableHeaderView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  [(MSTrackListTableHeaderView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  if (self->_title)
  {
    uint64_t v8 = [MEMORY[0x263F1C658] boldSystemFontOfSize:14.0];
    double width = self->_titleSize.width;
    double height = self->_titleSize.height;
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      [(NSString *)self->_title _legacy_sizeWithFont:v8];
      double height = v12;
      self->_titleSize.double width = width;
      self->_titleSize.double height = v12;
    }
    if (width >= v5 + -16.0) {
      double v13 = v5 + -16.0;
    }
    else {
      double v13 = width;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.462745098, 1.0), "set");
    -[NSString _legacy_drawInRect:withFont:](self->_title, "_legacy_drawInRect:withFont:", v8, floor((v5 - v13) * 0.5), 13.0, v13, height);
  }
  [(id)MSGetTrackListBorderColor() set];
  uint64_t v15 = 0;
  double v16 = 1.0;
  double v17 = v5;
  double v14 = v7 + -1.0;
  UIRectFill(*(CGRect *)&v15);
}

- (void)sizeToFit
{
  [(MSTrackListTableHeaderView *)self frame];
  -[MSTrackListTableHeaderView setFrame:](self, "setFrame:");
}

- (void)setTitle:(id)a3
{
  title = self->_title;
  if (title != a3)
  {

    self->_title = (NSString *)a3;
    self->_titleSize = (CGSize)*MEMORY[0x263F001B0];
    [(MSTrackListTableHeaderView *)self setNeedsDisplay];
  }
}

- (NSString)title
{
  return self->_title;
}

@end