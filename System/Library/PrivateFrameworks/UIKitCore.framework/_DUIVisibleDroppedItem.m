@interface _DUIVisibleDroppedItem
+ (BOOL)supportsSecureCoding;
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)targetVelocity3D;
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)velocity3D;
- (BOOL)constrainSize;
- (BOOL)flipped;
- (BOOL)precisionMode;
- (CGAffineTransform)appliedTransform;
- (CGPoint)center;
- (CGVector)targetVelocity;
- (CGVector)velocity;
- (_DUIImageComponent)imageComponent;
- (_DUIPreview)preview;
- (_DUIVisibleDroppedItem)init;
- (_DUIVisibleDroppedItem)initWithCoder:(id)a3;
- (double)rotation;
- (id)createSnapshotView;
- (id)description;
- (unint64_t)itemIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAppliedTransform:(CGAffineTransform *)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setConstrainSize:(BOOL)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setImageComponent:(id)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setPrecisionMode:(BOOL)a3;
- (void)setPreview:(id)a3;
- (void)setRotation:(double)a3;
- (void)setTargetVelocity3D:(id)a3;
- (void)setTargetVelocity:(CGVector)a3;
- (void)setVelocity3D:(id)a3;
- (void)setVelocity:(CGVector)a3;
@end

@implementation _DUIVisibleDroppedItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIVisibleDroppedItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)_DUIVisibleDroppedItem;
  result = [(_DUIVisibleDroppedItem *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_appliedTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_appliedTransform.c = v4;
    *(_OWORD *)&result->_appliedTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (_DUIVisibleDroppedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DUIVisibleDroppedItem;
  objc_super v5 = [(_DUIVisibleDroppedItem *)&v19 init];
  if (v5)
  {
    *((void *)v5 + 13) = [v4 decodeIntegerForKey:@"itemIndex"];
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", @"center");
    *((void *)v5 + 1) = v6;
    *((void *)v5 + 2) = v7;
    *((void *)v5 + 3) = v8;
    v9 = (long long *)(v5 + 136);
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"appliedTransform"];
      long long *v9 = v16;
      *(_OWORD *)(v5 + 152) = v17;
      *(_OWORD *)(v5 + 168) = v18;
      objc_msgSend(v4, "_uikit_decodeSPVector3DForKey:", @"velocity");
      *((_OWORD *)v5 + 2) = v16;
      *((_OWORD *)v5 + 3) = v17;
      objc_msgSend(v4, "_uikit_decodeSPVector3DForKey:", @"targetVelocity");
    }
    else
    {
      *(_OWORD *)(v5 + 152) = 0u;
      *(_OWORD *)(v5 + 168) = 0u;
      long long *v9 = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *((_OWORD *)v5 + 3) = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
    }
    *((_OWORD *)v5 + 4) = v16;
    *((_OWORD *)v5 + 5) = v17;
    v5[96] = objc_msgSend(v4, "decodeBoolForKey:", @"constrainSize", v16, v17);
    v5[97] = [v4 decodeBoolForKey:@"flipped"];
    v5[98] = [v4 decodeBoolForKey:@"precisionMode"];
    [v4 decodeDoubleForKey:@"rotation"];
    *((void *)v5 + 16) = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];
    v12 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageComponent"];
    v14 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v13;
  }
  return (_DUIVisibleDroppedItem *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t itemIndex = self->_itemIndex;
  id v5 = a3;
  [v5 encodeInteger:itemIndex forKey:@"itemIndex"];
  [v5 encodeObject:self->_imageComponent forKey:@"imageComponent"];
  long long v6 = *(_OWORD *)&self->_appliedTransform.c;
  long long v9 = *(_OWORD *)&self->_appliedTransform.a;
  long long v10 = v6;
  long long v11 = *(_OWORD *)&self->_appliedTransform.tx;
  [v5 encodeCGAffineTransform:&v9 forKey:@"appliedTransform"];
  objc_msgSend(v5, "ui_encodeCAPoint3D:forKey:", @"center", self->_center.x, self->_center.y, self->_center.z);
  long long v7 = *(_OWORD *)&self->_velocity3D.var0.z;
  long long v9 = *(_OWORD *)&self->_velocity3D.var0.x;
  long long v10 = v7;
  objc_msgSend(v5, "_uikit_encodeSPVector3D:forKey:", &v9, @"velocity");
  long long v8 = *(_OWORD *)&self->_targetVelocity3D.var0.z;
  long long v9 = *(_OWORD *)&self->_targetVelocity3D.var0.x;
  long long v10 = v8;
  objc_msgSend(v5, "_uikit_encodeSPVector3D:forKey:", &v9, @"targetVelocity");
  [v5 encodeBool:self->_constrainSize forKey:@"constrainSize"];
  [v5 encodeBool:self->_flipped forKey:@"flipped"];
  [v5 encodeBool:self->_precisionMode forKey:@"precisionMode"];
  [v5 encodeDouble:@"rotation" forKey:self->_rotation];
  [v5 encodeObject:self->_preview forKey:@"preview"];
}

- (CGVector)velocity
{
  double x = self->_velocity3D.var0.x;
  double y = self->_velocity3D.var0.y;
  result.ddouble y = y;
  result.ddouble x = x;
  return result;
}

- (void)setVelocity:(CGVector)a3
{
  self->_velocity3D.var0.double x = a3.dx;
  *(_OWORD *)&self->_velocity3D.var0.double y = *(unint64_t *)&a3.dy;
  self->_velocity3D.var0._padding = 0.0;
}

- (CGVector)targetVelocity
{
  double x = self->_targetVelocity3D.var0.x;
  double y = self->_targetVelocity3D.var0.y;
  result.ddouble y = y;
  result.ddouble x = x;
  return result;
}

- (void)setTargetVelocity:(CGVector)a3
{
  self->_targetVelocity3D.var0.double x = a3.dx;
  *(_OWORD *)&self->_targetVelocity3D.var0.double y = *(unint64_t *)&a3.dy;
  self->_targetVelocity3D.var0._padding = 0.0;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center.double x = a3.x;
  self->_center.double y = a3.y;
  self->_center.z = 0.0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v10 = *(_OWORD *)&self->_itemIndex;
  preview = self->_preview;
  long long v6 = _NSStringFromCAPoint3D(self->_center.x, self->_center.y, self->_center.z);
  long long v7 = [NSString stringWithFormat:@"(x = %f, y = %f, z = %f)", *(void *)&self->_velocity3D.var0.x, *(void *)&self->_velocity3D.var0.y, *(void *)&self->_velocity3D.var0.z];
  long long v8 = [v3 stringWithFormat:@"<%@ %p: itemIndex=%lu imageComponent=%@ preview=%@ center=%@ velocity=%@>", v4, self, v10, preview, v6, v7];

  return v8;
}

- (id)createSnapshotView
{
  uint64_t v3 = [(_DUIVisibleDroppedItem *)self imageComponent];
  if (v3)
  {
    uint64_t v4 = [(_DUIVisibleDroppedItem *)self preview];
    id v5 = [v3 createSnapshotViewForPreview:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_unint64_t itemIndex = a3;
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (CGAffineTransform)appliedTransform
{
  long long v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setAppliedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_appliedTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_appliedTransform.c = v4;
  *(_OWORD *)&self->_appliedTransform.a = v3;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)velocity3D
{
  long long v3 = *(_OWORD *)&self->_velocity3D.var0.x;
  long long v4 = *(_OWORD *)&self->_velocity3D.var0.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setVelocity3D:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self->_velocity3D.var0.double x = *v3;
  *(_OWORD *)&self->_velocity3D.var0.z = v4;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)targetVelocity3D
{
  long long v3 = *(_OWORD *)&self->_targetVelocity3D.var0.x;
  long long v4 = *(_OWORD *)&self->_targetVelocity3D.var0.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setTargetVelocity3D:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self->_targetVelocity3D.var0.double x = *v3;
  *(_OWORD *)&self->_targetVelocity3D.var0.z = v4;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (void)setConstrainSize:(BOOL)a3
{
  self->_constrainSize = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)precisionMode
{
  return self->_precisionMode;
}

- (void)setPrecisionMode:(BOOL)a3
{
  self->_precisionMode = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
}

@end