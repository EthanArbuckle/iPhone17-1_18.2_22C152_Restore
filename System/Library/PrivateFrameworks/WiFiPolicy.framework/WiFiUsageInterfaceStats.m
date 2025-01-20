@interface WiFiUsageInterfaceStats
+ (id)_statsFromMIB:(id)a3;
+ (id)_statsFromNetIF:(id)a3;
+ (id)statsForInterfaceName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInterfaceStats:(id)a3;
- (NSDate)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)rxBytes;
- (unint64_t)rxL3Packets;
- (unint64_t)txBytes;
- (unint64_t)txL3Packets;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxL3Packets:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxL3Packets:(unint64_t)a3;
@end

@implementation WiFiUsageInterfaceStats

- (void).cxx_destruct
{
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

+ (id)statsForInterfaceName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (id v6 = v4, [v6 UTF8String]))
  {
    v7 = [a1 _statsFromMIB:v6];
    if (!v7)
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v8) {
        +[WiFiUsageInterfaceStats statsForInterfaceName:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
      v7 = [a1 _statsFromNetIF:v6];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_statsFromMIB:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  *(_OWORD *)v37 = xmmword_1D3D95DA0;
  int v38 = 6;
  id v6 = v4;
  v7 = (const char *)[v6 UTF8String];

  unsigned int v39 = if_nametoindex(v7);
  size_t size = 0;
  sysctl(v37, 6u, 0, &size, 0, 0);
  if (size)
  {
    BOOL v8 = malloc_type_malloc(size, 0xCB16AD62uLL);
    if (v8)
    {
      uint64_t v9 = v8;
      if (sysctl(v37, 6u, v8, &size, 0, 0) < 0)
      {
        BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v27) {
          +[WiFiUsageInterfaceStats _statsFromMIB:](v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }
      else
      {
        [v5 setTxBytes:v9[13]];
        [v5 setRxBytes:v9[12]];
        [v5 setTxL3Packets:v9[9]];
        [v5 setRxL3Packets:v9[7]];
        uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
        [v5 setTimestamp:v10];
      }
      free(v9);
    }
    else
    {
      BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v19) {
        +[WiFiUsageInterfaceStats _statsFromMIB:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      +[WiFiUsageInterfaceStats _statsFromMIB:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  return v5;
}

- (void)setTxL3Packets:(unint64_t)a3
{
  self->_txL3Packets = a3;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (void)setTimestamp:(id)a3
{
}

- (void)setRxL3Packets:(unint64_t)a3
{
  self->_rxL3Packets = a3;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (unint64_t)txL3Packets
{
  return self->_txL3Packets;
}

- (unint64_t)rxL3Packets
{
  return self->_rxL3Packets;
}

+ (id)_statsFromNetIF:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v13 = 0;
  [v5 setTxBytes:0];
  [v5 setRxBytes:0];
  if (v4)
  {
    int v6 = getifaddrs(&v13);
    v7 = v13;
    if (!v6 && v13)
    {
      do
      {
        ifa_addr = v7->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18)
          {
            ifa_data = (unsigned int *)v7->ifa_data;
            if (ifa_data)
            {
              ifa_name = v7->ifa_name;
              if (ifa_name)
              {
                if (!strcmp(ifa_name, (const char *)[v4 UTF8String]))
                {
                  [v5 setTxBytes:ifa_data[11]];
                  [v5 setRxBytes:ifa_data[10]];
                  [v5 setTxL3Packets:ifa_data[7]];
                  [v5 setRxL3Packets:ifa_data[5]];
                  BOOL v11 = [MEMORY[0x1E4F1C9C8] date];
                  [v5 setTimestamp:v11];
                }
              }
            }
          }
        }
        v7 = v7->ifa_next;
      }
      while (v7);
      v7 = v13;
    }
    if (v7) {
      MEMORY[0x1D943FD00](v7);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRxBytes:", -[WiFiUsageInterfaceStats rxBytes](self, "rxBytes"));
  objc_msgSend(v4, "setTxBytes:", -[WiFiUsageInterfaceStats txBytes](self, "txBytes"));
  objc_msgSend(v4, "setRxL3Packets:", -[WiFiUsageInterfaceStats rxL3Packets](self, "rxL3Packets"));
  objc_msgSend(v4, "setTxL3Packets:", -[WiFiUsageInterfaceStats txL3Packets](self, "txL3Packets"));
  id v5 = [(WiFiUsageInterfaceStats *)self timestamp];
  [v4 setTimestamp:v5];

  return v4;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@:%p ", v5, self];

  objc_msgSend(v6, "appendFormat:", @"Rx: Packets=%lu ", -[WiFiUsageInterfaceStats rxL3Packets](self, "rxL3Packets"));
  objc_msgSend(v6, "appendFormat:", @"Bytes=%lu ", -[WiFiUsageInterfaceStats rxBytes](self, "rxBytes"));
  objc_msgSend(v6, "appendFormat:", @"Tx: Packets=%lu ", -[WiFiUsageInterfaceStats txL3Packets](self, "txL3Packets"));
  objc_msgSend(v6, "appendFormat:", @"Bytes=%lu ", -[WiFiUsageInterfaceStats txBytes](self, "txBytes"));
  v7 = [(WiFiUsageInterfaceStats *)self timestamp];
  [v6 appendFormat:@"Ts: %@>", v7];

  return v6;
}

- (BOOL)isEqualToInterfaceStats:(id)a3
{
  id v4 = a3;
  unint64_t rxBytes = self->_rxBytes;
  if (rxBytes == [v4 rxBytes]
    && (unint64_t txBytes = self->_txBytes, txBytes == [v4 txBytes])
    && (unint64_t rxL3Packets = self->_rxL3Packets, rxL3Packets == [v4 rxL3Packets]))
  {
    unint64_t txL3Packets = self->_txL3Packets;
    BOOL v9 = txL3Packets == [v4 txL3Packets];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiUsageInterfaceStats *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(WiFiUsageInterfaceStats *)self isEqualToInterfaceStats:v5];

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)statsForInterfaceName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end