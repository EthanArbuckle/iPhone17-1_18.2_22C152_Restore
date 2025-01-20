@interface WFREPBRunRequestProgress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)runRequestIdentifier;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRunRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBRunRequestProgress

- (void).cxx_destruct
{
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setRunRequestIdentifier:(id)a3
{
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[WFREPBRunRequestProgress setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
    v4 = v5;
  }
  self->_progress = v4[1];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_runRequestIdentifier hash];
  double progress = self->_progress;
  double v5 = -progress;
  if (progress >= 0.0) {
    double v5 = self->_progress;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  double v10 = fabs(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((runRequestIdentifier = self->_runRequestIdentifier,
         !((unint64_t)runRequestIdentifier | *((void *)v4 + 2)))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:"))
    && self->_progress == *((double *)v4 + 1);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_runRequestIdentifier copyWithZone:a3];
  double v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_progress;
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  runRequestIdentifier = self->_runRequestIdentifier;
  uint64_t v5 = (double *)a3;
  [v5 setRunRequestIdentifier:runRequestIdentifier];
  v5[1] = self->_progress;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_runRequestIdentifier) {
    __assert_rtn("-[WFREPBRunRequestProgress writeTo:]", "WFREPBRunRequestProgress.m", 79, "nil != self->_runRequestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestProgressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier) {
    [v3 setObject:runRequestIdentifier forKey:@"runRequestIdentifier"];
  }
  uint64_t v6 = [NSNumber numberWithDouble:self->_progress];
  [v4 setObject:v6 forKey:@"progress"];

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequestProgress;
  id v4 = [(WFREPBRunRequestProgress *)&v8 description];
  id v5 = [(WFREPBRunRequestProgress *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end