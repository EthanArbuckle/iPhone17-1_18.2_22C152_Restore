@interface VUIMediaEntitiesFetchControllerResult
- (NSArray)fetchResponseChanges;
- (NSArray)fetchResponses;
- (VUIMediaEntitiesFetchControllerResult)init;
- (VUIMediaEntitiesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponses:(id)a4;
- (id)description;
- (int64_t)fetchReason;
- (void)setFetchReason:(int64_t)a3;
- (void)setFetchResponseChanges:(id)a3;
- (void)setFetchResponses:(id)a3;
@end

@implementation VUIMediaEntitiesFetchControllerResult

- (VUIMediaEntitiesFetchControllerResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntitiesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponses:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaEntitiesFetchControllerResult;
  v7 = [(VUIMediaEntitiesFetchControllerResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_fetchReason = a3;
    uint64_t v9 = [v6 copy];
    fetchResponses = v8->_fetchResponses;
    v8->_fetchResponses = (NSArray *)v9;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaEntitiesFetchControllerResult;
  uint64_t v4 = [(VUIMediaEntitiesFetchControllerResult *)&v18 description];
  [v3 addObject:v4];

  v5 = NSString;
  id v6 = VUIMediaLibraryFetchReasonLogString([(VUIMediaEntitiesFetchControllerResult *)self fetchReason]);
  v7 = [v5 stringWithFormat:@"%@=%@", @"fetchReason", v6];
  [v3 addObject:v7];

  v8 = NSString;
  uint64_t v9 = [(VUIMediaEntitiesFetchControllerResult *)self fetchResponses];
  v10 = [v8 stringWithFormat:@"%@=%@", @"fetchResponses", v9];
  [v3 addObject:v10];

  v11 = NSString;
  objc_super v12 = [(VUIMediaEntitiesFetchControllerResult *)self fetchResponseChanges];
  v13 = [v11 stringWithFormat:@"%@=%@", @"fetchResponseChanges", v12];
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

- (NSArray)fetchResponses
{
  return self->_fetchResponses;
}

- (void)setFetchResponses:(id)a3
{
}

- (NSArray)fetchResponseChanges
{
  return self->_fetchResponseChanges;
}

- (void)setFetchResponseChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResponseChanges, 0);
  objc_storeStrong((id *)&self->_fetchResponses, 0);
}

@end