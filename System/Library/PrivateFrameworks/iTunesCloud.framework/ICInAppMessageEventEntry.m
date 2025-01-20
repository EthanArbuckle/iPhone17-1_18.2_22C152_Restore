@interface ICInAppMessageEventEntry
+ (BOOL)supportsSecureCoding;
- (ICInAppMessageEventEntry)initWithCoder:(id)a3;
- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4;
- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4 eventIdentifier:(id)a5;
- (NSDictionary)params;
- (NSString)eventIdentifier;
- (NSString)messageIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICInAppMessageEventEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_params, 0);

  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDictionary)params
{
  return self->_params;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)-[NSString copyWithZone:](self->_messageIdentifier, "copyWithZone:");
  v6 = (void *)[(NSString *)self->_eventIdentifier copyWithZone:a3];
  v7 = (void *)[(NSDictionary *)self->_params copyWithZone:a3];
  v8 = [+[ICInAppMessageEventEntry allocWithZone:a3] initWithMessageIdentifier:v5 params:v7 eventIdentifier:v6];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  messageIdentifier = self->_messageIdentifier;
  id v5 = a3;
  [v5 encodeObject:messageIdentifier forKey:@"messageID"];
  [v5 encodeObject:self->_params forKey:@"params"];
  [v5 encodeObject:self->_eventIdentifier forKey:@"eventID"];
}

- (ICInAppMessageEventEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"params"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventID"];

  v8 = [(ICInAppMessageEventEntry *)self initWithMessageIdentifier:v5 params:v6 eventIdentifier:v7];
  return v8;
}

- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4 eventIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICInAppMessageEventEntry;
  v11 = [(ICInAppMessageEventEntry *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    messageIdentifier = v11->_messageIdentifier;
    v11->_messageIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    params = v11->_params;
    v11->_params = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    eventIdentifier = v11->_eventIdentifier;
    v11->_eventIdentifier = (NSString *)v16;
  }
  return v11;
}

- (ICInAppMessageEventEntry)initWithMessageIdentifier:(id)a3 params:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [v9 UUIDString];
  v11 = [(ICInAppMessageEventEntry *)self initWithMessageIdentifier:v8 params:v7 eventIdentifier:v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end