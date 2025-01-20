@interface GTTransportMessage_tools_diagnostics
+ (id)messageWithKind:(int)a3;
+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
+ (id)messageWithKind:(int)a3 objectPayload:(id)a4;
+ (id)messageWithKind:(int)a3 payload:(id)a4;
+ (id)messageWithKind:(int)a3 plistPayload:(id)a4;
+ (id)messageWithKind:(int)a3 stringPayload:(id)a4;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLPayload;
- (BOOL)hasBeenSent;
- (GTTransportMessage_tools_diagnostics)init;
- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
- (GTTransport_tools_diagnostics)transport;
- (NSData)encodedAttributes;
- (NSData)payload;
- (NSDictionary)attributes;
- (double)doubleForKey:(id)a3;
- (id)attributeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectPayload;
- (id)plistPayload;
- (id)stringPayload;
- (int)kind;
- (unint64_t)uint64ForKey:(id)a3;
- (unsigned)replySerial;
- (unsigned)serial;
- (unsigned)transportSize;
- (unsigned)uint32ForKey:(id)a3;
- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5;
- (void)_setTransportSize:(unsigned int)a3;
- (void)dealloc;
- (void)setEncodedAttributes:(id)a3;
@end

@implementation GTTransportMessage_tools_diagnostics

- (unsigned)transportSize
{
  return self->_transportSize;
}

- (GTTransport_tools_diagnostics)transport
{
  return self->_transport;
}

- (unsigned)replySerial
{
  return self->_replySerial;
}

- (unsigned)serial
{
  return self->_serial;
}

- (void)setEncodedAttributes:(id)a3
{
}

- (NSData)encodedAttributes
{
  return self->_encodedAttributes;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSData)payload
{
  return self->_payload;
}

- (int)kind
{
  return self->_kind;
}

- (id)objectPayload
{
  if (!self->_payload || self->_decodedPayloadType > 1) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:self->_payload error:0];
    [v5 setDecodingFailurePolicy:0];
    id v6 = +[NSMutableSet set];
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v7[2] = objc_opt_class();
    v7[3] = objc_opt_class();
    v7[4] = objc_opt_class();
    v7[5] = objc_opt_class();
    v7[6] = objc_opt_class();
    v7[7] = objc_opt_class();
    v7[8] = objc_opt_class();
    v7[9] = objc_opt_class();
    [v6 addObjectsFromArray:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 10)];
    self->_decodedPayload = [v5 decodeObjectOfClasses:v6 forKey:@"root"];
    [v5 finishDecoding];

    id result = self->_decodedPayload;
    if (result) {
      self->_decodedPayloadType = 1;
    }
  }
  return result;
}

- (id)stringPayload
{
  payload = self->_payload;
  if (!payload) {
    return 0;
  }
  unsigned int decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 3 && decodedPayloadType != 0) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)payload, 0x8000100u);
    self->_decodedPayload = result;
    if (result) {
      self->_unsigned int decodedPayloadType = 3;
    }
  }
  return result;
}

- (id)plistPayload
{
  payload = self->_payload;
  if (!payload || (self->_decodedPayloadType | 2) != 2) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)payload, 0, 0, 0);
    self->_decodedPayload = result;
    if (result)
    {
      self->_unsigned int decodedPayloadType = 2;
      char v5 = objc_opt_respondsToSelector();
      id result = self->_decodedPayload;
      if (v5)
      {
        unsigned int v6 = [[[result objectForKey:@"$archiver"] isEqual:@"NSKeyedArchiver"];
        id result = self->_decodedPayload;
        if (v6)
        {
          [result objectForKey:@"$top"];
          char v7 = objc_opt_respondsToSelector();
          id result = self->_decodedPayload;
          if (v7)
          {
            id v8 = [[[result objectForKey:@"$top"] objectForKey:@"root"];
            id result = self->_decodedPayload;
            if (v8)
            {
              id v9 = [result objectForKey:@"$version"];
              id result = self->_decodedPayload;
              if (v9)
              {
                id v10 = [result objectForKey:@"$objects"];
                id result = self->_decodedPayload;
                if (v10)
                {

                  id result = 0;
                  self->_decodedPayload = 0;
                  self->_unsigned int decodedPayloadType = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)BOOLPayload
{
  payload = self->_payload;
  if (!payload) {
    return (char)payload;
  }
  unsigned int decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 5)
  {
    if (decodedPayloadType == 4)
    {
LABEL_7:
      char v8 = 0;
      [(NSData *)payload getBytes:&v8 length:1];
      self->_unsigned int decodedPayloadType = 4;
      LOBYTE(payload) = v8 != 0;
      return (char)payload;
    }
    if (decodedPayloadType) {
      goto LABEL_14;
    }
    if ((char *)[(NSData *)payload length] == (char *)&dword_0 + 1)
    {
      payload = self->_payload;
      goto LABEL_7;
    }
    unsigned int v5 = self->_decodedPayloadType;
    if (!v5)
    {
      id decodedPayload = [(GTTransportMessage_tools_diagnostics *)self objectPayload];
      if (decodedPayload) {
        self->_unsigned int decodedPayloadType = 5;
      }
      goto LABEL_11;
    }
    if (v5 != 5)
    {
LABEL_14:
      LOBYTE(payload) = 0;
      return (char)payload;
    }
  }
  id decodedPayload = self->_decodedPayload;
LABEL_11:

  LOBYTE(payload) = [decodedPayload BOOLValue];
  return (char)payload;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(GTTransportMessage_tools_diagnostics *)self attributes] objectForKey:a3];

  return [v3 BOOLValue];
}

- (double)doubleForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(GTTransportMessage_tools_diagnostics *)self attributes] objectForKey:a3];

  [v3 doubleValue];
  return result;
}

- (unint64_t)uint64ForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(GTTransportMessage_tools_diagnostics *)self attributes] objectForKey:a3];

  return (unint64_t)[v3 unsignedLongLongValue];
}

- (unsigned)uint32ForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(GTTransportMessage_tools_diagnostics *)self attributes] objectForKey:a3];

  return [v3 unsignedIntValue];
}

- (id)attributeForKey:(id)a3
{
  v4 = [(GTTransportMessage_tools_diagnostics *)self attributes];

  return [(NSDictionary *)v4 objectForKey:a3];
}

- (void)_setTransportSize:(unsigned int)a3
{
  self->_transportSize = a3;
}

- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5
{
  self->_serial = a3;
  self->_replySerial = a4;
  self->_transport = (GTTransport_tools_diagnostics *)a5;
}

- (BOOL)hasBeenSent
{
  return [(GTTransportMessage_tools_diagnostics *)self serial] != -1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)GTTransportMessage_tools_diagnostics;
  return +[NSString stringWithFormat:@"%@ kind=0x%x serial=%u, reply serial=%u", [(GTTransportMessage_tools_diagnostics *)&v3 description], self->_kind, self->_serial, self->_replySerial];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GTTransportMessage_tools_diagnostics;
  [(GTTransportMessage_tools_diagnostics *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t kind = self->_kind;
  payload = self->_payload;
  attributes = self->_attributes;

  return [v4 initWithKind:kind attributes:attributes payload:payload];
}

- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  id v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (a5)
  {
    id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v10 encodeObject:v5 forKey:@"root"];
    id v5 = [v10 encodedData];
  }
  v11 = [(GTTransportMessage_tools_diagnostics *)self initWithKind:v7 attributes:a4 payload:v5];

  return v11;
}

- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (!a5)
  {
    ExternalRepresentation = 0;
    goto LABEL_5;
  }
  ExternalRepresentation = (GTTransportMessage_tools_diagnostics *)CFStringCreateExternalRepresentation(kCFAllocatorDefault, (CFStringRef)a5, 0x8000100u, 0);
  if (ExternalRepresentation)
  {
LABEL_5:
    id v9 = [(GTTransportMessage_tools_diagnostics *)self initWithKind:v6 attributes:a4 payload:ExternalRepresentation];
    self = ExternalRepresentation;
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a5)
  {
    CFErrorRef error = 0;
    CFDataRef v8 = CFPropertyListCreateData(kCFAllocatorDefault, a5, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    if (!v8)
    {

      return 0;
    }
    CFDataRef v9 = v8;
  }
  else
  {
    CFDataRef v9 = 0;
  }
  id v10 = [(GTTransportMessage_tools_diagnostics *)self initWithKind:v6 attributes:a4 payload:v9];

  return v10;
}

- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  BOOL v12 = a5;
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&v12 length:1];
  if (v8)
  {
    CFDataRef v9 = v8;
    id v10 = [(GTTransportMessage_tools_diagnostics *)self initWithKind:v6 attributes:a4 payload:v8];
  }
  else
  {

    return 0;
  }
  return v10;
}

- (GTTransportMessage_tools_diagnostics)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)GTTransportMessage_tools_diagnostics;
  id v8 = [(GTTransportMessage_tools_diagnostics *)&v11 init];
  CFDataRef v9 = v8;
  if (v8)
  {
    v8->_uint64_t kind = a3;
    *(void *)&v8->_serial = -1;
    v8->_attributes = (NSDictionary *)a4;
    v9->_payload = (NSData *)a5;
  }
  return v9;
}

- (GTTransportMessage_tools_diagnostics)init
{
  return 0;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 objectPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 objectPayload:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 objectPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 stringPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 stringPayload:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 stringPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 plistPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 plistPayload:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 plistPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  id v5 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 BOOLPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 BOOLPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 payload:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:0];

  return v4;
}

+ (id)messageWithKind:(int)a3
{
  id v3 = [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:0];

  return v3;
}

@end