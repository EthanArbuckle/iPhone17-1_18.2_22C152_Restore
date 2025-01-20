@interface BICImageEntry
+ (BOOL)shouldBeRemovedOnPrimaryChanged:(id)a3;
- (BOOL)isExpired;
- (CGSize)imageSize;
- (id)entryLocationFromParameters;
- (void)deleteEntry;
- (void)setImageSize:(CGSize)a3;
@end

@implementation BICImageEntry

+ (BOOL)shouldBeRemovedOnPrimaryChanged:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 processingOptions];
  unsigned int v5 = [v3 quality];
  v6 = [v3 dataStoreInformation];
  unsigned __int8 v7 = [v6 hasPrefix:@"https"];

  unsigned int v8 = [v3 quality];
  BOOL v10 = (~v4 & 0x220) != 0 || v8 != 2;
  if ([v3 potentialPrimary])
  {
    BOOL v11 = 0;
  }
  else
  {
    unsigned int v12 = [v3 state];
    BOOL v13 = v10 & (v7 ^ 1);
    if (v5 == 3) {
      BOOL v13 = 0;
    }
    BOOL v11 = v12 == 2 && v13;
  }

  return v11;
}

- (CGSize)imageSize
{
  [(BICImageEntry *)self width];
  double v4 = v3;
  [(BICImageEntry *)self height];
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
  [(BICImageEntry *)self setWidth:a3.width];

  *(float *)&double v5 = height;
  [(BICImageEntry *)self setHeight:v5];
}

- (void)deleteEntry
{
  id v3 = [(BICImageEntry *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (id)entryLocationFromParameters
{
  id v3 = [(BICImageEntry *)self imageSet];
  double v4 = [v3 identifier];
  id v5 = [(BICImageEntry *)self level];
  [(BICImageEntry *)self width];
  double v7 = v6;
  [(BICImageEntry *)self height];
  v9 = +[BICDescribedImage entryLocationWithIdentifier:level:size:options:quality:](BICDescribedImage, "entryLocationWithIdentifier:level:size:options:quality:", v4, v5, [(BICImageEntry *)self processingOptions], [(BICImageEntry *)self quality], v7, v8);

  return v9;
}

- (BOOL)isExpired
{
  id v3 = [(BICImageEntry *)self expiry];
  if (v3)
  {
    double v4 = [(BICImageEntry *)self expiry];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end