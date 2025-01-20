@interface WBSTabOrderInsertionHint
- (WBSOrderedTab)tabToInsertAfter;
- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 insertionIndex:(unint64_t)a4 relation:(unint64_t)a5;
- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4;
- (unint64_t)insertionIndex;
- (unint64_t)relationType;
@end

@implementation WBSTabOrderInsertionHint

- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4
{
  return [(WBSTabOrderInsertionHint *)self initWithTabToInsertAfter:a3 insertionIndex:0x7FFFFFFFFFFFFFFFLL relation:a4];
}

- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 insertionIndex:(unint64_t)a4 relation:(unint64_t)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSTabOrderInsertionHint;
  v10 = [(WBSTabOrderInsertionHint *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tabToInsertAfter, a3);
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9) {
      unint64_t v12 = a4;
    }
    v11->_insertionIndex = v12;
    v11->_relationType = a5;
    v13 = v11;
  }

  return v11;
}

- (WBSOrderedTab)tabToInsertAfter
{
  return self->_tabToInsertAfter;
}

- (unint64_t)insertionIndex
{
  return self->_insertionIndex;
}

- (unint64_t)relationType
{
  return self->_relationType;
}

- (void).cxx_destruct
{
}

@end