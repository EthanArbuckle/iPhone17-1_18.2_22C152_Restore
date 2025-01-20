@interface _BCPPTImageSet
+ (id)imageSetWithEntry:(id)a3;
- (BOOL)actualAspectRatio;
- (NSDate)dateRequested;
- (NSSet)imageEntries;
- (NSString)identifier;
- (float)heightForAspectRatio;
- (float)widthForAspectRatio;
- (id)imageColor;
- (id)primaryEntry;
- (int)requestCount;
- (int64_t)imageColorARGBHex;
- (void)setActualAspectRatio:(BOOL)a3;
- (void)setDateRequested:(id)a3;
- (void)setHeightForAspectRatio:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageColorARGBHex:(int64_t)a3;
- (void)setImageEntries:(id)a3;
- (void)setRequestCount:(int)a3;
- (void)setWidthForAspectRatio:(float)a3;
@end

@implementation _BCPPTImageSet

- (id)imageColor
{
  if (qword_345570 != -1) {
    dispatch_once(&qword_345570, &stru_2C41E0);
  }
  v0 = (void *)qword_345568;
  unint64_t v1 = arc4random();
  unint64_t v2 = v1 % (unint64_t)[(id)qword_345568 count];

  return [v0 objectAtIndexedSubscript:v2];
}

+ (id)imageSetWithEntry:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];
  [v4 setIdentifier:v6];

  id v10 = v3;
  v7 = +[NSArray arrayWithObjects:&v10 count:1];
  v8 = +[NSSet setWithArray:v7];

  [v4 setImageEntries:v8];

  return v4;
}

- (id)primaryEntry
{
  unint64_t v2 = [(_BCPPTImageSet *)self imageEntries];
  id v3 = [v2 allObjects];
  v4 = [v3 firstObject];

  return v4;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)requestCount
{
  return self->requestCount;
}

- (void)setRequestCount:(int)a3
{
  self->requestCount = a3;
}

- (BOOL)actualAspectRatio
{
  return self->actualAspectRatio;
}

- (void)setActualAspectRatio:(BOOL)a3
{
  self->actualAspectRatio = a3;
}

- (float)heightForAspectRatio
{
  return self->heightForAspectRatio;
}

- (void)setHeightForAspectRatio:(float)a3
{
  self->heightForAspectRatio = a3;
}

- (float)widthForAspectRatio
{
  return self->widthForAspectRatio;
}

- (void)setWidthForAspectRatio:(float)a3
{
  self->widthForAspectRatio = a3;
}

- (int64_t)imageColorARGBHex
{
  return self->imageColorARGBHex;
}

- (void)setImageColorARGBHex:(int64_t)a3
{
  self->imageColorARGBHex = a3;
}

- (NSDate)dateRequested
{
  return self->dateRequested;
}

- (void)setDateRequested:(id)a3
{
}

- (NSSet)imageEntries
{
  return self->imageEntries;
}

- (void)setImageEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageEntries, 0);
  objc_storeStrong((id *)&self->dateRequested, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end