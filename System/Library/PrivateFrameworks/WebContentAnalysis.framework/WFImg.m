@interface WFImg
+ (id)imgWithNode:(_xmlNode *)a3;
- (id)alt;
- (id)description;
- (id)src;
- (id)title;
- (int64_t)area;
- (int64_t)height;
- (int64_t)width;
- (void)dealloc;
@end

@implementation WFImg

+ (id)imgWithNode:(_xmlNode *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithNode:a3];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFImg;
  [(XMLNode *)&v2 dealloc];
}

- (id)alt
{
  return [(XMLNode *)self _stringValueFromAttribute:@"alt"];
}

- (id)title
{
  return [(XMLNode *)self _stringValueFromAttribute:@"title"];
}

- (id)src
{
  return [(XMLNode *)self _stringValueFromAttribute:@"src"];
}

- (int64_t)width
{
  return [(XMLNode *)self _intValueFromAttribute:@"width"];
}

- (int64_t)height
{
  return [(XMLNode *)self _intValueFromAttribute:@"height"];
}

- (int64_t)area
{
  int64_t v3 = [(WFImg *)self width];
  int64_t v4 = [(WFImg *)self height];
  if (v4 == kWFImgDimensionUnknown || v3 == kWFImgDimensionUnknown) {
    return kWFImgDimensionUnknown;
  }
  else {
    return v4 * v3;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@ alt:%@ src:%@ width:%ld height:%ld)", objc_msgSend((id)objc_opt_class(), "description"), -[WFImg alt](self, "alt"), -[WFImg src](self, "src"), -[WFImg width](self, "width"), -[WFImg height](self, "height")];
}

@end