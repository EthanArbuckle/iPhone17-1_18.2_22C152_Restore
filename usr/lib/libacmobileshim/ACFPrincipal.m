@interface ACFPrincipal
+ (ACFPrincipal)principalWithPrincipalString:(id)a3;
+ (ACFPrincipal)principalWithUserName:(id)a3 realm:(id)a4;
- (ACFPrincipal)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)principalString;
- (NSString)realm;
- (NSString)userName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)releaseCaches;
- (void)setPrincipalString:(id)a3;
- (void)setRealm:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation ACFPrincipal

+ (ACFPrincipal)principalWithUserName:(id)a3 realm:(id)a4
{
  v6 = objc_opt_new();
  [v6 setUserName:[objc_msgSend((id)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet"))) lowercaseString]];
  [v6 setRealm:a4];

  return (ACFPrincipal *)v6;
}

+ (ACFPrincipal)principalWithPrincipalString:(id)a3
{
  v4 = objc_opt_new();
  [v4 setPrincipalString:a3];

  return (ACFPrincipal *)v4;
}

- (void)dealloc
{
  [(ACFPrincipal *)self setPrincipalString:0];
  v3.receiver = self;
  v3.super_class = (Class)ACFPrincipal;
  [(ACFPrincipal *)&v3 dealloc];
}

- (id)description
{
  id result = [(ACFPrincipal *)self principalString];
  if (!result)
  {
    v4 = NSString;
    if ([(ACFPrincipal *)self userName]) {
      v5 = (__CFString *)mapUserName((uint64_t)[(ACFPrincipal *)self userName]);
    }
    else {
      v5 = @"<NULL>";
    }
    if ([(ACFPrincipal *)self realm]) {
      v6 = [(ACFPrincipal *)self realm];
    }
    else {
      v6 = @"<NULL>";
    }
    return (id)[v4 stringWithFormat:@"%@@%@", v5, v6];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [objc_opt_class() allocWithZone:a3];
  [v4 setUserName:-[ACFPrincipal userName](self, "userName")];
  [v4 setRealm:-[ACFPrincipal realm](self, "realm")];
  return v4;
}

- (ACFPrincipal)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACFPrincipal;
  v4 = [(ACFPrincipal *)&v7 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      -[ACFPrincipal setUserName:](v4, "setUserName:", [a3 decodeObjectForKey:@"ACFPrincipalName"]);
      uint64_t v5 = [a3 decodeObjectForKey:@"ACFPrincipalRealm"];
    }
    else
    {
      -[ACFPrincipal setUserName:](v4, "setUserName:", [a3 decodeObject]);
      uint64_t v5 = [a3 decodeObject];
    }
    [(ACFPrincipal *)v4 setRealm:v5];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_sync_enter(self);
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:[-[ACFPrincipal userName](self, "userName")] forKey:@"ACFPrincipalName"];
    [a3 encodeObject:[-[ACFPrincipal realm](self, "realm")] forKey:@"ACFPrincipalRealm"];
  }
  else
  {
    [a3 encodeObject:-[ACFPrincipal userName](self, "userName")];
    [a3 encodeObject:[-[ACFPrincipal realm](self, "realm")];
  }

  objc_sync_exit(self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (void *)[a3 principalString];
  v6 = [(ACFPrincipal *)self principalString];

  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  v2 = [(ACFPrincipal *)self principalString];

  return [(NSString *)v2 hash];
}

- (void)setUserName:(id)a3
{
  objc_sync_enter(self);
  if (![a3 length]) {
    a3 = 0;
  }
  userName = self->_userName;
  if (userName != a3)
  {
    if (a3)
    {
      if ([(NSString *)userName isEqualToString:a3]) {
        goto LABEL_8;
      }
      userName = self->_userName;
    }

    self->_userName = (NSString *)a3;
    [(ACFPrincipal *)self releaseCaches];
  }
LABEL_8:

  objc_sync_exit(self);
}

- (void)setRealm:(id)a3
{
  objc_sync_enter(self);
  if (![a3 length]) {
    a3 = 0;
  }
  realm = self->_realm;
  if (realm != a3)
  {
    if (a3)
    {
      if ([(NSString *)realm isEqualToString:a3]) {
        goto LABEL_8;
      }
      realm = self->_realm;
    }

    self->_realm = (NSString *)a3;
    [(ACFPrincipal *)self releaseCaches];
  }
LABEL_8:

  objc_sync_exit(self);
}

- (void)releaseCaches
{
  objc_sync_enter(self);
  [(ACFPrincipal *)self willChangeValueForKey:@"principalString"];

  self->_principalString = 0;
  [(ACFPrincipal *)self didChangeValueForKey:@"principalString"];

  objc_sync_exit(self);
}

- (NSString)principalString
{
  objc_sync_enter(self);
  if (!self->_principalString
    && [(NSString *)[(ACFPrincipal *)self userName] length]
    && [(NSString *)[(ACFPrincipal *)self realm] length])
  {
    self->_principalString = (NSString *)(id)[NSString stringWithFormat:@"%@@%@", mapUserName((uint64_t)-[ACFPrincipal userName](self, "userName")), -[ACFPrincipal realm](self, "realm")];
  }
  objc_super v3 = self->_principalString;
  objc_sync_exit(self);
  return v3;
}

- (void)setPrincipalString:(id)a3
{
  objc_sync_enter(self);
  if (a3)
  {
    principalString = self->_principalString;
    if (principalString != a3 && ![(NSString *)principalString isEqualToString:a3])
    {
      v6 = (void *)[a3 componentsSeparatedByString:@"@"];
      if ([v6 count] == 2)
      {
        uint64_t v7 = [v6 objectAtIndex:0];
        v8 = (void *)[MEMORY[0x263F089D8] stringWithString:v7];
        uint64_t v9 = [v8 length];
        [v8 replaceOccurrencesOfString:@"#" withString:@" " options:0 range:v9];
        [v8 replaceOccurrencesOfString:@"%" withString:@"@" options:0 range:v9];
        -[ACFPrincipal setUserName:](self, "setUserName:", (id)[v8 copy]);
        -[ACFPrincipal setRealm:](self, "setRealm:", [v6 objectAtIndex:1]);
      }
    }
  }
  else
  {
    [(ACFPrincipal *)self setUserName:0];
    [(ACFPrincipal *)self setRealm:0];
  }

  objc_sync_exit(self);
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)realm
{
  return self->_realm;
}

@end