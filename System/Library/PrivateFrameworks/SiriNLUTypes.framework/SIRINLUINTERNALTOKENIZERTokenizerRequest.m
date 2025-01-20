@interface SIRINLUINTERNALTOKENIZERTokenizerRequest
- (BOOL)hasAsrId;
- (BOOL)hasLocale;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (NSString)text;
- (SIRINLUEXTERNALUUID)asrId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setLocale:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALTOKENIZERTokenizerRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
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
  if (v4[3])
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerRequest setText:](self, "setText:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerRequest setLocale:](self, "setLocale:");
    v4 = v7;
  }
  asrId = self->_asrId;
  uint64_t v6 = v4[1];
  if (asrId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerRequest setAsrId:](self, "setAsrId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  NSUInteger v4 = [(NSString *)self->_locale hash] ^ v3;
  return v4 ^ [(SIRINLUEXTERNALUUID *)self->_asrId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((text = self->_text, !((unint64_t)text | v4[3])) || -[NSString isEqual:](text, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    asrId = self->_asrId;
    if ((unint64_t)asrId | v4[1]) {
      char v8 = -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

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
  if (self->_locale)
  {
    objc_msgSend(v5, "setLocale:");
    id v4 = v5;
  }
  if (self->_asrId)
  {
    objc_msgSend(v5, "setAsrId:");
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
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_asrId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTOKENIZERTokenizerRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  asrId = self->_asrId;
  if (asrId)
  {
    uint64_t v8 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"asrId"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALTOKENIZERTokenizerRequest;
  id v4 = [(SIRINLUINTERNALTOKENIZERTokenizerRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALTOKENIZERTokenizerRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

@end