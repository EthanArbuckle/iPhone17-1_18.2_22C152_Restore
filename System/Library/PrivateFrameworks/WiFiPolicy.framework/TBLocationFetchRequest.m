@interface TBLocationFetchRequest
+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4;
+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (BOOL)cacheable;
- (NSDictionary)userInfo;
- (TBLocationFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (TBLocationFetchRequestDescriptor)descriptor;
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

@implementation TBLocationFetchRequest

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [(TBLocationFetchRequest *)self resultsHandler];
  v5[2](v5, v4, 0, 1);
}

- (TBLocationFetchRequestDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong(&self->preferLocalHandler, 0);
  objc_storeStrong(&self->resultsHandler, 0);

  objc_storeStrong((id *)&self->userInfo, 0);
}

- (id)preferLocalHandler
{
  return self->preferLocalHandler;
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
      v8 = [v7 created];
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      if (self->userInfo)
      {
        v11 = [(TBLocationFetchRequest *)self userInfo];
        v12 = (void *)[v11 mutableCopy];

        v13 = [NSNumber numberWithUnsignedInteger:(unint64_t)-v10];
        [v12 setObject:v13 forKey:@"staleness"];

        [(TBLocationFetchRequest *)self setUserInfo:v12];
      }
    }

    id v6 = v14;
  }

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)setPreferLocalHandler:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(TBLocationFetchRequest *)self descriptor];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDescriptor:v7];

  objc_msgSend(v5, "setSourcePolicy:", -[TBLocationFetchRequest sourcePolicy](self, "sourcePolicy"));
  objc_msgSend(v5, "setCacheable:", -[TBLocationFetchRequest cacheable](self, "cacheable"));
  v8 = [(TBLocationFetchRequest *)self resultsHandler];

  if (v8)
  {
    double v9 = [(TBLocationFetchRequest *)self resultsHandler];
    [v5 setResultsHandler:v9];
  }
  double v10 = [(TBLocationFetchRequest *)self userInfo];

  if (v10)
  {
    v11 = [(TBLocationFetchRequest *)self userInfo];
    v12 = (void *)[v11 copyWithZone:a3];
    [v5 setUserInfo:v12];
  }
  return v5;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)sourcePolicy
{
  return self->_sourcePolicy;
}

- (void)setSourcePolicy:(unint64_t)a3
{
  self->_sourcePolicy = a3;
}

- (void)setDescriptor:(id)a3
{
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (BOOL)cacheable
{
  return self->_cacheable;
}

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v8 sourcePolicy:a4 cacheable:v5];

  return v9;
}

- (TBLocationFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  id v8 = (TBLocationFetchRequestDescriptor *)a3;
  v12.receiver = self;
  v12.super_class = (Class)TBLocationFetchRequest;
  double v9 = [(TBLocationFetchRequest *)&v12 init];
  descriptor = v9->_descriptor;
  v9->_descriptor = v8;

  v9->_sourcePolicy = a4;
  v9->_cacheable = a5;
  return v9;
}

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v6 sourcePolicy:a4 cacheable:0];

  return v7;
}

@end