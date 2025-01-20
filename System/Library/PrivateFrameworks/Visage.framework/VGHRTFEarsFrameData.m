@interface VGHRTFEarsFrameData
- (NSArray)leftEarFrames;
- (NSArray)rightEarFrames;
- (id)initEmpty;
- (void)setLeftEarFrames:(id)a3;
- (void)setRightEarFrames:(id)a3;
@end

@implementation VGHRTFEarsFrameData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarsFrameData;
  v2 = [(VGHRTFEarsFrameData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (NSArray)leftEarFrames
{
  return self->_leftEarFrames;
}

- (void)setLeftEarFrames:(id)a3
{
}

- (NSArray)rightEarFrames
{
  return self->_rightEarFrames;
}

- (void)setRightEarFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarFrames, 0);

  objc_storeStrong((id *)&self->_leftEarFrames, 0);
}

@end