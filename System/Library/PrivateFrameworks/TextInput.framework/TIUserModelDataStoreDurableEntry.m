@interface TIUserModelDataStoreDurableEntry
- (NSDate)creationDate;
- (NSDate)lastUpdateDate;
- (NSNumber)value;
- (NSString)key;
- (TIUserModelDataStoreDurableEntry)initWithCreationDate:(id)a3 withLastUpdateDate:(id)a4 withKey:(id)a5 withValue:(id)a6;
@end

@implementation TIUserModelDataStoreDurableEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)lastUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (TIUserModelDataStoreDurableEntry)initWithCreationDate:(id)a3 withLastUpdateDate:(id)a4 withKey:(id)a5 withValue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TIUserModelDataStoreDurableEntry;
  v15 = [(TIUserModelDataStoreDurableEntry *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_creationDate, a3);
    objc_storeStrong((id *)&v16->_lastUpdateDate, a4);
    objc_storeStrong((id *)&v16->_key, a5);
    objc_storeStrong((id *)&v16->_value, a6);
  }

  return v16;
}

@end