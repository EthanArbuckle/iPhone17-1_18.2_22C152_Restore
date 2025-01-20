@interface AWDProactiveModelFittingModelInfoStatsPair
- (AWDProactiveModelFittingMinibatchStats)stats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (BOOL)hasModelInfo;
- (BOOL)hasStats;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingModelInfoStatsPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

- (void)setStats:(id)a3
{
}

- (AWDProactiveModelFittingMinibatchStats)stats
{
  return self->_stats;
}

- (void)setModelInfo:(id)a3
{
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  modelInfo = self->_modelInfo;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (modelInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[AWDProactiveModelFittingModelInfoStatsPair setModelInfo:](self, "setModelInfo:");
  }
  v4 = v9;
LABEL_7:
  stats = self->_stats;
  uint64_t v8 = v4[2];
  if (stats)
  {
    if (v8) {
      -[AWDProactiveModelFittingMinibatchStats mergeFrom:](stats, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDProactiveModelFittingModelInfoStatsPair setStats:](self, "setStats:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo hash];
  return [(AWDProactiveModelFittingMinibatchStats *)self->_stats hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((modelInfo = self->_modelInfo, !((unint64_t)modelInfo | v4[1]))
     || -[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:")))
  {
    stats = self->_stats;
    if ((unint64_t)stats | v4[2]) {
      char v7 = -[AWDProactiveModelFittingMinibatchStats isEqual:](stats, "isEqual:");
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
  id v6 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(AWDProactiveModelFittingMinibatchStats *)self->_stats copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    id v4 = v5;
  }
  if (self->_stats)
  {
    objc_msgSend(v5, "setStats:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_stats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingModelInfoStatsPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    id v5 = [(AWDProactiveModelFittingModelInfo *)modelInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"modelInfo"];
  }
  stats = self->_stats;
  if (stats)
  {
    char v7 = [(AWDProactiveModelFittingMinibatchStats *)stats dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"stats"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingModelInfoStatsPair;
  id v4 = [(AWDProactiveModelFittingModelInfoStatsPair *)&v8 description];
  id v5 = [(AWDProactiveModelFittingModelInfoStatsPair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStats
{
  return self->_stats != 0;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

@end