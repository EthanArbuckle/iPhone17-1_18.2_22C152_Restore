@interface CSDCallHistoryController
- (CSDCallHistoryController)init;
- (CSDCallHistoryControllerDelegate)delegate;
- (void)allCallHistoryDeleted;
- (void)recentCallsDeleted:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSDCallHistoryController

- (CSDCallHistoryController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSDCallHistoryController;
  return [(CSDCallHistoryController *)&v3 init];
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recent calls deleted: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(CSDCallHistoryController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CSDCallHistoryController *)self delegate];
    [v8 recentCallsDeleted:v4];
  }
}

- (void)allCallHistoryDeleted
{
  objc_super v3 = [(CSDCallHistoryController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CSDCallHistoryController *)self delegate];
    [v5 allCallHistoryDeleted];
  }
}

- (CSDCallHistoryControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end