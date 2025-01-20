@interface ICSEMediaPreview
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (BOOL)isVideoPreview;
- (ICSEMediaPreview)initWithImage:(id)a3;
- (ICSEMediaPreview)initWithWithImage:(id)a3 videoDuration:(id *)a4;
- (UIImage)image;
@end

@implementation ICSEMediaPreview

- (ICSEMediaPreview)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSEMediaPreview;
  v6 = [(ICSEMediaPreview *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    v7->_isVideoPreview = 0;
  }

  return v7;
}

- (ICSEMediaPreview)initWithWithImage:(id)a3 videoDuration:(id *)a4
{
  result = [(ICSEMediaPreview *)self initWithImage:a3];
  if (result)
  {
    long long v6 = *(_OWORD *)&a4->var0;
    result->_videoDuration.epoch = a4->var3;
    *(_OWORD *)&result->_videoDuration.value = v6;
    result->_isVideoPreview = 1;
  }
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (BOOL)isVideoPreview
{
  return self->_isVideoPreview;
}

- (void).cxx_destruct
{
}

@end