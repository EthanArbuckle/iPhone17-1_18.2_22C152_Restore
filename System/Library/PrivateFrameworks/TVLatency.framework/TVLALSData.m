@interface TVLALSData
+ (id)instanceFromDictionary:(id)a3;
- (NSArray)channelData;
- (NSNumber)cct;
- (NSNumber)lux;
- (NSNumber)x;
- (NSNumber)y;
- (NSNumber)z;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setCct:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setLux:(id)a3;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
- (void)setZ:(id)a3;
@end

@implementation TVLALSData

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"<TVLALSData (%p) ", self);
  [v3 appendString:v4];

  v5 = [(TVLALSData *)self x];

  if (v5)
  {
    v6 = NSString;
    v7 = [(TVLALSData *)self x];
    [v7 floatValue];
    v9 = [v6 stringWithFormat:@"X: %.2f, ", v8];
    [v3 appendString:v9];
  }
  v10 = [(TVLALSData *)self y];

  if (v10)
  {
    v11 = NSString;
    v12 = [(TVLALSData *)self y];
    [v12 floatValue];
    v14 = [v11 stringWithFormat:@"Y: %.2f, ", v13];
    [v3 appendString:v14];
  }
  v15 = [(TVLALSData *)self z];

  if (v15)
  {
    v16 = NSString;
    v17 = [(TVLALSData *)self z];
    [v17 floatValue];
    v19 = [v16 stringWithFormat:@"Z: %.2f, ", v18];
    [v3 appendString:v19];
  }
  v20 = [(TVLALSData *)self lux];

  if (v20)
  {
    v21 = NSString;
    v22 = [(TVLALSData *)self lux];
    [v22 floatValue];
    v24 = [v21 stringWithFormat:@"Lux: %.2f, ", v23];
    [v3 appendString:v24];
  }
  v25 = [(TVLALSData *)self cct];

  if (v25)
  {
    v26 = NSString;
    v27 = [(TVLALSData *)self cct];
    [v27 floatValue];
    v29 = [v26 stringWithFormat:@"CCT: %.2f, ", v28];
    [v3 appendString:v29];
  }
  v30 = [(TVLALSData *)self channelData];

  if (v30)
  {
    v31 = NSString;
    v32 = [(TVLALSData *)self channelData];
    v33 = [v31 stringWithFormat:@"Channel Data: %@", v32];
    [v3 appendString:v33];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)dictionaryRepresentation
{
  v23[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVLALSData *)self x];
  if (!v3) {
    goto LABEL_12;
  }
  v4 = (void *)v3;
  uint64_t v5 = [(TVLALSData *)self y];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(TVLALSData *)self y];
  if (!v7)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  float v8 = (void *)v7;
  uint64_t v9 = [(TVLALSData *)self lux];
  if (!v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = (void *)v9;
  uint64_t v11 = [(TVLALSData *)self cct];
  if (!v11)
  {

    goto LABEL_9;
  }
  v12 = (void *)v11;
  float v13 = [(TVLALSData *)self channelData];

  if (v13)
  {
    v22[0] = @"ALS_DATA_X";
    v14 = [(TVLALSData *)self x];
    v23[0] = v14;
    v22[1] = @"ALS_DATA_Y";
    v15 = [(TVLALSData *)self y];
    v23[1] = v15;
    v22[2] = @"ALS_DATA_Z";
    v16 = [(TVLALSData *)self z];
    v23[2] = v16;
    v22[3] = @"ALS_DATA_LUX";
    v17 = [(TVLALSData *)self lux];
    v23[3] = v17;
    v22[4] = @"ALS_DATA_CCT";
    float v18 = [(TVLALSData *)self cct];
    v23[4] = v18;
    v22[5] = @"ALS_DATA_CHANNELS";
    v19 = [(TVLALSData *)self channelData];
    v23[5] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

    goto LABEL_13;
  }
LABEL_12:
  v20 = (void *)MEMORY[0x263EFFA78];
LABEL_13:

  return v20;
}

+ (id)instanceFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TVLALSData);
  uint64_t v5 = [v3 objectForKey:@"ALS_DATA_X"];
  [(TVLALSData *)v4 setX:v5];

  v6 = [v3 objectForKey:@"ALS_DATA_Y"];
  [(TVLALSData *)v4 setY:v6];

  uint64_t v7 = [v3 objectForKey:@"ALS_DATA_Z"];
  [(TVLALSData *)v4 setZ:v7];

  float v8 = [v3 objectForKey:@"ALS_DATA_LUX"];
  [(TVLALSData *)v4 setLux:v8];

  uint64_t v9 = [v3 objectForKey:@"ALS_DATA_CCT"];
  [(TVLALSData *)v4 setCct:v9];

  v10 = [v3 objectForKey:@"ALS_DATA_CHANNELS"];

  [(TVLALSData *)v4 setChannelData:v10];
  uint64_t v11 = [(TVLALSData *)v4 x];
  if (v11)
  {
    uint64_t v12 = [(TVLALSData *)v4 y];
    if (v12)
    {
      float v13 = (void *)v12;
      uint64_t v14 = [(TVLALSData *)v4 y];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [(TVLALSData *)v4 lux];
        if (v16)
        {
          v17 = (void *)v16;
          uint64_t v18 = [(TVLALSData *)v4 cct];
          if (v18)
          {
            v19 = (void *)v18;
            v20 = [(TVLALSData *)v4 channelData];

            if (v20)
            {
              uint64_t v11 = v4;
              goto LABEL_13;
            }
            goto LABEL_12;
          }
        }
      }
    }
LABEL_12:
    uint64_t v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSNumber)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
}

- (NSNumber)z
{
  return self->_z;
}

- (void)setZ:(id)a3
{
}

- (NSNumber)lux
{
  return self->_lux;
}

- (void)setLux:(id)a3
{
}

- (NSNumber)cct
{
  return self->_cct;
}

- (void)setCct:(id)a3
{
}

- (NSArray)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_cct, 0);
  objc_storeStrong((id *)&self->_lux, 0);
  objc_storeStrong((id *)&self->_z, 0);
  objc_storeStrong((id *)&self->_y, 0);

  objc_storeStrong((id *)&self->_x, 0);
}

@end