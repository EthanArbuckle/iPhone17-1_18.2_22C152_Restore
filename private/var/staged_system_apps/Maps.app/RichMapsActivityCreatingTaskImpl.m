@interface RichMapsActivityCreatingTaskImpl
- (RichMapsActivity)computedRichMapsActivity;
- (id)description;
- (void)performTaskWithCompletion:(id)a3;
- (void)taskFailed;
- (void)taskFinished:(id)a3;
- (void)taskStarted;
@end

@implementation RichMapsActivityCreatingTaskImpl

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [self->_computedRichMapsActivity shortDescription];
  v6 = +[NSString stringWithFormat:@"<%@ %p %@", v4, self, v5];

  return v6;
}

- (void)performTaskWithCompletion:(id)a3
{
  id v4 = [a3 copy];
  id completion = self->_completion;
  self->_id completion = v4;

  [(RichMapsActivityCreatingTaskImpl *)self performTask];
}

- (void)taskStarted
{
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "taskStarted %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)taskFinished:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_computedRichMapsActivity, a3);
  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "taskFinished %@", (uint8_t *)&v9, 0xCu);
  }

  id completion = (void (**)(id, RichMapsActivity *, void))self->_completion;
  if (completion)
  {
    completion[2](completion, self->_computedRichMapsActivity, 0);
    id v8 = self->_completion;
    self->_id completion = 0;
  }
}

- (void)taskFailed
{
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "taskFailed %@", (uint8_t *)&v6, 0xCu);
  }

  id completion = self->_completion;
  if (completion)
  {
    (*((void (**)(id, void, void))completion + 2))(completion, 0, 0);
    id v5 = self->_completion;
    self->_id completion = 0;
  }
}

- (RichMapsActivity)computedRichMapsActivity
{
  return self->_computedRichMapsActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedRichMapsActivity, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end