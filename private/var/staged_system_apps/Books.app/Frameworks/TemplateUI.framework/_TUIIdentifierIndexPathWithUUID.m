@interface _TUIIdentifierIndexPathWithUUID
- (BOOL)isEqual:(id)a3;
- (_TUIIdentifierIndexPathWithUUID)initWithUUID:(id)a3 indexPath:(id)a4;
- (id)tui_identifierByAppendingIndex:(unint64_t)a3;
- (id)tui_identifierByAppendingString:(id)a3;
- (id)tui_identifierByPrependingUUID:(id)a3;
- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3;
- (id)tui_identifierToString;
- (id)tui_identifierUUID;
- (id)tui_identifierWithoutUUID;
- (unint64_t)hash;
@end

@implementation _TUIIdentifierIndexPathWithUUID

- (_TUIIdentifierIndexPathWithUUID)initWithUUID:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TUIIdentifierIndexPathWithUUID;
  v8 = [(_TUIIdentifierIndexPathWithUUID *)&v14 init];
  if (v8)
  {
    v9 = (NSUUID *)[v6 copy];
    UUID = v8->_UUID;
    v8->_UUID = v9;

    v11 = (NSIndexPath *)[v7 copy];
    indexPath = v8->_indexPath;
    v8->_indexPath = v11;
  }
  return v8;
}

- (id)tui_identifierWithoutUUID
{
  return self->_indexPath;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSIndexPath *)self->_indexPath hash];
  return (unint64_t)[(NSUUID *)self->_UUID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_TUIIdentifierIndexPathWithUUID *)a3;
  if (self == v4)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSIndexPath *)self->_indexPath isEqual:v4->_indexPath])
    {
      unsigned __int8 v5 = [(NSUUID *)self->_UUID isEqual:v4->_UUID];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)tui_identifierToString
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:64];
  v4 = [(NSUUID *)self->_UUID UUIDString];
  [v3 appendFormat:@"%@", v4];

  [(NSIndexPath *)self->_indexPath tui_appendToString:v3];
  id v5 = [v3 copy];

  return v5;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(NSUUID *)self->_UUID UUIDString];
  [v5 addObject:v6];

  id v7 = [(NSIndexPath *)self->_indexPath tui_identifierDescribeForDebuggingWithPackage:v4];
  [v5 addObjectsFromArray:v7];

  id v8 = [v5 copy];

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
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end