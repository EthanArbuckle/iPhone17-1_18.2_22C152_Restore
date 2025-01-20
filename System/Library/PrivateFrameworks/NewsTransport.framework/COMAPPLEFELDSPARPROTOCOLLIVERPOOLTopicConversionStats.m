@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats
- (BOOL)hasConversionStats;
- (BOOL)hasTagId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)conversionStats;
- (NSString)tagId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversionStats:(id)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats

- (BOOL)hasConversionStats
{
  return self->_conversionStats != 0;
}

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats;
  v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  conversionStats = self->_conversionStats;
  if (conversionStats)
  {
    v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)conversionStats dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"conversion_stats"];
  }
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_conversionStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_conversionStats)
  {
    objc_msgSend(v4, "setConversionStats:");
    id v4 = v5;
  }
  if (self->_tagId)
  {
    objc_msgSend(v5, "setTagId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_conversionStats copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_tagId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((conversionStats = self->_conversionStats, !((unint64_t)conversionStats | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](conversionStats, "isEqual:")))
  {
    tagId = self->_tagId;
    if ((unint64_t)tagId | v4[2]) {
      char v7 = -[NSString isEqual:](tagId, "isEqual:");
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
  unint64_t v3 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_conversionStats hash];
  return [(NSString *)self->_tagId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  conversionStats = self->_conversionStats;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (conversionStats)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](conversionStats, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats setConversionStats:](self, "setConversionStats:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats setTagId:](self, "setTagId:");
  }

  MEMORY[0x270F9A758]();
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)conversionStats
{
  return self->_conversionStats;
}

- (void)setConversionStats:(id)a3
{
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);

  objc_storeStrong((id *)&self->_conversionStats, 0);
}

@end