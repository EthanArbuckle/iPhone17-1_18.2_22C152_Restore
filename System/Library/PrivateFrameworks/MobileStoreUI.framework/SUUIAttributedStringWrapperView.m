@interface SUUIAttributedStringWrapperView
- (BOOL)textColorFollowsTintColor;
- (BOOL)usesTallCharacterSet;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIAttributedStringView)delegateView;
- (SUUIAttributedStringWrapperView)initWithFrame:(CGRect)a3;
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

@implementation SUUIAttributedStringWrapperView

- (SUUIAttributedStringWrapperView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAttributedStringWrapperView;
  v7 = -[SUUIAttributedStringView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SUUIAttributedStringView initWithFrame:]([SUUIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
    delegateView = v7->_delegateView;
    v7->_delegateView = v8;

    v10 = v7->_delegateView;
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIAttributedStringView *)v10 setBackgroundColor:v11];

    [(SUUIAttributedStringWrapperView *)v7 addSubview:v7->_delegateView];
  }
  return v7;
}

- (void)viewWasRecycled
{
}

- (int64_t)badgePlacement
{
  return [(SUUIAttributedStringView *)self->_delegateView badgePlacement];
}

- (double)baselineOffset
{
  [(SUUIAttributedStringView *)self->_delegateView baselineOffset];
  return result;
}

- (double)firstBaselineOffset
{
  [(SUUIAttributedStringView *)self->_delegateView firstBaselineOffset];
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
  return [(SUUIAttributedStringView *)self->_delegateView firstLineTopInset];
}

- (void)setLayout:(id)a3
{
}

- (id)layout
{
  return [(SUUIAttributedStringView *)self->_delegateView layout];
}

- (void)setRequiredBadges:(id)a3
{
}

- (id)requiredBadges
{
  return [(SUUIAttributedStringView *)self->_delegateView requiredBadges];
}

- (void)setStringTreatment:(int64_t)a3
{
}

- (int64_t)stringTreatment
{
  return [(SUUIAttributedStringView *)self->_delegateView stringTreatment];
}

- (void)setTextColor:(id)a3
{
}

- (id)textColor
{
  return [(SUUIAttributedStringView *)self->_delegateView textColor];
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
}

- (BOOL)textColorFollowsTintColor
{
  return [(SUUIAttributedStringView *)self->_delegateView textColorFollowsTintColor];
}

- (void)setTreatmentColor:(id)a3
{
}

- (id)treatmentColor
{
  return [(SUUIAttributedStringView *)self->_delegateView treatmentColor];
}

- (BOOL)usesTallCharacterSet
{
  return [(SUUIAttributedStringView *)self->_delegateView usesTallCharacterSet];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SUUIAttributedStringWrapperView;
  [(SUUIAttributedStringWrapperView *)&v25 layoutSubviews];
  v3 = [(SUUIAttributedStringWrapperView *)self layout];
  [v3 edgeInsetsForShadow];
  double v5 = -v4;

  v6 = [(SUUIAttributedStringWrapperView *)self layout];
  [v6 edgeInsetsForShadow];
  double v8 = -v7;

  v9 = [(SUUIAttributedStringWrapperView *)self layout];
  [v9 edgeInsetsForShadow];
  double v11 = v10;
  [(SUUIAttributedStringWrapperView *)self bounds];
  double v13 = v11 + v12;
  v14 = [(SUUIAttributedStringWrapperView *)self layout];
  [v14 edgeInsetsForShadow];
  double v16 = v13 + v15;

  v17 = [(SUUIAttributedStringWrapperView *)self layout];
  [v17 edgeInsetsForShadow];
  double v19 = v18;
  [(SUUIAttributedStringWrapperView *)self bounds];
  double v21 = v19 + v20;
  v22 = [(SUUIAttributedStringWrapperView *)self layout];
  [v22 edgeInsetsForShadow];
  double v24 = v21 + v23;

  [(SUUIAttributedStringWrapperView *)self sendSubviewToBack:self->_delegateView];
  -[SUUIAttributedStringView setFrame:](self->_delegateView, "setFrame:", v5, v8, v16, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SUUIAttributedStringView sizeThatFits:](self->_delegateView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (SUUIAttributedStringView)delegateView
{
  return self->_delegateView;
}

- (void).cxx_destruct
{
}

@end