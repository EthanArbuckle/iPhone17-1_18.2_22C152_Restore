@interface WiFiUsageAppleWiFiNameBlocks
- (NSString)building;
- (NSString)floor;
- (NSString)name;
- (NSString)other;
- (NSString)pod;
- (NSString)section;
- (WiFiUsageAppleWiFiNameBlocks)initWithAPName:(id)a3;
- (void)setBuilding:(id)a3;
- (void)setFloor:(id)a3;
- (void)setName:(id)a3;
- (void)setOther:(id)a3;
- (void)setPod:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation WiFiUsageAppleWiFiNameBlocks

- (WiFiUsageAppleWiFiNameBlocks)initWithAPName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 containsString:@"."] & 1) == 0
    && (v22.receiver = self,
        v22.super_class = (Class)WiFiUsageAppleWiFiNameBlocks,
        v6 = [(WiFiUsageAppleWiFiNameBlocks *)&v22 init],
        (self = v6) != 0))
  {
    [(WiFiUsageAppleWiFiNameBlocks *)v6 setBuilding:0];
    [(WiFiUsageAppleWiFiNameBlocks *)self setSection:0];
    [(WiFiUsageAppleWiFiNameBlocks *)self setFloor:0];
    [(WiFiUsageAppleWiFiNameBlocks *)self setPod:0];
    [(WiFiUsageAppleWiFiNameBlocks *)self setOther:0];
    v7 = 0;
    if ([v5 containsString:@"-"])
    {
      v7 = [v5 componentsSeparatedByString:@"-"];
    }
    if ([v7 count])
    {
      v8 = [v7 objectAtIndex:0];
      [(WiFiUsageAppleWiFiNameBlocks *)self setBuilding:v8];
    }
    if ((unint64_t)[v7 count] >= 2)
    {
      v9 = [v7 objectAtIndex:1];
      unint64_t v10 = [v9 length];

      v11 = [v7 objectAtIndex:1];
      v12 = v11;
      if (v10 < 2)
      {
        [(WiFiUsageAppleWiFiNameBlocks *)self setFloor:v11];
      }
      else
      {
        v13 = objc_msgSend(v11, "substringWithRange:", 0, 1);
        [(WiFiUsageAppleWiFiNameBlocks *)self setSection:v13];

        v14 = [v7 objectAtIndex:1];
        v15 = objc_msgSend(v14, "substringWithRange:", 1, 1);
        [(WiFiUsageAppleWiFiNameBlocks *)self setFloor:v15];

        v12 = [v7 objectAtIndex:1];
        v16 = [v12 substringFromIndex:2];
        [(WiFiUsageAppleWiFiNameBlocks *)self setPod:v16];
      }
    }
    if ((unint64_t)[v7 count] >= 4)
    {
      v19 = [v7 objectAtIndex:1];
      [(WiFiUsageAppleWiFiNameBlocks *)self setSection:v19];

      v20 = [v7 objectAtIndex:2];
      [(WiFiUsageAppleWiFiNameBlocks *)self setFloor:v20];

      [(WiFiUsageAppleWiFiNameBlocks *)self setPod:0];
    }
    if ((unint64_t)[v7 count] >= 2)
    {
      v21 = [v7 lastObject];
      [(WiFiUsageAppleWiFiNameBlocks *)self setOther:v21];
    }
    self = self;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)building
{
  return self->_building;
}

- (void)setBuilding:(id)a3
{
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSString)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
}

- (NSString)pod
{
  return self->_pod;
}

- (void)setPod:(id)a3
{
}

- (NSString)other
{
  return self->_other;
}

- (void)setOther:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
  objc_storeStrong((id *)&self->_pod, 0);
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_building, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end