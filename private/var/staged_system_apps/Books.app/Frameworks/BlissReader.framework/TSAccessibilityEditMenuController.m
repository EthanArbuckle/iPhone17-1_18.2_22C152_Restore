@interface TSAccessibilityEditMenuController
+ (id)sharedController;
- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4;
- (id)editMenuTitlesForItemProvider:(id)a3;
@end

@implementation TSAccessibilityEditMenuController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2690BC;
  block[3] = &unk_456DE0;
  block[4] = a1;
  if (qword_5738E0 != -1) {
    dispatch_once(&qword_5738E0, block);
  }
  return (id)qword_5738D8;
}

- (id)editMenuTitlesForItemProvider:(id)a3
{
  id v3 = [a3 tsaxEditMenuItems];
  if ([v3 count])
  {
    id v4 = +[NSMutableSet set];
    char v21 = 0;
    v5 = objc_opt_class();
    Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[+[UIApplication sharedApplication] keyWindow], 1, &v21);
    if (v21) {
LABEL_17:
    }
      abort();
    id v7 = [(objc_class *)v6 tsaxFirstResponder];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v3);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          char v21 = 0;
          v13 = (objc_class *)objc_opt_class();
          v14 = (void *)__TSAccessibilityCastAsClass(v13, v12, 1, &v21);
          if (v21) {
            goto LABEL_17;
          }
          v15 = v14;
          if (v14 && objc_msgSend(v7, "targetForAction:withSender:", objc_msgSend(v14, "action"), 0)) {
            [v4 addObject:[v15 title]];
          }
        }
        id v9 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v4 = 0;
  }
  return [v4 allObjects];
}

- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4
{
  id v5 = [a4 tsaxEditMenuItems];
  id v6 = [v5 count];
  if (v6)
  {
    char v23 = 0;
    id v7 = objc_opt_class();
    Class v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)[+[UIApplication sharedApplication] keyWindow], 1, &v23);
    if (v23) {
LABEL_16:
    }
      abort();
    id v9 = [(objc_class *)v8 tsaxFirstResponder];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      id v10 = v6;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
          char v23 = 0;
          v14 = (objc_class *)objc_opt_class();
          v15 = (void *)__TSAccessibilityCastAsClass(v14, v13, 1, &v23);
          if (v23) {
            goto LABEL_16;
          }
          v16 = v15;
          if (objc_msgSend(objc_msgSend(v15, "title"), "isEqualToString:", a3))
          {
            id v17 = [v16 action];
            if ([v9 targetForAction:v17 withSender:0])
            {
              [v9 performSelector:v17 withObject:0];
              LOBYTE(v6) = 1;
              return (char)v6;
            }
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        id v10 = v6;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return (char)v6;
}

@end