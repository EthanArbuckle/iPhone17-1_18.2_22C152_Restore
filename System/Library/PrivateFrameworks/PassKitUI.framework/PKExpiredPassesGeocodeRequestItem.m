@interface PKExpiredPassesGeocodeRequestItem
- (CLLocation)location;
- (NSString)uniqueID;
- (PKExpiredPassesGeocodeRequestItem)initWithCell:(id)a3 location:(id)a4;
- (PKExpiredPassesTableViewCell)cell;
- (PKPass)pass;
- (void)setCell:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPass:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation PKExpiredPassesGeocodeRequestItem

- (PKExpiredPassesGeocodeRequestItem)initWithCell:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKExpiredPassesGeocodeRequestItem;
  v8 = [(PKExpiredPassesGeocodeRequestItem *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 pass];
    v10 = (void *)v9;
    if (v7 && v9)
    {
      [(PKExpiredPassesGeocodeRequestItem *)v8 setLocation:v7];
      [(PKExpiredPassesGeocodeRequestItem *)v8 setCell:v6];
      [(PKExpiredPassesGeocodeRequestItem *)v8 setPass:v10];
      v11 = [v10 uniqueID];
      [(PKExpiredPassesGeocodeRequestItem *)v8 setUniqueID:v11];
    }
  }

  return v8;
}

- (PKExpiredPassesTableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end