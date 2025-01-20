@interface PPConnectionsSource
+ (id)identifier;
+ (id)sharedInstance;
- (PPConnectionsLocationSourceDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation PPConnectionsSource

+ (id)identifier
{
  return @"unknown";
}

+ (id)sharedInstance
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PPConnectionsLocationSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPConnectionsLocationSourceDelegate *)WeakRetained;
}

@end