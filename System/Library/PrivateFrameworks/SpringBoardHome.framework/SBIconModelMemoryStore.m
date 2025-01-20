@interface SBIconModelMemoryStore
- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (NSDictionary)currentState;
- (NSDictionary)desiredState;
- (SBIconModelMemoryStore)init;
- (SBIconModelMemoryStore)initWithCurrentState:(id)a3 desiredState:(id)a4;
- (id)loadCurrentIconState:(id *)a3;
- (id)loadDesiredIconState:(id *)a3;
- (void)setCurrentState:(id)a3;
- (void)setDesiredState:(id)a3;
@end

@implementation SBIconModelMemoryStore

- (SBIconModelMemoryStore)initWithCurrentState:(id)a3 desiredState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBIconModelMemoryStore;
  v8 = [(SBIconModelMemoryStore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SBIconModelMemoryStore *)v8 setCurrentState:v6];
    [(SBIconModelMemoryStore *)v9 setDesiredState:v7];
  }

  return v9;
}

- (SBIconModelMemoryStore)init
{
  return [(SBIconModelMemoryStore *)self initWithCurrentState:0 desiredState:0];
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)loadCurrentIconState:(id *)a3
{
  v3 = (void *)[(NSDictionary *)self->_currentState copy];
  return v3;
}

- (id)loadDesiredIconState:(id *)a3
{
  v3 = (void *)[(NSDictionary *)self->_desiredState copy];
  return v3;
}

- (NSDictionary)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (NSDictionary)desiredState
{
  return self->_desiredState;
}

- (void)setDesiredState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end