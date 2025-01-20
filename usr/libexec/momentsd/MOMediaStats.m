@interface MOMediaStats
- (MOConfigurationManager)configurationManager;
- (MOMediaStats)initWithKeyword:(id)a3 value:(double)a4;
- (NSMutableArray)members;
- (NSString)bundleId;
- (NSString)keyword;
- (double)value;
- (id)description;
- (void)setBundleId:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setKeyword:(id)a3;
- (void)setMembers:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation MOMediaStats

- (MOMediaStats)initWithKeyword:(id)a3 value:(double)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOMediaStats;
  v8 = [(MOMediaStats *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_keyword, a3);
    v9->_value = a4;
    uint64_t v10 = objc_opt_new();
    members = v9->_members;
    v9->_members = (NSMutableArray *)v10;

    bundleId = v9->_bundleId;
    v9->_bundleId = 0;
  }
  return v9;
}

- (id)description
{
  v3 = +[MOMediaPlaySession redactString:self->_keyword];
  v4 = +[NSString stringWithFormat:@"keyword, %@, value, %f, memeber.count, %lu", v3, *(void *)&self->_value, [(NSMutableArray *)self->_members count]];

  return v4;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSMutableArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_members, 0);

  objc_storeStrong((id *)&self->_keyword, 0);
}

@end