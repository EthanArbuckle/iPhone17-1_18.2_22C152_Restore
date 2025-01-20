@interface WiFiAwarePublisherDataSessionHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WiFiAwarePublisherDataSessionHandle)initWithCoder:(id)a3;
- (WiFiAwarePublisherDataSessionHandle)initWithDatapathID:(unsigned __int8)a3 initiatorDataAddress:(id)a4;
- (WiFiMACAddress)initiatorDataAddress;
- (id)description;
- (unint64_t)hash;
- (unsigned)datapathID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiAwarePublisherDataSessionHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedChar:", -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID"));
  [v5 encodeObject:v6 forKey:@"WiFiAwarePublisherDataSessionHandle.datapathID"];

  id v7 = [(WiFiAwarePublisherDataSessionHandle *)self initiatorDataAddress];
  [v5 encodeObject:v7 forKey:@"WiFiAwarePublisherDataSessionHandle.initiatorDataAddress"];
}

- (WiFiAwarePublisherDataSessionHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = decodeInstanceIDFrom(v4, @"WiFiAwarePublisherDataSessionHandle.datapathID");
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublisherDataSessionHandle.initiatorDataAddress"];

  id v7 = [(WiFiAwarePublisherDataSessionHandle *)self initWithDatapathID:v5 initiatorDataAddress:v6];
  return v7;
}

- (WiFiAwarePublisherDataSessionHandle)initWithDatapathID:(unsigned __int8)a3 initiatorDataAddress:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiAwarePublisherDataSessionHandle;
  v8 = [(WiFiAwarePublisherDataSessionHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_datapathID = a3;
    objc_storeStrong((id *)&v8->_initiatorDataAddress, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublisherDataSessionHandle *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = 0;
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  int v6 = [(WiFiAwarePublisherDataSessionHandle *)self datapathID];
  if (v6 == [(WiFiAwarePublisherDataSessionHandle *)v5 datapathID])
  {
    id v7 = [(WiFiAwarePublisherDataSessionHandle *)self initiatorDataAddress];
    v8 = [(WiFiAwarePublisherDataSessionHandle *)v5 initiatorDataAddress];
    int v9 = [v7 isEqual:v8];

    if (v9) {
      goto LABEL_7;
    }
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID"));
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(WiFiAwarePublisherDataSessionHandle *)self initiatorDataAddress];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  unsigned int v4 = [(WiFiAwarePublisherDataSessionHandle *)self datapathID];
  uint64_t v5 = [(WiFiAwarePublisherDataSessionHandle *)self initiatorDataAddress];
  unint64_t v6 = [v3 stringWithFormat:@"<WiFiAwarePublisherDataSessionHandle: ID=%u, initiator=%@>", v4, v5];

  return v6;
}

- (unsigned)datapathID
{
  return self->_datapathID;
}

- (WiFiMACAddress)initiatorDataAddress
{
  return self->_initiatorDataAddress;
}

- (void).cxx_destruct
{
}

@end