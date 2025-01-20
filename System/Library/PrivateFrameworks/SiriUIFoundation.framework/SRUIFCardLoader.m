@interface SRUIFCardLoader
- (BOOL)active;
- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4;
- (SRUIFCardLoaderDelegate)delegate;
- (void)_registerWithSearchFoundation;
- (void)_unregisterWithSearchFoundation;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SRUIFCardLoader

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(SRUIFCardLoader *)self _registerWithSearchFoundation];
    }
    else {
      [(SRUIFCardLoader *)self _unregisterWithSearchFoundation];
    }
  }
}

- (void)_registerWithSearchFoundation
{
}

- (void)_unregisterWithSearchFoundation
{
}

- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if (!v7) {
    goto LABEL_7;
  }
  if ([v6 type] != 3
    || [v6 source] != 2
    || ([(SRUIFCardLoader *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 cardLoader:self shouldLoadCard:v6],
        v8,
        !v9))
  {
    v7[2](v7, v6, 0);
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  v10 = [(SRUIFCardLoader *)self delegate];
  char v11 = [v10 cardLoader:self loadCard:v6 withCompletionHandler:v7];

LABEL_8:
  return v11;
}

- (SRUIFCardLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFCardLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end