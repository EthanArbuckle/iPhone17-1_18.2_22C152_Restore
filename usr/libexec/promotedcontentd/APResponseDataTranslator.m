@interface APResponseDataTranslator
+ (Class)translatesClass;
- (APResponseDataTranslator)initWithResponse:(id)a3 forRequester:(id)a4;
- (id)requester;
- (id)response;
- (id)translate:(id *)a3;
- (void)setRequester:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation APResponseDataTranslator

+ (Class)translatesClass
{
  return 0;
}

- (APResponseDataTranslator)initWithResponse:(id)a3 forRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APResponseDataTranslator;
  v9 = [(APResponseDataTranslator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_response, a3);
    objc_storeStrong(&v10->_requester, a4);
  }

  return v10;
}

- (id)translate:(id *)a3
{
  return 0;
}

- (id)requester
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setRequester:(id)a3
{
}

- (id)response
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);

  objc_storeStrong(&self->_requester, 0);
}

@end