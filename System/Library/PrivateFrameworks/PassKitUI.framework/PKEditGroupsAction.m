@interface PKEditGroupsAction
- (NSString)actionLabel;
- (NSString)actionType;
- (PKEditGroupsAction)initWithLabel:(id)a3 type:(id)a4;
- (void)setActionLabel:(id)a3;
- (void)setActionType:(id)a3;
@end

@implementation PKEditGroupsAction

- (PKEditGroupsAction)initWithLabel:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKEditGroupsAction;
  v8 = [(PKEditGroupsAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PKEditGroupsAction *)v8 setActionLabel:v6];
    [(PKEditGroupsAction *)v9 setActionType:v7];
  }

  return v9;
}

- (NSString)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);

  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end