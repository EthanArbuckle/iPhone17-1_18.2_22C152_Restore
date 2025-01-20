@interface _TUIIdentifierNumberWithUUID
- (BOOL)isEqual:(id)a3;
- (_TUIIdentifierNumberWithUUID)initWithUUID:(id)a3 value:(unint64_t)a4;
- (id)tui_identifierByAppendingIndex:(unint64_t)a3;
- (id)tui_identifierByAppendingString:(id)a3;
- (id)tui_identifierByPrependingUUID:(id)a3;
- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3;
- (id)tui_identifierToString;
- (id)tui_identifierUUID;
- (unint64_t)hash;
@end

@implementation _TUIIdentifierNumberWithUUID

- (_TUIIdentifierNumberWithUUID)initWithUUID:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUIIdentifierNumberWithUUID;
  v7 = [(_TUIIdentifierNumberWithUUID *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [v6 getUUIDBytes:v7->_uuid];
    v8->_value = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  return *(void *)self->_uuid ^ self->_value;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_TUIIdentifierNumberWithUUID *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_value == v4->_value
      && *(void *)self->_uuid == *(void *)v4->_uuid
      && *(void *)&self->_uuid[8] == *(void *)&v4->_uuid[8];
  }

  return v6;
}

- (id)tui_identifierToString
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_uuid];
  v4 = [v3 UUIDString];
  v5 = +[NSString stringWithFormat:@"%@/%lu", v4, self->_value];

  return v5;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_uuid];
  BOOL v6 = [v5 UUIDString];
  v10[0] = v6;
  v7 = +[TUIIdentifierMap describeForDebuggingIdentifierIndex:self->_value package:v4];
  v10[1] = v7;
  v8 = +[NSArray arrayWithObjects:v10 count:2];

  return v8;
}

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  return 0;
}

- (id)tui_identifierByAppendingString:(id)a3
{
  return 0;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  return 0;
}

- (id)tui_identifierUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_uuid];

  return v2;
}

@end