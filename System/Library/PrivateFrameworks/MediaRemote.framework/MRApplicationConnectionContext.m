@interface MRApplicationConnectionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MRApplicationConnectionContext)initWithCoder:(id)a3;
- (MRApplicationConnectionContext)initWithIdentifier:(id)a3 service:(id)a4 destinationPlayerPath:(id)a5;
- (MRApplicationConnectionContext)initWithProtobuf:(id)a3;
- (MRApplicationConnectionContext)initWithProtobufData:(id)a3;
- (MRPlayerPath)destinationPlayerPath;
- (NSData)protobufData;
- (NSString)identifier;
- (NSString)service;
- (_MRApplicationConnectionContextProtobuf)protobuf;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRApplicationConnectionContext

- (MRApplicationConnectionContext)initWithIdentifier:(id)a3 service:(id)a4 destinationPlayerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MRApplicationConnectionContext;
  v11 = [(MRApplicationConnectionContext *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    service = v11->_service;
    v11->_service = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    destinationPlayerPath = v11->_destinationPlayerPath;
    v11->_destinationPlayerPath = (MRPlayerPath *)v16;
  }
  return v11;
}

- (MRApplicationConnectionContext)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRApplicationConnectionContextProtobuf alloc] initWithData:v4];

    self = [(MRApplicationConnectionContext *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRApplicationConnectionContext)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)MRApplicationConnectionContext;
    v5 = [(MRApplicationConnectionContext *)&v16 init];
    if (v5)
    {
      uint64_t v6 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;

      uint64_t v8 = [v4 serviceName];
      service = v5->_service;
      v5->_service = (NSString *)v8;

      id v10 = [MRPlayerPath alloc];
      v11 = [v4 destinationPlayerPath];
      uint64_t v12 = [(MRPlayerPath *)v10 initWithProtobuf:v11];
      destinationPlayerPath = v5->_destinationPlayerPath;
      v5->_destinationPlayerPath = (MRPlayerPath *)v12;
    }
    self = v5;
    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(MRApplicationConnectionContext *)self identifier];
  v5 = [(MRApplicationConnectionContext *)self service];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<MRApplicationConnectionContext - id: %@, service: %@>", v4, v5];

  return v6;
}

- (_MRApplicationConnectionContextProtobuf)protobuf
{
  id v3 = objc_alloc_init(_MRApplicationConnectionContextProtobuf);
  id v4 = [(MRApplicationConnectionContext *)self identifier];
  [(_MRApplicationConnectionContextProtobuf *)v3 setIdentifier:v4];

  v5 = [(MRApplicationConnectionContext *)self service];
  [(_MRApplicationConnectionContextProtobuf *)v3 setServiceName:v5];

  uint64_t v6 = [(MRApplicationConnectionContext *)self destinationPlayerPath];
  v7 = [v6 protobuf];
  [(_MRApplicationConnectionContextProtobuf *)v3 setDestinationPlayerPath:v7];

  return v3;
}

- (NSData)protobufData
{
  v2 = [(MRApplicationConnectionContext *)self protobuf];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRApplicationConnectionContext *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      uint64_t v6 = v4->_identifier;
      v7 = identifier;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(MRApplicationConnectionContext *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRApplicationConnectionContext *)self protobufData];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (MRApplicationConnectionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(MRApplicationConnectionContext *)self initWithProtobufData:v5];
  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)service
{
  return self->_service;
}

- (MRPlayerPath)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPlayerPath, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end