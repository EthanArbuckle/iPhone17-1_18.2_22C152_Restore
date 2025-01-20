@interface PDSEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntry:(id)a3;
- (NSString)clientID;
- (PDSEntry)entryWithUpdatedState:(unsigned __int8)a3;
- (PDSEntry)initWithCoder:(id)a3;
- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5;
- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5 state:(unsigned __int8)a6;
- (PDSRegistration)registration;
- (PDSUser)user;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDSEntry

- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5
{
  return [(PDSEntry *)self initWithUser:a3 registration:a4 clientID:a5 state:1];
}

- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5 state:(unsigned __int8)a6
{
  unsigned int v6 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_10:
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PDSEntry.m", 28, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PDSEntry.m", 27, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_11:
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PDSEntry.m", 29, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];

LABEL_4:
  if (v6 >= 4)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PDSEntry.m", 30, @"Invalid parameter not satisfying: %@", @"state <= PDSEntryStateHeartbeat" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PDSEntry;
  v15 = [(PDSEntry *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_user, a3);
    objc_storeStrong((id *)&v16->_registration, a4);
    objc_storeStrong((id *)&v16->_clientID, a5);
    v16->_state = v6;
  }

  return v16;
}

- (PDSEntry)entryWithUpdatedState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 >= 4u)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PDSEntry.m", 42, @"Invalid parameter not satisfying: %@", @"state <= PDSEntryStateHeartbeat" object file lineNumber description];
  }
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUser:self->_user registration:self->_registration clientID:self->_clientID state:v3];
  return (PDSEntry *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  user = self->_user;
  registration = self->_registration;
  clientID = self->_clientID;
  uint64_t state = self->_state;
  return (id)[v4 initWithUser:user registration:registration clientID:clientID state:state];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PDSEntry *)self isEqualToEntry:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PDSEntry *)self user];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(PDSEntry *)self registration];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(PDSEntry *)self state];
  v8 = [(PDSEntry *)self clientID];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqualToEntry:(id)a3
{
  uint64_t v4 = (PDSEntry *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    int v5 = [(PDSEntry *)self state];
    if (v5 == [(PDSEntry *)v4 state])
    {
      uint64_t v6 = [(PDSEntry *)self user];
      uint64_t v7 = [(PDSEntry *)v4 user];
      if ([v6 isEqualToUser:v7])
      {
        v8 = [(PDSEntry *)self registration];
        unint64_t v9 = [(PDSEntry *)v4 registration];
        if ([v8 isEqualToRegistration:v9])
        {
          v10 = [(PDSEntry *)self clientID];
          v11 = [(PDSEntry *)v4 clientID];
          char v12 = [v10 isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PDSEntry *)self user];
  [v7 encodeObject:v4 forKey:@"user"];

  int v5 = [(PDSEntry *)self clientID];
  [v7 encodeObject:v5 forKey:@"clientID"];

  uint64_t v6 = [(PDSEntry *)self registration];
  [v7 encodeObject:v6 forKey:@"registration"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[PDSEntry state](self, "state"), @"state");
}

- (PDSEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registration"];
  unsigned __int8 v8 = [v4 decodeInt32ForKey:@"state"];

  unint64_t v9 = [(PDSEntry *)self initWithUser:v5 registration:v7 clientID:v6];
  v10 = v9;
  if (v9) {
    v9->_uint64_t state = v8;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = PDSStringForEntryState([(PDSEntry *)self state]);
  uint64_t v6 = [(PDSEntry *)self user];
  id v7 = [(PDSEntry *)self registration];
  unsigned __int8 v8 = [(PDSEntry *)self clientID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; uint64_t state = %@; user = %@; registration = %@; clientID = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  unint64_t v9 = v8);

  return v9;
}

- (PDSUser)user
{
  return self->_user;
}

- (PDSRegistration)registration
{
  return self->_registration;
}

- (unsigned)state
{
  return self->_state;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end