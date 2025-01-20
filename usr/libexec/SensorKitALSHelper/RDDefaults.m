@interface RDDefaults
+ (void)initialize;
- (RDDefaults)init;
- (void)dealloc;
- (void)setAuthorizationVersions:(id)a3 forBundleId:(id)a4;
- (void)updateAuthorizationVersions:(id)a3 forBundleId:(id)a4;
@end

@implementation RDDefaults

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002AA10 = (uint64_t)os_log_create("com.apple.SensorKit", "RDDefaults");
  }
}

- (RDDefaults)init
{
  v3 = +[NSUserDefaults standardUserDefaults];
  if (self)
  {
    v4 = v3;
    v42.receiver = self;
    v42.super_class = (Class)RDDefaults;
    self = [(RDDefaults *)&v42 init];
    if (self)
    {
      self->_defaults = v4;
      CFStringRef v5 = @"SegmentSizeBytes";
      v47[0] = @"Enabled";
      v47[1] = @"SegmentSizeBytes";
      v48[0] = &off_100026818;
      v48[1] = &off_100026830;
      v47[2] = @"MetadataSizeBytes";
      v47[3] = @"MaxAllowedMappedPages";
      v48[2] = &off_100026848;
      v48[3] = &off_100026860;
      v47[4] = @"SegmentResizeFactor";
      v47[5] = @"SegmentPaddingFactor";
      v48[4] = &off_100026E00;
      v48[5] = &off_100026E10;
      v47[6] = @"ArchiverBufferSizeBytes";
      v47[7] = @"ArchiveCompressionEnabled";
      v48[6] = &off_100026878;
      v48[7] = &__kCFBooleanFalse;
      v48[8] = &off_100026890;
      v47[8] = @"ProtectionClass";
      v47[9] = @"DataProtectionLengthSeconds";
      v48[9] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
      v47[10] = @"TombstoneDataRetentionLengthSeconds";
      v48[10] = +[NSNumber numberWithLongLong:60 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v47[11] = @"KeyProtectionLengthSeconds";
      int64_t v41 = 2 * XPC_ACTIVITY_INTERVAL_7_DAYS;
      v48[11] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
      v48[12] = &__kCFBooleanFalse;
      v47[12] = @"Curated";
      v47[13] = @"DatastoreVersion";
      v48[13] = &off_1000268A8;
      v47[14] = @"UpdateCompanionIntervalSeconds";
      v48[14] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
      v47[15] = @"PrepareArchivesIntervalSeconds";
      v48[15] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v48[16] = &__kCFBooleanFalse;
      v47[16] = @"PrepareArchivesCPUIntensive";
      v47[17] = @"PrepareArchivesDiskIntensive";
      v48[17] = &__kCFBooleanFalse;
      v47[18] = @"HoldingPeriod";
      v48[18] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
      v47[19] = @"SyncCompanionStateToGizmoInterval";
      v48[19] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_30_MIN];
      v47[20] = @"ResourceSendTimeout";
      v48[20] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v48[21] = &__kCFBooleanTrue;
      v47[21] = @"AnalyticsEnabled";
      v47[22] = @"ResendArchivesDelay";
      v48[22] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
      v47[23] = @"ReminderAlertThresholdSecs";
      v48[23] = +[NSNumber numberWithLongLong:30 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v48[24] = &off_1000268C0;
      v47[24] = @"SendResourcePriority";
      v47[25] = @"FirstReminderAlertThresholdSecs";
      v48[25] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
      v47[26] = @"ArchiveResendThresholdSecs";
      v48[26] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR + 3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v48[27] = &off_100026FC0;
      v47[27] = @"LegacyResearchStudyBundleIDs";
      v47[28] = @"LegacyResearchStudyEntitlement";
      v48[28] = @"com.apple.SensorAndUsageData";
      v47[29] = @"PreferWifiAssertionDurationSecs";
      v48[29] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
      v48[30] = &off_100026E20;
      v47[30] = @"StateCacheSendDebounceIntervalSecs";
      v47[31] = @"AdditionalDiagnosticsEnabled";
      v48[31] = &__kCFBooleanFalse;
      v47[32] = @"TimeSyncSendDebounceIntervalSecs";
      v48[32] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
      v48[33] = &off_1000268D8;
      v47[33] = @"PendingMessageResendLimit";
      v47[34] = @"TimeSyncMessageTimeoutSecs";
      v48[34] = &off_100026E30;
      v48[35] = &off_1000268F0;
      v47[35] = @"MaxArchiveBytes";
      v47[36] = @"CacheDeleteAgeLimit";
      v45[0] = [&off_100026908 stringValue];
      v46[0] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
      v45[1] = [&off_100026920 stringValue];
      v46[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v45[2] = [&off_100026938 stringValue];
      v46[2] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
      v45[3] = [&off_100026950 stringValue];
      v46[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v45[4] = [&off_100026968 stringValue];
      v46[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v48[36] = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
      v47[37] = @"RTCResetTimestampThresholdSecs";
      v48[37] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v48[38] = &off_100026980;
      v47[38] = @"FaceMetricsReminderWeekday";
      v47[39] = @"FaceMetricsReminderHour";
      v47[40] = @"FaceMetricsReminderMinute";
      v48[39] = &off_100026998;
      v48[40] = &off_1000269B0;
      if ([SRSensorRotationRate length]) {
        CFStringRef v5 = (const __CFString *)[SRSensorRotationRate stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[41] = v5;
      v48[41] = &off_1000269C8;
      id v6 = [SRSensorAccelerometer length];
      CFStringRef v7 = @"SegmentSizeBytes";
      if (v6) {
        CFStringRef v7 = (const __CFString *)[SRSensorAccelerometer stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[42] = v7;
      v48[42] = &off_1000269C8;
      id v8 = [SRSensorPedometerData length];
      CFStringRef v9 = @"SegmentSizeBytes";
      if (v8) {
        CFStringRef v9 = (const __CFString *)[SRSensorPedometerData stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[43] = v9;
      v48[43] = &off_1000269E0;
      id v10 = [SRSensorAmbientLightSensor length];
      CFStringRef v11 = @"SegmentSizeBytes";
      if (v10) {
        CFStringRef v11 = (const __CFString *)[SRSensorAmbientLightSensor stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[44] = v11;
      v48[44] = &off_1000269F8;
      v12 = (void *)SRSensorElevation;
      id v13 = [SRSensorElevation length];
      CFStringRef v14 = @"SegmentSizeBytes";
      if (v13) {
        CFStringRef v14 = (const __CFString *)[v12 stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[45] = v14;
      v48[45] = &off_1000269F8;
      id v15 = [SRSensorAmbientPressure length];
      CFStringRef v16 = @"SegmentSizeBytes";
      if (v15) {
        CFStringRef v16 = (const __CFString *)[SRSensorAmbientPressure stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[46] = v16;
      v48[46] = &off_1000269F8;
      id v17 = [SRSensorOnWristState length];
      CFStringRef v18 = @"SegmentSizeBytes";
      if (v17) {
        CFStringRef v18 = (const __CFString *)[SRSensorOnWristState stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[47] = v18;
      v48[47] = &off_100026878;
      v19 = (void *)SRSensorPPG;
      id v20 = [SRSensorPPG length];
      CFStringRef v21 = @"SegmentSizeBytes";
      if (v20) {
        CFStringRef v21 = (const __CFString *)[v19 stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[48] = v21;
      v48[48] = &off_1000269E0;
      id v22 = [SRSensorVisits length];
      CFStringRef v23 = @"SegmentSizeBytes";
      if (v22) {
        CFStringRef v23 = (const __CFString *)[SRSensorVisits stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[49] = v23;
      v48[49] = &off_100026878;
      v24 = (void *)SRSensorStrideCalibration;
      id v25 = [SRSensorStrideCalibration length];
      CFStringRef v26 = @"SegmentSizeBytes";
      if (v25) {
        CFStringRef v26 = (const __CFString *)[v24 stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[50] = v26;
      v48[50] = &off_100026878;
      v27 = (void *)SRSensorFacialMetrics;
      id v28 = [SRSensorFacialMetrics length];
      CFStringRef v29 = @"SegmentSizeBytes";
      if (v28) {
        CFStringRef v29 = (const __CFString *)[v27 stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v47[51] = v29;
      v48[51] = &off_1000269C8;
      id v30 = [v27 length];
      CFStringRef v31 = @"HoldingPeriod";
      if (v30) {
        CFStringRef v31 = (const __CFString *)[v27 stringByAppendingFormat:@".%@", @"HoldingPeriod"];
      }
      v47[52] = v31;
      if (XPC_ACTIVITY_INTERVAL_1_DAY >= 0) {
        int64_t v32 = XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      else {
        int64_t v32 = XPC_ACTIVITY_INTERVAL_1_DAY + 1;
      }
      v48[52] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS + (v32 >> 1)];
      id v33 = [v27 length];
      CFStringRef v34 = @"DataProtectionLengthSeconds";
      if (v33) {
        CFStringRef v34 = (const __CFString *)[v27 stringByAppendingFormat:@".%@", @"DataProtectionLengthSeconds"];
      }
      v47[53] = v34;
      v48[53] = +[NSNumber numberWithLongLong:v41];
      id v35 = [v27 length];
      CFStringRef v36 = @"CacheDeleteAgeLimit";
      if (v35) {
        CFStringRef v36 = (const __CFString *)[v27 stringByAppendingFormat:@".%@", @"CacheDeleteAgeLimit"];
      }
      v47[54] = v36;
      v43[0] = [&off_100026908 stringValue];
      v44[0] = +[NSNumber numberWithLongLong:v41];
      v43[1] = [&off_100026920 stringValue];
      v44[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v43[2] = [&off_100026938 stringValue];
      v44[2] = +[NSNumber numberWithLongLong:5 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v43[3] = [&off_100026950 stringValue];
      v44[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v43[4] = [&off_100026968 stringValue];
      v44[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v48[54] = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
      v37 = (void *)SRSensorECG;
      id v38 = [SRSensorECG length];
      CFStringRef v39 = @"MetadataSizeBytes";
      if (v38) {
        CFStringRef v39 = (const __CFString *)[v37 stringByAppendingFormat:@".%@", @"MetadataSizeBytes"];
      }
      v47[55] = v39;
      v48[55] = &off_100026A10;
      [(NSUserDefaults *)self->_defaults registerDefaults:+[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:56]];
    }
  }
  return self;
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 24);
  }
  v3.receiver = self;
  v3.super_class = (Class)RDDefaults;
  [(RDDefaults *)&v3 dealloc];
}

- (void)setAuthorizationVersions:(id)a3 forBundleId:(id)a4
{
  id v7 = objc_alloc((Class)NSMutableDictionary);
  if (self) {
    id v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"AuthorizationVersions"];
  }
  else {
    id v8 = 0;
  }
  id v9 = [v7 initWithDictionary:v8];
  [v9 setObject:a3 forKeyedSubscript:a4];
  [(NSUserDefaults *)self->_defaults setObject:v9 forKey:@"AuthorizationVersions"];
}

- (void)updateAuthorizationVersions:(id)a3 forBundleId:(id)a4
{
  id v7 = objc_alloc((Class)NSMutableDictionary);
  if (self) {
    id v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"AuthorizationVersions"];
  }
  else {
    id v8 = 0;
  }
  id v9 = [v7 initWithDictionary:v8];
  id v10 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:[v9 objectForKeyedSubscript:a4]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      CFStringRef v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a3);
        }
        [v10 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14)) forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14)];
        CFStringRef v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  [v9 setObject:v10 forKeyedSubscript:a4];
  [(NSUserDefaults *)self->_defaults setObject:v9 forKey:@"AuthorizationVersions"];
}

@end