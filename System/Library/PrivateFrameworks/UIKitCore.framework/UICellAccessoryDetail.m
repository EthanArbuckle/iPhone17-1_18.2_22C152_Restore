@interface UICellAccessoryDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (void)actionHandler;
- (void)setActionHandler:(void *)actionHandler;
@end

@implementation UICellAccessoryDetail

- (int64_t)_systemType
{
  return 9;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 203;
}

- (id)_identifier
{
  return @"Detail";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryDetail;
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
  v7.super_class = (Class)UICellAccessoryDetail;
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
  v4.super_class = (Class)UICellAccessoryDetail;
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