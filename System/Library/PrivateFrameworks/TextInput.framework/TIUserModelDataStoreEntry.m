@interface TIUserModelDataStoreEntry
- (NSData)properties;
- (NSDate)timestamp;
- (NSNumber)realValue;
- (NSNumber)secondaryValue;
- (NSNumber)value;
- (NSString)inputMode;
- (NSString)key;
- (TIUserModelDataStoreEntry)initWithTimestamp:(id)a3 withKey:(id)a4 withInputMode:(id)a5 withValue:(id)a6 withSecondaryValue:(id)a7 withRealValue:(id)a8 withProperties:(id)a9;
- (void)setInputMode:(id)a3;
- (void)setKey:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRealValue:(id)a3;
- (void)setSecondaryValue:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TIUserModelDataStoreEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_realValue, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)setProperties:(id)a3
{
}

- (NSData)properties
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRealValue:(id)a3
{
}

- (NSNumber)realValue
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSecondaryValue:(id)a3
{
}

- (NSNumber)secondaryValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputMode:(id)a3
{
}

- (NSString)inputMode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (TIUserModelDataStoreEntry)initWithTimestamp:(id)a3 withKey:(id)a4 withInputMode:(id)a5 withValue:(id)a6 withSecondaryValue:(id)a7 withRealValue:(id)a8 withProperties:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)TIUserModelDataStoreEntry;
  v22 = [(TIUserModelDataStoreEntry *)&v25 init];
  v23 = v22;
  if (v22)
  {
    [(TIUserModelDataStoreEntry *)v22 setTimestamp:v15];
    [(TIUserModelDataStoreEntry *)v23 setKey:v16];
    [(TIUserModelDataStoreEntry *)v23 setInputMode:v17];
    [(TIUserModelDataStoreEntry *)v23 setValue:v18];
    [(TIUserModelDataStoreEntry *)v23 setSecondaryValue:v19];
    [(TIUserModelDataStoreEntry *)v23 setRealValue:v20];
    [(TIUserModelDataStoreEntry *)v23 setProperties:v21];
  }

  return v23;
}

@end