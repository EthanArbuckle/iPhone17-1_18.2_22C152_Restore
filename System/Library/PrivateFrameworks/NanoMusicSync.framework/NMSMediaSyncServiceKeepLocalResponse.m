@interface NMSMediaSyncServiceKeepLocalResponse
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorCodeAsString:(int)a3;
- (id)validatorExceptionsAsString:(int)a3;
- (int)StringAsErrorCode:(id)a3;
- (int)StringAsValidatorExceptions:(id)a3;
- (int)errorCode;
- (int)validatorExceptionAtIndex:(unint64_t)a3;
- (int)validatorExceptions;
- (unint64_t)hash;
- (unint64_t)validatorExceptionsCount;
- (void)addValidatorException:(int)a3;
- (void)clearValidatorExceptions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setValidatorExceptions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NMSMediaSyncServiceKeepLocalResponse

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSyncServiceKeepLocalResponse;
  [(NMSMediaSyncServiceKeepLocalResponse *)&v3 dealloc];
}

- (int)errorCode
{
  if (*(unsigned char *)&self->_has) {
    return self->_errorCode;
  }
  else {
    return 0;
  }
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)errorCodeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"ValidatorException";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Generic";
  }
  return v4;
}

- (int)StringAsErrorCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Generic"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ValidatorException"];
  }

  return v4;
}

- (unint64_t)validatorExceptionsCount
{
  return self->_validatorExceptions.count;
}

- (int)validatorExceptions
{
  return self->_validatorExceptions.list;
}

- (void)clearValidatorExceptions
{
}

- (void)addValidatorException:(int)a3
{
}

- (int)validatorExceptionAtIndex:(unint64_t)a3
{
  p_validatorExceptions = &self->_validatorExceptions;
  unint64_t count = self->_validatorExceptions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_validatorExceptions->list[a3];
}

- (void)setValidatorExceptions:(int *)a3 count:(unint64_t)a4
{
}

- (id)validatorExceptionsAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264633B50[a3 - 1];
  }

  return v3;
}

- (int)StringAsValidatorExceptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ExceedsPowerThreshold"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ExceedsCellularPowerThreshold"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CellularDownloadNotAllowed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NoNetwork"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NoStorage"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CellularDataNotAllowed"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalResponse;
  int v4 = [(NMSMediaSyncServiceKeepLocalResponse *)&v8 description];
  v5 = [(NMSMediaSyncServiceKeepLocalResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int errorCode = self->_errorCode;
    if (errorCode)
    {
      if (errorCode == 1)
      {
        v5 = @"ValidatorException";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_errorCode);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"Generic";
    }
    [v3 setObject:v5 forKey:@"errorCode"];
  }
  p_validatorExceptions = &self->_validatorExceptions;
  if (self->_validatorExceptions.count)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (p_validatorExceptions->count)
    {
      unint64_t v8 = 0;
      do
      {
        unsigned int v9 = p_validatorExceptions->list[v8] - 1;
        if (v9 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_validatorExceptions->list[v8]);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = off_264633B50[v9];
        }
        [v7 addObject:v10];

        ++v8;
      }
      while (v8 < p_validatorExceptions->count);
    }
    [v3 setObject:v7 forKey:@"validatorException"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  p_validatorExceptions = &self->_validatorExceptions;
  if (p_validatorExceptions->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_validatorExceptions->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_errorCode;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v8 = v4;
  if ([(NMSMediaSyncServiceKeepLocalResponse *)self validatorExceptionsCount])
  {
    [v8 clearValidatorExceptions];
    unint64_t v5 = [(NMSMediaSyncServiceKeepLocalResponse *)self validatorExceptionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addValidatorException:", -[NMSMediaSyncServiceKeepLocalResponse validatorExceptionAtIndex:](self, "validatorExceptionAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v4 + 32) = self->_errorCode;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 8)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v2 = 0;
  }
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[9])
  {
    self->_int errorCode = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v8 = v4;
  uint64_t v5 = [v4 validatorExceptionsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NMSMediaSyncServiceKeepLocalResponse addValidatorException:](self, "addValidatorException:", [v8 validatorExceptionAtIndex:i]);
  }
}

@end