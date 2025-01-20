@interface BICMemoryImageEntry
- (BICImageSetProtocol)imageSet;
- (BOOL)isExpired;
- (BOOL)permanent;
- (BOOL)potentialPrimary;
- (CGSize)imageSize;
- (NSDate)expiry;
- (NSDate)lastUsed;
- (NSString)dataStoreInformation;
- (NSString)entryLocation;
- (float)height;
- (float)width;
- (id)entryLocationFromParameters;
- (signed)level;
- (signed)state;
- (unsigned)processingOptions;
- (unsigned)quality;
- (unsigned)shadowHeight;
- (unsigned)shadowLeft;
- (unsigned)shadowTop;
- (unsigned)shadowWidth;
- (void)deleteEntry;
- (void)setDataStoreInformation:(id)a3;
- (void)setEntryLocation:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setHeight:(float)a3;
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
- (void)setWidth:(float)a3;
@end

@implementation BICMemoryImageEntry

- (CGSize)imageSize
{
  [(BICMemoryImageEntry *)self width];
  double v4 = v3;
  [(BICMemoryImageEntry *)self height];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  *(float *)&a3.width = a3.width;
  [(BICMemoryImageEntry *)self setWidth:a3.width];

  *(float *)&double v5 = height;
  [(BICMemoryImageEntry *)self setHeight:v5];
}

- (void)deleteEntry
{
  id v3 = [(BICMemoryImageEntry *)self imageSet];
  [v3 deleteEntry:self];
}

- (id)entryLocationFromParameters
{
  id v3 = [(BICMemoryImageEntry *)self imageSet];
  double v4 = [v3 identifier];
  signed int v5 = [(BICMemoryImageEntry *)self level];
  [(BICMemoryImageEntry *)self width];
  uint64_t v7 = (int)v6;
  [(BICMemoryImageEntry *)self height];
  v9 = +[NSString stringWithFormat:@"%@|%d|%d|%d|%hd", v4, v5, v7, (int)v8, [(BICMemoryImageEntry *)self processingOptions]];

  return v9;
}

- (BOOL)isExpired
{
  id v3 = [(BICMemoryImageEntry *)self expiry];
  if (v3)
  {
    double v4 = [(BICMemoryImageEntry *)self expiry];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
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

- (float)width
{
  return self->width;
}

- (void)setWidth:(float)a3
{
  self->width = a3;
}

- (float)height
{
  return self->height;
}

- (void)setHeight:(float)a3
{
  self->double height = a3;
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (signed)level
{
  return self->level;
}

- (void)setLevel:(signed __int16)a3
{
  self->level = a3;
}

- (signed)state
{
  return self->state;
}

- (void)setState:(signed __int16)a3
{
  self->state = a3;
}

- (NSString)dataStoreInformation
{
  return self->dataStoreInformation;
}

- (void)setDataStoreInformation:(id)a3
{
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (BOOL)potentialPrimary
{
  return self->potentialPrimary;
}

- (void)setPotentialPrimary:(BOOL)a3
{
  self->potentialPrimary = a3;
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
}

- (BOOL)permanent
{
  return self->permanent;
}

- (void)setPermanent:(BOOL)a3
{
  self->permanent = a3;
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

- (unsigned)shadowHeight
{
  return self->shadowHeight;
}

- (void)setShadowHeight:(unsigned __int16)a3
{
  self->shadowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->lastUsed, 0);
  objc_storeStrong((id *)&self->dataStoreInformation, 0);
  objc_storeStrong((id *)&self->imageSet, 0);

  objc_storeStrong((id *)&self->entryLocation, 0);
}

@end