@interface SIRINLUEXTERNALRRSurroundingText
- (BOOL)hasBoundingBox;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)text;
- (SIRINLUEXTERNALRRBoundingBox)boundingBox;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRRSurroundingText

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

- (void)setBoundingBox:(id)a3
{
}

- (SIRINLUEXTERNALRRBoundingBox)boundingBox
{
  return self->_boundingBox;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALRRSurroundingText setText:](self, "setText:");
    v4 = v7;
  }
  boundingBox = self->_boundingBox;
  uint64_t v6 = v4[1];
  if (boundingBox)
  {
    if (v6) {
      -[SIRINLUEXTERNALRRBoundingBox mergeFrom:](boundingBox, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALRRSurroundingText setBoundingBox:](self, "setBoundingBox:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  return [(SIRINLUEXTERNALRRBoundingBox *)self->_boundingBox hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((text = self->_text, !((unint64_t)text | v4[2])) || -[NSString isEqual:](text, "isEqual:")))
  {
    boundingBox = self->_boundingBox;
    if ((unint64_t)boundingBox | v4[1]) {
      char v7 = -[SIRINLUEXTERNALRRBoundingBox isEqual:](boundingBox, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALRRBoundingBox *)self->_boundingBox copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    id v4 = v5;
  }
  if (self->_boundingBox)
  {
    objc_msgSend(v5, "setBoundingBox:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_boundingBox)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRRSurroundingTextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    char v7 = [(SIRINLUEXTERNALRRBoundingBox *)boundingBox dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"bounding_box"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRRSurroundingText;
  id v4 = [(SIRINLUEXTERNALRRSurroundingText *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRRSurroundingText *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

@end