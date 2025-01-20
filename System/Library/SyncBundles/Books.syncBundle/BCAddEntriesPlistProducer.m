@interface BCAddEntriesPlistProducer
- (BCAddEntriesPlistProducer)initWithPath:(id)a3 entries:(id)a4;
- (BOOL)shouldRetry;
- (id)produceData;
- (void)dealloc;
- (void)replace:(BOOL)a3;
@end

@implementation BCAddEntriesPlistProducer

- (BCAddEntriesPlistProducer)initWithPath:(id)a3 entries:(id)a4
{
  v5 = [(BCPlistProducer *)self initWithPath:a3];
  if (v5) {
    v5->_entries = (NSArray *)a4;
  }
  return v5;
}

- (void)dealloc
{
  self->_entries = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCAddEntriesPlistProducer;
  [(BCPlistProducer *)&v3 dealloc];
}

- (BOOL)shouldRetry
{
  if (![(NSArray *)self->_entries count]) {
    return self->_replace;
  }
  v4.receiver = self;
  v4.super_class = (Class)BCAddEntriesPlistProducer;
  return [(BCPlistProducer *)&v4 shouldRetry];
}

- (id)produceData
{
  if ([(NSArray *)self->_entries count] || self->_replace)
  {
    objc_super v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
    if (!v3) {
      objc_super v3 = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
    }
    uint64_t v4 = objc_opt_class();
    v5 = (void *)BCDynamicCast(v4, (uint64_t)[(NSMutableDictionary *)v3 objectForKey:@"Books"]);
    v6 = v5;
    if (self->_replace)
    {
      v7 = self->_entries;
      if (!v7) {
        v7 = (NSArray *)objc_alloc_init((Class)NSArray);
      }
      if ([v6 isEqualToArray:v7]) {
        self->super._dataUnchanged = 1;
      }
    }
    else
    {
      if ([v5 count]) {
        v8 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v6];
      }
      else {
        v8 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      }
      v7 = v8;
      [(NSArray *)v8 addObjectsFromArray:self->_entries];
    }
    [(NSMutableDictionary *)v3 setObject:v7 forKey:@"Books"];
  }
  else
  {
    objc_super v3 = 0;
    self->super._dataUnchanged = 1;
  }
  return v3;
}

- (void)replace:(BOOL)a3
{
  self->_replace = a3;
}

@end