@interface TCNamedData
+ (id)namedDataWithData:(id)a3 named:(id)a4;
- (NSData)data;
- (NSString)name;
- (TCNamedData)initWithData:(id)a3 named:(id)a4;
@end

@implementation TCNamedData

+ (id)namedDataWithData:(id)a3 named:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[TCNamedData alloc] initWithData:v5 named:v6];

  return v7;
}

- (TCNamedData)initWithData:(id)a3 named:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TCNamedData;
  v9 = [(TCNamedData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mData, a3);
    objc_storeStrong((id *)&v10->mName, a4);
  }

  return v10;
}

- (NSData)data
{
  return self->mData;
}

- (NSString)name
{
  return self->mName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end