@interface PIMsgImageBuffer
- (NSMutableData)data;
- (PIMsgImageBuffer)initWithBytes:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)a9;
- (PIMsgImageBuffer)initWithData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)space;
- (id)image;
- (int)format;
- (unint64_t)elementByteSize;
- (unint64_t)height;
- (unint64_t)rowElements;
- (unint64_t)width;
- (void)bytes;
- (void)dealloc;
- (void)setData:(id)a3;
@end

@implementation PIMsgImageBuffer

- (void).cxx_destruct
{
}

- (int)format
{
  return self->format;
}

- (unint64_t)height
{
  return self->height;
}

- (unint64_t)width
{
  return self->width;
}

- (unint64_t)rowElements
{
  return self->rowElements;
}

- (unint64_t)elementByteSize
{
  return self->elementByteSize;
}

- (void)setData:(id)a3
{
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 56, 1);
}

- (id)image
{
  return (id)objc_msgSend(MEMORY[0x1E4F1E050], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", self->data, self->rowElements * self->elementByteSize, self->format, self->bufferColorspace, (double)self->width, (double)self->height);
}

- (void)bytes
{
  return [(NSMutableData *)self->data mutableBytes];
}

- (void)dealloc
{
  bufferColorspace = self->bufferColorspace;
  if (bufferColorspace) {
    CGColorSpaceRelease(bufferColorspace);
  }
  v4.receiver = self;
  v4.super_class = (Class)PIMsgImageBuffer;
  [(PIMsgImageBuffer *)&v4 dealloc];
}

- (PIMsgImageBuffer)initWithData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)space
{
  id v15 = a3;
  v16 = [(PIMsgImageBuffer *)self init];
  v17 = v16;
  if (v16)
  {
    [(PIMsgImageBuffer *)v16 setData:v15];
    v17->elementByteSize = a7;
    v17->rowElements = a6 / a7;
    v17->width = a4;
    v17->height = a5;
    v17->format = a8;
    if (space) {
      v17->bufferColorspace = CGColorSpaceRetain(space);
    }
  }

  return v17;
}

- (PIMsgImageBuffer)initWithBytes:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = [MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:a3 length:a6 * a5 freeWhenDone:0];
  v16 = [(PIMsgImageBuffer *)self initWithData:v15 width:a4 height:a5 bytesPerRow:a6 bytesPerComponent:a7 format:v9 colorspace:a9];

  return v16;
}

@end