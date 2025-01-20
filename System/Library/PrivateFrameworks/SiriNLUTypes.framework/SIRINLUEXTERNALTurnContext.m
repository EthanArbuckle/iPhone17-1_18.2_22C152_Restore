@interface SIRINLUEXTERNALTurnContext
- (BOOL)hasLegacyNlContext;
- (BOOL)hasNlContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALLegacyNLContext)legacyNlContext;
- (SIRINLUEXTERNALNLContext)nlContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLegacyNlContext:(id)a3;
- (void)setNlContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALTurnContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlContext, 0);
  objc_storeStrong((id *)&self->_legacyNlContext, 0);
}

- (void)setLegacyNlContext:(id)a3
{
}

- (SIRINLUEXTERNALLegacyNLContext)legacyNlContext
{
  return self->_legacyNlContext;
}

- (void)setNlContext:(id)a3
{
}

- (SIRINLUEXTERNALNLContext)nlContext
{
  return self->_nlContext;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  nlContext = self->_nlContext;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (nlContext)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALTurnContext setNlContext:](self, "setNlContext:");
  }
  v4 = v9;
LABEL_7:
  legacyNlContext = self->_legacyNlContext;
  uint64_t v8 = v4[1];
  if (legacyNlContext)
  {
    if (v8) {
      -[SIRINLUEXTERNALLegacyNLContext mergeFrom:](legacyNlContext, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALTurnContext setLegacyNlContext:](self, "setLegacyNlContext:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALNLContext *)self->_nlContext hash];
  return [(SIRINLUEXTERNALLegacyNLContext *)self->_legacyNlContext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[2]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:")))
  {
    legacyNlContext = self->_legacyNlContext;
    if ((unint64_t)legacyNlContext | v4[1]) {
      char v7 = -[SIRINLUEXTERNALLegacyNLContext isEqual:](legacyNlContext, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALNLContext *)self->_nlContext copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALLegacyNLContext *)self->_legacyNlContext copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nlContext)
  {
    objc_msgSend(v4, "setNlContext:");
    id v4 = v5;
  }
  if (self->_legacyNlContext)
  {
    objc_msgSend(v5, "setLegacyNlContext:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nlContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_legacyNlContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALTurnContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  nlContext = self->_nlContext;
  if (nlContext)
  {
    id v5 = [(SIRINLUEXTERNALNLContext *)nlContext dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"nl_context"];
  }
  legacyNlContext = self->_legacyNlContext;
  if (legacyNlContext)
  {
    char v7 = [(SIRINLUEXTERNALLegacyNLContext *)legacyNlContext dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"legacy_nl_context"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALTurnContext;
  id v4 = [(SIRINLUEXTERNALTurnContext *)&v8 description];
  id v5 = [(SIRINLUEXTERNALTurnContext *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLegacyNlContext
{
  return self->_legacyNlContext != 0;
}

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

@end