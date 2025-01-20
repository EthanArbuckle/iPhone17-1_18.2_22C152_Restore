@interface MRUserIdentity
+ (BOOL)supportsSecureCoding;
+ (id)basicIdentityWithIdentifier:(id)a3 displayName:(id)a4;
+ (id)resolvableIdentityWithIdentifier:(id)a3;
+ (id)resolvableIdentityWithIdentifier:(id)a3 displayName:(id)a4;
+ (void)fetchIdentityForDSID:(id)a3 completion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (MRUserIdentity)initWithCoder:(id)a3;
- (MRUserIdentity)initWithIdentifier:(id)a3 displayName:(id)a4 type:(int64_t)a5;
- (MRUserIdentity)initWithProtobuf:(id)a3;
- (MRUserIdentity)initWithProtobufData:(id)a3;
- (NSData)protobufData;
- (NSString)displayName;
- (NSString)identifier;
- (_MRUserIdentityProtobuf)protobuf;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRUserIdentity

+ (id)basicIdentityWithIdentifier:(id)a3 displayName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MRUserIdentity alloc] initWithIdentifier:v6 displayName:v5 type:0];

  return v7;
}

+ (id)resolvableIdentityWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[MRUserIdentity alloc] initWithIdentifier:v3 displayName:0 type:1];

  return v4;
}

+ (id)resolvableIdentityWithIdentifier:(id)a3 displayName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MRUserIdentity alloc] initWithIdentifier:v6 displayName:v5 type:1];

  return v7;
}

+ (void)fetchIdentityForDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = MRGetSharedService();
  v8 = MRGroupSessionSubsystemGetNotificationQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MRUserIdentity_fetchIdentityForDSID_completion___block_invoke;
  v10[3] = &unk_1E57D4608;
  id v11 = v5;
  id v9 = v5;
  [v7 userIdentityForDSID:v6 queue:v8 completion:v10];
}

uint64_t __50__MRUserIdentity_fetchIdentityForDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (MRUserIdentity)initWithIdentifier:(id)a3 displayName:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRUserIdentity;
  v10 = [(MRUserIdentity *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v13;

    v10->_type = a5;
  }

  return v10;
}

- (MRUserIdentity)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRUserIdentity;
    id v5 = [(MRUserIdentity *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;

      uint64_t v8 = [v4 displayName];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v8;

      v5->_type = (int)[v4 type];
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MRUserIdentity)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRUserIdentityProtobuf alloc] initWithData:v4];

    self = [(MRUserIdentity *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MRUserIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(MRUserIdentity *)self initWithProtobufData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(MRUserIdentity *)self protobuf];
  id v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRUserIdentity *)self identifier];
  id v6 = [(MRUserIdentity *)self displayName];
  v7 = (void *)[v3 initWithFormat:@"<%@: identifier=%@, displayName=%@, type=%ld>", v4, v5, v6, -[MRUserIdentity type](self, "type")];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUserIdentity *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        id v9 = identifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      displayName = self->_displayName;
      uint64_t v13 = v5->_displayName;
      if (displayName == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = displayName;
        int v16 = [(NSString *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      BOOL v11 = self->_type == v5->_type;
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_displayName hash] ^ v3;
}

- (_MRUserIdentityProtobuf)protobuf
{
  NSUInteger v3 = objc_alloc_init(_MRUserIdentityProtobuf);
  uint64_t v4 = [(MRUserIdentity *)self identifier];
  [(_MRUserIdentityProtobuf *)v3 setIdentifier:v4];

  id v5 = [(MRUserIdentity *)self displayName];
  [(_MRUserIdentityProtobuf *)v3 setDisplayName:v5];

  [(_MRUserIdentityProtobuf *)v3 setType:[(MRUserIdentity *)self type]];

  return v3;
}

- (NSData)protobufData
{
  v2 = [(MRUserIdentity *)self protobuf];
  NSUInteger v3 = [v2 data];

  return (NSData *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end