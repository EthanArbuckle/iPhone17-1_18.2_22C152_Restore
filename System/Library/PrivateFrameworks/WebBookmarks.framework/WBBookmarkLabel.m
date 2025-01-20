@interface WBBookmarkLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinned;
- (NSString)address;
- (NSString)privacyPreservingDescription;
- (NSString)title;
- (WBBookmarkLabel)init;
- (WBBookmarkLabel)initWithCoder:(id)a3;
- (WBBookmarkLabel)initWithTitle:(id)a3 address:(id)a4 pinned:(BOOL)a5;
- (WBBookmarkLabel)labelWithAddress:(id)a3;
- (WBBookmarkLabel)labelWithPinned:(BOOL)a3;
- (WBBookmarkLabel)labelWithTitle:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBBookmarkLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)address
{
  return self->_address;
}

- (NSString)title
{
  return self->_title;
}

- (WBBookmarkLabel)initWithTitle:(id)a3 address:(id)a4 pinned:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBBookmarkLabel;
  v10 = [(WBBookmarkLabel *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_pinned = a5;
    v15 = v10;
  }

  return v10;
}

- (WBBookmarkLabel)labelWithTitle:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitle:v4 address:self->_address pinned:self->_pinned];

  return (WBBookmarkLabel *)v5;
}

- (WBBookmarkLabel)init
{
  return [(WBBookmarkLabel *)self initWithTitle:&stru_26CC2ED50 address:&stru_26CC2ED50 pinned:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBBookmarkLabel *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WBBookmarkLabel *)v5 title];
      v7 = [(WBBookmarkLabel *)self title];
      if (WBSIsEqual())
      {
        id v8 = [(WBBookmarkLabel *)v5 address];
        id v9 = [(WBBookmarkLabel *)self address];
        if (WBSIsEqual())
        {
          BOOL v10 = [(WBBookmarkLabel *)v5 isPinned];
          int v11 = v10 ^ [(WBBookmarkLabel *)self isPinned] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBookmarkLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
  uint64_t v7 = [v4 decodeBoolForKey:@"Pinned"];

  id v8 = [(WBBookmarkLabel *)self initWithTitle:v5 address:v6 pinned:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"Title"];
  [v5 encodeObject:self->_address forKey:@"Address"];
  [v5 encodeBool:self->_pinned forKey:@"Pinned"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_address hash] ^ v3 ^ self->_pinned;
}

- (WBBookmarkLabel)labelWithAddress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitle:self->_title address:v4 pinned:self->_pinned];

  return (WBBookmarkLabel *)v5;
}

- (WBBookmarkLabel)labelWithPinned:(BOOL)a3
{
  NSUInteger v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitle:self->_title address:self->_address pinned:a3];
  return (WBBookmarkLabel *)v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_pinned) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title: %@, address: %@, pinned: %@>",
               v4,
               self,
               self->_title,
               self->_address,
               v5);
}

- (NSString)privacyPreservingDescription
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  NSUInteger v5 = [(NSString *)self->_title hash];
  NSUInteger v6 = [(NSString *)self->_address hash];
  if (self->_pinned) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title hash: %zu, address hash: %zu, pinned: %@>",
                       v4,
                       self,
                       v5,
                       v6,
                       v7);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

@end