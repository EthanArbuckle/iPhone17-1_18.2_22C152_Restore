@interface GTConnectionMap
- (BOOL)retrieveConnection:(id *)a3 forId:(unint64_t)a4;
- (BOOL)retrieveId:(unint64_t *)a3 forConnection:(id)a4;
- (GTConnectionMap)init;
- (NSArray)connections;
- (unint64_t)remove:(id)a3;
- (void)insert:(id)a3;
@end

@implementation GTConnectionMap

- (void).cxx_destruct
{
}

- (NSArray)connections
{
  return (NSArray *)[(NSMutableDictionary *)self->_idToConnection allValues];
}

- (BOOL)retrieveConnection:(id *)a3 forId:(unint64_t)a4
{
  idToConnection = self->_idToConnection;
  v6 = +[NSNumber numberWithUnsignedInteger:a4];
  *a3 = [(NSMutableDictionary *)idToConnection objectForKeyedSubscript:v6];

  return *a3 != 0;
}

- (BOOL)retrieveId:(unint64_t *)a3 forConnection:(id)a4
{
  v5 = [(NSMutableDictionary *)self->_idToConnection allKeysForObject:a4];
  v6 = [v5 firstObject];
  *a3 = (unint64_t)[v6 unsignedIntegerValue];

  LOBYTE(a3) = [v5 count] != 0;
  return (char)a3;
}

- (unint64_t)remove:(id)a3
{
  unint64_t v7 = 0;
  [(GTConnectionMap *)self retrieveId:&v7 forConnection:a3];
  idToConnection = self->_idToConnection;
  v5 = +[NSNumber numberWithUnsignedInteger:v7];
  [(NSMutableDictionary *)idToConnection removeObjectForKey:v5];

  return v7;
}

- (void)insert:(id)a3
{
  idToConnection = self->_idToConnection;
  unint64_t nextConnectionId = self->_nextConnectionId;
  id v6 = a3;
  unint64_t v7 = +[NSNumber numberWithUnsignedInteger:nextConnectionId];
  [(NSMutableDictionary *)idToConnection setObject:v6 forKeyedSubscript:v7];

  ++self->_nextConnectionId;
}

- (GTConnectionMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTConnectionMap;
  v2 = [(GTConnectionMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idToConnection = v2->_idToConnection;
    v2->_idToConnection = v3;

    v2->_unint64_t nextConnectionId = 1;
  }
  return v2;
}

@end