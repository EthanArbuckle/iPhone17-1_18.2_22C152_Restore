@interface PDRequestPassesResult
- (NSArray)passesData;
- (NSError)error;
- (PDRequestPassesResult)initWithPassesData:(id)a3 error:(id)a4;
@end

@implementation PDRequestPassesResult

- (PDRequestPassesResult)initWithPassesData:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDRequestPassesResult;
  v9 = [(PDRequestPassesResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passesData, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (NSArray)passesData
{
  return self->_passesData;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_passesData, 0);
}

@end