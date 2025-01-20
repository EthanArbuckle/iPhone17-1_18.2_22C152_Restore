@interface DataStreamFragment
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitial;
- (DataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5;
- (NSData)data;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation DataStreamFragment

- (DataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v20 = (DataStreamFragment *)_HMFPreconditionFailure();
    return (DataStreamFragment *)[(DataStreamFragment *)v20 attributeDescriptions];
  }
  v22.receiver = self;
  v22.super_class = (Class)DataStreamFragment;
  v13 = [(DataStreamFragment *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    v15 = (NSNumber *)[v10 copy];
    sequenceNumber = v14->_sequenceNumber;
    v14->_sequenceNumber = v15;

    v17 = (NSString *)[v12 copy];
    type = v14->_type;
    v14->_type = v17;
  }
  return v14;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = [(DataStreamFragment *)self data];
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 length]);
  id v6 = [v3 initWithName:@"Data Length" value:v5];
  id v7 = objc_alloc((Class)HMFAttributeDescription);
  v8 = [(DataStreamFragment *)self sequenceNumber];
  id v9 = [v7 initWithName:@"Sequence Number" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc((Class)HMFAttributeDescription);
  id v11 = [(DataStreamFragment *)self type];
  id v12 = [v10 initWithName:@"Type" value:v11];
  v15[2] = v12;
  v13 = +[NSArray arrayWithObjects:v15 count:3];

  return v13;
}

- (BOOL)isInitial
{
  v2 = [(DataStreamFragment *)self sequenceNumber];
  BOOL v3 = [v2 unsignedLongLongValue] == (id)1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 data];
    id v9 = [(DataStreamFragment *)self data];
    if ([v8 isEqualToData:v9])
    {
      id v10 = [v7 sequenceNumber];
      id v11 = [(DataStreamFragment *)self sequenceNumber];
      if ([v10 isEqualToNumber:v11])
      {
        id v12 = [v7 type];
        v13 = [(DataStreamFragment *)self type];
        unsigned __int8 v14 = [v12 isEqualToString:v13];
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  BOOL v3 = [(DataStreamFragment *)self data];
  unint64_t v4 = (unint64_t)[v3 hash];

  v5 = [(DataStreamFragment *)self sequenceNumber];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  id v7 = [(DataStreamFragment *)self type];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end