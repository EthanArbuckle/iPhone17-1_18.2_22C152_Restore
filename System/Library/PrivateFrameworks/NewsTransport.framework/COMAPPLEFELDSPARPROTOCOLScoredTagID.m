@interface COMAPPLEFELDSPARPROTOCOLScoredTagID
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagId;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setScore:(float)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLScoredTagID

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLScoredTagID;
  v4 = [(COMAPPLEFELDSPARPROTOCOLScoredTagID *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLScoredTagID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  *(float *)&double v4 = self->_score;
  v7 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v7 forKey:@"score"];

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  tagId = self->_tagId;
  v5 = (float *)a3;
  [v5 setTagId:tagId];
  v5[2] = self->_score;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_score;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((tagId = self->_tagId, !((unint64_t)tagId | *((void *)v4 + 2)))
     || -[NSString isEqual:](tagId, "isEqual:"))
    && self->_score == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tagId hash];
  float score = self->_score;
  float v5 = -score;
  if (score >= 0.0) {
    float v5 = self->_score;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  float v10 = fabsf(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if (*((void *)v4 + 2))
  {
    float v5 = v4;
    -[COMAPPLEFELDSPARPROTOCOLScoredTagID setTagId:](self, "setTagId:");
    id v4 = v5;
  }
  self->_float score = v4[2];
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

- (void).cxx_destruct
{
}

@end