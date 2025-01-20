@interface TUICellScrollPolicy
- (TUICellScrollPolicy)initWithCells:(const void *)a3;
- (const)cells;
- (id).cxx_construct;
- (id)newScrollableObserverInstanceWithView:(id)a3 host:(id)a4 uuid:(id)a5 uid:(id)a6;
@end

@implementation TUICellScrollPolicy

- (TUICellScrollPolicy)initWithCells:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUICellScrollPolicy;
  v4 = [(TUICellScrollPolicy *)&v8 init];
  p_cells = &v4->_cells;
  if (v4) {
    BOOL v6 = p_cells == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    sub_15D9BC((uint64_t)p_cells, *(void *)a3, *((void *)a3 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  }
  return v4;
}

- (id)newScrollableObserverInstanceWithView:(id)a3 host:(id)a4 uuid:(id)a5 uid:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [[_TUICellScrollObserver alloc] initWithPolicy:self view:v10 host:v11 uuid:v12 uid:v13];

  return v14;
}

- (const)cells
{
  return &self->_cells;
}

- (void).cxx_destruct
{
  p_cells = &self->_cells;
  sub_98550((void ***)&p_cells);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end