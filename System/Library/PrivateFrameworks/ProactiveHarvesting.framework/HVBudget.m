@interface HVBudget
- (HVBudget)init;
- sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:(int)a3 levelOfService:;
- (void)registerLevelOfService:(int)a3 oneDataSource:;
@end

@implementation HVBudget

- (HVBudget)init
{
  v3.receiver = self;
  v3.super_class = (Class)HVBudget;
  result = [(HVBudget *)&v3 init];
  if (result)
  {
    result->_ignoreDiscretionaryPowerBudget = 0;
    *(void *)&result->_alwaysAllowSourcesOverride = 0;
    result->_noServiceSources = -1;
    *(void *)&result->_budgetedSources = 0;
    *(void *)&result->_periodicBackgroundSources = 0;
    result->_extraBudgetSources = 3;
  }
  return result;
}

- sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:(int)a3 levelOfService:
{
  if (result)
  {
    v4 = result;
    int v5 = result[2] | result[8];
    int v6 = v5 & a2;
    int v7 = v5 & a2 ^ a2;
    switch(a3)
    {
      case 0:
        v8 = [MEMORY[0x263F08690] currentHandler];
        [v8 handleFailureInMethod:sel_sourcesFilteredByBudgetAndRegistrationsFromAvailableSources_levelOfService_ object:v4 file:@"HVBudget.m" lineNumber:137 description:@"It does not make sense to request sources that are not registered"];

        goto LABEL_4;
      case 1:
LABEL_4:
        int v9 = HVIsConnectedToPower();
        int v10 = v4[6] | v4[7];
        if (v9) {
          v10 |= v4[5];
        }
        goto LABEL_8;
      case 2:
        int v10 = result[6] | result[7];
        goto LABEL_8;
      case 3:
        int v10 = result[7];
LABEL_8:
        v7 &= v10;
        break;
      default:
        break;
    }
    if (!v7) {
      return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
    }
    if (*((unsigned char *)v4 + 40)) {
      goto LABEL_13;
    }
    v11 = +[HVPowerBudget defaultBudget];
    int v12 = [v11 canDoDiscretionaryWork];

    if (v12 == 1)
    {
      v6 |= v4[9] & a2 & v7;
      return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
    }
    if (v12 == 2) {
LABEL_13:
    }
      int v6 = (v7 | v5) & a2;
    return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
  }
  return result;
}

- (void)registerLevelOfService:(int)a3 oneDataSource:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v4 = (int8x16_t *)((char *)a1 + 20);
    __int32 v5 = a1[1].i32[1];
    __int32 v6 = a1[1].i64[1];
    __int32 v7 = HIDWORD(a1[1].i64[1]);
    if ((v6 & a3) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = (v5 & a3) != 0;
    }
    __int32 v9 = a1[2].i32[0];
    if ((v7 & a3) != 0) {
      unsigned int v8 = 3;
    }
    if ((v9 & a3) != 0) {
      unsigned int v8 = 4;
    }
    if (v8 < a2)
    {
      a1[1] = vandq_s8(a1[1], (int8x16_t)vdupq_n_s32(~a3));
      switch(a2)
      {
        case 1u:
          goto LABEL_14;
        case 2u:
          __int32 v5 = v6;
          v4 = (int8x16_t *)((char *)a1 + 24);
          goto LABEL_14;
        case 3u:
          v4 = (int8x16_t *)((char *)a1 + 28);
          __int32 v5 = v7;
          goto LABEL_14;
        case 4u:
          __int32 v5 = v9;
          v4 = a1 + 2;
LABEL_14:
          v4->i32[0] = v5 | a3;
          break;
        default:
          break;
      }
      int v10 = hv_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](a1, -1, 1);
        int v12 = HVDataSourceDescription(v11);
        int v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_226C41000, v10, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

uint64_t __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if ((*(_DWORD *)(a1 + 48) & *(_DWORD *)(v3 + 32)) != 0) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 52);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
}

@end