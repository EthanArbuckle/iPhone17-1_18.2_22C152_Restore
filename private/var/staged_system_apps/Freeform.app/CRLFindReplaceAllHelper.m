@interface CRLFindReplaceAllHelper
- (CRLFindReplaceAllHelper)initWithEditingCoordinator:(id)a3 findString:(id)a4 replaceString:(id)a5 options:(unint64_t)a6;
- (NSString)findString;
- (NSString)replaceString;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (unint64_t)countOfItemsReplaced;
- (unint64_t)options;
- (void)appendReplacementCount:(unint64_t)a3;
- (void)enqueueReplaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4;
- (void)replaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4;
@end

@implementation CRLFindReplaceAllHelper

- (CRLFindReplaceAllHelper)initWithEditingCoordinator:(id)a3 findString:(id)a4 replaceString:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRLFindReplaceAllHelper;
  v13 = [(CRLFindReplaceAllHelper *)&v19 init];
  if (v13)
  {
    v14 = (NSString *)[v11 copy];
    findString = v13->_findString;
    v13->_findString = v14;

    v16 = (NSString *)[v12 copy];
    replaceString = v13->_replaceString;
    v13->_replaceString = v16;

    v13->_options = a6;
    objc_storeWeak((id *)&v13->_editingCoordinator, v10);
  }

  return v13;
}

- (void)replaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4
{
}

- (void)enqueueReplaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    id v19 = v6;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v14 = [v13 commandForReplaceAllWithProvider:self];
          if (v14)
          {
            if (!v10) {
              id v10 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
            }
            [(CRLCommandGroup *)v10 addCommand:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
    id v6 = v19;
    if (v10)
    {
      v15 = +[NSBundle mainBundle];
      v16 = [v15 localizedStringForKey:@"Replace All" value:0 table:@"UndoStrings"];
      [(CRLCommandGroup *)v10 setActionString:v16];

      v17 = [(CRLFindReplaceAllHelper *)self editingCoordinator];
      v18 = [v17 commandController];
      [v18 enqueueCommand:v10 withSelectionBehavior:v19];
    }
  }
}

- (void)appendReplacementCount:(unint64_t)a3
{
  self->_countOfItemsReplaced += a3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingCoordinator);

  return (_TtC8Freeform21CRLEditingCoordinator *)WeakRetained;
}

- (NSString)findString
{
  return self->_findString;
}

- (NSString)replaceString
{
  return self->_replaceString;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)countOfItemsReplaced
{
  return self->_countOfItemsReplaced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceString, 0);
  objc_storeStrong((id *)&self->_findString, 0);

  objc_destroyWeak((id *)&self->_editingCoordinator);
}

@end