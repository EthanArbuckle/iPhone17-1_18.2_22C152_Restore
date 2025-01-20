@interface TUIElementActionTriggerHandler
+ (id)argumentsForView:(id)a3;
- (BOOL)hasActionForTrigger:(id)a3;
- (BOOL)invoke:(id)a3 arguments:(id)a4;
- (BOOL)invoke:(id)a3 view:(id)a4;
- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5;
- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5 arguments:(id)a6;
- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5;
- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 allowRefId:(BOOL)a6;
- (BOOL)isEqualToHandler:(id)a3;
- (NSString)refId;
- (TUIActionHandlerDelegate)actionDelegate;
- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 actionObject:(id)a4 actionDelegate:(id)a5;
- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 block:(id)a4;
- (TUIElementTriggerBehaviorMap)actionsData;
- (id)actionObject;
- (id)block;
- (id)keyCommands;
- (void)addKeyCommands:(id)a3;
- (void)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 completion:(id)a6;
- (void)setRefId:(id)a3;
@end

@implementation TUIElementActionTriggerHandler

- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 actionObject:(id)a4 actionDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIElementActionTriggerHandler;
  v12 = [(TUIElementActionTriggerHandler *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionsData, a3);
    objc_storeStrong(&v13->_actionObject, a4);
    objc_storeWeak((id *)&v13->_actionDelegate, v11);
  }

  return v13;
}

- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIElementActionTriggerHandler;
  id v9 = [(TUIElementActionTriggerHandler *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionsData, a3);
    id v11 = objc_retainBlock(v8);
    id block = v10->_block;
    v10->_id block = v11;
  }
  return v10;
}

- (BOOL)isEqualToHandler:(id)a3
{
  v4 = (TUIElementActionTriggerHandler *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    actionsData = self->_actionsData;
    id v7 = [(TUIElementActionTriggerHandler *)v4 actionsData];
    LODWORD(actionsData) = [(TUIElementTriggerBehaviorMap *)actionsData isEqual:v7];

    if (actionsData
      && (id actionObject = self->_actionObject,
          [(TUIElementActionTriggerHandler *)v5 actionObject],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          actionObject == v9))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      id v12 = [(TUIElementActionTriggerHandler *)v5 actionDelegate];
      char v10 = WeakRetained == v12;
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5 arguments:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = TUIActionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = v12;
    BOOL v15 = v7;
    v16 = [v11 layoutAttributes];
    [v16 renderModel];
    v38 = self;
    v18 = BOOL v17 = v7;
    v19 = [v18 identifier];
    [v19 tui_identifierToString];
    v21 = id v20 = v11;
    *(_DWORD *)buf = 138544386;
    id v40 = v10;
    __int16 v41 = 2114;
    id v42 = v20;
    __int16 v43 = 2048;
    BOOL v44 = v15;
    id v12 = v14;
    __int16 v45 = 2112;
    id v46 = v14;
    __int16 v47 = 2114;
    v48 = v21;
    _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_INFO, "invoke trigger='%{public}@ view=%{public}@ allowRefId=%lu arguments=%@ view.id=%{public}@", buf, 0x34u);

    id v11 = v20;
    BOOL v7 = v17;
    self = v38;
  }
  if (!self->_block)
  {
    v24 = [(TUIElementTriggerBehaviorMap *)self->_actionsData behaviorDataForTrigger:v10];
    v25 = [v24 behavior];
    if (v25)
    {
      v26 = [v24 arguments];
      v27 = [v26 dictionaryByAddingEntriesFromDictionary:v12];

      v28 = TUIActionLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [v24 behavior];
        *(_DWORD *)buf = 138543618;
        id v40 = v29;
        __int16 v41 = 2112;
        id v42 = v27;
        _os_log_impl(&def_141F14, v28, OS_LOG_TYPE_INFO, "invoke: trigger via behavior=%{public}@ arguments=%@", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      unsigned __int8 v23 = [WeakRetained handleActionForObject:self->_actionObject withName:v25 arguments:v27];
      goto LABEL_11;
    }
    unsigned __int8 v23 = 0;
    if (v24 || !v7) {
      goto LABEL_13;
    }
    v27 = [(TUIElementTriggerBehaviorMap *)self->_actionsData refIdForTrigger:v10];
    if (![v27 length])
    {
      unsigned __int8 v23 = 0;
      goto LABEL_12;
    }
    id WeakRetained = [v11 descendentViewWithRefId:v27];
    v32 = [WeakRetained layoutAttributes];
    v33 = [v32 renderModel];

    if (WeakRetained == v11)
    {
      id v34 = v12;
      v35 = v11;
      v37 = TUIActionLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        sub_192670((uint64_t)v27, v35, v37);
      }
      unsigned __int8 v23 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        unsigned __int8 v23 = 0;
        goto LABEL_29;
      }
      id v34 = v12;
      v35 = v11;
      v36 = TUIActionLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v40 = v27;
        __int16 v41 = 2114;
        id v42 = WeakRetained;
        _os_log_impl(&def_141F14, v36, OS_LOG_TYPE_INFO, "invoke: via refId=%{public}@ descendentView=%{public}@", buf, 0x16u);
      }

      v37 = [v33 actionHandler];
      unsigned __int8 v23 = [v37 invoke:v10 view:v35 allowRefId:1 arguments:v34];
    }

    id v11 = v35;
    id v12 = v34;
LABEL_29:

LABEL_11:
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v22 = TUIActionLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_141F14, v22, OS_LOG_TYPE_INFO, "invoke: trigger via block", buf, 2u);
  }

  (*((void (**)(void))self->_block + 2))();
  unsigned __int8 v23 = 1;
LABEL_14:

  return v23;
}

- (BOOL)invoke:(id)a3 view:(id)a4
{
  return [(TUIElementActionTriggerHandler *)self invoke:a3 view:a4 allowRefId:0];
}

- (BOOL)invoke:(id)a3 arguments:(id)a4
{
  return [(TUIElementActionTriggerHandler *)self invoke:a3 view:0 allowRefId:0 arguments:a4];
}

+ (id)argumentsForView:(id)a3
{
  id v3 = a3;
  v4 = [v3 superview];
  [v3 center];
  [v4 convertPoint:0 toView:];
  double v6 = v5;
  double v8 = v7;

  [v3 bounds];
  if (v3)
  {
    double v11 = v9;
    double v12 = v10;
    v23[0] = @"sourceViewIdentifier";
    v13 = [v3 layoutAttributes];
    id v14 = [v13 renderModel];
    BOOL v15 = [v14 identifier];
    v16 = [v15 tui_identifierToString];
    v24[0] = v16;
    v24[1] = v3;
    v23[1] = @"sourceView";
    v23[2] = @"width";
    BOOL v17 = +[NSNumber numberWithDouble:v11];
    v24[2] = v17;
    v23[3] = @"height";
    v18 = +[NSNumber numberWithDouble:v12];
    v24[3] = v18;
    v23[4] = @"positionX";
    v19 = +[NSNumber numberWithDouble:v6];
    v24[4] = v19;
    v23[5] = @"positionY";
    id v20 = +[NSNumber numberWithDouble:v8];
    v24[5] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];
  }
  else
  {
    v21 = &__NSDictionary0__struct;
  }

  return v21;
}

- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(id)objc_opt_class() argumentsForView:v8];
  LOBYTE(v5) = [(TUIElementActionTriggerHandler *)self invoke:v9 view:v8 allowRefId:v5 arguments:v10];

  return v5;
}

- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5
{
  return -[TUIElementActionTriggerHandler invoke:view:point:allowRefId:](self, "invoke:view:point:allowRefId:", a3, a4, 0, a5.x, a5.y);
}

- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 allowRefId:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  [v12 convertPoint:0 toView:x, y];
  if (v12)
  {
    double v15 = v13;
    double v16 = v14;
    v24[0] = v12;
    v23[0] = @"sourceView";
    v23[1] = @"sourcePoint";
    BOOL v17 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y);
    v24[1] = v17;
    v24[2] = &off_268AC0;
    v23[2] = @"width";
    v23[3] = @"height";
    v24[3] = &off_268AC0;
    v23[4] = @"positionX";
    v18 = +[NSNumber numberWithDouble:v15];
    v24[4] = v18;
    v23[5] = @"positionY";
    v19 = +[NSNumber numberWithDouble:v16];
    v24[5] = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];
    BOOL v21 = [(TUIElementActionTriggerHandler *)self invoke:v11 view:v12 allowRefId:v6 arguments:v20];
  }
  else
  {
    BOOL v21 = [(TUIElementActionTriggerHandler *)self invoke:v11 view:0 allowRefId:v6 arguments:0];
  }

  return v21;
}

- (void)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v18 = a6;
  id v11 = a4;
  id v12 = a3;
  double v13 = objc_opt_new();
  id v14 = objc_retainBlock(v18);
  [v13 setObject:v14 forKeyedSubscript:@"completion"];

  double v15 = [(id)objc_opt_class() argumentsForView:v11];
  [v13 addEntriesFromDictionary:v15];

  double v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y);
  [v13 setObject:v16 forKeyedSubscript:@"sourcePoint"];

  id v17 = [v13 copy];
  LOBYTE(self) = [(TUIElementActionTriggerHandler *)self invoke:v12 view:v11 allowRefId:0 arguments:v17];

  if ((self & 1) == 0) {
    (*((void (**)(id, void *))v18 + 2))(v18, &__NSDictionary0__struct);
  }
}

- (BOOL)hasActionForTrigger:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUIElementTriggerBehaviorMap *)self->_actionsData behaviorDataForTrigger:v4];
  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    double v7 = [(TUIElementTriggerBehaviorMap *)self->_actionsData refIdForTrigger:v4];
    char v6 = v7 != 0;
  }
  return v6;
}

- (id)keyCommands
{
  id v3 = objc_opt_new();
  [(TUIElementActionTriggerHandler *)self addKeyCommands:v3];

  return v3;
}

- (void)addKeyCommands:(id)a3
{
  id v4 = a3;
  if ([(TUIElementActionTriggerHandler *)self hasActionForTrigger:@"press"])
  {
    BOOL v5 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"tui_handleSelectKey:"];
    v12[0] = v5;
    char v6 = +[UIKeyCommand keyCommandWithInput:@"\x03" modifierFlags:0 action:"tui_handleSelectKey:"];
    v12[1] = v6;
    double v7 = +[NSArray arrayWithObjects:v12 count:2];
    [v4 addObjectsFromArray:v7];
  }
  if ([(TUIElementActionTriggerHandler *)self hasActionForTrigger:@"context-menu"])
  {
    id v8 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0x40000 action:"tui_handleContextMenuKey:"];
    v11[0] = v8;
    id v9 = +[UIKeyCommand keyCommandWithInput:@"\x03" modifierFlags:0x40000 action:"tui_handleContextMenuKey:"];
    v11[1] = v9;
    double v10 = +[NSArray arrayWithObjects:v11 count:2];
    [v4 addObjectsFromArray:v10];
  }
}

- (TUIElementTriggerBehaviorMap)actionsData
{
  return self->_actionsData;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (id)block
{
  return self->_block;
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);

  objc_storeStrong((id *)&self->_actionsData, 0);
}

@end