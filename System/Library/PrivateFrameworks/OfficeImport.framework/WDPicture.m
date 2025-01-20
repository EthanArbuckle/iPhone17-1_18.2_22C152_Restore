@interface WDPicture
- (BOOL)hasContent;
- (id)description;
- (int)runType;
@end

@implementation WDPicture

- (BOOL)hasContent
{
  return self->super.mDrawable != 0;
}

- (int)runType
{
  return 4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDPicture;
  v2 = [(WDOfficeArt *)&v4 description];
  return v2;
}

@end