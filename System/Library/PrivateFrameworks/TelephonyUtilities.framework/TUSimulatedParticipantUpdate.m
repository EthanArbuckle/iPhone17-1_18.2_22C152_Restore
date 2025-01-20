@interface TUSimulatedParticipantUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isSpatialPersonaEnabled;
- (TUSimulatedParticipantUpdate)init;
- (TUSimulatedParticipantUpdate)initWithCoder:(id)a3;
- (TUSimulatedParticipantUpdateHasSet)hasSet;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
@end

@implementation TUSimulatedParticipantUpdate

- (TUSimulatedParticipantUpdate)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUSimulatedParticipantUpdate;
  result = [(TUSimulatedParticipantUpdate *)&v3 init];
  if (result) {
    *(unsigned char *)&result->_hasSet = 0;
  }
  return result;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_hasSet |= 1u;
  self->_spatialPersonaEnabled = a3;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  if ([(TUSimulatedParticipantUpdate *)self hasSet]) {
    objc_msgSend(v3, "appendFormat:", @" spatialPersonaEnabled=%d", -[TUSimulatedParticipantUpdate isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  }
  [v3 appendString:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSimulatedParticipantUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUSimulatedParticipantUpdate *)self init];
  if (v5)
  {
    uint64_t v12 = 0;
    id v6 = v4;
    v7 = NSStringFromSelector(sel_hasSet);
    v8 = (TUSimulatedParticipantUpdateHasSet *)[v6 decodeBytesForKey:v7 returnedLength:&v12];

    if (v12 != 4)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v5->_hasSet = *v8;
    if ([(TUSimulatedParticipantUpdate *)v5 hasSet])
    {
      v9 = NSStringFromSelector(sel_isSpatialPersonaEnabled);
      v5->_spatialPersonaEnabled = [v6 decodeBoolForKey:v9];
    }
  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = NSStringFromSelector(sel_hasSet);
  [v7 encodeBytes:&self->_hasSet length:4 forKey:v4];

  if ([(TUSimulatedParticipantUpdate *)self hasSet])
  {
    BOOL v5 = [(TUSimulatedParticipantUpdate *)self isSpatialPersonaEnabled];
    id v6 = NSStringFromSelector(sel_isSpatialPersonaEnabled);
    [v7 encodeBool:v5 forKey:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[TUSimulatedParticipantUpdate allocWithZone:a3] init];
  if ([(TUSimulatedParticipantUpdate *)self hasSet]) {
    [(TUSimulatedParticipantUpdate *)v4 setSpatialPersonaEnabled:[(TUSimulatedParticipantUpdate *)self isSpatialPersonaEnabled]];
  }
  return v4;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (TUSimulatedParticipantUpdateHasSet)hasSet
{
  return self->_hasSet;
}

@end