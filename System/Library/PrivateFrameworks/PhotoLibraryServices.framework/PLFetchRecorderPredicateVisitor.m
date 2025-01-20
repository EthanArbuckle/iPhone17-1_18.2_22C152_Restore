@interface PLFetchRecorderPredicateVisitor
- (BOOL)foundOperatorIN;
- (void)examinePredicate:(id)a3;
- (void)reset;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation PLFetchRecorderPredicateVisitor

- (BOOL)foundOperatorIN
{
  return self->_foundOperatorIN;
}

- (void)examinePredicate:(id)a3
{
}

- (void)reset
{
  self->_foundOperatorIN = 0;
}

- (void)visitPredicateOperator:(id)a3
{
  if ([a3 operatorType] == 10) {
    self->_foundOperatorIN = 1;
  }
}

@end