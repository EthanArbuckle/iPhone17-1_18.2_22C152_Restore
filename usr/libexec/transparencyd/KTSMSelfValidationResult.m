@interface KTSMSelfValidationResult
- (KTSMSelfValidationResult)initWithResult:(unint64_t)a3 transparentData:(id)a4 loggableData:(id)a5 application:(id)a6 resultError:(id)a7;
- (KTTransparentData)transparentData;
- (NSArray)loggableData;
- (NSError)resultError;
- (NSString)application;
- (unint64_t)result;
- (void)setApplication:(id)a3;
- (void)setLoggableData:(id)a3;
- (void)setResult:(unint64_t)a3;
- (void)setResultError:(id)a3;
- (void)setTransparentData:(id)a3;
@end

@implementation KTSMSelfValidationResult

- (KTSMSelfValidationResult)initWithResult:(unint64_t)a3 transparentData:(id)a4 loggableData:(id)a5 application:(id)a6 resultError:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)KTSMSelfValidationResult;
  v16 = [(KTSMSelfValidationResult *)&v20 init];
  v17 = v16;
  if (v16)
  {
    [(KTSMSelfValidationResult *)v16 setResult:a3];
    [(KTSMSelfValidationResult *)v17 setTransparentData:v12];
    [(KTSMSelfValidationResult *)v17 setLoggableData:v13];
    [(KTSMSelfValidationResult *)v17 setApplication:v14];
    [(KTSMSelfValidationResult *)v17 setResultError:v15];
    v18 = v17;
  }

  return v17;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (KTTransparentData)transparentData
{
  return (KTTransparentData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransparentData:(id)a3
{
}

- (NSArray)loggableData
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoggableData:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSError)resultError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setResultError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_loggableData, 0);

  objc_storeStrong((id *)&self->_transparentData, 0);
}

@end