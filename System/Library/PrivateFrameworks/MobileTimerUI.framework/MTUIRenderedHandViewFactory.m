@interface MTUIRenderedHandViewFactory
+ (id)keyForBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6;
+ (id)registerForFactoryWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7;
+ (void)flushAllCaches;
+ (void)unregisterForFactory:(id)a3;
- (BOOL)allowCaching;
- (MTUIRenderedHandViewFactory)initWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7;
- (NSString)key;
- (id)imageForAngle:(double)a3 viewSize:(CGSize)a4;
- (id)renderImageForAngle:(double)a3 viewSize:(CGSize)a4;
- (unint64_t)registeredClientsCount;
- (void)dealloc;
- (void)flushCache;
- (void)setRegisteredClientsCount:(unint64_t)a3;
@end

@implementation MTUIRenderedHandViewFactory

+ (id)keyForBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v11 = a4;
  v12 = [a3 bundleIdentifier];
  v23.CGFloat x = x;
  v23.CGFloat y = y;
  v13 = NSStringFromCGPoint(v23);
  v24.CGFloat width = width;
  v24.CGFloat height = height;
  v14 = NSStringFromCGSize(v24);
  uint64_t v15 = [v12 length];
  uint64_t v16 = [v11 length] + v15;
  uint64_t v17 = [v13 length];
  uint64_t v18 = v16 + v17 + [v14 length];
  v19 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:v18];
  [v19 appendString:v12];
  [v19 appendString:v11];

  [v19 appendString:v13];
  [v19 appendString:v14];
  v20 = (void *)[[NSString alloc] initWithString:v19];

  return v20;
}

+ (id)registerForFactoryWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v14 = a3;
  id v15 = a4;
  if (!__factories)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v17 = (void *)__factories;
    __factories = (uint64_t)v16;

    uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v19 = [v18 addObserverForName:*MEMORY[0x263F1D060] object:0 queue:0 usingBlock:&__block_literal_global];
    v20 = (void *)__lowMemoryObserver;
    __lowMemoryObserver = v19;
  }
  v21 = objc_msgSend(a1, "keyForBundle:imagePath:offset:scale:", v14, v15, x, y, width, height);
  v22 = [(id)__factories objectForKey:v21];
  if (!v22)
  {
    v22 = -[MTUIRenderedHandViewFactory initWithBundle:imagePath:offset:scale:allowCaching:]([MTUIRenderedHandViewFactory alloc], "initWithBundle:imagePath:offset:scale:allowCaching:", v14, v15, v7, x, y, width, height);
    if (!v22) {
      goto LABEL_7;
    }
    [(id)__factories setObject:v22 forKey:v21];
  }
  [(MTUIRenderedHandViewFactory *)v22 setRegisteredClientsCount:[(MTUIRenderedHandViewFactory *)v22 registeredClientsCount] + 1];
LABEL_7:

  return v22;
}

uint64_t __96__MTUIRenderedHandViewFactory_registerForFactoryWithBundle_imagePath_offset_scale_allowCaching___block_invoke()
{
  __lowMemordouble y = 1;
  return +[MTUIRenderedHandViewFactory flushAllCaches];
}

+ (void)unregisterForFactory:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "setRegisteredClientsCount:", objc_msgSend(v8, "registeredClientsCount") - 1);
  if (![v8 registeredClientsCount])
  {
    v3 = (void *)__factories;
    v4 = [v8 key];
    [v3 removeObjectForKey:v4];
  }
  if (![(id)__factories count])
  {
    v5 = (void *)__factories;
    __factories = 0;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:__lowMemoryObserver];

    BOOL v7 = (void *)__lowMemoryObserver;
    __lowMemoryObserver = 0;

    __lowMemordouble y = 0;
  }
}

+ (void)flushAllCaches
{
  id v2 = [(id)__factories allValues];
  [v2 makeObjectsPerformSelector:sel_flushCache];
}

- (MTUIRenderedHandViewFactory)initWithBundle:(id)a3 imagePath:(id)a4 offset:(CGPoint)a5 scale:(CGSize)a6 allowCaching:(BOOL)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v15 = a3;
  id v16 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MTUIRenderedHandViewFactory;
  uint64_t v17 = [(MTUIRenderedHandViewFactory *)&v31 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_resourcesBundle, a3);
    objc_storeStrong((id *)&v18->_imagePath, a4);
    v18->_offset.CGFloat x = x;
    v18->_offset.CGFloat y = y;
    uint64_t v19 = (CGSize *)MEMORY[0x263F001B0];
    v18->_scale.CGFloat width = width;
    v18->_scale.CGFloat height = height;
    v18->_viewSize = *v19;
    v18->_allowCaching = a7;
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    angleCache = v18->_angleCache;
    v18->_angleCache = v20;

    v22 = [(NSBundle *)v18->_resourcesBundle pathForResource:v18->_imagePath ofType:@"pdf"];
    if (v22)
    {
      CFURLRef v23 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v22, kCFURLPOSIXPathStyle, 0);
      CGSize v24 = v18;
      if (v23)
      {
        CFURLRef v25 = v23;
        v26 = CGPDFDocumentCreateWithURL(v23);
        if (v26)
        {
          v27 = v26;
          Page = CGPDFDocumentGetPage(v26, 1uLL);
          v18->_page = CGPDFPageRetain(Page);
          CFRelease(v27);
        }
        CFRelease(v25);
        CGSize v24 = v18;
      }
    }
    else
    {
      CGSize v24 = 0;
    }
    v29 = v24;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)dealloc
{
  CGPDFPageRelease(self->_page);
  v3.receiver = self;
  v3.super_class = (Class)MTUIRenderedHandViewFactory;
  [(MTUIRenderedHandViewFactory *)&v3 dealloc];
}

- (NSString)key
{
  return (NSString *)+[MTUIRenderedHandViewFactory keyForBundle:imagePath:offset:scale:](MTUIRenderedHandViewFactory, "keyForBundle:imagePath:offset:scale:", self->_resourcesBundle, self->_imagePath, self->_offset.x, self->_offset.y, self->_scale.width, self->_scale.height);
}

- (id)renderImageForAngle:(double)a3 viewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v22.double width = width;
  v22.double height = height;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  double v12 = MTUIRoundToPixel(width * 0.5);
  double v13 = MTUIRoundToPixel(height * 0.5);
  CGContextTranslateCTM(CurrentContext, v12, v13);
  CGContextRotateCTM(CurrentContext, a3 + 3.14159265);
  CGRect BoxRect = CGPDFPageGetBoxRect(self->_page, kCGPDFMediaBox);
  double v14 = BoxRect.size.width;
  double v15 = self->_scale.width;
  double v16 = self->_scale.height;
  if (v15 != *MEMORY[0x263F001B0] || v16 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v14 = v15 * BoxRect.size.width;
    CGContextScaleCTM(CurrentContext, v15, v16);
  }
  double v18 = MTUIRoundToPixel(v14 * -0.5);
  CGContextTranslateCTM(CurrentContext, v18 + self->_offset.x, self->_offset.y);
  CGContextDrawPDFPage(CurrentContext, self->_page);
  uint64_t v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (id)imageForAngle:(double)a3 viewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  char v8 = !self->_allowCaching | __lowMemory;
  if (!self->_allowCaching | __lowMemory & 1)
  {
    double v9 = 0;
  }
  else
  {
    double v11 = self->_viewSize.width;
    CGFloat v10 = self->_viewSize.height;
    if (v11 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      self->_viewSize.double width = width;
      self->_viewSize.double height = a4.height;
      CGFloat v10 = a4.height;
      double v11 = width;
    }
    if (v11 == width && v10 == a4.height)
    {
      *(float *)&CGFloat v10 = a3;
      double v9 = [NSNumber numberWithFloat:v10];
      double v14 = [(NSMutableDictionary *)self->_angleCache objectForKey:v9];
      if (v14) {
        goto LABEL_18;
      }
    }
    else
    {
      [(MTUIRenderedHandViewFactory *)self flushCache];
      double v9 = 0;
      self->_allowCaching = 0;
    }
  }
  double v14 = -[MTUIRenderedHandViewFactory renderImageForAngle:viewSize:](self, "renderImageForAngle:viewSize:", a3, width, height);
  if ((v8 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_angleCache removeAllObjects];
    if (v14) {
      [(NSMutableDictionary *)self->_angleCache setObject:v14 forKey:v9];
    }
  }
LABEL_18:

  return v14;
}

- (void)flushCache
{
}

- (BOOL)allowCaching
{
  return self->_allowCaching;
}

- (unint64_t)registeredClientsCount
{
  return self->_registeredClientsCount;
}

- (void)setRegisteredClientsCount:(unint64_t)a3
{
  self->_registeredClientsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angleCache, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);

  objc_storeStrong((id *)&self->_resourcesBundle, 0);
}

@end