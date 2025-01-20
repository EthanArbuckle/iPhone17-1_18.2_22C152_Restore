@interface THWPStorageImager
+ (CGSize)sizeForMaxSize:(CGSize)a3 withStorage:(id)a4;
+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4;
+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4 viewScale:(double)a5;
- (CGSize)sizeForMaxSize:(CGSize)a3;
- (THWPStorageImager)initWithStorage:(id)a3;
- (TSWPColumn)wpColumnHelper;
- (TSWPStorage)wpStorage;
- (TSWPText)wpTextHelper;
- (id)imageForMaxSize:(CGSize)a3;
- (id)imageWithSize:(CGSize)a3;
- (id)imageWithUnscaledSize:(CGSize)a3 viewScale:(double)a4;
- (void)dealloc;
- (void)setWpColumnHelper:(id)a3;
- (void)setWpStorage:(id)a3;
- (void)setWpTextHelper:(id)a3;
@end

@implementation THWPStorageImager

- (THWPStorageImager)initWithStorage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWPStorageImager;
  v4 = [(THWPStorageImager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THWPStorageImager *)v4 setWpStorage:a3];
    -[THWPStorageImager setWpTextHelper:](v5, "setWpTextHelper:", objc_msgSend(objc_alloc((Class)TSWPText), "initWithParagraphStyle:columnStyle:", objc_msgSend(objc_msgSend(a3, "stylesheet"), "defaultParagraphStyle"), +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", objc_msgSend(a3, "context")))));
  }
  return v5;
}

- (void)dealloc
{
  self->mWPStorage = 0;
  self->mWPTextHelper = 0;

  self->mWPColumnHelper = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWPStorageImager;
  [(THWPStorageImager *)&v3 dealloc];
}

+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [objc_alloc((Class)a1) initWithStorage:a3];
  id v7 = [v6 imageForMaxSize:width, height];

  return v7;
}

+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4 viewScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [objc_alloc((Class)a1) initWithStorage:a3];
  [v7 sizeForMaxSize:width, height];
  [v7 imageWithUnscaledSize:v8];

  return v8;
}

- (id)imageForMaxSize:(CGSize)a3
{
  -[THWPStorageImager sizeForMaxSize:](self, "sizeForMaxSize:", a3.width, a3.height);

  return -[THWPStorageImager imageWithSize:](self, "imageWithSize:");
}

+ (CGSize)sizeForMaxSize:(CGSize)a3 withStorage:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [[THWPStorageImager alloc] initWithStorage:a4];
  -[THWPStorageImager sizeForMaxSize:](v6, "sizeForMaxSize:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)sizeForMaxSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(THWPStorageImager *)self wpColumnHelper]
    || (([(TSWPColumn *)[(THWPStorageImager *)self wpColumnHelper] frameBounds],
         width == v7)
      ? (BOOL v8 = height == v6)
      : (BOOL v8 = 0),
        !v8))
  {
    -[THWPStorageImager setWpColumnHelper:](self, "setWpColumnHelper:", -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]([(THWPStorageImager *)self wpTextHelper], "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", [(THWPStorageImager *)self wpStorage], 0, 0, 4111, CGSizeZero.width, CGSizeZero.height, width, height, CGPointZero.x, CGPointZero.y));
  }
  [(TSWPColumn *)[(THWPStorageImager *)self wpColumnHelper] frameBounds];
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGRect v13 = CGRectIntegral(v12);
  double v9 = v13.size.width;
  double v10 = v13.size.height + 1.0;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)imageWithSize:(CGSize)a3
{
  return -[THWPStorageImager imageWithUnscaledSize:viewScale:](self, "imageWithUnscaledSize:viewScale:", a3.width, a3.height, 1.0);
}

- (id)imageWithUnscaledSize:(CGSize)a3 viewScale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  [(TSWPColumn *)[(THWPStorageImager *)self wpColumnHelper] frameBounds];
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  CGRect v12 = CGRectIntegral(v11);
  if (height != v12.size.height) {
    -[THWPStorageImager setWpColumnHelper:](self, "setWpColumnHelper:", -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]([(THWPStorageImager *)self wpTextHelper], "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", [(THWPStorageImager *)self wpStorage], 0, 0, 4111, width, height, width, height, CGPointZero.x, CGPointZero.y));
  }
  CGAffineTransformMakeScale(&v10, a4, a4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_76790;
  v9[3] = &unk_458200;
  *(double *)&v9[5] = a4;
  v9[4] = self;
  return +[TSUImage imageWithSize:drawnUsingBlock:](TSUImage, "imageWithSize:drawnUsingBlock:", v9, height * v10.c + v10.a * width, height * v10.d + v10.b * width);
}

- (TSWPStorage)wpStorage
{
  return self->mWPStorage;
}

- (void)setWpStorage:(id)a3
{
}

- (TSWPText)wpTextHelper
{
  return self->mWPTextHelper;
}

- (void)setWpTextHelper:(id)a3
{
}

- (TSWPColumn)wpColumnHelper
{
  return self->mWPColumnHelper;
}

- (void)setWpColumnHelper:(id)a3
{
}

@end