@interface SLDEmptySlotContent
- (BOOL)isRemote;
- (BOOL)shouldReplaceExistingContent;
- (CGSize)contentSize;
- (SLDEmptySlotContent)initWithStyle:(id)a3 forRemote:(BOOL)a4;
- (UISSlotStyle)style;
- (id)image;
- (unsigned)contentScale;
- (void)setContentSize:(CGSize)a3;
- (void)setIsRemote:(BOOL)a3;
- (void)setStyle:(id)a3;
@end

@implementation SLDEmptySlotContent

- (SLDEmptySlotContent)initWithStyle:(id)a3 forRemote:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLDEmptySlotContent;
  v8 = [(SLDEmptySlotContent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_style, a3);
    [(SLDEmptySlotContent *)v9 setIsRemote:v4];
  }

  return v9;
}

- (unsigned)contentScale
{
  return 1;
}

- (BOOL)shouldReplaceExistingContent
{
  return 0;
}

- (id)image
{
  return 0;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setIsRemote:(BOOL)a3
{
  self->_isRemote = a3;
}

- (void).cxx_destruct
{
}

@end