@interface GTTelemetry
@end

@implementation GTTelemetry

void __GTTelemetry_init_block_invoke(id a1)
{
}

void __GTTelemetry_trackPresent_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 presentedTime];

  GTTelemetry_trackStreamRefPresent(v2, v3);
}

void __GTTelemetry_trackCommit_block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  CFTimeInterval v3 = (std::mutex *)(telemetry + 136);
  std::mutex::lock((std::mutex *)(telemetry + 136));
  uint64_t v5 = *(void *)(telemetry + 248);
  uint64_t v4 = *(void *)(telemetry + 256);
  if (v5 != v4)
  {
    while (*(void *)v5 != *(void *)(a1 + 32))
    {
      v5 += 528;
      if (v5 == v4) {
        goto LABEL_6;
      }
    }
    unsigned int v6 = *(_DWORD *)(v5 + 8);
    [v17 GPUEndTime];
    double v8 = v7;
    [v17 GPUStartTime];
    *(float *)&double v9 = (v8 - v9) * 1000.0;
    CHistoryRecord::Add(v5 + 24, v6, *(float *)&v9);
    ++*(void *)(v5 + 8);
  }
LABEL_6:
  std::mutex::unlock(v3);
  v10 = (std::mutex *)(telemetry + 72);
  std::mutex::lock((std::mutex *)(telemetry + 72));
  uint64_t v12 = *(void *)(telemetry + 224);
  uint64_t v11 = *(void *)(telemetry + 232);
  if (v12 != v11)
  {
    while (*(void *)v12 != *(void *)(a1 + 40))
    {
      v12 += 528;
      if (v12 == v11) {
        goto LABEL_11;
      }
    }
    unsigned int v13 = *(_DWORD *)(v12 + 8);
    [v17 GPUEndTime];
    double v15 = v14;
    [v17 GPUStartTime];
    *(float *)&double v16 = (v15 - v16) * 1000.0;
    CHistoryRecord::Add(v12 + 24, v13, *(float *)&v16);
    ++*(void *)(v12 + 8);
  }
LABEL_11:
  std::mutex::unlock(v10);
}

@end