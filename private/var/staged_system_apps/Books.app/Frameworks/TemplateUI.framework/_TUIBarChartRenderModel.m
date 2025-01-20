@interface _TUIBarChartRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSString)chartType;
- (NSString)footer;
- (NSString)title;
- (UIColor)backgroundColor;
- (UIColor)color;
- (UIColor)shadowColor;
- (double)cornerRadius;
- (double)progress;
- (double)spacing;
- (id)animationGroups;
- (id)identifier;
- (int64_t)columns;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setChartType:(id)a3;
- (void)setColor:(id)a3;
- (void)setColumns:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFooter:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSpacing:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation _TUIBarChartRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (TUIRenderModelIsEqualToRenderModel(self, v6))
  {
    id v7 = [(_TUIBarChartRenderModel *)self columns];
    if (v7 == [v6 columns])
    {
      [(_TUIBarChartRenderModel *)self cornerRadius];
      double v9 = v8;
      [v6 cornerRadius];
      if (v9 == v10)
      {
        [(_TUIBarChartRenderModel *)self spacing];
        double v12 = v11;
        [v6 spacing];
        if (v12 == v13)
        {
          v14 = [(_TUIBarChartRenderModel *)self chartType];
          v15 = [v6 chartType];
          if (![v14 isEqualToString:v15])
          {
            BOOL v23 = 0;
LABEL_22:

            goto LABEL_16;
          }
          v16 = [(_TUIBarChartRenderModel *)self title];
          v17 = [v6 title];
          if (![v16 isEqualToString:v17])
          {
            BOOL v23 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v18 = [(_TUIBarChartRenderModel *)self footer];
          v19 = [v6 footer];
          unsigned int v20 = [v18 isEqualToString:v19];

          if (v20)
          {
            v14 = [(_TUIBarChartRenderModel *)self color];
            v15 = [v6 color];
            v16 = [(_TUIBarChartRenderModel *)self backgroundColor];
            v17 = [v6 backgroundColor];
            v21 = [(_TUIBarChartRenderModel *)self shadowColor];
            v22 = [v6 shadowColor];
            BOOL v23 = (v14 == v15 || [v14 isEqual:v15])
               && (v16 == v17 || [v16 isEqual:v17])
               && (v21 == v22 || [v21 isEqual:v22]);

            goto LABEL_21;
          }
        }
      }
    }
  }
  BOOL v23 = 0;
LABEL_16:

  return v23;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(_TUIBarChartRenderModel *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (id)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSString)chartType
{
  return self->_chartType;
}

- (void)setChartType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (int64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(int64_t)a3
{
  self->_columns = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chartType, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end