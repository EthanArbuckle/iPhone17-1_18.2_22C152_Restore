@interface SIRINLUINTERNALPlanOverrideValue
- (BOOL)hasPlan;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)plan;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlan:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALPlanOverrideValue

- (void).cxx_destruct
{
}

- (void)setPlan:(id)a3
{
}

- (NSString)plan
{
  return self->_plan;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SIRINLUINTERNALPlanOverrideValue setPlan:](self, "setPlan:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_plan hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    plan = self->_plan;
    if ((unint64_t)plan | v4[1]) {
      char v6 = -[NSString isEqual:](plan, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_plan copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  plan = self->_plan;
  if (plan) {
    [a3 setPlan:plan];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_plan) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPlanOverrideValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  plan = self->_plan;
  if (plan) {
    [v3 setObject:plan forKey:@"plan"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALPlanOverrideValue;
  v4 = [(SIRINLUINTERNALPlanOverrideValue *)&v8 description];
  v5 = [(SIRINLUINTERNALPlanOverrideValue *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPlan
{
  return self->_plan != 0;
}

@end