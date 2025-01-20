@interface PXGVisionRecordingFrameStartEventSerializable
- (CGPoint)renderOrigin;
- (CGSize)viewSize;
- (PXGVisionRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3;
- (double)screenScale;
- (id)createSerializableObject;
- (void)setRenderOrigin:(CGPoint)a3;
- (void)setScreenScale:(double)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation PXGVisionRecordingFrameStartEventSerializable

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setRenderOrigin:(CGPoint)a3
{
  self->_renderOrigin = a3;
}

- (CGPoint)renderOrigin
{
  double x = self->_renderOrigin.x;
  double y = self->_renderOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v14[0] = @"viewSize";
  double height = self->_viewSize.height;
  v4 = [NSNumber numberWithDouble:self->_viewSize.width];
  v16 = v4;
  v5 = [NSNumber numberWithDouble:height];
  v17 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:2];

  v15[0] = v6;
  v14[1] = @"renderOrigin";
  double y = self->_renderOrigin.y;
  v8 = [NSNumber numberWithDouble:self->_renderOrigin.x];
  v16 = v8;
  v9 = [NSNumber numberWithDouble:y];
  v17 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:2];

  v15[1] = v10;
  v14[2] = @"screenScale";
  v11 = [NSNumber numberWithDouble:self->_screenScale];
  v15[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (PXGVisionRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PXGVisionRecordingFrameStartEventSerializable;
  v5 = [(PXGVisionRecordingFrameStartEventSerializable *)&v26 init];
  if (v5)
  {
    id v6 = v4;
    v7 = [v6 objectForKeyedSubscript:@"viewSize"];
    v8 = [v7 objectAtIndexedSubscript:0];
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
    CGFloat v17 = v16;
    uint64_t v18 = [v14 objectAtIndexedSubscript:1];
    [v18 floatValue];
    CGFloat v20 = v19;

    v5->_renderOrigin.double x = v17;
    v5->_renderOrigin.double y = v20;

    v21 = [v6 objectForKeyedSubscript:@"screenScale"];

    id v22 = v21;
    [v22 floatValue];
    double v24 = v23;

    v5->_screenScale = v24;
  }

  return v5;
}

@end