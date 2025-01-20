@interface PREUMTrialExperiment
- (BOOL)hasExperimentId;
- (BOOL)hasTreatmentId;
- (BOOL)hasTreatmentModelName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentId;
- (NSString)treatmentId;
- (NSString)treatmentModelName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREUMTrialExperiment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);

  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (void)setTreatmentModelName:(id)a3
{
}

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[PREUMTrialExperiment setExperimentId:](self, "setExperimentId:");
  }
  if (v4[2]) {
    -[PREUMTrialExperiment setTreatmentId:](self, "setTreatmentId:");
  }
  if (v4[3]) {
    -[PREUMTrialExperiment setTreatmentModelName:](self, "setTreatmentModelName:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash] ^ v3;
  return v4 ^ [(NSString *)self->_treatmentModelName hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((experimentId = self->_experimentId, !((unint64_t)experimentId | v4[1]))
     || -[NSString isEqual:](experimentId, "isEqual:"))
    && ((treatmentId = self->_treatmentId, !((unint64_t)treatmentId | v4[2]))
     || -[NSString isEqual:](treatmentId, "isEqual:")))
  {
    treatmentModelName = self->_treatmentModelName;
    if ((unint64_t)treatmentModelName | v4[3]) {
      char v8 = -[NSString isEqual:](treatmentModelName, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_experimentId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_treatmentId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_treatmentModelName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v5;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v5, "setTreatmentId:");
    id v4 = v5;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v5, "setTreatmentModelName:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_treatmentModelName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PREUMTrialExperimentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experiment_id"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v4 setObject:treatmentId forKey:@"treatment_id"];
  }
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName) {
    [v4 setObject:treatmentModelName forKey:@"treatment_model_name"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREUMTrialExperiment;
  id v4 = [(PREUMTrialExperiment *)&v8 description];
  id v5 = [(PREUMTrialExperiment *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

@end