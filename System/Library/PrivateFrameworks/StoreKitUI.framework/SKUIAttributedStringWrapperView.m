@interface SKUIAttributedStringWrapperView
- (BOOL)textColorFollowsTintColor;
- (BOOL)usesTallCharacterSet;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIAttributedStringView)delegateView;
- (SKUIAttributedStringWrapperView)initWithFrame:(CGRect)a3;
- (double)baselineOffset;
- (double)firstBaselineOffset;
- (id)layout;
- (id)requiredBadges;
- (id)textColor;
- (id)treatmentColor;
- (int64_t)badgePlacement;
- (int64_t)firstLineTopInset;
- (int64_t)stringTreatment;
- (void)layoutSubviews;
- (void)setBadgePlacement:(int64_t)a3;
- (void)setFirstLineTopInset:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setRequiredBadges:(id)a3;
- (void)setStringTreatment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextColorFollowsTintColor:(BOOL)a3;
- (void)setTreatmentColor:(id)a3;
- (void)viewWasRecycled;
@end

@implementation SKUIAttributedStringWrapperView

- (SKUIAttributedStringWrapperView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SKUIAttributedStringWrapperView;
  v7 = -[SKUIAttributedStringView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SKUIAttributedStringView initWithFrame:]([SKUIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
    delegateView = v7->_delegateView;
    v7->_delegateView = v8;

    v10 = v7->_delegateView;
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIAttributedStringView *)v10 setBackgroundColor:v11];

    [(SKUIAttributedStringWrapperView *)v7 addSubview:v7->_delegateView];
  }
  return v7;
}

- (void)viewWasRecycled
{
}

- (int64_t)badgePlacement
{
  return [(SKUIAttributedStringView *)self->_delegateView badgePlacement];
}

- (double)baselineOffset
{
  [(SKUIAttributedStringView *)self->_delegateView baselineOffset];
  return result;
}

- (double)firstBaselineOffset
{
  [(SKUIAttributedStringView *)self->_delegateView firstBaselineOffset];
  return result;
}

- (void)setBadgePlacement:(int64_t)a3
{
}

- (void)setFirstLineTopInset:(int64_t)a3
{
}

- (int64_t)firstLineTopInset
{
  return [(SKUIAttributedStringView *)self->_delegateView firstLineTopInset];
}

- (void)setLayout:(id)a3
{
}

- (id)layout
{
  return [(SKUIAttributedStringView *)self->_delegateView layout];
}

- (void)setRequiredBadges:(id)a3
{
}

- (id)requiredBadges
{
  return [(SKUIAttributedStringView *)self->_delegateView requiredBadges];
}

- (void)setStringTreatment:(int64_t)a3
{
}

- (int64_t)stringTreatment
{
  return [(SKUIAttributedStringView *)self->_delegateView stringTreatment];
}

- (void)setTextColor:(id)a3
{
}

- (id)textColor
{
  return [(SKUIAttributedStringView *)self->_delegateView textColor];
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
}

- (BOOL)textColorFollowsTintColor
{
  return [(SKUIAttributedStringView *)self->_delegateView textColorFollowsTintColor];
}

- (void)setTreatmentColor:(id)a3
{
}

- (id)treatmentColor
{
  return [(SKUIAttributedStringView *)self->_delegateView treatmentColor];
}

- (BOOL)usesTallCharacterSet
{
  return [(SKUIAttributedStringView *)self->_delegateView usesTallCharacterSet];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SKUIAttributedStringWrapperView;
  [(SKUIAttributedStringWrapperView *)&v25 layoutSubviews];
  v3 = [(SKUIAttributedStringWrapperView *)self layout];
  [v3 edgeInsetsForShadow];
  double v5 = -v4;

  v6 = [(SKUIAttributedStringWrapperView *)self layout];
  [v6 edgeInsetsForShadow];
  double v8 = -v7;

  v9 = [(SKUIAttributedStringWrapperView *)self layout];
  [v9 edgeInsetsForShadow];
  double v11 = v10;
  [(SKUIAttributedStringWrapperView *)self bounds];
  double v13 = v11 + v12;
  v14 = [(SKUIAttributedStringWrapperView *)self layout];
  [v14 edgeInsetsForShadow];
  double v16 = v13 + v15;

  v17 = [(SKUIAttributedStringWrapperView *)self layout];
  [v17 edgeInsetsForShadow];
  double v19 = v18;
  [(SKUIAttributedStringWrapperView *)self bounds];
  double v21 = v19 + v20;
  v22 = [(SKUIAttributedStringWrapperView *)self layout];
  [v22 edgeInsetsForShadow];
  double v24 = v21 + v23;

  [(SKUIAttributedStringWrapperView *)self sendSubviewToBack:self->_delegateView];
  -[SKUIAttributedStringView setFrame:](self->_delegateView, "setFrame:", v5, v8, v16, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SKUIAttributedStringView sizeThatFits:](self->_delegateView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (SKUIAttributedStringView)delegateView
{
  return self->_delegateView;
}

- (void).cxx_destruct
{
}

@end