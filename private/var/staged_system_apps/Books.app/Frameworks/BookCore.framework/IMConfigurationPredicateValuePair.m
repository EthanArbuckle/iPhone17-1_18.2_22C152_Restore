@interface IMConfigurationPredicateValuePair
- (IMConfigurationPredicate)predicate;
- (id)description;
- (id)value;
- (void)setPredicate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation IMConfigurationPredicateValuePair

- (id)description
{
  v3 = [(IMConfigurationPredicateValuePair *)self predicate];
  v4 = [v3 description];
  v5 = [(IMConfigurationPredicateValuePair *)self value];
  v6 = [v5 description];
  v7 = +[NSString stringWithFormat:@"{%@ -> %@}", v4, v6];

  return v7;
}

- (IMConfigurationPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end