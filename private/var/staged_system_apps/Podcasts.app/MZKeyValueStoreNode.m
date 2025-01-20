@interface MZKeyValueStoreNode
+ (BOOL)isServerRevisionNewerThanClient:(id)a3;
+ (id)assetIDForKey:(id)a3 withPrefix:(id)a4;
+ (id)keyValueStoreDataCurrentRevision;
+ (id)keyValueStoreDataFirstRevision;
+ (id)keyWithPrefix:(id)a3 assetID:(id)a4;
+ (id)keysWithPrefix:(id)a3 assetIDs:(id)a4;
+ (id)serverRevisionNewerThanClientKeys;
+ (void)setServerRevisionNewerThanClient:(id)a3;
- (BOOL)hasData;
- (BOOL)mismatch;
- (MZKeyValueStoreNode)init;
- (MZKeyValueStoreTransaction)transaction;
- (NSArray)arrayValue;
- (NSData)dataValue;
- (NSData)value;
- (NSDate)dateValue;
- (NSDictionary)dictionaryValue;
- (NSNumber)numberValue;
- (NSString)key;
- (NSString)name;
- (NSString)stringValue;
- (NSString)version;
- (id)debugDescription;
- (id)description;
- (id)objectValue;
- (id)objectValueMatchingClass:(Class)a3;
- (int)wrapperRevision;
- (void)setArrayValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setMismatch:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)setObjectValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setValue:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWrapperRevision:(int)a3;
@end

@implementation MZKeyValueStoreNode

+ (id)serverRevisionNewerThanClientKeys
{
  if (qword_10060A748 != -1) {
    dispatch_once(&qword_10060A748, &stru_100550660);
  }
  v2 = (void *)qword_10060A740;

  return v2;
}

+ (void)setServerRevisionNewerThanClient:(id)a3
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = [v4 serverRevisionNewerThanClientKeys];
  v6 = +[NSNumber numberWithBool:1];
  [v5 setObject:v6 forKey:v7];

  objc_sync_exit(v4);
}

+ (BOOL)isServerRevisionNewerThanClient:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = [v5 serverRevisionNewerThanClientKeys];
  id v7 = [v6 objectForKey:v4];
  BOOL v8 = v7 != 0;

  objc_sync_exit(v5);
  return v8;
}

+ (id)keyValueStoreDataCurrentRevision
{
  v2 = (void *)qword_10060A750;
  if (!qword_10060A750)
  {
    id v3 = [objc_alloc((Class)NSNumber) initWithInt:2];
    id v4 = (void *)qword_10060A750;
    qword_10060A750 = (uint64_t)v3;

    v2 = (void *)qword_10060A750;
  }

  return v2;
}

+ (id)keyValueStoreDataFirstRevision
{
  v2 = (void *)qword_10060A758;
  if (!qword_10060A758)
  {
    id v3 = [objc_alloc((Class)NSNumber) initWithInt:1];
    id v4 = (void *)qword_10060A758;
    qword_10060A758 = (uint64_t)v3;

    v2 = (void *)qword_10060A758;
  }

  return v2;
}

+ (id)keyWithPrefix:(id)a3 assetID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6) {
    +[NSString stringWithFormat:@"%@%@", v5, v6];
  }
  else {
  id v7 = +[NSString stringWithFormat:@"%@", v5, v9];
  }
  if ([(id)objc_opt_class() isServerRevisionNewerThanClient:v7])
  {

    id v7 = 0;
  }

  return v7;
}

+ (id)keysWithPrefix:(id)a3 assetIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [objc_opt_class() keyWithPrefix:v5 assetID:*(void *)(*((void *)&v15 + 1) + 8 * i) assetID:v15];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)assetIDForKey:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  id v6 = [v5 substringFromIndex:[a4 length]];

  return v6;
}

- (MZKeyValueStoreNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)MZKeyValueStoreNode;
  result = [(MZKeyValueStoreNode *)&v3 init];
  if (result) {
    result->_wrapperRevision = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MZKeyValueStoreNode *)self key];
  id v5 = [(MZKeyValueStoreNode *)self version];
  id v6 = [(MZKeyValueStoreNode *)self value];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> {_key:%@; _version:%@; _value:[%d bytes]}",
    v3,
    self,
    v4,
    v5,
  id v7 = [v6 length]);

  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = [(MZKeyValueStoreNode *)self value];
  id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 description], (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = objc_alloc((Class)NSString);
    id v7 = [(MZKeyValueStoreNode *)self value];
    id v5 = [v6 initWithData:v7 encoding:4];

    if (!v5)
    {
      id v8 = [(MZKeyValueStoreNode *)self value];
      id v5 = [v8 hexString];
    }
  }
  uint64_t v9 = objc_opt_class();
  id v10 = [(MZKeyValueStoreNode *)self key];
  uint64_t v11 = [(MZKeyValueStoreNode *)self version];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> {_key:%@; _version:%@; _value: %@}",
    v9,
    self,
    v10,
    v11,
  v12 = v5);

  return v12;
}

- (BOOL)hasData
{
  v2 = [(MZKeyValueStoreNode *)self value];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)objectValueMatchingClass:(Class)a3
{
  BOOL v3 = [(MZKeyValueStoreNode *)self objectValue];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSString)stringValue
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setStringValue:(id)a3
{
}

- (NSNumber)numberValue
{
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setNumberValue:(id)a3
{
}

- (NSDate)dateValue
{
  uint64_t v3 = objc_opt_class();

  return (NSDate *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setDateValue:(id)a3
{
}

- (NSData)dataValue
{
  uint64_t v3 = objc_opt_class();

  return (NSData *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setDataValue:(id)a3
{
}

- (NSArray)arrayValue
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setArrayValue:(id)a3
{
}

- (NSDictionary)dictionaryValue
{
  uint64_t v3 = objc_opt_class();

  return (NSDictionary *)[(MZKeyValueStoreNode *)self objectValueMatchingClass:v3];
}

- (void)setDictionaryValue:(id)a3
{
}

- (id)objectValue
{
  uint64_t v3 = [(MZKeyValueStoreNode *)self value];
  id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];

  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [(id)objc_opt_class() keyValueStoreDataCurrentRevision];
    id v8 = [v6 objectForKey:off_1005F4A98];
    int v9 = [v8 intValue];
    if (v9 <= (int)[v7 intValue])
    {
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v8 stringValue];
          id v5 = [v6 objectForKey:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_9;
          }
          id v5 = [v6 objectForKey:v8];
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      id v10 = objc_opt_class();
      uint64_t v11 = [(MZKeyValueStoreNode *)self key];
      [v10 setServerRevisionNewerThanClient:v11];
    }
LABEL_9:
    id v5 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)setObjectValue:(id)a3
{
  id v4 = a3;
  id v11 = [(id)objc_opt_class() keyValueStoreDataCurrentRevision];
  if ([(MZKeyValueStoreNode *)self wrapperRevision])
  {
    id v5 = v11;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() keyValueStoreDataFirstRevision];

    id v5 = (void *)v6;
  }
  id v7 = off_1005F4A98;
  id v12 = v5;
  id v8 = [v5 stringValue];
  int v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, v7, v4, v8, 0);

  id v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:kMZKeyValueStorePlistFormatNetworkData options:0 error:0];
  [(MZKeyValueStoreNode *)self setValue:v10];
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)mismatch
{
  return self->_mismatch;
}

- (void)setMismatch:(BOOL)a3
{
  self->_mismatch = a3;
}

- (int)wrapperRevision
{
  return self->_wrapperRevision;
}

- (void)setWrapperRevision:(int)a3
{
  self->_wrapperRevision = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end