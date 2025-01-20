@interface MRApplicationConnectionMessage
+ (BOOL)supportsSecureCoding;
- (MRApplicationConnectionMessage)initWithCoder:(id)a3;
- (MRApplicationConnectionMessage)initWithEncodedUnderlyingMessage:(id)a3;
- (MRApplicationConnectionMessage)initWithProtobuf:(id)a3;
- (MRApplicationConnectionMessage)initWithProtobufData:(id)a3;
- (MRApplicationConnectionMessageHeader)header;
- (NSData)protobufData;
- (NSData)underlyingMessage;
- (_MRApplicationConnectionMessageProtobuf)protobuf;
- (void)encodeWithCoder:(id)a3;
- (void)setHeader:(id)a3;
@end

@implementation MRApplicationConnectionMessage

- (MRApplicationConnectionMessage)initWithEncodedUnderlyingMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRApplicationConnectionMessage;
  v6 = [(MRApplicationConnectionMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingMessage, a3);
  }

  return v7;
}

- (MRApplicationConnectionMessage)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRApplicationConnectionMessageProtobuf alloc] initWithData:v4];

    self = [(MRApplicationConnectionMessage *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRApplicationConnectionMessage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)MRApplicationConnectionMessage;
    id v5 = [(MRApplicationConnectionMessage *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 underlyingMessage];
      underlyingMessage = v5->_underlyingMessage;
      v5->_underlyingMessage = (NSData *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_MRApplicationConnectionMessageProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRApplicationConnectionMessageProtobuf);
  id v4 = [(MRApplicationConnectionMessage *)self underlyingMessage];
  [(_MRApplicationConnectionMessageProtobuf *)v3 setUnderlyingMessage:v4];

  return v3;
}

- (NSData)protobufData
{
  v2 = [(MRApplicationConnectionMessage *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRApplicationConnectionMessage *)self protobufData];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (MRApplicationConnectionMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(MRApplicationConnectionMessage *)self initWithProtobufData:v5];
  return v6;
}

- (NSData)underlyingMessage
{
  return self->_underlyingMessage;
}

- (MRApplicationConnectionMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_underlyingMessage, 0);
}

@end