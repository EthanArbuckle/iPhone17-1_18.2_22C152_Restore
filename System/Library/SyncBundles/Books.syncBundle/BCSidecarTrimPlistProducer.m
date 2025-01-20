@interface BCSidecarTrimPlistProducer
- (BCSidecarTrimPlistProducer)initWithPath:(id)a3 removePaths:(id)a4;
- (BOOL)shouldRetry;
- (id)produceData;
- (void)dealloc;
@end

@implementation BCSidecarTrimPlistProducer

- (BCSidecarTrimPlistProducer)initWithPath:(id)a3 removePaths:(id)a4
{
  v5 = [(BCPlistProducer *)self initWithPath:a3];
  if (v5) {
    v5->_removePaths = (NSArray *)a4;
  }
  return v5;
}

- (void)dealloc
{
  self->_removePaths = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCSidecarTrimPlistProducer;
  [(BCPlistProducer *)&v3 dealloc];
}

- (BOOL)shouldRetry
{
  NSUInteger v3 = [(NSArray *)self->_removePaths count];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCSidecarTrimPlistProducer;
    LOBYTE(v3) = [(BCPlistProducer *)&v5 shouldRetry];
  }
  return v3;
}

- (id)produceData
{
  if (![(NSString *)self->super._path length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCSidecarTrimPlistProducer.m", 50, @"Path not specified: %@", self->super._path object file lineNumber description];
  }
  if (![(NSArray *)self->_removePaths count])
  {
    v4 = 0;
LABEL_8:
    self->super._dataUnchanged = 1;
    return v4;
  }
  v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  v6 = (void *)BCDynamicCast(v5, (uint64_t)[(NSMutableDictionary *)v4 objectForKey:@"Deletes"]);
  id v7 = [v6 arrayRemovingMatchingStrings:self->_removePaths];
  id v8 = [v6 count];
  if (v8 <= [v7 count]) {
    goto LABEL_8;
  }
  [(NSMutableDictionary *)v4 setObject:v7 forKey:@"Deletes"];
  return v4;
}

@end