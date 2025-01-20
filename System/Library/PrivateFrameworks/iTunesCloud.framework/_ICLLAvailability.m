@interface _ICLLAvailability
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLAvailability

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_autoPlay;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_6;
  }
  BOOL v5 = (v4[60] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[60] & 1) == 0)
    {
LABEL_6:
      BOOL v5 = 0;
      goto LABEL_7;
    }
    if (self->_autoPlay)
    {
      if (!v4[56]) {
        goto LABEL_6;
      }
    }
    else if (v4[56])
    {
      goto LABEL_6;
    }
    BOOL v5 = 1;
  }
LABEL_7:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    v4[56] = self->_autoPlay;
    v4[60] |= 1u;
  }
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_repeatModes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_repeatModes.count);
  }
  if (self->_shuffleModes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_shuffleModes.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLAvailabilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = PBRepeatedInt32NSArray();
  [v3 setObject:v4 forKey:@"repeatMode"];

  unint64_t v5 = PBRepeatedInt32NSArray();
  [v3 setObject:v5 forKey:@"shuffleMode"];

  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = [NSNumber numberWithBool:self->_autoPlay];
    [v3 setObject:v6 forKey:@"autoPlay"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLAvailability;
  id v4 = [(_ICLLAvailability *)&v8 description];
  unint64_t v5 = [(_ICLLAvailability *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_ICLLAvailability;
  [(_ICLLAvailability *)&v3 dealloc];
}

@end