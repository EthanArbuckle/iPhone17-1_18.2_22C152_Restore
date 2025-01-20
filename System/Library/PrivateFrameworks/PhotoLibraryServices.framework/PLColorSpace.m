@interface PLColorSpace
+ (id)colorSpaceFromName:(id)a3;
+ (id)commonColorSpace_displaySpace;
+ (id)commonColorSpace_sRGB;
- (BOOL)isEqual:(id)a3;
- (NSString)colorSpaceName;
- (PLColorSpace)initWithName:(id)a3;
- (unint64_t)hash;
- (void)setColorSpaceName:(id)a3;
@end

@implementation PLColorSpace

- (void).cxx_destruct
{
}

- (void)setColorSpaceName:(id)a3
{
}

- (NSString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLColorSpace *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    colorSpaceName = self->_colorSpaceName;
    v7 = [(PLColorSpace *)v5 colorSpaceName];
    char v8 = [(NSString *)colorSpaceName isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_colorSpaceName hash];
}

- (PLColorSpace)initWithName:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLColorSpace;
  v7 = [(PLColorSpace *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PLColorSpace.m", 23, @"Invalid parameter not satisfying: %@", @"colorSpaceName" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_colorSpaceName, a3);
  }

  return v7;
}

+ (id)commonColorSpace_displaySpace
{
  if (commonColorSpace_displaySpace__onceToken != -1) {
    dispatch_once(&commonColorSpace_displaySpace__onceToken, &__block_literal_global_110056);
  }
  uint64_t v3 = commonColorSpace_displaySpace_s_colorSpaceName;
  return (id)[a1 colorSpaceFromName:v3];
}

void __45__PLColorSpace_commonColorSpace_displaySpace__block_invoke()
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  commonColorSpace_displaySpace_s_colorSpaceName = (uint64_t)CGColorSpaceCopyName(DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
}

+ (id)commonColorSpace_sRGB
{
  return (id)[a1 colorSpaceFromName:@"sRGB IEC61966-2.1"];
}

+ (id)colorSpaceFromName:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v3];

  return v4;
}

@end