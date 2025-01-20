@interface MSTrackListCopyrightFooterView
- (CGSize)_textSize;
- (NSString)text;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation MSTrackListCopyrightFooterView

- (void)dealloc
{
  self->_text = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTrackListCopyrightFooterView;
  [(MSTrackListCopyrightFooterView *)&v3 dealloc];
}

- (void)setText:(id)a3
{
  text = self->_text;
  if (text != a3)
  {

    self->_text = (NSString *)a3;
    self->_textSize = (CGSize)*MEMORY[0x263F001B0];
    [(MSTrackListCopyrightFooterView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(MSTrackListCopyrightFooterView *)self bounds];
  double v5 = v4;
  [(MSTrackListCopyrightFooterView *)self _textSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = floor((v5 - v8) * 0.5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.603921569, 0.603921569, 0.603921569, 1.0), "set");
  text = self->_text;
  uint64_t v12 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
  -[NSString _legacy_drawInRect:withFont:](text, "_legacy_drawInRect:withFont:", v12, 10.0, v10, v7, v9);
}

- (void)sizeToFit
{
  [(MSTrackListCopyrightFooterView *)self frame];
  if (self->_text)
  {
    double v6 = v3;
    double v7 = v4;
    double v8 = v5;
    [(MSTrackListCopyrightFooterView *)self _textSize];
    double v10 = fmax(v9 + 16.0, 44.0);
    -[MSTrackListCopyrightFooterView setFrame:](self, "setFrame:", v6, v7, v8, v10);
  }
}

- (CGSize)_textSize
{
  p_textSize = &self->_textSize;
  double width = self->_textSize.width;
  if (self->_text)
  {
    double height = self->_textSize.height;
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      [(MSTrackListCopyrightFooterView *)self bounds];
      -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", [MEMORY[0x263F1C658] systemFontOfSize:12.0], 4, v7 + -20.0, 1.79769313e308);
      p_textSize->double width = width;
      p_textSize->double height = height;
    }
  }
  else
  {
    double height = self->_textSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)text
{
  return self->_text;
}

@end