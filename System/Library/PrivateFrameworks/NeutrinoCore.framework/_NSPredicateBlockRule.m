@interface _NSPredicateBlockRule
- (_NSPredicateBlockRule)initWithPredicate:(id)a3 action:(id)a4;
- (id)debugDescription;
- (void)performActionWithSystem:(id)a3;
@end

@implementation _NSPredicateBlockRule

- (void).cxx_destruct
{
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(NSPredicateRule *)self predicate];
  v5 = [v4 debugDescription];
  v6 = (void *)MEMORY[0x1AD0FAD00](self->_action);
  v7 = [v3 stringWithFormat:@"IF %@ THEN %@", v5, v6];

  return v7;
}

- (void)performActionWithSystem:(id)a3
{
  action = (void (**)(id, id))self->_action;
  if (action) {
    action[2](action, a3);
  }
}

- (_NSPredicateBlockRule)initWithPredicate:(id)a3 action:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_NSPredicateBlockRule;
  v7 = [(NSPredicateRule *)&v11 initWithPredicate:a3];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1AD0FAD00](v6);
    id action = v7->_action;
    v7->_id action = (id)v8;
  }
  return v7;
}

@end