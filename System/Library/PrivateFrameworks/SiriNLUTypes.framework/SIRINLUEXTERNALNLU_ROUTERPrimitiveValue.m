@interface SIRINLUEXTERNALNLU_ROUTERPrimitiveValue
- (BOOL)hasApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALNLU_ROUTERApp)app;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERPrimitiveValue

- (void).cxx_destruct
{
}

- (void)setApp:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERApp)app
{
  return self->_app;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  app = self->_app;
  uint64_t v6 = v4[1];
  if (app)
  {
    if (v6) {
      -[SIRINLUEXTERNALNLU_ROUTERApp mergeFrom:](app, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue setApp:](self, "setApp:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALNLU_ROUTERApp *)self->_app hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    app = self->_app;
    if ((unint64_t)app | v4[1]) {
      char v6 = -[SIRINLUEXTERNALNLU_ROUTERApp isEqual:](app, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALNLU_ROUTERApp *)self->_app copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  app = self->_app;
  if (app) {
    [a3 setApp:app];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_app) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERPrimitiveValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  app = self->_app;
  if (app)
  {
    v5 = [(SIRINLUEXTERNALNLU_ROUTERApp *)app dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"app"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERPrimitiveValue;
  v4 = [(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *)&v8 description];
  v5 = [(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasApp
{
  return self->_app != 0;
}

@end