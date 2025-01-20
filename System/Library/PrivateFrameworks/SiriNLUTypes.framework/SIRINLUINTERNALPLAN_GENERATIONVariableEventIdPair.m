@interface SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair
- (BOOL)hasEventId;
- (BOOL)hasVariable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventId;
- (NSString)variable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventId:(id)a3;
- (void)setVariable:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
}

- (void)setEventId:(id)a3
{
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setVariable:(id)a3
{
}

- (NSString)variable
{
  return self->_variable;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair setVariable:](self, "setVariable:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair setEventId:](self, "setEventId:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_variable hash];
  return [(NSString *)self->_eventId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((variable = self->_variable, !((unint64_t)variable | v4[2]))
     || -[NSString isEqual:](variable, "isEqual:")))
  {
    eventId = self->_eventId;
    if ((unint64_t)eventId | v4[1]) {
      char v7 = -[NSString isEqual:](eventId, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_variable copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_eventId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_variable)
  {
    objc_msgSend(v4, "setVariable:");
    id v4 = v5;
  }
  if (self->_eventId)
  {
    objc_msgSend(v5, "setEventId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_variable)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  variable = self->_variable;
  if (variable) {
    [v3 setObject:variable forKey:@"variable"];
  }
  eventId = self->_eventId;
  if (eventId) {
    [v4 setObject:eventId forKey:@"eventId"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair;
  id v4 = [(SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair *)&v8 description];
  id v5 = [(SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (BOOL)hasVariable
{
  return self->_variable != 0;
}

@end