@interface TIAccumulatingCandidateHandler
- (BOOL)asynchronous;
- (TIAccumulatingCandidateHandler)initWithHandlerBlock:(id)a3;
- (TIAccumulatingCandidateHandler)initWithResultSetHandlerBlock:(id)a3;
- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 handlerBlock:(id)a4 resultSetHandlerBlock:(id)a5;
- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 resultSetHandlerBlock:(id)a4;
- (TIAutocorrectionList)candidates;
- (TICandidateHandler)wrappedCandidateHandler;
- (TICandidateRequestToken)requestToken;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (id)candidateHandler;
- (id)candidateResultSetHandler;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)setCandidateResultSet:(id)a3;
- (void)setCandidates:(id)a3;
@end

@implementation TIAccumulatingCandidateHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong(&self->_candidateResultSetHandler, 0);
  objc_storeStrong(&self->_candidateHandler, 0);

  objc_storeStrong((id *)&self->_wrappedCandidateHandler, 0);
}

- (void)setCandidateResultSet:(id)a3
{
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidates:(id)a3
{
}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (id)candidateResultSetHandler
{
  return self->_candidateResultSetHandler;
}

- (id)candidateHandler
{
  return self->_candidateHandler;
}

- (TICandidateHandler)wrappedCandidateHandler
{
  return self->_wrappedCandidateHandler;
}

- (TICandidateRequestToken)requestToken
{
  return 0;
}

- (void)close
{
  if (self->_status != 2)
  {
    self->_status = 2;
    v3 = [(TIAccumulatingCandidateHandler *)self candidateHandler];

    if (v3)
    {
      v4 = [(TIAccumulatingCandidateHandler *)self candidateHandler];
      v5 = [(TIAccumulatingCandidateHandler *)self candidates];
      if (v5)
      {
        ((void (**)(void, void *))v4)[2](v4, v5);
      }
      else
      {
        v6 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:0];
        ((void (**)(void, void *))v4)[2](v4, v6);
      }
    }
    v7 = [(TIAccumulatingCandidateHandler *)self candidateResultSetHandler];

    if (v7)
    {
      v8 = [(TIAccumulatingCandidateHandler *)self candidateResultSetHandler];
      v9 = [(TIAccumulatingCandidateHandler *)self candidateResultSet];
      ((void (**)(void, void *))v8)[2](v8, v9);
    }
    wrappedCandidateHandler = self->_wrappedCandidateHandler;
    [(TICandidateHandler *)wrappedCandidateHandler close];
  }
}

- (void)open
{
  self->_status = 1;
}

- (BOOL)asynchronous
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TIAccumulatingCandidateHandler;
  [(TIAccumulatingCandidateHandler *)&v2 dealloc];
}

- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 handlerBlock:(id)a4 resultSetHandlerBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIAccumulatingCandidateHandler;
  v12 = [(TIAccumulatingCandidateHandler *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wrappedCandidateHandler, a3);
    uint64_t v14 = [v10 copy];
    id candidateHandler = v13->_candidateHandler;
    v13->_id candidateHandler = (id)v14;

    uint64_t v16 = [v11 copy];
    id candidateResultSetHandler = v13->_candidateResultSetHandler;
    v13->_id candidateResultSetHandler = (id)v16;

    v13->_status = 0;
  }

  return v13;
}

- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 resultSetHandlerBlock:(id)a4
{
  return [(TIAccumulatingCandidateHandler *)self initWithWrappedCandidateHandler:a3 handlerBlock:0 resultSetHandlerBlock:a4];
}

- (TIAccumulatingCandidateHandler)initWithResultSetHandlerBlock:(id)a3
{
  return [(TIAccumulatingCandidateHandler *)self initWithWrappedCandidateHandler:0 handlerBlock:0 resultSetHandlerBlock:a3];
}

- (TIAccumulatingCandidateHandler)initWithHandlerBlock:(id)a3
{
  return [(TIAccumulatingCandidateHandler *)self initWithWrappedCandidateHandler:0 handlerBlock:a3 resultSetHandlerBlock:0];
}

@end