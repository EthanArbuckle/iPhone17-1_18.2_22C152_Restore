@interface CRLAccessibilityEditMenuController
+ (id)sharedController;
- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4;
- (id)editMenuTitlesForItemProvider:(id)a3;
@end

@implementation CRLAccessibilityEditMenuController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302C10;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9668 != -1) {
    dispatch_once(&qword_1016A9668, block);
  }
  v2 = (void *)qword_1016A9660;

  return v2;
}

- (id)editMenuTitlesForItemProvider:(id)a3
{
  id v3 = a3;
  v4 = [v3 crlaxEditMenuItems];
  if ([v4 count])
  {
    v5 = +[NSMutableSet set];
    char v25 = 0;
    v6 = [v3 crlaxWindow];
    v7 = objc_opt_class();
    uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v25);
    if (v25) {
      abort();
    }
    v9 = (void *)v8;

    v20 = v9;
    v10 = [v9 crlaxFirstResponder];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v4;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v10 targetForAction:[v3 crlaxSelectorForEditMenuItemName:v16] withSender:0];

          if (v17) {
            [v5 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v5 = 0;
  }
  v18 = [v5 allObjects];

  return v18;
}

- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 crlaxEditMenuItems];
  if ([v7 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v30 = v7;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v8)
    {
      id v9 = v8;
      char v31 = 0;
      uint64_t v10 = *(void *)v45;
      id v33 = v6;
      id v34 = v5;
      uint64_t v32 = *(void *)v45;
      do
      {
        id v11 = 0;
        id v35 = v9;
        do
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v11);
          if (objc_msgSend(v12, "isEqualToString:", v5, v30))
          {
            id v13 = [v6 crlaxSelectorForEditMenuItemName:v12];
            char v43 = 0;
            id v14 = v6;
            v15 = (objc_class *)objc_opt_class();
            uint64_t v16 = __CRLAccessibilityCastAsClass(v15, (uint64_t)v14, 1, &v43);
            if (v43) {
              abort();
            }
            v17 = (void *)v16;

            if (v17)
            {
              v18 = [v17 valueForKey:@"interactiveCanvasController"];
              v19 = v18;
              if (v18)
              {
                v20 = [v18 editorController];
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                v37 = v20;
                long long v21 = [v20 currentEditors];
                id v22 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
                if (v22)
                {
                  id v23 = v22;
                  v36 = v19;
                  uint64_t v24 = *(void *)v40;
                  while (2)
                  {
                    for (i = 0; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v40 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                      if ([v26 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasEditor])
                      {
                        v27 = [v26 valueForKey:@"canvasEditorHelper"];
                        if (v27
                          && (objc_opt_respondsToSelector() & 1) != 0
                          && [v27 canPerformEditorAction:v13 withSender:0])
                        {
                          [v26 performSelector:v13 withObject:0];

                          char v31 = 1;
                          goto LABEL_25;
                        }
                      }
                    }
                    id v23 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }
LABEL_25:
                  id v6 = v33;
                  id v5 = v34;
                  uint64_t v10 = v32;
                  v19 = v36;
                }

                id v9 = v35;
              }
            }
          }
          id v11 = (char *)v11 + 1;
        }
        while (v11 != v9);
        id v9 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v9);
    }
    else
    {
      char v31 = 0;
    }

    BOOL v28 = v31 & 1;
    v7 = v30;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

@end