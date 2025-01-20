@interface CarAutohidingLabel
- (CarAutohidingLabel)initWithCoder:(id)a3;
- (CarAutohidingLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAutohide:(BOOL)a3 forAxis:(int64_t)a4;
@end

@implementation CarAutohidingLabel

- (CarAutohidingLabel)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarAutohidingLabel;
  result = -[CarAutohidingLabel initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_autohideForVerticalSquishing = 1;
  }
  return result;
}

- (CarAutohidingLabel)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarAutohidingLabel;
  result = [(CarAutohidingLabel *)&v4 initWithCoder:a3];
  if (result) {
    result->_autohideForVerticalSquishing = 1;
  }
  return result;
}

- (void)setAutohide:(BOOL)a3 forAxis:(int64_t)a4
{
  if (a4 == 1)
  {
    objc_super v4 = &OBJC_IVAR___CarAutohidingLabel__autohideForVerticalSquishing;
  }
  else
  {
    if (a4) {
      return;
    }
    objc_super v4 = &OBJC_IVAR___CarAutohidingLabel__autohideForHorizontalSquishing;
  }
  *((unsigned char *)&self->super.super.super.super.isa + *v4) = a3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CarAutohidingLabel;
  [(CarAutohidingLabel *)&v11 layoutSubviews];
  double v3 = 1.0;
  if ([(CarAutohidingLabel *)self adjustsFontSizeToFitWidth])
  {
    [(CarAutohidingLabel *)self minimumScaleFactor];
    double v3 = v4;
  }
  v5 = [(CarAutohidingLabel *)self font];
  [v5 lineHeight];
  double v7 = v3 * v6;

  if (self->_autohideForVerticalSquishing)
  {
    [(CarAutohidingLabel *)self bounds];
    uint64_t v8 = CGRectGetHeight(v12) < v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (self->_autohideForHorizontalSquishing)
  {
    -[CarAutohidingLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, v7 * (double)(uint64_t)[(CarAutohidingLabel *)self numberOfLines]);
    double v10 = v9;
    [(CarAutohidingLabel *)self bounds];
    if (CGRectGetWidth(v13) < v10) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v8;
    }
  }
  [(CarAutohidingLabel *)self setHidden:v8];
}

@end