@interface PersonalizedItemAutocompleteFilter
- (BOOL)hasItemsWhenSearchStringIsEmpty;
- (BOOL)itemIsAllowed:(id)a3;
- (NSString)searchString;
- (PersonalizedItemAutocompleteFilter)init;
- (PersonalizedItemManager)inputItems;
- (id)allItems;
- (void)_invalidateResults;
- (void)dealloc;
- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5;
- (void)setHasItemsWhenSearchStringIsEmpty:(BOOL)a3;
- (void)setInputItems:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation PersonalizedItemAutocompleteFilter

- (PersonalizedItemAutocompleteFilter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PersonalizedItemAutocompleteFilter;
  v2 = [(PersonalizedItemAutocompleteFilter *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("PersonalizedItemAutocompleteFilter", v3);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  inputItems = self->_inputItems;
  if (inputItems) {
    [(PersonalizedItemManager *)inputItems removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PersonalizedItemAutocompleteFilter;
  [(PersonalizedItemAutocompleteFilter *)&v4 dealloc];
}

- (void)setSearchString:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_searchString != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchString, a3);
    [(PersonalizedItemAutocompleteFilter *)self _invalidateResults];
    v5 = v6;
  }
}

- (void)setInputItems:(id)a3
{
  v5 = (PersonalizedItemManager *)a3;
  p_inputItems = &self->_inputItems;
  inputItems = self->_inputItems;
  if (inputItems != v5)
  {
    if (inputItems) {
      [(PersonalizedItemManager *)inputItems removeObserver:self];
    }
    objc_storeStrong((id *)&self->_inputItems, a3);
    if (*p_inputItems) {
      [(PersonalizedItemManager *)*p_inputItems addObserver:self];
    }
    lock = self->_lock;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_100AD52D8;
    v12 = &unk_1012E5D58;
    v13 = self;
    v14 = v5;
    dispatch_async(lock, &v9);
    [(PersonalizedItemAutocompleteFilter *)self _invalidateResults];
  }
}

- (void)setHasItemsWhenSearchStringIsEmpty:(BOOL)a3
{
  if (self->_hasItemsWhenSearchStringIsEmpty != a3)
  {
    self->_hasItemsWhenSearchStringIsEmpty = a3;
    [(PersonalizedItemAutocompleteFilter *)self _invalidateResults];
  }
}

- (void)_invalidateResults
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AD53C4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(lock, block);
}

- (id)allItems
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100104330;
  v14 = sub_100104A08;
  id v15 = 0;
  v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "PersonalizedItemAutocompleteFilter - collecting results", buf, 2u);
  }

  lock = self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AD55F8;
  v9[3] = &unk_1012E67C0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(lock, v9);
  v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(id)v11[5] count];
    *(_DWORD *)buf = 134217984;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PersonalizedItemAutocompleteFilter - collected %lu results", buf, 0xCu);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)itemIsAllowed:(id)a3
{
  id v3 = a3;
  BOOL v4 = (+[AddressBookManager addressBookAllowed]
     || [v3 sourceType] != (id)4
     && [v3 sourceType] != (id)3
     && [v3 sourceType] != (id)6
     && [v3 sourceType] != (id)8
     && [v3 sourceType] != (id)13
     && [v3 sourceType] != (id)14
     && [v3 sourceType] != (id)31)
    && ([v3 sourceType] != (id)9 || [v3 sourceSubtype] != (id)36);

  return v4;
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  id v6 = a4;
  lock = self->_lock;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100AD5CB0;
  uint64_t v12 = &unk_1012E5D58;
  v13 = self;
  id v14 = v6;
  id v8 = v6;
  dispatch_async(lock, &v9);
  [(PersonalizedItemAutocompleteFilter *)self _invalidateResults];
}

- (PersonalizedItemManager)inputItems
{
  return self->_inputItems;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (BOOL)hasItemsWhenSearchStringIsEmpty
{
  return self->_hasItemsWhenSearchStringIsEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_inputItems, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_matchingItems, 0);

  objc_storeStrong((id *)&self->_personalizedItems, 0);
}

@end