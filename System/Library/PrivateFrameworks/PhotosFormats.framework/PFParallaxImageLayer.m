@interface PFParallaxImageLayer
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (CGSize)pixelSize;
- (PFParallaxImageLayer)initWithImage:(__CVBuffer *)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6;
- (__CVBuffer)image;
- (id)fileExtension;
- (id)layerByUpdatingFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation PFParallaxImageLayer

- (id)fileExtension
{
  return @"HEIC";
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PFParallaxLayer *)self identifier];
  int v8 = [v7 containsString:@"foreground"];

  uint64_t v9 = PFFigEncodeCVPixelBufferToURL((uint64_t)[(PFParallaxImageLayer *)self image], v6, v8);
  if (a4 && v9)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = [NSString stringWithFormat:@"Error writing image to disk, code: %d", v9, *MEMORY[0x1E4F28228]];
    v15[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:v12];
  }
  return v9 == 0;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (CGSize)pixelSize
{
  size_t Width = CVPixelBufferGetWidth(self->_image);
  size_t Height = CVPixelBufferGetHeight(self->_image);
  double v5 = (double)Width;
  double v6 = (double)Height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxImageLayer;
  [(PFParallaxImageLayer *)&v3 dealloc];
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v8 = [PFParallaxImageLayer alloc];
  uint64_t v9 = [(PFParallaxImageLayer *)self image];
  [(PFParallaxLayer *)self zPosition];
  double v11 = v10;
  v12 = [(PFParallaxLayer *)self identifier];
  v13 = -[PFParallaxImageLayer initWithImage:frame:zPosition:identifier:](v8, "initWithImage:frame:zPosition:identifier:", v9, v12, x, y, width, height, v11);

  return v13;
}

- (PFParallaxImageLayer)initWithImage:(__CVBuffer *)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PFParallaxImageLayer;
  v7 = -[PFParallaxLayer initWithFrame:zPosition:identifier:](&v9, sel_initWithFrame_zPosition_identifier_, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  v7->_image = CVPixelBufferRetain(a3);
  return v7;
}

@end