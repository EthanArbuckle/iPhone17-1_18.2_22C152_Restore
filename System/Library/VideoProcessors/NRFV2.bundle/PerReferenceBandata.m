@interface PerReferenceBandata
- (PerReferenceBandata)init;
@end

@implementation PerReferenceBandata

- (PerReferenceBandata)init
{
  v8.receiver = self;
  v8.super_class = (Class)PerReferenceBandata;
  v2 = [(PerReferenceBandata *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    ev0 = v2->ev0;
    v2->ev0 = (SparseAndDenseBandData *)v3;

    uint64_t v5 = objc_opt_new();
    evm = v2->evm;
    v2->evm = (SparseAndDenseBandData *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->evm, 0);

  objc_storeStrong((id *)&self->ev0, 0);
}

@end