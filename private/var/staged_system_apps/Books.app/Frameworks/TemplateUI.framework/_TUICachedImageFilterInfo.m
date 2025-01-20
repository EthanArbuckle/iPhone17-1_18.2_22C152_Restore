@interface _TUICachedImageFilterInfo
- (BCUImageFilter)filter;
- (BOOL)isEqual:(id)a3;
- (CGSize)naturalSize;
- (_TUICachedImageFilterInfo)initWithFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5;
- (double)contentsScale;
- (unint64_t)hash;
@end

@implementation _TUICachedImageFilterInfo

- (_TUICachedImageFilterInfo)initWithFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TUICachedImageFilterInfo;
  v11 = [(_TUICachedImageFilterInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_filter, a3);
    v12->_naturalSize.CGFloat width = width;
    v12->_naturalSize.CGFloat height = height;
    v12->_contentsScale = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    filter = self->_filter;
    id v10 = [v7 filter];
    if (filter == v10
      && (([v8 naturalSize], self->_naturalSize.width == v12)
        ? (BOOL v13 = self->_naturalSize.height == v11)
        : (BOOL v13 = 0),
          v13))
    {
      double contentsScale = self->_contentsScale;
      [v8 contentsScale];
      BOOL v14 = contentsScale == v16;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return (unint64_t)[(BCUImageFilter *)self->_filter hash] ^ (unint64_t)self->_naturalSize.width ^ (unint64_t)self->_naturalSize.height ^ (unint64_t)self->_contentsScale;
}

- (BCUImageFilter)filter
{
  return self->_filter;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void).cxx_destruct
{
}

@end