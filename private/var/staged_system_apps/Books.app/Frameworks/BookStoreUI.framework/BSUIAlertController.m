@interface BSUIAlertController
+ (id)createActionModelsFrom:(id)a3;
+ (void)showActionSheet:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7;
+ (void)showAlert:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BSUIAlertController)init;
- (NSArray)actionModels;
- (NSMapTable)actionsToActionModelsTable;
- (UIAlertController)alertController;
- (id)createAlertControllerWith:(id)a3 alertStyle:(int64_t)a4 title:(id)a5 message:(id)a6 alignment:(int64_t)a7 tintColor:(id)a8 metricsData:(id)a9;
- (void)_recordAlertMetrics:(id)a3 actionType:(id)a4 title:(id)a5 message:(id)a6 alertStyle:(int64_t)a7 actionTargetId:(id)a8 returnValue:(id)a9;
- (void)dealloc;
- (void)dismiss;
- (void)presentAlertWithStyle:(int64_t)a3 title:(id)a4 message:(id)a5 actions:(id)a6 metricsData:(id)a7 useSortStyle:(BOOL)a8 options:(id)a9;
- (void)setActionModels:(id)a3;
- (void)setActionsToActionModelsTable:(id)a3;
- (void)setAlertController:(id)a3;
@end

@implementation BSUIAlertController

- (BSUIAlertController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIAlertController;
  v2 = [(BSUIAlertController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable mapTableWithKeyOptions:5 valueOptions:5];
    actionsToActionModelsTable = v2->_actionsToActionModelsTable;
    v2->_actionsToActionModelsTable = (NSMapTable *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(BSUIAlertController *)self dismiss];
  v3.receiver = self;
  v3.super_class = (Class)BSUIAlertController;
  [(BSUIAlertController *)&v3 dealloc];
}

+ (void)showActionSheet:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v16 = BUDynamicCast();

  v17 = objc_opt_new();
  [v17 presentAlertWithStyle:0 title:v18 message:v16 actions:v13 metricsData:v12 useSortStyle:0 options:v11];
}

+ (void)showAlert:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v16 = BUDynamicCast();

  v17 = objc_opt_new();
  [v17 presentAlertWithStyle:1 title:v18 message:v16 actions:v13 metricsData:v12 useSortStyle:0 options:v11];
}

+ (id)createActionModelsFrom:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueAtIndex:0];
  v5 = +[NSMutableArray array];
  if ([v4 isObject])
  {
    uint64_t v6 = 1;
    do
    {
      v7 = [[_JSAAlertActionModel alloc] initWithAction:v4];
      [v5 addObject:v7];
      v8 = [v3 valueAtIndex:v6];

      ++v6;
      v4 = v8;
    }
    while (([v8 isObject] & 1) != 0);
  }
  else
  {
    v8 = v4;
  }

  return v5;
}

- (void)_recordAlertMetrics:(id)a3 actionType:(id)a4 title:(id)a5 message:(id)a6 alertStyle:(int64_t)a7 actionTargetId:(id)a8 returnValue:(id)a9
{
  id v45 = a3;
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v14 = a8;
  id v15 = a9;
  v16 = +[NSDate date];
  [v16 timeIntervalSince1970];
  double v18 = v17;

  double v19 = v18 * 1000.0;
  id v20 = JSARecordResultUnknown;
  v40 = v15;
  if ([v15 isBoolean])
  {
    unsigned int v21 = [v15 toBool];
    v22 = (id *)&JSARecordResultSuccess;
    if (!v21) {
      v22 = (id *)&JSARecordResultFailure;
    }
    id v23 = *v22;

    id v20 = v23;
  }
  v52[0] = JSARecordKeyUserActionTargetId;
  v52[1] = JSARecordKeyUserActionResult;
  v41 = v14;
  v53[0] = v14;
  v53[1] = v20;
  v52[2] = JSARecordKeyUserActionResponseTime;
  v24 = +[NSNumber numberWithDouble:v19];
  v53[2] = v24;
  v38 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];

  v25 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v26 = [(BSUIAlertController *)self actionModels];
  id v27 = [v26 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v32 = [v31 option];
        [v25 appendString:v32];

        v33 = [(BSUIAlertController *)self actionModels];
        v34 = [v33 lastObject];

        if (v31 != v34) {
          [v25 appendString:@" "];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v28);
  }

  if (v45) {
    id v35 = [v45 mutableCopy];
  }
  else {
    id v35 = &__NSDictionary0__struct;
  }
  [v35 setObject:v44 forKeyedSubscript:JSARecordKeyActionType];
  v36 = &JSARecordDialogTypeAlert;
  if (a7 != 1) {
    v36 = &JSARecordDialogTypeActionSheet;
  }
  [v35 setObject:*v36 forKeyedSubscript:JSARecordKeyDialogType];
  [v35 setObject:v43 forKeyedSubscript:JSARecordKeyTitle];
  [v35 setObject:v42 forKeyedSubscript:JSARecordKeyMessage];
  [v35 setObject:v25 forKeyedSubscript:JSARecordKeyOptions];
  [v35 setObject:v20 forKeyedSubscript:JSARecordKeyResult];
  [v35 setObject:v41 forKeyedSubscript:JSARecordKeyTargetId];
  v50 = v38;
  v37 = +[NSArray arrayWithObjects:&v50 count:1];
  [v35 setObject:v37 forKeyedSubscript:JSARecordKeyUserActions];

  [v35 setObject:JSARecordEventTypeDialog forKeyedSubscript:JSARecordKeyEventType];
  +[JSAApplication recordNativeEvent:v35];
}

- (id)createAlertControllerWith:(id)a3 alertStyle:(int64_t)a4 title:(id)a5 message:(id)a6 alignment:(int64_t)a7 tintColor:(id)a8 metricsData:(id)a9
{
  id v35 = a3;
  id v13 = a5;
  id v14 = a6;
  id v37 = a8;
  id v41 = a9;
  id v42 = v14;
  id v43 = v13;
  v40 = (void *)a4;
  id val = +[UIAlertController alertControllerWithTitle:v13 message:v14 preferredStyle:a4];
  if (v37)
  {
    id v15 = [val view];
    [v15 setTintColor:v37];
  }
  v16 = +[BSUIAlertController createActionModelsFrom:](BSUIAlertController, "createActionModelsFrom:", v35, v35);
  [(BSUIAlertController *)self setActionModels:v16];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v17 = [(BSUIAlertController *)self actionModels];
  id v18 = [v17 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v65;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v65 != v19) {
          objc_enumerationMutation(v17);
        }
        if ([*(id *)(*((void *)&v64 + 1) + 8 * i) type] == (char *)&dword_0 + 1)
        {
          char v38 = 0;
          goto LABEL_13;
        }
      }
      id v18 = [v17 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  char v38 = 1;
LABEL_13:

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = [(BSUIAlertController *)self actionModels];
  id v47 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v61;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v61 != v45) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        if ([v22 type] == (char *)&dword_0 + 1)
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_26178;
          v59[3] = &unk_38ED40;
          v59[4] = v22;
          v59[5] = self;
          [val addTextFieldWithConfigurationHandler:v59];
        }
        else
        {
          id v23 = [v22 actionType];
          v24 = [v22 title];
          v25 = [v22 callback];
          id v26 = [v22 selected];
          id v27 = (char *)[v22 style];
          objc_initWeak(&location, val);
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_261EC;
          v49[3] = &unk_38ED68;
          id v28 = v25;
          id v50 = v28;
          objc_copyWeak(v57, &location);
          v51 = self;
          id v52 = v41;
          id v29 = v23;
          id v53 = v29;
          id v54 = v43;
          id v30 = v42;
          v57[1] = v40;
          id v55 = v30;
          v56 = v22;
          v31 = +[UIAlertAction actionWithTitle:v24 style:v27 handler:v49];
          v32 = [(BSUIAlertController *)self actionsToActionModelsTable];
          [v32 setObject:v22 forKey:v31];

          if (([v22 allowsEmpty] & 1) == 0)
          {
            char v33 = [v22 style] == (char *)&dword_0 + 1 ? 1 : v38;
            if ((v33 & 1) == 0) {
              [v31 setEnabled:0];
            }
          }
          if (v27 != (unsigned char *)&dword_0 + 1)
          {
            [v31 _setTitleTextAlignment:a7];
            [v31 _setChecked:v26];
          }
          [val addAction:v31];

          objc_destroyWeak(v57);
          objc_destroyWeak(&location);
        }
      }
      id v47 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v47);
  }

  return val;
}

- (void)presentAlertWithStyle:(int64_t)a3 title:(id)a4 message:(id)a5 actions:(id)a6 metricsData:(id)a7 useSortStyle:(BOOL)a8 options:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_265BC;
  v28[3] = &unk_38ED90;
  BOOL v35 = a8;
  v28[4] = self;
  id v20 = v17;
  id v29 = v20;
  int64_t v34 = a3;
  id v21 = v15;
  id v30 = v21;
  id v22 = v16;
  id v31 = v22;
  id v23 = v18;
  id v32 = v23;
  id v24 = v19;
  id v33 = v24;
  v25 = objc_retainBlock(v28);
  if (v25)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v25[2])(v25);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_266E4;
      block[3] = &unk_38E0B8;
      id v27 = v25;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)dismiss
{
  id v3 = [(BSUIAlertController *)self alertController];
  [v3 dismissViewControllerAnimated:0 completion:0];

  [(BSUIAlertController *)self setAlertController:0];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v34 = a5;
  [(BSUIAlertController *)self alertController];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v33 = long long v42 = 0u;
  v10 = [v33 textFields];
  id v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      id v14 = 0;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v39 + 1) + 8 * (void)v14);
        if (v15 == v9)
        {
          id v18 = [v9 text];
          id v19 = [v18 stringByReplacingCharactersInRange:location length:length withString:v34];

          id v20 = [v19 length];
          if (!v20)
          {
LABEL_13:
            int v21 = 1;
            goto LABEL_14;
          }
        }
        else
        {
          id v16 = [v15 text];
          id v17 = [v16 length];

          if (!v17) {
            goto LABEL_13;
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  int v21 = 0;
LABEL_14:

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = [v33 actions];
  id v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v26);
        id v28 = [(BSUIAlertController *)self actionsToActionModelsTable];
        id v29 = [v28 objectForKey:v27];

        BOOL v30 = !v21
           || ([v29 allowsEmpty] & 1) != 0
           || [v29 style] == (char *)&dword_0 + 1;
        [v27 setEnabled:v30];

        id v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v31 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      id v24 = v31;
    }
    while (v31);
  }

  return 1;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (NSMapTable)actionsToActionModelsTable
{
  return self->_actionsToActionModelsTable;
}

- (void)setActionsToActionModelsTable:(id)a3
{
}

- (NSArray)actionModels
{
  return self->_actionModels;
}

- (void)setActionModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionModels, 0);
  objc_storeStrong((id *)&self->_actionsToActionModelsTable, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end