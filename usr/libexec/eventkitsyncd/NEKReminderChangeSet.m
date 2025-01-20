@interface NEKReminderChangeSet
- (void)_enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5;
- (void)enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5;
@end

@implementation NEKReminderChangeSet

- (void)enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5
{
}

- (void)_enumerateForChangeType:(int)a3 forEntitiesOfClass:(Class)a4 withBlock:(id)a5
{
  char v5 = a3;
  id v7 = a5;
  if (objc_opt_respondsToSelector())
  {
    v8 = self;
    v9 = [v8 cdEntityName];

    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10003AF08;
    v18 = &unk_1000A9760;
    id v19 = v9;
    id v20 = v7;
    id v10 = v9;
    v11 = objc_retainBlock(&v15);
    if (v5)
    {
      v13 = [(NEKChangeSet *)self inserts];
      ((void (*)(void ***, void *, uint64_t))v11[2])(v11, v13, 1);

      if ((v5 & 2) == 0)
      {
LABEL_4:
        if ((v5 & 4) == 0)
        {
LABEL_6:

          goto LABEL_7;
        }
LABEL_5:
        v12 = [(NEKChangeSet *)self deletes];
        ((void (*)(void ***, void *, uint64_t))v11[2])(v11, v12, 4);

        goto LABEL_6;
      }
    }
    else if ((v5 & 2) == 0)
    {
      goto LABEL_4;
    }
    v14 = [(NEKChangeSet *)self updates];
    ((void (*)(void ***, void *, uint64_t))v11[2])(v11, v14, 2);

    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_7:
}

@end