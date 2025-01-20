@interface NEKEventChangeSet
- (BOOL)isDeferrable;
- (void)_enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5;
- (void)enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5;
@end

@implementation NEKEventChangeSet

- (void)enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5
{
}

- (void)_enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5
{
  char v6 = a3;
  id v8 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  if ((Class)objc_opt_class() == a4)
  {
    v10 = &stru_1000A97A0;
  }
  else if ((Class)objc_opt_class() == a4)
  {
    v10 = &stru_1000A97C0;
  }
  else if ((Class)objc_opt_class() == a4)
  {
    v10 = &stru_1000A97E0;
  }
  else
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = &stru_1000A9800;
    if (v9 != a4) {
      v10 = 0;
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003B334;
  v16[3] = &unk_1000A9828;
  v19 = v20;
  v17 = v10;
  id v11 = v8;
  id v18 = v11;
  v12 = objc_retainBlock(v16);
  if (v6)
  {
    v13 = [(NEKChangeSet *)self inserts];
    ((void (*)(void *, void *, uint64_t))v12[2])(v12, v13, 1);
  }
  if ((v6 & 2) != 0)
  {
    v14 = [(NEKChangeSet *)self updates];
    ((void (*)(void *, void *, uint64_t))v12[2])(v12, v14, 2);
  }
  if ((v6 & 4) != 0)
  {
    v15 = [(NEKChangeSet *)self deletes];
    ((void (*)(void *, void *, uint64_t))v12[2])(v12, v15, 4);
  }
  _Block_object_dispose(v20, 8);
}

- (BOOL)isDeferrable
{
  return 0;
}

@end