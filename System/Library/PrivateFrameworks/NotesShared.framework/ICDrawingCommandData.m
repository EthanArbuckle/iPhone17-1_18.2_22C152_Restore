@interface ICDrawingCommandData
- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)baseValues;
- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)readPointFromArchive:(SEL)a3 deltaFrom:(const void *)a4;
- ($1AB5FA073B851C12C2339EC22442E995)parameters;
- ($1AB5FA073B851C12C2339EC22442E995)version1Parameters;
- (BOOL)isClipped;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualDrawingCommandData:(id)a3;
- (CGColor)color;
- (CGPoint)clipNormal;
- (CGPoint)clipOrigin;
- (CGRect)bounds;
- (ICDrawingCommandData)init;
- (ICDrawingCommandData)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5;
- (ICDrawingCommandID)commandID;
- (double)renderCost;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
- (unsigned)randomSeed;
- (unsigned)savePoint:(id *)a3 deltaFrom:(id *)a4 toArchive:(void *)a5;
- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5 isHidden:(BOOL)a6;
- (unsigned)type;
- (void)dealloc;
- (void)invalidateBounds;
- (void)points;
- (void)setBaseValues:(id *)a3;
- (void)setClipNormal:(CGPoint)a3;
- (void)setClipOrigin:(CGPoint)a3;
- (void)setColor:(CGColor *)a3;
- (void)setCommandID:(ICDrawingCommandID *)a3;
- (void)setIsClipped:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation ICDrawingCommandData

- (ICDrawingCommandData)init
{
  v4.receiver = self;
  v4.super_class = (Class)ICDrawingCommandData;
  result = [(ICDrawingCommandData *)&v4 init];
  if (result)
  {
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_cachedBounds.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_cachedBounds.origin = v3;
  }
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  self->_color = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICDrawingCommandData;
  [(ICDrawingCommandData *)&v3 dealloc];
}

- (BOOL)isEqualDrawingCommandData:(id)a3
{
  id v4 = a3;
  [(ICDrawingCommandData *)self commandID];
  if (v4)
  {
    [v4 commandID];
    int v5 = v8;
  }
  else
  {
    int v5 = 0;
    v9 = 0;
    int v10 = 0;
  }
  if (v11 == v5 && v13 == v10) {
    char v6 = [v12 isEqual:v9];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ICDrawingCommandData *)self isEqualDrawingCommandData:v4];

  return v5;
}

- (unint64_t)hash
{
  [(ICDrawingCommandData *)self commandID];
  int v3 = v10;
  [(ICDrawingCommandData *)self commandID];
  int v4 = v9;
  [(ICDrawingCommandData *)self commandID];
  unint64_t v5 = [v7 hash] ^ v3 ^ (v4 << 16);

  return v5;
}

- (unsigned)randomSeed
{
  return [(ICDrawingCommandData *)self hash];
}

- (void)invalidateBounds
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_cachedBounds.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_cachedBounds.origin = v2;
}

- (double)renderCost
{
  return (double)(unint64_t)((self->_points.__end_ - self->_points.__begin_) >> 6);
}

- (CGRect)bounds
{
  if (CGRectIsNull(self->_cachedBounds))
  {
    uint64_t v3 = *MEMORY[0x1E4F1DB20];
    uint64_t v4 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    begin = self->_points.__begin_;
    for (i = self->_points.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 64))
    {
      if (*((double *)begin + 6) >= 1.0) {
        double v9 = *((double *)begin + 6);
      }
      else {
        double v9 = 1.0;
      }
      double v10 = (*((double *)begin + 2) + *((double *)begin + 5)) * v9;
      v12.origin.x = *(double *)begin - v10 + -2.0;
      v12.origin.y = *((double *)begin + 1) - v10 + -2.0;
      v12.size.width = v10 * 2.0 + 4.0;
      v12.size.height = v12.size.width;
      *(CGRect *)&uint64_t v3 = CGRectUnion(*(CGRect *)&v3, v12);
    }
    CGRect result = CGRectIntegral(*(CGRect *)&v3);
    self->_cachedBounds = result;
  }
  else
  {
    return self->_cachedBounds;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p type=%ld points=%ld>", v5, self, self->_type, (self->_points.__end_ - self->_points.__begin_) >> 6];

  return v6;
}

- (void)points
{
  return &self->_points;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (CGColor)color
{
  return self->_color;
}

- (void)setColor:(CGColor *)a3
{
}

- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)baseValues
{
  long long v3 = *(_OWORD *)&self[2].var5;
  retstr->var0 = *(CGPoint *)&self[2].var3;
  *(_OWORD *)&retstr->var1 = v3;
  long long v4 = *(_OWORD *)&self[3].var1;
  *(CGPoint *)&retstr->var3 = self[3].var0;
  *(_OWORD *)&retstr->var5 = v4;
  return self;
}

- (void)setBaseValues:(id *)a3
{
  CGPoint var0 = a3->var0;
  long long v4 = *(_OWORD *)&a3->var1;
  long long v5 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_baseValues.azimuth = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_baseValues.aspectRatio = v5;
  self->_baseValues.point = var0;
  *(_OWORD *)&self->_baseValues.radius = v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)parameters
{
  double baseAlpha = self->_parameters.baseAlpha;
  double blendAlpha = self->_parameters.blendAlpha;
  double targetMultiple = self->_parameters.targetMultiple;
  result.var2 = targetMultiple;
  result.var1 = blendAlpha;
  result.CGPoint var0 = baseAlpha;
  return result;
}

- (void)setParameters:(id)a3
{
  self->_parameters = ($D0E20E97318CF8C4151E8D3C9DB23823)a3;
}

- (BOOL)isClipped
{
  return self->_isClipped;
}

- (void)setIsClipped:(BOOL)a3
{
  self->_isClipped = a3;
}

- (CGPoint)clipOrigin
{
  double x = self->_clipOrigin.x;
  double y = self->_clipOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setClipOrigin:(CGPoint)a3
{
  self->_clipOrigin = a3;
}

- (CGPoint)clipNormal
{
  double x = self->_clipNormal.x;
  double y = self->_clipNormal.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setClipNormal:(CGPoint)a3
{
  self->_clipNormal = a3;
}

- (ICDrawingCommandID)commandID
{
  retstr->clock = self->_commandID.clock;
  CGPoint result = self->_commandID.replicaUUID;
  retstr->replicaUUID = (NSUUID *)result;
  retstr->subclock = self->_commandID.subclock;
  return result;
}

- (void)setCommandID:(ICDrawingCommandID *)a3
{
  self->_commandID.clock = a3->clock;
  objc_storeStrong((id *)&self->_commandID.replicaUUID, a3->replicaUUID);
  self->_commandID.subclock = a3->subclock;
  replicaUUID = a3->replicaUUID;
}

- (void).cxx_destruct
{
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 18) = 0;
  return self;
}

- (ICDrawingCommandData)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v73 = a5;
  id v8 = [(ICDrawingCommandData *)self init];
  double v9 = v8;
  if (!v8) {
    goto LABEL_69;
  }
  double v10 = (drawing::Command *)[(ICDrawingCommandData *)v8 setType:*((unsigned int *)a3 + 32)];
  uint64_t v11 = *((void *)a3 + 5);
  if (!v11) {
    uint64_t v11 = *(void *)(drawing::Command::default_instance(v10) + 40);
  }
  objc_msgSend(v73, "objectAtIndexedSubscript:", *(unsigned int *)(v11 + 48), 0);
  CGRect v12 = (drawing::Command *)objc_claimAutoreleasedReturnValue();
  int v13 = v12;
  uint64_t v14 = *((void *)a3 + 5);
  if (v14)
  {
    int v15 = *(_DWORD *)(v14 + 40);
  }
  else
  {
    v16 = (drawing::Command *)drawing::Command::default_instance(v12);
    uint64_t v14 = *((void *)a3 + 5);
    int v15 = *(_DWORD *)(*((void *)v16 + 5) + 40);
    if (!v14) {
      uint64_t v14 = *(void *)(drawing::Command::default_instance(v16) + 40);
    }
  }
  int v17 = *(_DWORD *)(v14 + 44);
  int v77 = v15;
  v72 = v13;
  v78 = v72;
  int v79 = v17;
  v18 = (drawing::Command *)[(ICDrawingCommandData *)v9 setCommandID:&v77];
  if ((*((unsigned char *)a3 + 32) & 4) != 0)
  {
    v23 = (float *)*((void *)a3 + 6);
    if (v23)
    {
      double v20 = v23[10];
      double v21 = v23[11];
    }
    else
    {
      v25 = (drawing::Command *)drawing::Command::default_instance(v18);
      v23 = (float *)*((void *)a3 + 6);
      double v20 = *(float *)(*((void *)v25 + 6) + 40);
      if (v23)
      {
        float v24 = v23[12];
        double v21 = v23[11];
        goto LABEL_15;
      }
      v70 = (drawing::Command *)drawing::Command::default_instance(v25);
      v23 = (float *)*((void *)a3 + 6);
      double v21 = *(float *)(*((void *)v70 + 6) + 44);
      if (!v23)
      {
        v71 = (drawing::Command *)drawing::Command::default_instance(v70);
        v23 = (float *)*((void *)a3 + 6);
        float v24 = *(float *)(*((void *)v71 + 6) + 48);
        if (!v23) {
          v23 = *(float **)(drawing::Command::default_instance(v71) + 48);
        }
        goto LABEL_15;
      }
    }
    float v24 = v23[12];
LABEL_15:
    double v22 = v24;
    double v19 = v23[13];
    goto LABEL_16;
  }
  double v19 = 1.0;
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = 0.0;
LABEL_16:
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = v20;
  components[1] = v21;
  *(double *)&long long v81 = v22;
  *((double *)&v81 + 1) = v19;
  CGColorRef v27 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  CFAutorelease(v27);
  v28 = (drawing::Command *)[(ICDrawingCommandData *)v9 setColor:v27];
  int v29 = *((_DWORD *)a3 + 8);
  if ((v29 & 8) != 0)
  {
    uint64_t v30 = *((void *)a3 + 7);
    if (!v30) {
      uint64_t v30 = *(void *)(drawing::Command::default_instance(v28) + 56);
    }
    [(ICDrawingCommandData *)v9 readPointFromArchive:v30 deltaFrom:&ICDrawingOutputPointDefault];
    *(_OWORD *)v76 = *(_OWORD *)&v76[9];
    *(_OWORD *)&v76[2] = *(_OWORD *)&v76[11];
    *(_OWORD *)&v76[4] = *(_OWORD *)&v76[13];
    *(_OWORD *)&v76[6] = *(_OWORD *)&v76[15];
    v28 = (drawing::Command *)[(ICDrawingCommandData *)v9 setBaseValues:v76];
    int v29 = *((_DWORD *)a3 + 8);
  }
  if ((v29 & 0x200) != 0)
  {
    uint64_t v32 = *((void *)a3 + 15);
    if (!v32) {
      uint64_t v32 = *(void *)(drawing::Command::default_instance(v28) + 120);
    }
    int v33 = *(_DWORD *)(v32 + 32);
    double v34 = 0.0;
    double v35 = 0.0;
    if (v33) {
      double v35 = *(float *)(v32 + 40);
    }
    if ((v33 & 2) != 0) {
      double v34 = *(float *)(v32 + 44);
    }
    double v36 = 0.0;
    if ((v33 & 4) != 0) {
      double v36 = *(float *)(v32 + 48);
    }
    v31 = (drawing::Command *)-[ICDrawingCommandData setParameters:](v9, "setParameters:", v35, v34, v36);
  }
  else
  {
    [(ICDrawingCommandData *)v9 version1Parameters];
    v31 = (drawing::Command *)-[ICDrawingCommandData setParameters:](v9, "setParameters:");
  }
  if ((*((unsigned char *)a3 + 32) & 0x80) != 0)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    *(_OWORD *)components = 0u;
    long long v81 = 0u;
    uint64_t v37 = *((void *)a3 + 13);
    if (!v37) {
      uint64_t v37 = *(void *)(drawing::Command::default_instance(v31) + 104);
    }
    [(ICDrawingCommandData *)v9 baseValues];
    v38 = [(ICDrawingCommandData *)v9 readPointFromArchive:v37 deltaFrom:v75];
    memset(v75, 0, sizeof(v75));
    uint64_t v39 = *((void *)a3 + 14);
    if (!v39) {
      uint64_t v39 = *(void *)(drawing::Command::default_instance(v38) + 112);
    }
    [(ICDrawingCommandData *)v9 baseValues];
    [(ICDrawingCommandData *)v9 readPointFromArchive:v39 deltaFrom:v74];
    [(ICDrawingCommandData *)v9 setIsClipped:1];
    -[ICDrawingCommandData setClipOrigin:](v9, "setClipOrigin:", components[0], components[1]);
    [(ICDrawingCommandData *)v9 setClipNormal:v75[0]];
  }
  v40 = [(ICDrawingCommandData *)v9 points];
  unint64_t v41 = *((unsigned int *)a3 + 18);
  if (v41)
  {
    v42 = v40;
    std::vector<ICDrawingOutputPoint>::reserve(v40, v41);
    int v43 = *((_DWORD *)a3 + 18);
    if (v43)
    {
      int v44 = 0;
      v45 = v42 + 2;
      do
      {
        uint64_t v46 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<drawing::Point>::TypeHandler>((uint64_t)a3 + 64, v44);
        long long v82 = 0u;
        long long v83 = 0u;
        *(_OWORD *)components = 0u;
        long long v81 = 0u;
        [(ICDrawingCommandData *)v9 baseValues];
        v40 = [(ICDrawingCommandData *)v9 readPointFromArchive:v46 deltaFrom:v75];
        v47 = (double *)v42[1];
        if (a4 || !v44 || (components[0] == *(v47 - 8) ? (BOOL v48 = components[1] == *(v47 - 7)) : (BOOL v48 = 0), !v48))
        {
          if ((unint64_t)v47 >= *v45)
          {
            uint64_t v53 = ((char *)v47 - (unsigned char *)*v42) >> 6;
            unint64_t v54 = v53 + 1;
            if ((unint64_t)(v53 + 1) >> 58) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v55 = *v45 - (void)*v42;
            if (v55 >> 5 > v54) {
              unint64_t v54 = v55 >> 5;
            }
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFC0) {
              unint64_t v56 = 0x3FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v56 = v54;
            }
            if (v56) {
              v40 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<ICDrawingOutputPoint>>((uint64_t)(v42 + 2), v56);
            }
            else {
              v40 = 0;
            }
            v57 = &v40[8 * v53];
            long long v58 = *(_OWORD *)components;
            long long v59 = v81;
            long long v60 = v83;
            *((_OWORD *)v57 + 2) = v82;
            *((_OWORD *)v57 + 3) = v60;
            *(_OWORD *)v57 = v58;
            *((_OWORD *)v57 + 1) = v59;
            v62 = (char *)*v42;
            v61 = (char *)v42[1];
            v63 = v57;
            if (v61 != *v42)
            {
              do
              {
                long long v64 = *((_OWORD *)v61 - 4);
                long long v65 = *((_OWORD *)v61 - 3);
                long long v66 = *((_OWORD *)v61 - 1);
                *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
                *((_OWORD *)v63 - 1) = v66;
                *((_OWORD *)v63 - 4) = v64;
                *((_OWORD *)v63 - 3) = v65;
                v63 -= 8;
                v61 -= 64;
              }
              while (v61 != v62);
              v61 = (char *)*v42;
            }
            v52 = v57 + 8;
            *v42 = v63;
            v42[1] = v57 + 8;
            v42[2] = &v40[8 * v56];
            if (v61) {
              operator delete(v61);
            }
          }
          else
          {
            long long v49 = *(_OWORD *)components;
            long long v50 = v81;
            long long v51 = v83;
            *((_OWORD *)v47 + 2) = v82;
            *((_OWORD *)v47 + 3) = v51;
            *(_OWORD *)v47 = v49;
            *((_OWORD *)v47 + 1) = v50;
            v52 = v47 + 8;
          }
          v42[1] = v52;
        }
        ++v44;
      }
      while (v44 != v43);
    }
  }
  if ((*((unsigned char *)a3 + 32) & 0x40) != 0)
  {
    v67 = (const drawing::Rectangle *)*((void *)a3 + 12);
    if (!v67) {
      v67 = *(const drawing::Rectangle **)(drawing::Command::default_instance((drawing::Command *)v40) + 96);
    }
    v68 = (drawing::Rectangle *)drawing::Rectangle::Rectangle((drawing::Rectangle *)components, v67);
    v9->_cachedBounds.origin = (CGPoint)vcvtq_f64_f32(*(float32x2_t *)((char *)&v82 + 8));
    v9->_cachedBounds.size = (CGSize)vcvtq_f64_f32(*(float32x2_t *)&v83);
    drawing::Rectangle::~Rectangle(v68);
  }

LABEL_69:
  return v9;
}

- ($1AB5FA073B851C12C2339EC22442E995)version1Parameters
{
  signed int v2 = [(ICDrawingCommandData *)self type];
  if (v2 > 3)
  {
    double v3 = 0.0;
    double v4 = 0.97;
  }
  else
  {
    double v3 = dbl_1C3DD3920[v2];
    double v4 = dbl_1C3DD3940[v2];
  }
  double v5 = 0.0;
  result.var2 = v5;
  result.var1 = v3;
  result.CGPoint var0 = v4;
  return result;
}

- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)readPointFromArchive:(SEL)a3 deltaFrom:(const void *)a4
{
  unsigned int v5 = *((_DWORD *)a4 + 8);
  int8x8_t v6 = (int8x8_t)vdup_n_s32(v5);
  int32x2_t v7 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x800000004));
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  int8x16_t v9 = *(int8x16_t *)&a5->var3;
  int8x16_t v10 = vbslq_s8(v8, *(int8x16_t *)&a5->var1, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 48)));
  int32x2_t v11 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x200000001));
  v8.i64[0] = v11.i32[0];
  v8.i64[1] = v11.i32[1];
  retstr->CGPoint var0 = (CGPoint)vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 40)), v8);
  *(int8x16_t *)&retstr->var1 = v10;
  int32x2_t v12 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x2000000010));
  v8.i64[0] = v12.i32[0];
  v8.i64[1] = v12.i32[1];
  *(int8x16_t *)&retstr->var3 = vbslq_s8(v8, v9, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 56)));
  double var5 = *((float *)a4 + 16);
  if ((v5 & 0x40) == 0) {
    double var5 = a5->var5;
  }
  retstr->double var5 = var5;
  retstr->var6 = 0.0;
  return self;
}

- (unsigned)savePoint:(id *)a3 deltaFrom:(id *)a4 toArchive:(void *)a5
{
  if (a3->var0.x != 0.0)
  {
    float x = a3->var0.x;
    *((_DWORD *)a5 + 8) |= 1u;
    *((float *)a5 + 10) = x;
  }
  double y = a3->var0.y;
  if (y != 0.0)
  {
    float v7 = y;
    *((_DWORD *)a5 + 8) |= 2u;
    *((float *)a5 + 11) = v7;
  }
  double var1 = a3->var1;
  if (var1 != a4->var1)
  {
    float v9 = var1;
    *((_DWORD *)a5 + 8) |= 4u;
    *((float *)a5 + 12) = v9;
  }
  double var2 = a3->var2;
  if (var2 != a4->var2)
  {
    float v11 = var2;
    *((_DWORD *)a5 + 8) |= 8u;
    *((float *)a5 + 13) = v11;
  }
  double var3 = a3->var3;
  if (var3 != a4->var3)
  {
    float v13 = var3;
    *((_DWORD *)a5 + 8) |= 0x10u;
    *((float *)a5 + 14) = v13;
  }
  double var4 = a3->var4;
  if (var4 != a4->var4)
  {
    float v15 = var4;
    *((_DWORD *)a5 + 8) |= 0x20u;
    *((float *)a5 + 15) = v15;
  }
  double var5 = a3->var5;
  if (var5 == a4->var5) {
    return 1;
  }
  float v17 = var5;
  *((_DWORD *)a5 + 8) |= 0x40u;
  *((float *)a5 + 16) = v17;
  return 4;
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5 isHidden:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  unsigned int v11 = [(ICDrawingCommandData *)self type];
  *((_DWORD *)a3 + 8) |= 2u;
  *((_DWORD *)a3 + 32) = v11;
  ColorSpace = CGColorGetColorSpace([(ICDrawingCommandData *)self color]);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
  {
    Components = (float64x2_t *)CGColorGetComponents([(ICDrawingCommandData *)self color]);
    *((_DWORD *)a3 + 8) |= 4u;
    uint64_t v14 = (float32x2_t *)*((void *)a3 + 6);
    if (!v14) {
      operator new();
    }
    v14[4].i32[0] |= 1u;
    *((_DWORD *)a3 + 8) |= 4u;
    v14[4].i32[0] |= 2u;
    v14[5] = vcvt_f32_f64(*Components);
    *((_DWORD *)a3 + 8) |= 4u;
    float32_t v15 = Components[1].f64[0];
    v14[4].i32[0] |= 4u;
    v14[6].f32[0] = v15;
    *((_DWORD *)a3 + 8) |= 4u;
    float32_t Alpha = CGColorGetAlpha([(ICDrawingCommandData *)self color]);
    v14[4].i32[0] |= 8u;
    v14[6].f32[1] = Alpha;
  }
  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v17 = *((void *)a3 + 5);
  if (!v17) {
    operator new();
  }
  [(ICDrawingCommandData *)self commandID];
  int v18 = v73;
  *(_DWORD *)(v17 + 32) |= 1u;
  *(_DWORD *)(v17 + 40) = v18;

  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v19 = *((void *)a3 + 5);
  if (!v19) {
    operator new();
  }
  [(ICDrawingCommandData *)self commandID];
  int v20 = v75;
  *(_DWORD *)(v19 + 32) |= 2u;
  *(_DWORD *)(v19 + 44) = v20;

  [(ICDrawingCommandData *)self commandID];
  int v21 = [v10 indexOfObject:v74];

  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v22 = *((void *)a3 + 5);
  if (!v22) {
    operator new();
  }
  *(_DWORD *)(v22 + 32) |= 4u;
  *(_DWORD *)(v22 + 48) = v21;
  if (a6)
  {
    unsigned int v23 = 1;
  }
  else
  {
    if (v7)
    {
      float v24 = [(ICDrawingCommandData *)self points];
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 64, (unint64_t)(v24[1] - *v24) >> 6);
      unint64_t v25 = v24[1] - *v24;
      if ((v25 & 0x3FFFFFFFC0) != 0)
      {
        uint64_t v26 = 0;
        uint64_t v27 = (v25 >> 6);
        do
        {
          int v28 = *((_DWORD *)a3 + 19);
          uint64_t v29 = *((int *)a3 + 18);
          if ((int)v29 >= v28)
          {
            if (v28 == *((_DWORD *)a3 + 20)) {
              google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 64, v28 + 1);
            }
            google::protobuf::internal::GenericTypeHandler<drawing::Point>::New();
          }
          uint64_t v30 = *((void *)a3 + 8);
          *((_DWORD *)a3 + 18) = v29 + 1;
          uint64_t v31 = *(void *)(v30 + 8 * v29);
          uint64_t v32 = *v24;
          [(ICDrawingCommandData *)self baseValues];
          [(ICDrawingCommandData *)self savePoint:v32 + v26 deltaFrom:&v73 toArchive:v31];
          v26 += 64;
          --v27;
        }
        while (v27);
      }
      [(ICDrawingCommandData *)self baseValues];
      *((_DWORD *)a3 + 8) |= 8u;
      uint64_t v33 = *((void *)a3 + 7);
      if (!v33) {
        operator new();
      }
      unsigned int v34 = [(ICDrawingCommandData *)self savePoint:&v73 deltaFrom:&ICDrawingOutputPointDefault toArchive:v33];
      if (v34 <= 1) {
        unsigned int v23 = 1;
      }
      else {
        unsigned int v23 = v34;
      }
      if ([(ICDrawingCommandData *)self isClipped])
      {
        *((_DWORD *)a3 + 8) |= 0x80u;
        uint64_t v35 = *((void *)a3 + 13);
        if (!v35) {
          operator new();
        }
        [(ICDrawingCommandData *)self clipOrigin];
        *(float *)&double v36 = v36;
        *(_DWORD *)(v35 + 32) |= 1u;
        *(_DWORD *)(v35 + 40) = LODWORD(v36);
        *((_DWORD *)a3 + 8) |= 0x80u;
        uint64_t v37 = *((void *)a3 + 13);
        if (!v37) {
          operator new();
        }
        [(ICDrawingCommandData *)self clipOrigin];
        float v39 = v38;
        *(_DWORD *)(v37 + 32) |= 2u;
        *(float *)(v37 + 44) = v39;
        *((_DWORD *)a3 + 8) |= 0x100u;
        uint64_t v40 = *((void *)a3 + 14);
        if (!v40) {
          operator new();
        }
        [(ICDrawingCommandData *)self clipNormal];
        *(float *)&double v41 = v41;
        *(_DWORD *)(v40 + 32) |= 1u;
        *(_DWORD *)(v40 + 40) = LODWORD(v41);
        *((_DWORD *)a3 + 8) |= 0x100u;
        uint64_t v42 = *((void *)a3 + 14);
        if (!v42) {
          operator new();
        }
        [(ICDrawingCommandData *)self clipNormal];
        float v44 = v43;
        *(_DWORD *)(v42 + 32) |= 2u;
        *(float *)(v42 + 44) = v44;
      }
    }
    else
    {
      unsigned int v23 = 1;
    }
    [(ICDrawingCommandData *)self bounds];
    double x = v76.origin.x;
    double y = v76.origin.y;
    double width = v76.size.width;
    double height = v76.size.height;
    if (!CGRectIsNull(v76))
    {
      *((_DWORD *)a3 + 8) |= 0x40u;
      uint64_t v49 = *((void *)a3 + 12);
      if (!v49) {
        operator new();
      }
      float v50 = x;
      int v51 = *(_DWORD *)(v49 + 32);
      float v52 = y;
      *(float *)(v49 + 40) = v50;
      *(float *)(v49 + 44) = v52;
      float v53 = width;
      float v54 = height;
      *(_DWORD *)(v49 + 32) = v51 | 0xF;
      *(float *)(v49 + 48) = v53;
      *(float *)(v49 + 52) = v54;
    }
    [(ICDrawingCommandData *)self baseValues];
    *((_DWORD *)a3 + 8) |= 8u;
    uint64_t v55 = *((void *)a3 + 7);
    if (!v55) {
      operator new();
    }
    [(ICDrawingCommandData *)self savePoint:&v73 deltaFrom:&ICDrawingOutputPointDefault toArchive:v55];
    [(ICDrawingCommandData *)self version1Parameters];
    double v57 = v56;
    double v59 = v58;
    [(ICDrawingCommandData *)self parameters];
    if (vabdd_f64(v60, v57) >= 0.00999999978
      || ([(ICDrawingCommandData *)self parameters], vabdd_f64(v61, v59) >= 0.00999999978)
      || ([(ICDrawingCommandData *)self parameters], v62 > 0.0))
    {
      *((_DWORD *)a3 + 8) |= 0x200u;
      uint64_t v63 = *((void *)a3 + 15);
      if (!v63) {
        operator new();
      }
      [(ICDrawingCommandData *)self parameters];
      *(float *)&double v64 = v64;
      *(_DWORD *)(v63 + 32) |= 1u;
      *(_DWORD *)(v63 + 40) = LODWORD(v64);
      [(ICDrawingCommandData *)self parameters];
      float v66 = v65;
      *(_DWORD *)(v63 + 32) |= 2u;
      *(float *)(v63 + 44) = v66;
      [(ICDrawingCommandData *)self parameters];
      if (v67 <= 0.0)
      {
        BOOL v70 = v23 > 2;
        int v71 = 2;
      }
      else
      {
        [(ICDrawingCommandData *)self parameters];
        float v69 = v68;
        *(_DWORD *)(v63 + 32) |= 4u;
        *(float *)(v63 + 48) = v69;
        BOOL v70 = v23 > 3;
        int v71 = 3;
      }
      if (!v70) {
        unsigned int v23 = v71;
      }
    }
  }

  return v23;
}

@end