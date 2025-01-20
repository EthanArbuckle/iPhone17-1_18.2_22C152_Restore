@interface UIInterfaceActionViewState
+ (id)_nullViewStateForActionType:(int64_t)a3;
+ (id)viewStateForActionRepresentationView:(id)a3 action:(id)a4;
+ (id)viewStateForActionRepresentationViewDescendantView:(id)a3 action:(id)a4;
+ (id)viewStateForAlertControllerActionView:(id)a3;
+ (id)viewStateRepresentingDefaultAction;
+ (id)viewStateRepresentingPreferredAction;
- (BOOL)_stateEqualToActionViewState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isPreferred;
- (BOOL)isPressed;
- (UIInterfaceAction)action;
- (UIInterfaceActionViewState)initWithPropertiesFromActionRepresentationView:(id)a3 groupView:(id)a4 action:(id)a5;
- (id)actionViewStateContext;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)visualCornerPosition;
- (void)_collectStateForDefaultState;
- (void)_collectStateFromAction:(id)a3;
- (void)_collectStateFromActionRepresentationView:(id)a3;
- (void)_collectStateFromActionViewState:(id)a3;
@end

@implementation UIInterfaceActionViewState

+ (id)_nullViewStateForActionType:(int64_t)a3
{
  v4 = +[UIInterfaceAction actionWithTitle:&stru_1ED0E84C0 type:a3 handler:0];
  v5 = (void *)[objc_alloc((Class)a1) initWithPropertiesFromActionRepresentationView:0 groupView:0 action:v4];

  return v5;
}

+ (id)viewStateForActionRepresentationView:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 _enclosingInterfaceActionGroupView];
  v9 = (void *)[objc_alloc((Class)a1) initWithPropertiesFromActionRepresentationView:v7 groupView:v8 action:v6];

  return v9;
}

+ (id)viewStateForActionRepresentationViewDescendantView:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _enclosingInterfaceActionRepresentationView];
  v8 = [a1 viewStateForActionRepresentationView:v7 action:v6];

  return v8;
}

+ (id)viewStateForAlertControllerActionView:(id)a3
{
  id v4 = a3;
  v5 = [v4 _enclosingInterfaceActionRepresentationView];
  id v6 = [v4 action];

  id v7 = [v6 _interfaceActionRepresentation];
  v8 = [a1 viewStateForActionRepresentationView:v5 action:v7];

  return v8;
}

+ (id)viewStateRepresentingDefaultAction
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (id)viewStateRepresentingPreferredAction
{
  id result = (id)[a1 viewStateRepresentingDefaultAction];
  *((unsigned char *)result + 35) = 1;
  return result;
}

- (UIInterfaceActionViewState)initWithPropertiesFromActionRepresentationView:(id)a3 groupView:(id)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionViewState;
  v10 = [(UIInterfaceActionVisualStyleViewState *)&v13 initWithPropertiesFromTopLevelView:a4];
  v11 = v10;
  if (v10)
  {
    [(UIInterfaceActionViewState *)v10 _collectStateForDefaultState];
    [(UIInterfaceActionViewState *)v11 _collectStateFromActionRepresentationView:v8];
    [(UIInterfaceActionViewState *)v11 _collectStateFromAction:v9];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionViewState;
  id v4 = [(UIInterfaceActionVisualStyleViewState *)&v6 copyWithZone:a3];
  [v4 _collectStateFromActionViewState:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(UIInterfaceActionViewState *)self _stateEqualToActionViewState:v4];

  return v5;
}

- (void)_collectStateForDefaultState
{
  v3 = +[UIInterfaceAction actionWithTitle:&stru_1ED0E84C0 type:0 handler:0];
  action = self->_action;
  self->_action = v3;

  self->_isHighlighted = 0;
  self->_isPressed = 0;
  self->_isFocused = 0;
  self->_isPreferred = 0;
  id actionViewStateContext = self->_actionViewStateContext;
  self->_id actionViewStateContext = 0;
}

- (void)_collectStateFromActionRepresentationView:(id)a3
{
  id v4 = a3;
  self->_isHighlighted = [v4 isHighlighted];
  self->_isPressed = [v4 isPressed];
  self->_isFocused = [v4 isFocused];
  BOOL v5 = [v4 actionViewStateContext];
  id actionViewStateContext = self->_actionViewStateContext;
  self->_id actionViewStateContext = v5;

  unint64_t v7 = [v4 visualCornerPosition];
  self->_visualCornerPosition = v7;
}

- (void)_collectStateFromAction:(id)a3
{
  p_action = &self->_action;
  objc_storeStrong((id *)&self->_action, a3);
  id v6 = a3;
  LOBYTE(p_action) = [(UIInterfaceAction *)*p_action _isPreferred];

  self->_isPreferred = (char)p_action;
}

- (void)_collectStateFromActionViewState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 action];
  action = self->_action;
  self->_action = v5;

  self->_isHighlighted = [v4 isHighlighted];
  self->_isPressed = [v4 isPressed];
  self->_isFocused = [v4 isFocused];
  self->_isPreferred = [v4 isPreferred];
  unint64_t v7 = [v4 actionViewStateContext];
  id actionViewStateContext = self->_actionViewStateContext;
  self->_id actionViewStateContext = v7;

  unint64_t v9 = [v4 visualCornerPosition];
  self->_visualCornerPosition = v9;
}

- (BOOL)_stateEqualToActionViewState:(id)a3
{
  id v4 = a3;
  action = self->_action;
  id v6 = [v4 action];
  if ([(UIInterfaceAction *)action isEqual:v6])
  {
    int isHighlighted = self->_isHighlighted;
    if (isHighlighted == [v4 isHighlighted])
    {
      int isPressed = self->_isPressed;
      if (isPressed == [v4 isPressed])
      {
        int isFocused = self->_isFocused;
        if (isFocused == [v4 isFocused])
        {
          int isPreferred = self->_isPreferred;
          if (isPreferred == [v4 isPreferred])
          {
            uint64_t v11 = 48;
            id actionViewStateContext = self->_actionViewStateContext;
            id v13 = [v4 actionViewStateContext];
            if (actionViewStateContext == v13
              || (id v14 = self->_actionViewStateContext,
                  [v4 actionViewStateContext],
                  uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                  [v14 isEqual:v11]))
            {
              unint64_t visualCornerPosition = self->_visualCornerPosition;
              BOOL v15 = visualCornerPosition == [v4 visualCornerPosition];
              if (actionViewStateContext == v13)
              {
LABEL_13:

                goto LABEL_10;
              }
            }
            else
            {
              BOOL v15 = 0;
            }

            goto LABEL_13;
          }
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (BOOL)isFocused
{
  return self->_isFocused;
}

- (BOOL)isPreferred
{
  return self->_isPreferred;
}

- (id)actionViewStateContext
{
  return self->_actionViewStateContext;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionViewStateContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end