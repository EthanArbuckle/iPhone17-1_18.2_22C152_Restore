@interface CRTextField
- (SFRemoteTextInputClient)rtiClient;
- (id)_rtiSourceSession;
- (id)doneButtonPressedHandler;
- (id)inputAccessoryView;
- (void)doneButtonPressed;
- (void)setDoneButtonPressedHandler:(id)a3;
- (void)setRtiClient:(id)a3;
@end

@implementation CRTextField

- (id)inputAccessoryView
{
  if ((((unint64_t)[(CRTextField *)self keyboardType] - 4) & 0xFFFFFFFFFFFFFFFALL) != 0)
  {
    v3 = 0;
  }
  else
  {
    cachedDoneIAV = self->_cachedDoneIAV;
    if (!cachedDoneIAV)
    {
      id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed"];
      v7 = (UIView *)objc_alloc_init((Class)UIToolbar);
      [(UIView *)v7 setBarStyle:1];
      v11[0] = v5;
      v11[1] = v6;
      v8 = +[NSArray arrayWithObjects:v11 count:2];
      [(UIView *)v7 setItems:v8];

      [(UIView *)v7 sizeToFit];
      v9 = self->_cachedDoneIAV;
      self->_cachedDoneIAV = v7;

      cachedDoneIAV = self->_cachedDoneIAV;
    }
    v3 = cachedDoneIAV;
  }

  return v3;
}

- (id)_rtiSourceSession
{
  p_rtiSourceSession = &self->__rtiSourceSession;
  rtiSourceSession = self->__rtiSourceSession;
  if (rtiSourceSession)
  {
    v4 = rtiSourceSession;
LABEL_10:
    v7 = v4;
    goto LABEL_11;
  }
  if (!self->_rtiClient) {
    goto LABEL_7;
  }
  id v6 = remote_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000073DC(v6);
  }

  v7 = [(SFRemoteTextInputClient *)self->_rtiClient sourceSession];
  if (!v7)
  {
LABEL_7:
    v8 = remote_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100007398(v8);
    }

    v4 = (RTIInputSystemSourceSession *)objc_alloc_init((Class)RTIInputSystemSourceSession);
    goto LABEL_10;
  }
LABEL_11:
  if (v7 != *p_rtiSourceSession)
  {
    v9 = remote_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100007320((uint64_t)v7, v9);
    }

    objc_storeStrong((id *)p_rtiSourceSession, v7);
  }

  return v7;
}

- (void)doneButtonPressed
{
  v3 = remote_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Done button pressed", v5, 2u);
  }

  doneButtonPressedHandler = (void (**)(void))self->_doneButtonPressedHandler;
  if (doneButtonPressedHandler) {
    doneButtonPressedHandler[2]();
  }
}

- (id)doneButtonPressedHandler
{
  return self->_doneButtonPressedHandler;
}

- (void)setDoneButtonPressedHandler:(id)a3
{
}

- (SFRemoteTextInputClient)rtiClient
{
  return self->_rtiClient;
}

- (void)setRtiClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong(&self->_doneButtonPressedHandler, 0);
  objc_storeStrong((id *)&self->__rtiSourceSession, 0);

  objc_storeStrong((id *)&self->_cachedDoneIAV, 0);
}

@end