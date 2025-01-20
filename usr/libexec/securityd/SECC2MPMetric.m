@interface SECC2MPMetric
- (BOOL)hasCloudkitInfo;
- (BOOL)hasDeviceInfo;
- (BOOL)hasGenericEvent;
- (BOOL)hasMetricType;
- (BOOL)hasNetworkEvent;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasServerInfo;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SECC2MPCloudKitInfo)cloudkitInfo;
- (SECC2MPDeviceInfo)deviceInfo;
- (SECC2MPGenericEvent)genericEvent;
- (SECC2MPNetworkEvent)networkEvent;
- (SECC2MPServerInfo)serverInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricTypeAsString:(int)a3;
- (int)StringAsMetricType:(id)a3;
- (int)metricType;
- (unint64_t)hash;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)triggers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudkitInfo:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setGenericEvent:(id)a3;
- (void)setHasMetricType:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setMetricType:(int)a3;
- (void)setNetworkEvent:(id)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setServerInfo:(id)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_genericEvent, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_cloudkitInfo, 0);
}

- (void)setGenericEvent:(id)a3
{
}

- (SECC2MPGenericEvent)genericEvent
{
  return self->_genericEvent;
}

- (void)setNetworkEvent:(id)a3
{
}

- (SECC2MPNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (void)setServerInfo:(id)a3
{
}

- (SECC2MPServerInfo)serverInfo
{
  return self->_serverInfo;
}

- (void)setCloudkitInfo:(id)a3
{
}

- (SECC2MPCloudKitInfo)cloudkitInfo
{
  return self->_cloudkitInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (SECC2MPDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if ((v4[20] & 8) != 0)
  {
    self->_metricType = v4[14];
    *(unsigned char *)&self->_has |= 8u;
  }
  deviceInfo = self->_deviceInfo;
  uint64_t v7 = *((void *)v5 + 5);
  v17 = v5;
  if (deviceInfo)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SECC2MPDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SECC2MPMetric setDeviceInfo:](self, "setDeviceInfo:");
  }
  v5 = v17;
LABEL_9:
  cloudkitInfo = self->_cloudkitInfo;
  uint64_t v9 = *((void *)v5 + 4);
  if (cloudkitInfo)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SECC2MPCloudKitInfo mergeFrom:](cloudkitInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SECC2MPMetric setCloudkitInfo:](self, "setCloudkitInfo:");
  }
  v5 = v17;
LABEL_15:
  serverInfo = self->_serverInfo;
  uint64_t v11 = *((void *)v5 + 9);
  if (serverInfo)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SECC2MPServerInfo mergeFrom:](serverInfo, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SECC2MPMetric setServerInfo:](self, "setServerInfo:");
  }
  v5 = v17;
LABEL_21:
  char v12 = *((unsigned char *)v5 + 80);
  if ((v12 & 4) != 0)
  {
    self->_triggers = *((void *)v5 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v12 = *((unsigned char *)v5 + 80);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v5[20] & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_reportFrequency = *((void *)v5 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((v5[20] & 2) != 0)
  {
LABEL_24:
    self->_reportFrequencyBase = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_25:
  networkEvent = self->_networkEvent;
  uint64_t v14 = *((void *)v5 + 8);
  if (networkEvent)
  {
    if (!v14) {
      goto LABEL_34;
    }
    -[SECC2MPNetworkEvent mergeFrom:](networkEvent, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_34;
    }
    -[SECC2MPMetric setNetworkEvent:](self, "setNetworkEvent:");
  }
  v5 = v17;
LABEL_34:
  genericEvent = self->_genericEvent;
  uint64_t v16 = *((void *)v5 + 6);
  if (genericEvent)
  {
    if (v16) {
      -[SECC2MPGenericEvent mergeFrom:](genericEvent, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SECC2MPMetric setGenericEvent:](self, "setGenericEvent:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_metricType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SECC2MPDeviceInfo *)self->_deviceInfo hash];
  unint64_t v5 = [(SECC2MPCloudKitInfo *)self->_cloudkitInfo hash];
  unint64_t v6 = [(SECC2MPServerInfo *)self->_serverInfo hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v7 = 2654435761u * self->_triggers;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_reportFrequency;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v9 = 2654435761u * self->_reportFrequencyBase;
LABEL_11:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v11 = v7 ^ v8 ^ v9 ^ [(SECC2MPNetworkEvent *)self->_networkEvent hash];
  return v10 ^ v11 ^ [(SECC2MPGenericEvent *)self->_genericEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_metricType != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
LABEL_32:
    unsigned __int8 v10 = 0;
    goto LABEL_33;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((void *)v4 + 5) && !-[SECC2MPDeviceInfo isEqual:](deviceInfo, "isEqual:")) {
    goto LABEL_32;
  }
  cloudkitInfo = self->_cloudkitInfo;
  if ((unint64_t)cloudkitInfo | *((void *)v4 + 4))
  {
    if (!-[SECC2MPCloudKitInfo isEqual:](cloudkitInfo, "isEqual:")) {
      goto LABEL_32;
    }
  }
  serverInfo = self->_serverInfo;
  if ((unint64_t)serverInfo | *((void *)v4 + 9))
  {
    if (!-[SECC2MPServerInfo isEqual:](serverInfo, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_triggers != *((void *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_reportFrequency != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_reportFrequencyBase != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_32;
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((void *)v4 + 8)
    && !-[SECC2MPNetworkEvent isEqual:](networkEvent, "isEqual:"))
  {
    goto LABEL_32;
  }
  genericEvent = self->_genericEvent;
  if ((unint64_t)genericEvent | *((void *)v4 + 6)) {
    unsigned __int8 v10 = -[SECC2MPGenericEvent isEqual:](genericEvent, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_33:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v5[14] = self->_metricType;
    *((unsigned char *)v5 + 80) |= 8u;
  }
  id v7 = [(SECC2MPDeviceInfo *)self->_deviceInfo copyWithZone:a3];
  unint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(SECC2MPCloudKitInfo *)self->_cloudkitInfo copyWithZone:a3];
  unsigned __int8 v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(SECC2MPServerInfo *)self->_serverInfo copyWithZone:a3];
  char v12 = (void *)v6[9];
  v6[9] = v11;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    v6[1] = self->_reportFrequency;
    *((unsigned char *)v6 + 80) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v6[3] = self->_triggers;
  *((unsigned char *)v6 + 80) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v6[2] = self->_reportFrequencyBase;
    *((unsigned char *)v6 + 80) |= 2u;
  }
LABEL_7:
  id v14 = [(SECC2MPNetworkEvent *)self->_networkEvent copyWithZone:a3];
  v15 = (void *)v6[8];
  v6[8] = v14;

  id v16 = [(SECC2MPGenericEvent *)self->_genericEvent copyWithZone:a3];
  v17 = (void *)v6[6];
  v6[6] = v16;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[14] = self->_metricType;
    *((unsigned char *)v4 + 80) |= 8u;
  }
  unint64_t v6 = v4;
  if (self->_deviceInfo)
  {
    [v4 setDeviceInfo:];
    id v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    [v6 setCloudkitInfo:];
    id v4 = v6;
  }
  if (self->_serverInfo)
  {
    [v6 setServerInfo:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_triggers;
    *((unsigned char *)v4 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 1) = self->_reportFrequency;
  *((unsigned char *)v4 + 80) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((void *)v4 + 2) = self->_reportFrequencyBase;
    *((unsigned char *)v4 + 80) |= 2u;
  }
LABEL_13:
  if (self->_networkEvent)
  {
    [v6 setNetworkEvent:];
    id v4 = v6;
  }
  if (self->_genericEvent)
  {
    [v6 setGenericEvent:];
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_serverInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_networkEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_genericEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        goto LABEL_88;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        goto LABEL_88;
      }
      unint64_t v13 = v7 >> 3;
      if ((int)(v7 >> 3) <= 100) {
        break;
      }
      if ((int)v13 <= 199)
      {
        if (v13 == 101)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (1)
          {
            unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 == -1 || v31 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              goto LABEL_83;
            }
            v29 += 7;
            BOOL v10 = v30++ >= 9;
            if (v10)
            {
              uint64_t v21 = 0;
              goto LABEL_85;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_83:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v21 = 0;
          }
LABEL_85:
          uint64_t v34 = 8;
        }
        else
        {
          if (v13 != 102) {
            goto LABEL_68;
          }
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (1)
          {
            unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if ((v23 & 0x80) == 0) {
              goto LABEL_75;
            }
            v19 += 7;
            BOOL v10 = v20++ >= 9;
            if (v10)
            {
              uint64_t v21 = 0;
              goto LABEL_77;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_75:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v21 = 0;
          }
LABEL_77:
          uint64_t v34 = 16;
        }
        goto LABEL_86;
      }
      if (v13 == 200)
      {
        v24 = objc_alloc_init(SECC2MPNetworkEvent);
        objc_storeStrong((id *)&self->_networkEvent, v24);
        if (!PBReaderPlaceMark() || (sub_1001B4A54((uint64_t)v24, (uint64_t)a3) & 1) == 0)
        {
LABEL_89:

          LOBYTE(v33) = 0;
          return v33;
        }
      }
      else
      {
        if (v13 != 201)
        {
LABEL_68:
          int v33 = PBReaderSkipValueWithTag();
          if (!v33) {
            return v33;
          }
          goto LABEL_87;
        }
        v24 = objc_alloc_init(SECC2MPGenericEvent);
        objc_storeStrong((id *)&self->_genericEvent, v24);
        if (!PBReaderPlaceMark() || (sub_1000B00E8((uint64_t)v24, (uint64_t)a3) & 1) == 0) {
          goto LABEL_89;
        }
      }
LABEL_67:
      PBReaderRecallMark();

LABEL_87:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        goto LABEL_88;
    }
    switch((int)v13)
    {
      case 1:
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        *(unsigned char *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v10 = v15++ >= 9;
              if (v10)
              {
                LODWORD(v16) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v16) = 0;
        }
LABEL_73:
        self->_metricType = v16;
        goto LABEL_87;
      case 2:
        v24 = objc_alloc_init(SECC2MPDeviceInfo);
        objc_storeStrong((id *)&self->_deviceInfo, v24);
        if (!PBReaderPlaceMark() || (sub_1001CB794(v24, (uint64_t)a3) & 1) == 0) {
          goto LABEL_89;
        }
        goto LABEL_67;
      case 3:
        v24 = objc_alloc_init(SECC2MPCloudKitInfo);
        objc_storeStrong((id *)&self->_cloudkitInfo, v24);
        if (!PBReaderPlaceMark() || (sub_100165D48(v24, (uint64_t)a3) & 1) == 0) {
          goto LABEL_89;
        }
        goto LABEL_67;
      case 4:
        v24 = objc_alloc_init(SECC2MPServerInfo);
        objc_storeStrong((id *)&self->_serverInfo, v24);
        if (!PBReaderPlaceMark() || !sub_1001D7B80((uint64_t)v24, (uint64_t)a3)) {
          goto LABEL_89;
        }
        goto LABEL_67;
      default:
        if (v13 != 100) {
          goto LABEL_68;
        }
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)&self->_has |= 4u;
        break;
    }
    while (1)
    {
      unint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v27 == -1 || v27 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
      v21 |= (unint64_t)(v28 & 0x7F) << v25;
      if ((v28 & 0x80) == 0) {
        goto LABEL_79;
      }
      v25 += 7;
      BOOL v10 = v26++ >= 9;
      if (v10)
      {
        uint64_t v21 = 0;
        goto LABEL_81;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_79:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v21 = 0;
    }
LABEL_81:
    uint64_t v34 = 24;
LABEL_86:
    *(void *)&self->PBCodable_opaque[v34] = v21;
    goto LABEL_87;
  }
LABEL_88:
  LOBYTE(v33) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v33;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int metricType = self->_metricType;
    if (metricType)
    {
      if (metricType == 201)
      {
        char v5 = @"generic_event_type";
      }
      else if (metricType == 200)
      {
        char v5 = @"network_event_type";
      }
      else
      {
        char v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_metricType];
      }
    }
    else
    {
      char v5 = @"none_type";
    }
    [v3 setObject:v5 forKey:@"metric_type"];
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    unint64_t v7 = [(SECC2MPDeviceInfo *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"device_info"];
  }
  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    char v9 = [(SECC2MPCloudKitInfo *)cloudkitInfo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"cloudkit_info"];
  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    int v11 = [(SECC2MPServerInfo *)serverInfo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"server_info"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    char v19 = +[NSNumber numberWithUnsignedLongLong:self->_triggers];
    [v3 setObject:v19 forKey:@"triggers"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  unsigned int v20 = +[NSNumber numberWithUnsignedLongLong:self->_reportFrequency];
  [v3 setObject:v20 forKey:@"report_frequency"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_19:
    unint64_t v13 = +[NSNumber numberWithUnsignedLongLong:self->_reportFrequencyBase];
    [v3 setObject:v13 forKey:@"report_frequency_base"];
  }
LABEL_20:
  networkEvent = self->_networkEvent;
  if (networkEvent)
  {
    unsigned int v15 = [(SECC2MPNetworkEvent *)networkEvent dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"network_event"];
  }
  genericEvent = self->_genericEvent;
  if (genericEvent)
  {
    unint64_t v17 = [(SECC2MPGenericEvent *)genericEvent dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"generic_event"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPMetric;
  uint64_t v3 = [(SECC2MPMetric *)&v7 description];
  id v4 = [(SECC2MPMetric *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasGenericEvent
{
  return self->_genericEvent != 0;
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reportFrequencyBase = a3;
}

- (BOOL)hasReportFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reportFrequency = a3;
}

- (BOOL)hasTriggers
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTriggers:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_triggers = a3;
}

- (BOOL)hasServerInfo
{
  return self->_serverInfo != 0;
}

- (BOOL)hasCloudkitInfo
{
  return self->_cloudkitInfo != 0;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (int)StringAsMetricType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none_type"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"network_event_type"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"generic_event_type"])
  {
    int v4 = 201;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)metricTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 201)
    {
      int v4 = @"generic_event_type";
    }
    else if (a3 == 200)
    {
      int v4 = @"network_event_type";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"none_type";
  }
  return v4;
}

- (BOOL)hasMetricType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMetricType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setMetricType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int metricType = a3;
}

- (int)metricType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_metricType;
  }
  else {
    return 0;
  }
}

@end