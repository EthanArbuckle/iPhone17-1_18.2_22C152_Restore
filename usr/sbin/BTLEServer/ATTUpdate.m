@interface ATTUpdate
+ (id)updateWithValue:(id)a3 characteristic:(id)a4 centrals:(id)a5;
- (ATTUpdate)initWithValue:(id)a3 characteristic:(id)a4 centrals:(id)a5;
- (CBMutableCharacteristic)characteristic;
- (NSArray)centrals;
- (NSData)value;
@end

@implementation ATTUpdate

- (ATTUpdate)initWithValue:(id)a3 characteristic:(id)a4 centrals:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATTUpdate;
  v12 = [(ATTUpdate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a3);
    objc_storeStrong((id *)&v13->_characteristic, a4);
    objc_storeStrong((id *)&v13->_centrals, a5);
  }

  return v13;
}

+ (id)updateWithValue:(id)a3 characteristic:(id)a4 centrals:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[ATTUpdate alloc] initWithValue:v9 characteristic:v8 centrals:v7];

  return v10;
}

- (NSData)value
{
  return self->_value;
}

- (CBMutableCharacteristic)characteristic
{
  return self->_characteristic;
}

- (NSArray)centrals
{
  return self->_centrals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centrals, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end