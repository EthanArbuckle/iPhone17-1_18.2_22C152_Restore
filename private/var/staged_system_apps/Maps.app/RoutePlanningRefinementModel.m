@interface RoutePlanningRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (RoutePlanningRefinementDelegate)delegate;
- (RoutePlanningRefinementModel)initWithDelegate:(id)a3 value:(id)a4;
- (id)iconImage;
- (id)menu;
- (id)menuProvider;
- (id)titleText;
- (id)value;
- (int)buttonPressUsageAction;
- (int)lastUpdateUsageAction;
- (int)menuPressUsageAction;
- (void)_resetForMenuPresentation;
- (void)setDelegate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RoutePlanningRefinementModel

- (RoutePlanningRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningRefinementModel;
  v8 = [(RoutePlanningRefinementModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong(&v9->_value, a4);
    [(RoutePlanningRefinementModel *)v9 _assertValidValue];
  }

  return v9;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (self->_value != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_value, a3);
    [(RoutePlanningRefinementModel *)self _assertValidValue];
    id v5 = v6;
  }
}

- (id)iconImage
{
  return 0;
}

- (id)titleText
{
  return 0;
}

- (BOOL)shouldShowHighlighted
{
  return 0;
}

- (BOOL)shouldShowChevron
{
  return 0;
}

- (id)menu
{
  return 0;
}

- (id)menuProvider
{
  return 0;
}

- (int)menuPressUsageAction
{
  v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315650;
    id v7 = "-[RoutePlanningRefinementModel menuPressUsageAction]";
    __int16 v8 = 2080;
    v9 = "RoutePlanningRefinementModel.m";
    __int16 v10 = 1024;
    int v11 = 72;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v6, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = +[NSThread callStackSymbols];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (int)buttonPressUsageAction
{
  v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315650;
    id v7 = "-[RoutePlanningRefinementModel buttonPressUsageAction]";
    __int16 v8 = 2080;
    v9 = "RoutePlanningRefinementModel.m";
    __int16 v10 = 1024;
    int v11 = 78;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v6, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = +[NSThread callStackSymbols];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (void)_resetForMenuPresentation
{
  self->_lastUpdateUsageAction = 0;
}

- (int)lastUpdateUsageAction
{
  return self->_lastUpdateUsageAction;
}

- (RoutePlanningRefinementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningRefinementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_value, 0);
}

@end