@interface _SBAppSwitcherSnapshotCacheKey
- (BOOL)isEqual:(id)a3;
- (SBAppLayout)appLayout;
- (SBDisplayItem)displayItem;
- (_SBAppSwitcherSnapshotCacheKey)initWithDisplayItem:(id)a3 inAppLayout:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _SBAppSwitcherSnapshotCacheKey

- (_SBAppSwitcherSnapshotCacheKey)initWithDisplayItem:(id)a3 inAppLayout:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SBAppSwitcherSnapshotCacheKey;
  v10 = [(_SBAppSwitcherSnapshotCacheKey *)&v17 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_displayItem, a3);
        objc_storeStrong((id *)&v10->_appLayout, a4);
        v11 = [MEMORY[0x1E4F4F758] builder];
        id v12 = (id)[v11 appendObject:v10->_displayItem];
        id v13 = (id)[v11 appendObject:v10->_appLayout];
        v10->_hash = [v11 hash];

        goto LABEL_5;
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v10, @"SBAppSwitcherSnapshotImageCache.m", 88, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v10, @"SBAppSwitcherSnapshotImageCache.m", 89, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  appLayout = self->_appLayout;
  displayItem = self->_displayItem;
  return (id)[v4 initWithDisplayItem:displayItem inAppLayout:appLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = SBSafeCast(v5, v4);

  if (v6)
  {
    v7 = [v6 displayItem];
    if ([v7 isEqual:self->_displayItem])
    {
      id v8 = [v6 appLayout];
      char v9 = [v8 isEqual:self->_appLayout];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

@end