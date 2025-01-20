@interface PBBProtoBeganWaitingForUserResponseToActivationEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation PBBProtoBeganWaitingForUserResponseToActivationEvent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoBeganWaitingForUserResponseToActivationEvent;
  v4 = [(PBBProtoBeganWaitingForUserResponseToActivationEvent *)&v8 description];
  v5 = [(PBBProtoBeganWaitingForUserResponseToActivationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x263EFF9A0] dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoBeganWaitingForUserResponseToActivationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end