@interface TSMastheadStyleOptions
- (BOOL)isEqual:(id)a3;
- (TSMastheadStyleOptions)init;
- (TSMastheadStyleOptions)initWithMastheadTextColor:(id)a3;
@end

@implementation TSMastheadStyleOptions

- (TSMastheadStyleOptions)initWithMastheadTextColor:(id)a3
{
  return (TSMastheadStyleOptions *)MastheadStyleOptions.init(mastheadTextColor:)((uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B6134728(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MastheadStyleOptions.isEqual(_:));
}

- (TSMastheadStyleOptions)init
{
}

- (void).cxx_destruct
{
}

@end