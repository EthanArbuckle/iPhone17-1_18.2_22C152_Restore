@interface SCWatchlistInlineDefaultsProvider
- (SCWatchlistInlineDefaultsProvider)initWithDefaults:(id)a3;
- (void)fetchWatchlistDefaultsWithCompletion:(id)a3;
@end

@implementation SCWatchlistInlineDefaultsProvider

- (SCWatchlistInlineDefaultsProvider)initWithDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistInlineDefaultsProvider;
  v6 = [(SCWatchlistInlineDefaultsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaults, a3);
  }

  return v7;
}

- (void)fetchWatchlistDefaultsWithCompletion:(id)a3
{
  defaults = self->_defaults;
  id v5 = a3;
  id v6 = [(SCWatchlistDefaults *)defaults defaultSymbols];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void).cxx_destruct
{
}

@end