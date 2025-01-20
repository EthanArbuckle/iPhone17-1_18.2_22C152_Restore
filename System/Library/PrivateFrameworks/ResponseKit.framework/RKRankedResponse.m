@interface RKRankedResponse
- (NSString)response;
- (RKRankedResponse)initWithResponse:(id)a3 inputMethod:(unint64_t)a4 score:(double)a5;
- (double)score;
- (unint64_t)inputMethod;
- (void)setInputMethod:(unint64_t)a3;
- (void)setResponse:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation RKRankedResponse

- (RKRankedResponse)initWithResponse:(id)a3 inputMethod:(unint64_t)a4 score:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RKRankedResponse;
  v10 = [(RKRankedResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_response, a3);
    v11->_inputMethod = a4;
    v11->_score = a5;
  }

  return v11;
}

- (NSString)response
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponse:(id)a3
{
}

- (unint64_t)inputMethod
{
  return self->_inputMethod;
}

- (void)setInputMethod:(unint64_t)a3
{
  self->_inputMethod = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
}

@end