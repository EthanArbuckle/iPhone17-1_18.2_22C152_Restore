@interface SIMovStreamInfo
- (CGSize)resolution;
- (NSString)name;
- (id)description;
- (id)initInfoWithTrackName:(id)a3 frameRate:(double)a4 pixelBufferFormat:(unsigned int)a5 resolution:(CGSize)a6;
- (int)readCycle;
- (unsigned)format;
- (unsigned)frameRate;
- (void)setReadCycle:(int)a3;
@end

@implementation SIMovStreamInfo

- (id)initInfoWithTrackName:(id)a3 frameRate:(double)a4 pixelBufferFormat:(unsigned int)a5 resolution:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIMovStreamInfo;
  v13 = [(SIMovStreamInfo *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_frameRate = a4;
    v14->_format = a5;
    v14->_resolution.CGFloat width = width;
    v14->_resolution.CGFloat height = height;
    v15 = v14;
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)SIMovStreamInfo;
  v4 = [(SIMovStreamInfo *)&v13 description];
  v5 = [(SIMovStreamInfo *)self name];
  uint64_t v6 = [(SIMovStreamInfo *)self frameRate];
  v7 = SIPixelFormatToStr([(SIMovStreamInfo *)self format]);
  [(SIMovStreamInfo *)self resolution];
  uint64_t v9 = v8;
  [(SIMovStreamInfo *)self resolution];
  v11 = [v3 stringWithFormat:@"%@\nName: %@ \n Frame rate: %d \n Format: %@ \n Resolution: (%f, %f) \n", v4, v5, v6, v7, v9, v10];

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (unsigned)format
{
  return self->_format;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)readCycle
{
  return self->_readCycle;
}

- (void)setReadCycle:(int)a3
{
  self->_readCycle = a3;
}

- (void).cxx_destruct
{
}

@end