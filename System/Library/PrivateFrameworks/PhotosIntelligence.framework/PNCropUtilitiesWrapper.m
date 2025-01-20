@interface PNCropUtilitiesWrapper
+ (id)cropVariantsForAsset:(id)a3 faces:(id)a4;
+ (id)cropVariantsForAsset:(id)a3 targetSize:(CGSize)a4 faces:(id)a5;
+ (id)cropVariantsFromSignalsPrefersFaceCrops:(int)a3 aspectRatio:(int)a4 sourcePixelWidth:(int)a5 sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:;
+ (id)cropVariantsFromSignalsWithCropTypes:(uint64_t)a3 aspectRatio:(int)a4 sourcePixelWidth:(int)a5 sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:;
+ (id)stringForCropVariantType:(int64_t)a3;
@end

@implementation PNCropUtilitiesWrapper

+ (id)cropVariantsFromSignalsPrefersFaceCrops:(int)a3 aspectRatio:(int)a4 sourcePixelWidth:(int)a5 sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:
{
  if (a3) {
    v5 = &unk_27076A6E8;
  }
  else {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  return +[PNCropUtilities cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:](PNCropUtilities, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", v5, a4, a5);
}

+ (id)cropVariantsFromSignalsWithCropTypes:(uint64_t)a3 aspectRatio:(int)a4 sourcePixelWidth:(int)a5 sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:
{
  return +[PNCropUtilities cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:](PNCropUtilities, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", a3, a4, a5);
}

+ (id)cropVariantsForAsset:(id)a3 faces:(id)a4
{
  return +[PNCropUtilities cropVariantsForAsset:a3 faces:a4];
}

+ (id)cropVariantsForAsset:(id)a3 targetSize:(CGSize)a4 faces:(id)a5
{
  return +[PNCropUtilities cropVariantsForAsset:targetSize:faces:](PNCropUtilities, "cropVariantsForAsset:targetSize:faces:", a3, a5, a4.width, a4.height);
}

+ (id)stringForCropVariantType:(int64_t)a3
{
  return +[PNCropUtilities stringForCropVariantType:a3];
}

@end