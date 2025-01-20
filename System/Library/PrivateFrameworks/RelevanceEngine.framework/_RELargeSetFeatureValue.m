@interface _RELargeSetFeatureValue
- (_RELargeSetFeatureValue)initWithSet:(id)a3;
- (id)setValue;
@end

@implementation _RELargeSetFeatureValue

- (_RELargeSetFeatureValue)initWithSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_RELargeSetFeatureValue;
  v5 = [(_RELargeSetFeatureValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    values = v5->_values;
    v5->_values = (NSSet *)v6;
  }
  return v5;
}

- (id)setValue
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end