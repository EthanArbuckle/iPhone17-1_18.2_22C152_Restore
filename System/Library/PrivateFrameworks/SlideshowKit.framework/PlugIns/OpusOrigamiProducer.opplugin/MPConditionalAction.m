@interface MPConditionalAction
+ (id)conditionalAction;
- (MPAction)actionIfFalse;
- (MPAction)actionIfTrue;
- (MPConditionalAction)init;
- (NSString)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureActions;
- (void)configureTarget;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setAction:(id)a3 forCondition:(BOOL)a4;
- (void)setPredicate:(id)a3;
@end

@implementation MPConditionalAction

+ (id)conditionalAction
{
  v2 = objc_alloc_init(MPConditionalAction);
  return v2;
}

- (MPConditionalAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPConditionalAction;
  result = [(MPAction *)&v3 init];
  if (result)
  {
    result->_predicate = 0;
    result->_actionIfTrue = 0;
    result->_actionIfFalse = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MPConditionalAction;
  [(MPAction *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPConditionalAction;
  id v4 = [(MPAction *)&v8 copyWithZone:a3];
  [v4 setPredicate:self->_predicate];
  id v5 = [(MPAction *)self->_actionIfTrue copy];
  [v4 setAction:v5 forCondition:1];

  id v6 = [(MPAction *)self->_actionIfFalse copy];
  [v4 setAction:v6 forCondition:0];

  return v4;
}

- (void)setPredicate:(id)a3
{
  predicate = self->_predicate;
  if (predicate)
  {

    self->_predicate = 0;
  }
  id v6 = (NSString *)[a3 copy];
  self->_predicate = v6;
  action = self->super._action;
  if (action)
  {
    [(MCAction *)action setPredicate:v6];
  }
}

- (void)setAction:(id)a3 forCondition:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_msgSend(-[MPAction parentDocument](self, "parentDocument"), "undoManager");
  if (v7)
  {
    objc_super v8 = v7;
    if (v4) {
      v9 = [(MPConditionalAction *)self actionIfTrue];
    }
    else {
      v9 = [(MPConditionalAction *)self actionIfFalse];
    }
    objc_msgSend(objc_msgSend(v8, "prepareWithInvocationTarget:", self), "setAction:forCondition:", v9, v4);
  }
  if (v4) {
    uint64_t v10 = 40;
  }
  else {
    uint64_t v10 = 48;
  }
  v11 = *(Class *)((char *)&self->super.super.isa + v10);
  if (v11)
  {
    [v11 setParent:0];

    *(Class *)((char *)&self->super.super.isa + v10) = 0;
  }
  v12 = (objc_class *)a3;
  *(Class *)((char *)&self->super.super.isa + v10) = v12;
  [(objc_class *)v12 setParent:self];
  [(MPConditionalAction *)self configureActions];
}

- (void)setAction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPConditionalAction;
  [(MPAction *)&v5 setAction:a3];
  action = self->super._action;
  if (action) {
    [(MCAction *)action setPredicate:self->_predicate];
  }
  [(MPConditionalAction *)self configureActions];
}

- (void)configureActions
{
  actionIfTrue = self->_actionIfTrue;
  do
  {
    if (!self->super._action)
    {
      id v6 = 0;
      goto LABEL_18;
    }
    BOOL v4 = [(MPAction *)actionIfTrue targetObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:[v4 objectID] withAnimationKey:[(MPAction *)actionIfTrue animationKey]];
LABEL_14:
      id v6 = v5;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:[v4 objectID] withActionKey:[(MPAction *)actionIfTrue actionKey]];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = +[MCConditionalAction conditionalActionWithPredicate:0];
      [(MCAction *)v6 setTargetObjectID:[v4 objectID]];
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = +[MCActionGroup actionGroup];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:](MCGenericAction, "genericActionForTargetPlugObjectID:withAttributes:", -[NSObject objectID](v4, "objectID"), [0 attributes]);
      goto LABEL_14;
    }
    id v6 = 0;
LABEL_15:
    action = self->super._action;
    if (actionIfTrue == self->_actionIfTrue) {
      [(MCAction *)action setActionIfTrue:v6];
    }
    else {
      [(MCAction *)action setActionIfFalse:v6];
    }
LABEL_18:
    [(MPAction *)actionIfTrue setAction:v6];
    if (actionIfTrue != self->_actionIfTrue) {
      break;
    }
    actionIfTrue = self->_actionIfFalse;
  }
  while (actionIfTrue);
}

- (void)configureTarget
{
  v3.receiver = self;
  v3.super_class = (Class)MPConditionalAction;
  [(MPAction *)&v3 configureTarget];
  [(MPAction *)self->_actionIfFalse configureTarget];
  [(MPAction *)self->_actionIfTrue configureTarget];
}

- (NSString)predicate
{
  return self->_predicate;
}

- (MPAction)actionIfTrue
{
  return self->_actionIfTrue;
}

- (MPAction)actionIfFalse
{
  return self->_actionIfFalse;
}

@end