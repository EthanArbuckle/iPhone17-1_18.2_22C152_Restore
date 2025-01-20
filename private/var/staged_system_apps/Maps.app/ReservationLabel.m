@interface ReservationLabel
- (BOOL)textFits;
- (ReservationLabelLayoutDelegate)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation ReservationLabel

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ReservationLabel;
  [(ReservationLabel *)&v4 layoutSubviews];
  v3 = [(ReservationLabel *)self delegate];
  [v3 reservationLabelDidLayout:self];
}

- (BOOL)textFits
{
  v3 = [(ReservationLabel *)self text];
  if (![v3 length])
  {

    return 1;
  }
  id v4 = [(ReservationLabel *)self numberOfLines];

  if (!v4) {
    return 1;
  }
  v5 = [(ReservationLabel *)self font];
  NSAttributedStringKey v23 = NSFontAttributeName;
  v24 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [(ReservationLabel *)self bounds];
  double Width = CGRectGetWidth(v25);
  v8 = [(ReservationLabel *)self text];
  [v8 boundingRectWithSize:3 options:v6 context:Width];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  double Height = CGRectGetHeight(v26);
  v18 = [(ReservationLabel *)self font];
  [v18 lineHeight];
  uint64_t v20 = vcvtmd_s64_f64(Height / v19);

  BOOL v21 = (uint64_t)[(ReservationLabel *)self numberOfLines] >= v20;
  return v21;
}

- (ReservationLabelLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ReservationLabelLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end