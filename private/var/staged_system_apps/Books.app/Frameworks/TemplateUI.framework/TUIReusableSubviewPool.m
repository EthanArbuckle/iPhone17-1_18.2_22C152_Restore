@interface TUIReusableSubviewPool
- (TUIReusableSubviewPool)initWithRegistry:(id)a3;
- (id)dequeueReusableSubviewWithReuseIdentifier:(id)a3 host:(id)a4;
- (void)clearPool;
- (void)prepareToReuseHost:(id)a3;
- (void)reuseSubviews:(id)a3 host:(id)a4;
@end

@implementation TUIReusableSubviewPool

- (TUIReusableSubviewPool)initWithRegistry:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIReusableSubviewPool;
  v6 = [(TUIReusableSubviewPool *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    uint64_t v8 = objc_opt_new();
    subviewsAvailableByIdentifier = v7->_subviewsAvailableByIdentifier;
    v7->_subviewsAvailableByIdentifier = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)dequeueReusableSubviewWithReuseIdentifier:(id)a3 host:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = [(NSMutableDictionary *)self->_subviewsAvailableByIdentifier objectForKeyedSubscript:v7];
    v10 = [v8 tui_hostingView];
    objc_super v11 = v10;
    if (v10) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    int v13 = !v12;
    if (v12
      || (v22[0] = _NSConcreteStackBlock,
          v22[1] = 3221225472,
          v22[2] = sub_DD264,
          v22[3] = &unk_255288,
          v4 = &v23,
          id v23 = v10,
          id v14 = [v9 indexOfObjectPassingTest:v22],
          v14 == (id)0x7FFFFFFFFFFFFFFFLL))
    {
      if ([v9 count])
      {
        v15 = [v9 lastObject];
        [v9 removeLastObject];
        if (v15)
        {
LABEL_12:
          if ([v8 isDescendantOfView:v15]) {
            [v8 removeFromSuperview];
          }
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_DD2A4;
          v20[3] = &unk_251990;
          id v16 = v15;
          id v21 = v16;
          +[UIView performWithoutAnimation:v20];

          if (!v13) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
      id v18 = v14;
      v15 = [v9 objectAtIndexedSubscript:v14];
      [v9 removeObjectAtIndex:v18];
      if (v15) {
        goto LABEL_12;
      }
    }
    id v16 = [(TUIViewRegistry *)self->_registry newSubviewWithReuseIdentifier:v7];
    if (!v13)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
  v17 = TUIDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_192450(v17);
  }

  if (_TUIDeviceHasInternalInstall()) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:@"Nil reuseIdentifier" reason:@"Requested a view with nil reuseIdentifier" userInfo:0]);
  }
  id v16 = 0;
LABEL_24:

  return v16;
}

- (void)prepareToReuseHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tui_hostedSubviewsMap];
  v6 = [v5 allValues];
  id v7 = [v6 copy];

  [v4 setTui_hostedSubviewsMap:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_DD3DC;
  v9[3] = &unk_251990;
  id v10 = v7;
  id v8 = v7;
  +[UIView performWithoutAnimation:v9];
  [(TUIReusableSubviewPool *)self reuseSubviews:v8 host:v4];
}

- (void)reuseSubviews:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v19 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v13 = [v12 reuseIdentifier:v19];
        if (v13)
        {
          [v12 setHidden:1];
          id v14 = [(NSMutableDictionary *)self->_subviewsAvailableByIdentifier objectForKeyedSubscript:v13];
          if (!v14)
          {
            id v14 = objc_opt_new();
            [(NSMutableDictionary *)self->_subviewsAvailableByIdentifier setObject:v14 forKeyedSubscript:v13];
          }
          if ([v14 indexOfObjectIdenticalTo:v12] == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v14 addObject:v12];
          }
        }
        else
        {
          v15 = TUIDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_192494(v26, (uint64_t)v12, &v27, v15);
          }

          if (_TUIDeviceHasInternalInstall())
          {
            id v16 = objc_alloc((Class)NSException);
            CFStringRef v24 = @"view";
            v25 = v12;
            v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            id v18 = [v16 initWithName:@"Nil reuseIdentifier" reason:@"A reusable view should have a non-nil reuseIdentifier" userInfo:v17];

            objc_exception_throw(v18);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)clearPool
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(NSMutableDictionary *)self->_subviewsAvailableByIdentifier allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_subviewsAvailableByIdentifier, "objectForKeyedSubscript:", v8, 0);
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            int v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) removeFromSuperview];
              int v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_subviewsAvailableByIdentifier removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsAvailableByIdentifier, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

@end