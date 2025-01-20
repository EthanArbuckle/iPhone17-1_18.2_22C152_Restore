@interface ICSystemPaperImageGenerator
+ (id)imageGeneratorWithPaperAttachment:(id)a3;
+ (id)imageGeneratorWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4;
- (BOOL)drawPaperInRect:(CGRect)a3;
- (BOOL)hasDeepLink;
- (BOOL)isSixChannelBlendingEnabled;
- (BOOL)validatePaperBounds:(CGRect)a3;
- (CGRect)paperContentBounds;
- (ICSystemPaperImageGenerator)init;
- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3;
- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4;
- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4;
- (void)setSixChannelBlendingEnabled:(BOOL)a3;
@end

@implementation ICSystemPaperImageGenerator

- (ICSystemPaperImageGenerator)init
{
  return 0;
}

- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3
{
  return [(ICSystemPaperImageGenerator *)self initWithPaperAttachment:a3 useActivePaper:0];
}

- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICSystemPaperImageGenerator;
  result = [(ICSystemPaperImageGenerator *)&v5 init];
  result->_sixChannelBlendingEnabled = 1;
  return result;
}

- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4
{
  return 0;
}

- (BOOL)drawPaperInRect:(CGRect)a3
{
  return 0;
}

+ (id)imageGeneratorWithPaperAttachment:(id)a3
{
  id v3 = a3;
  v4 = NSClassFromString(&cfstr_Icswiftsystemp.isa);
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftClass) != nil)", "+[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:]", 1, 0, @"Expected non-nil value for '%s'", "swiftClass");
  }
  objc_super v5 = (void *)[[v4 alloc] initWithPaperAttachment:v3 useActivePaper:0];

  return v5;
}

+ (id)imageGeneratorWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = NSClassFromString(&cfstr_Icswiftsystemp.isa);
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftClass) != nil)", "+[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:useActivePaper:]", 1, 0, @"Expected non-nil value for '%s'", "swiftClass");
  }
  v7 = (void *)[[v6 alloc] initWithPaperAttachment:v5 useActivePaper:v4];

  return v7;
}

- (CGRect)paperContentBounds
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)hasDeepLink
{
  return 0;
}

- (BOOL)validatePaperBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectGetWidth(a3) <= 10000000.0)
  {
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    if (CGRectGetHeight(v10) <= 10000000.0) {
      return 1;
    }
  }
  v7 = (void *)MEMORY[0x1E4F836F8];
  v8 = ICStringFromRect();
  [v7 handleFailedAssertWithCondition:"__objc_no", "-[ICSystemPaperImageGenerator validatePaperBounds:]", 1, 1, @"Unreasonably large paper bounds: %@", v8 functionName simulateCrash showAlert format];

  return 0;
}

- (BOOL)isSixChannelBlendingEnabled
{
  return self->_sixChannelBlendingEnabled;
}

- (void)setSixChannelBlendingEnabled:(BOOL)a3
{
  self->_sixChannelBlendingEnabled = a3;
}

@end