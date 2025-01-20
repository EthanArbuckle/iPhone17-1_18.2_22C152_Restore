@interface TUCollaborationInitiator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)handle;
- (TUCollaborationInitiator)init;
- (TUCollaborationInitiator)initWithCoder:(id)a3;
- (TUCollaborationInitiator)initWithNameComponents:(id)a3 handle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUCollaborationInitiator

- (TUCollaborationInitiator)init
{
  return [(TUCollaborationInitiator *)self initWithNameComponents:0 handle:0];
}

- (TUCollaborationInitiator)initWithNameComponents:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUCollaborationInitiator;
  v8 = [(TUCollaborationInitiator *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    nameComponents = v8->_nameComponents;
    v8->_nameComponents = (NSPersonNameComponents *)v9;

    uint64_t v11 = [v7 copy];
    handle = v8->_handle;
    v8->_handle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector(sel_nameComponents);
  [v3 appendFormat:@"%@=%@", v4, self->_nameComponents];

  v5 = NSStringFromSelector(sel_handle);
  [v3 appendFormat:@", %@=%@", v5, self->_handle];

  [v3 appendFormat:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    nameComponents = self->_nameComponents;
    id v6 = [v4 nameComponents];
    if (TUObjectsAreEqualOrNil((unint64_t)nameComponents, (uint64_t)v6))
    {
      handle = self->_handle;
      v8 = [v4 handle];
      char v9 = TUObjectsAreEqualOrNil((unint64_t)handle, (uint64_t)v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSPersonNameComponents *)self->_nameComponents hash];
  return [(NSString *)self->_handle hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  nameComponents = self->_nameComponents;
  handle = self->_handle;

  return (id)[v4 initWithNameComponents:nameComponents handle:handle];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCollaborationInitiator)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_nameComponents);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  char v9 = NSStringFromSelector(sel_handle);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = [(TUCollaborationInitiator *)self initWithNameComponents:v7 handle:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  nameComponents = self->_nameComponents;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_nameComponents);
  [v5 encodeObject:nameComponents forKey:v6];

  handle = self->_handle;
  NSStringFromSelector(sel_handle);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:handle forKey:v8];
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end