@interface _PASSqlWriteTransaction
- (_PASSqlWriteTransaction)initWithHandle:(id)a3;
@end

@implementation _PASSqlWriteTransaction

- (_PASSqlWriteTransaction)initWithHandle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PASSqlWriteTransaction;
  return [(_PASSqlReadTransaction *)&v4 initWithHandle:a3];
}

@end