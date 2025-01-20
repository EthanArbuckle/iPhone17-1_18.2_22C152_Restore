@interface VUIMediaEntityImageLoadParamsFactory
+ (id)imageLoadParamsWithMediaEntity:(id)a3 imageType:(unint64_t)a4;
@end

@implementation VUIMediaEntityImageLoadParamsFactory

+ (id)imageLoadParamsWithMediaEntity:(id)a3 imageType:(unint64_t)a4
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1F3F6AC80] & 1) != 0
    || ([v5 conformsToProtocol:&unk_1F3F94868] & 1) != 0
    || [v5 conformsToProtocol:&unk_1F3FF8D10])
  {
    v6 = [v5 imageLoadParamsWithImageType:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end