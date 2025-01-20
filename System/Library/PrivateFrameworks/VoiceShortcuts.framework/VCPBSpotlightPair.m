@interface VCPBSpotlightPair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)workflowID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)spotlightHash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSpotlightHash:(unint64_t)a3;
- (void)setWorkflowID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBSpotlightPair

- (void).cxx_destruct
{
}

- (void)setSpotlightHash:(unint64_t)a3
{
  self->_spotlightHash = a3;
}

- (unint64_t)spotlightHash
{
  return self->_spotlightHash;
}

- (void)setWorkflowID:(id)a3
{
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[VCPBSpotlightPair setWorkflowID:](self, "setWorkflowID:");
    v4 = v5;
  }
  self->_spotlightHash = v4[1];
}

- (unint64_t)hash
{
  return (2654435761u * self->_spotlightHash) ^ [(NSString *)self->_workflowID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((workflowID = self->_workflowID, !((unint64_t)workflowID | v4[2]))
     || -[NSString isEqual:](workflowID, "isEqual:"))
    && self->_spotlightHash == v4[1];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_workflowID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_spotlightHash;
  return v5;
}

- (void)copyTo:(id)a3
{
  workflowID = self->_workflowID;
  v5 = a3;
  [v5 setWorkflowID:workflowID];
  v5[1] = self->_spotlightHash;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_workflowID) {
    __assert_rtn("-[VCPBSpotlightPair writeTo:]", "VCPBSpotlightPair.m", 79, "nil != self->_workflowID");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
}

- (BOOL)readFrom:(id)a3
{
  return VCPBSpotlightPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  workflowID = self->_workflowID;
  if (workflowID) {
    [v3 setObject:workflowID forKey:@"workflowID"];
  }
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_spotlightHash];
  [v4 setObject:v6 forKey:@"spotlightHash"];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBSpotlightPair;
  id v4 = [(VCPBSpotlightPair *)&v8 description];
  id v5 = [(VCPBSpotlightPair *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end