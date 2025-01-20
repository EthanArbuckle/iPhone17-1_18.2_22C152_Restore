@interface IPAShortestEdgeImageSizePolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)result;
- (IPAShortestEdgeImageSizePolicy)initWithCoder:(id)a3;
- (IPAShortestEdgeImageSizePolicy)initWithShortestEdge:(double)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPAShortestEdgeImageSizePolicy

- (unint64_t)hash
{
  return (unint64_t)self->_shortestEdge;
}

- (BOOL)isEqual:(id)a3
{
  return self->_shortestEdge == *((double *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IPAShortestEdgeImageSizePolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v6 encodeWithCoder:v4];
  double shortestEdge = self->_shortestEdge;
  *(float *)&double shortestEdge = shortestEdge;
  objc_msgSend(v4, "encodeFloat:forKey:", @"shortest edge", shortestEdge, v6.receiver, v6.super_class);
}

- (IPAShortestEdgeImageSizePolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IPAShortestEdgeImageSizePolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v8 initWithCoder:v3];
  objc_msgSend(v3, "decodeFloatForKey:", @"shortest edge", v8.receiver, v8.super_class);
  float v6 = v5;

  v4->_double shortestEdge = v6;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> shortestEdge=%f", objc_opt_class(), self, *(void *)&self->_shortestEdge];
}

- (CGSize)transformSize:(CGSize)result
{
  double width = result.width;
  if (result.width >= result.height) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  double shortestEdge = self->_shortestEdge;
  if (height > 0.0 && shortestEdge < height)
  {
    if (width == result.height)
    {
      result.double height = self->_shortestEdge;
    }
    else
    {
      double v7 = shortestEdge / height;
      if (width < result.height)
      {
        result.double height = result.height * v7;
      }
      else
      {
        result.double height = self->_shortestEdge;
        double shortestEdge = width * v7;
      }
    }
  }
  else
  {
    double shortestEdge = width;
  }
  result.double width = shortestEdge;
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPAShortestEdgeImageSizePolicy)initWithShortestEdge:(double)a3
{
  if (a3 <= 0.0)
  {
    float v5 = (void *)_PFAssertFailHandler();
    return (IPAShortestEdgeImageSizePolicy *)+[IPAImageSizePolicy bestFitPolicyInSquare:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPAShortestEdgeImageSizePolicy;
    result = [(IPAShortestEdgeImageSizePolicy *)&v8 init];
    if (result) {
      result->_double shortestEdge = a3;
    }
  }
  return result;
}

@end