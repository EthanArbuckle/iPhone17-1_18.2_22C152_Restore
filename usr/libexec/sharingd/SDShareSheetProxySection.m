@interface SDShareSheetProxySection
- (NSArray)proxies;
- (SDShareSheetProxySection)initWithType:(int64_t)a3 proxies:(id)a4;
- (id)description;
- (int64_t)type;
- (unint64_t)initialBatchSize;
- (void)setInitialBatchSize:(unint64_t)a3;
@end

@implementation SDShareSheetProxySection

- (SDShareSheetProxySection)initWithType:(int64_t)a3 proxies:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDShareSheetProxySection;
  v7 = [(SDShareSheetProxySection *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = (NSArray *)[v6 copy];
    proxies = v8->_proxies;
    v8->_proxies = v9;
  }
  return v8;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SDShareSheetProxySection;
  v3 = [(SDShareSheetProxySection *)&v8 description];
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (uint64_t)*(&off_1008CDC30 + type);
  }
  id v6 = +[NSString stringWithFormat:@"%@ type:%@ initialBatchSize:%ld proxiesCount:%lu", v3, v5, self->_initialBatchSize, [(NSArray *)self->_proxies count]];

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (unint64_t)initialBatchSize
{
  return self->_initialBatchSize;
}

- (void)setInitialBatchSize:(unint64_t)a3
{
  self->_initialBatchSize = a3;
}

- (void).cxx_destruct
{
}

@end