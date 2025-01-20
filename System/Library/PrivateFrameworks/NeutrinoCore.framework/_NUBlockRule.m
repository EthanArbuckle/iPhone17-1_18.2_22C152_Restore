@interface _NUBlockRule
- (BOOL)evaluatePredicateWithSystem:(id)a3;
- (_NUBlockRule)initWithPredicate:(id)a3 action:(id)a4;
- (void)performActionWithSystem:(id)a3;
@end

@implementation _NUBlockRule

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong(&self->_predicate, 0);
}

- (void)performActionWithSystem:(id)a3
{
  action = (void (**)(id, id))self->_action;
  if (action) {
    action[2](action, a3);
  }
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  predicate = (uint64_t (**)(id, id))self->_predicate;
  if (predicate) {
    LOBYTE(predicate) = predicate[2](predicate, a3);
  }
  return (char)predicate;
}

- (_NUBlockRule)initWithPredicate:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NUBlockRule;
  v8 = [(_NUBlockRule *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1AD0FAD00](v6);
    id predicate = v8->_predicate;
    v8->_id predicate = (id)v9;

    uint64_t v11 = MEMORY[0x1AD0FAD00](v7);
    id action = v8->_action;
    v8->_id action = (id)v11;
  }
  return v8;
}

@end