@interface NTPBTelemetryNetworkEventGroup
+ (Class)failuresType;
+ (Class)successesType;
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasEventType;
- (BOOL)hasRespondingPop;
- (BOOL)hasWifiReachabilityStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wifiReachabilityStatus;
- (NSMutableArray)failures;
- (NSMutableArray)successes;
- (NSString)respondingPop;
- (id)cellularRadioAccessTechnologyAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)failuresAtIndex:(unint64_t)a3;
- (id)successesAtIndex:(unint64_t)a3;
- (int)StringAsCellularRadioAccessTechnology:(id)a3;
- (int)cellularRadioAccessTechnology;
- (int)eventType;
- (unint64_t)failuresCount;
- (unint64_t)hash;
- (unint64_t)successesCount;
- (void)addFailures:(id)a3;
- (void)addSuccesses:(id)a3;
- (void)clearFailures;
- (void)clearSuccesses;
- (void)mergeFrom:(id)a3;
- (void)setCellularRadioAccessTechnology:(int)a3;
- (void)setEventType:(int)a3;
- (void)setFailures:(id)a3;
- (void)setHasCellularRadioAccessTechnology:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasWifiReachabilityStatus:(BOOL)a3;
- (void)setRespondingPop:(id)a3;
- (void)setSuccesses:(id)a3;
- (void)setWifiReachabilityStatus:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTelemetryNetworkEventGroup

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWifiReachabilityStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wifiReachabilityStatus = a3;
}

- (void)setHasWifiReachabilityStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiReachabilityStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)cellularRadioAccessTechnology
{
  if (*(unsigned char *)&self->_has) {
    return self->_cellularRadioAccessTechnology;
  }
  else {
    return 0;
  }
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444A078[a3];
  }

  return v3;
}

- (int)StringAsCellularRadioAccessTechnology:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GPRS_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EDGE_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WCDMA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HSDPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HSUPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CDMA1x_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORev0_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORevA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORevB_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"eHRPD_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LTE_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRNSA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NR_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRespondingPop
{
  return self->_respondingPop != 0;
}

- (void)clearSuccesses
{
}

- (void)addSuccesses:(id)a3
{
  id v4 = a3;
  successes = self->_successes;
  id v8 = v4;
  if (!successes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_successes;
    self->_successes = v6;

    id v4 = v8;
    successes = self->_successes;
  }
  [(NSMutableArray *)successes addObject:v4];
}

- (unint64_t)successesCount
{
  return [(NSMutableArray *)self->_successes count];
}

- (id)successesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_successes objectAtIndex:a3];
}

+ (Class)successesType
{
  return (Class)objc_opt_class();
}

- (void)clearFailures
{
}

- (void)addFailures:(id)a3
{
  id v4 = a3;
  failures = self->_failures;
  id v8 = v4;
  if (!failures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_failures;
    self->_failures = v6;

    id v4 = v8;
    failures = self->_failures;
  }
  [(NSMutableArray *)failures addObject:v4];
}

- (unint64_t)failuresCount
{
  return [(NSMutableArray *)self->_failures count];
}

- (id)failuresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_failures objectAtIndex:a3];
}

+ (Class)failuresType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTelemetryNetworkEventGroup;
  id v4 = [(NTPBTelemetryNetworkEventGroup *)&v8 description];
  v5 = [(NTPBTelemetryNetworkEventGroup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_eventType];
    [v3 setObject:v5 forKey:@"event_type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithBool:self->_wifiReachabilityStatus];
  [v3 setObject:v6 forKey:@"wifi_reachability_status"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cellularRadioAccessTechnology);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_26444A078[cellularRadioAccessTechnology];
  }
  [v3 setObject:v8 forKey:@"cellular_radio_access_technology"];

LABEL_11:
  respondingPop = self->_respondingPop;
  if (respondingPop) {
    [v3 setObject:respondingPop forKey:@"responding_pop"];
  }
  if ([(NSMutableArray *)self->_successes count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_successes, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = self->_successes;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"successes"];
  }
  if ([(NSMutableArray *)self->_failures count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_failures, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v18 = self->_failures;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v25 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKey:@"failures"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryNetworkEventGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_respondingPop) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_successes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_failures;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_eventType;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 40) = self->_wifiReachabilityStatus;
  *(unsigned char *)(v5 + 44) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_cellularRadioAccessTechnology;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_respondingPop copyWithZone:a3];
  uint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v10 = self->_successes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v6 addSuccesses:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_failures;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [v6 addFailures:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) != 0)
    {
      if (self->_wifiReachabilityStatus)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_26;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_15;
      }
    }
LABEL_26:
    char v8 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 44) & 4) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  respondingPop = self->_respondingPop;
  if ((unint64_t)respondingPop | *((void *)v4 + 3)
    && !-[NSString isEqual:](respondingPop, "isEqual:"))
  {
    goto LABEL_26;
  }
  successes = self->_successes;
  if ((unint64_t)successes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](successes, "isEqual:")) {
      goto LABEL_26;
    }
  }
  failures = self->_failures;
  if ((unint64_t)failures | *((void *)v4 + 2)) {
    char v8 = -[NSMutableArray isEqual:](failures, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_eventType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_wifiReachabilityStatus;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_cellularRadioAccessTechnology;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_respondingPop hash];
  uint64_t v7 = [(NSMutableArray *)self->_successes hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_failures hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiReachabilityStatus = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_4:
    self->_uint64_t cellularRadioAccessTechnology = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 3)) {
    -[NTPBTelemetryNetworkEventGroup setRespondingPop:](self, "setRespondingPop:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5[4];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBTelemetryNetworkEventGroup *)self addSuccesses:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5[2];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NTPBTelemetryNetworkEventGroup addFailures:](self, "addFailures:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)wifiReachabilityStatus
{
  return self->_wifiReachabilityStatus;
}

- (NSString)respondingPop
{
  return self->_respondingPop;
}

- (void)setRespondingPop:(id)a3
{
}

- (NSMutableArray)successes
{
  return self->_successes;
}

- (void)setSuccesses:(id)a3
{
}

- (NSMutableArray)failures
{
  return self->_failures;
}

- (void)setFailures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successes, 0);
  objc_storeStrong((id *)&self->_respondingPop, 0);

  objc_storeStrong((id *)&self->_failures, 0);
}

@end