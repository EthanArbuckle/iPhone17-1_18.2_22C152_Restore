@interface UISSlotLocalContent
+ (id)contentWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5;
+ (id)contentWithDrawing:(id)a3 style:(id)a4;
+ (id)contentWithImage:(CGImage *)a3 scale:(unsigned __int8)a4;
- (BOOL)isRemote;
- (BOOL)shouldReplaceExistingContent;
- (CGSize)contentSize;
- (UISSlotLocalContent)initWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5;
- (UISSlotLocalContent)initWithImage:(CGImage *)a3 scale:(unsigned __int8)a4;
- (id)image;
- (unsigned)contentScale;
- (void)dealloc;
@end

@implementation UISSlotLocalContent

- (UISSlotLocalContent)initWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISSlotLocalContent;
  v9 = [(UISSlotLocalContent *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_contentScale = v6;
    [v8 drawingSize];
    v10->_contentSize.width = v11;
    v10->_contentSize.height = v12;
    v10->_localImage = UISCreateImageFromDrawing(v8, a5, (double)v6);
  }

  return v10;
}

- (UISSlotLocalContent)initWithImage:(CGImage *)a3 scale:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UISSlotLocalContent;
  unsigned int v6 = [(UISSlotLocalContent *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_contentScale = v4;
    CGFloat v8 = (double)(CGImageGetWidth(a3) / v4);
    size_t Height = CGImageGetHeight(a3);
    v7->_contentSize.width = v8;
    v7->_contentSize.height = (double)(Height / v4);
    v7->_localImage = CGImageRetain(a3);
  }
  return v7;
}

+ (id)contentWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  CGFloat v8 = [[UISSlotLocalContent alloc] initWithDrawing:v7 scale:v6 range:a5];

  return v8;
}

+ (id)contentWithDrawing:(id)a3 style:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [UISSlotLocalContent alloc];
  uint64_t v8 = [v5 displayScale];
  uint64_t v9 = [v5 displayRange];

  v10 = [(UISSlotLocalContent *)v7 initWithDrawing:v6 scale:v8 range:v9];
  return v10;
}

+ (id)contentWithImage:(CGImage *)a3 scale:(unsigned __int8)a4
{
  unsigned int v4 = [[UISSlotLocalContent alloc] initWithImage:a3 scale:a4];
  return v4;
}

- (void)dealloc
{
  CGImageRelease(self->_localImage);
  v3.receiver = self;
  v3.super_class = (Class)UISSlotLocalContent;
  [(UISSlotLocalContent *)&v3 dealloc];
}

- (id)image
{
  return self->_localImage;
}

- (BOOL)isRemote
{
  return 0;
}

- (unsigned)contentScale
{
  return self->_contentScale;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldReplaceExistingContent
{
  return 1;
}

@end