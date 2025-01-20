@interface _TUIElementAnimationValueBuilder
- (id)finalizeAnimationValues;
- (void)addAnimationValue:(id)a3 forAttributeName:(id)a4;
@end

@implementation _TUIElementAnimationValueBuilder

- (void)addAnimationValue:(id)a3 forAttributeName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_values)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    values = self->_values;
    self->_values = v7;
  }
  id v9 = [v6 copy];

  [(NSMutableDictionary *)self->_values setObject:v10 forKeyedSubscript:v9];
}

- (id)finalizeAnimationValues
{
  id v2 = [(NSMutableDictionary *)self->_values copy];

  return v2;
}

- (void).cxx_destruct
{
}

@end