@interface PDBuildMapKey
- (BOOL)isEqual:(id)a3;
- (PDBuildMapKey)init;
- (PDBuildMapKey)initWithDrawable:(id)a3 groupId:(id)a4;
- (id)description;
- (id)drawable;
- (id)groupId;
- (unint64_t)hash;
- (void)setDrawable:(id)a3;
- (void)setGroupId:(id)a3;
@end

@implementation PDBuildMapKey

- (PDBuildMapKey)initWithDrawable:(id)a3 groupId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDBuildMapKey;
  v8 = [(PDBuildMapKey *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v6];
    mDrawableValue = v8->mDrawableValue;
    v8->mDrawableValue = (NSValue *)v9;

    objc_storeStrong((id *)&v8->mGroupId, a4);
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(NSValue *)self->mDrawableValue pointerValue];
  return (unint64_t)v3 + [(NSString *)self->mGroupId intValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PDBuildMapKey *)self drawable];
    id v7 = [v5 drawable];

    if (v6 != v7)
    {
LABEL_3:
      BOOL v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    if (self->mGroupId)
    {
      uint64_t v9 = [v5 groupId];

      mGroupId = self->mGroupId;
      if (v9)
      {
        v11 = [v5 groupId];
        BOOL v8 = [(NSString *)mGroupId isEqualToString:v11];
LABEL_10:

        goto LABEL_11;
      }
      if (mGroupId) {
        goto LABEL_3;
      }
    }
    v11 = [v5 groupId];
    BOOL v8 = v11 == 0;
    goto LABEL_10;
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (id)drawable
{
  return [(NSValue *)self->mDrawableValue nonretainedObjectValue];
}

- (id)groupId
{
  return self->mGroupId;
}

- (PDBuildMapKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDBuildMapKey;
  return [(PDBuildMapKey *)&v3 init];
}

- (void)setDrawable:(id)a3
{
  id v6 = a3;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithNonretainedObject:");
  id v4 = (NSValue *)objc_claimAutoreleasedReturnValue();
  mDrawableValue = self->mDrawableValue;
  self->mDrawableValue = v4;
}

- (void)setGroupId:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDBuildMapKey;
  v2 = [(PDBuildMapKey *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mDrawableValue, 0);
}

@end