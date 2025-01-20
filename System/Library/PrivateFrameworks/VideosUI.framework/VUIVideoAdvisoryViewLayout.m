@interface VUIVideoAdvisoryViewLayout
- (CGSize)dividerSize;
- (CGSize)legendSize;
- (CGSize)logoSize;
- (CGSize)portraitDividerSize;
- (CGSize)portraitLegendSize;
- (CGSize)portraitLogoSize;
- (UIColor)dividerColor;
- (UIColor)legendBackgroundColor;
- (UIEdgeInsets)descriptionMargin;
- (UIEdgeInsets)dividerMargin;
- (UIEdgeInsets)legendNamePadding;
- (UIEdgeInsets)legendsMargin;
- (UIEdgeInsets)logoMargin;
- (UIEdgeInsets)portraitDescriptionMargin;
- (UIEdgeInsets)portraitDividerMargin;
- (UIEdgeInsets)portraitLegendsMargin;
- (UIEdgeInsets)portraitLogoMargin;
- (UIEdgeInsets)portraitMargin;
- (VUITextLayout)descriptionLayout;
- (VUITextLayout)legendLayout;
- (VUITextLayout)portraitLegendDescriptionLayout;
- (VUITextLayout)portraitLegendLayout;
- (VUIVideoAdvisoryViewLayout)init;
- (double)descriptionMaxWidth;
- (double)legendCornerRadius;
- (double)legendMaxWidth;
- (double)legendNameMinWidth;
- (void)setDescriptionMargin:(UIEdgeInsets)a3;
- (void)setDescriptionMaxWidth:(double)a3;
- (void)setDividerMargin:(UIEdgeInsets)a3;
- (void)setDividerSize:(CGSize)a3;
- (void)setLegendCornerRadius:(double)a3;
- (void)setLegendMaxWidth:(double)a3;
- (void)setLegendNameMinWidth:(double)a3;
- (void)setLegendNamePadding:(UIEdgeInsets)a3;
- (void)setLegendSize:(CGSize)a3;
- (void)setLegendsMargin:(UIEdgeInsets)a3;
- (void)setLogoMargin:(UIEdgeInsets)a3;
- (void)setLogoSize:(CGSize)a3;
- (void)setPortraitDescriptionMargin:(UIEdgeInsets)a3;
- (void)setPortraitDividerMargin:(UIEdgeInsets)a3;
- (void)setPortraitDividerSize:(CGSize)a3;
- (void)setPortraitLegendSize:(CGSize)a3;
- (void)setPortraitLegendsMargin:(UIEdgeInsets)a3;
- (void)setPortraitLogoMargin:(UIEdgeInsets)a3;
- (void)setPortraitLogoSize:(CGSize)a3;
- (void)setPortraitMargin:(UIEdgeInsets)a3;
@end

@implementation VUIVideoAdvisoryViewLayout

- (VUIVideoAdvisoryViewLayout)init
{
  v28.receiver = self;
  v28.super_class = (Class)VUIVideoAdvisoryViewLayout;
  v2 = [(TVViewLayout *)&v28 init];
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 408) = vdupq_n_s64(0x4049000000000000uLL);
    *(_OWORD *)(v2 + 504) = xmmword_1E38FD9F0;
    *(_OWORD *)(v2 + 520) = xmmword_1E38FDE80;
    *(int64x2_t *)(v2 + 456) = vdupq_n_s64(0x4041800000000000uLL);
    __asm { FMOV            V1.2D, #5.0 }
    long long v27 = _Q1;
    *(_OWORD *)(v2 + 696) = xmmword_1E38FDE90;
    *(_OWORD *)(v2 + 712) = _Q1;
    __asm { FMOV            V0.2D, #15.0 }
    *(_OWORD *)(v2 + 424) = _Q0;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)(v2 + 472) = _Q0;
    *(_OWORD *)(v2 + 536) = xmmword_1E38FE630;
    *(_OWORD *)(v2 + 552) = xmmword_1E38FE640;
    *(_OWORD *)(v2 + 728) = xmmword_1E38FE630;
    *(_OWORD *)(v2 + 744) = xmmword_1E38FE650;
    uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
    v12 = (void *)*((void *)v3 + 45);
    *((void *)v3 + 45) = v11;

    *(_OWORD *)(v3 + 600) = xmmword_1E38FDEA0;
    *(_OWORD *)(v3 + 616) = xmmword_1E38FDEA0;
    *(_OWORD *)(v3 + 760) = xmmword_1E38FDEB0;
    *(_OWORD *)(v3 + 776) = xmmword_1E38FDEB0;
    *(_OWORD *)(v3 + 440) = xmmword_1E38FDEC0;
    *(_OWORD *)(v3 + 488) = xmmword_1E38FDED0;
    *((void *)v3 + 42) = 0x402E000000000000;
    *(_OWORD *)(v3 + 568) = xmmword_1E38FDEB0;
    *(_OWORD *)(v3 + 584) = xmmword_1E38FDEB0;
    *((void *)v3 + 41) = 0x4072C00000000000;
    uint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
    v14 = (void *)*((void *)v3 + 43);
    *((void *)v3 + 43) = v13;

    *((void *)v3 + 44) = 0x4008000000000000;
    *((void *)v3 + 48) = 0x4062C00000000000;
    *(_OWORD *)(v3 + 632) = xmmword_1E38FDE80;
    *(_OWORD *)(v3 + 648) = xmmword_1E38FD9F0;
    *(_OWORD *)(v3 + 792) = v27;
    *(_OWORD *)(v3 + 808) = xmmword_1E38FDE90;
    v15 = objc_opt_new();
    [v15 setTextStyle:13];
    [v15 setFontWeight:7];
    [v15 setNumberOfLines:1];
    [v15 setAlignment:1];
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
    [v15 setColor:v16];

    [v15 setFontSize:15.0];
    objc_msgSend(v15, "setMargin:", 2.0, 2.0, 2.0, 2.0);
    [v15 setAllowsTextAlignmentOverride:1];
    objc_storeStrong((id *)v3 + 46, v15);
    [v15 setFontSize:10.0];
    objc_msgSend(v15, "setMargin:", 1.0, 1.0, 1.0, 1.0);
    v17 = (void *)*((void *)v3 + 49);
    *((void *)v3 + 49) = v15;
    id v18 = v15;

    v19 = objc_opt_new();
    [v19 setTextStyle:13];
    [v19 setNumberOfLines:3];
    [v19 setFontWeight:5];
    v20 = [MEMORY[0x1E4FB1618] whiteColor];
    [v19 setColor:v20];

    objc_msgSend(v19, "setMargin:", 0.0, 3.0, 0.0, 0.0);
    [v19 setFontSize:10.0];
    [v19 setAllowsTextAlignmentOverride:1];
    v21 = (void *)*((void *)v3 + 47);
    *((void *)v3 + 47) = v19;
    id v22 = v19;

    v23 = objc_opt_new();
    [v23 setTextStyle:13];
    [v23 setNumberOfLines:3];
    [v23 setFontWeight:5];
    v24 = [MEMORY[0x1E4FB1618] whiteColor];
    [v23 setColor:v24];

    objc_msgSend(v23, "setMargin:", 0.0, 1.5, 0.0, 0.0);
    [v23 setFontSize:7.0];
    [v23 setAllowsTextAlignmentOverride:1];
    v25 = (void *)*((void *)v3 + 50);
    *((void *)v3 + 50) = v23;

    objc_msgSend(v3, "setMargin:", 10.0, 20.0, 0.0, 0.0);
    objc_msgSend(v3, "setPortraitMargin:", 5.0, 10.0, 0.0, 0.0);
  }
  return (VUIVideoAdvisoryViewLayout *)v3;
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

- (CGSize)legendSize
{
  double width = self->_legendSize.width;
  double height = self->_legendSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLegendSize:(CGSize)a3
{
  self->_legendSize = a3;
}

- (double)legendMaxWidth
{
  return self->_legendMaxWidth;
}

- (void)setLegendMaxWidth:(double)a3
{
  self->_legendMaxWidth = a3;
}

- (UIEdgeInsets)legendsMargin
{
  double top = self->_legendsMargin.top;
  double left = self->_legendsMargin.left;
  double bottom = self->_legendsMargin.bottom;
  double right = self->_legendsMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLegendsMargin:(UIEdgeInsets)a3
{
  self->_legendsMargin = a3;
}

- (double)legendNameMinWidth
{
  return self->_legendNameMinWidth;
}

- (void)setLegendNameMinWidth:(double)a3
{
  self->_legendNameMinWidth = a3;
}

- (UIEdgeInsets)legendNamePadding
{
  double top = self->_legendNamePadding.top;
  double left = self->_legendNamePadding.left;
  double bottom = self->_legendNamePadding.bottom;
  double right = self->_legendNamePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLegendNamePadding:(UIEdgeInsets)a3
{
  self->_legendNamePadding = a3;
}

- (UIColor)legendBackgroundColor
{
  return self->_legendBackgroundColor;
}

- (double)legendCornerRadius
{
  return self->_legendCornerRadius;
}

- (void)setLegendCornerRadius:(double)a3
{
  self->_legendCornerRadius = a3;
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

- (VUITextLayout)legendLayout
{
  return self->_legendLayout;
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (double)descriptionMaxWidth
{
  return self->_descriptionMaxWidth;
}

- (void)setDescriptionMaxWidth:(double)a3
{
  self->_descriptionMaxWidth = a3;
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

- (CGSize)portraitLegendSize
{
  double width = self->_portraitLegendSize.width;
  double height = self->_portraitLegendSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPortraitLegendSize:(CGSize)a3
{
  self->_portraitLegendSize = a3;
}

- (UIEdgeInsets)portraitLegendsMargin
{
  double top = self->_portraitLegendsMargin.top;
  double left = self->_portraitLegendsMargin.left;
  double bottom = self->_portraitLegendsMargin.bottom;
  double right = self->_portraitLegendsMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitLegendsMargin:(UIEdgeInsets)a3
{
  self->_portraitLegendsMargin = a3;
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

- (VUITextLayout)portraitLegendLayout
{
  return self->_portraitLegendLayout;
}

- (VUITextLayout)portraitLegendDescriptionLayout
{
  return self->_portraitLegendDescriptionLayout;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitLegendDescriptionLayout, 0);
  objc_storeStrong((id *)&self->_portraitLegendLayout, 0);
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_legendLayout, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_legendBackgroundColor, 0);
}

@end