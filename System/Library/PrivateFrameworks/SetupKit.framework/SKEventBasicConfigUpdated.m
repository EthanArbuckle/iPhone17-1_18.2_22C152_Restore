@interface SKEventBasicConfigUpdated
- (NSDictionary)basicConfig;
- (SKEventBasicConfigUpdated)initWithBasicConfig:(id)a3;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKEventBasicConfigUpdated

- (void).cxx_destruct
{
}

- (NSDictionary)basicConfig
{
  return self->_basicConfig;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    v8 = [(id)objc_opt_class() description];
    CUAppendF();
    id v3 = 0;
  }
  v9 = CUPrintNSObjectOneLine();
  CUAppendF();
  v4 = (__CFString *)v3;

  v5 = &stru_26D1CA560;
  if (v4) {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (SKEventBasicConfigUpdated)initWithBasicConfig:(id)a3
{
  id v4 = a3;
  v5 = [(SKEvent *)self initWithEventType:300];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    basicConfig = v5->_basicConfig;
    v5->_basicConfig = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

@end