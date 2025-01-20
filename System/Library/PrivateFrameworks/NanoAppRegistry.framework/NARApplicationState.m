@interface NARApplicationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (NARApplicationState)initWithCoder:(id)a3;
- (NARApplicationState)initWithRestricted:(BOOL)a3 removedSystemApp:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NARApplicationState

- (NARApplicationState)initWithRestricted:(BOOL)a3 removedSystemApp:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NARApplicationState;
  result = [(NARApplicationState *)&v7 init];
  if (result)
  {
    result->_restricted = a3;
    result->_removedSystemApp = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL restricted = self->_restricted;
  id v5 = a3;
  [v5 encodeBool:restricted forKey:@"restricted"];
  [v5 encodeBool:self->_removedSystemApp forKey:@"removedSystemApp"];
}

- (NARApplicationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NARApplicationState;
  id v5 = [(NARApplicationState *)&v7 init];
  if (v5)
  {
    v5->_BOOL restricted = [v4 decodeBoolForKey:@"restricted"];
    v5->_removedSystemApp = [v4 decodeBoolForKey:@"removedSystemApp"];
  }

  return v5;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isRemovedSystemApp
{
  return self->_removedSystemApp;
}

@end