@interface _CRAppStateNavigationOwner
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOwner:(id)a3;
- (BOOL)supportsAccNav;
- (NSString)identifier;
- (NSXPCConnection)connection;
- (id)description;
- (unint64_t)hash;
- (void)setConnection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSupportsAccNav:(BOOL)a3;
@end

@implementation _CRAppStateNavigationOwner

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(_CRAppStateNavigationOwner *)self identifier];
  v5 = [(_CRAppStateNavigationOwner *)self connection];
  id v6 = [v5 processIdentifier];
  if ([(_CRAppStateNavigationOwner *)self supportsAccNav]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  v8 = [(_CRAppStateNavigationOwner *)self connection];
  v9 = +[NSString stringWithFormat:@"<%@: %p %@(%d) supportsAccNav=%@ connection=%p>", v3, self, v4, v6, v7, v8];

  return v9;
}

- (BOOL)isEqualToOwner:(id)a3
{
  id v4 = a3;
  v5 = [(_CRAppStateNavigationOwner *)self identifier];
  id v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    CFStringRef v7 = [(_CRAppStateNavigationOwner *)self connection];
    unsigned int v8 = [v7 processIdentifier];
    v9 = [v4 connection];
    BOOL v10 = v8 == [v9 processIdentifier];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CRAppStateNavigationOwner *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(_CRAppStateNavigationOwner *)self isEqualToOwner:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_CRAppStateNavigationOwner *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(_CRAppStateNavigationOwner *)self connection];
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
  unint64_t v7 = (unint64_t)[v6 hash] ^ v4;

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end