@interface BFFSpinnerController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (void)setDelegate:(id)a3;
@end

@implementation BFFSpinnerController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end