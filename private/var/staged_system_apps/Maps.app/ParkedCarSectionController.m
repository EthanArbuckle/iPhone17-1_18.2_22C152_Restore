@interface ParkedCarSectionController
- (ParkedCar)parkedCar;
- (ParkedCarSectionController)initWithParkedCar:(id)a3;
- (id)mapItem;
- (void)setParkedCar:(id)a3;
@end

@implementation ParkedCarSectionController

- (ParkedCarSectionController)initWithParkedCar:(id)a3
{
  id v5 = a3;
  v6 = [v5 mapItem];
  v9.receiver = self;
  v9.super_class = (Class)ParkedCarSectionController;
  v7 = [(ParkedCarSectionController *)&v9 initWithMapItem:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_parkedCar, a3);
  }

  return v7;
}

- (id)mapItem
{
  return [(ParkedCar *)self->_parkedCar mapItem];
}

- (void)setParkedCar:(id)a3
{
  id v5 = (ParkedCar *)a3;
  if (self->_parkedCar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_parkedCar, a3);
    [(ParkedCarSectionController *)self updateFromParkedCar];
    id v5 = v6;
  }
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
}

@end