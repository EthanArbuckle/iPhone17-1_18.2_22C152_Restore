@interface CKKSSQLWhereIn
- (CKKSSQLWhereIn)initWithValues:(id)a3;
- (NSArray)values;
- (void)setValues:(id)a3;
@end

@implementation CKKSSQLWhereIn

- (void).cxx_destruct
{
}

- (void)setValues:(id)a3
{
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSSQLWhereIn)initWithValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSQLWhereIn;
  v6 = [(CKKSSQLWhereIn *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_values, a3);
  }

  return v7;
}

@end