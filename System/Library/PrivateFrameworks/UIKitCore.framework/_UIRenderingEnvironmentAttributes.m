@interface _UIRenderingEnvironmentAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)refersToSameDisplayConfiguration:(id)a3;
- (NSString)description;
- (_UIRenderingEnvironmentAttributes)init;
- (_UIRenderingEnvironmentAttributes)initWithDisplayConfiguration:(id)a3;
- (unint64_t)hash;
- (unsigned)displayID;
@end

@implementation _UIRenderingEnvironmentAttributes

- (_UIRenderingEnvironmentAttributes)initWithDisplayConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRenderingEnvironmentAttributes;
  v5 = [(_UIRenderingEnvironmentAttributes *)&v8 init];
  if (v5)
  {
    v6 = [v4 identity];
    v5->_displayID = [v6 displayID];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIRenderingEnvironmentAttributes *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(_UIRenderingEnvironmentAttributes *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = self->_displayID == v4->_displayID;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (_UIRenderingEnvironmentAttributes)init
{
  return 0;
}

- (BOOL)refersToSameDisplayConfiguration:(id)a3
{
  unsigned int displayID = self->_displayID;
  id v4 = [a3 identity];
  LOBYTE(displayID) = displayID == [v4 displayID];

  return displayID;
}

- (unint64_t)hash
{
  return self->_displayID;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UIRenderingEnvironmentAttributes;
  id v4 = [(_UIRenderingEnvironmentAttributes *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@ displayID=%li", v4, self->_displayID];

  return (NSString *)v5;
}

- (unsigned)displayID
{
  return self->_displayID;
}

@end