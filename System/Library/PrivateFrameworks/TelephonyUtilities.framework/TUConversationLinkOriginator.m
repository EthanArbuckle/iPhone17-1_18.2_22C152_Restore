@interface TUConversationLinkOriginator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationLinkOriginator:(id)a3;
- (NSString)identifier;
- (TUConversationLinkOriginator)initWithCoder:(id)a3;
- (TUConversationLinkOriginator)initWithIdentifier:(id)a3 revision:(int64_t)a4 handle:(id)a5;
- (TUHandle)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)revision;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRevision:(int64_t)a3;
@end

@implementation TUConversationLinkOriginator

- (TUConversationLinkOriginator)initWithIdentifier:(id)a3 revision:(int64_t)a4 handle:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUConversationLinkOriginator;
  v10 = [(TUConversationLinkOriginator *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_handle, a5);
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_revision = a4;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_handle);
  [v5 encodeObject:handle forKey:v6];

  identifier = self->_identifier;
  id v8 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v8];

  int64_t revision = self->_revision;
  NSStringFromSelector(sel_revision);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:revision forKey:v10];
}

- (TUConversationLinkOriginator)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUConversationLinkOriginator;
  id v5 = [(TUConversationLinkOriginator *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_handle);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_identifier);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v14 = NSStringFromSelector(sel_revision);
    v5->_int64_t revision = [v4 decodeIntegerForKey:v14];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  int64_t revision = self->_revision;
  handle = self->_handle;

  return (id)[v4 initWithIdentifier:identifier revision:revision handle:handle];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_identifier);
  id v5 = [(TUConversationLinkOriginator *)self identifier];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_revision);
  [v3 appendFormat:@"%@=%ld", v6, -[TUConversationLinkOriginator revision](self, "revision")];

  [v3 appendFormat:@", "];
  v7 = NSStringFromSelector(sel_handle);
  uint64_t v8 = [(TUConversationLinkOriginator *)self handle];
  [v3 appendFormat:@"%@=%@", v7, v8];

  [v3 appendFormat:@">"];
  id v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(TUConversationLinkOriginator *)self handle];
  uint64_t v4 = [v3 hash];
  id v5 = [(TUConversationLinkOriginator *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(TUConversationLinkOriginator *)self revision];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationLinkOriginator *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationLinkOriginator *)self isEqualToConversationLinkOriginator:v4];
  }

  return v5;
}

- (BOOL)isEqualToConversationLinkOriginator:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationLinkOriginator *)self handle];
  uint64_t v6 = [v4 handle];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    unint64_t v7 = [(TUConversationLinkOriginator *)self identifier];
    uint64_t v8 = [v4 identifier];
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      int64_t v9 = [(TUConversationLinkOriginator *)self revision];
      BOOL v10 = v9 == [v4 revision];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_int64_t revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end