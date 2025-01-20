@interface PKTPSDiscoverabilitySignal
- (NSString)bundleIdentifier;
- (NSString)context;
- (NSString)identifier;
- (PKTPSDiscoverabilitySignal)initWithIdentifier:(id)a3;
- (PKTPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5;
- (void)donateSignalWithCompletion:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PKTPSDiscoverabilitySignal

- (PKTPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  return [(PKTPSDiscoverabilitySignal *)self initWithIdentifier:a3 bundleIdentifier:0 context:0];
}

- (PKTPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKTPSDiscoverabilitySignal;
  v12 = [(PKTPSDiscoverabilitySignal *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (void)donateSignalWithCompletion:(id)a3
{
  id v11 = (void (**)(id, void))a3;
  v4 = [(PKTPSDiscoverabilitySignal *)self bundleIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v7 bundleIdentifier];
  }
  v8 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  id v9 = [v8 source];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F50318]) initWithIdentifier:self->_identifier bundleID:v6 context:self->_context];
  [v9 sendEvent:v10];
  if (v11) {
    v11[2](v11, 0);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end