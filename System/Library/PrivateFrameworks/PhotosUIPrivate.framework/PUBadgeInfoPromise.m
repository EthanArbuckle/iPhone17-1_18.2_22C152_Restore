@interface PUBadgeInfoPromise
- (BOOL)isEqual:(id)a3;
- (PUBadgeInfoPromise)badgeInfoPromiseWithAdjustments:(id)a3;
- (PUBadgeInfoPromise)init;
- (PUBadgeInfoPromise)initWithBadgeInfo:(PXAssetBadgeInfo *)a3;
- (PUBadgeInfoPromise)initWithBadgeInfoProvider:(id)a3 countProvider:(id)a4;
- (PXAssetBadgeInfo)badgeInfo;
- (unint64_t)hash;
@end

@implementation PUBadgeInfoPromise

- (void).cxx_destruct
{
  objc_storeStrong(&self->_badgeProvider, 0);
  objc_storeStrong(&self->_countProvider, 0);
}

- (PUBadgeInfoPromise)badgeInfoPromiseWithAdjustments:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUBadgeInfoPromise.m", 86, @"Invalid parameter not satisfying: %@", @"adjuster != nil" object file lineNumber description];
  }
  v6 = [PUBadgeInfoPromise alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PUBadgeInfoPromise_badgeInfoPromiseWithAdjustments___block_invoke;
  v12[3] = &unk_1E5F23CB8;
  v12[4] = self;
  id v13 = v5;
  id countProvider = self->_countProvider;
  id v8 = v5;
  v9 = [(PUBadgeInfoPromise *)v6 initWithBadgeInfoProvider:v12 countProvider:countProvider];

  return v9;
}

uint64_t __54__PUBadgeInfoPromise_badgeInfoPromiseWithAdjustments___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  long long v6 = 0uLL;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    [v7 badgeInfo];
    long long v6 = 0uLL;
  }
  *a4 = v6;
  a4[1] = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v8 + 16);
  v11[0] = v12;
  v11[1] = v13;
  return v9(v8, v11, a2, a3);
}

- (PXAssetBadgeInfo)badgeInfo
{
  void (**badgeProvider)(_OWORD *__return_ptr);
  long long v6;
  id v7;
  id countProvider;
  uint64_t (**v9)(void);
  id v10;
  PXAssetBadgeInfo *result;
  long long v12;
  _OWORD v13[2];

  v4 = self;
  objc_sync_enter(v4);
  badgeProvider = (void (**)(_OWORD *__return_ptr))v4->_badgeProvider;
  if (badgeProvider)
  {
    badgeProvider[2](v13);
    long long v6 = v13[1];
    *(_OWORD *)&v4->_badgeInfo.badges = v13[0];
    *(_OWORD *)&v4->_badgeInfo.count = v6;
    v7 = v4->_badgeProvider;
    v4->_badgeProvider = 0;
  }
  id countProvider = v4->_countProvider;
  if (countProvider)
  {
    v9 = (uint64_t (**)(void))_Block_copy(countProvider);
    v10 = v4->_countProvider;
    v4->_id countProvider = 0;

    v4->_badgeInfo.count = v9[2](v9);
  }
  objc_sync_exit(v4);

  long long v12 = *(_OWORD *)&v4->_badgeInfo.count;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&v4->_badgeInfo.badges;
  *(_OWORD *)&retstr->count = v12;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUBadgeInfoPromise *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (self->_badgeInfo.badges == v5->_badgeInfo.badges)
      {
        if (PXAssetBadgeInfoRequiresCountForBadges())
        {
          [(PUBadgeInfoPromise *)self badgeInfo];
          [(PUBadgeInfoPromise *)v5 badgeInfo];
        }
        char v6 = PXAssetBadgeInfoEqualToBadgeInfo();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_badgeInfo.badges ^ (2 * (uint64_t)self->_badgeInfo.duration);
}

- (PUBadgeInfoPromise)initWithBadgeInfoProvider:(id)a3 countProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUBadgeInfoPromise;
  v9 = [(PUBadgeInfoPromise *)&v16 init];
  if (v9)
  {
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v9, @"PUBadgeInfoPromise.m", 30, @"Invalid parameter not satisfying: %@", @"badgeProvider != nil" object file lineNumber description];
    }
    v10 = _Block_copy(v7);
    id badgeProvider = v9->_badgeProvider;
    v9->_id badgeProvider = v10;

    long long v12 = _Block_copy(v8);
    id countProvider = v9->_countProvider;
    v9->_id countProvider = v12;
  }
  return v9;
}

- (PUBadgeInfoPromise)initWithBadgeInfo:(PXAssetBadgeInfo *)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PUBadgeInfoPromise_initWithBadgeInfo___block_invoke;
  v5[3] = &__block_descriptor_64_e27__PXAssetBadgeInfo_Qdqq_8__0l;
  long long v3 = *(_OWORD *)&a3->count;
  long long v6 = *(_OWORD *)&a3->badges;
  long long v7 = v3;
  return [(PUBadgeInfoPromise *)self initWithBadgeInfoProvider:v5 countProvider:0];
}

__n128 __40__PUBadgeInfoPromise_initWithBadgeInfo___block_invoke@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (PUBadgeInfoPromise)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
  v4[0] = *MEMORY[0x1E4F91308];
  v4[1] = v2;
  return [(PUBadgeInfoPromise *)self initWithBadgeInfo:v4];
}

@end