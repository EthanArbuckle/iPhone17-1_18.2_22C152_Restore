@interface NUDeviceTrait
- (BOOL)isLandscape;
- (NUDeviceTrait)initWithDeviceTraitSize:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)deviceTraitSize;
@end

@implementation NUDeviceTrait

- (NUDeviceTrait)initWithDeviceTraitSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUDeviceTrait;
  result = [(NUDeviceTrait *)&v5 init];
  if (result) {
    result->_deviceTraitSize = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NUDeviceTrait alloc];
  unint64_t v5 = [(NUDeviceTrait *)self deviceTraitSize];

  return [(NUDeviceTrait *)v4 initWithDeviceTraitSize:v5];
}

- (BOOL)isLandscape
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 windows];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isKeyWindow", (void)v12)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (v9)
    {
      v10 = [v9 windowScene];
      LOBYTE(v5) = (unint64_t)([v10 interfaceOrientation] - 3) < 2;

      goto LABEL_12;
    }
    LOBYTE(v5) = 0;
  }
  else
  {
LABEL_9:
    id v9 = v4;
LABEL_12:
  }
  return v5;
}

- (unint64_t)deviceTraitSize
{
  return self->_deviceTraitSize;
}

@end