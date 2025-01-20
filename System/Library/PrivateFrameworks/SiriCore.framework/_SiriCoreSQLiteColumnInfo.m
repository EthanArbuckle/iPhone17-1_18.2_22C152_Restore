@interface _SiriCoreSQLiteColumnInfo
- (BOOL)isNotNull;
- (BOOL)isPrimaryKey;
- (NSString)name;
- (NSString)type;
- (SiriCoreSQLiteValue)defaultValue;
- (_SiriCoreSQLiteColumnInfo)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(id)a5 isPrimaryKey:(BOOL)a6 isNotNull:(BOOL)a7 defaultValue:(id)a8;
- (int64_t)identifier;
@end

@implementation _SiriCoreSQLiteColumnInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (SiriCoreSQLiteValue)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isNotNull
{
  return self->_isNotNull;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (_SiriCoreSQLiteColumnInfo)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(id)a5 isPrimaryKey:(BOOL)a6 isNotNull:(BOOL)a7 defaultValue:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_SiriCoreSQLiteColumnInfo;
  v17 = [(_SiriCoreSQLiteColumnInfo *)&v26 init];
  v18 = v17;
  if (v17)
  {
    v17->_identifier = a3;
    uint64_t v19 = [v14 copy];
    name = v18->_name;
    v18->_name = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    type = v18->_type;
    v18->_type = (NSString *)v21;

    v18->_isPrimaryKey = a6;
    v18->_isNotNull = a7;
    uint64_t v23 = [v16 copy];
    defaultValue = v18->_defaultValue;
    v18->_defaultValue = (SiriCoreSQLiteValue *)v23;
  }
  return v18;
}

@end