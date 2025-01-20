@interface PLAssetFormats
+ (CGSize)sizeForFormat:(unsigned __int16)a3;
+ (id)descriptionForImageFormat:(unsigned __int16)a3;
@end

@implementation PLAssetFormats

+ (CGSize)sizeForFormat:(unsigned __int16)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:");
    [v3 size];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)descriptionForImageFormat:(unsigned __int16)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:");
    double v4 = [v3 shortDescription];
  }
  else
  {
    double v4 = @"0-PLUnknownImageFormat";
  }
  return v4;
}

@end