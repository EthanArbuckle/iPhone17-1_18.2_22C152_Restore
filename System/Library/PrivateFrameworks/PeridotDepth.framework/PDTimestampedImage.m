@interface PDTimestampedImage
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (NSDictionary)metadataDictionary;
- (PDTimestampedImage)initWithImage:(__CVBuffer *)a3 andTimestamp:(id *)a4;
- (PDTimestampedImage)initWithImage:(__CVBuffer *)a3 metadataDictionary:(id)a4 andTimestamp:(id *)a5;
- (__CVBuffer)image;
- (void)dealloc;
@end

@implementation PDTimestampedImage

- (void).cxx_destruct
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)dealloc
{
  image = self->_image;
  if (image)
  {
    CVPixelBufferRelease(image);
    self->_image = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PDTimestampedImage;
  [(PDTimestampedImage *)&v4 dealloc];
}

- (PDTimestampedImage)initWithImage:(__CVBuffer *)a3 metadataDictionary:(id)a4 andTimestamp:(id *)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDTimestampedImage;
  v10 = [(PDTimestampedImage *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_image = a3;
    CVPixelBufferRetain(a3);
    objc_storeStrong((id *)&v11->_metadataDictionary, a4);
    long long v12 = *(_OWORD *)&a5->var0;
    v11->_timestamp.epoch = a5->var3;
    *(_OWORD *)&v11->_timestamp.value = v12;
  }

  return v11;
}

- (PDTimestampedImage)initWithImage:(__CVBuffer *)a3 andTimestamp:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  return [(PDTimestampedImage *)self initWithImage:a3 metadataDictionary:0 andTimestamp:&v5];
}

@end