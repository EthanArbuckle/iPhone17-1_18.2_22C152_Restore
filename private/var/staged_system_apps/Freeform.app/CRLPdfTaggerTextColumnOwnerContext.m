@interface CRLPdfTaggerTextColumnOwnerContext
- (CRLPdfTaggerTextColumnOwnerContext)initWithStateOfTagger:(id)a3 columns:(id)a4 storage:(id)a5 limitSelection:(id)a6;
- (CRLWPSelection)limitSelection;
- (NSArray)columns;
- (_TtC8Freeform12CRLWPStorage)storage;
@end

@implementation CRLPdfTaggerTextColumnOwnerContext

- (CRLPdfTaggerTextColumnOwnerContext)initWithStateOfTagger:(id)a3 columns:(id)a4 storage:(id)a5 limitSelection:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRLPdfTaggerTextColumnOwnerContext;
  v14 = [(CRLPdfTaggerContext *)&v17 initWithStateOfTagger:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_columns, a4);
    objc_storeWeak((id *)&v15->_storage, v12);
    objc_storeWeak((id *)&v15->_limitSelection, v13);
  }

  return v15;
}

- (NSArray)columns
{
  return self->_columns;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  return (_TtC8Freeform12CRLWPStorage *)WeakRetained;
}

- (CRLWPSelection)limitSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_limitSelection);

  return (CRLWPSelection *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitSelection);
  objc_destroyWeak((id *)&self->_storage);

  objc_storeStrong((id *)&self->_columns, 0);
}

@end