@interface WLTelemetry
+ (id)sharedInstance;
- (id)_telemetryDictionaryForContentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11;
- (id)_telemetryDictionaryForPreparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8;
- (void)contentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11;
- (void)daemonDidGetInterrupted;
- (void)deviceDidFailWithAuthenticationError;
- (void)deviceDidFailWithTimeout;
- (void)didLoadAndroidStore:(id)a3 selected:(BOOL)a4 canceled:(BOOL)a5 inAttempts:(unint64_t)a6;
- (void)didLoadQRCode:(BOOL)a3;
- (void)didLookupAppsWithMatchedApps:(unint64_t)a3 mismatchedApps:(unint64_t)a4;
- (void)didResolveTimeEstimate:(unint64_t)a3 forDownloadTask:(id)a4 threshold:(unint64_t)a5 actualTime:(unint64_t)a6;
- (void)importDidFailSilentlyForContentType:(id)a3;
- (void)migratorDidFinish:(id)a3;
- (void)photoLibraryDidFailWithExtension:(id)a3;
- (void)preparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8;
- (void)send:(id)a3 payload:(id)a4;
- (void)userDidChooseToInstallMigratableApps:(BOOL)a3;
- (void)wifiDidFail;
@end

@implementation WLTelemetry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

uint64_t __29__WLTelemetry_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WLTelemetry);
  sharedInstance__sharedInstance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (void)send:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _WLLog(v4, 2, @"WLTelemetry will send an event - %@ with payload %@.", v8, v9, v10, v11, v12, (uint64_t)v7);
  id v13 = v6;
  AnalyticsSendEventLazy();
}

id __28__WLTelemetry_send_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)wifiDidFail
{
  _WLLog(v7, 2, @"WLTelemetry got wifiDidFail event.", v2, v3, v4, v5, v6, v10);
  uint64_t v11 = objc_alloc_init(WLPayload);
  [(WLPayload *)v11 setState:@"wifi_error"];
  uint64_t v9 = [(WLPayload *)v11 dictionary];
  [(WLTelemetry *)self send:@"com.apple.welcomemat" payload:v9];
}

- (void)deviceDidFailWithTimeout
{
  _WLLog(v7, 2, @"WLTelemetry got deviceDidFailWithTimeout event.", v2, v3, v4, v5, v6, v10);
  uint64_t v11 = objc_alloc_init(WLPayload);
  [(WLPayload *)v11 setState:@"device_discovery_error_timeout"];
  uint64_t v9 = [(WLPayload *)v11 dictionary];
  [(WLTelemetry *)self send:@"com.apple.welcomemat" payload:v9];
}

- (void)deviceDidFailWithAuthenticationError
{
  _WLLog(v7, 2, @"WLTelemetry got deviceDidFailWithAuthenticationError event.", v2, v3, v4, v5, v6, v10);
  uint64_t v11 = objc_alloc_init(WLPayload);
  [(WLPayload *)v11 setState:@"device_discovery_error_authentication_failed"];
  uint64_t v9 = [(WLPayload *)v11 dictionary];
  [(WLTelemetry *)self send:@"com.apple.welcomemat" payload:v9];
}

- (void)migratorDidFinish:(id)a3
{
  id v5 = a3;
  _WLLog(v3, 2, @"WLTelemetry got migratorDidFinish event.", v6, v7, v8, v9, v10, v11);
  id v12 = [v5 dictionary];

  [(WLTelemetry *)self send:@"com.apple.welcomemat" payload:v12];
}

- (id)_telemetryDictionaryForPreparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8
{
  v27[6] = *MEMORY[0x263EF8340];
  v26[0] = @"contentType";
  v26[1] = @"dataType";
  v27[0] = a4;
  v27[1] = a3;
  v26[2] = @"durationInSeconds";
  id v12 = NSNumber;
  uint64_t v13 = (uint64_t)a5;
  v14 = (__CFString *)a8;
  v15 = (__CFString *)a7;
  v16 = (__CFString *)a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v12 numberWithInteger:v13];
  v20 = (void *)v19;
  v21 = @"(unknown)";
  if (v16) {
    v22 = v16;
  }
  else {
    v22 = @"(unknown)";
  }
  v27[2] = v19;
  v27[3] = v22;
  v26[3] = @"androidOSVersion";
  v26[4] = @"androidDeviceModel";
  v26[5] = @"androidClientVersion";
  if (v15) {
    v23 = v15;
  }
  else {
    v23 = @"(unknown)";
  }
  if (v14) {
    v21 = v14;
  }
  v27[4] = v23;
  v27[5] = v21;
  v24 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

  return v24;
}

- (void)preparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v29 = [NSNumber numberWithDouble:a5];
  _WLLog(v8, 2, @"Telemetry: preparatoryDataDidComplete %@ contentType %@ duration %@", v19, v20, v21, v22, v23, (uint64_t)v14);

  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  AnalyticsSendEventLazy();
}

uint64_t __85__WLTelemetry_preparatoryDataDidComplete_contentType_duration_android_model_version___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telemetryDictionaryForPreparatoryDataDidComplete:*(void *)(a1 + 40) contentType:*(void *)(a1 + 48) duration:*(void *)(a1 + 56) android:*(void *)(a1 + 64) model:*(void *)(a1 + 72) version:*(double *)(a1 + 80)];
}

- (id)_telemetryDictionaryForContentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11
{
  v34[9] = *MEMORY[0x263EF8340];
  LODWORD(v11) = vcvtpd_u64_f64((double)a4 * 0.000000953674316);
  v34[0] = a3;
  v33[0] = @"contentType";
  v33[1] = @"recordCount";
  id v16 = NSNumber;
  id v17 = (__CFString *)a11;
  id v18 = (__CFString *)a10;
  uint64_t v19 = (__CFString *)a9;
  id v20 = a3;
  uint64_t v21 = [v16 numberWithUnsignedInteger:a5];
  v34[1] = v21;
  v33[2] = @"failedRecordCount";
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:a6];
  v34[2] = v22;
  v33[3] = @"downloadSizeInMegabytes";
  uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v11];
  v34[3] = v23;
  v33[4] = @"downloadDurationInSeconds";
  id v24 = [NSNumber numberWithUnsignedInteger:a7];
  v34[4] = v24;
  v33[5] = @"importDurationInSeconds";
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a8];
  id v26 = (void *)v25;
  id v27 = @"(unknown)";
  if (v19) {
    id v28 = v19;
  }
  else {
    id v28 = @"(unknown)";
  }
  v34[5] = v25;
  v34[6] = v28;
  v33[6] = @"androidOSVersion";
  v33[7] = @"androidDeviceModel";
  v33[8] = @"androidClientVersion";
  if (v18) {
    v29 = v18;
  }
  else {
    v29 = @"(unknown)";
  }
  if (v17) {
    id v27 = v17;
  }
  v34[7] = v29;
  v34[8] = v27;
  v30 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:9];

  return v30;
}

- (void)contentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11
{
  id v12 = a3;
  id v13 = a9;
  id v14 = a10;
  id v15 = a11;
  _WLLog(v11, 2, @"Telemetry: contentTypeDidComplete %@", v16, v17, v18, v19, v20, (uint64_t)v12);
  uint64_t v25 = v12;
  id v26 = v15;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  AnalyticsSendEventLazy();
}

uint64_t __152__WLTelemetry_contentTypeDidComplete_downloadByteCount_importRecordCount_importFailedRecordCount_downloadDuration_importDuration_android_model_version___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telemetryDictionaryForContentTypeDidComplete:*(void *)(a1 + 40) downloadByteCount:*(void *)(a1 + 72) importRecordCount:*(void *)(a1 + 80) importFailedRecordCount:*(void *)(a1 + 88) downloadDuration:*(void *)(a1 + 96) importDuration:*(void *)(a1 + 104) android:*(void *)(a1 + 48) model:*(void *)(a1 + 56) version:*(void *)(a1 + 64)];
}

- (void)importDidFailSilentlyForContentType:(id)a3
{
  id v4 = a3;
  _WLLog(v3, 2, @"Telemetry: recordImportDidFail contentType %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  id v10 = v4;
  AnalyticsSendEventLazy();
}

id __51__WLTelemetry_importDidFailSilentlyForContentType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"contentType";
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didResolveTimeEstimate:(unint64_t)a3 forDownloadTask:(id)a4 threshold:(unint64_t)a5 actualTime:(unint64_t)a6
{
  id v7 = a4;
  _WLLog(v6, 2, @"Telemetry: timeEstimateDidResolve task %@ estimate %lu threshold %lu actual time %lu", v8, v9, v10, v11, v12, (uint64_t)v7);
  id v13 = v7;
  AnalyticsSendEventLazy();
}

id __75__WLTelemetry_didResolveTimeEstimate_forDownloadTask_threshold_actualTime___block_invoke(void *a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[7];
  unint64_t v2 = (unint64_t)(100 * a1[5]) / a1[6];
  v8[0] = a1[4];
  v7[0] = @"downloadTask";
  v7[1] = @"magnitude";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:v1];
  v8[1] = v3;
  v7[2] = @"accuracy";
  id v4 = [NSNumber numberWithUnsignedInteger:v2];
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)userDidChooseToInstallMigratableApps:(BOOL)a3
{
  _WLLog(v8, 2, @"Telemetry: installAppChoice %d", v3, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __52__WLTelemetry_userDidChooseToInstallMigratableApps___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"install";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didLookupAppsWithMatchedApps:(unint64_t)a3 mismatchedApps:(unint64_t)a4
{
  _WLLog(v8, 2, @"Telemetry: didLookupAppsWithMatchedApps:%ld mismatchedApps:%ld", a4, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __59__WLTelemetry_didLookupAppsWithMatchedApps_mismatchedApps___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"matched_apps";
  unint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"mismatched_apps";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)photoLibraryDidFailWithExtension:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = &stru_26E8E8AD8;
  }
  _WLLog(v3, 2, @"Telemetry: photoLibraryDidFailWithExtension:%@", v5, v6, v7, v8, v9, (uint64_t)v10);
  uint64_t v11 = v10;
  AnalyticsSendEventLazy();
}

id __48__WLTelemetry_photoLibraryDidFailWithExtension___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = @"extension";
  v5[0] = v1;
  unint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didLoadQRCode:(BOOL)a3
{
  _WLLog(v8, 2, @"Telemetry: didLoadQRCode:%d", v3, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __29__WLTelemetry_didLoadQRCode___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didLoadAndroidStore:(id)a3 selected:(BOOL)a4 canceled:(BOOL)a5 inAttempts:(unint64_t)a6
{
  uint64_t v7 = (__CFString *)a3;
  if (v7) {
    id v13 = v7;
  }
  else {
    id v13 = &stru_26E8E8AD8;
  }
  _WLLog(v6, 2, @"Telemetry: didLoadAndroidStore:%@ selected:%d canceled:%d inAttempts:%ld", v8, v9, v10, v11, v12, (uint64_t)v13);
  id v14 = v13;
  AnalyticsSendEventLazy();
}

id __64__WLTelemetry_didLoadAndroidStore_selected_canceled_inAttempts___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"android_store";
  v8[1] = @"attempts";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:v2];
  v9[1] = v3;
  v8[2] = @"canceled";
  uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[2] = v4;
  v8[3] = @"selected";
  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v9[3] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)daemonDidGetInterrupted
{
  _WLLog(v7, 2, @"Telemetry: daemonDidGetInterrupted", v2, v3, v4, v5, v6, vars0);

  AnalyticsSendEventLazy();
}

void *__38__WLTelemetry_daemonDidGetInterrupted__block_invoke()
{
  return &unk_26E8EB4F8;
}

@end