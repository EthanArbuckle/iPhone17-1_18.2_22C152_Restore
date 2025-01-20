@interface UIDraggingSystemTouchRoutingPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isHitTestingDisabled;
- (NSArray)contextIDsToExcludeFromHitTesting;
- (NSDictionary)contextIDsToAlwaysSendTouchesByDisplayIdentifier;
- (UIDraggingSystemTouchRoutingPolicy)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContextIDsToAlwaysSendTouchesByDisplayIdentifier:(id)a3;
- (void)setContextIDsToExcludeFromHitTesting:(id)a3;
- (void)setHitTestingDisabled:(BOOL)a3;
@end

@implementation UIDraggingSystemTouchRoutingPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSystemTouchRoutingPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIDraggingSystemTouchRoutingPolicy;
  v5 = [(UIDraggingSystemTouchRoutingPolicy *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, objc_opt_class(), v6, v7, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"contextIDsToAlwaysSendTouchesByDisplayIdentifier"];
    contextIDsToAlwaysSendTouchesByDisplayIdentifier = v5->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
    v5->_contextIDsToAlwaysSendTouchesByDisplayIdentifier = (NSDictionary *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v6, v7, 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"contextIDsToExcludeFromHitTesting"];
    contextIDsToExcludeFromHitTesting = v5->_contextIDsToExcludeFromHitTesting;
    v5->_contextIDsToExcludeFromHitTesting = (NSArray *)v13;

    v5->_hitTestingDisabled = [v4 decodeBoolForKey:@"hitTestingDisabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contextIDsToAlwaysSendTouchesByDisplayIdentifier = self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
  id v5 = a3;
  [v5 encodeObject:contextIDsToAlwaysSendTouchesByDisplayIdentifier forKey:@"contextIDsToAlwaysSendTouchesByDisplayIdentifier"];
  [v5 encodeObject:self->_contextIDsToExcludeFromHitTesting forKey:@"contextIDsToExcludeFromHitTesting"];
  [v5 encodeBool:self->_hitTestingDisabled forKey:@"hitTestingDisabled"];
}

- (id)description
{
  v3 = [self _ui_descriptionBuilder];
  if (self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier)
  {
    id v4 = [(UIDraggingSystemTouchRoutingPolicy *)self contextIDsToAlwaysSendTouchesByDisplayIdentifier];
    id v5 = (id)[v3 appendName:@"contextIDsToAlwaysSendTouchesByDisplayIdentifier" object:v4];
  }
  if (self->_contextIDsToExcludeFromHitTesting)
  {
    uint64_t v6 = [(UIDraggingSystemTouchRoutingPolicy *)self contextIDsToExcludeFromHitTesting];
    id v7 = (id)[v3 appendName:@"contextIDsToExcludeFromHitTesting" object:v6];
  }
  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"hitTestingDisabled", -[UIDraggingSystemTouchRoutingPolicy isHitTestingDisabled](self, "isHitTestingDisabled"));
  v9 = [v3 string];

  return v9;
}

- (NSDictionary)contextIDsToAlwaysSendTouchesByDisplayIdentifier
{
  return self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
}

- (void)setContextIDsToAlwaysSendTouchesByDisplayIdentifier:(id)a3
{
}

- (NSArray)contextIDsToExcludeFromHitTesting
{
  return self->_contextIDsToExcludeFromHitTesting;
}

- (void)setContextIDsToExcludeFromHitTesting:(id)a3
{
}

- (BOOL)isHitTestingDisabled
{
  return self->_hitTestingDisabled;
}

- (void)setHitTestingDisabled:(BOOL)a3
{
  self->_hitTestingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIDsToExcludeFromHitTesting, 0);
  objc_storeStrong((id *)&self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier, 0);
}

@end