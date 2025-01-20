@interface STSSearchBar
- (STSSearchBarDelegate)stsDelegate;
- (void)setStsDelegate:(id)a3;
@end

@implementation STSSearchBar

- (STSSearchBarDelegate)stsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stsDelegate);

  return (STSSearchBarDelegate *)WeakRetained;
}

- (void)setStsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end