@interface MRFrame
+ (id)retainedFrameWithFrameID:(id)a3 forSlideProvider:(id)a4;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isRetainedBySlideProvider;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)pixelSize;
- (MRFrame)initWithFrameID:(id)a3;
- (MRImage)inputImage;
- (NSDictionary)attributes;
- (NSString)frameID;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)releaseBySlideProvider:(id)a3;
- (void)retainBySlideProvider:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRFrame

+ (id)retainedFrameWithFrameID:(id)a3 forSlideProvider:(id)a4
{
  id v5 = objc_msgSend(+[MRFrameManager sharedManager](MRFrameManager, "sharedManager"), "frameWithFrameID:", a3);
  [v5 retainBySlideProvider:a4];
  return v5;
}

- (MRFrame)initWithFrameID:(id)a3
{
  v4 = [(MRFrame *)self init];
  if (v4)
  {
    v4->mFrameID = (NSString *)[a3 copy];
    v4->mDescription = (NSDictionary *)objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "descriptionForFrameID:", v4->mFrameID);
    v4->mAttributes = 0;
    v4->mInputImage = 0;
    v4->mOutputImage = 0;
    v4->mPixelSize = CGSizeZero;
  }
  return v4;
}

- (void)dealloc
{
  [(MRFrame *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRFrame;
  [(MRFrame *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->mSlideProvider) {
    -[MRFrame releaseBySlideProvider:](self, "releaseBySlideProvider:");
  }

  self->mFrameID = 0;
  self->mDescription = 0;
}

- (void)retainBySlideProvider:(id)a3
{
  self->mSlideProvider = (MRSlideProvider *)a3;
}

- (void)releaseBySlideProvider:(id)a3
{
  self->mSlideProvider = 0;
  self->mAttributes = 0;

  self->mFlattenedAttributes = 0;
  [(MRFrame *)self unload];
  id v4 = +[MRFrameManager sharedManager];
  [v4 recycleFrame:self];
}

- (BOOL)isRetainedBySlideProvider
{
  return self->mSlideProvider != 0;
}

- (void)setInputImage:(id)a3
{
  mInputImage = self->mInputImage;
  if (mInputImage != a3)
  {
    [(MRImage *)mInputImage releaseByUser];
    self->mInputImage = (MRImage *)[a3 retainByUser];
    [(MRImage *)self->mOutputImage releaseByUser];
    self->mOutputImage = 0;
  }
}

- (void)setAttributes:(id)a3
{
  if (self->mAttributes != a3)
  {

    id v5 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v6 = objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "attributesForFrameID:andPresetID:", self->mFrameID, objc_msgSend(a3, "objectForKey:", @"PresetID"));
    if (v6) {
      [(NSDictionary *)v5 addEntriesFromDictionary:v6];
    }
    id v7 = [a3 objectForKey:@"specificAttributes"];
    if (v7) {
      [(NSDictionary *)v5 addEntriesFromDictionary:v7];
    }
    self->mFlattenedAttributes = v5;
  }
}

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->mPixelSize.width || a3.height != self->mPixelSize.height)
  {
    self->mPixelSize = a3;
    [(MRFrame *)self unload];
  }
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (void)unload
{
  self->mInputImage = 0;
  [(MRImage *)self->mOutputImage releaseByUser];
  self->mOutputImage = 0;
}

- (BOOL)isNative3D
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"isNative3D"];
  return [v2 BOOLValue];
}

- (BOOL)isOpaque
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"isOpaque"];
  return [v2 BOOLValue];
}

- (BOOL)isAlphaFriendly
{
  if (![(NSDictionary *)self->mDescription objectForKey:@"isAlphaFriendly"]) {
    return 1;
  }
  id v3 = [(NSDictionary *)self->mDescription objectForKey:@"isAlphaFriendly"];
  return [v3 BOOLValue];
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0;
  }
  id v6 = [(MRFrame *)self retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [a4 localAspectRatio];
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v6, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7), @"rectangle", 0);
  v9 = +[NSArray arrayWithObject:v8];

  [v6 releaseByUser];
  return v9;
}

- (MRImage)inputImage
{
  return self->mInputImage;
}

- (NSString)frameID
{
  return self->mFrameID;
}

- (NSDictionary)attributes
{
  return self->mAttributes;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end