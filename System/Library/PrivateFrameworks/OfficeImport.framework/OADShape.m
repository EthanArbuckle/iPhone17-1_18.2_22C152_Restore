@interface OADShape
- (BOOL)isTextBox;
- (OADOrientedBounds)textOrientedBounds;
- (OADShape)init;
- (id)description;
- (id)geometry;
- (id)shapeProperties;
- (id)shapeStyle;
- (id)textBody;
- (int)type;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)createPresetGeometryWithShapeType:(int)a3;
- (void)flattenProperties;
- (void)removeUnnecessaryOverrides;
- (void)setGeometry:(id)a3;
- (void)setParentTextListStyle:(id)a3;
- (void)setTextBody:(id)a3;
- (void)setTextOrientedBounds:(id)a3;
@end

@implementation OADShape

- (OADShape)init
{
  uint64_t v3 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)OADShape;
  v4 = [(OADDrawable *)&v8 initWithPropertiesClass:v3];
  if (v4)
  {
    v5 = objc_alloc_init(OADTextBody);
    mTextBody = v4->mTextBody;
    v4->mTextBody = v5;
  }
  return v4;
}

- (void)setGeometry:(id)a3
{
}

- (void)setTextBody:(id)a3
{
}

- (id)textBody
{
  return self->mTextBody;
}

- (void)setParentTextListStyle:(id)a3
{
}

- (void)removeUnnecessaryOverrides
{
  [(OADTextBody *)self->mTextBody removeUnnecessaryOverrides];
  v3.receiver = self;
  v3.super_class = (Class)OADShape;
  [(OADDrawable *)&v3 removeUnnecessaryOverrides];
}

- (id)shapeProperties
{
  return self->super.super.mDrawableProperties;
}

- (int)type
{
  v2 = [(OADShape *)self geometry];
  int v3 = [v2 type];

  return v3;
}

- (id)geometry
{
  mGeometry = self->mGeometry;
  if (mGeometry)
  {
    int v3 = mGeometry;
  }
  else if (self->super.mMasterGraphic)
  {
    objc_opt_class();
    int v3 = [(OADGraphic *)self->super.mMasterGraphic geometry];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (id)shapeStyle
{
  return 0;
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
}

- (void)flattenProperties
{
  [(OADTextBody *)self->mTextBody flattenProperties];
  id v3 = [(OADShape *)self shapeProperties];
  [v3 flatten];
}

- (void)createPresetGeometryWithShapeType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mGeometry)
  {
    v5 = [NSString stringWithUTF8String:"-[OADShape createPresetGeometryWithShapeType:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShape.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:90 isFatal:0 description:"A geometry already exists"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = objc_alloc_init(OADPresetShapeGeometry);
  mGeometry = self->mGeometry;
  self->mGeometry = &v7->super;

  v9 = self->mGeometry;
  [(OADShapeGeometry *)v9 setType:v3];
}

- (BOOL)isTextBox
{
  if ([(OADShape *)self type] == 202) {
    return 1;
  }
  v4 = [(OADShape *)self shapeProperties];
  char v3 = [v4 isTextBox];

  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADShape;
  v2 = [(OADGraphic *)&v4 description];
  return v2;
}

- (OADOrientedBounds)textOrientedBounds
{
  return self->mTextOrientedBounds;
}

- (void)setTextOrientedBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextOrientedBounds, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
  objc_storeStrong((id *)&self->mGeometry, 0);
}

@end