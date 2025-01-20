@interface NRSwitchRecord
+ (BOOL)supportsSecureCoding;
- (NRSwitchRecord)initWithDeviceID:(id)a3 date:(id)a4 switchIndex:(unsigned int)a5;
@end

@implementation NRSwitchRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSwitchRecord)initWithDeviceID:(id)a3 date:(id)a4 switchIndex:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(NRSwitchRecord *)self init];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1C9B8] fromUUID:v8];
    objc_storeStrong((id *)&v10->super._deviceIDBytes, v11);

    id v12 = v9;
    v13 = v12;
    if (v12)
    {
      [v12 timeIntervalSinceReferenceDate];
      *(unsigned char *)&v10->super._has |= 1u;
      v10->super._dateTimeInterval = v14;
    }
    else
    {
      *(unsigned char *)&v10->super._has &= ~1u;
    }

    *(unsigned char *)&v10->super._has |= 2u;
    v10->super._switchIndex = a5;
  }

  return v10;
}

@end