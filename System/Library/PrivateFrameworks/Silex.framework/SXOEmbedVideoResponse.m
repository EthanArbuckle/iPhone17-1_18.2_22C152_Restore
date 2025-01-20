@interface SXOEmbedVideoResponse
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
- (CGSize)size;
@end

@implementation SXOEmbedVideoResponse

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if ([(__CFString *)v3 isEqualToString:@"HTML"])
  {

    v4 = @"html";
  }

  return v4;
}

- (CGSize)size
{
  [(SXOEmbedVideoResponse *)self width];
  double v4 = v3;
  [(SXOEmbedVideoResponse *)self height];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

@end