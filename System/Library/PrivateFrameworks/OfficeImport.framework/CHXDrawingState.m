@interface CHXDrawingState
- (CHXDrawingState)initWithCHXState:(id)a3;
- (id)chxState;
@end

@implementation CHXDrawingState

- (CHXDrawingState)initWithCHXState:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(OAXClient);
  v10.receiver = self;
  v10.super_class = (Class)CHXDrawingState;
  v7 = [(OAXDrawingState *)&v10 initWithClient:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->mCHXState, a3);
  }

  return v8;
}

- (id)chxState
{
  return self->mCHXState;
}

- (void).cxx_destruct
{
}

@end