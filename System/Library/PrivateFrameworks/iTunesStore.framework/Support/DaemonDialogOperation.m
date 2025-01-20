@interface DaemonDialogOperation
- (BOOL)displaysOnLockscreen;
- (DaemonDialogOperation)initWithDialog:(id)a3;
- (ISDialog)dialog;
- (SSVDialogResponse)dialogResponse;
- (id)outputBlock;
- (void)dealloc;
- (void)run;
- (void)setDisplaysOnLockscreen:(BOOL)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation DaemonDialogOperation

- (DaemonDialogOperation)initWithDialog:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DaemonDialogOperation;
  v4 = [(DaemonDialogOperation *)&v6 init];
  if (v4) {
    v4->_dialog = (ISDialog *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DaemonDialogOperation;
  [(DaemonDialogOperation *)&v3 dealloc];
}

- (ISDialog)dialog
{
  [(DaemonDialogOperation *)self lock];
  objc_super v3 = self->_dialog;
  [(DaemonDialogOperation *)self unlock];

  return v3;
}

- (SSVDialogResponse)dialogResponse
{
  [(DaemonDialogOperation *)self lock];
  id v3 = [(SSVDialogResponse *)self->_dialogResponse copy];
  [(DaemonDialogOperation *)self unlock];

  return (SSVDialogResponse *)v3;
}

- (BOOL)displaysOnLockscreen
{
  [(DaemonDialogOperation *)self lock];
  BOOL displaysOnLockscreen = self->_displaysOnLockscreen;
  [(DaemonDialogOperation *)self unlock];
  return displaysOnLockscreen;
}

- (id)outputBlock
{
  [(DaemonDialogOperation *)self lock];
  id v3 = self->_outputBlock;
  [(DaemonDialogOperation *)self unlock];

  return v3;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  [(DaemonDialogOperation *)self lock];
  self->_BOOL displaysOnLockscreen = a3;

  [(DaemonDialogOperation *)self unlock];
}

- (void)setOutputBlock:(id)a3
{
  [(DaemonDialogOperation *)self lock];
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  [(DaemonDialogOperation *)self unlock];
}

- (void)run
{
  uint64_t v8 = 0;
  [(ISDialog *)self->_dialog setShouldDisplayAsTopMost:[(DaemonDialogOperation *)self displaysOnLockscreen]];
  [(ISDialog *)self->_dialog setDisplaysOnLockscreen:[(DaemonDialogOperation *)self displaysOnLockscreen]];
  id v3 = objc_alloc_init((Class)ISDialogOperation);
  [v3 setDialog:self->_dialog];
  [v3 setPerformDefaultActions:0];
  [(DaemonDialogOperation *)self runSubOperation:v3 returningError:&v8];
  id v4 = [v3 selectedButton];
  if (!v4)
  {
    v7 = [(DaemonDialogOperation *)self outputBlock];
    id v6 = 0;
    if (!v7) {
      goto LABEL_6;
    }
LABEL_5:
    v7[2](v7, v6, v8);
    [(DaemonDialogOperation *)self setOutputBlock:0];
    goto LABEL_6;
  }
  v5 = v4;
  id v6 = objc_alloc_init((Class)SSVDialogResponse);
  objc_msgSend(v6, "setSelectedButtonIndex:", objc_msgSend(-[ISDialog buttons](self->_dialog, "buttons"), "indexOfObject:", v5));
  objc_msgSend(v6, "setTextFieldValues:", objc_msgSend(v3, "textFieldValues"));
  v7 = [(DaemonDialogOperation *)self outputBlock];
  if (v7) {
    goto LABEL_5;
  }
  [v5 performDefaultActionForDialog:self->_dialog];
LABEL_6:
  [(DaemonDialogOperation *)self lock];
  self->_dialogResponse = (SSVDialogResponse *)v6;
  [(DaemonDialogOperation *)self unlock];
  [(DaemonDialogOperation *)self setError:v8];
  [(DaemonDialogOperation *)self setSuccess:v6 != 0];
}

@end