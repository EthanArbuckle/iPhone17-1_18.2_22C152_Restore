@interface AWDWiFiMetricsManagerFrameCounterStats
- (AWDControlFrames)rxControl;
- (AWDControlFrames)txControl;
- (AWDDataFrames)rxData;
- (AWDDataFrames)txData;
- (AWDManagementFrames)rxManagement;
- (AWDManagementFrames)txManagement;
- (BOOL)hasRxControl;
- (BOOL)hasRxData;
- (BOOL)hasRxManagement;
- (BOOL)hasTimestamp;
- (BOOL)hasTxControl;
- (BOOL)hasTxData;
- (BOOL)hasTxManagement;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRxControl:(id)a3;
- (void)setRxData:(id)a3;
- (void)setRxManagement:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxControl:(id)a3;
- (void)setTxData:(id)a3;
- (void)setTxManagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerFrameCounterStats

- (void)dealloc
{
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setRxControl:0];
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setTxControl:0];
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setRxData:0];
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setTxData:0];
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setRxManagement:0];
  [(AWDWiFiMetricsManagerFrameCounterStats *)self setTxManagement:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerFrameCounterStats;
  [(AWDWiFiMetricsManagerFrameCounterStats *)&v3 dealloc];
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

- (BOOL)hasRxControl
{
  return self->_rxControl != 0;
}

- (BOOL)hasTxControl
{
  return self->_txControl != 0;
}

- (BOOL)hasRxData
{
  return self->_rxData != 0;
}

- (BOOL)hasTxData
{
  return self->_txData != 0;
}

- (BOOL)hasRxManagement
{
  return self->_rxManagement != 0;
}

- (BOOL)hasTxManagement
{
  return self->_txManagement != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerFrameCounterStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerFrameCounterStats description](&v3, sel_description), -[AWDWiFiMetricsManagerFrameCounterStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  rxControl = self->_rxControl;
  if (rxControl) {
    [v3 setObject:[[rxControl dictionaryRepresentation] forKey:@"rxControl"];
  }
  txControl = self->_txControl;
  if (txControl) {
    [v3 setObject:-[AWDControlFrames dictionaryRepresentation](txControl, "dictionaryRepresentation") forKey:@"txControl"];
  }
  rxData = self->_rxData;
  if (rxData) {
    [v3 setObject:[[rxData dictionaryRepresentation] forKey:@"rxData"];
  }
  txData = self->_txData;
  if (txData) {
    [v3 setObject:[[-[AWDDataFrames dictionaryRepresentation](txData, "dictionaryRepresentation")] forKey:@"txData"];
  }
  rxManagement = self->_rxManagement;
  if (rxManagement) {
    [v3 setObject:-[AWDManagementFrames dictionaryRepresentation](rxManagement, "dictionaryRepresentation") forKey:@"rxManagement"];
  }
  txManagement = self->_txManagement;
  if (txManagement) {
    [v3 setObject:[-[AWDManagementFrames dictionaryRepresentation](txManagement, "dictionaryRepresentation")] forKey:@"txManagement"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerFrameCounterStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_rxControl) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txControl) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxManagement) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txManagement)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if (self->_rxControl) {
    [a3 setRxControl:];
  }
  if (self->_txControl) {
    [a3 setTxControl:];
  }
  if (self->_rxData) {
    [a3 setRxData:];
  }
  if (self->_txData) {
    [a3 setTxData:];
  }
  if (self->_rxManagement) {
    [a3 setRxManagement:];
  }
  if (self->_txManagement)
  {
    [a3 setTxManagement:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }

  *(void *)(v6 + 16) = [(AWDControlFrames *)self->_rxControl copyWithZone:a3];
  *(void *)(v6 + 40) = [(AWDControlFrames *)self->_txControl copyWithZone:a3];

  *(void *)(v6 + 24) = [(AWDDataFrames *)self->_rxData copyWithZone:a3];
  *(void *)(v6 + 48) = [(AWDDataFrames *)self->_txData copyWithZone:a3];

  *(void *)(v6 + 32) = [(AWDManagementFrames *)self->_rxManagement copyWithZone:a3];
  *(void *)(v6 + 56) = [(AWDManagementFrames *)self->_txManagement copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    rxControl = self->_rxControl;
    if (!((unint64_t)rxControl | *((void *)a3 + 2))
      || (int v5 = -[AWDControlFrames isEqual:](rxControl, "isEqual:")) != 0)
    {
      txControl = self->_txControl;
      if (!((unint64_t)txControl | *((void *)a3 + 5))
        || (int v5 = -[AWDControlFrames isEqual:](txControl, "isEqual:")) != 0)
      {
        rxData = self->_rxData;
        if (!((unint64_t)rxData | *((void *)a3 + 3))
          || (int v5 = -[AWDDataFrames isEqual:](rxData, "isEqual:")) != 0)
        {
          txData = self->_txData;
          if (!((unint64_t)txData | *((void *)a3 + 6))
            || (int v5 = -[AWDDataFrames isEqual:](txData, "isEqual:")) != 0)
          {
            rxManagement = self->_rxManagement;
            if (!((unint64_t)rxManagement | *((void *)a3 + 4))
              || (int v5 = -[AWDManagementFrames isEqual:](rxManagement, "isEqual:")) != 0)
            {
              txManagement = self->_txManagement;
              if ((unint64_t)txManagement | *((void *)a3 + 7))
              {
                LOBYTE(v5) = -[AWDManagementFrames isEqual:](txManagement, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
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
  unint64_t v4 = [(AWDControlFrames *)self->_rxControl hash] ^ v3;
  unint64_t v5 = [(AWDControlFrames *)self->_txControl hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDDataFrames *)self->_rxData hash];
  unint64_t v7 = [(AWDDataFrames *)self->_txData hash];
  unint64_t v8 = v7 ^ [(AWDManagementFrames *)self->_rxManagement hash];
  return v6 ^ v8 ^ [(AWDManagementFrames *)self->_txManagement hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 64))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  rxControl = self->_rxControl;
  uint64_t v6 = *((void *)a3 + 2);
  if (rxControl)
  {
    if (v6) {
      -[AWDControlFrames mergeFrom:](rxControl, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxControl:](self, "setRxControl:");
  }
  txControl = self->_txControl;
  uint64_t v8 = *((void *)a3 + 5);
  if (txControl)
  {
    if (v8) {
      -[AWDControlFrames mergeFrom:](txControl, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxControl:](self, "setTxControl:");
  }
  rxData = self->_rxData;
  uint64_t v10 = *((void *)a3 + 3);
  if (rxData)
  {
    if (v10) {
      -[AWDDataFrames mergeFrom:](rxData, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxData:](self, "setRxData:");
  }
  txData = self->_txData;
  uint64_t v12 = *((void *)a3 + 6);
  if (txData)
  {
    if (v12) {
      -[AWDDataFrames mergeFrom:](txData, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxData:](self, "setTxData:");
  }
  rxManagement = self->_rxManagement;
  uint64_t v14 = *((void *)a3 + 4);
  if (rxManagement)
  {
    if (v14) {
      -[AWDManagementFrames mergeFrom:](rxManagement, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxManagement:](self, "setRxManagement:");
  }
  txManagement = self->_txManagement;
  uint64_t v16 = *((void *)a3 + 7);
  if (txManagement)
  {
    if (v16)
    {
      -[AWDManagementFrames mergeFrom:](txManagement, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxManagement:](self, "setTxManagement:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDControlFrames)rxControl
{
  return self->_rxControl;
}

- (void)setRxControl:(id)a3
{
}

- (AWDControlFrames)txControl
{
  return self->_txControl;
}

- (void)setTxControl:(id)a3
{
}

- (AWDDataFrames)rxData
{
  return self->_rxData;
}

- (void)setRxData:(id)a3
{
}

- (AWDDataFrames)txData
{
  return self->_txData;
}

- (void)setTxData:(id)a3
{
}

- (AWDManagementFrames)rxManagement
{
  return self->_rxManagement;
}

- (void)setRxManagement:(id)a3
{
}

- (AWDManagementFrames)txManagement
{
  return self->_txManagement;
}

- (void)setTxManagement:(id)a3
{
}

@end