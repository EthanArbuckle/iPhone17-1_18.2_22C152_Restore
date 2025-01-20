@interface VUILibraryProductInfoSection
+ (id)dataViewWithString:(id)a3;
+ (id)headerViewWithString:(id)a3;
- (NSArray)dataViews;
- (NSString)groupName;
- (UIEdgeInsets)headerMargin;
- (UIEdgeInsets)headerPadding;
- (UIView)headerContentView;
- (double)lineSpacing;
- (void)setDataViews:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHeaderContentView:(id)a3;
- (void)setHeaderPadding:(UIEdgeInsets)a3;
- (void)setLineSpacing:(double)a3;
@end

@implementation VUILibraryProductInfoSection

+ (id)headerViewWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v4 setTextStyle:15];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v4 setColor:v5];

  [(VUITextLayout *)v4 setFontWeight:10];
  [(VUITextLayout *)v4 setTextTransform:2];
  [(VUITextLayout *)v4 setNumberOfLinesAXSmall:1];
  [(VUITextLayout *)v4 setNumberOfLinesAXLarge:1];
  v6 = +[VUILabel labelWithString:v3 textLayout:v4 existingLabel:0];

  return v6;
}

+ (id)dataViewWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v4 setTextStyle:14];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v4 setColor:v5];

  [(VUITextLayout *)v4 setNumberOfLinesAXSmall:1];
  [(VUITextLayout *)v4 setNumberOfLinesAXLarge:1];
  [(VUITextLayout *)v4 setMinimumScaleFactor:0.7];
  v6 = +[VUILabel labelWithString:v3 textLayout:v4 existingLabel:0];

  return v6;
}

- (UIEdgeInsets)headerMargin
{
  double v2 = 19.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (void)setHeaderContentView:(id)a3
{
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (void)setDataViews:(id)a3
{
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIEdgeInsets)headerPadding
{
  double top = self->_headerPadding.top;
  double left = self->_headerPadding.left;
  double bottom = self->_headerPadding.bottom;
  double right = self->_headerPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHeaderPadding:(UIEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end