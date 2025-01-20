@interface TISupplementalItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSupplementalItem:(id)a3;
- (TISupplementalItem)init;
- (TISupplementalItem)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TISupplementalItem

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier=%llu>",
               objc_opt_class(),
               self,
               self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TISupplementalItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TISupplementalItem *)self isEqualToSupplementalItem:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t identifier = self->_identifier;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedLongLong:identifier];
  [v5 encodeObject:v6 forKey:@"identifier"];
}

- (TISupplementalItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TISupplementalItem *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v5->_unint64_t identifier = [v6 unsignedLongLongValue];

    v7 = v5;
  }

  return v5;
}

- (BOOL)isEqualToSupplementalItem:(id)a3
{
  return self->_identifier == *((void *)a3 + 1);
}

- (TISupplementalItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)TISupplementalItem;
  v2 = [(TISupplementalItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t identifier = ++generateIdentifier_count;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end