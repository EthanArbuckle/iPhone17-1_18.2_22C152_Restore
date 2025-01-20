@interface PLSearchEntityRelationToPerson
- (NSString)personUUID;
- (PLSearchEntityRelationToPerson)initWithPerson:(id)a3 relationType:(signed __int16)a4 relationTypeConfidence:(double)a5;
- (double)relationTypeConfidence;
- (id)description;
- (id)dictionaryRepresentation;
- (signed)relationType;
- (void)setPersonUUID:(id)a3;
- (void)setRelationType:(signed __int16)a3;
- (void)setRelationTypeConfidence:(double)a3;
@end

@implementation PLSearchEntityRelationToPerson

- (void).cxx_destruct
{
}

- (void)setRelationTypeConfidence:(double)a3
{
  self->_relationTypeConfidence = a3;
}

- (double)relationTypeConfidence
{
  return self->_relationTypeConfidence;
}

- (void)setRelationType:(signed __int16)a3
{
  self->_relationType = a3;
}

- (signed)relationType
{
  return self->_relationType;
}

- (void)setPersonUUID:(id)a3
{
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLSearchEntityRelationToPerson *)self personUUID];
  uint64_t v5 = [(PLSearchEntityRelationToPerson *)self relationType];
  [(PLSearchEntityRelationToPerson *)self relationTypeConfidence];
  v7 = [v3 stringWithFormat:@"\npersonUUID: %@\nrelationType: %llu\nrelationTypeConfidence: %f", v4, v5, v6];

  return v7;
}

- (id)dictionaryRepresentation
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = self->_personUUID;
  v7[0] = @"personUUID";
  v7[1] = @"relationType";
  v3 = [NSNumber numberWithShort:self->_relationType];
  v8[1] = v3;
  v7[2] = @"relationTypeConfidence";
  v4 = [NSNumber numberWithDouble:self->_relationTypeConfidence];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (PLSearchEntityRelationToPerson)initWithPerson:(id)a3 relationType:(signed __int16)a4 relationTypeConfidence:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSearchEntityRelationToPerson;
  v9 = [(PLSearchEntityRelationToPerson *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 personUUID];
    personUUID = v9->_personUUID;
    v9->_personUUID = (NSString *)v10;

    v9->_relationType = a4;
    v9->_relationTypeConfidence = a5;
  }

  return v9;
}

@end