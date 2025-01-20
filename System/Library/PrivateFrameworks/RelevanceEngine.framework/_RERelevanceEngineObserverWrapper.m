@interface _RERelevanceEngineObserverWrapper
- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4;
- (RERelevanceEngineObserver)observer;
- (_RERelevanceEngineObserverWrapper)initWithObserver:(id)a3;
- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6;
- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didUpdateRelevanceForElement:(id)a4;
- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5;
- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3;
- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3;
@end

@implementation _RERelevanceEngineObserverWrapper

- (_RERelevanceEngineObserverWrapper)initWithObserver:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_RERelevanceEngineObserverWrapper;
  v5 = [(_RERelevanceEngineObserverWrapper *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFF7F | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 256;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFEFF | v14;
  }

  return v6;
}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  id v12 = a3;
  __int16 v8 = (void (**)(void))a4;
  __int16 v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  __int16 v11 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_observerCallbacks & 1) != 0)
  {
    [WeakRetained relevanceEngine:v12 performBatchUpdateBlock:v8 completion:v9];
  }
  else
  {
    if (v8) {
      v8[2](v8);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5
{
  if ((*(_WORD *)&self->_observerCallbacks & 2) != 0)
  {
    p_observer = &self->_observer;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngine:v10 didReloadElement:v9 atPath:v8];
  }
}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  if ((*(_WORD *)&self->_observerCallbacks & 4) != 0)
  {
    p_observer = &self->_observer;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngine:v10 didRemoveElement:v9 atPath:v8];
  }
}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  if ((*(_WORD *)&self->_observerCallbacks & 8) != 0)
  {
    p_observer = &self->_observer;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngine:v10 didInsertElement:v9 atPath:v8];
  }
}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  if ((*(_WORD *)&self->_observerCallbacks & 0x10) != 0)
  {
    p_observer = &self->_observer;
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngine:v13 didMoveElement:v12 fromPath:v11 toPath:v10];
  }
}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v9 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_observerCallbacks & 0x20) != 0) {
    char v10 = [WeakRetained relevanceEngine:v6 isElementAtPathVisible:v7];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (void)relevanceEngine:(id)a3 didUpdateRelevanceForElement:(id)a4
{
  if ((*(_WORD *)&self->_observerCallbacks & 0x40) != 0)
  {
    p_observer = &self->_observer;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngine:v7 didUpdateRelevanceForElement:v6];
  }
}

- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3
{
  if ((*(_WORD *)&self->_observerCallbacks & 0x80) != 0)
  {
    p_observer = &self->_observer;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngineDidBeginUpdatingRelevance:v4];
  }
}

- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3
{
  if ((*(_WORD *)&self->_observerCallbacks & 0x100) != 0)
  {
    p_observer = &self->_observer;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained relevanceEngineDidFinishUpdatingRelevance:v4];
  }
}

- (RERelevanceEngineObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (RERelevanceEngineObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end