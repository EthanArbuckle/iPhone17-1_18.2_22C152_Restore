@interface _BCPPTFlawlessImageEntry
+ (id)entry;
+ (id)entryOfSize:(CGSize)a3;
- (BICImageSetProtocol)imageSet;
- (BOOL)isExpired;
- (BOOL)permanent;
- (BOOL)potentialPrimary;
- (CGSize)imageSize;
- (NSDate)expiry;
- (NSDate)lastUsed;
- (NSString)dataStoreInformation;
- (NSString)entryLocation;
- (id)entryLocationFromParameters;
- (signed)level;
- (signed)state;
- (unsigned)processingOptions;
- (unsigned)quality;
- (unsigned)shadowHeight;
- (unsigned)shadowLeft;
- (unsigned)shadowTop;
- (unsigned)shadowWidth;
- (void)setDataStoreInformation:(id)a3;
- (void)setEntryLocation:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setImageSet:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLastUsed:(id)a3;
- (void)setLevel:(signed __int16)a3;
- (void)setPermanent:(BOOL)a3;
- (void)setPotentialPrimary:(BOOL)a3;
- (void)setProcessingOptions:(unsigned __int16)a3;
- (void)setQuality:(unsigned __int16)a3;
- (void)setShadowHeight:(unsigned __int16)a3;
- (void)setShadowLeft:(unsigned __int16)a3;
- (void)setShadowTop:(unsigned __int16)a3;
- (void)setShadowWidth:(unsigned __int16)a3;
- (void)setState:(signed __int16)a3;
@end

@implementation _BCPPTFlawlessImageEntry

+ (id)entry
{
  return [a1 entryOfSize:CGSizeZero.width, CGSizeZero.height];
}

+ (id)entryOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [v5 setImageSize:width, height];
  [v5 setLevel:0];
  [v5 setQuality:207];
  [v5 setPotentialPrimary:1];
  v6 = +[_BCPPTImageSet imageSetWithEntry:v5];
  [v5 setImageSet:v6];

  return v5;
}

- (BOOL)isExpired
{
  return 0;
}

- (id)entryLocationFromParameters
{
  v2 = +[NSUUID UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSString)dataStoreInformation
{
  return self->dataStoreInformation;
}

- (void)setDataStoreInformation:(id)a3
{
}

- (NSString)entryLocation
{
  return self->entryLocation;
}

- (void)setEntryLocation:(id)a3
{
}

- (BICImageSetProtocol)imageSet
{
  return self->imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->imageSize.width;
  double height = self->imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->imageSize = a3;
}

- (signed)level
{
  return self->level;
}

- (void)setLevel:(signed __int16)a3
{
  self->level = a3;
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (signed)state
{
  return self->state;
}

- (void)setState:(signed __int16)a3
{
  self->state = a3;
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (BOOL)potentialPrimary
{
  return self->potentialPrimary;
}

- (void)setPotentialPrimary:(BOOL)a3
{
  self->potentialPrimary = a3;
}

- (unsigned)shadowHeight
{
  return self->shadowHeight;
}

- (void)setShadowHeight:(unsigned __int16)a3
{
  self->shadowHeight = a3;
}

- (unsigned)shadowLeft
{
  return self->shadowLeft;
}

- (void)setShadowLeft:(unsigned __int16)a3
{
  self->shadowLeft = a3;
}

- (unsigned)shadowTop
{
  return self->shadowTop;
}

- (void)setShadowTop:(unsigned __int16)a3
{
  self->shadowTop = a3;
}

- (unsigned)shadowWidth
{
  return self->shadowWidth;
}

- (void)setShadowWidth:(unsigned __int16)a3
{
  self->shadowWidth = a3;
}

- (BOOL)permanent
{
  return self->permanent;
}

- (void)setPermanent:(BOOL)a3
{
  self->permanent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastUsed, 0);
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->imageSet, 0);
  objc_storeStrong((id *)&self->entryLocation, 0);

  objc_storeStrong((id *)&self->dataStoreInformation, 0);
}

@end