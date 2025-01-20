@interface BKBookmarkPageCount
- (id)annotationRects;
- (void)setAnnotationRects:(id)a3;
@end

@implementation BKBookmarkPageCount

- (void)setAnnotationRects:(id)a3
{
  id v7 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  v5 = v4;
  if (v4)
  {
    [v4 encodeObject:v7 forKey:@"annotationRects"];
    v6 = [v5 encodedData];
  }
  else
  {
    v6 = 0;
  }
  [(BKBookmarkPageCount *)self setAnnotationRectsData:v6];
}

- (id)annotationRects
{
  v2 = [(BKBookmarkPageCount *)self annotationRectsData];
  if (v2)
  {
    uint64_t v8 = 0;
    id v3 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v2 error:&v8];
    id v4 = 0;
    if (!v8)
    {
      uint64_t v5 = objc_opt_class();
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
      id v4 = [v3 decodeObjectOfClasses:v6 forKey:@"annotationRects"];

      [v3 finishDecoding];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end