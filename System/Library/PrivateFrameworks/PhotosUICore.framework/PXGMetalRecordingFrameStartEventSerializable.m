@interface PXGMetalRecordingFrameStartEventSerializable
- (CGSize)viewSize;
- (PXGMetalRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3;
- (__n128)renderOrigin;
- (double)screenScale;
- (id)createSerializableObject;
- (void)setRenderOrigin:(PXGMetalRecordingFrameStartEventSerializable *)self;
- (void)setScreenScale:(double)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation PXGMetalRecordingFrameStartEventSerializable

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setRenderOrigin:(PXGMetalRecordingFrameStartEventSerializable *)self
{
  *(_OWORD *)self->_renderOrigin = v2;
}

- (__n128)renderOrigin
{
  return a1[2];
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)createSerializableObject
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18[0] = @"viewSize";
  [(PXGMetalRecordingFrameStartEventSerializable *)self viewSize];
  double v4 = v3;
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v20 = v5;
  v6 = [NSNumber numberWithDouble:v4];
  v21 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:2];

  v19[0] = v7;
  v18[1] = @"renderOrigin";
  [(PXGMetalRecordingFrameStartEventSerializable *)self renderOrigin];
  long long v17 = v8;
  v9 = objc_msgSend(NSNumber, "numberWithFloat:");
  v20 = v9;
  HIDWORD(v10) = DWORD1(v17);
  LODWORD(v10) = DWORD1(v17);
  v11 = [NSNumber numberWithFloat:v10];
  v21 = v11;
  v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v17), DWORD2(v17))));
  v22 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:3];

  v19[1] = v13;
  v18[2] = @"screenScale";
  [(PXGMetalRecordingFrameStartEventSerializable *)self screenScale];
  v14 = objc_msgSend(NSNumber, "numberWithDouble:");
  v19[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v15;
}

- (PXGMetalRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PXGMetalRecordingFrameStartEventSerializable;
  v5 = [(PXGMetalRecordingFrameStartEventSerializable *)&v30 init];
  if (v5)
  {
    id v6 = v4;
    v7 = [v6 objectForKeyedSubscript:@"viewSize"];
    long long v8 = [v7 objectAtIndexedSubscript:0];
    [v8 floatValue];
    CGFloat v10 = v9;
    v11 = [v7 objectAtIndexedSubscript:1];
    [v11 floatValue];
    CGFloat v13 = v12;

    v5->_viewSize.double width = v10;
    v5->_viewSize.double height = v13;

    v14 = [v6 objectForKeyedSubscript:@"renderOrigin"];
    v15 = [v14 objectAtIndexedSubscript:0];
    [v15 floatValue];
    *(void *)&long long v28 = v16;
    long long v17 = [v14 objectAtIndexedSubscript:1];
    [v17 floatValue];
    int v27 = v18;
    v19 = [v14 objectAtIndexedSubscript:2];
    [v19 floatValue];
    long long v20 = v28;
    DWORD1(v20) = v27;
    DWORD2(v20) = v21;
    long long v29 = v20;

    *(_OWORD *)v5->_renderOrigin = v29;
    v22 = [v6 objectForKeyedSubscript:@"screenScale"];

    id v23 = v22;
    [v23 floatValue];
    double v25 = v24;

    v5->_screenScale = v25;
  }

  return v5;
}

@end