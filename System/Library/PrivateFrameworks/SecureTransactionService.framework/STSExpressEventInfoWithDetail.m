@interface STSExpressEventInfoWithDetail
- (NSString)detail;
- (STSExpressEventInfoWithDetail)initWithState:(unsigned int)a3 detail:(id)a4;
@end

@implementation STSExpressEventInfoWithDetail

- (STSExpressEventInfoWithDetail)initWithState:(unsigned int)a3 detail:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSExpressEventInfoWithDetail;
  v8 = [(STSExpressEventInfo *)&v11 initWithState:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_detail, a4);
  }

  return v9;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
}

@end