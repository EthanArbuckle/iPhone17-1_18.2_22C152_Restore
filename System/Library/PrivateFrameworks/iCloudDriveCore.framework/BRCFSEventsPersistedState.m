@interface BRCFSEventsPersistedState
+ (BOOL)supportsSecureCoding;
- (BRCFSEventsPersistedState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRCFSEventsPersistedState

- (BRCFSEventsPersistedState)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCFSEventsPersistedState;
  return [(BRCFSEventsPersistedState *)&v4 init];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BRCFSEventsPersistedState;
  [(BRCPersistedState *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end