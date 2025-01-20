@interface BCRemovePersistentIDPlistProducer
- (BCRemovePersistentIDPlistProducer)initWithPath:(id)a3 persistentIDs:(id)a4;
- (BOOL)shouldRetry;
- (id)produceData;
- (void)dealloc;
@end

@implementation BCRemovePersistentIDPlistProducer

- (BCRemovePersistentIDPlistProducer)initWithPath:(id)a3 persistentIDs:(id)a4
{
  v5 = [(BCPlistProducer *)self initWithPath:a3];
  if (v5) {
    v5->_persistentIDs = (NSArray *)a4;
  }
  return v5;
}

- (void)dealloc
{
  self->_persistentIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCRemovePersistentIDPlistProducer;
  [(BCPlistProducer *)&v3 dealloc];
}

- (BOOL)shouldRetry
{
  NSUInteger v3 = [(NSArray *)self->_persistentIDs count];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCRemovePersistentIDPlistProducer;
    LOBYTE(v3) = [(BCPlistProducer *)&v5 shouldRetry];
  }
  return v3;
}

- (id)produceData
{
  if (![(NSArray *)self->_persistentIDs count])
  {
    NSUInteger v3 = 0;
LABEL_6:
    self->super._dataUnchanged = 1;
    return v3;
  }
  NSUInteger v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = objc_opt_class();
  objc_super v5 = (void *)BCDynamicCast(v4, (uint64_t)[(NSMutableDictionary *)v3 objectForKey:@"Books"]);
  id v6 = [v5 arrayRemovingObjectsByKey:@"Persistent ID" matchingStrings:self->_persistentIDs];
  id v7 = [v5 count];
  if (v7 == [v6 count]) {
    goto LABEL_6;
  }
  [(NSMutableDictionary *)v3 setObject:v6 forKey:@"Books"];
  return v3;
}

@end