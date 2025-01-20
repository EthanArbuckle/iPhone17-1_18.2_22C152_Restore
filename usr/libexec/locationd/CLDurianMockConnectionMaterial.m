@interface CLDurianMockConnectionMaterial
- (CLDurianMockConnectionMaterial)initWithAddress:(id)a3 connectionToken:(id)a4;
- (NSData)address;
- (NSData)connectionToken;
- (NSDateInterval)dateInterval;
- (NSNumber)primaryIndex;
- (NSNumber)secondaryIndex;
- (id)commandKey;
- (int64_t)type;
- (void)dealloc;
@end

@implementation CLDurianMockConnectionMaterial

- (CLDurianMockConnectionMaterial)initWithAddress:(id)a3 connectionToken:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLDurianMockConnectionMaterial;
  v6 = [(CLDurianMockConnectionMaterial *)&v8 init];
  if (v6)
  {
    v6->_address = (NSData *)[a3 copy];
    v6->_connectionToken = (NSData *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianMockConnectionMaterial;
  [(CLDurianMockConnectionMaterial *)&v3 dealloc];
}

- (NSData)address
{
  return self->_address;
}

- (NSData)connectionToken
{
  return self->_connectionToken;
}

- (id)commandKey
{
  return +[NSData data];
}

- (NSDateInterval)dateInterval
{
  id v2 = [objc_alloc((Class)NSDateInterval) initWithStartDate:+[NSDate date](NSDate, "date") duration:1.0];

  return (NSDateInterval *)v2;
}

- (int64_t)type
{
  return 2;
}

- (NSNumber)primaryIndex
{
  return 0;
}

- (NSNumber)secondaryIndex
{
  return 0;
}

@end