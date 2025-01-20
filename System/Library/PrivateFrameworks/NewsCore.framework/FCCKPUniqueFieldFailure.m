@interface FCCKPUniqueFieldFailure
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPUniqueFieldFailure

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPUniqueFieldFailure;
  v4 = [(FCCKPUniqueFieldFailure *)&v8 description];
  v5 = [(FCCKPUniqueFieldFailure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  identifierForConstraintFailure = self->_identifierForConstraintFailure;
  if (identifierForConstraintFailure)
  {
    v5 = [(FCCKPIdentifier *)identifierForConstraintFailure dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"identifierForConstraintFailure"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPUniqueFieldFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifierForConstraintFailure) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPIdentifier *)self->_identifierForConstraintFailure copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    identifierForConstraintFailure = self->_identifierForConstraintFailure;
    if ((unint64_t)identifierForConstraintFailure | v4[1]) {
      char v6 = -[FCCKPIdentifier isEqual:](identifierForConstraintFailure, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(FCCKPIdentifier *)self->_identifierForConstraintFailure hash];
}

- (void).cxx_destruct
{
}

@end