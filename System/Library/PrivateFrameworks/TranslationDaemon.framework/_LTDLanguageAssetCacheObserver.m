@interface _LTDLanguageAssetCacheObserver
- (BOOL)isIndeterminate;
- (NSUUID)observerId;
- (_LTDLanguageAssetCacheObserver)initWithID:(id)a3 type:(unint64_t)a4 progress:(BOOL)a5 observations:(id)a6 completion:(id)a7;
- (id)completion;
- (id)observations;
- (unint64_t)type;
@end

@implementation _LTDLanguageAssetCacheObserver

- (_LTDLanguageAssetCacheObserver)initWithID:(id)a3 type:(unint64_t)a4 progress:(BOOL)a5 observations:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_LTDLanguageAssetCacheObserver;
  v16 = [(_LTDLanguageAssetCacheObserver *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_observerId, a3);
    v17->_type = a4;
    v17->_isIndeterminate = !a5;
    uint64_t v18 = MEMORY[0x26120C050](v14);
    id observations = v17->_observations;
    v17->_id observations = (id)v18;

    uint64_t v20 = MEMORY[0x26120C050](v15);
    id completion = v17->_completion;
    v17->_id completion = (id)v20;

    v22 = v17;
  }

  return v17;
}

- (NSUUID)observerId
{
  return self->_observerId;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (id)observations
{
  return self->_observations;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_observations, 0);
  objc_storeStrong((id *)&self->_observerId, 0);
}

@end