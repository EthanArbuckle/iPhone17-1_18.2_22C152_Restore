@interface TSDPathStroker
- (TSDPathStroker)initWithProperties:(id)a3 bundle:(id)a4 dataManager:(void *)a5 precedingStroker:(id)a6;
- (double)width;
- (void)dealloc;
- (void)setWidth:(double)a3;
- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4 inColor:(id)a5;
@end

@implementation TSDPathStroker

- (TSDPathStroker)initWithProperties:(id)a3 bundle:(id)a4 dataManager:(void *)a5 precedingStroker:(id)a6
{
  v19.receiver = self;
  v19.super_class = (Class)TSDPathStroker;
  v8 = [(TSDPathStroker *)&v19 init];
  if (v8)
  {
    v8->mPrecedingStroker = (TSDPathStroker *)a6;
    v9 = (TSUColor *)[a3 objectForKey:@"color"];
    if (v9)
    {
      double v17 = 0.0;
      double v18 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      v10 = (void *)[MEMORY[0x263F08B08] scannerWithString:v9];
      objc_msgSend(v10, "tsu_scanCGFloat:", &v18);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v17);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v16);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v15);
      v9 = (TSUColor *)(id)[MEMORY[0x263F7C808] colorWithRed:v18 green:v17 blue:v16 alpha:v15];
    }
    v8->mColor = v9;
    v11 = (void *)[a3 objectForKey:@"width"];
    if (v11)
    {
      [v11 floatValue];
      double v13 = v12;
    }
    else
    {
      double v13 = -1.0;
    }
    v8->mWidth = v13;
  }
  return v8;
}

- (void)dealloc
{
  mColor = self->mColor;
  if (mColor) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TSDPathStroker;
  [(TSDPathStroker *)&v4 dealloc];
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4 inColor:(id)a5
{
  mPrecedingStroker = self->mPrecedingStroker;
  if (mPrecedingStroker) {
    [(TSDPathStroker *)mPrecedingStroker strokePath:a3 inContext:a4 inColor:a5];
  }
  double mWidth = self->mWidth;
  if (mWidth > 0.0) {
    CGContextSetLineWidth(a4, mWidth);
  }
  mColor = self->mColor;
  if (!mColor) {
    mColor = a5;
  }
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[mColor CGColor]);
  CGContextAddPath(a4, a3);
  CGContextStrokePath(a4);
  if (self->mWidth > 0.0)
  {
    CGContextSetLineWidth(a4, 1.0);
  }
}

- (double)width
{
  return self->mWidth;
}

- (void)setWidth:(double)a3
{
  self->double mWidth = a3;
}

@end