@interface UNCSectionMuteAssertion
+ (BOOL)supportsSecureCoding;
+ (id)sectionMuteAssertionUntilDate:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (UNCSectionMuteAssertion)initWithCoder:(id)a3;
- (id)_initWithExpirationDate:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4;
@end

@implementation UNCSectionMuteAssertion

+ (id)sectionMuteAssertionUntilDate:(id)a3
{
  id v3 = a3;
  id v4 = [[UNCSectionMuteAssertion alloc] _initWithExpirationDate:v3];

  return v4;
}

- (id)_initWithExpirationDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCSectionMuteAssertion;
  v5 = [(UNCMuteAssertion *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF910], "now", a3);
  LOBYTE(self) = [(NSDate *)self->_expirationDate compare:v4] == NSOrderedDescending;

  return (char)self;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4
{
  BOOL v7 = [(UNCSectionMuteAssertion *)self isActiveForThreadIdentifier:0];
  expirationDate = 0;
  if (v7) {
    expirationDate = self->_expirationDate;
  }
  *a3 = expirationDate;
  *a4 = 0;
}

- (unint64_t)hash
{
  return [(NSDate *)self->_expirationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v4 = v3) != 0)
  {
    v5 = v4;
    char v6 = BSEqualObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; expirationDate: %@>",
               objc_opt_class(),
               self,
               self->_expirationDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNCSectionMuteAssertion;
  id v4 = a3;
  [(UNCMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, @"expirationDate", v5.receiver, v5.super_class);
}

- (UNCSectionMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCSectionMuteAssertion;
  objc_super v5 = [(UNCMuteAssertion *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;
  }
  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
}

@end