@interface _NUBrushStrokeCIImageProvider
- (_NUBrushStrokeCIImageProvider)initWithStroke:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6;
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation _NUBrushStrokeCIImageProvider

- (void).cxx_destruct
{
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  bzero(a3, a8 * a4);
  if ([(NUBrushStroke *)self->_stroke pointCount])
  {
    unint64_t v16 = self->_extent.origin.x + a5;
    unint64_t v17 = self->_extent.size.height + self->_extent.origin.y - (a8 + a6);
    v18 = self->_stroke;
    BOOL closed = self->_closed;
    v31 = v18;
    if (self->_filled)
    {
      v20 = (NUBrushStroke *)[(NUBrushStroke *)v18 mutableCopy];
      [(NUBrushStroke *)v20 pointAtIndex:0];
      -[NUBrushStroke appendPoint:](v20, "appendPoint:");

      BOOL closed = 1;
      v31 = v20;
    }
    v21 = [NUMutableBufferAdapter alloc];
    v22 = +[NUPixelFormat R8];
    v23 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:](v21, "initWithSize:format:rowBytes:mutableBytes:", a7, a8, v22, a4, a3);

    +[NUBrushRasterizer rasterizeBrushStroke:atPoint:toBuffer:close:startIndex:](NUBrushRasterizer, "rasterizeBrushStroke:atPoint:toBuffer:close:startIndex:", v31, v16, v17, v23, closed, -1);
    if (self->_filled)
    {
      v24 = CGBitmapContextCreate(a3, a7, a8, 8uLL, a4, 0, 7u);
      Mutable = CGPathCreateMutable();
      [(NUBrushStroke *)self->_stroke pointAtIndex:0];
      CGPathMoveToPoint(Mutable, 0, v26, v27);
      if ([(NUBrushStroke *)self->_stroke pointCount] >= 2)
      {
        int64_t v28 = 1;
        do
        {
          [(NUBrushStroke *)self->_stroke pointAtIndex:v28];
          CGPathAddLineToPoint(Mutable, 0, v29, v30);
          ++v28;
        }
        while (v28 < [(NUBrushStroke *)self->_stroke pointCount]);
      }
      CGPathCloseSubpath(Mutable);
      CGContextTranslateCTM(v24, (double)-(uint64_t)v16, (double)-(uint64_t)v17);
      CGContextAddPath(v24, Mutable);
      CGContextFillPath(v24);
      CGContextRelease(v24);
      CGPathRelease(Mutable);
    }
  }
}

- (_NUBrushStrokeCIImageProvider)initWithStroke:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6
{
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_NUBrushStrokeCIImageProvider;
  v12 = [(_NUBrushStrokeCIImageProvider *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stroke, a3);
    v13->_BOOL closed = a4;
    v13->_pressureMode = a5;
    stroke = v13->_stroke;
    if (stroke)
    {
      [(NUBrushStroke *)stroke extent];
    }
    else
    {
      $86B46DF249C2B4242DBB096758D29184 v16 = ($86B46DF249C2B4242DBB096758D29184)0;
      $5BB7312FFE32F1AB3F1F5957C99A58B3 v17 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)0;
    }
    v13->_extent.origin = v16;
    v13->_extent.size = v17;
    v13->_filled = a6;
  }

  return v13;
}

@end