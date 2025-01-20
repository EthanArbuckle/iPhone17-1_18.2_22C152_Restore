@interface NMUKeepLocalAlertAction
+ (id)actionWithTitle:(id)a3 shouldPerformKeepLocalRequest:(BOOL)a4 keepLocalRequestOptions:(id)a5 downloadAction:(unint64_t)a6;
- (BOOL)shouldPerformKeepLocalRequest;
- (NMSKeepLocalRequestOptions)keepLocalRequestOptions;
- (NSString)title;
- (id)actionHandler;
- (unint64_t)downloadAction;
- (void)setActionHandler:(id)a3;
- (void)setDownloadAction:(unint64_t)a3;
- (void)setKeepLocalRequestOptions:(id)a3;
- (void)setShouldPerformKeepLocalRequest:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation NMUKeepLocalAlertAction

+ (id)actionWithTitle:(id)a3 shouldPerformKeepLocalRequest:(BOOL)a4 keepLocalRequestOptions:(id)a5 downloadAction:(unint64_t)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_alloc_init(NMUKeepLocalAlertAction);
  [(NMUKeepLocalAlertAction *)v11 setTitle:v10];

  [(NMUKeepLocalAlertAction *)v11 setShouldPerformKeepLocalRequest:v7];
  [(NMUKeepLocalAlertAction *)v11 setKeepLocalRequestOptions:v9];

  [(NMUKeepLocalAlertAction *)v11 setDownloadAction:a6];
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)shouldPerformKeepLocalRequest
{
  return self->_shouldPerformKeepLocalRequest;
}

- (void)setShouldPerformKeepLocalRequest:(BOOL)a3
{
  self->_shouldPerformKeepLocalRequest = a3;
}

- (NMSKeepLocalRequestOptions)keepLocalRequestOptions
{
  return self->_keepLocalRequestOptions;
}

- (void)setKeepLocalRequestOptions:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (unint64_t)downloadAction
{
  return self->_downloadAction;
}

- (void)setDownloadAction:(unint64_t)a3
{
  self->_downloadAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_keepLocalRequestOptions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end