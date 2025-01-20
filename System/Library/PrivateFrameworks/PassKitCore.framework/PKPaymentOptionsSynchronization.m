@interface PKPaymentOptionsSynchronization
+ (BOOL)shouldSyncToCloud;
- (BOOL)shouldSyncToCloud;
- (PKPaymentOptionsSynchronization)init;
- (PKPaymentOptionsSynchronizationDelegate)delegate;
- (void)_updateSynchronizationBehavior;
- (void)setDelegate:(id)a3;
- (void)setShouldSyncToCloud:(BOOL)a3;
@end

@implementation PKPaymentOptionsSynchronization

+ (BOOL)shouldSyncToCloud
{
  v2 = PKCurrentRegion();
  BOOL v3 = [v2 caseInsensitiveCompare:@"CN"] != 0;

  return v3;
}

- (PKPaymentOptionsSynchronization)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentOptionsSynchronization;
  v2 = [(PKPaymentOptionsSynchronization *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(PKPaymentOptionsSynchronization *)v2 _updateSynchronizationBehavior];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__localeDidChangeNotification_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v3;
}

- (void)_updateSynchronizationBehavior
{
  int shouldSyncToCloud = self->_shouldSyncToCloud;
  int v4 = [(id)objc_opt_class() shouldSyncToCloud];
  self->_int shouldSyncToCloud = v4;
  if (shouldSyncToCloud != v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v6 = WeakRetained;
    if (WeakRetained)
    {
      v9 = WeakRetained;
      char v7 = objc_opt_respondsToSelector();
      objc_super v6 = v9;
      if (v7)
      {
        v8 = [NSNumber numberWithBool:self->_shouldSyncToCloud];
        [v9 performSelector:sel_optionsSynchronizationDidChangeTo_ withObject:v8];

        objc_super v6 = v9;
      }
    }
  }
}

- (BOOL)shouldSyncToCloud
{
  return self->_shouldSyncToCloud;
}

- (void)setShouldSyncToCloud:(BOOL)a3
{
  self->_int shouldSyncToCloud = a3;
}

- (PKPaymentOptionsSynchronizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentOptionsSynchronizationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end