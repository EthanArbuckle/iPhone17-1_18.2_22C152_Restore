@interface TUIChartBox
- (Class)layoutClass;
- (NSDictionary)fontAttributes;
- (NSString)chartType;
- (NSString)footer;
- (NSString)title;
- (TUIFontSpec)fontSpec;
- (UIColor)backgroundColor;
- (UIColor)color;
- (UIColor)shadowColor;
- (double)cornerRadius;
- (double)progress;
- (double)spacing;
- (id)description;
- (int64_t)columns;
- (void)setBackgroundColor:(id)a3;
- (void)setChartType:(id)a3;
- (void)setColor:(id)a3;
- (void)setColumns:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontAttributes:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setFooter:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUIChartBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v3);
  v16 = [(TUIChartBox *)self chartType];
  v18 = [(TUIChartBox *)self title];
  v15 = [(TUIChartBox *)self footer];
  v14 = +[NSNumber numberWithInteger:[(TUIChartBox *)self columns]];
  [(TUIChartBox *)self cornerRadius];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(TUIChartBox *)self progress];
  v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(TUIChartBox *)self spacing];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5 = [(TUIChartBox *)self color];
  v6 = [(TUIChartBox *)self backgroundColor];
  v7 = [(TUIChartBox *)self shadowColor];
  v8 = [(TUIChartBox *)self fontSpec];
  v9 = [(TUIChartBox *)self fontAttributes];
  v10 = +[NSString stringWithFormat:@"<%@(%p) type=\"%@\" title=\"%@\" footer=\"%@\" columns=%@ cornerRadius=%@ progress=%@ spacing=%@ color=%@ backgroundColor=%@ shadowColor=%@ fontSpec=%@ fontAttributes=%@ >", v17, self, v16, v18, v15, v14, v13, v12, v4, v5, v6, v7, v8, v9];

  return v10;
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

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (NSDictionary)fontAttributes
{
  return self->_fontAttributes;
}

- (void)setFontAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_chartType, 0);
}

@end