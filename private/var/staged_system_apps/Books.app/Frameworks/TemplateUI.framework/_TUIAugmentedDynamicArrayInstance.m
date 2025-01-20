@interface _TUIAugmentedDynamicArrayInstance
- (TUIDynamicArrayDataAugmenting)dataAugmenter;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
- (void)setDataAugmenter:(id)a3;
@end

@implementation _TUIAugmentedDynamicArrayInstance

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C8820;
  v9[3] = &unk_254F18;
  _NSRange v13 = a3;
  v10 = self;
  id v11 = a4;
  id v12 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)_TUIAugmentedDynamicArrayInstance;
  id v6 = v12;
  id v7 = v11;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v8, "fetchDataForRange:generation:block:", v13.location, v13.length, v7, v9);
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_C8944;
  v11[3] = &unk_254F40;
  id v12 = self;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v10.receiver = v12;
  v10.super_class = (Class)_TUIAugmentedDynamicArrayInstance;
  id v7 = v15;
  id v8 = v14;
  id v9 = v13;
  [(_TUIDynamicArrayInstance *)&v10 fetchDataForIndexes:v9 generation:v8 block:v11];
}

- (TUIDynamicArrayDataAugmenting)dataAugmenter
{
  return self->_dataAugmenter;
}

- (void)setDataAugmenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end