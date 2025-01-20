@interface _PXSelectionCoordinatorState
- (PXSelectionSnapshot)selectionSnapshot;
- (_PXSelectionCoordinatorState)initWithSelectionSnapshot:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
@end

@implementation _PXSelectionCoordinatorState

- (void).cxx_destruct
{
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (_PXSelectionCoordinatorState)initWithSelectionSnapshot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXSelectionCoordinatorState;
  v6 = [(_PXSelectionCoordinatorState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_selectionSnapshot, a3);
  }

  return v7;
}

@end