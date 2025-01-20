@interface SUUIBrowseItemComponent
- (BOOL)showTopBorder;
- (NSString)subtitle;
- (NSString)title;
- (SUUIBrowseItemComponent)initWithViewElement:(id)a3;
- (SUUIImageViewElement)decorationImage;
- (int64_t)componentType;
- (int64_t)index;
- (void)setIndex:(int64_t)a3;
- (void)setShowTopBorder:(BOOL)a3;
@end

@implementation SUUIBrowseItemComponent

- (SUUIBrowseItemComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIBrowseItemComponent;
  v5 = [(SUUIPageComponent *)&v18 initWithViewElement:v4];
  if (v5)
  {
    v6 = [v4 metadata];
    if ([v6 count])
    {
      v7 = [v6 objectAtIndex:0];
      v8 = [v7 text];
      uint64_t v9 = [v8 string];
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      v11 = [v6 objectAtIndex:1];
      v12 = [v11 text];
      uint64_t v13 = [v12 string];
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v13;
    }
    uint64_t v15 = [v4 decorationImage];
    decorationImage = v5->_decorationImage;
    v5->_decorationImage = (SUUIImageViewElement *)v15;
  }
  return v5;
}

- (int64_t)componentType
{
  return 16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (BOOL)showTopBorder
{
  return self->_showTopBorder;
}

- (void)setShowTopBorder:(BOOL)a3
{
  self->_showTopBorder = a3;
}

- (SUUIImageViewElement)decorationImage
{
  return self->_decorationImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end