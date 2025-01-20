@interface FCCKPDateStatistics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPDateStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modification, 0);
  objc_storeStrong((id *)&self->_creation, 0);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPDateStatistics;
  v4 = [(FCCKPDateStatistics *)&v8 description];
  v5 = [(FCCKPDateStatistics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  creation = self->_creation;
  if (creation)
  {
    v5 = [(FCCKPDate *)creation dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"creation"];
  }
  modification = self->_modification;
  if (modification)
  {
    v7 = [(FCCKPDate *)modification dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"modification"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPDateStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_creation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_modification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPDate *)self->_creation copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(FCCKPDate *)self->_modification copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((creation = self->_creation, !((unint64_t)creation | v4[1]))
     || -[FCCKPDate isEqual:](creation, "isEqual:")))
  {
    modification = self->_modification;
    if ((unint64_t)modification | v4[2]) {
      char v7 = -[FCCKPDate isEqual:](modification, "isEqual:");
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
  unint64_t v3 = [(FCCKPDate *)self->_creation hash];
  return [(FCCKPDate *)self->_modification hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  id v5 = (void *)v3[1];
  char v7 = v3;
  if (v4)
  {
    if (v5)
    {
      -[FCCKPDate mergeFrom:](v4, v5);
LABEL_7:
      unint64_t v3 = v7;
    }
  }
  else if (v5)
  {
    objc_storeStrong((id *)(a1 + 8), v5);
    goto LABEL_7;
  }
  id v6 = (void *)v3[2];
  if (*(void *)(a1 + 16))
  {
    if (!v6) {
      goto LABEL_14;
    }
    -[FCCKPDate mergeFrom:](*(void *)(a1 + 16), v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    objc_storeStrong((id *)(a1 + 16), v6);
  }
  unint64_t v3 = v7;
LABEL_14:
}

@end