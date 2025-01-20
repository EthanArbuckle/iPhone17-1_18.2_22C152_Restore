@interface SIRINLUINTERNALCCQROverrideTemplate
- (BOOL)hasRewriteMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALRewriteMessage)rewriteMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRewriteMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCCQROverrideTemplate

- (void).cxx_destruct
{
}

- (void)setRewriteMessage:(id)a3
{
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMessage
{
  return self->_rewriteMessage;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  rewriteMessage = self->_rewriteMessage;
  uint64_t v6 = v4[1];
  if (rewriteMessage)
  {
    if (v6) {
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewriteMessage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALCCQROverrideTemplate setRewriteMessage:](self, "setRewriteMessage:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALRewriteMessage *)self->_rewriteMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    rewriteMessage = self->_rewriteMessage;
    if ((unint64_t)rewriteMessage | v4[1]) {
      char v6 = -[SIRINLUEXTERNALRewriteMessage isEqual:](rewriteMessage, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALRewriteMessage *)self->_rewriteMessage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  rewriteMessage = self->_rewriteMessage;
  if (rewriteMessage) {
    [a3 setRewriteMessage:rewriteMessage];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_rewriteMessage) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCCQROverrideTemplateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  rewriteMessage = self->_rewriteMessage;
  if (rewriteMessage)
  {
    v5 = [(SIRINLUEXTERNALRewriteMessage *)rewriteMessage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"rewrite_message"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCCQROverrideTemplate;
  v4 = [(SIRINLUINTERNALCCQROverrideTemplate *)&v8 description];
  v5 = [(SIRINLUINTERNALCCQROverrideTemplate *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRewriteMessage
{
  return self->_rewriteMessage != 0;
}

@end