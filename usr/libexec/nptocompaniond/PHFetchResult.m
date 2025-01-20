@interface PHFetchResult
- (id)npto_objectForLocalIdentifier:(id)a3;
@end

@implementation PHFetchResult

- (id)npto_objectForLocalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_getAssociatedObject(v5, &unk_1000A4ED0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[NSMapTable strongToStrongObjectsMapTable];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006306C;
    v11[3] = &unk_100093818;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v6;
    [(PHFetchResult *)v5 enumerateObjectsUsingBlock:v11];
    objc_setAssociatedObject(v5, &unk_1000A4ED0, v6, (void *)1);
  }
  objc_sync_exit(v5);

  v7 = [v6 objectForKey:v4];
  v8 = v7;
  if (v7)
  {
    v9 = -[PHFetchResult objectAtIndex:](v5, "objectAtIndex:", [v7 unsignedIntegerValue]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end