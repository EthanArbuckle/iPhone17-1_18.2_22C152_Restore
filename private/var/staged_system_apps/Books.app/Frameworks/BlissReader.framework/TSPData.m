@interface TSPData
+ (id)dataFromDocumentURI:(id)a3 context:(id)a4;
- (BOOL)typeConformsToImage;
@end

@implementation TSPData

+ (id)dataFromDocumentURI:(id)a3 context:(id)a4
{
  objc_opt_class();
  [a4 documentRoot];
  id v6 = [(id)TSUDynamicCast() bookDescription];

  return [v6 dataForDocRelativePath:a3 context:a4];
}

- (BOOL)typeConformsToImage
{
  v2 = +[UTType typeWithIdentifier:[(TSPData *)self type]];

  return [(UTType *)v2 conformsToType:UTTypeImage];
}

@end