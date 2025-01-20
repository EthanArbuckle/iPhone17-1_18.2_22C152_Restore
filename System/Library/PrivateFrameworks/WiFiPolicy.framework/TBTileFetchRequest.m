@interface TBTileFetchRequest
+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (BOOL)cacheable;
- (BOOL)doesLocalResultsSatisfyRequest:(id)a3;
- (NSDictionary)userInfo;
- (TBTileFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (TBTileFetchRequestDescriptor)descriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)preferLocalHandler;
- (id)resultsHandler;
- (unint64_t)sourcePolicy;
- (void)handlePreferLocalResponse:(id)a3;
- (void)handleResponse:(id)a3;
- (void)setCacheable:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setPreferLocalHandler:(id)a3;
- (void)setResultsHandler:(id)a3;
- (void)setSourcePolicy:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TBTileFetchRequest

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v8 sourcePolicy:a4 cacheable:v5];

  return v9;
}

- (TBTileFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  id v8 = (TBTileFetchRequestDescriptor *)a3;
  v12.receiver = self;
  v12.super_class = (Class)TBTileFetchRequest;
  v9 = [(TBTileFetchRequest *)&v12 init];
  descriptor = v9->_descriptor;
  v9->_descriptor = v8;

  v9->_sourcePolicy = a4;
  v9->_cacheable = a5;
  return v9;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TBTileFetchRequest *)self resultsHandler];
  v5[2](v5, v4, 0, 1);
}

- (void)handlePreferLocalResponse:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 count];
  id v6 = v14;
  if (v4)
  {
    v7 = [v14 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 created];
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      if (self->userInfo)
      {
        v11 = [(TBTileFetchRequest *)self userInfo];
        objc_super v12 = (void *)[v11 mutableCopy];

        v13 = [NSNumber numberWithUnsignedInteger:(unint64_t)-v10];
        [v12 setObject:v13 forKey:@"staleness"];

        [(TBTileFetchRequest *)self setUserInfo:v12];
      }
    }

    id v6 = v14;
  }

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (BOOL)doesLocalResultsSatisfyRequest:(id)a3
{
  return [a3 count] != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(TBTileFetchRequest *)self descriptor];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDescriptor:v7];

  objc_msgSend(v5, "setSourcePolicy:", -[TBTileFetchRequest sourcePolicy](self, "sourcePolicy"));
  objc_msgSend(v5, "setCacheable:", -[TBTileFetchRequest cacheable](self, "cacheable"));
  id v8 = [(TBTileFetchRequest *)self resultsHandler];

  if (v8)
  {
    double v9 = [(TBTileFetchRequest *)self resultsHandler];
    [v5 setResultsHandler:v9];
  }
  double v10 = [(TBTileFetchRequest *)self userInfo];

  if (v10)
  {
    v11 = [(TBTileFetchRequest *)self userInfo];
    objc_super v12 = (void *)[v11 copyWithZone:a3];
    [v5 setUserInfo:v12];
  }
  return v5;
}

- (unint64_t)sourcePolicy
{
  return self->_sourcePolicy;
}

- (void)setSourcePolicy:(unint64_t)a3
{
  self->_sourcePolicy = a3;
}

- (BOOL)cacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (id)preferLocalHandler
{
  return self->preferLocalHandler;
}

- (void)setPreferLocalHandler:(id)a3
{
}

- (TBTileFetchRequestDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong(&self->preferLocalHandler, 0);
  objc_storeStrong(&self->resultsHandler, 0);

  objc_storeStrong((id *)&self->userInfo, 0);
}

@end