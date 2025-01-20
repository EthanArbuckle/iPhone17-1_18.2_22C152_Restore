@interface AWDProactiveModelFittingParsecFeedbackEnvelope
- (AWDProactiveModelFittingEvaluation)evaluation;
- (AWDProactiveModelFittingLinRegFeatureMatrix)linRegFeatureMatrix;
- (AWDProactiveModelFittingLinRegObjectiveFeatures)linRegObjectiveFeatures;
- (AWDProactiveModelFittingLogRegGradient)logRegGradient;
- (AWDProactiveModelFittingLogRegWeights)logRegWeights;
- (BOOL)hasEvaluation;
- (BOOL)hasLinRegFeatureMatrix;
- (BOOL)hasLinRegObjectiveFeatures;
- (BOOL)hasLogRegGradient;
- (BOOL)hasLogRegWeights;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvaluation:(id)a3;
- (void)setLinRegFeatureMatrix:(id)a3;
- (void)setLinRegObjectiveFeatures:(id)a3;
- (void)setLogRegGradient:(id)a3;
- (void)setLogRegWeights:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingParsecFeedbackEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logRegWeights, 0);
  objc_storeStrong((id *)&self->_logRegGradient, 0);
  objc_storeStrong((id *)&self->_linRegObjectiveFeatures, 0);
  objc_storeStrong((id *)&self->_linRegFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
}

- (void)setLinRegObjectiveFeatures:(id)a3
{
}

- (AWDProactiveModelFittingLinRegObjectiveFeatures)linRegObjectiveFeatures
{
  return self->_linRegObjectiveFeatures;
}

- (void)setLinRegFeatureMatrix:(id)a3
{
}

- (AWDProactiveModelFittingLinRegFeatureMatrix)linRegFeatureMatrix
{
  return self->_linRegFeatureMatrix;
}

- (void)setLogRegGradient:(id)a3
{
}

- (AWDProactiveModelFittingLogRegGradient)logRegGradient
{
  return self->_logRegGradient;
}

- (void)setLogRegWeights:(id)a3
{
}

- (AWDProactiveModelFittingLogRegWeights)logRegWeights
{
  return self->_logRegWeights;
}

- (void)setEvaluation:(id)a3
{
}

- (AWDProactiveModelFittingEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  evaluation = self->_evaluation;
  v15 = v4;
  uint64_t v6 = v4[1];
  if (evaluation)
  {
    if (v6) {
      -[AWDProactiveModelFittingEvaluation mergeFrom:](evaluation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setEvaluation:](self, "setEvaluation:");
  }
  logRegWeights = self->_logRegWeights;
  uint64_t v8 = v15[5];
  if (logRegWeights)
  {
    if (v8) {
      -[AWDProactiveModelFittingLogRegWeights mergeFrom:](logRegWeights, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLogRegWeights:](self, "setLogRegWeights:");
  }
  logRegGradient = self->_logRegGradient;
  uint64_t v10 = v15[4];
  if (logRegGradient)
  {
    if (v10) {
      -[AWDProactiveModelFittingLogRegGradient mergeFrom:](logRegGradient, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLogRegGradient:](self, "setLogRegGradient:");
  }
  linRegFeatureMatrix = self->_linRegFeatureMatrix;
  uint64_t v12 = v15[2];
  if (linRegFeatureMatrix)
  {
    if (v12) {
      -[AWDProactiveModelFittingLinRegFeatureMatrix mergeFrom:](linRegFeatureMatrix, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLinRegFeatureMatrix:](self, "setLinRegFeatureMatrix:");
  }
  linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
  uint64_t v14 = v15[3];
  if (linRegObjectiveFeatures)
  {
    if (v14) {
      -[AWDProactiveModelFittingLinRegObjectiveFeatures mergeFrom:](linRegObjectiveFeatures, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLinRegObjectiveFeatures:](self, "setLinRegObjectiveFeatures:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(AWDProactiveModelFittingEvaluation *)self->_evaluation hash];
  unint64_t v4 = [(AWDProactiveModelFittingLogRegWeights *)self->_logRegWeights hash] ^ v3;
  unint64_t v5 = [(AWDProactiveModelFittingLogRegGradient *)self->_logRegGradient hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDProactiveModelFittingLinRegFeatureMatrix *)self->_linRegFeatureMatrix hash];
  return v6 ^ [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self->_linRegObjectiveFeatures hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((evaluation = self->_evaluation, !((unint64_t)evaluation | v4[1]))
     || -[AWDProactiveModelFittingEvaluation isEqual:](evaluation, "isEqual:"))
    && ((logRegWeights = self->_logRegWeights, !((unint64_t)logRegWeights | v4[5]))
     || -[AWDProactiveModelFittingLogRegWeights isEqual:](logRegWeights, "isEqual:"))
    && ((logRegGradient = self->_logRegGradient, !((unint64_t)logRegGradient | v4[4]))
     || -[AWDProactiveModelFittingLogRegGradient isEqual:](logRegGradient, "isEqual:"))
    && ((linRegFeatureMatrix = self->_linRegFeatureMatrix, !((unint64_t)linRegFeatureMatrix | v4[2]))
     || -[AWDProactiveModelFittingLinRegFeatureMatrix isEqual:](linRegFeatureMatrix, "isEqual:")))
  {
    linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
    if ((unint64_t)linRegObjectiveFeatures | v4[3]) {
      char v10 = -[AWDProactiveModelFittingLinRegObjectiveFeatures isEqual:](linRegObjectiveFeatures, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(AWDProactiveModelFittingEvaluation *)self->_evaluation copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(AWDProactiveModelFittingLogRegWeights *)self->_logRegWeights copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(AWDProactiveModelFittingLogRegGradient *)self->_logRegGradient copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)self->_linRegFeatureMatrix copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self->_linRegObjectiveFeatures copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_evaluation)
  {
    objc_msgSend(v4, "setEvaluation:");
    id v4 = v5;
  }
  if (self->_logRegWeights)
  {
    objc_msgSend(v5, "setLogRegWeights:");
    id v4 = v5;
  }
  if (self->_logRegGradient)
  {
    objc_msgSend(v5, "setLogRegGradient:");
    id v4 = v5;
  }
  if (self->_linRegFeatureMatrix)
  {
    objc_msgSend(v5, "setLinRegFeatureMatrix:");
    id v4 = v5;
  }
  if (self->_linRegObjectiveFeatures)
  {
    objc_msgSend(v5, "setLinRegObjectiveFeatures:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_evaluation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_logRegWeights)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_logRegGradient)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_linRegFeatureMatrix)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_linRegObjectiveFeatures)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingParsecFeedbackEnvelopeReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  evaluation = self->_evaluation;
  if (evaluation)
  {
    id v5 = [(AWDProactiveModelFittingEvaluation *)evaluation dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"evaluation"];
  }
  logRegWeights = self->_logRegWeights;
  if (logRegWeights)
  {
    v7 = [(AWDProactiveModelFittingLogRegWeights *)logRegWeights dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"logRegWeights"];
  }
  logRegGradient = self->_logRegGradient;
  if (logRegGradient)
  {
    v9 = [(AWDProactiveModelFittingLogRegGradient *)logRegGradient dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"logRegGradient"];
  }
  linRegFeatureMatrix = self->_linRegFeatureMatrix;
  if (linRegFeatureMatrix)
  {
    v11 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)linRegFeatureMatrix dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"linRegFeatureMatrix"];
  }
  linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
  if (linRegObjectiveFeatures)
  {
    v13 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)linRegObjectiveFeatures dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"linRegObjectiveFeatures"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingParsecFeedbackEnvelope;
  id v4 = [(AWDProactiveModelFittingParsecFeedbackEnvelope *)&v8 description];
  id v5 = [(AWDProactiveModelFittingParsecFeedbackEnvelope *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLinRegObjectiveFeatures
{
  return self->_linRegObjectiveFeatures != 0;
}

- (BOOL)hasLinRegFeatureMatrix
{
  return self->_linRegFeatureMatrix != 0;
}

- (BOOL)hasLogRegGradient
{
  return self->_logRegGradient != 0;
}

- (BOOL)hasLogRegWeights
{
  return self->_logRegWeights != 0;
}

- (BOOL)hasEvaluation
{
  return self->_evaluation != 0;
}

@end