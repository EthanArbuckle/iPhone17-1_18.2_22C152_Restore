@interface ODDShape
- (ODDShape)init;
- (id)adjustments;
- (id)description;
- (int)presetType;
- (int)type;
- (void)addAdjustment:(id)a3;
- (void)setPresetType:(int)a3;
- (void)setType:(int)a3;
@end

@implementation ODDShape

- (ODDShape)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDShape;
  v2 = [(ODDShape *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAdjustments = v2->mAdjustments;
    v2->mAdjustments = v3;
  }
  return v2;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)presetType
{
  return self->mPresetType;
}

- (void)setPresetType:(int)a3
{
  self->mPresetType = a3;
}

- (id)adjustments
{
  return self->mAdjustments;
}

- (void)addAdjustment:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDShape;
  v2 = [(ODDLayoutObject *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end