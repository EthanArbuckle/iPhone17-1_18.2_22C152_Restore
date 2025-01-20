@interface SSBLookupContext(SSBPrivate)
- (uint64_t)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate;
- (uint64_t)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate;
- (uint64_t)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate;
- (uint64_t)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate;
- (uint64_t)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate;
- (uint64_t)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate;
- (uint64_t)_getDatabaseStatusWithCompletionHandler:()SSBPrivate;
- (uint64_t)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate;
- (uint64_t)_getSafeBrowsingEnabledState:()SSBPrivate;
- (uint64_t)_getServiceStatusWithCompletionHandler:()SSBPrivate;
- (void)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate;
- (void)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate;
- (void)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate;
- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate;
- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate;
- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate;
- (void)_getDatabaseStatusWithCompletionHandler:()SSBPrivate;
- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate;
- (void)_getSafeBrowsingEnabledState:()SSBPrivate;
- (void)_getServiceStatusWithCompletionHandler:()SSBPrivate;
@end

@implementation SSBLookupContext(SSBPrivate)

- (uint64_t)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C2E8;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate
{
  uint64_t v1 = *(void *)&a1.__val_;
  *(void *)&a1.__val_ = a1.__cat_->__vftable;
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1.__cat_->__vftable;
  if (a1.__cat_->__vftable)
  {
    a1.__cat_ = (const std::error_category *)a1.__cat_[1].__vftable;
    uint64_t v4 = nsErrorFromReplyErrorCode(a1);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  if (v3)
  {
  }
}

- (uint64_t)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C408;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate
{
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getDatabaseStatusWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C258;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getDatabaseStatusWithCompletionHandler:()SSBPrivate
{
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    nsErrorFromReplyErrorCode(*a3);
    id v5 = (_SSBDatabaseStatus *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, _SSBDatabaseStatus *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    long long v8 = v6;
    uint64_t v9 = v7;
    id v5 = -[_SSBDatabaseStatus initWithDatabaseStatus:]([_SSBDatabaseStatus alloc], "initWithDatabaseStatus:", &v8, 0, 0, 0);
    v10 = (void **)&v8;
    std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100](&v10);
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }

  *(void *)&long long v8 = &v6;
  std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100]((void ***)&v8);
}

- (uint64_t)_getServiceStatusWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C210;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getServiceStatusWithCompletionHandler:()SSBPrivate
{
  *(_OWORD *)long long v6 = *(_OWORD *)a2;
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  int v8 = *(_DWORD *)(a2 + 24);
  long long v9 = *(_OWORD *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  long long v11 = *(_OWORD *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 72);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(_OWORD *)v13 = *(_OWORD *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 96);
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    nsErrorFromReplyErrorCode(*a3);
    id v5 = (_SSBServiceStatus *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, _SSBServiceStatus *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v6;
    uint64_t v16 = v7;
    HIBYTE(v7) = 0;
    v6[0] = 0;
    int v17 = v8;
    long long v18 = v9;
    uint64_t v19 = v10;
    uint64_t v10 = 0;
    long long v9 = 0uLL;
    long long v20 = v11;
    uint64_t v21 = v12;
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    *(_OWORD *)__p = *(_OWORD *)v13;
    uint64_t v23 = v14;
    v13[0] = 0;
    v13[1] = 0;
    uint64_t v14 = 0;
    id v5 = [[_SSBServiceStatus alloc] initWithServiceStatus:v15];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v24 = (void **)&v20;
    std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100](&v24);
    v24 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:sn180100](&v24);
    if (SHIBYTE(v16) < 0) {
      operator delete(v15[0]);
    }
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }

  if (v13[0])
  {
    v13[1] = v13[0];
    operator delete(v13[0]);
  }
  v15[0] = &v11;
  std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100]((void ***)v15);
  v15[0] = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:sn180100]((void ***)v15);
  if (SHIBYTE(v7) < 0) {
    operator delete(v6[0]);
  }
}

- (uint64_t)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C450;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate
{
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C498;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate
{
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C2A0;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate
{
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C330;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate
{
  uint64_t v4 = *a2;
  if (*(void *)&a3->__val_)
  {
    uint64_t v5 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  if (v4)
  {
    uint64_t v4 = [NSString stringWithUTF8String:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate
{
  *a2 = &unk_26BE0C378;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate
{
  uint64_t v4 = *a2;
  if (*(void *)&a3->__val_)
  {
    uint64_t v5 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  if (v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v4 / 1000000)];
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getSafeBrowsingEnabledState:()SSBPrivate
{
  *a2 = &unk_26BE0C180;
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getSafeBrowsingEnabledState:()SSBPrivate
{
  if (*(void *)&a3->__val_)
  {
    uint64_t v4 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end