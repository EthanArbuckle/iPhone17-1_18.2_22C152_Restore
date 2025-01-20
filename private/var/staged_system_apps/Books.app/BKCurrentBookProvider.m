@interface BKCurrentBookProvider
- (BKCurrentBookProvider)init;
- (BOOL)squareCover;
- (BSUIDynamicValue)generatingCurrentBookSnapshot;
- (BSUIDynamicValue)portraitSpread;
- (BSUIDynamicValue)showBookCover;
- (BSUIDynamicValue)showSquareCover;
- (BSUIDynamicValue)spreadPageCount;
- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6;
- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4;
- (void)setSquareCover:(BOOL)a3;
@end

@implementation BKCurrentBookProvider

- (BKCurrentBookProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)BKCurrentBookProvider;
  v2 = [(BKCurrentBookProvider *)&v14 init];
  if (v2)
  {
    v3 = (BSUIDynamicValue *)[objc_alloc((Class)BSUIDynamicValue) initWithValue:&__kCFBooleanFalse options:&off_100A83400];
    generatingCurrentBookSnapshot = v2->_generatingCurrentBookSnapshot;
    v2->_generatingCurrentBookSnapshot = v3;

    v5 = (BSUIDynamicValue *)[objc_alloc((Class)BSUIDynamicValue) initWithValue:&__kCFBooleanTrue options:&off_100A83428];
    showBookCover = v2->_showBookCover;
    v2->_showBookCover = v5;

    v7 = (BSUIDynamicValue *)[objc_alloc((Class)BSUIDynamicValue) initWithValue:&off_100A82DF8 options:&off_100A83450];
    spreadPageCount = v2->_spreadPageCount;
    v2->_spreadPageCount = v7;

    v9 = (BSUIDynamicValue *)[objc_alloc((Class)BSUIDynamicValue) initWithValue:&__kCFBooleanFalse options:&off_100A83478];
    portraitSpread = v2->_portraitSpread;
    v2->_portraitSpread = v9;

    v11 = (BSUIDynamicValue *)[objc_alloc((Class)BSUIDynamicValue) initWithValue:&__kCFBooleanTrue options:&off_100A834A0];
    showSquareCover = v2->_showSquareCover;
    v2->_showSquareCover = v11;
  }
  return v2;
}

- (void)setSquareCover:(BOOL)a3
{
  BOOL v3 = a3;
  self->_squareCover = a3;
  id v5 = [(BKCurrentBookProvider *)self showSquareCover];
  v4 = +[NSNumber numberWithBool:v3];
  [v5 updateValue:v4];
}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  return 0;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  return 0;
}

- (BSUIDynamicValue)generatingCurrentBookSnapshot
{
  return self->_generatingCurrentBookSnapshot;
}

- (BSUIDynamicValue)showBookCover
{
  return self->_showBookCover;
}

- (BSUIDynamicValue)spreadPageCount
{
  return self->_spreadPageCount;
}

- (BSUIDynamicValue)portraitSpread
{
  return self->_portraitSpread;
}

- (BSUIDynamicValue)showSquareCover
{
  return self->_showSquareCover;
}

- (BOOL)squareCover
{
  return self->_squareCover;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSquareCover, 0);
  objc_storeStrong((id *)&self->_portraitSpread, 0);
  objc_storeStrong((id *)&self->_spreadPageCount, 0);
  objc_storeStrong((id *)&self->_showBookCover, 0);

  objc_storeStrong((id *)&self->_generatingCurrentBookSnapshot, 0);
}

@end