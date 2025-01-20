@interface PVColorSpace
+ (id)ProResLogColorSpace;
+ (id)extendedDisplayP3ColorSpace;
+ (id)extendedLinearSRGBColorSpace;
+ (id)extendedSRGBColorSpace;
+ (id)p3HLGGammaColorSpace;
+ (id)p3PQGammaColorSpace;
+ (id)p3d65GammaColorSpace;
+ (id)preferredDisplayColorSpace;
+ (id)pvColorSpaceForCVPixelBuffer:(__CVBuffer *)a3;
+ (id)pvColorSpaceFromCGColorSpace:(CGColorSpace *)a3;
+ (id)rec2020GammaColorSpace;
+ (id)rec2020LinearColorSpace;
+ (id)rec2100HLGColorSpace;
+ (id)rec2100PQColorSpace;
+ (id)rec601_1_1_6_GammaColorSpace;
+ (id)rec601_EBU_3213_GammaColorSpace;
+ (id)rec601_SMPTE_C_GammaColorSpace;
+ (id)rec709GammaColorSpace;
+ (id)rec709LinearColorSpace;
+ (id)sRGBColorSpace;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCGColorSpace:(CGColorSpace *)a3;
- (BOOL)isExtendedDisplayP3ColorSpace;
- (BOOL)isExtendedLinearSRGBColorSpace;
- (BOOL)isExtendedSRGBColorSpace;
- (BOOL)isHDRSpace;
- (BOOL)isP3HLGGammaColorSpace;
- (BOOL)isP3PQGammaColorSpace;
- (BOOL)isP3d65GammaColorSpace;
- (BOOL)isProResLogColorSpace;
- (BOOL)isRec2020GammaColorSpace;
- (BOOL)isRec2020LinearColorSpace;
- (BOOL)isRec2100HLGColorSpace;
- (BOOL)isRec2100PQColorSpace;
- (BOOL)isRec601_1_1_6_GammaColorSpace;
- (BOOL)isRec601_EBU_3213_GammaColorSpace;
- (BOOL)isRec601_SMPTE_C_GammaColorSpace;
- (BOOL)isRec709GammaColorSpace;
- (BOOL)isRec709LinearColorSpace;
- (BOOL)isSRGBColorSpace;
- (BOOL)isWideGamutSpace;
- (CGColorSpace)cgColorSpace;
- (PVColorSpace)initWithType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)name;
- (id)nclcTriplet;
- (unint64_t)hash;
@end

@implementation PVColorSpace

+ (id)preferredDisplayColorSpace
{
  if (+[PVDeviceCharacteristics hasExtendedColorDisplay])
  {
    [a1 p3d65GammaColorSpace];
  }
  else
  {
    [a1 sRGBColorSpace];
  v3 = };

  return v3;
}

+ (id)sRGBColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:0];

  return v2;
}

+ (id)rec601_1_1_6_GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:1];

  return v2;
}

+ (id)rec601_SMPTE_C_GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:2];

  return v2;
}

+ (id)rec601_EBU_3213_GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:3];

  return v2;
}

+ (id)rec709GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:4];

  return v2;
}

+ (id)rec709LinearColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:5];

  return v2;
}

+ (id)extendedSRGBColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:6];

  return v2;
}

+ (id)extendedLinearSRGBColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:7];

  return v2;
}

+ (id)extendedDisplayP3ColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:8];

  return v2;
}

+ (id)p3d65GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:9];

  return v2;
}

+ (id)p3HLGGammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:10];

  return v2;
}

+ (id)p3PQGammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:11];

  return v2;
}

+ (id)rec2100HLGColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:12];

  return v2;
}

+ (id)rec2100PQColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:13];

  return v2;
}

+ (id)rec2020LinearColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:14];

  return v2;
}

+ (id)rec2020GammaColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:15];

  return v2;
}

+ (id)ProResLogColorSpace
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:16];

  return v2;
}

+ (id)pvColorSpaceFromCGColorSpace:(CGColorSpace *)a3
{
  if (!a3) {
    goto LABEL_32;
  }
  v4 = +[PVColorSpace sRGBColorSpace];
  int v5 = [v4 isEqualToCGColorSpace:a3];

  if (v5)
  {
    v6 = +[PVColorSpace sRGBColorSpace];
    goto LABEL_33;
  }
  v7 = +[PVColorSpace rec601_1_1_6_GammaColorSpace];
  int v8 = [v7 isEqualToCGColorSpace:a3];

  if (v8)
  {
    v6 = +[PVColorSpace rec601_1_1_6_GammaColorSpace];
    goto LABEL_33;
  }
  v9 = +[PVColorSpace rec601_SMPTE_C_GammaColorSpace];
  int v10 = [v9 isEqualToCGColorSpace:a3];

  if (v10)
  {
    v6 = +[PVColorSpace rec601_SMPTE_C_GammaColorSpace];
    goto LABEL_33;
  }
  v11 = +[PVColorSpace rec601_EBU_3213_GammaColorSpace];
  int v12 = [v11 isEqualToCGColorSpace:a3];

  if (v12)
  {
    v6 = +[PVColorSpace rec601_EBU_3213_GammaColorSpace];
    goto LABEL_33;
  }
  v13 = +[PVColorSpace rec709GammaColorSpace];
  int v14 = [v13 isEqualToCGColorSpace:a3];

  if (v14)
  {
    v6 = +[PVColorSpace rec709GammaColorSpace];
    goto LABEL_33;
  }
  v15 = +[PVColorSpace extendedSRGBColorSpace];
  int v16 = [v15 isEqualToCGColorSpace:a3];

  if (v16)
  {
    v6 = +[PVColorSpace extendedSRGBColorSpace];
    goto LABEL_33;
  }
  v17 = +[PVColorSpace extendedLinearSRGBColorSpace];
  int v18 = [v17 isEqualToCGColorSpace:a3];

  if (v18)
  {
    v6 = +[PVColorSpace extendedLinearSRGBColorSpace];
    goto LABEL_33;
  }
  v19 = +[PVColorSpace extendedDisplayP3ColorSpace];
  int v20 = [v19 isEqualToCGColorSpace:a3];

  if (v20)
  {
    v6 = +[PVColorSpace extendedDisplayP3ColorSpace];
    goto LABEL_33;
  }
  v21 = +[PVColorSpace p3d65GammaColorSpace];
  int v22 = [v21 isEqualToCGColorSpace:a3];

  if (v22)
  {
    v6 = +[PVColorSpace p3d65GammaColorSpace];
    goto LABEL_33;
  }
  v23 = +[PVColorSpace p3HLGGammaColorSpace];
  int v24 = [v23 isEqualToCGColorSpace:a3];

  if (v24)
  {
    v6 = +[PVColorSpace p3HLGGammaColorSpace];
    goto LABEL_33;
  }
  v25 = +[PVColorSpace p3PQGammaColorSpace];
  int v26 = [v25 isEqualToCGColorSpace:a3];

  if (v26)
  {
    v6 = +[PVColorSpace p3PQGammaColorSpace];
    goto LABEL_33;
  }
  v27 = +[PVColorSpace rec2020LinearColorSpace];
  int v28 = [v27 isEqualToCGColorSpace:a3];

  if (v28)
  {
    v6 = +[PVColorSpace rec2020LinearColorSpace];
    goto LABEL_33;
  }
  v29 = +[PVColorSpace rec2020GammaColorSpace];
  int v30 = [v29 isEqualToCGColorSpace:a3];

  if (v30)
  {
    v6 = +[PVColorSpace rec2020GammaColorSpace];
    goto LABEL_33;
  }
  v31 = +[PVColorSpace rec2100HLGColorSpace];
  int v32 = [v31 isEqualToCGColorSpace:a3];

  if (v32)
  {
    v6 = +[PVColorSpace rec2100HLGColorSpace];
    goto LABEL_33;
  }
  v33 = +[PVColorSpace rec2100PQColorSpace];
  int v34 = [v33 isEqualToCGColorSpace:a3];

  if (v34)
  {
    v6 = +[PVColorSpace rec2100PQColorSpace];
  }
  else
  {
LABEL_32:
    v6 = 0;
  }
LABEL_33:

  return v6;
}

+ (id)pvColorSpaceForCVPixelBuffer:(__CVBuffer *)a3
{
  v3 = a3;
  if (!a3) {
    goto LABEL_13;
  }
  CFTypeRef v4 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  if (!v4)
  {
    v3 = 0;
    goto LABEL_13;
  }
  int v5 = v4;
  unint64_t v6 = (unint64_t)CVBufferCopyAttachment(v3, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
  unint64_t v7 = (unint64_t)CVBufferCopyAttachment(v3, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  CFTypeRef v8 = CVBufferCopyAttachment(v3, @"LogTransferFunction", 0);
  if (!v8)
  {
LABEL_17:
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24AC0]))
    {
      int v12 = +[PVColorSpace p3d65GammaColorSpace];
      if (v7)
      {
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BD8]))
        {
          uint64_t v13 = +[PVColorSpace p3HLGGammaColorSpace];
LABEL_28:
          v3 = (__CVBuffer *)v13;

          goto LABEL_8;
        }
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BF8]))
        {
          uint64_t v13 = +[PVColorSpace p3PQGammaColorSpace];
          goto LABEL_28;
        }
      }
      v3 = (__CVBuffer *)v12;
      goto LABEL_8;
    }
    if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24AB0]))
    {
      if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24AA8]))
      {
        if (v7)
        {
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BD8]))
          {
            uint64_t v10 = +[PVColorSpace rec2100HLGColorSpace];
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BF8]))
          {
            uint64_t v10 = +[PVColorSpace rec2100PQColorSpace];
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE8]))
          {
            uint64_t v10 = +[PVColorSpace rec2020LinearColorSpace];
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE0])
            || CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BD0]))
          {
            uint64_t v10 = +[PVColorSpace rec2020GammaColorSpace];
            goto LABEL_7;
          }
        }
      }
      else if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24AC8]))
      {
        if (v7)
        {
          v3 = 0;
          if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE0]) || !v6) {
            goto LABEL_8;
          }
          if (CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E4F24C40]))
          {
            uint64_t v10 = +[PVColorSpace rec601_SMPTE_C_GammaColorSpace];
            goto LABEL_7;
          }
        }
      }
      else
      {
        v3 = 0;
        if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24AA0])) {
          goto LABEL_8;
        }
        if (!v7) {
          goto LABEL_8;
        }
        v3 = 0;
        if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE0]) || !v6) {
          goto LABEL_8;
        }
        if (CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E4F24C40]))
        {
          uint64_t v10 = +[PVColorSpace rec601_EBU_3213_GammaColorSpace];
          goto LABEL_7;
        }
      }
      v3 = 0;
      goto LABEL_8;
    }
    if (v7 | v6)
    {
      if (v6 && CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E4F24C40]))
      {
        uint64_t v10 = +[PVColorSpace rec601_1_1_6_GammaColorSpace];
        goto LABEL_7;
      }
      if (!v7) {
        goto LABEL_56;
      }
      if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE0]))
      {
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24BE8]))
        {
          uint64_t v10 = +[PVColorSpace rec709LinearColorSpace];
          goto LABEL_7;
        }
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E4F24C10]))
        {
          uint64_t v10 = +[PVColorSpace sRGBColorSpace];
          goto LABEL_7;
        }
LABEL_56:
        NSLog(&cfstr_UnknownTransfe.isa, v7, v6);
      }
    }
    uint64_t v10 = +[PVColorSpace rec709GammaColorSpace];
    goto LABEL_7;
  }
  v9 = v8;
  if (!CFEqual(v8, @"AppleLog") && !CFEqual(v9, @"com.apple.rec2020.apple-log"))
  {
    CFRelease(v9);
    goto LABEL_17;
  }
  CFRelease(v9);
  uint64_t v10 = +[PVColorSpace ProResLogColorSpace];
LABEL_7:
  v3 = (__CVBuffer *)v10;
LABEL_8:
  CFRelease(v5);
  if (v7) {
    CFRelease((CFTypeRef)v7);
  }
  if (v6) {
    CFRelease((CFTypeRef)v6);
  }
LABEL_13:

  return v3;
}

- (PVColorSpace)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PVColorSpace;
  result = [(PVColorSpace *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PVColorSpace allocWithZone:a3] init];
  if (result) {
    *((_DWORD *)result + 2) = self->_type;
  }
  return result;
}

- (BOOL)isSRGBColorSpace
{
  return self->_type == 0;
}

- (BOOL)isRec601_1_1_6_GammaColorSpace
{
  return self->_type == 1;
}

- (BOOL)isRec601_SMPTE_C_GammaColorSpace
{
  return self->_type == 2;
}

- (BOOL)isRec601_EBU_3213_GammaColorSpace
{
  return self->_type == 3;
}

- (BOOL)isRec709GammaColorSpace
{
  return self->_type == 4;
}

- (BOOL)isRec709LinearColorSpace
{
  return self->_type == 5;
}

- (BOOL)isExtendedSRGBColorSpace
{
  return self->_type == 6;
}

- (BOOL)isExtendedLinearSRGBColorSpace
{
  return self->_type == 7;
}

- (BOOL)isExtendedDisplayP3ColorSpace
{
  return self->_type == 8;
}

- (BOOL)isP3d65GammaColorSpace
{
  return self->_type == 9;
}

- (BOOL)isP3HLGGammaColorSpace
{
  return self->_type == 10;
}

- (BOOL)isP3PQGammaColorSpace
{
  return self->_type == 11;
}

- (BOOL)isRec2100HLGColorSpace
{
  return self->_type == 12;
}

- (BOOL)isRec2100PQColorSpace
{
  return self->_type == 13;
}

- (BOOL)isRec2020LinearColorSpace
{
  return self->_type == 14;
}

- (BOOL)isRec2020GammaColorSpace
{
  return self->_type == 15;
}

- (BOOL)isProResLogColorSpace
{
  return self->_type == 16;
}

- (BOOL)isWideGamutSpace
{
  if ([(PVColorSpace *)self isExtendedSRGBColorSpace]
    || [(PVColorSpace *)self isExtendedLinearSRGBColorSpace]
    || [(PVColorSpace *)self isExtendedDisplayP3ColorSpace]
    || [(PVColorSpace *)self isP3d65GammaColorSpace]
    || [(PVColorSpace *)self isRec2020LinearColorSpace]
    || [(PVColorSpace *)self isRec2020GammaColorSpace])
  {
    return 1;
  }

  return [(PVColorSpace *)self isHDRSpace];
}

- (BOOL)isHDRSpace
{
  if ([(PVColorSpace *)self isP3HLGGammaColorSpace]
    || [(PVColorSpace *)self isP3PQGammaColorSpace]
    || [(PVColorSpace *)self isRec2100HLGColorSpace]
    || [(PVColorSpace *)self isRec2100PQColorSpace])
  {
    return 1;
  }

  return [(PVColorSpace *)self isProResLogColorSpace];
}

- (BOOL)isEqualToCGColorSpace:(CGColorSpace *)a3
{
  CFTypeRef v4 = [(PVColorSpace *)self cgColorSpace];
  BOOL result = 0;
  if (a3)
  {
    if (v4) {
      return CFEqual(v4, a3) != 0;
    }
  }
  return result;
}

- (id)nclcTriplet
{
  {
    int v16 = self;
    self = v16;
    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F24AB0];
      uint64_t v6 = *MEMORY[0x1E4F24C10];
      uint64_t v7 = *MEMORY[0x1E4F24C48];
      -[PVColorSpace nclcTriplet]::s_NCLCTripletsMap[0] = MakePVNCLCTriplet(*MEMORY[0x1E4F24AB0], 0, *MEMORY[0x1E4F24C10], 13, *MEMORY[0x1E4F24C48], 1);
      uint64_t v8 = *MEMORY[0x1E4F24BE0];
      uint64_t v9 = *MEMORY[0x1E4F24C40];
      qword_1EB9A06B8 = MakePVNCLCTriplet(v5, 0, *MEMORY[0x1E4F24BE0], 1, *MEMORY[0x1E4F24C40], 2);
      qword_1EB9A06C0 = MakePVNCLCTriplet(*MEMORY[0x1E4F24AC8], 2, v8, 1, v9, 2);
      qword_1EB9A06C8 = MakePVNCLCTriplet(*MEMORY[0x1E4F24AA0], 1, v8, 1, v9, 2);
      qword_1EB9A06D0 = MakePVNCLCTriplet(v5, 0, v8, 1, v7, 1);
      uint64_t v10 = *MEMORY[0x1E4F24BE8];
      qword_1EB9A06D8 = MakePVNCLCTriplet(v5, 0, *MEMORY[0x1E4F24BE8], 8, v7, 1);
      qword_1EB9A06E0 = MakePVNCLCTriplet(v5, 0, v6, 13, v7, 1);
      qword_1EB9A06E8 = MakePVNCLCTriplet(v5, 0, v10, 8, v7, 1);
      uint64_t v11 = *MEMORY[0x1E4F24AC0];
      qword_1EB9A06F0 = MakePVNCLCTriplet(*MEMORY[0x1E4F24AC0], 5, v6, 13, v7, 1);
      qword_1EB9A06F8 = MakePVNCLCTriplet(v11, 5, v8, 1, v7, 1);
      uint64_t v12 = *MEMORY[0x1E4F24BD8];
      qword_1EB9A0700 = MakePVNCLCTriplet(v11, 5, *MEMORY[0x1E4F24BD8], 18, v7, 1);
      uint64_t v13 = *MEMORY[0x1E4F24BF8];
      qword_1EB9A0708 = MakePVNCLCTriplet(v11, 5, *MEMORY[0x1E4F24BF8], 16, v7, 1);
      uint64_t v14 = *MEMORY[0x1E4F24AA8];
      uint64_t v15 = *MEMORY[0x1E4F24C30];
      qword_1EB9A0710 = MakePVNCLCTriplet(*MEMORY[0x1E4F24AA8], 3, v12, 18, *MEMORY[0x1E4F24C30], 3);
      qword_1EB9A0718 = MakePVNCLCTriplet(v14, 3, v13, 16, v15, 3);
      qword_1EB9A0720 = MakePVNCLCTriplet(v14, 3, v10, 8, v15, 3);
      qword_1EB9A0728 = MakePVNCLCTriplet(v14, 3, v8, 1, v15, 3);
      qword_1EB9A0730 = MakePVNCLCTriplet(v14, 3, v8, 1, v15, 3);
      qword_1EB9A0738 = MakePVNCLCTriplet(0, 0, 0, 1, 0, 0);
      self = v16;
    }
  }
  v2 = (void *)-[PVColorSpace nclcTriplet]::s_NCLCTripletsMap[self->_type];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (PVColorSpace *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    BOOL v5 = self->_type == v4->_type;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)name
{
  uint64_t type = self->_type;
  if (type > 0x10) {
    return @"unknown";
  }
  else {
    return off_1E6169F60[type];
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PVColorSpace *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (CGColorSpace)cgColorSpace
{
  uint64_t type = self->_type;
  switch((int)type)
  {
    case 1:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = *(void *)"";
      block[2] = __28__PVColorSpace_cgColorSpace__block_invoke;
      block[3] = &unk_1E61689B0;
      block[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601Gamma != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601Gamma, block);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601Gamma;
      break;
    case 2:
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = *(void *)"";
      v6[2] = __28__PVColorSpace_cgColorSpace__block_invoke_2;
      v6[3] = &unk_1E61689B0;
      v6[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601_SMPTE_C_Gamma != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601_SMPTE_C_Gamma, v6);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601_SMPTE_C_Gamma;
      break;
    case 3:
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = *(void *)"";
      v5[2] = __28__PVColorSpace_cgColorSpace__block_invoke_3;
      v5[3] = &unk_1E61689B0;
      v5[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601_EBU_3213_Gamma != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601_EBU_3213_Gamma, v5);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601_EBU_3213_Gamma;
      break;
    case 6:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrsRGB != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrsRGB, &__block_literal_global_15);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedSRGB;
      break;
    case 7:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrLinearsRGB != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrLinearsRGB, &__block_literal_global_94);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedLinearSRGB;
      break;
    case 8:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrDisplayP3 != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrDisplayP3, &__block_literal_global_96);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedDisplayP3;
      break;
    case 9:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3d65 != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3d65, &__block_literal_global_98);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_displayP3;
      break;
    case 10:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3HLG != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3HLG, &__block_literal_global_100);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_p3HLGCS;
      break;
    case 11:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3PQ != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3PQ, &__block_literal_global_102);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_p3PQCS;
      break;
    case 12:
      if (-[PVColorSpace cgColorSpace]::onceToken_2100HLG != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2100HLG, &__block_literal_global_104);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2100HLGCS;
      break;
    case 13:
      if (-[PVColorSpace cgColorSpace]::onceToken_2100PQ != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2100PQ, &__block_literal_global_106);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2100PQCS;
      break;
    case 14:
      if (-[PVColorSpace cgColorSpace]::onceToken_2020Lin != -1) {
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2020Lin, &__block_literal_global_108);
      }
      BOOL result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2020LinearCS;
      break;
    default:
      uint64_t v4 = (CGColorSpace **)-[PVColorSpace cgColorSpace]::s_proCoreColorSpaceMap[type];
      BOOL result = (CGColorSpace *)PCColorSpaceCache::getCGColorSpaceByID(v4);
      break;
  }
  return result;
}

void __28__PVColorSpace_cgColorSpace__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nclcTriplet];
  -[PVColorSpace cgColorSpace]::s_601Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)[v1 colorPrimary], (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));
}

void __28__PVColorSpace_cgColorSpace__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nclcTriplet];
  -[PVColorSpace cgColorSpace]::s_601_SMPTE_C_Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)[v1 colorPrimary], (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));
}

void __28__PVColorSpace_cgColorSpace__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nclcTriplet];
  -[PVColorSpace cgColorSpace]::s_601_EBU_3213_Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)[v1 colorPrimary], (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_4()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  -[PVColorSpace cgColorSpace]::s_extendedSRGB = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_5()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  -[PVColorSpace cgColorSpace]::s_extendedLinearSRGB = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_6()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBB0]);
  -[PVColorSpace cgColorSpace]::s_extendedDisplayP3 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_7()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  -[PVColorSpace cgColorSpace]::s_displayP3 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_8()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB98]);
  -[PVColorSpace cgColorSpace]::s_p3HLGCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_9()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBA0]);
  -[PVColorSpace cgColorSpace]::s_p3PQCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_10()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC48]);
  -[PVColorSpace cgColorSpace]::s_2100HLGCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_11()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC50]);
  -[PVColorSpace cgColorSpace]::s_2100PQCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_12()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBD8]);
  -[PVColorSpace cgColorSpace]::s_2020LinearCS = (uint64_t)result;
  return result;
}

@end