@interface ATXPBProactiveSuggestion
- (BOOL)hasClientModelSpecification;
- (BOOL)hasExecutableSpecification;
- (BOOL)hasScoreSpecification;
- (BOOL)hasUiSpecification;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)clientModelSpecification;
- (uint64_t)executableSpecification;
- (uint64_t)scoreSpecification;
- (uint64_t)uiSpecification;
- (uint64_t)uuidString;
- (unint64_t)hash;
- (void)copyTo:(void *)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setClientModelSpecification:(uint64_t)a1;
- (void)setExecutableSpecification:(uint64_t)a1;
- (void)setScoreSpecification:(uint64_t)a1;
- (void)setUiSpecification:(uint64_t)a1;
- (void)setUuidString:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_uiSpecification, 0);
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableSpecification, 0);
  objc_storeStrong((id *)&self->_clientModelSpecification, 0);
}

- (uint64_t)uuidString
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)uiSpecification
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)scoreSpecification
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)hasUuidString
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)executableSpecification
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)clientModelSpecification
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (BOOL)hasClientModelSpecification
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (BOOL)hasExecutableSpecification
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (BOOL)hasUiSpecification
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (BOOL)hasScoreSpecification
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestion;
  v4 = [(ATXPBProactiveSuggestion *)&v8 description];
  v5 = [(ATXPBProactiveSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  clientModelSpecification = self->_clientModelSpecification;
  if (clientModelSpecification)
  {
    v7 = [(ATXPBProactiveSuggestionClientModelSpecification *)clientModelSpecification dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"clientModelSpecification"];
  }
  executableSpecification = self->_executableSpecification;
  if (executableSpecification)
  {
    v9 = [(ATXPBProactiveSuggestionExecutableSpecification *)executableSpecification dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"executableSpecification"];
  }
  uiSpecification = self->_uiSpecification;
  if (uiSpecification)
  {
    v11 = [(ATXPBProactiveSuggestionUISpecification *)uiSpecification dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"uiSpecification"];
  }
  scoreSpecification = self->_scoreSpecification;
  if (scoreSpecification)
  {
    v13 = [(ATXPBProactiveSuggestionScoreSpecification *)scoreSpecification dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"scoreSpecification"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientModelSpecification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_executableSpecification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uiSpecification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(void *)a1
{
  id v8 = a2;
  if (a1)
  {
    v3 = (void *)a1[5];
    if (v3) {
      -[ATXPBProactiveSuggestion setUuidString:]((uint64_t)v8, v3);
    }
    id v4 = (void *)a1[1];
    if (v4) {
      -[ATXPBProactiveSuggestion setClientModelSpecification:]((uint64_t)v8, v4);
    }
    id v5 = (void *)a1[2];
    if (v5) {
      -[ATXPBProactiveSuggestion setExecutableSpecification:]((uint64_t)v8, v5);
    }
    v6 = (void *)a1[4];
    if (v6) {
      -[ATXPBProactiveSuggestion setUiSpecification:]((uint64_t)v8, v6);
    }
    v7 = (void *)a1[3];
    if (v7) {
      -[ATXPBProactiveSuggestion setScoreSpecification:]((uint64_t)v8, v7);
    }
  }
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setClientModelSpecification:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setExecutableSpecification:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setUiSpecification:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setScoreSpecification:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(ATXPBProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(ATXPBProactiveSuggestionExecutableSpecification *)self->_executableSpecification copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(ATXPBProactiveSuggestionUISpecification *)self->_uiSpecification copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(ATXPBProactiveSuggestionScoreSpecification *)self->_scoreSpecification copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[5]))
     || -[NSString isEqual:](uuidString, "isEqual:"))
    && ((clientModelSpecification = self->_clientModelSpecification,
         !((unint64_t)clientModelSpecification | v4[1]))
     || -[ATXPBProactiveSuggestionClientModelSpecification isEqual:](clientModelSpecification, "isEqual:"))
    && ((executableSpecification = self->_executableSpecification, !((unint64_t)executableSpecification | v4[2]))
     || -[ATXPBProactiveSuggestionExecutableSpecification isEqual:](executableSpecification, "isEqual:"))
    && ((uiSpecification = self->_uiSpecification, !((unint64_t)uiSpecification | v4[4]))
     || -[ATXPBProactiveSuggestionUISpecification isEqual:](uiSpecification, "isEqual:")))
  {
    scoreSpecification = self->_scoreSpecification;
    if ((unint64_t)scoreSpecification | v4[3]) {
      char v10 = -[ATXPBProactiveSuggestionScoreSpecification isEqual:](scoreSpecification, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  unint64_t v4 = [(ATXPBProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification hash] ^ v3;
  unint64_t v5 = [(ATXPBProactiveSuggestionExecutableSpecification *)self->_executableSpecification hash];
  unint64_t v6 = v4 ^ v5 ^ [(ATXPBProactiveSuggestionUISpecification *)self->_uiSpecification hash];
  return v6 ^ [(ATXPBProactiveSuggestionScoreSpecification *)self->_scoreSpecification hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  unint64_t v4 = v3;
  if (!a1) {
    goto LABEL_28;
  }
  unint64_t v5 = (void *)v3[5];
  char v10 = v3;
  if (v5)
  {
    objc_storeStrong((id *)(a1 + 40), v5);
    unint64_t v4 = v10;
  }
  unint64_t v6 = (void *)v4[1];
  if (*(void *)(a1 + 8))
  {
    if (!v6) {
      goto LABEL_10;
    }
    -[ATXPBProactiveSuggestionClientModelSpecification mergeFrom:](*(void *)(a1 + 8), v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)(a1 + 8), v6);
  }
  unint64_t v4 = v10;
LABEL_10:
  v7 = (void *)v4[2];
  if (*(void *)(a1 + 16))
  {
    if (!v7) {
      goto LABEL_16;
    }
    -[ATXPBProactiveSuggestionExecutableSpecification mergeFrom:](*(void *)(a1 + 16), v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_16;
    }
    objc_storeStrong((id *)(a1 + 16), v7);
  }
  unint64_t v4 = v10;
LABEL_16:
  id v8 = (void *)v4[4];
  if (*(void *)(a1 + 32))
  {
    if (v8)
    {
      -[ATXPBProactiveSuggestionUISpecification mergeFrom:](*(void *)(a1 + 32), v8);
LABEL_21:
      unint64_t v4 = v10;
    }
  }
  else if (v8)
  {
    objc_storeStrong((id *)(a1 + 32), v8);
    goto LABEL_21;
  }
  v9 = (void *)v4[3];
  if (*(void *)(a1 + 24))
  {
    if (!v9) {
      goto LABEL_28;
    }
    -[ATXPBProactiveSuggestionScoreSpecification mergeFrom:](*(void *)(a1 + 24), v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_28;
    }
    objc_storeStrong((id *)(a1 + 24), v9);
  }
  unint64_t v4 = v10;
LABEL_28:
}

@end