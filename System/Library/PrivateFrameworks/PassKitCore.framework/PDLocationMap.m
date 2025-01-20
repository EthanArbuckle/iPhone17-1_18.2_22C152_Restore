@interface PDLocationMap
- (PDLocationMap)init;
- (id)description;
- (id)locationsForUniqueID:(id)a3;
- (void)insertLocation:(id)a3 forUniqueID:(id)a4;
@end

@implementation PDLocationMap

- (PDLocationMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDLocationMap;
  v2 = [(PDLocationMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    locationsByUniqueID = v2->_locationsByUniqueID;
    v2->_locationsByUniqueID = v3;
  }
  return v2;
}

- (void)insertLocation:(id)a3 forUniqueID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_locationsByUniqueID objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->_locationsByUniqueID setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (id)locationsForUniqueID:(id)a3
{
  return [(NSMutableDictionary *)self->_locationsByUniqueID objectForKeyedSubscript:a3];
}

- (id)description
{
  return [(NSMutableDictionary *)self->_locationsByUniqueID description];
}

- (void).cxx_destruct
{
}

@end