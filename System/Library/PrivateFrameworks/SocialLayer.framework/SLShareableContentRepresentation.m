@interface SLShareableContentRepresentation
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)typeIdentifier;
- (SLShareableContentRepresentation)initWithBSXPCCoder:(id)a3;
- (SLShareableContentRepresentation)initWithCoder:(id)a3;
- (SLShareableContentRepresentation)initWithTypeIdentifier:(id)a3 preferredRepresentation:(int64_t)a4;
- (int64_t)preferredRepresentation;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLShareableContentRepresentation

- (SLShareableContentRepresentation)initWithTypeIdentifier:(id)a3 preferredRepresentation:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLShareableContentRepresentation;
  v8 = [(SLShareableContentRepresentation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_typeIdentifier, a3);
    v9->_preferredRepresentation = a4;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(SLShareableContentRepresentation *)self typeIdentifier];
  int64_t v5 = [(SLShareableContentRepresentation *)self preferredRepresentation];
  v6 = @"Data";
  if (v5 == 1) {
    v6 = @"FileCopy";
  }
  if (v5 == 2) {
    v6 = @"OpenInPlace";
  }
  id v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentation)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_typeIdentifier);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = NSStringFromSelector(sel_preferredRepresentation);
  uint64_t v9 = [v4 decodeInt64ForKey:v8];

  v10 = [(SLShareableContentRepresentation *)self initWithTypeIdentifier:v7 preferredRepresentation:v9];
  return v10;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentRepresentation *)self typeIdentifier];
  v6 = NSStringFromSelector(sel_typeIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(SLShareableContentRepresentation *)self preferredRepresentation];
  NSStringFromSelector(sel_preferredRepresentation);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt64:v7 forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_typeIdentifier);
  int64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = NSStringFromSelector(sel_preferredRepresentation);
  uint64_t v9 = [v4 decodeIntegerForKey:v8];

  v10 = [(SLShareableContentRepresentation *)self initWithTypeIdentifier:v7 preferredRepresentation:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentRepresentation *)self typeIdentifier];
  v6 = NSStringFromSelector(sel_typeIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(SLShareableContentRepresentation *)self preferredRepresentation];
  NSStringFromSelector(sel_preferredRepresentation);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v7 forKey:v8];
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (int64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void).cxx_destruct
{
}

@end