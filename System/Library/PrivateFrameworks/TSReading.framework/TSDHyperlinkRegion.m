@interface TSDHyperlinkRegion
+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4;
- (NSURL)URL;
- (TSDBezierPath)bezierPath;
- (TSDHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4;
- (void)dealloc;
- (void)setBezierPath:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation TSDHyperlinkRegion

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDHyperlinkRegion;
  [(TSDHyperlinkRegion *)&v3 dealloc];
}

+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithURL:a3 bezierPath:a4];

  return v4;
}

- (TSDHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDHyperlinkRegion;
  v6 = [(TSDHyperlinkRegion *)&v9 init];
  if (v6)
  {
    v6->mURL = (NSURL *)a3;
    v7 = objc_alloc_init(TSDBezierPath);
    v6->mBezierPath = v7;
    [(TSDBezierPath *)v7 appendBezierPath:a4];
  }
  return v6;
}

- (NSURL)URL
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
}

- (TSDBezierPath)bezierPath
{
  return self->mBezierPath;
}

- (void)setBezierPath:(id)a3
{
}

@end