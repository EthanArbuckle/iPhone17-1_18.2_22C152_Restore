@interface _RMPredicateVisitor
- (NSSet)statusKeyPaths;
- (_RMPredicateVisitor)initWithFormat:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _RMPredicateVisitor

- (NSSet)statusKeyPaths
{
  id v2 = [(NSMutableSet *)self->_statusKeyPaths copy];

  return (NSSet *)v2;
}

- (_RMPredicateVisitor)initWithFormat:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RMPredicateVisitor;
  v5 = [(_RMPredicateVisitor *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    format = v5->_format;
    v5->_format = v6;

    uint64_t v8 = objc_opt_new();
    statusKeyPaths = v5->_statusKeyPaths;
    v5->_statusKeyPaths = (NSMutableSet *)v8;
  }
  return v5;
}

- (void)visitPredicateExpression:(id)a3
{
  id v6 = a3;
  if ([v6 expressionType] == (id)3)
  {
    statusKeyPaths = self->_statusKeyPaths;
    v5 = [v6 keyPath];
    [(NSMutableSet *)statusKeyPaths addObject:v5];
  }
}

- (void)visitPredicateOperator:(id)a3
{
  id v9 = a3;
  if ([v9 operatorType] == (id)11)
  {
    uint64_t v4 = RMErrorDomain;
    CFStringRef v10 = @"error";
    v5 = [v9 symbol];
    id v6 = +[RMErrorUtilities createUnableToParsePredicateErrorWithCustomOperator:v5 predicateFormat:self->_format];
    objc_super v11 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = +[NSException exceptionWithName:v4 reason:&stru_10001DAE0 userInfo:v7];

    objc_exception_throw(v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeyPaths, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

@end