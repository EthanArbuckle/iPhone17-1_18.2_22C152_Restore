@interface OADDrawable
+ (unsigned)generateOADDrawableId:(id)a3;
- (BOOL)hidden;
- (OADDrawable)initWithPropertiesClass:(Class)a3;
- (OADDrawableContainer)parent;
- (id)clientData;
- (id)createOrientedBoundsWithBounds:(CGRect)a3;
- (id)createWordClientDataWithTextType:(int)a3;
- (id)description;
- (id)drawableProperties;
- (id)ensureClientDataOfClass:(Class)a3;
- (unsigned)altId;
- (unsigned)id;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAltId:(unsigned int)a3;
- (void)setClientData:(id)a3;
- (void)setDrawableProperties:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setId:(unsigned int)a3;
- (void)setParent:(id)a3;
- (void)setParentTextListStyle:(id)a3;
@end

@implementation OADDrawable

- (OADDrawable)initWithPropertiesClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OADDrawable;
  v4 = [(OADDrawable *)&v9 init];
  v5 = (OADDrawable *)v4;
  if (v4)
  {
    *(void *)(v4 + 12) = -1;
    v6 = (OADDrawableProperties *)objc_alloc_init(a3);
    mDrawableProperties = v5->mDrawableProperties;
    v5->mDrawableProperties = v6;
  }
  return v5;
}

- (id)drawableProperties
{
  return self->mDrawableProperties;
}

- (void)setId:(unsigned int)a3
{
  self->mId = a3;
}

- (void)setDrawableProperties:(id)a3
{
}

- (void)setClientData:(id)a3
{
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (id)clientData
{
  return self->mClientData;
}

- (void)removeUnnecessaryOverrides
{
}

- (BOOL)hidden
{
  return self->mHidden;
}

- (OADDrawableContainer)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return (OADDrawableContainer *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (unsigned)id
{
  return self->mId;
}

- (id)ensureClientDataOfClass:(Class)a3
{
  mClientData = self->mClientData;
  if (!mClientData)
  {
    v5 = (OADClient *)objc_alloc_init(a3);
    v6 = self->mClientData;
    self->mClientData = v5;

    mClientData = self->mClientData;
  }
  return mClientData;
}

- (unsigned)altId
{
  return self->mAltId;
}

- (void)setAltId:(unsigned int)a3
{
  self->mAltId = a3;
}

- (void)setParentTextListStyle:(id)a3
{
  id v3 = a3;
  v4 = [NSString stringWithUTF8String:"-[OADDrawable setParentTextListStyle:]"];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm"];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  +[OITSUAssertionHandler handleFailureInFunction:v4, v5, 89, 0, "Abstract method not overridden by %@", v7 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v8 = (void *)MEMORY[0x263EFF940];
  objc_super v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"Abstract method not overridden by %@: %s", v11, "-[OADDrawable setParentTextListStyle:]"];
  id v13 = [v8 exceptionWithName:*MEMORY[0x263EFF498] reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v3 = a3;
  v4 = [NSString stringWithUTF8String:"-[OADDrawable changeParentTextListStylePreservingEffectiveValues:]"];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm"];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  +[OITSUAssertionHandler handleFailureInFunction:v4, v5, 93, 0, "Abstract method not overridden by %@", v7 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v8 = (void *)MEMORY[0x263EFF940];
  objc_super v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"Abstract method not overridden by %@: %s", v11, "-[OADDrawable changeParentTextListStylePreservingEffectiveValues:]"];
  id v13 = [v8 exceptionWithName:*MEMORY[0x263EFF498] reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)createOrientedBoundsWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(OADProperties *)self->mDrawableProperties isMergedWithParent];
  [(OADProperties *)self->mDrawableProperties setMergedWithParent:0];
  if ([(OADDrawableProperties *)self->mDrawableProperties hasOrientedBounds])
  {
    objc_super v9 = [NSString stringWithUTF8String:"-[OADDrawable createOrientedBoundsWithBounds:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:103 isFatal:0 description:"An oriented bounds object already exists"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [(OADProperties *)self->mDrawableProperties setMergedWithParent:v8];
  v11 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", x, y, width, height);
  v12 = [(OADDrawable *)self drawableProperties];
  [v12 setOrientedBounds:v11];

  return v11;
}

+ (unsigned)generateOADDrawableId:(id)a3
{
  return [a3 hash];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADDrawable;
  v2 = [(OADDrawable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mParent);
  objc_storeStrong((id *)&self->mClientData, 0);
  objc_storeStrong((id *)&self->mDrawableProperties, 0);
}

- (id)createWordClientDataWithTextType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_alloc_init(WDAContent);
  objc_storeStrong((id *)&self->mClientData, v5);
  [(WDAContent *)v5 setTextType:v3];
  return v5;
}

@end