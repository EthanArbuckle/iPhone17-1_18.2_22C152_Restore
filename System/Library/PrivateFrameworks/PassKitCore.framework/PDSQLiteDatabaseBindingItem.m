@interface PDSQLiteDatabaseBindingItem
- (NSString)textValue;
- (PDSQLiteDatabaseBindingItem)initWithIntValue:(int64_t)a3;
- (PDSQLiteDatabaseBindingItem)initWithTextValue:(id)a3;
- (PDSQLiteDatabaseBindingItem)initWithType:(unint64_t)a3;
- (id)description;
- (int64_t)intValue;
- (unint64_t)type;
@end

@implementation PDSQLiteDatabaseBindingItem

- (PDSQLiteDatabaseBindingItem)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDSQLiteDatabaseBindingItem;
  result = [(PDSQLiteDatabaseBindingItem *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (PDSQLiteDatabaseBindingItem)initWithIntValue:(int64_t)a3
{
  result = [(PDSQLiteDatabaseBindingItem *)self initWithType:0];
  if (result) {
    result->_intValue = a3;
  }
  return result;
}

- (PDSQLiteDatabaseBindingItem)initWithTextValue:(id)a3
{
  id v5 = a3;
  v6 = [(PDSQLiteDatabaseBindingItem *)self initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textValue, a3);
  }

  return v7;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    id v5 = self->_textValue;
  }
  else if (type)
  {
    id v5 = 0;
  }
  else
  {
    v4 = +[NSNumber numberWithLongLong:self->_intValue];
    id v5 = [v4 description];
  }
  if (self->_type) {
    CFStringRef v6 = @"text";
  }
  else {
    CFStringRef v6 = @"int64";
  }
  v7 = +[NSString stringWithFormat:@"type: %@, value: %@", v6, v5];

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (NSString)textValue
{
  return self->_textValue;
}

- (void).cxx_destruct
{
}

@end