@interface PDURLSessionProxyCreateSession
- (BOOL)delegateImplementsDidReceiveResponse;
- (BOOL)delegateImplementsSessionAuthChallenge;
- (BOOL)delegateImplementsTaskAuthChallenge;
- (BOOL)delegateImplementsWillPerformRedirection;
- (BOOL)delegateImplementsWillSendRequest;
- (BOOL)hasConfiguration;
- (BOOL)hasDelegateImplementsDidReceiveResponse;
- (BOOL)hasDelegateImplementsSessionAuthChallenge;
- (BOOL)hasDelegateImplementsTaskAuthChallenge;
- (BOOL)hasDelegateImplementsWillPerformRedirection;
- (BOOL)hasDelegateImplementsWillSendRequest;
- (BOOL)hasSession;
- (BOOL)hasSupportsRedirects;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsRedirects;
- (NSData)configuration;
- (NSURLSessionConfiguration)_actualConfiguration;
- (PDURLSessionProxySessionMessage)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_setActualConfiguration:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegateImplementsDidReceiveResponse:(BOOL)a3;
- (void)setDelegateImplementsSessionAuthChallenge:(BOOL)a3;
- (void)setDelegateImplementsTaskAuthChallenge:(BOOL)a3;
- (void)setDelegateImplementsWillPerformRedirection:(BOOL)a3;
- (void)setDelegateImplementsWillSendRequest:(BOOL)a3;
- (void)setHasDelegateImplementsDidReceiveResponse:(BOOL)a3;
- (void)setHasDelegateImplementsSessionAuthChallenge:(BOOL)a3;
- (void)setHasDelegateImplementsTaskAuthChallenge:(BOOL)a3;
- (void)setHasDelegateImplementsWillPerformRedirection:(BOOL)a3;
- (void)setHasDelegateImplementsWillSendRequest:(BOOL)a3;
- (void)setHasSupportsRedirects:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSupportsRedirects:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyCreateSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (BOOL)delegateImplementsDidReceiveResponse
{
  return self->_delegateImplementsDidReceiveResponse;
}

- (BOOL)delegateImplementsWillPerformRedirection
{
  return self->_delegateImplementsWillPerformRedirection;
}

- (BOOL)delegateImplementsTaskAuthChallenge
{
  return self->_delegateImplementsTaskAuthChallenge;
}

- (BOOL)delegateImplementsSessionAuthChallenge
{
  return self->_delegateImplementsSessionAuthChallenge;
}

- (BOOL)delegateImplementsWillSendRequest
{
  return self->_delegateImplementsWillSendRequest;
}

- (BOOL)supportsRedirects
{
  return self->_supportsRedirects;
}

- (void)setConfiguration:(id)a3
{
}

- (NSData)configuration
{
  return self->_configuration;
}

- (void)setSession:(id)a3
{
}

- (PDURLSessionProxySessionMessage)session
{
  return self->_session;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  session = self->_session;
  uint64_t v6 = *((void *)v4 + 2);
  id v8 = v4;
  if (session)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxyCreateSession setSession:](self, "setSession:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[PDURLSessionProxyCreateSession setConfiguration:](self, "setConfiguration:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 0x20) != 0)
  {
    self->_supportsRedirects = *((unsigned char *)v4 + 29);
    *(unsigned char *)&self->_has |= 0x20u;
    char v7 = *((unsigned char *)v4 + 32);
    if ((v7 & 0x10) == 0)
    {
LABEL_11:
      if ((v7 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_delegateImplementsWillSendRequest = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 0x10u;
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_delegateImplementsSessionAuthChallenge = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_delegateImplementsTaskAuthChallenge = *((unsigned char *)v4 + 26);
  *(unsigned char *)&self->_has |= 4u;
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 8) == 0)
  {
LABEL_14:
    if ((v7 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  self->_delegateImplementsWillPerformRedirection = *((unsigned char *)v4 + 27);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_15:
    self->_delegateImplementsDidReceiveResponse = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_16:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxySessionMessage *)self->_session hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_configuration hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v5 = 2654435761 * self->_supportsRedirects;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_delegateImplementsWillSendRequest;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_delegateImplementsSessionAuthChallenge;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_delegateImplementsTaskAuthChallenge;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_11:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_delegateImplementsWillPerformRedirection;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_delegateImplementsDidReceiveResponse;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  session = self->_session;
  if ((unint64_t)session | *((void *)v4 + 2))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")) {
      goto LABEL_48;
    }
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](configuration, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0) {
      goto LABEL_48;
    }
    if (self->_supportsRedirects)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_delegateImplementsWillSendRequest)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_48;
    }
    if (self->_delegateImplementsSessionAuthChallenge)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_48;
    }
    if (self->_delegateImplementsTaskAuthChallenge)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_48;
    }
    if (self->_delegateImplementsWillPerformRedirection)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_48;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 32))
    {
      if (self->_delegateImplementsDidReceiveResponse)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_48;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_48;
      }
      BOOL v7 = 1;
      goto LABEL_49;
    }
LABEL_48:
    BOOL v7 = 0;
  }
LABEL_49:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxySessionMessage *)self->_session copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_configuration copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v5 + 29) = self->_supportsRedirects;
    *((unsigned char *)v5 + 32) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 28) = self->_delegateImplementsWillSendRequest;
  *((unsigned char *)v5 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)v5 + 25) = self->_delegateImplementsSessionAuthChallenge;
  *((unsigned char *)v5 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *((unsigned char *)v5 + 27) = self->_delegateImplementsWillPerformRedirection;
    *((unsigned char *)v5 + 32) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *((unsigned char *)v5 + 26) = self->_delegateImplementsTaskAuthChallenge;
  *((unsigned char *)v5 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if (has)
  {
LABEL_7:
    *((unsigned char *)v5 + 24) = self->_delegateImplementsDidReceiveResponse;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_session)
  {
    [v4 setSession:];
    id v4 = v6;
  }
  if (self->_configuration)
  {
    [v6 setConfiguration:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[29] = self->_supportsRedirects;
    v4[32] |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v4[28] = self->_delegateImplementsWillSendRequest;
  v4[32] |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[25] = self->_delegateImplementsSessionAuthChallenge;
  v4[32] |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[26] = self->_delegateImplementsTaskAuthChallenge;
  v4[32] |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v4[27] = self->_delegateImplementsWillPerformRedirection;
  v4[32] |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    v4[24] = self->_delegateImplementsDidReceiveResponse;
    v4[32] |= 1u;
  }
LABEL_12:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_session)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_configuration)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    p_info = &OBJC_METACLASS___PDURLSessionProxyGetAuthHeadersReply.info;
    id v6 = &selRef__actualError;
    BOOL v7 = &selRef__actualError;
    do
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v11 == -1 || v11 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v12 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v11);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v11 + 1;
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v13 = v9++ >= 9;
        if (v13)
        {
          unint64_t v10 = 0;
          int v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      int v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v14 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          v16 = v7;
          v17 = v6;
          v18 = p_info;
          id v19 = objc_alloc_init((Class)(p_info + 501));
          objc_storeStrong((id *)&self->_session, v19);
          if PBReaderPlaceMark() && (sub_10006494C((uint64_t)v19, (uint64_t)a3))
          {
            PBReaderRecallMark();

            p_info = v18;
            id v6 = v17;
            BOOL v7 = v16;
            continue;
          }

          LOBYTE(v20) = 0;
          return v20;
        case 2u:
          uint64_t v21 = PBReaderReadData();
          uint64_t v22 = *((int *)v6 + 435);
          v23 = *(void **)&self->PBCodable_opaque[v22];
          *(void *)&self->PBCodable_opaque[v22] = v21;

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 0x20u;
          while (2)
          {
            unint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v27 == -1 || v27 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
              v26 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v13 = v25++ >= 9;
                if (v13)
                {
                  uint64_t v26 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v26 = 0;
          }
LABEL_70:
          BOOL v54 = v26 != 0;
          uint64_t v55 = 29;
          goto LABEL_91;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 0x10u;
          while (2)
          {
            unint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v32 == -1 || v32 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
              v31 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v13 = v30++ >= 9;
                if (v13)
                {
                  uint64_t v31 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v31 = 0;
          }
LABEL_74:
          BOOL v54 = v31 != 0;
          uint64_t v55 = 28;
          goto LABEL_91;
        case 5u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 2u;
          while (2)
          {
            unint64_t v37 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v37 == -1 || v37 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
              v36 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v13 = v35++ >= 9;
                if (v13)
                {
                  uint64_t v36 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v36 = 0;
          }
LABEL_78:
          BOOL v54 = v36 != 0;
          uint64_t v55 = 25;
          goto LABEL_91;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 4u;
          while (2)
          {
            unint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v42 == -1 || v42 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
              v41 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v13 = v40++ >= 9;
                if (v13)
                {
                  uint64_t v41 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v41 = 0;
          }
LABEL_82:
          BOOL v54 = v41 != 0;
          uint64_t v55 = 26;
          goto LABEL_91;
        case 7u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 8u;
          while (2)
          {
            unint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v47 == -1 || v47 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
              v46 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v13 = v45++ >= 9;
                if (v13)
                {
                  uint64_t v46 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v46 = 0;
          }
LABEL_86:
          BOOL v54 = v46 != 0;
          uint64_t v55 = 27;
          goto LABEL_91;
        case 8u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          self->PBCodable_opaque[*((int *)v7 + 436)] |= 1u;
          break;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
      }
      while (1)
      {
        unint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v52 == -1 || v52 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
        v51 |= (unint64_t)(v53 & 0x7F) << v49;
        if ((v53 & 0x80) == 0) {
          goto LABEL_88;
        }
        v49 += 7;
        BOOL v13 = v50++ >= 9;
        if (v13)
        {
          uint64_t v51 = 0;
          goto LABEL_90;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_88:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v51 = 0;
      }
LABEL_90:
      BOOL v54 = v51 != 0;
      uint64_t v55 = 24;
LABEL_91:
      self->PBCodable_opaque[v55] = v54;
    }
    while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  session = self->_session;
  if (session)
  {
    uint64_t v5 = [(PDURLSessionProxySessionMessage *)session dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"session"];
  }
  configuration = self->_configuration;
  if (configuration) {
    [v3 setObject:configuration forKey:@"configuration"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    unint64_t v10 = +[NSNumber numberWithBool:self->_supportsRedirects];
    [v3 setObject:v10 forKey:@"supportsRedirects"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  unint64_t v11 = +[NSNumber numberWithBool:self->_delegateImplementsWillSendRequest];
  [v3 setObject:v11 forKey:@"delegateImplementsWillSendRequest"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  char v12 = +[NSNumber numberWithBool:self->_delegateImplementsSessionAuthChallenge];
  [v3 setObject:v12 forKey:@"delegateImplementsSessionAuthChallenge"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  BOOL v13 = +[NSNumber numberWithBool:self->_delegateImplementsTaskAuthChallenge];
  [v3 setObject:v13 forKey:@"delegateImplementsTaskAuthChallenge"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  int v14 = +[NSNumber numberWithBool:self->_delegateImplementsWillPerformRedirection];
  [v3 setObject:v14 forKey:@"delegateImplementsWillPerformRedirection"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    char v8 = +[NSNumber numberWithBool:self->_delegateImplementsDidReceiveResponse];
    [v3 setObject:v8 forKey:@"delegateImplementsDidReceiveResponse"];
  }
LABEL_12:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyCreateSession;
  unint64_t v3 = [(PDURLSessionProxyCreateSession *)&v7 description];
  id v4 = [(PDURLSessionProxyCreateSession *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasDelegateImplementsDidReceiveResponse
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDelegateImplementsDidReceiveResponse:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDelegateImplementsDidReceiveResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_delegateImplementsDidReceiveResponse = a3;
}

- (BOOL)hasDelegateImplementsWillPerformRedirection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDelegateImplementsWillPerformRedirection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setDelegateImplementsWillPerformRedirection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_delegateImplementsWillPerformRedirection = a3;
}

- (BOOL)hasDelegateImplementsTaskAuthChallenge
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDelegateImplementsTaskAuthChallenge:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDelegateImplementsTaskAuthChallenge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_delegateImplementsTaskAuthChallenge = a3;
}

- (BOOL)hasDelegateImplementsSessionAuthChallenge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDelegateImplementsSessionAuthChallenge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDelegateImplementsSessionAuthChallenge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_delegateImplementsSessionAuthChallenge = a3;
}

- (BOOL)hasDelegateImplementsWillSendRequest
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasDelegateImplementsWillSendRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setDelegateImplementsWillSendRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_delegateImplementsWillSendRequest = a3;
}

- (BOOL)hasSupportsRedirects
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasSupportsRedirects:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setSupportsRedirects:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_supportsRedirects = a3;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (void)_setActualConfiguration:(id)a3
{
  id v4 = +[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:a3];
  -[PDURLSessionProxyCreateSession setConfiguration:](self, "setConfiguration:");
}

- (NSURLSessionConfiguration)_actualConfiguration
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PDURLSessionProxyCreateSession *)self configuration];
  uint64_t v5 = +[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:v3 withData:v4];

  return (NSURLSessionConfiguration *)v5;
}

@end