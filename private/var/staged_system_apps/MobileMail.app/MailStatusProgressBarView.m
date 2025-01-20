@interface MailStatusProgressBarView
- (EFCancelable)progressObserverCancelable;
- (MFProgressToolbar)toolbarView;
- (void)dealloc;
- (void)removeFromSuperview;
- (void)setProgressObserverCancelable:(id)a3;
- (void)setToolbarView:(id)a3;
- (void)updateWithStatusInfo:(id)a3;
@end

@implementation MailStatusProgressBarView

- (void)removeFromSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)MailStatusProgressBarView;
  [(MailStatusProgressBarView *)&v4 removeFromSuperview];
  self->_filler = 0.0;
  self->_countUsedUp = 0;
  self->_lastUsedTotal = 0;
  self->_lastUsedCount = 0;
  self->_lastProgress = 0.0;
  v3 = [(MailStatusProgressBarView *)self progressObserverCancelable];
  [v3 cancel];
}

- (void)dealloc
{
  v3 = [(MailStatusProgressBarView *)self progressObserverCancelable];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)MailStatusProgressBarView;
  [(MailStatusProgressBarView *)&v4 dealloc];
}

- (void)updateWithStatusInfo:(id)a3
{
  id v4 = a3;
  v5 = [(MailStatusProgressBarView *)self progressObserverCancelable];
  [v5 cancel];

  v6 = [v4 progress];
  if (v6)
  {
    v7 = NSStringFromSelector("fractionCompleted");
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_1001261F4;
    v14 = &unk_100607930;
    v15 = self;
    id v16 = v6;
    v8 = [v16 ef_observeKeyPath:v7 options:5 usingBlock:&v11];
    -[MailStatusProgressBarView setProgressObserverCancelable:](self, "setProgressObserverCancelable:", v8, v11, v12, v13, v14, v15);
  }
  else
  {
    [(MailStatusProgressBarView *)self setProgressObserverCancelable:0];
  }
  v9 = [v4 status];
  if (v9) {
    id v10 = [objc_alloc((Class)NSAttributedString) initWithString:v9];
  }
  else {
    id v10 = 0;
  }
  [(MailStatusLabelView *)self setPrimaryLabelText:v10];
  [(MailStatusLabelView *)self setSecondaryLabelText:0];
}

- (MFProgressToolbar)toolbarView
{
  return self->_toolbarView;
}

- (void)setToolbarView:(id)a3
{
}

- (EFCancelable)progressObserverCancelable
{
  return self->_progressObserverCancelable;
}

- (void)setProgressObserverCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressObserverCancelable, 0);

  objc_storeStrong((id *)&self->_toolbarView, 0);
}

@end