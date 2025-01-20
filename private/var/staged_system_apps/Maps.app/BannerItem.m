@interface BannerItem
- (BannerItem)initWithGuidanceState:(id)a3;
- (IPCGuidanceStateReply)guidanceState;
- (NSString)uniqueId;
- (id)description;
- (void)updateFromGuidanceState:(id)a3;
@end

@implementation BannerItem

- (BannerItem)initWithGuidanceState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BannerItem;
  v5 = [(BannerItem *)&v9 init];
  if (v5)
  {
    v6 = (IPCGuidanceStateReply *)[v4 copy];
    guidanceState = v5->_guidanceState;
    v5->_guidanceState = v6;
  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p uniqueId:%@>", objc_opt_class(), self, self->_uniqueId];
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)updateFromGuidanceState:(id)a3
{
  id v4 = (IPCGuidanceStateReply *)[a3 copy];
  guidanceState = self->_guidanceState;
  self->_guidanceState = v4;

  v6 = sub_1000AD30C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Update existing item: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (IPCGuidanceStateReply)guidanceState
{
  return self->_guidanceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceState, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end