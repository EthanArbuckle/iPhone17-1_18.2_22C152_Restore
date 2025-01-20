@interface _REFeatureMapFeatureSet
- (_REFeatureMapFeatureSet)initWithFeatureMap:(id)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
@end

@implementation _REFeatureMapFeatureSet

- (_REFeatureMapFeatureSet)initWithFeatureMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REFeatureMapFeatureSet;
  v6 = [(_REFeatureMapFeatureSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_map, a3);
  }

  return v7;
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_map count];
}

- (id)member:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_map objectForKeyedSubscript:v4];

  if (v5) {
    id v5 = v4;
  }

  return v5;
}

- (id)objectEnumerator
{
  return [(NSDictionary *)self->_map keyEnumerator];
}

- (void).cxx_destruct
{
}

@end