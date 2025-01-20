@interface NPKProtoStandalonePaymentApplication
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasState:(BOOL)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentApplication

- (int)state
{
  if (*(unsigned char *)&self->_has) {
    return self->_state;
  }
  else {
    return 100;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 > 159)
  {
    if (a3 > 189)
    {
      switch(a3)
      {
        case 190:
          v4 = @"SuspendedCustom";
          return v4;
        case 200:
          v4 = @"RemovedByIssuer";
          return v4;
        case 250:
          v4 = @"InTermination";
          return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 160:
          v4 = @"SuspendedByIssuer";
          return v4;
        case 170:
          v4 = @"SuspendedLostMode";
          return v4;
        case 180:
          v4 = @"SuspendedPasscodeDisabled";
          return v4;
      }
    }
LABEL_52:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 > 129)
  {
    switch(a3)
    {
      case 130:
        v4 = @"RequiresVerification";
        return v4;
      case 140:
        v4 = @"PersonalizedRequiresVerification";
        return v4;
      case 150:
        v4 = @"VerificationTerminated";
        return v4;
    }
    goto LABEL_52;
  }
  switch(a3)
  {
    case 'd':
      v4 = @"PaymentApplicationStateUnknown";
      break;
    case 'n':
      v4 = @"Personalized";
      break;
    case 'x':
      v4 = @"Personalizing";
      return v4;
    default:
      goto LABEL_52;
  }
  return v4;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PaymentApplicationStateUnknown"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Personalized"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Personalizing"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"RequiresVerification"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"PersonalizedRequiresVerification"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"VerificationTerminated"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"SuspendedByIssuer"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"SuspendedLostMode"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"SuspendedPasscodeDisabled"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"SuspendedCustom"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"RemovedByIssuer"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"InTermination"])
  {
    int v4 = 250;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentApplication;
  int v4 = [(NPKProtoStandalonePaymentApplication *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentApplication *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int state = self->_state;
    if (state > 159)
    {
      if (state > 189)
      {
        switch(state)
        {
          case 190:
            v5 = @"SuspendedCustom";
            goto LABEL_30;
          case 200:
            v5 = @"RemovedByIssuer";
            goto LABEL_30;
          case 250:
            v5 = @"InTermination";
            goto LABEL_30;
        }
      }
      else
      {
        switch(state)
        {
          case 160:
            v5 = @"SuspendedByIssuer";
            goto LABEL_30;
          case 170:
            v5 = @"SuspendedLostMode";
            goto LABEL_30;
          case 180:
            v5 = @"SuspendedPasscodeDisabled";
            goto LABEL_30;
        }
      }
    }
    else if (state > 129)
    {
      switch(state)
      {
        case 130:
          v5 = @"RequiresVerification";
          goto LABEL_30;
        case 140:
          v5 = @"PersonalizedRequiresVerification";
          goto LABEL_30;
        case 150:
          v5 = @"VerificationTerminated";
          goto LABEL_30;
      }
    }
    else
    {
      switch(state)
      {
        case 'd':
          v5 = @"PaymentApplicationStateUnknown";
          goto LABEL_30;
        case 'n':
          v5 = @"Personalized";
          goto LABEL_30;
        case 'x':
          v5 = @"Personalizing";
LABEL_30:
          [v3 setObject:v5 forKey:@"state"];

          goto LABEL_31;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_31:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentApplicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_state;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_state;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_state == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_state;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_int state = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end