@interface PTPEventPacket
- (PTPEventPacket)initWithDictionary:(id)a3;
- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4;
- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5;
- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6;
- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7;
- (PTPEventPacket)initWithTCPBuffer:(void *)a3;
- (PTPEventPacket)initWithUSBBuffer:(void *)a3;
- (id)contentForTCP;
- (id)contentForUSB;
- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4;
- (id)description;
- (id)eventPacketDictionary;
- (unsigned)eventCode;
- (unsigned)parameter1;
- (unsigned)parameter2;
- (unsigned)parameter3;
- (unsigned)transactionID;
- (void)setEventCode:(unsigned __int16)a3;
- (void)setParameter1:(unsigned int)a3;
- (void)setParameter2:(unsigned int)a3;
- (void)setParameter3:(unsigned int)a3;
- (void)setTransactionID:(unsigned int)a3;
@end

@implementation PTPEventPacket

- (PTPEventPacket)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTPEventPacket;
  v5 = [(PTPEventPacket *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventCode"];
    v5->_eventCode = (unsigned __int16)[v6 unsignedShortValue];

    v7 = [v4 objectForKeyedSubscript:@"transactionID"];
    v5->_transactionID = [v7 unsignedIntValue];

    v8 = [v4 objectForKeyedSubscript:@"numParameters"];
    v5->_numParameters = [v8 unsignedIntValue];

    v9 = [v4 objectForKeyedSubscript:@"parameter0"];
    v5->_parameters[0] = [v9 unsignedIntValue];

    v10 = [v4 objectForKeyedSubscript:@"parameter1"];
    v5->_parameters[1] = [v10 unsignedIntValue];

    v11 = [v4 objectForKeyedSubscript:@"parameter2"];
    v5->_parameters[2] = [v11 unsignedIntValue];
  }
  return v5;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PTPEventPacket;
  result = [(PTPEventPacket *)&v7 init];
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_numParameters = 0;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PTPEventPacket;
  result = [(PTPEventPacket *)&v9 init];
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_numParameters = 1;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PTPEventPacket;
  result = [(PTPEventPacket *)&v11 init];
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_numParameters = 2;
  }
  return result;
}

- (PTPEventPacket)initWithEventCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7
{
  v13.receiver = self;
  v13.super_class = (Class)PTPEventPacket;
  result = [(PTPEventPacket *)&v13 init];
  if (result)
  {
    result->_eventCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_parameters[2] = a7;
    result->_numParameters = 3;
  }
  return result;
}

- (PTPEventPacket)initWithTCPBuffer:(void *)a3
{
  int v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 27) >= 0xFFFFFFF3 && *((_DWORD *)a3 + 1) == 8)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPEventPacket;
    objc_super v7 = [(PTPEventPacket *)&v11 init];
    if (v7)
    {
      v10 = (char *)a3 + 8;
      v7->_eventCode = sub_10002A5D4(&v10);
      v7->_transactionID = sub_10002A650(&v10);
      v7->_numParameters = (v3 - 14) >> 2;
      if ((v3 - 14) >= 4)
      {
        uint64_t v8 = 0;
        do
          v7->_parameters[v8++] = sub_10002A650(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PTPEventPacket)initWithUSBBuffer:(void *)a3
{
  int v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 25) >= 0xFFFFFFF3 && *((_WORD *)a3 + 2) == 4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPEventPacket;
    objc_super v7 = [(PTPEventPacket *)&v11 init];
    if (v7)
    {
      v10 = (char *)a3 + 6;
      v7->_eventCode = sub_10002A5D4(&v10);
      v7->_transactionID = sub_10002A650(&v10);
      v7->_numParameters = (v3 - 12) >> 2;
      if ((v3 - 12) >= 4)
      {
        uint64_t v8 = 0;
        do
          v7->_parameters[v8++] = sub_10002A650(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentForTCP
{
  uint64_t v3 = (4 * self->_numParameters + 14);
  id v4 = +[PTPWrappedBytes wrappedBytesWithCapacity:v3];
  objc_super v7 = [v4 mutableBytes];
  sub_10002A638((_DWORD **)&v7, v3);
  sub_10002A638((_DWORD **)&v7, 8);
  sub_10002A5BC(&v7, self->_eventCode);
  sub_10002A638((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    uint64_t v5 = 0;
    do
      sub_10002A638((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  [v4 setLength:v3];

  return v4;
}

- (id)contentForUSB
{
  uint64_t v3 = (4 * self->_numParameters + 12);
  id v4 = +[PTPWrappedBytes wrappedBytesWithCapacity:v3];
  objc_super v7 = [v4 mutableBytes];
  sub_10002A638((_DWORD **)&v7, v3);
  sub_10002A5BC(&v7, 4);
  sub_10002A5BC(&v7, self->_eventCode);
  sub_10002A638((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    uint64_t v5 = 0;
    do
      sub_10002A638((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  [v4 setLength:v3];

  return v4;
}

- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4
{
  uint64_t v4 = (4 * self->_numParameters + 12);
  if (v4 <= a4)
  {
    objc_super v9 = a3;
    uint64_t v5 = +[PTPWrappedBytes wrappedBytesWithBytes:a3 capacity:a4];
    sub_10002A638((_DWORD **)&v9, v4);
    sub_10002A5BC(&v9, 4);
    sub_10002A5BC(&v9, self->_eventCode);
    sub_10002A638((_DWORD **)&v9, self->_transactionID);
    if (self->_numParameters >= 1)
    {
      uint64_t v7 = 0;
      do
        sub_10002A638((_DWORD **)&v9, self->_parameters[v7++]);
      while (v7 < self->_numParameters);
    }
    [v5 setLength:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = sub_10002BEF4(self->_eventCode);
  uint64_t v4 = +[NSMutableString stringWithFormat:@"<PTPEventPacket %p>{\n  _eventCode:     %@\n  _transactionID: %lu\n", self, v3, self->_transactionID];

  if (self->_numParameters >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      [v4 appendFormat:@"  _parameters[%d]: 0x%08lX\n", v5, self->_parameters[v5]];
      ++v5;
    }
    while (v5 < self->_numParameters);
  }
  [v4 appendString:@"}"];

  return v4;
}

- (unsigned)eventCode
{
  return self->_eventCode;
}

- (void)setEventCode:(unsigned __int16)a3
{
  self->_eventCode = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (unsigned)parameter1
{
  return self->_parameters[0];
}

- (void)setParameter1:(unsigned int)a3
{
  self->_parameters[0] = a3;
}

- (unsigned)parameter2
{
  return self->_parameters[1];
}

- (void)setParameter2:(unsigned int)a3
{
  self->_parameters[1] = a3;
}

- (unsigned)parameter3
{
  return self->_parameters[2];
}

- (void)setParameter3:(unsigned int)a3
{
  self->_parameters[2] = a3;
}

- (id)eventPacketDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = +[NSNumber numberWithUnsignedShort:self->_eventCode];
  [v3 setObject:v4 forKeyedSubscript:@"eventCode"];

  uint64_t v5 = +[NSNumber numberWithUnsignedInt:self->_transactionID];
  [v3 setObject:v5 forKeyedSubscript:@"transactionID"];

  v6 = +[NSNumber numberWithInt:self->_numParameters];
  [v3 setObject:v6 forKeyedSubscript:@"numParameters"];

  uint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_parameters[0]];
  [v3 setObject:v7 forKeyedSubscript:@"parameter0"];

  uint64_t v8 = +[NSNumber numberWithUnsignedInt:self->_parameters[1]];
  [v3 setObject:v8 forKeyedSubscript:@"parameter1"];

  objc_super v9 = +[NSNumber numberWithUnsignedInt:self->_parameters[2]];
  [v3 setObject:v9 forKeyedSubscript:@"parameter2"];

  return v3;
}

@end