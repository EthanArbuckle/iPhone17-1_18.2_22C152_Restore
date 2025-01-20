@interface TRITrialExperimentFields
- (BOOL)hasClientExperimentId;
- (BOOL)hasClientTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientExperimentId;
- (NSString)clientTreatmentId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientExperimentId:(id)a3;
- (void)setClientTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialExperimentFields

- (BOOL)hasClientExperimentId
{
  return self->_clientExperimentId != 0;
}

- (BOOL)hasClientTreatmentId
{
  return self->_clientTreatmentId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialExperimentFields;
  v4 = [(TRITrialExperimentFields *)&v8 description];
  v5 = [(TRITrialExperimentFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientExperimentId = self->_clientExperimentId;
  if (clientExperimentId) {
    [v3 setObject:clientExperimentId forKey:@"client_experiment_id"];
  }
  clientTreatmentId = self->_clientTreatmentId;
  if (clientTreatmentId) {
    [v4 setObject:clientTreatmentId forKey:@"client_treatment_id"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialExperimentFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientExperimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientTreatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientExperimentId)
  {
    objc_msgSend(v4, "setClientExperimentId:");
    id v4 = v5;
  }
  if (self->_clientTreatmentId)
  {
    objc_msgSend(v5, "setClientTreatmentId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientExperimentId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_clientTreatmentId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientExperimentId = self->_clientExperimentId, !((unint64_t)clientExperimentId | v4[1]))
     || -[NSString isEqual:](clientExperimentId, "isEqual:")))
  {
    clientTreatmentId = self->_clientTreatmentId;
    if ((unint64_t)clientTreatmentId | v4[2]) {
      char v7 = -[NSString isEqual:](clientTreatmentId, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientExperimentId hash];
  return [(NSString *)self->_clientTreatmentId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[TRITrialExperimentFields setClientExperimentId:](self, "setClientExperimentId:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[TRITrialExperimentFields setClientTreatmentId:](self, "setClientTreatmentId:");
    id v4 = v5;
  }
}

- (NSString)clientExperimentId
{
  return self->_clientExperimentId;
}

- (void)setClientExperimentId:(id)a3
{
}

- (NSString)clientTreatmentId
{
  return self->_clientTreatmentId;
}

- (void)setClientTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTreatmentId, 0);
  objc_storeStrong((id *)&self->_clientExperimentId, 0);
}

@end