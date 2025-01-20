@interface PBFDataRefreshContext
+ (id)dynamicDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4 lastRefreshDate:(id)a5 refreshStrategy:(int64_t)a6;
+ (id)staticDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4;
- (NSDate)lastRefreshDate;
- (NSDate)now;
- (NSDictionary)userInfo;
- (NSString)component;
- (PBFDataRefreshContext)initWithComponent:(id)a3 now:(id)a4 lastRefreshDate:(id)a5 userInfo:(id)a6;
@end

@implementation PBFDataRefreshContext

+ (id)dynamicDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4 lastRefreshDate:(id)a5 refreshStrategy:(int64_t)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = @"refreshStrategy";
  v9 = NSNumber;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 numberWithInteger:a6];
  v18[1] = @"extension";
  v19[0] = v13;
  v19[1] = v11;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  v15 = [PBFDataRefreshContext alloc];
  v16 = [(PBFDataRefreshContext *)v15 initWithComponent:@"PBFDataComponentDynamicDescriptors" now:v12 lastRefreshDate:v10 userInfo:v14];

  return v16;
}

+ (id)staticDescriptorsRefreshContextForNow:(id)a3 extension:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"extension";
  v13[0] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v9 = [PBFDataRefreshContext alloc];

  id v10 = [(PBFDataRefreshContext *)v9 initWithComponent:@"PBFDataComponentStaticDescriptors" now:v7 lastRefreshDate:0 userInfo:v8];
  return v10;
}

- (PBFDataRefreshContext)initWithComponent:(id)a3 now:(id)a4 lastRefreshDate:(id)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PBFDataRefreshContext;
  v15 = [(PBFDataRefreshContext *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    uint64_t v17 = [v12 copy];
    now = v16->_now;
    v16->_now = (NSDate *)v17;

    uint64_t v19 = [v13 copy];
    lastRefreshDate = v16->_lastRefreshDate;
    v16->_lastRefreshDate = (NSDate *)v19;

    uint64_t v21 = [v14 copy];
    v22 = (void *)v21;
    if (v21) {
      v23 = (void *)v21;
    }
    else {
      v23 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v16->_userInfo, v23);
  }
  return v16;
}

- (NSString)component
{
  return self->_component;
}

- (NSDate)now
{
  return self->_now;
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end