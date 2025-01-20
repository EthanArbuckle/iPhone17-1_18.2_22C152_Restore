@interface ICImportSEProgressViewController
- (UIActivityIndicatorView)statusActivityIndicator;
- (UILabel)statusLabel;
- (void)setStatusActivityIndicator:(id)a3;
- (void)setStatusLabel:(id)a3;
@end

@implementation ICImportSEProgressViewController

- (UILabel)statusLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusLabel);

  return (UILabel *)WeakRetained;
}

- (void)setStatusLabel:(id)a3
{
}

- (UIActivityIndicatorView)statusActivityIndicator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusActivityIndicator);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setStatusActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusActivityIndicator);

  objc_destroyWeak((id *)&self->_statusLabel);
}

@end