@interface TUISingleContentBoxBuilder
- (unint64_t)checkContents:(id)a3;
@end

@implementation TUISingleContentBoxBuilder

- (unint64_t)checkContents:(id)a3
{
  id v3 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_38FC4;
  v19[3] = &unk_251AE0;
  id v4 = (id)objc_opt_new();
  id v20 = v4;
  [v3 enumerateObjectsUsingBlock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    unint64_t v10 = 1021;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          BOOL v13 = [v12 role] == 0;
          if (v13 & v8) {
            goto LABEL_14;
          }
          v8 |= v13;
        }
        else
        {
          if (v8) {
            goto LABEL_14;
          }
          int v8 = 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  unint64_t v10 = 0;
LABEL_14:

  return v10;
}

@end