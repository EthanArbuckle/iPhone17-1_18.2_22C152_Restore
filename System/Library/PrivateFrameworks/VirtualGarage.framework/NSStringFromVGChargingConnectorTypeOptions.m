@interface NSStringFromVGChargingConnectorTypeOptions
@end

@implementation NSStringFromVGChargingConnectorTypeOptions

__CFString *__NSStringFromVGChargingConnectorTypeOptions_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2 > 31)
  {
    if (a2 > 127)
    {
      if (a2 == 128) {
        return @"Mennekes";
      }
      if (a2 == 256) {
        return @"NACS_AC";
      }
    }
    else
    {
      if (a2 == 32) {
        return @"GBT_DC";
      }
      if (a2 == 64) {
        return @"Tesla (NACS_DC)";
      }
    }
LABEL_13:
    v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_FAULT, "Tried to get a string version of a multiple option bitmask: %lu. This is not supported.", (uint8_t *)&v6, 0xCu);
    }

    return @"Unknown";
  }
  else
  {
    result = @"J1772";
    switch(a2)
    {
      case 1:
        return result;
      case 2:
        result = @"CCS1";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_13;
      case 4:
        result = @"CCS2";
        break;
      case 8:
        result = @"CHAdeMO";
        break;
      default:
        if (a2 != 16) {
          goto LABEL_13;
        }
        result = @"GBT_AC";
        break;
    }
  }
  return result;
}

@end