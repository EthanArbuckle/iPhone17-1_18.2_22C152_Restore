@interface MSDNearbyObject
- (BOOL)isEqual:(id)a3;
- (BOOL)isInBubble;
- (MSDNearbyObject)initWithIdentifier:(id)a3 andIsInBubble:(BOOL)a4;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setIsInBubble:(BOOL)a3;
@end

@implementation MSDNearbyObject

- (MSDNearbyObject)initWithIdentifier:(id)a3 andIsInBubble:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDNearbyObject;
  v7 = [(MSDNearbyObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MSDNearbyObject *)v7 setIdentifier:v6];
    [(MSDNearbyObject *)v8 setIsInBubble:v4];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    id v6 = [(MSDNearbyObject *)self identifier];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MSDNearbyObject *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(MSDNearbyObject *)self identifier];
  id v6 = +[NSString stringWithFormat:@"<%@[%p]: Identifier=%@ IsInBubble=%d>", v4, self, v5, [(MSDNearbyObject *)self isInBubble]];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isInBubble
{
  return self->_isInBubble;
}

- (void)setIsInBubble:(BOOL)a3
{
  self->_isInBubble = a3;
}

- (void).cxx_destruct
{
}

@end