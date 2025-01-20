@interface NUEmbedConfigurationOperationResult
- (NSData)data;
- (NSString)identifier;
- (NUEmbedConfigurationOperationResult)initWithData:(id)a3 idenfifier:(id)a4;
@end

@implementation NUEmbedConfigurationOperationResult

- (NSData)data
{
  return self->_data;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NUEmbedConfigurationOperationResult)initWithData:(id)a3 idenfifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUEmbedConfigurationOperationResult;
  v9 = [(NUEmbedConfigurationOperationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end