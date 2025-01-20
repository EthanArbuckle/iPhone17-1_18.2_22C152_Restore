@interface _UITextSearchingFindSessionAggregator
- (BOOL)isValid;
- (NSOrderedSet)allFoundRanges;
- (UITextSearchingFindSession)session;
- (_UITextSearchingFindSessionAggregator)initWithSession:(id)a3;
- (void)_performOnMainIfValid:(id)a3;
- (void)finishedSearching;
- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5;
- (void)invalidate;
- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation _UITextSearchingFindSessionAggregator

- (_UITextSearchingFindSessionAggregator)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextSearchingFindSessionAggregator;
  v5 = [(_UITextSearchingFindSessionAggregator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_valid = 1;
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

- (void)_performOnMainIfValid:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if ([(_UITextSearchingFindSessionAggregator *)self isValid])
  {
    if (pthread_main_np() == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
      v4[2](v4, WeakRetained);
    }
    else
    {
      objc_copyWeak(&to, (id *)&self->_session);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63___UITextSearchingFindSessionAggregator__performOnMainIfValid___block_invoke;
      block[3] = &unk_1E52E95A0;
      objc_copyWeak(&v8, &to);
      v7 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&to);
    }
  }
}

- (NSOrderedSet)allFoundRanges
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  v3 = [WeakRetained _allFoundRanges];

  return (NSOrderedSet *)v3;
}

- (void)finishedSearching
{
}

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79___UITextSearchingFindSessionAggregator_foundRange_forSearchString_inDocument___block_invoke;
  v14[3] = &unk_1E53086A8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_UITextSearchingFindSessionAggregator *)self _performOnMainIfValid:v14];
}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73___UITextSearchingFindSessionAggregator_invalidateFoundRange_inDocument___block_invoke;
  v10[3] = &unk_1E53086D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_UITextSearchingFindSessionAggregator *)self _performOnMainIfValid:v10];
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (UITextSearchingFindSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (UITextSearchingFindSession *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end