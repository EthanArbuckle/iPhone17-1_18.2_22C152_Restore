@interface CRLBidirectionalMap
- (CRLBidirectionalMap)init;
- (id)allKeys;
- (id)allValues;
- (id)backwardKeys;
- (id)backwardValues;
- (id)forwardKeys;
- (id)forwardValues;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CRLBidirectionalMap

- (CRLBidirectionalMap)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLBidirectionalMap;
  v2 = [(CRLBidirectionalMap *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    forward = v2->_forward;
    v2->_forward = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backward = v2->_backward;
    v2->_backward = v5;
  }
  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_forward objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [(NSMutableDictionary *)self->_backward objectForKeyedSubscript:v4];
  }

  return v5;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_forward objectForKeyedSubscript:v6];
  objc_super v8 = [(NSMutableDictionary *)self->_backward objectForKeyedSubscript:v6];
  if (v8)
  {
    v9 = [(NSMutableDictionary *)self->_forward objectForKeyedSubscript:v8];
    if (v9) {
      [(NSMutableDictionary *)self->_forward setObject:0 forKeyedSubscript:v8];
    }
    if (v10) {
      [(NSMutableDictionary *)self->_forward setObject:v6 forKeyedSubscript:v10];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backward, "setObject:forKeyedSubscript:");
  }
  else
  {
    if (v7) {
      [(NSMutableDictionary *)self->_backward setObject:0 forKeyedSubscript:v7];
    }
    if (v10) {
      [(NSMutableDictionary *)self->_backward setObject:v6 forKeyedSubscript:v10];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_forward, "setObject:forKeyedSubscript:");
  }
}

- (id)allKeys
{
  v3 = [(NSMutableDictionary *)self->_forward allKeys];
  id v4 = [(NSMutableDictionary *)self->_backward allKeys];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];
  id v6 = v5;
  if (!v5) {
    v5 = &__NSArray0__struct;
  }
  id v7 = v5;

  return v7;
}

- (id)allValues
{
  v3 = [(NSMutableDictionary *)self->_forward allValues];
  id v4 = [(NSMutableDictionary *)self->_backward allValues];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];
  id v6 = v5;
  if (!v5) {
    v5 = &__NSArray0__struct;
  }
  id v7 = v5;

  return v7;
}

- (id)forwardKeys
{
  return [(NSMutableDictionary *)self->_forward allKeys];
}

- (id)forwardValues
{
  return [(NSMutableDictionary *)self->_forward allValues];
}

- (id)backwardKeys
{
  return [(NSMutableDictionary *)self->_backward allKeys];
}

- (id)backwardValues
{
  return [(NSMutableDictionary *)self->_backward allValues];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backward, 0);

  objc_storeStrong((id *)&self->_forward, 0);
}

@end