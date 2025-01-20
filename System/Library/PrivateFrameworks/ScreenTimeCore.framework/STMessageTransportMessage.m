@interface STMessageTransportMessage
+ (BOOL)supportsSecureCoding;
+ (Class)_contentClassForContentType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (NSUUID)identifier;
- (STMessageTransportMessage)initWithCoder:(id)a3;
- (STMessageTransportMessage)initWithIdentifier:(id)a3 content:(id)a4;
- (STMessageTransportMessageContent)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)contentType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMessageTransportMessage

- (STMessageTransportMessage)initWithIdentifier:(id)a3 content:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)STMessageTransportMessage;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STMessageTransportMessage *)&v14 init];
  v8 = (NSUUID *)objc_msgSend(v6, "copy", v14.receiver, v14.super_class);

  identifier = v7->_identifier;
  v7->_identifier = v8;

  v10 = (STMessageTransportMessageContent *)[v5 copy];
  content = v7->_content;
  v7->_content = v10;

  v12 = objc_opt_class();
  v7->_contentType = (int64_t)[v12 contentType];
  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STMessageTransportMessage *)self identifier];
  unint64_t v5 = (unint64_t)[(STMessageTransportMessage *)self contentType] - 1;
  if (v5 > 4) {
    CFStringRef v6 = @"Unknown";
  }
  else {
    CFStringRef v6 = off_1002FCF58[v5];
  }
  v7 = [(STMessageTransportMessage *)self content];
  v8 = +[NSString stringWithFormat:@"<%@: { Identifier: %@, ContentType: %@, Content: %@ }>", v3, v4, v6, v7];

  return v8;
}

- (STMessageTransportMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  CFStringRef v6 = +[STMessageTransportMessage _contentClassForContentType:](STMessageTransportMessage, "_contentClassForContentType:", [v4 decodeIntegerForKey:@"contentType"]);
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"content"];
    self = [(STMessageTransportMessage *)self initWithIdentifier:v5 content:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_contentType forKey:@"contentType"];
  [v5 encodeObject:self->_content forKey:@"content"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)_contentClassForContentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  content = self->_content;
  return [v4 initWithIdentifier:identifier content:content];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STMessageTransportMessage *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STMessageTransportMessage *)self isEqualToMessage:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToMessage:(id)a3
{
  id v4 = (STMessageTransportMessage *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    BOOL v5 = [(STMessageTransportMessage *)self contentType];
    if (v5 == (void *)[(STMessageTransportMessage *)v4 contentType])
    {
      CFStringRef v6 = [(STMessageTransportMessage *)self identifier];
      v7 = [(STMessageTransportMessage *)v4 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(STMessageTransportMessage *)self content];
        v9 = [(STMessageTransportMessage *)v4 content];
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(STMessageTransportMessage *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (STMessageTransportMessageContent)content
{
  return (STMessageTransportMessageContent *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end