@interface STCoreDataChange
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCoreDataChange:(id)a3;
- (NSCopying)changeIdentifier;
- (STCoreDataChange)initWithChangeIdentifier:(id)a3 primaryType:(int64_t)a4 secondaryType:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)primaryType;
- (int64_t)secondaryType;
- (unint64_t)hash;
@end

@implementation STCoreDataChange

- (STCoreDataChange)initWithChangeIdentifier:(id)a3 primaryType:(int64_t)a4 secondaryType:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)STCoreDataChange;
  id v7 = a3;
  v8 = [(STCoreDataChange *)&v12 init];
  v9 = (NSCopying *)objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

  changeIdentifier = v8->_changeIdentifier;
  v8->_changeIdentifier = v9;

  v8->_primaryType = a4;
  v8->_secondaryType = a5;
  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STCoreDataChange *)self changeIdentifier];
  int64_t v5 = [(STCoreDataChange *)self primaryType];
  CFStringRef v6 = @"Unknown";
  if (v5 == 1) {
    CFStringRef v6 = @"Configuration";
  }
  if (v5 == 2) {
    CFStringRef v7 = @"Device State";
  }
  else {
    CFStringRef v7 = v6;
  }
  v8 = +[NSString stringWithFormat:@"<%@ { Change Identifier: %@, PrimaryType: %@, SecondaryType: %ld }>", v3, v4, v7, [(STCoreDataChange *)self secondaryType]];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  changeIdentifier = self->_changeIdentifier;
  int64_t primaryType = self->_primaryType;
  int64_t secondaryType = self->_secondaryType;
  return [v4 initWithChangeIdentifier:changeIdentifier primaryType:primaryType secondaryType:secondaryType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STCoreDataChange *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STCoreDataChange *)self isEqualToCoreDataChange:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCoreDataChange:(id)a3
{
  id v4 = (STCoreDataChange *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v5 = [(STCoreDataChange *)self changeIdentifier];
    CFStringRef v6 = [(STCoreDataChange *)v4 changeIdentifier];
    if ([v5 isEqual:v6]
      && (CFStringRef v7 = [(STCoreDataChange *)self primaryType],
          v7 == (void *)[(STCoreDataChange *)v4 primaryType]))
    {
      id v8 = [(STCoreDataChange *)self secondaryType];
      BOOL v9 = v8 == (id)[(STCoreDataChange *)v4 secondaryType];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STCoreDataChange *)self changeIdentifier];
  id v4 = (char *)[v3 hash];
  int64_t v5 = [(STCoreDataChange *)self primaryType];
  CFStringRef v6 = &v4[[(STCoreDataChange *)self secondaryType] + v5];

  return (unint64_t)v6;
}

- (NSCopying)changeIdentifier
{
  return (NSCopying *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)primaryType
{
  return self->_primaryType;
}

- (int64_t)secondaryType
{
  return self->_secondaryType;
}

- (void).cxx_destruct
{
}

@end