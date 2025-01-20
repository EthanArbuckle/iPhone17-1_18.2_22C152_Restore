@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore
- (BOOL)hasCohorts;
- (BOOL)hasTagId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)cohorts;
- (NSString)tagId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCohorts:(id)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (BOOL)hasCohorts
{
  return self->_cohorts != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore;
  v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  cohorts = self->_cohorts;
  if (cohorts)
  {
    v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)cohorts dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"cohorts"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_cohorts)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tagId)
  {
    objc_msgSend(v4, "setTagId:");
    id v4 = v5;
  }
  if (self->_cohorts)
  {
    objc_msgSend(v5, "setCohorts:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_cohorts copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tagId = self->_tagId, !((unint64_t)tagId | v4[2]))
     || -[NSString isEqual:](tagId, "isEqual:")))
  {
    cohorts = self->_cohorts;
    if ((unint64_t)cohorts | v4[1]) {
      char v7 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](cohorts, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_tagId hash];
  return [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_cohorts hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore setTagId:](self, "setTagId:");
    id v4 = v7;
  }
  cohorts = self->_cohorts;
  uint64_t v6 = v4[1];
  if (cohorts)
  {
    if (v6) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](cohorts, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore setCohorts:](self, "setCohorts:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)cohorts
{
  return self->_cohorts;
}

- (void)setCohorts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);

  objc_storeStrong((id *)&self->_cohorts, 0);
}

@end