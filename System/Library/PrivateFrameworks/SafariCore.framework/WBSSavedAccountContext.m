@interface WBSSavedAccountContext
+ (BOOL)supportsSecureCoding;
+ (WBSSavedAccountContext)defaultContext;
+ (id)_nameForDefaultSafariProfile;
- (BOOL)isEqual:(id)a3;
- (NSString)nameForPersistence;
- (WBSSavedAccountContext)initWithCoder:(id)a3;
- (WBSSavedAccountContext)initWithName:(id)a3;
- (WBSSavedAccountContext)initWithSafariProfileIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSSavedAccountContext

+ (WBSSavedAccountContext)defaultContext
{
  if (defaultContext_onceToken != -1) {
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)defaultContext_defaultContext;
  return (WBSSavedAccountContext *)v2;
}

void __40__WBSSavedAccountContext_defaultContext__block_invoke()
{
  v0 = [[WBSSavedAccountContext alloc] initWithName:&stru_1F105D3F0];
  v1 = (void *)defaultContext_defaultContext;
  defaultContext_defaultContext = (uint64_t)v0;
}

+ (id)_nameForDefaultSafariProfile
{
  return (id)[@"SafariProfile-" stringByAppendingString:@"DefaultProfile"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSSavedAccountContext)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSSavedAccountContext;
  v5 = [(WBSSavedAccountContext *)&v11 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _nameForDefaultSafariProfile];
    if ([v4 isEqualToString:v6])
    {
      nameForPersistence = v5->_nameForPersistence;
      v5->_nameForPersistence = (NSString *)&stru_1F105D3F0;
    }
    else
    {
      uint64_t v8 = [v4 copy];
      nameForPersistence = v5->_nameForPersistence;
      v5->_nameForPersistence = (NSString *)v8;
    }

    v9 = v5;
  }

  return v5;
}

- (WBSSavedAccountContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountContext;
  v5 = [(WBSSavedAccountContext *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    nameForPersistence = v5->_nameForPersistence;
    v5->_nameForPersistence = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[WBSSavedAccountContext allocWithZone:a3];
  nameForPersistence = self->_nameForPersistence;
  return [(WBSSavedAccountContext *)v4 initWithName:nameForPersistence];
}

- (void)encodeWithCoder:(id)a3
{
}

- (WBSSavedAccountContext)initWithSafariProfileIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", @"DefaultProfile") & 1) == 0)
  {
    uint64_t v6 = [@"SafariProfile-" stringByAppendingString:v4];
    v5 = [(WBSSavedAccountContext *)self initWithName:v6];
  }
  else
  {
    v5 = [(WBSSavedAccountContext *)self initWithName:&stru_1F105D3F0];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccountContext *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = WBSIsEqual(self->_nameForPersistence, v4->_nameForPersistence);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_nameForPersistence hash];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WBSSavedAccountContext;
  id v4 = [(WBSSavedAccountContext *)&v7 description];
  char v5 = [v3 stringWithFormat:@"<%@ name='%@'>", v4, self->_nameForPersistence];

  return v5;
}

- (NSString)nameForPersistence
{
  return self->_nameForPersistence;
}

- (void).cxx_destruct
{
}

@end