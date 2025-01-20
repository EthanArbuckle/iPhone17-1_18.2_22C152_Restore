@interface NTKWhistlerAnalogColorPalette
- (NTKWhistlerAnalogColorPalette)initWithDevice:(id)a3;
- (id)bezelTextColorForColorPalette:(id)a3;
- (id)complicationForegroundColorPalette:(id)a3;
- (id)dialFillColorForColorPalette:(id)a3;
- (id)handFillColorForColorPalette:(id)a3;
- (id)handStrokeColorForColorPalette:(id)a3;
- (id)hourTicksColorForColorPalette:(id)a3;
- (id)minuteTicksColorForColorPalette:(id)a3;
- (id)platterTextColorForColorPalette:(id)a3;
- (id)secondHandColorForColorPalette:(id)a3;
@end

@implementation NTKWhistlerAnalogColorPalette

- (NTKWhistlerAnalogColorPalette)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKWhistlerAnalogColorPalette;
  v6 = [(NTKWhistlerAnalogColorPalette *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)handStrokeColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", a3);
}

- (id)handFillColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v3;
}

- (id)secondHandColorForColorPalette:(id)a3
{
  id v3 = a3;
  if (([v3 isMulticolor] & 1) != 0
    || ([v3 isBlackColor] & 1) != 0
    || [v3 isWhiteColor])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else
  {
    uint64_t v4 = [v3 primaryColor];
  }
  id v5 = (void *)v4;

  return v5;
}

- (id)hourTicksColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v3;
}

- (id)minuteTicksColorForColorPalette:(id)a3
{
  id v3 = a3;
  if ([v3 isWhiteColor])
  {
    uint64_t v4 = NTKColorWithRGBA(150, 150, 150, 1.0);
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 isBlackColor])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
    goto LABEL_5;
  }
  v6 = [v3 primaryColor];
  id v5 = [v6 colorWithAlphaComponent:0.5];

LABEL_7:
  return v5;
}

- (id)dialFillColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    NTKColorWithRGBA(229, 229, 229, 1.0);
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v3;
}

- (id)bezelTextColorForColorPalette:(id)a3
{
  id v3 = a3;
  if ([v3 isWhiteColor])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
    double v5 = 0.15;
  }
  else
  {
    int v6 = [v3 isBlackColor];
    uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
    if (v6) {
      double v5 = 0.85;
    }
    else {
      double v5 = 0.944444444;
    }
  }
  v7 = [v4 colorWithWhite:v5 alpha:1.0];

  return v7;
}

- (id)platterTextColorForColorPalette:(id)a3
{
  id v3 = a3;
  if ([v3 isWhiteColor])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    if ([v3 isBlackColor]) {
      [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  double v5 = (void *)v4;

  return v5;
}

- (id)complicationForegroundColorPalette:(id)a3
{
  id v3 = a3;
  if ([v3 isWhiteColor])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    if ([v3 isBlackColor]) {
      [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
    }
    else {
    uint64_t v4 = [v3 primaryColor];
    }
  }
  double v5 = (void *)v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end