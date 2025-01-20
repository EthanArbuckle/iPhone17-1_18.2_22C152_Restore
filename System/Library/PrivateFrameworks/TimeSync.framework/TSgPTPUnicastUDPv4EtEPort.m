@interface TSgPTPUnicastUDPv4EtEPort
+ (id)keyPathsForValuesAffectingDestinationIPv4Address;
- (NSNumber)destinationIPv4Address;
- (TSgPTPUnicastUDPv4EtEPort)initWithImplDC:(id)a3;
@end

@implementation TSgPTPUnicastUDPv4EtEPort

- (TSgPTPUnicastUDPv4EtEPort)initWithImplDC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[portImpl isKindOfClass:[TSDgPTPUnicastUDPv4EtEPort class]]";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = "";
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      __int16 v19 = 1024;
      int v20 = 2894;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    id v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPUnicastUDPv4EtEPort;
  id v5 = [(TSgPTPFDEtEPort *)&v8 initWithImplDC:v4];
  if (v5)
  {
    id v6 = v4;
    self = (TSgPTPUnicastUDPv4EtEPort *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;
LABEL_4:
  }
  return (TSgPTPUnicastUDPv4EtEPort *)v5;
}

+ (id)keyPathsForValuesAffectingDestinationIPv4Address
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.destinationIPv4Address", 0);
}

- (NSNumber)destinationIPv4Address
{
  return [(_TSF_TSDgPTPUnicastUDPv4EtEPort *)self->_impl destinationIPv4Address];
}

- (void).cxx_destruct
{
}

@end