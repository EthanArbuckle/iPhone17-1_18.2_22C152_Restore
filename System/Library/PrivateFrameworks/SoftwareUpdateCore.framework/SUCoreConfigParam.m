@interface SUCoreConfigParam
- (MAAsset)locatedAsset;
- (NSError)error;
- (SUCoreConfigParam)initWithError:(id)a3 operation:(unint64_t)a4;
- (SUCoreConfigParam)initWithLocatedAsset:(id)a3;
- (id)description;
- (unint64_t)operation;
@end

@implementation SUCoreConfigParam

- (SUCoreConfigParam)initWithError:(id)a3 operation:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreConfigParam;
  v8 = [(SUCoreConfigParam *)&v12 init];
  v9 = v8;
  if (v8)
  {
    locatedAsset = v8->_locatedAsset;
    v8->_locatedAsset = 0;

    objc_storeStrong((id *)&v9->_error, a3);
    v9->_operation = a4;
  }

  return v9;
}

- (SUCoreConfigParam)initWithLocatedAsset:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUCoreConfigParam;
  v6 = [(SUCoreConfigParam *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locatedAsset, a3);
    error = v7->_error;
    v7->_error = 0;

    v7->_operation = 0;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(SUCoreConfigParam *)self locatedAsset];
  id v5 = [(SUCoreConfigParam *)self error];
  v6 = [v5 domain];
  id v7 = [(SUCoreConfigParam *)self error];
  v8 = [v3 stringWithFormat:@"SUCoreConfigParam(locatedAsset:%@, error:%@ %ld, operation:%ld)", v4, v6, objc_msgSend(v7, "code"), -[SUCoreConfigParam operation](self, "operation")];

  return v8;
}

- (NSError)error
{
  return self->_error;
}

- (MAAsset)locatedAsset
{
  return self->_locatedAsset;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedAsset, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end