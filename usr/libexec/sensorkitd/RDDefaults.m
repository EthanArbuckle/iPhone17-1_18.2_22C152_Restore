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
    qword_10006EC08 = (uint64_t)os_log_create("com.apple.SensorKit", "RDDefaults");
  }
}

- (RDDefaults)init
{
  v3 = +[NSUserDefaults standardUserDefaults];
  if (self)
  {
    v4 = v3;
    v37.receiver = self;
    v37.super_class = (Class)RDDefaults;
    self = [(RDDefaults *)&v37 init];
    if (self)
    {
      self->_defaults = v4;
      v42[0] = @"Enabled";
      v42[1] = @"SegmentSizeBytes";
      v43[0] = &off_1000610B0;
      v43[1] = &off_1000610C8;
      v42[2] = @"MetadataSizeBytes";
      v42[3] = @"MaxAllowedMappedPages";
      v43[2] = &off_1000610E0;
      v43[3] = &off_1000610F8;
      v42[4] = @"SegmentResizeFactor";
      v42[5] = @"SegmentPaddingFactor";
      v43[4] = &off_100061498;
      v43[5] = &off_1000614A8;
      v42[6] = @"ArchiverBufferSizeBytes";
      v42[7] = @"ArchiveCompressionEnabled";
      v43[6] = &off_100061110;
      v43[7] = &__kCFBooleanFalse;
      v43[8] = &off_100061128;
      v42[8] = @"ProtectionClass";
      v42[9] = @"DataProtectionLengthSeconds";
      v43[9] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
      v42[10] = @"TombstoneDataRetentionLengthSeconds";
      v43[10] = +[NSNumber numberWithLongLong:60 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v42[11] = @"KeyProtectionLengthSeconds";
      int64_t v36 = 2 * XPC_ACTIVITY_INTERVAL_7_DAYS;
      v43[11] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
      v43[12] = &__kCFBooleanFalse;
      v42[12] = @"Curated";
      v42[13] = @"DatastoreVersion";
      v43[13] = &off_100061140;
      v42[14] = @"UpdateCompanionIntervalSeconds";
      v43[14] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
      v42[15] = @"PrepareArchivesIntervalSeconds";
      v43[15] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v43[16] = &__kCFBooleanFalse;
      v42[16] = @"PrepareArchivesCPUIntensive";
      v42[17] = @"PrepareArchivesDiskIntensive";
      v43[17] = &__kCFBooleanFalse;
      v42[18] = @"HoldingPeriod";
      v43[18] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
      v42[19] = @"SyncCompanionStateToGizmoInterval";
      v43[19] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_30_MIN];
      v42[20] = @"ResourceSendTimeout";
      v43[20] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v43[21] = &__kCFBooleanTrue;
      v42[21] = @"AnalyticsEnabled";
      v42[22] = @"ResendArchivesDelay";
      v43[22] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
      v42[23] = @"ReminderAlertThresholdSecs";
      v43[23] = +[NSNumber numberWithLongLong:30 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v43[24] = &off_100061158;
      v42[24] = @"SendResourcePriority";
      v42[25] = @"FirstReminderAlertThresholdSecs";
      v43[25] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
      v42[26] = @"ArchiveResendThresholdSecs";
      v43[26] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR + 3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v43[27] = &off_100061480;
      v42[27] = @"LegacyResearchStudyBundleIDs";
      v42[28] = @"LegacyResearchStudyEntitlement";
      v43[28] = @"com.apple.SensorAndUsageData";
      v42[29] = @"PreferWifiAssertionDurationSecs";
      v43[29] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
      v43[30] = &off_1000614B8;
      v42[30] = @"StateCacheSendDebounceIntervalSecs";
      v42[31] = @"AdditionalDiagnosticsEnabled";
      v43[31] = &__kCFBooleanFalse;
      v42[32] = @"TimeSyncSendDebounceIntervalSecs";
      v43[32] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
      v43[33] = &off_100061170;
      v42[33] = @"PendingMessageResendLimit";
      v42[34] = @"TimeSyncMessageTimeoutSecs";
      v43[34] = &off_1000614C8;
      v43[35] = &off_100061188;
      v42[35] = @"MaxArchiveBytes";
      v42[36] = @"CacheDeleteAgeLimit";
      v40[0] = [&off_1000611A0 stringValue];
      v41[0] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
      v40[1] = [&off_1000611B8 stringValue];
      v41[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v40[2] = [&off_1000611D0 stringValue];
      v41[2] = +[NSNumber numberWithLongLong:5 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v40[3] = [&off_1000611E8 stringValue];
      v41[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
      v40[4] = [&off_100061200 stringValue];
      v41[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v43[36] = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];
      v42[37] = @"RTCResetTimestampThresholdSecs";
      v43[37] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v43[38] = &off_100061218;
      v42[38] = @"FaceMetricsReminderWeekday";
      v42[39] = @"FaceMetricsReminderHour";
      v42[40] = @"FaceMetricsReminderMinute";
      v43[39] = &off_100061230;
      v43[40] = &off_100061248;
      if ([@"com.apple.SensorKit.motion.gyroscope" length]) {
        CFStringRef v5 = (const __CFString *)[@"com.apple.SensorKit.motion.gyroscope" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      else {
        CFStringRef v5 = @"SegmentSizeBytes";
      }
      v42[41] = v5;
      v43[41] = &off_100061260;
      id v6 = [@"com.apple.SensorKit.motion.accelerometer" length];
      CFStringRef v7 = @"SegmentSizeBytes";
      if (v6) {
        CFStringRef v7 = (const __CFString *)[@"com.apple.SensorKit.motion.accelerometer" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[42] = v7;
      v43[42] = &off_100061260;
      id v8 = [@"com.apple.SensorKit.pedometer.data" length];
      CFStringRef v9 = @"SegmentSizeBytes";
      if (v8) {
        CFStringRef v9 = (const __CFString *)[@"com.apple.SensorKit.pedometer.data" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[43] = v9;
      v43[43] = &off_100061278;
      id v10 = [@"com.apple.SensorKit.als" length];
      CFStringRef v11 = @"SegmentSizeBytes";
      if (v10) {
        CFStringRef v11 = (const __CFString *)[@"com.apple.SensorKit.als" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[44] = v11;
      v43[44] = &off_100061290;
      id v12 = [@"com.apple.private.SensorKit.elevation" length];
      CFStringRef v13 = @"SegmentSizeBytes";
      if (v12) {
        CFStringRef v13 = (const __CFString *)[@"com.apple.private.SensorKit.elevation" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[45] = v13;
      v43[45] = &off_100061290;
      id v14 = [@"com.apple.SensorKit.ambientPressure" length];
      CFStringRef v15 = @"SegmentSizeBytes";
      if (v14) {
        CFStringRef v15 = (const __CFString *)[@"com.apple.SensorKit.ambientPressure" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[46] = v15;
      v43[46] = &off_100061290;
      id v16 = [@"com.apple.SensorKit.onWristState" length];
      CFStringRef v17 = @"SegmentSizeBytes";
      if (v16) {
        CFStringRef v17 = (const __CFString *)[@"com.apple.SensorKit.onWristState" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[47] = v17;
      v43[47] = &off_100061110;
      id v18 = [@"com.apple.SensorKit.PPG" length];
      CFStringRef v19 = @"SegmentSizeBytes";
      if (v18) {
        CFStringRef v19 = (const __CFString *)[@"com.apple.SensorKit.PPG" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[48] = v19;
      v43[48] = &off_100061278;
      id v20 = [@"com.apple.SensorKit.visits" length];
      CFStringRef v21 = @"SegmentSizeBytes";
      if (v20) {
        CFStringRef v21 = (const __CFString *)[@"com.apple.SensorKit.visits" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[49] = v21;
      v43[49] = &off_100061110;
      id v22 = [@"com.apple.private.SensorKit.pedometer.stridecalibration" length];
      CFStringRef v23 = @"SegmentSizeBytes";
      if (v22) {
        CFStringRef v23 = (const __CFString *)[@"com.apple.private.SensorKit.pedometer.stridecalibration" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[50] = v23;
      v43[50] = &off_100061110;
      id v24 = [@"com.apple.SensorKit.faceMetrics" length];
      CFStringRef v25 = @"SegmentSizeBytes";
      if (v24) {
        CFStringRef v25 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
      }
      v42[51] = v25;
      v43[51] = &off_100061260;
      id v26 = [@"com.apple.SensorKit.faceMetrics" length];
      CFStringRef v27 = @"HoldingPeriod";
      if (v26) {
        CFStringRef v27 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"HoldingPeriod"];
      }
      v42[52] = v27;
      if (XPC_ACTIVITY_INTERVAL_1_DAY >= 0) {
        int64_t v28 = XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      else {
        int64_t v28 = XPC_ACTIVITY_INTERVAL_1_DAY + 1;
      }
      v43[52] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS + (v28 >> 1)];
      id v29 = [@"com.apple.SensorKit.faceMetrics" length];
      CFStringRef v30 = @"DataProtectionLengthSeconds";
      if (v29) {
        CFStringRef v30 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"DataProtectionLengthSeconds"];
      }
      v42[53] = v30;
      v43[53] = +[NSNumber numberWithLongLong:v36];
      id v31 = [@"com.apple.SensorKit.faceMetrics" length];
      CFStringRef v32 = @"CacheDeleteAgeLimit";
      if (v31) {
        CFStringRef v32 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"CacheDeleteAgeLimit"];
      }
      v42[54] = v32;
      v38[0] = [&off_1000611A0 stringValue];
      v39[0] = +[NSNumber numberWithLongLong:v36];
      v38[1] = [&off_1000611B8 stringValue];
      v39[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v38[2] = [&off_1000611D0 stringValue];
      v39[2] = +[NSNumber numberWithLongLong:5 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v38[3] = [&off_1000611E8 stringValue];
      v39[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
      v38[4] = [&off_100061200 stringValue];
      v39[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
      v43[54] = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
      id v33 = [@"com.apple.SensorKit.ECG" length];
      CFStringRef v34 = @"MetadataSizeBytes";
      if (v33) {
        CFStringRef v34 = (const __CFString *)[@"com.apple.SensorKit.ECG" stringByAppendingFormat:@".%@", @"MetadataSizeBytes"];
      }
      v42[55] = v34;
      v43[55] = &off_1000612A8;
      [(NSUserDefaults *)self->_defaults registerDefaults:+[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:56]];
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
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a3);
        }
        [v10 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14)) forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14)];
        id v14 = (char *)v14 + 1;
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