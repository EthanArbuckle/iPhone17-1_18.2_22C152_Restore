@interface SDActivityKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidKey;
- (NSDate)dateCreated;
- (NSDictionary)dictRepresentation;
- (NSMutableData)keyData;
- (NSUUID)keyIdentifier;
- (SDActivityKey)initWithDictRepresentation:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)lastUsedCounter;
- (void)dealloc;
- (void)setDateCreated:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setLastUsedCounter:(unsigned __int16)a3;
- (void)setValidKey:(BOOL)a3;
@end

@implementation SDActivityKey

- (SDActivityKey)initWithDictRepresentation:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SDActivityKey;
  v5 = [(SDActivityKey *)&v19 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 objectForKeyedSubscript:@"keyData"];
  if ([v6 length] == (id)32)
  {
    v7 = (NSMutableData *)[v6 mutableCopy];
    keyData = v5->_keyData;
    v5->_keyData = v7;

    id v9 = objc_alloc((Class)NSUUID);
    v10 = [v4 objectForKeyedSubscript:@"keyIdentifier"];
    v11 = (NSUUID *)[v9 initWithUUIDString:v10];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"dateCreated"];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v13;

    v15 = [v4 objectForKeyedSubscript:@"lastUsedCounter"];
    v5->_lastUsedCounter = (unsigned __int16)[v15 integerValue];

LABEL_4:
    v16 = v5;
    goto LABEL_8;
  }
  v17 = handoff_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1001780E8(v6, v17);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (void)dealloc
{
  v3 = [(SDActivityKey *)self keyData];
  [v3 length];
  id v4 = [(SDActivityKey *)self keyData];
  [v4 mutableBytes];
  cc_clear();

  v5.receiver = self;
  v5.super_class = (Class)SDActivityKey;
  [(SDActivityKey *)&v5 dealloc];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v5 = [(SDActivityKey *)self keyIdentifier];
  v6 = [v5 UUIDString];
  v7 = [(SDActivityKey *)self dateCreated];
  v8 = +[NSString stringWithFormat:@"<%@: %p, keyIdentifier:%@, dateCreated:%@, lastUsedCounter:%hu>", v4, self, v6, v7, [(SDActivityKey *)self lastUsedCounter]];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SDActivityKey *)self keyData];
    v7 = [v5 keyData];

    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableData *)self->_keyData hash];
}

- (NSDictionary)dictRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(SDActivityKey *)self keyData];
  [v3 setObject:v4 forKeyedSubscript:@"keyData"];

  id v5 = [(SDActivityKey *)self keyIdentifier];
  v6 = [v5 UUIDString];
  [v3 setObject:v6 forKeyedSubscript:@"keyIdentifier"];

  v7 = [(SDActivityKey *)self dateCreated];
  [v3 setObject:v7 forKeyedSubscript:@"dateCreated"];

  unsigned __int8 v8 = +[NSNumber numberWithUnsignedShort:[(SDActivityKey *)self lastUsedCounter]];
  [v3 setObject:v8 forKeyedSubscript:@"lastUsedCounter"];

  return (NSDictionary *)v3;
}

- (BOOL)isValidKey
{
  return [(SDActivityKey *)self lastUsedCounter] != 0;
}

- (NSUUID)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (unsigned)lastUsedCounter
{
  return self->_lastUsedCounter;
}

- (void)setLastUsedCounter:(unsigned __int16)a3
{
  self->_lastUsedCounter = a3;
}

- (void)setValidKey:(BOOL)a3
{
  self->_validKey = a3;
}

- (NSMutableData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end