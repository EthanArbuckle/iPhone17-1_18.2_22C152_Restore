@interface TSUProgressUserInfoObject
- (TSUProgress)progress;
- (id)progressObserver;
- (void)setProgress:(id)a3;
- (void)setProgressObserver:(id)a3;
@end

@implementation TSUProgressUserInfoObject

- (TSUProgress)progress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  return (TSUProgress *)WeakRetained;
}

- (void)setProgress:(id)a3
{
}

- (id)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressObserver, 0);
  objc_destroyWeak((id *)&self->_progress);
}

@end