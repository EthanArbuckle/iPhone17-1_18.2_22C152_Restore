@interface OADSubBlip
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoaded;
- (CGRect)frame;
- (CGSize)sizeInPoints;
- (OADSubBlip)initWithData:(id)a3 type:(int)a4;
- (id)data;
- (int)sizeInBytes;
- (int)type;
- (unint64_t)hash;
- (void)setData:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSizeInBytes:(int)a3;
- (void)setSizeInPoints:(CGSize)a3;
- (void)setType:(int)a3;
@end

@implementation OADSubBlip

- (OADSubBlip)initWithData:(id)a3 type:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADSubBlip;
  id v8 = [(OADSubBlip *)&v11 init];
  v9 = (OADSubBlip *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 3, a3);
    *((_DWORD *)&v9->super.super.mLoaded + 1) = a4;
    if (v7) {
      LODWORD(v9->mSizeInPoints.height) = [v7 length];
    }
  }

  return v9;
}

- (BOOL)isLoaded
{
  if (!*(void *)&self->mType) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)OADSubBlip;
  return [(OCDDelayedNode *)&v3 isLoaded];
}

- (void)setData:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->mType, a3);
  v5 = v6;
  if (v6)
  {
    LODWORD(self->mSizeInPoints.height) = [v6 length];
    v5 = v6;
  }
}

- (int)type
{
  return *((_DWORD *)&self->super.super.mLoaded + 1);
}

- (id)data
{
  return *(id *)&self->mType;
}

- (void)setSizeInPoints:(CGSize)a3
{
  *(CGSize *)&self->mData = a3;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)&self->mSizeInBytes = a3;
}

- (void)setSizeInBytes:(int)a3
{
  LODWORD(self->mSizeInPoints.height) = a3;
}

- (void)setType:(int)a3
{
  *((_DWORD *)&self->super.super.mLoaded + 1) = a3;
}

- (CGSize)sizeInPoints
{
  mData = self->mData;
  double width = self->mSizeInPoints.width;
  result.height = width;
  result.double width = *(double *)&mData;
  return result;
}

- (int)sizeInBytes
{
  return LODWORD(self->mSizeInPoints.height);
}

- (CGRect)frame
{
  double v2 = *(double *)&self->mSizeInBytes;
  double x = self->mFrame.origin.x;
  double y = self->mFrame.origin.y;
  double width = self->mFrame.size.width;
  result.size.height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = v2;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = *((unsigned int *)&self->super.super.mLoaded + 1);
  uint64_t v4 = [*(id *)&self->mType hash];
  int8x16_t v5 = veorq_s8((int8x16_t)vcvtq_u64_f64(*(float64x2_t *)&self->mData), (int8x16_t)vcvtq_u64_f64(*(float64x2_t *)&self->mFrame.origin.y));
  return *(void *)&veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) ^ (unint64_t)*(double *)&self->mSizeInBytes ^ v4 ^ (unint64_t)self->mFrame.origin.x ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0;
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_13;
  }
  int8x16_t v5 = (objc_object **)v4;
  id v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  int v7 = *((_DWORD *)&self->super.super.mLoaded + 1);
  if (v7 != [v5 type]
    || !TCObjectEqual(*(objc_object **)&self->mType, v6[3]))
  {
    goto LABEL_12;
  }
  mData = self->mData;
  double width = self->mSizeInPoints.width;
  [v6 sizeInPoints];
  if (*(double *)&mData != v11 || width != v10) {
    goto LABEL_12;
  }
  CGFloat v13 = *(double *)&self->mSizeInBytes;
  CGFloat x = self->mFrame.origin.x;
  CGFloat y = self->mFrame.origin.y;
  CGFloat v16 = self->mFrame.size.width;
  [v6 frame];
  v24.origin.CGFloat x = v17;
  v24.origin.CGFloat y = v18;
  v24.size.double width = v19;
  v24.size.height = v20;
  v23.origin.CGFloat x = v13;
  v23.origin.CGFloat y = x;
  v23.size.double width = y;
  v23.size.height = v16;
  BOOL v21 = CGRectEqualToRect(v23, v24);
LABEL_13:

  return v21;
}

- (void).cxx_destruct
{
}

@end