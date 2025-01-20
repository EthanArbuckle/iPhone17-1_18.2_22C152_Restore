@interface TSMastheadDisplayOptions
- (BOOL)isEqual:(id)a3;
- (TSMastheadDisplayOptions)init;
- (TSMastheadDisplayOptions)initWithDisplayMode:(int64_t)a3 styleOptions:(id)a4 statusBarVisiblityOffset:(double)a5;
@end

@implementation TSMastheadDisplayOptions

- (TSMastheadDisplayOptions)initWithDisplayMode:(int64_t)a3 styleOptions:(id)a4 statusBarVisiblityOffset:(double)a5
{
  id v8 = a4;
  return (TSMastheadDisplayOptions *)MastheadDisplayOptions.init(displayMode:styleOptions:statusBarVisiblityOffset:)(a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B6134728(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MastheadDisplayOptions.isEqual(_:));
}

- (TSMastheadDisplayOptions)init
{
}

- (void).cxx_destruct
{
}

@end