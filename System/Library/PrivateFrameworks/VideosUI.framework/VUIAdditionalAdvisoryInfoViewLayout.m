@interface VUIAdditionalAdvisoryInfoViewLayout
- (CGSize)dividerSize;
- (CGSize)logoSize;
- (CGSize)portraitDividerSize;
- (CGSize)portraitLogoSize;
- (UIColor)dividerColor;
- (UIEdgeInsets)descriptionMargin;
- (UIEdgeInsets)dividerMargin;
- (UIEdgeInsets)logoMargin;
- (UIEdgeInsets)portraitDescriptionMargin;
- (UIEdgeInsets)portraitDividerMargin;
- (UIEdgeInsets)portraitLogoMargin;
- (UIEdgeInsets)portraitMargin;
- (VUIAdditionalAdvisoryInfoViewLayout)init;
- (VUITextLayout)descriptionLayout;
- (VUITextLayout)portraitDescriptionLayout;
- (double)descriptionCornerRadius;
- (double)descriptionWidth;
- (void)setDescriptionCornerRadius:(double)a3;
- (void)setDescriptionMargin:(UIEdgeInsets)a3;
- (void)setDescriptionWidth:(double)a3;
- (void)setDividerMargin:(UIEdgeInsets)a3;
- (void)setDividerSize:(CGSize)a3;
- (void)setLogoMargin:(UIEdgeInsets)a3;
- (void)setLogoSize:(CGSize)a3;
- (void)setPortraitDescriptionMargin:(UIEdgeInsets)a3;
- (void)setPortraitDividerMargin:(UIEdgeInsets)a3;
- (void)setPortraitDividerSize:(CGSize)a3;
- (void)setPortraitLogoMargin:(UIEdgeInsets)a3;
- (void)setPortraitLogoSize:(CGSize)a3;
- (void)setPortraitMargin:(UIEdgeInsets)a3;
@end

@implementation VUIAdditionalAdvisoryInfoViewLayout

- (VUIAdditionalAdvisoryInfoViewLayout)init
{
  v16.receiver = self;
  v16.super_class = (Class)VUIAdditionalAdvisoryInfoViewLayout;
  v2 = [(TVViewLayout *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_logoSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    *(_OWORD *)&v2->_logoMargin.top = xmmword_1E38FD9F0;
    *(_OWORD *)&v2->_logoMargin.bottom = xmmword_1E38FDE80;
    v2->_portraitLogoSize = (CGSize)vdupq_n_s64(0x4041800000000000uLL);
    __asm { FMOV            V1.2D, #5.0 }
    long long v15 = _Q1;
    *(_OWORD *)&v2->_portraitLogoMargin.top = xmmword_1E38FDE90;
    *(_OWORD *)&v2->_portraitLogoMargin.bottom = _Q1;
    v2->_descriptionWidth = 220.0;
    uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
    dividerColor = v3->_dividerColor;
    v3->_dividerColor = (UIColor *)v9;

    *(_OWORD *)&v3->_dividerMargin.top = xmmword_1E38FDEA0;
    *(_OWORD *)&v3->_dividerMargin.bottom = xmmword_1E38FDEA0;
    *(_OWORD *)&v3->_portraitDividerMargin.top = xmmword_1E38FDEB0;
    *(_OWORD *)&v3->_portraitDividerMargin.bottom = xmmword_1E38FDEB0;
    v3->_dividerSize = (CGSize)xmmword_1E38FDEC0;
    v3->_portraitDividerSize = (CGSize)xmmword_1E38FDED0;
    v3->_descriptionCornerRadius = 3.0;
    *(_OWORD *)&v3->_descriptionMargin.top = xmmword_1E38FDE80;
    *(_OWORD *)&v3->_descriptionMargin.bottom = xmmword_1E38FD9F0;
    *(_OWORD *)&v3->_portraitDescriptionMargin.top = v15;
    *(_OWORD *)&v3->_portraitDescriptionMargin.bottom = xmmword_1E38FDE90;
    v11 = (VUITextLayout *)objc_opt_new();
    [(VUITextLayout *)v11 setTextStyle:13];
    [(VUITextLayout *)v11 setNumberOfLines:3];
    [(VUITextLayout *)v11 setFontWeight:5];
    v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [(VUITextLayout *)v11 setColor:v12];

    -[VUITextLayout setMargin:](v11, "setMargin:", 0.0, 3.0, 0.0, 0.0);
    [(VUITextLayout *)v11 setFontSize:10.0];
    [(VUITextLayout *)v11 setAllowsTextAlignmentOverride:1];
    descriptionLayout = v3->_descriptionLayout;
    v3->_descriptionLayout = v11;

    -[TVViewLayout setMargin:](v3, "setMargin:", 10.0, 20.0, 0.0, 0.0);
    -[VUIAdditionalAdvisoryInfoViewLayout setPortraitMargin:](v3, "setPortraitMargin:", 5.0, 10.0, 0.0, 0.0);
  }
  return v3;
}

- (CGSize)logoSize
{
  double width = self->_logoSize.width;
  double height = self->_logoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLogoSize:(CGSize)a3
{
  self->_logoSize = a3;
}

- (UIEdgeInsets)logoMargin
{
  double top = self->_logoMargin.top;
  double left = self->_logoMargin.left;
  double bottom = self->_logoMargin.bottom;
  double right = self->_logoMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLogoMargin:(UIEdgeInsets)a3
{
  self->_logoMargin = a3;
}

- (double)descriptionWidth
{
  return self->_descriptionWidth;
}

- (void)setDescriptionWidth:(double)a3
{
  self->_descriptionWidth = a3;
}

- (UIEdgeInsets)descriptionMargin
{
  double top = self->_descriptionMargin.top;
  double left = self->_descriptionMargin.left;
  double bottom = self->_descriptionMargin.bottom;
  double right = self->_descriptionMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDescriptionMargin:(UIEdgeInsets)a3
{
  self->_descriptionMargin = a3;
}

- (double)descriptionCornerRadius
{
  return self->_descriptionCornerRadius;
}

- (void)setDescriptionCornerRadius:(double)a3
{
  self->_descriptionCornerRadius = a3;
}

- (UIEdgeInsets)dividerMargin
{
  double top = self->_dividerMargin.top;
  double left = self->_dividerMargin.left;
  double bottom = self->_dividerMargin.bottom;
  double right = self->_dividerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDividerMargin:(UIEdgeInsets)a3
{
  self->_dividerMargin = a3;
}

- (CGSize)dividerSize
{
  double width = self->_dividerSize.width;
  double height = self->_dividerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDividerSize:(CGSize)a3
{
  self->_dividerSize = a3;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (UIEdgeInsets)portraitMargin
{
  double top = self->_portraitMargin.top;
  double left = self->_portraitMargin.left;
  double bottom = self->_portraitMargin.bottom;
  double right = self->_portraitMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitMargin:(UIEdgeInsets)a3
{
  self->_portraitMargin = a3;
}

- (CGSize)portraitLogoSize
{
  double width = self->_portraitLogoSize.width;
  double height = self->_portraitLogoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPortraitLogoSize:(CGSize)a3
{
  self->_portraitLogoSize = a3;
}

- (UIEdgeInsets)portraitLogoMargin
{
  double top = self->_portraitLogoMargin.top;
  double left = self->_portraitLogoMargin.left;
  double bottom = self->_portraitLogoMargin.bottom;
  double right = self->_portraitLogoMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitLogoMargin:(UIEdgeInsets)a3
{
  self->_portraitLogoMargin = a3;
}

- (UIEdgeInsets)portraitDescriptionMargin
{
  double top = self->_portraitDescriptionMargin.top;
  double left = self->_portraitDescriptionMargin.left;
  double bottom = self->_portraitDescriptionMargin.bottom;
  double right = self->_portraitDescriptionMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitDescriptionMargin:(UIEdgeInsets)a3
{
  self->_portraitDescriptionMargin = a3;
}

- (UIEdgeInsets)portraitDividerMargin
{
  double top = self->_portraitDividerMargin.top;
  double left = self->_portraitDividerMargin.left;
  double bottom = self->_portraitDividerMargin.bottom;
  double right = self->_portraitDividerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitDividerMargin:(UIEdgeInsets)a3
{
  self->_portraitDividerMargin = a3;
}

- (CGSize)portraitDividerSize
{
  double width = self->_portraitDividerSize.width;
  double height = self->_portraitDividerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPortraitDividerSize:(CGSize)a3
{
  self->_portraitDividerSize = a3;
}

- (VUITextLayout)portraitDescriptionLayout
{
  return self->_portraitDescriptionLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitDescriptionLayout, 0);
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end