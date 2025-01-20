@interface THDrawableStorage
- (BOOL)containsDrawable:(id)a3;
- (BOOL)isInDocumentRoot:(id)a3;
- (NSArray)drawables;
- (THDocumentRoot)documentRoot;
- (THDrawableStorage)initWithContext:(id)a3;
- (id)drawableWithTag:(id)a3;
- (unint64_t)drawableCount;
- (void)addDrawable:(id)a3 insertContext:(id)a4;
- (void)dealloc;
- (void)setDocumentRoot:(id)a3;
- (void)setTag:(id)a3 forDrawable:(id)a4;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation THDrawableStorage

- (THDrawableStorage)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THDrawableStorage;
  v3 = [(THDrawableStorage *)&v5 initWithContext:a3];
  if (v3)
  {
    v3->mDrawables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mDrawableTags = (NSMutableDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  }
  return v3;
}

- (void)dealloc
{
  self->mDocumentRoot = 0;

  self->mDrawables = 0;
  self->mDrawableTags = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDrawableStorage;
  [(THDrawableStorage *)&v3 dealloc];
}

- (BOOL)isInDocumentRoot:(id)a3
{
  return [(THDrawableStorage *)self documentRoot] == a3;
}

- (unint64_t)drawableCount
{
  return (unint64_t)[(NSMutableArray *)self->mDrawables count];
}

- (NSArray)drawables
{
  id v2 = [(NSMutableArray *)self->mDrawables copy];

  return (NSArray *)v2;
}

- (BOOL)containsDrawable:(id)a3
{
  return [(NSMutableArray *)self->mDrawables indexOfObjectIdenticalTo:a3] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (void)addDrawable:(id)a3 insertContext:(id)a4
{
  v7 = [(THDrawableStorage *)self documentRoot];
  if (v7)
  {
    v8 = v7;
    [a3 willBeAddedToDocumentRoot:v7 context:a4];
    [(NSMutableArray *)self->mDrawables addObject:a3];
    [a3 wasAddedToDocumentRoot:v8 context:a4];
  }
  else
  {
    mDrawables = self->mDrawables;
    [(NSMutableArray *)mDrawables addObject:a3];
  }
}

- (void)setTag:(id)a3 forDrawable:(id)a4
{
}

- (id)drawableWithTag:(id)a3
{
  return [(NSMutableDictionary *)self->mDrawableTags objectForKey:a3];
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDrawableStorage willBeAddedToDocumentRoot:context:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"] lineNumber:114 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"documentRoot"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage willBeAddedToDocumentRoot:context:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m") lineNumber:115 description:@"invalid document class"];
  }
  mDrawables = self->mDrawables;

  [(NSMutableArray *)mDrawables tsu_makeObjectsPerformSelector:a2 withObject:a3 withObject:a4];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage wasAddedToDocumentRoot:context:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m") lineNumber:122 description:@"invalid nil value for '%s'", "documentRoot"];
  }
  [(NSMutableArray *)self->mDrawables tsu_makeObjectsPerformSelector:a2 withObject:a3 withObject:a4];
  objc_opt_class();
  uint64_t v8 = TSUDynamicCast();

  [(THDrawableStorage *)self setDocumentRoot:v8];
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  [(THDrawableStorage *)self setDocumentRoot:0];
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage willBeRemovedFromDocumentRoot:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m") lineNumber:133 description:@"invalid nil value for '%s'", "documentRoot"];
  }
  mDrawables = self->mDrawables;

  [(NSMutableArray *)mDrawables makeObjectsPerformSelector:a2 withObject:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage wasRemovedFromDocumentRoot:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m") lineNumber:140 description:@"invalid nil value for '%s'", "documentRoot"];
  }
  [(NSMutableArray *)self->mDrawables tsu_makeObjectsPerformSelectorIfImplemented:"setTextServices:" withObject:0];
  mDrawables = self->mDrawables;

  [(NSMutableArray *)mDrawables makeObjectsPerformSelector:a2 withObject:a3];
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->mDocumentRoot = (THDocumentRoot *)a3;
}

@end