@interface NUTileLayer
- ($4ACA1AA3466662063A717107ABBADB19)imageRect;
- (NUPurgeableSurfaceImage)image;
- (NUTileLayer)initWithImage:(id)a3 tile:(id)a4;
- (void)dealloc;
@end

@implementation NUTileLayer

- (NUTileLayer)initWithImage:(id)a3 tile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NUTileLayer;
  v8 = [(NUTileLayer *)&v18 init];
  v9 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v6;
  id v10 = v6;

  if (v7)
  {
    [v7 frameRect];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  long long v11 = v17;
  *(_OWORD *)(v8 + 40) = v16;
  *(_OWORD *)(v8 + 56) = v11;
  v12 = (void *)*((void *)v8 + 4);
  long long v13 = *(_OWORD *)(v8 + 56);
  long long v16 = *(_OWORD *)(v8 + 40);
  long long v17 = v13;
  v14 = [MEMORY[0x263F58678] regionWithRect:&v16];
  [v12 beginAccessRegion:v14];

  return (NUTileLayer *)v8;
}

- (void).cxx_destruct
{
}

- (NUPurgeableSurfaceImage)image
{
  return (NUPurgeableSurfaceImage *)objc_getProperty(self, a2, 32, 1);
}

- ($4ACA1AA3466662063A717107ABBADB19)imageRect
{
  objc_copyStruct(retstr, &self->_imageRect, 32, 1, 0);
  return result;
}

- (void)dealloc
{
  image = self->_image;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_imageRect.size;
  v7[0] = self->_imageRect.origin;
  v7[1] = size;
  v5 = [MEMORY[0x263F58678] regionWithRect:v7];
  [(NUPurgeableSurfaceImage *)image endAccessRegion:v5];

  v6.receiver = self;
  v6.super_class = (Class)NUTileLayer;
  [(NUTileLayer *)&v6 dealloc];
}

@end