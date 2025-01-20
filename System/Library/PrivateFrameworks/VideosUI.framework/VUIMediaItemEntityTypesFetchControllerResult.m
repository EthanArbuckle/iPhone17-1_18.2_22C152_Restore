@interface VUIMediaItemEntityTypesFetchControllerResult
- (VUIMediaItemEntityTypesFetchControllerResult)init;
- (VUIMediaItemEntityTypesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponse:(id)a4;
- (VUIMediaItemEntityTypesFetchResponse)fetchResponse;
- (VUIMediaItemEntityTypesFetchResponseChanges)fetchChanges;
- (id)description;
- (int64_t)fetchReason;
- (void)setFetchChanges:(id)a3;
- (void)setFetchReason:(int64_t)a3;
- (void)setFetchResponse:(id)a3;
@end

@implementation VUIMediaItemEntityTypesFetchControllerResult

- (VUIMediaItemEntityTypesFetchControllerResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaItemEntityTypesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponse:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaItemEntityTypesFetchControllerResult;
  v8 = [(VUIMediaItemEntityTypesFetchControllerResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_fetchReason = a3;
    objc_storeStrong((id *)&v8->_fetchResponse, a4);
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaItemEntityTypesFetchControllerResult;
  uint64_t v4 = [(VUIMediaItemEntityTypesFetchControllerResult *)&v18 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = VUIMediaLibraryFetchReasonLogString([(VUIMediaItemEntityTypesFetchControllerResult *)self fetchReason]);
  id v7 = [v5 stringWithFormat:@"%@=%@", @"fetchReason", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUIMediaItemEntityTypesFetchControllerResult *)self fetchResponse];
  v10 = [v8 stringWithFormat:@"%@=%@", @"fetchResponse", v9];
  [v3 addObject:v10];

  objc_super v11 = NSString;
  v12 = [(VUIMediaItemEntityTypesFetchControllerResult *)self fetchChanges];
  v13 = [v11 stringWithFormat:@"%@=%@", @"fetchChanges", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [v3 componentsJoinedByString:@", "];
  v16 = [v14 stringWithFormat:@"<%@>", v15];

  return v16;
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (VUIMediaItemEntityTypesFetchResponse)fetchResponse
{
  return self->_fetchResponse;
}

- (void)setFetchResponse:(id)a3
{
}

- (VUIMediaItemEntityTypesFetchResponseChanges)fetchChanges
{
  return self->_fetchChanges;
}

- (void)setFetchChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchChanges, 0);
  objc_storeStrong((id *)&self->_fetchResponse, 0);
}

@end