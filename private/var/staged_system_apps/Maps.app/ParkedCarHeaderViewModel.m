@interface ParkedCarHeaderViewModel
- (ParkedCarHeaderViewModel)initWithParkedCar:(id)a3 subtitleText:(id)a4;
- (id)placeName;
- (id)placeSecondaryName;
@end

@implementation ParkedCarHeaderViewModel

- (ParkedCarHeaderViewModel)initWithParkedCar:(id)a3 subtitleText:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mapItem];
  v14.receiver = self;
  v14.super_class = (Class)ParkedCarHeaderViewModel;
  v10 = [(ParkedCarHeaderViewModel *)&v14 initWithMapItem:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parkedCar, a3);
    v11 = (NSString *)[v8 copy];
    subtitleText = v10->_subtitleText;
    v10->_subtitleText = v11;
  }
  return v10;
}

- (id)placeName
{
  return [(ParkedCar *)self->_parkedCar title];
}

- (id)placeSecondaryName
{
  if (self->_subtitleText) {
    return self->_subtitleText;
  }
  else {
    return @" ";
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);

  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end