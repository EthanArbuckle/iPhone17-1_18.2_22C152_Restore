@interface CKKSSQLWhereValue
+ (id)op:(unint64_t)a3 value:(id)a4;
- (CKKSSQLWhereValue)initWithOperation:(unint64_t)a3 value:(id)a4;
- (NSString)value;
- (unint64_t)sqlOp;
- (void)setSqlOp:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation CKKSSQLWhereValue

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSqlOp:(unint64_t)a3
{
  self->_sqlOp = a3;
}

- (unint64_t)sqlOp
{
  return self->_sqlOp;
}

- (CKKSSQLWhereValue)initWithOperation:(unint64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKSSQLWhereValue;
  v8 = [(CKKSSQLWhereValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_sqlOp = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

+ (id)op:(unint64_t)a3 value:(id)a4
{
  id v5 = a4;
  v6 = [[CKKSSQLWhereValue alloc] initWithOperation:a3 value:v5];

  return v6;
}

@end