@interface PeopleSuggesterTrialIdentifier
- (BOOL)hasDeployment;
- (BOOL)hasTask;
- (BOOL)hasTreatment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deployment;
- (NSString)task;
- (NSString)treatment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeployment:(id)a3;
- (void)setTask:(id)a3;
- (void)setTreatment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeopleSuggesterTrialIdentifier

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasTreatment
{
  return self->_treatment != 0;
}

- (BOOL)hasDeployment
{
  return self->_deployment != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterTrialIdentifier;
  v4 = [(PeopleSuggesterTrialIdentifier *)&v8 description];
  v5 = [(PeopleSuggesterTrialIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  task = self->_task;
  if (task) {
    [v3 setObject:task forKey:@"task"];
  }
  treatment = self->_treatment;
  if (treatment) {
    [v4 setObject:treatment forKey:@"treatment"];
  }
  deployment = self->_deployment;
  if (deployment) {
    [v4 setObject:deployment forKey:@"deployment"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterTrialIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_task)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_treatment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deployment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_task)
  {
    objc_msgSend(v4, "setTask:");
    id v4 = v5;
  }
  if (self->_treatment)
  {
    objc_msgSend(v5, "setTreatment:");
    id v4 = v5;
  }
  if (self->_deployment)
  {
    objc_msgSend(v5, "setDeployment:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_task copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_treatment copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_deployment copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((task = self->_task, !((unint64_t)task | v4[2])) || -[NSString isEqual:](task, "isEqual:"))
    && ((treatment = self->_treatment, !((unint64_t)treatment | v4[3]))
     || -[NSString isEqual:](treatment, "isEqual:")))
  {
    deployment = self->_deployment;
    if ((unint64_t)deployment | v4[1]) {
      char v8 = -[NSString isEqual:](deployment, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_task hash];
  NSUInteger v4 = [(NSString *)self->_treatment hash] ^ v3;
  return v4 ^ [(NSString *)self->_deployment hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[PeopleSuggesterTrialIdentifier setTask:](self, "setTask:");
  }
  if (v4[3]) {
    -[PeopleSuggesterTrialIdentifier setTreatment:](self, "setTreatment:");
  }
  if (v4[1]) {
    -[PeopleSuggesterTrialIdentifier setDeployment:](self, "setDeployment:");
  }
}

- (NSString)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
}

- (NSString)deployment
{
  return self->_deployment;
}

- (void)setDeployment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_deployment, 0);
}

@end