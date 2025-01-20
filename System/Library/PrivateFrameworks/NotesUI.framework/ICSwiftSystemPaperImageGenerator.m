@interface ICSwiftSystemPaperImageGenerator
- (BOOL)drawPaperInRect:(CGRect)a3;
- (BOOL)hasDeepLink;
- (CGRect)paperContentBounds;
- (ICSwiftSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4;
- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4;
- (void)imageWithBounds:(CGRect)a3 completion:(id)a4;
@end

@implementation ICSwiftSystemPaperImageGenerator

- (ICSwiftSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  return (ICSwiftSystemPaperImageGenerator *)ICSwiftSystemPaperImageGenerator.init(paperAttachment:useActivePaper:)(a3, a4);
}

- (void)imageWithBounds:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = _Block_copy(a4);
  _Block_copy(v9);
  v10 = self;
  sub_1B0AF29B4(v10, (void (**)(void, void))v9, x, y, width, height);
  _Block_release(v9);
  _Block_release(v9);
}

- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4
{
  BOOL v4 = a3;
  v5 = self;
  v6 = sub_1B0AF2C90(v4);

  return v6;
}

- (BOOL)drawPaperInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  char v8 = sub_1B0AF0CD0(x, y, width, height);

  return v8 & 1;
}

- (CGRect)paperContentBounds
{
  v2 = self;
  double v3 = sub_1B0AF225C();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)hasDeepLink
{
  v2 = self;
  BOOL v3 = sub_1B0AF25E4();

  return v3;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___ICSwiftSystemPaperImageGenerator_cachedPaper;
  sub_1B0AF0788((uint64_t)v3);
}

@end