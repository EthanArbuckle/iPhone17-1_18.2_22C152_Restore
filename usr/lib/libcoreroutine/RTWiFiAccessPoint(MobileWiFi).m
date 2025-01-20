@interface RTWiFiAccessPoint(MobileWiFi)
- (id)initWithWiFiNetwork:()MobileWiFi;
@end

@implementation RTWiFiAccessPoint(MobileWiFi)

- (id)initWithWiFiNetwork:()MobileWiFi
{
  if (a3)
  {
    v4 = WiFiNetworkGetProperty();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
    v5 = WiFiNetworkGetProperty();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v5)
      {
        uint64_t v6 = 0x8000000000000000;
LABEL_11:
        v8 = WiFiNetworkGetProperty();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v8)
          {
            uint64_t v9 = 0x8000000000000000;
LABEL_17:
            v10 = WiFiNetworkGetProperty();
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (!v10)
              {
                double v11 = INFINITY;
                goto LABEL_23;
              }
              double v11 = (double)[v10 integerValue] / 1000.0;
            }
            else
            {
              double v11 = INFINITY;
            }

LABEL_23:
            v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v11];
            a1 = (id)[a1 initWithMac:v4 rssi:v6 channel:v9 age:v12 date:v11];

            id v7 = a1;
            goto LABEL_24;
          }
          uint64_t v9 = [v8 integerValue];
        }
        else
        {
          uint64_t v9 = 0x8000000000000000;
        }

        goto LABEL_17;
      }
      uint64_t v6 = [v5 integerValue];
    }
    else
    {
      uint64_t v6 = 0x8000000000000000;
    }

    goto LABEL_11;
  }
  id v7 = 0;
LABEL_24:

  return v7;
}

@end