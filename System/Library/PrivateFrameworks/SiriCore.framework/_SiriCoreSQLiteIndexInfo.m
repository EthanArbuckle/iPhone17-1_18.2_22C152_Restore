@interface _SiriCoreSQLiteIndexInfo
- (NSArray)columns;
- (NSString)name;
- (_SiriCoreSQLiteIndexInfo)initWithName:(id)a3 columns:(id)a4;
@end

@implementation _SiriCoreSQLiteIndexInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSString)name
{
  return self->_name;
}

- (_SiriCoreSQLiteIndexInfo)initWithName:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SiriCoreSQLiteIndexInfo;
  v8 = [(_SiriCoreSQLiteIndexInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    columns = v8->_columns;
    v8->_columns = (NSArray *)v11;
  }
  return v8;
}

@end