@interface IMExpandingLabel
- (id)_font;
- (unint64_t)maximumNumberOfLinesThatFitHeight:(double)a3;
- (void)setFont:(id)a3;
- (void)setMoreButtonFont:(id)a3;
@end

@implementation IMExpandingLabel

- (void)setFont:(id)a3
{
  id v7 = a3;
  v4 = [(IMExpandingLabel *)self textAttributes];
  id v5 = [v4 mutableCopy];

  if (!v5)
  {
    id v5 = +[NSMutableDictionary dictionary];
  }
  [v5 setObject:v7 forKeyedSubscript:NSFontAttributeName];
  [(IMExpandingLabel *)self setTextAttributes:v5];
  v6 = [(IMExpandingLabel *)self text];
  [(IMExpandingLabel *)self setText:0];
  [(IMExpandingLabel *)self setText:v6];
}

- (void)setMoreButtonFont:(id)a3
{
  id v4 = a3;
  id v6 = [(IMExpandingLabel *)self moreButton];
  id v5 = [v6 titleLabel];
  [v5 setFont:v4];

  [v6 sizeToFit];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setTouchInsets:-8.0, -8.0, -8.0, -8.0];
    [v6 frame];
    CGRect v9 = CGRectInset(v8, 0.0, 6.0);
    [v6 setFrame:CGPointMake(v9.origin.x, v9.origin.y, v9.size.width + 10.0, v9.size.height)];
  }
}

- (unint64_t)maximumNumberOfLinesThatFitHeight:(double)a3
{
  id v4 = [(IMExpandingLabel *)self _font];
  [v4 lineHeight];
  unint64_t v6 = (unint64_t)(a3 / v5);

  return v6;
}

- (id)_font
{
  v2 = [(IMExpandingLabel *)self textAttributes];
  v3 = [v2 objectForKey:NSFontAttributeName];

  return v3;
}

@end