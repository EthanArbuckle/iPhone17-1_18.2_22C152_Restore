@interface VSMessagePortFeature
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (NSString)featureName;
- (VSMessagePortFeature)initWithDOMNode:(id)a3 featureName:(id)a4;
- (VSMessagePortFeatureDelegate)delegate;
- (void)messagePort:(id)a3 didReceiveMessage:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation VSMessagePortFeature

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x263EFF940];
      uint64_t v5 = *MEMORY[0x263EFF4A0];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      [v4 raise:v5, @"Unexpectedly, feature was %@, instead of VSMessagePortFeature.", v7 format];
    }
    id v8 = v3;
    v9 = [VSJSMessagePort alloc];
    v10 = [v8 appContext];
    v11 = [(IKJSObject *)v9 initWithAppContext:v10];

    [(VSJSMessagePort *)v11 setDelegate:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (VSMessagePortFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VSMessagePortFeature;
  id v8 = [(VSMessagePortFeature *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    v11 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v11);
  }
  return v8;
}

- (void)messagePort:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(VSMessagePortFeature *)self delegate];
  [v6 messagePort:self didReceiveMessage:v5];
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (VSMessagePortFeatureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSMessagePortFeatureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end