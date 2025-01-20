@interface PXMemoriesBlacklistPlaceLocationAccessoryViewSpec
+ (id)specWithLocation:(id)a3 regionRadius:(double)a4;
- (CLLocation)location;
- (PXMemoriesBlacklistPlaceLocationAccessoryViewSpec)initWithLocation:(id)a3 regionRadius:(double)a4;
- (double)regionRadius;
@end

@implementation PXMemoriesBlacklistPlaceLocationAccessoryViewSpec

- (void).cxx_destruct
{
}

- (double)regionRadius
{
  return self->_regionRadius;
}

- (CLLocation)location
{
  return self->_location;
}

- (PXMemoriesBlacklistPlaceLocationAccessoryViewSpec)initWithLocation:(id)a3 regionRadius:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesBlacklistPlaceLocationAccessoryViewSpec;
  v8 = -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:](&v12, sel_initWithContentViewFrame_, 0.0, 0.0, 294.0, 100.0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a3);
    double v10 = 5000.0;
    if (a4 >= 0.0) {
      double v10 = a4;
    }
    v9->_regionRadius = v10;
    [(PXMemoriesBlacklistAccessoryViewSpec *)v9 setType:1];
  }

  return v9;
}

+ (id)specWithLocation:(id)a3 regionRadius:(double)a4
{
  id v5 = a3;
  v6 = [[PXMemoriesBlacklistPlaceLocationAccessoryViewSpec alloc] initWithLocation:v5 regionRadius:a4];

  return v6;
}

@end