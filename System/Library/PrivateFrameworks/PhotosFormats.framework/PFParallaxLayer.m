@interface PFParallaxLayer
- (BOOL)isBackfill;
- (BOOL)isBackground;
- (BOOL)isBackgroundLandscape;
- (BOOL)isDebug;
- (BOOL)isForeground;
- (BOOL)isForegroundLandscape;
- (BOOL)isInactive;
- (BOOL)isSettlingEffect;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (CGRect)frame;
- (CGSize)pixelSize;
- (NSString)fileExtension;
- (NSString)identifier;
- (PFParallaxLayer)initWithFrame:(CGRect)a3 zPosition:(double)a4 identifier:(id)a5;
- (double)zPosition;
- (id)debugDescription;
- (id)description;
- (id)layerByUpdatingFrame:(CGRect)a3;
- (id)makeUniqueFileNameWithFileNames:(id)a3 orientation:(int64_t)a4;
@end

@implementation PFParallaxLayer

- (NSString)fileExtension
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PFParallaxLayer *)_PFAssertFailHandler();
  return (NSString *)[(PFParallaxLayer *)v3 saveToURL:v5 error:v6];
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (PFParallaxLayer *)_PFAssertFailHandler();
  return [(PFParallaxLayer *)v6 makeUniqueFileNameWithFileNames:v8 orientation:v9];
}

- (id)makeUniqueFileNameWithFileNames:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    SEL v7 = @"portrait";
  }
  else
  {
    if (a4 != 2)
    {
      v18 = (PFParallaxImageLayer *)_PFAssertFailHandler();
      return [(PFParallaxImageLayer *)v18 fileExtension];
    }
    SEL v7 = @"landscape";
  }
  id v8 = NSString;
  int64_t v9 = [(PFParallaxLayer *)self identifier];
  v10 = [(PFParallaxLayer *)self fileExtension];
  v11 = [v8 stringWithFormat:@"%@-layer_%@.%@", v7, v9, v10];

  if ([v6 containsObject:v11])
  {
    v12 = NSString;
    v13 = [(PFParallaxLayer *)self identifier];
    uint64_t v14 = [v6 count];
    v15 = [(PFParallaxLayer *)self fileExtension];
    uint64_t v16 = [v12 stringWithFormat:@"%@-layer_%@_%ld.%@", v7, v13, v14, v15];

    v11 = (void *)v16;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)PFParallaxLayer;
  id v4 = [(PFParallaxLayer *)&v13 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  [v5 appendString:@"\n"];
  id v6 = [(PFParallaxLayer *)self identifier];
  [v5 appendFormat:@"identifier: %@\n", v6];

  [(PFParallaxLayer *)self pixelSize];
  uint64_t v8 = v7;
  [(PFParallaxLayer *)self pixelSize];
  objc_msgSend(v5, "appendFormat:", @"size: %0.fx%0.f\n", v8, v9);
  [(PFParallaxLayer *)self frame];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v15);
  [v5 appendFormat:@"frame: %@\n", DictionaryRepresentation];

  [(PFParallaxLayer *)self zPosition];
  objc_msgSend(v5, "appendFormat:", @"zPosition: %.0f\n", v11);
  objc_msgSend(v5, "appendFormat:", @"backfill: %d\n", -[PFParallaxLayer isBackfill](self, "isBackfill"));
  objc_msgSend(v5, "appendFormat:", @"debug: %d\n", -[PFParallaxLayer isDebug](self, "isDebug"));

  return v5;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PFParallaxLayer *)self identifier];
  [(PFParallaxLayer *)self pixelSize];
  uint64_t v7 = v6;
  [(PFParallaxLayer *)self pixelSize];
  uint64_t v9 = v8;
  [(PFParallaxLayer *)self frame];
  uint64_t v11 = v10;
  [(PFParallaxLayer *)self frame];
  uint64_t v13 = v12;
  [(PFParallaxLayer *)self frame];
  uint64_t v15 = v14;
  [(PFParallaxLayer *)self frame];
  uint64_t v17 = v16;
  [(PFParallaxLayer *)self zPosition];
  SEL v19 = [v3 stringWithFormat:@"<%@:%p id:%@ size=%0.fx%0.f frame=(%0.f,%0.f)(%0.fx%0.f) zPos=%0.1f>", v4, self, v5, v7, v9, v11, v13, v15, v17, v18];

  return v19;
}

- (BOOL)isSettlingEffect
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 isEqualToString:@"settling-video"];

  return v3;
}

- (BOOL)isDebug
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 hasPrefix:@"debug"];

  return v3;
}

- (BOOL)isInactive
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 hasPrefix:@"inactive"];

  return v3;
}

- (BOOL)isBackfill
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 hasSuffix:@"backfill"];

  return v3;
}

- (BOOL)isBackgroundLandscape
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 isEqualToString:@"background-landscape"];

  return v3;
}

- (BOOL)isForegroundLandscape
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 isEqualToString:@"foreground-landscape"];

  return v3;
}

- (BOOL)isBackground
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 isEqualToString:@"background"];

  return v3;
}

- (BOOL)isForeground
{
  v2 = [(PFParallaxLayer *)self identifier];
  char v3 = [v2 isEqualToString:@"foreground"];

  return v3;
}

- (CGSize)pixelSize
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  char v3 = (PFParallaxLayer *)_PFAssertFailHandler();
  [(PFParallaxLayer *)v3 layerByUpdatingFrame:v8];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  char v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  SEL v4 = (PFParallaxLayer *)_PFAssertFailHandler();
  return [(PFParallaxLayer *)v4 initWithFrame:v9 zPosition:v7 identifier:v6];
}

- (PFParallaxLayer)initWithFrame:(CGRect)a3 zPosition:(double)a4 identifier:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v11 = (NSString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PFParallaxLayer;
  uint64_t v12 = [(PFParallaxLayer *)&v15 init];
  v12->_frame.origin.CGFloat x = x;
  v12->_frame.origin.CGFloat y = y;
  v12->_frame.size.CGFloat width = width;
  v12->_frame.size.CGFloat height = height;
  v12->_zPosition = a4;
  identifier = v12->_identifier;
  v12->_identifier = v11;

  return v12;
}

@end