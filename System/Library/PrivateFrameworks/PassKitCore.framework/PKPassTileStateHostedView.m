@interface PKPassTileStateHostedView
+ (id)createWithPreferredStyle:(int64_t)a3 hostedViewProvider:(id)a4;
- (id)hostedViewProvider;
- (int64_t)preferredStyle;
- (void)setPreferredStyle:(int64_t)a3;
@end

@implementation PKPassTileStateHostedView

+ (id)createWithPreferredStyle:(int64_t)a3 hostedViewProvider:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a1 createResolvedStateWithType:4];
  v7[9] = a3;
  v8 = _Block_copy(v6);

  v9 = (void *)v7[8];
  v7[8] = v8;

  return v7;
}

- (id)hostedViewProvider
{
  return self->_hostedViewProvider;
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (void).cxx_destruct
{
}

@end