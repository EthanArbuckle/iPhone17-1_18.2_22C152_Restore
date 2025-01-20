@interface _SBSystemStatusStatusItemDataProviderOperation
- (BOOL)isEnabling;
- (_SBSystemStatusStatusItemDataProviderOperation)initWithEnabling:(BOOL)a3 completion:(id)a4;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setEnabling:(BOOL)a3;
@end

@implementation _SBSystemStatusStatusItemDataProviderOperation

- (_SBSystemStatusStatusItemDataProviderOperation)initWithEnabling:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBSystemStatusStatusItemDataProviderOperation;
  v7 = [(_SBSystemStatusStatusItemDataProviderOperation *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_enabling = a3;
    uint64_t v9 = [v6 copy];
    id completion = v8->_completion;
    v8->_id completion = (id)v9;
  }
  return v8;
}

- (BOOL)isEnabling
{
  return self->_enabling;
}

- (void)setEnabling:(BOOL)a3
{
  self->_enabling = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end