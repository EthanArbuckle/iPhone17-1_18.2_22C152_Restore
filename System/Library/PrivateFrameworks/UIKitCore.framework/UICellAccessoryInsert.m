@interface UICellAccessoryInsert
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UICellAccessoryInsert)init;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (void)actionHandler;
- (void)setActionHandler:(void *)actionHandler;
@end

@implementation UICellAccessoryInsert

- (UICellAccessoryInsert)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryInsert;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICellAccessory *)v2 setDisplayedState:1];
  }
  return v3;
}

- (int64_t)_systemType
{
  return 3;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 102;
}

- (id)_identifier
{
  return @"Insert";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryInsert;
  v4 = [(UICellAccessory *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [self->_actionHandler copy];
    v6 = (void *)v4[6];
    v4[6] = v5;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryInsert;
  if ([(UICellAccessory *)&v7 isEqual:v4]) {
    BOOL v5 = self->_actionHandler == v4[6];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryInsert;
  return [(UICellAccessory *)&v4 _canDirectlyUpdateExistingAccessoryViewFrom:a3];
}

- (void)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(void *)actionHandler
{
}

- (void).cxx_destruct
{
}

@end