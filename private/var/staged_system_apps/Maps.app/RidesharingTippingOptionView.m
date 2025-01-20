@interface RidesharingTippingOptionView
- (BOOL)isOther;
- (BOOL)isSelected;
- (RideBookingCurrencyAmount)amount;
- (RidesharingTippingOptionView)initWithCoder:(id)a3;
- (RidesharingTippingOptionView)initWithFrame:(CGRect)a3;
- (id)description;
- (void)_commonInit;
- (void)setAmount:(id)a3;
- (void)setOther:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateTheme;
@end

@implementation RidesharingTippingOptionView

- (RidesharingTippingOptionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingOptionView;
  v3 = -[RidesharingTippingOptionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RidesharingTippingOptionView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (RidesharingTippingOptionView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingOptionView;
  v3 = [(RidesharingTippingOptionView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(RidesharingTippingOptionView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  self->_selected = 0;
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  tipLabel = self->_tipLabel;
  self->_tipLabel = v3;

  [(UILabel *)self->_tipLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RidesharingTippingOptionView *)self addSubview:self->_tipLabel];
  v5 = [(UILabel *)self->_tipLabel topAnchor];
  v6 = [(RidesharingTippingOptionView *)self topAnchor];
  objc_super v7 = [v5 constraintEqualToAnchor:v6 constant:5.0];
  [v7 setActive:1];

  v8 = [(UILabel *)self->_tipLabel leadingAnchor];
  v9 = [(RidesharingTippingOptionView *)self leadingAnchor];
  v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9 constant:10.0];
  [v10 setActive:1];

  v11 = [(UILabel *)self->_tipLabel bottomAnchor];
  v12 = [(RidesharingTippingOptionView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:-5.0];
  [v13 setActive:1];

  v14 = [(UILabel *)self->_tipLabel trailingAnchor];
  v15 = [(RidesharingTippingOptionView *)self trailingAnchor];
  v16 = [v14 constraintLessThanOrEqualToAnchor:v15 constant:-10.0];
  [v16 setActive:1];

  id v19 = [(UILabel *)self->_tipLabel centerXAnchor];
  v17 = [(RidesharingTippingOptionView *)self centerXAnchor];
  v18 = [v19 constraintEqualToAnchor:v17];
  [v18 setActive:1];
}

- (void)setAmount:(id)a3
{
  p_amount = &self->_amount;
  objc_storeStrong((id *)&self->_amount, a3);
  id v6 = a3;
  id v7 = objc_alloc((Class)NSAttributedString);
  v8 = [(RideBookingCurrencyAmount *)*p_amount formattedString];
  id v9 = [v7 initWithString:v8];

  [(UILabel *)self->_tipLabel setAttributedText:v9];
  [(RidesharingTippingOptionView *)self updateTheme];
}

- (void)setOther:(BOOL)a3
{
  self->_other = a3;
  tipLabel = self->_tipLabel;
  if (a3)
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"ridesharing.feedback.tippingOption.other" value:@"localized string not found" table:0];
    id v8 = [v5 initWithString:v7];
    [(UILabel *)tipLabel setAttributedText:v8];
  }
  else
  {
    [(UILabel *)self->_tipLabel setAttributedText:0];
  }

  [(RidesharingTippingOptionView *)self updateTheme];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (self->_amount) {
    -[RidesharingTippingOptionView setAmount:](self, "setAmount:");
  }

  [(RidesharingTippingOptionView *)self updateTheme];
}

- (void)updateTheme
{
  v3 = [(RidesharingTippingOptionView *)self theme];
  v4 = [v3 ridesharingTippingOptionsBackgroundColor:[self isSelected]];
  [(RidesharingTippingOptionView *)self setBackgroundColor:v4];

  id v5 = [(UILabel *)self->_tipLabel attributedText];
  id v6 = [v5 mutableCopy];

  NSAttributedStringKey v29 = NSForegroundColorAttributeName;
  id v7 = [(RidesharingTippingOptionView *)self theme];
  id v8 = [v7 ridesharingTippingOptionsForegroundColor:[self isSelected]];
  v30 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [v6 addAttributes:v9 range:0, [v6 length]];

  amount = self->_amount;
  if (amount)
  {
    v11 = [(RideBookingCurrencyAmount *)amount currencySymbol];
    if (v11)
    {
      v12 = [v6 string];
      id v13 = [v12 rangeOfString:v11];
      uint64_t v15 = v14;

      NSAttributedStringKey v27 = NSForegroundColorAttributeName;
      v16 = [(RidesharingTippingOptionView *)self theme];
      v17 = [v16 ridesharingTippingOptionsForegroundCurrencyColor:[(RidesharingTippingOptionView *)self isSelected]];
      v28 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v6 addAttributes:v18 range:v13];
    }
    else
    {
      v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v19 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingTippingOptionView.m");
        id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Couldn't get range of currency symbol to apply styling. RideBookingCurrencyAmount: %@", self->_amount];
        *(_DWORD *)buf = 136315394;
        v24 = v19;
        __int16 v25 = 2112;
        id v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);
      }
    }
  }
  tipLabel = self->_tipLabel;
  id v22 = [v6 copy];
  [(UILabel *)tipLabel setAttributedText:v22];
}

- (id)description
{
  return +[NSString stringWithFormat:@"RidesharingTippingOptionView\nAmount:%@\n other?:%d", self->_amount, self->_other];
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isOther
{
  return self->_other;
}

- (RideBookingCurrencyAmount)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);

  objc_storeStrong((id *)&self->_tipLabel, 0);
}

@end