@interface CSHSMObjc
- (BOOL)isIn:(id)a3;
- (CSHSMObjc)initWithCategory:(id)a3 state:(id)a4;
- (OS_os_log)category;
- (id)state;
- (void)setState:(id)a3;
- (void)signal:(unint64_t)a3 data:(const void *)a4;
@end

@implementation CSHSMObjc

- (BOOL)isIn:(id)a3
{
  id v4 = a3;
  id v5 = objc_retainBlock(self->_state);
  if (v5)
  {
    while (v5 != v4)
    {
      uint64_t v6 = (*((void (**)(id, uint64_t, void, void))v5 + 2))(v5, 2, 0, 0);

      id v5 = (id)v6;
      if (!v6) {
        goto LABEL_6;
      }
    }

    LOBYTE(v5) = 1;
  }
LABEL_6:

  return (char)v5;
}

- (CSHSMObjc)initWithCategory:(id)a3 state:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSHSMObjc;
  v9 = [(CSHSMObjc *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    id v11 = objc_retainBlock(v8);
    if (v11)
    {
      do
      {
        id v12 = objc_retainBlock(v11);
        id state = v10->_state;
        v10->_id state = v12;

        v14 = v10->_category;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (*((void (**)(void))v10->_state + 2))();
          *(_DWORD *)buf = 138412290;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "initial, enter(%@)", buf, 0xCu);
        }
        id v16 = (id)(*((uint64_t (**)(void))v10->_state + 2))();
        uint64_t v17 = (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);

        id v11 = (id)v17;
      }
      while (v17);
    }
  }

  return v10;
}

- (void)signal:(unint64_t)a3 data:(const void *)a4
{
  id v7 = objc_retainBlock(self->_state);
  if (v7)
  {
    while (1)
    {
      v43 = (void (**)(void, void, void, void))v7;
      uint64_t v8 = (*((void (**)(id, uint64_t, unint64_t, void))v7 + 2))(v7, 3, a3, 0);
      v9 = (void *)v8;
      if (v8) {
        break;
      }
      uint64_t v10 = v43[2](v43, 2, 0, 0);

      id v7 = (id)v10;
      if (!v10) {
        return;
      }
    }
    id v11 = v43;
    if ((void (**)(void, void, void, void))v8 == v43)
    {
      id v40 = (id)((uint64_t (*)(void, uint64_t, unint64_t, const void *))v43[2])(v43, 5, a3, a4);
    }
    else
    {
      id v41 = (id)v8;
      id v12 = +[NSMutableArray array];
      v42 = +[NSMutableArray array];
      id v13 = objc_retainBlock(self->_state);
      if (v13)
      {
        v14 = (void (**)(void, void, void, void))v13;
        do
        {
          id v15 = objc_retainBlock(v14);
          [v12 addObject:v15];

          uint64_t v16 = v14[2](v14, 2, 0, 0);

          v14 = (void (**)(void, void, void, void))v16;
        }
        while (v16);
      }
      id v17 = objc_retainBlock(v9);
      if (v17)
      {
        v18 = (void (**)(void, void, void, void))v17;
        do
        {
          id v19 = objc_retainBlock(v18);
          [v42 addObject:v19];

          uint64_t v20 = v18[2](v18, 2, 0, 0);

          v18 = (void (**)(void, void, void, void))v20;
        }
        while (v20);
      }
      while (1)
      {
        v24 = [v12 lastObject];
        if (!v24) {
          break;
        }
        v21 = [v42 lastObject];

        if (!v21) {
          break;
        }
        v22 = [v12 lastObject];
        v23 = [v42 lastObject];

        if (v22 != v23) {
          break;
        }
        [v12 removeLastObject];
        [v42 removeLastObject];
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v12;
      id v25 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v46;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v29 = self->_category;
            if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_INFO))
            {
              v30 = (*(void (**)(uint64_t, uint64_t, void, void))(v28 + 16))(v28, 1, 0, 0);
              *(_DWORD *)buf = 134218242;
              unint64_t v50 = a3;
              __int16 v51 = 2112;
              v52 = v30;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_INFO, "event %llu, exit(%@)", buf, 0x16u);
            }
            id v31 = (id)(*(uint64_t (**)(uint64_t, uint64_t, unint64_t, const void *))(v28 + 16))(v28, 6, a3, a4);
          }
          id v25 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v25);
      }

      id v32 = (id)((uint64_t (*)(void, uint64_t, unint64_t, const void *))v43[2])(v43, 5, a3, a4);
      v33 = [v42 reverseObjectEnumerator];
      while (1)
      {
        v34 = [v33 nextObject];
        if (!v34) {
          break;
        }
        v35 = self->_category;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_INFO))
        {
          v36 = v34[2](v34, 1, 0, 0);
          *(_DWORD *)buf = 134218242;
          unint64_t v50 = a3;
          __int16 v51 = 2112;
          v52 = v36;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_INFO, "event %llu, enter(%@)", buf, 0x16u);
        }
        id v37 = (id)((uint64_t (*)(void, uint64_t, unint64_t, const void *))v34[2])(v34, 4, a3, a4);
      }
      id v38 = objc_retainBlock(v41);
      id state = self->_state;
      self->_id state = v38;

      id v11 = v41;
    }
  }
}

- (id)state
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setState:(id)a3
{
}

- (OS_os_log)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong(&self->_state, 0);
}

@end