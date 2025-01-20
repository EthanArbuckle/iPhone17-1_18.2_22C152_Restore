@interface KCSharingUserEntity
- (BOOL)isEqual:(id)a3;
- (KCSharingUserEntity)initWithCBORData:(id)a3 error:(id *)a4;
- (KCSharingUserEntity)initWithUserHandle:(id)a3;
- (NSData)CBORData;
- (NSData)userHandle;
- (unint64_t)hash;
@end

@implementation KCSharingUserEntity

- (void).cxx_destruct
{
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSData)CBORData
{
  v3 = +[CBOR cborWithUTF8String:@"id"];
  v10 = v3;
  v4 = [(KCSharingUserEntity *)self userHandle];
  v5 = +[CBOR cborWithData:v4];
  v11 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = +[CBOR cborWithDictionary:v6];

  v8 = +[NSData dataWithCBOR:v7];

  return (NSData *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KCSharingUserEntity *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if ([(KCSharingUserEntity *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(KCSharingUserEntity *)self userHandle];
    v7 = [(KCSharingUserEntity *)v5 userHandle];

    unsigned __int8 v8 = [v6 isEqualToData:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(KCSharingUserEntity *)self userHandle];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (KCSharingUserEntity)initWithUserHandle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingUserEntity;
  v5 = [(KCSharingUserEntity *)&v9 init];
  if (v5)
  {
    v6 = (NSData *)[v4 copy];
    userHandle = v5->_userHandle;
    v5->_userHandle = v6;
  }
  return v5;
}

- (KCSharingUserEntity)initWithCBORData:(id)a3 error:(id *)a4
{
  v6 = +[CBOR decodeFromData:a3];
  v7 = [v6 dictionary];
  unsigned __int8 v8 = +[CBOR cborWithUTF8String:@"id"];
  objc_super v9 = [v7 objectForKeyedSubscript:v8];
  v10 = [v9 data];

  if (v10)
  {
    self = [(KCSharingUserEntity *)self initWithUserHandle:v10];
    v11 = self;
  }
  else
  {
    sub_100046FBC(a4, 19, 0);
    v11 = 0;
  }

  return v11;
}

@end