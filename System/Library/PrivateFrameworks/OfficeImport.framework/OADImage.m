@interface OADImage
- (OADImage)init;
- (OADImage)initWithBlipRef:(id)a3;
- (id)createImageFill;
- (id)description;
- (id)geometry;
- (id)imageProperties;
- (id)movie;
- (id)ole;
- (void)createPictureFramePresetGeometry;
- (void)setGeometry:(id)a3;
- (void)setMovie:(id)a3;
- (void)setOle:(id)a3;
@end

@implementation OADImage

- (OADImage)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)OADImage;
  return [(OADDrawable *)&v5 initWithPropertiesClass:v3];
}

- (id)imageProperties
{
  return self->super.super.mDrawableProperties;
}

- (id)movie
{
  return self->mMovie;
}

- (void)setOle:(id)a3
{
}

- (void)setGeometry:(id)a3
{
}

- (id)ole
{
  return self->mOle;
}

- (void)setMovie:(id)a3
{
}

- (OADImage)initWithBlipRef:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(OADImage *)self init];
  if (v5)
  {
    v6 = objc_alloc_init(OADImageFill);
    [(OADImageFill *)v6 setBlipRef:v4];
    v7 = objc_alloc_init(OADStretchTechnique);
    [(OADImageFill *)v6 setTechnique:v7];
    v8 = [(OADImage *)v5 imageProperties];
    [v8 setImageFill:v6];
  }
  return v5;
}

- (id)geometry
{
  return self->mGeometry;
}

- (id)createImageFill
{
  uint64_t v3 = [(OADImage *)self imageProperties];
  uint64_t v4 = [v3 isMergedWithParent];
  [v3 setMergedWithParent:0];
  if ([v3 hasImageFill])
  {
    objc_super v5 = [NSString stringWithUTF8String:"-[OADImage createImageFill]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADImage.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:81 isFatal:0 description:"An image fill already exists"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [v3 setMergedWithParent:v4];
  v7 = objc_alloc_init(OADImageFill);
  v8 = [(OADImage *)self imageProperties];
  [v8 setImageFill:v7];

  v9 = +[OADStretchTechnique defaultProperties];
  v10 = (void *)[v9 copy];
  [(OADImageFill *)v7 setTechnique:v10];

  return v7;
}

- (void)createPictureFramePresetGeometry
{
  if (self->mGeometry)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OADImage createPictureFramePresetGeometry]"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADImage.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:90 isFatal:0 description:"A geometry already exists"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  objc_super v5 = objc_alloc_init(OADPresetShapeGeometry);
  mGeometry = self->mGeometry;
  self->mGeometry = &v5->super;

  v7 = self->mGeometry;
  [(OADShapeGeometry *)v7 setType:75];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADImage;
  v2 = [(OADGraphic *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMovie, 0);
  objc_storeStrong((id *)&self->mOle, 0);
  objc_storeStrong((id *)&self->mGeometry, 0);
}

@end