@interface AWDSpringBoardSwitcherPresentationInteraction
- (BOOL)didCommit;
- (BOOL)hasDidCommit;
- (BOOL)hasSource;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDidCommit:(BOOL)a3;
- (void)setHasDidCommit:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardSwitcherPresentationInteraction

- (void)dealloc
{
  [(AWDSpringBoardSwitcherPresentationInteraction *)self setSource:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherPresentationInteraction;
  [(AWDSpringBoardSwitcherPresentationInteraction *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setDidCommit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didCommit = a3;
}

- (void)setHasDidCommit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidCommit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherPresentationInteraction;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardSwitcherPresentationInteraction description](&v3, sel_description), -[AWDSpringBoardSwitcherPresentationInteraction dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_didCommit] forKey:@"didCommit"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSwitcherPresentationInteractionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_source) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if (self->_source) {
    [a3 setSource:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)a3 + 24) = self->_didCommit;
    *((unsigned char *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_source copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 24) = self->_didCommit;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
      goto LABEL_12;
    }
    source = self->_source;
    if ((unint64_t)source | *((void *)a3 + 2))
    {
      int v5 = -[NSString isEqual:](source, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0)
      {
LABEL_12:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_didCommit)
      {
        if (!*((unsigned char *)a3 + 24)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)a3 + 24))
      {
        goto LABEL_12;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_source hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_didCommit;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDSpringBoardSwitcherPresentationInteraction setSource:](self, "setSource:");
  }
  if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    self->_didCommit = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)didCommit
{
  return self->_didCommit;
}

@end