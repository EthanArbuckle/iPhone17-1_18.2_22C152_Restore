@interface _TUIMappedDynamicArrayInstance
- (TUIDynamicArrayDataMapping)dataMapper;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
- (void)setDataMapper:(id)a3;
@end

@implementation _TUIMappedDynamicArrayInstance

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_72D20;
  v10[3] = &unk_252650;
  v11 = self;
  id v12 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)_TUIMappedDynamicArrayInstance;
  id v8 = v12;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v9, "fetchDataForRange:generation:block:", location, length, a4, v10);
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_72E50;
  v9[3] = &unk_252650;
  v10 = self;
  id v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)_TUIMappedDynamicArrayInstance;
  id v7 = v11;
  [(_TUIDynamicArrayInstance *)&v8 fetchDataForIndexes:a3 generation:a4 block:v9];
}

- (TUIDynamicArrayDataMapping)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end