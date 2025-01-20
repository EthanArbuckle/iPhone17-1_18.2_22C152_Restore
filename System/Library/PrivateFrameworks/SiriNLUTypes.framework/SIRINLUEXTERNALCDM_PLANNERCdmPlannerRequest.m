@interface SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest
- (BOOL)hasCdmPlannerRequestIdentifier;
- (BOOL)hasJsonTranscript;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)jsonTranscript;
- (SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier)cdmPlannerRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmPlannerRequestIdentifier:(id)a3;
- (void)setJsonTranscript:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonTranscript, 0);
  objc_storeStrong((id *)&self->_cdmPlannerRequestIdentifier, 0);
}

- (void)setCdmPlannerRequestIdentifier:(id)a3
{
}

- (SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier)cdmPlannerRequestIdentifier
{
  return self->_cdmPlannerRequestIdentifier;
}

- (void)setJsonTranscript:(id)a3
{
}

- (NSString)jsonTranscript
{
  return self->_jsonTranscript;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest setJsonTranscript:](self, "setJsonTranscript:");
    v4 = v7;
  }
  cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
  uint64_t v6 = v4[1];
  if (cdmPlannerRequestIdentifier)
  {
    if (v6) {
      -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier mergeFrom:](cdmPlannerRequestIdentifier, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest setCdmPlannerRequestIdentifier:](self, "setCdmPlannerRequestIdentifier:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_jsonTranscript hash];
  return [(SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *)self->_cdmPlannerRequestIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((jsonTranscript = self->_jsonTranscript, !((unint64_t)jsonTranscript | v4[2]))
     || -[NSString isEqual:](jsonTranscript, "isEqual:")))
  {
    cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
    if ((unint64_t)cdmPlannerRequestIdentifier | v4[1]) {
      char v7 = -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier isEqual:](cdmPlannerRequestIdentifier, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_jsonTranscript copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *)self->_cdmPlannerRequestIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_jsonTranscript)
  {
    objc_msgSend(v4, "setJsonTranscript:");
    id v4 = v5;
  }
  if (self->_cdmPlannerRequestIdentifier)
  {
    objc_msgSend(v5, "setCdmPlannerRequestIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_jsonTranscript)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_cdmPlannerRequestIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  jsonTranscript = self->_jsonTranscript;
  if (jsonTranscript) {
    [v3 setObject:jsonTranscript forKey:@"json_transcript"];
  }
  cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
  if (cdmPlannerRequestIdentifier)
  {
    char v7 = [(SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *)cdmPlannerRequestIdentifier dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"cdm_planner_request_identifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest;
  id v4 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest *)&v8 description];
  id v5 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCdmPlannerRequestIdentifier
{
  return self->_cdmPlannerRequestIdentifier != 0;
}

- (BOOL)hasJsonTranscript
{
  return self->_jsonTranscript != 0;
}

@end