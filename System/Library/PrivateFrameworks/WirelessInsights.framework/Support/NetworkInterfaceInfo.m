@interface NetworkInterfaceInfo
- (BOOL)isCountersSet;
- (NetworkInterfaceInfo)initWithIndex:(unsigned int)a3 type:(int)a4;
- (id)description;
- (id)typeAsString;
- (int)type;
- (unint64_t)rxByteCounter;
- (unint64_t)rxPacketCounter;
- (unint64_t)txByteCounter;
- (unint64_t)txPacketCounter;
- (unsigned)index;
- (void)updateRxByteCounterTo:(unint64_t)a3 andTxByteCounterTo:(unint64_t)a4 andRxPacketCounterTo:(unint64_t)a5 andTxPacketCounterTo:(unint64_t)a6;
@end

@implementation NetworkInterfaceInfo

- (NetworkInterfaceInfo)initWithIndex:(unsigned int)a3 type:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NetworkInterfaceInfo;
  v6 = [(NetworkInterfaceInfo *)&v10 init];
  v7 = (NetworkInterfaceInfo *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 3) = a3;
    *((_DWORD *)v6 + 4) = a4;
    v6[8] = 0;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    v8 = v6;
  }

  return v7;
}

- (void)updateRxByteCounterTo:(unint64_t)a3 andTxByteCounterTo:(unint64_t)a4 andRxPacketCounterTo:(unint64_t)a5 andTxPacketCounterTo:(unint64_t)a6
{
  self->_rxByteCounter = a3;
  self->_txByteCounter = a4;
  self->_rxPacketCounter = a5;
  self->_txPacketCounter = a6;
  self->_isCountersSet = 1;
}

- (id)typeAsString
{
  unsigned int v2 = [(NetworkInterfaceInfo *)self type] - 1;
  if (v2 > 3) {
    return @"other";
  }
  else {
    return off_1001B5F70[v2];
  }
}

- (id)description
{
  unsigned int v3 = [(NetworkInterfaceInfo *)self isCountersSet];
  uint64_t v4 = [(NetworkInterfaceInfo *)self index];
  uint64_t v5 = [(NetworkInterfaceInfo *)self type];
  uint64_t v6 = [(NetworkInterfaceInfo *)self typeAsString];
  v7 = (void *)v6;
  if (v3) {
    +[NSString stringWithFormat:@"index %d, type %d (%@), rxByteCounter %llu, txByteCounter %llu, rxPacketCounter %llu, txPacketCounter %llu", v4, v5, v6, [(NetworkInterfaceInfo *)self rxByteCounter], [(NetworkInterfaceInfo *)self txByteCounter], [(NetworkInterfaceInfo *)self rxPacketCounter], [(NetworkInterfaceInfo *)self txPacketCounter]];
  }
  else {
  v8 = +[NSString stringWithFormat:@"index %d, type %d (%@), counters not set", v4, v5, v6];
  }

  return v8;
}

- (unsigned)index
{
  return self->_index;
}

- (int)type
{
  return self->_type;
}

- (BOOL)isCountersSet
{
  return self->_isCountersSet;
}

- (unint64_t)rxByteCounter
{
  return self->_rxByteCounter;
}

- (unint64_t)txByteCounter
{
  return self->_txByteCounter;
}

- (unint64_t)rxPacketCounter
{
  return self->_rxPacketCounter;
}

- (unint64_t)txPacketCounter
{
  return self->_txPacketCounter;
}

@end