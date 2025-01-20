@interface SCReporting
+ (void)reportAlertRTCEventWithClientBundelID:(id)a3 isLegacy:(BOOL)a4 didAlert:(BOOL)a5 methodType:(unint64_t)a6;
- (BOOL)audioEnabled;
- (BOOL)gestureDetectionBasedReactionsEnabled;
- (BOOL)individualWindow;
- (BOOL)isClientScreenCapture;
- (BOOL)micEnabled;
- (BOOL)preserveAspectRatio;
- (BOOL)scaleToFit;
- (BOOL)shouldReportBundleID:(id)a3;
- (BOOL)showCursor;
- (BOOL)showMouseClicks;
- (BOOL)userStopped;
- (NSString)clientBundleID;
- (NSString)colorMatrix;
- (NSString)colorSpace;
- (NSString)pixelFormat;
- (NSString)streamID;
- (SCReporting)initWithClientBundleID:(id)a3 clientMainBundleID:(id)a4 streamID:(id)a5;
- (double)activeDuration;
- (double)averageFrameLatency;
- (double)averageFrameLatencyAudio;
- (double)averageFrameLatencyMic;
- (double)backgroundReplacementTotalDuration;
- (double)centerStageEffectTotalDuration;
- (double)floatingTotalDuration;
- (double)newsroomTotalDuration;
- (double)portraitEffectTotalDuration;
- (double)studioLightEffectTotalDuration;
- (float)contentScale;
- (id)collectSummaryEventMetrics;
- (id)collectSummaryRecordingEventMetrics;
- (id)thermalDescription;
- (int64_t)audioChannelCount;
- (int64_t)audioSampleRate;
- (int64_t)backgroundColor;
- (int64_t)cameraDeviceType;
- (int64_t)captureDynamicRange;
- (int64_t)captureResolutionType;
- (int64_t)destSurfaceHeight;
- (int64_t)destSurfaceWidth;
- (int64_t)excludeCallingClientAudio;
- (int64_t)excludedApplicationsCount;
- (int64_t)excludedWindowsCount;
- (int64_t)filterSource;
- (int64_t)floatingAverageLatency;
- (int64_t)floatingSessionCount;
- (int64_t)floatingToNewsroomTransitionCount;
- (int64_t)floatingTotalFrameCount;
- (int64_t)frameHeight;
- (int64_t)frameQueueSize;
- (int64_t)frameWidth;
- (int64_t)getColorFromRGBA:(double)a3 withGreen:(double)a4 withBlue:(double)a5 withAlpha:(double)a6;
- (int64_t)getCurrentStreamScreenConfiguration;
- (int64_t)includedApplicationsCount;
- (int64_t)includedWindowsCount;
- (int64_t)inputSurfaceHeight;
- (int64_t)inputSurfaceWidth;
- (int64_t)intToSCReportingAudioSampleRate:(int64_t)a3;
- (int64_t)manualTriggeredReactionsCount;
- (int64_t)newsroomAverageLatency;
- (int64_t)newsroomBottomLeftWindowCount;
- (int64_t)newsroomBottomRightWindowCount;
- (int64_t)newsroomFullScreenContentCount;
- (int64_t)newsroomSessionCount;
- (int64_t)newsroomToFloatingTransitionCount;
- (int64_t)newsroomTopLeftWindowCount;
- (int64_t)newsroomTopRightWindowCount;
- (int64_t)newsroomTotalFrameCount;
- (int64_t)portraitIntensityEndValue;
- (int64_t)recordingEndReason;
- (int64_t)recordingOutputCount;
- (int64_t)recordingOutputDuration;
- (int64_t)recordingOutputFileSize;
- (int64_t)recordingOutputFileType;
- (int64_t)recordingOutputVideoCodecType;
- (int64_t)recordingTotalDuration;
- (int64_t)recordingTotalFileSize;
- (int64_t)startWithCompositeMode;
- (int64_t)stringToSCReportingColorMatrix:(id)a3;
- (int64_t)stringToSCReportingColorSpace:(id)a3;
- (int64_t)stringToSCReportingPixelFormat:(id)a3;
- (int64_t)stringToSCReportingRecordingFileType:(id)a3;
- (int64_t)stringToSCReportingRecordingVideoCodecType:(id)a3;
- (int64_t)studioLightIntensityEndValue;
- (int64_t)targetFrameRate;
- (int64_t)totalAudioFrameCount;
- (int64_t)totalFrameCount;
- (int64_t)totalMicFrameCount;
- (void)addToThermalResultsWithLevel:(int64_t)a3;
- (void)reportRTCEvent:(id)a3 withStreamID:(id)a4;
- (void)reportRecordingRTCEvent:(id)a3 withStreamID:(id)a4;
- (void)resetReportingMetrics;
- (void)resetThermalResults;
- (void)setActiveDuration:(double)a3;
- (void)setAudioChannelCount:(int64_t)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioSampleRate:(int64_t)a3;
- (void)setAverageFrameLatency:(double)a3;
- (void)setAverageFrameLatencyAudio:(double)a3;
- (void)setAverageFrameLatencyMic:(double)a3;
- (void)setBackgroundColor:(int64_t)a3;
- (void)setBackgroundReplacementTotalDuration:(double)a3;
- (void)setCameraDeviceType:(int64_t)a3;
- (void)setCaptureDynamicRange:(int64_t)a3;
- (void)setCaptureResolutionType:(int64_t)a3;
- (void)setCenterStageEffectTotalDuration:(double)a3;
- (void)setClientBundleID:(id)a3;
- (void)setColorMatrix:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setContentScale:(float)a3;
- (void)setDestSurfaceHeight:(int64_t)a3;
- (void)setDestSurfaceWidth:(int64_t)a3;
- (void)setExcludeCallingClientAudio:(int64_t)a3;
- (void)setExcludedApplicationsCount:(int64_t)a3;
- (void)setExcludedWindowsCount:(int64_t)a3;
- (void)setFilterSource:(int64_t)a3;
- (void)setFloatingAverageLatency:(int64_t)a3;
- (void)setFloatingSessionCount:(int64_t)a3;
- (void)setFloatingToNewsroomTransitionCount:(int64_t)a3;
- (void)setFloatingTotalDuration:(double)a3;
- (void)setFloatingTotalFrameCount:(int64_t)a3;
- (void)setFrameHeight:(int64_t)a3;
- (void)setFrameQueueSize:(int64_t)a3;
- (void)setFrameWidth:(int64_t)a3;
- (void)setGestureDetectionBasedReactionsEnabled:(BOOL)a3;
- (void)setIncludedApplicationsCount:(int64_t)a3;
- (void)setIncludedWindowsCount:(int64_t)a3;
- (void)setIndividualWindow:(BOOL)a3;
- (void)setInputSurfaceHeight:(int64_t)a3;
- (void)setInputSurfaceWidth:(int64_t)a3;
- (void)setIsClientScreenCapture:(BOOL)a3;
- (void)setManualTriggeredReactionsCount:(int64_t)a3;
- (void)setMicEnabled:(BOOL)a3;
- (void)setNewsroomAverageLatency:(int64_t)a3;
- (void)setNewsroomBottomLeftWindowCount:(int64_t)a3;
- (void)setNewsroomBottomRightWindowCount:(int64_t)a3;
- (void)setNewsroomFullScreenContentCount:(int64_t)a3;
- (void)setNewsroomSessionCount:(int64_t)a3;
- (void)setNewsroomToFloatingTransitionCount:(int64_t)a3;
- (void)setNewsroomTopLeftWindowCount:(int64_t)a3;
- (void)setNewsroomTopRightWindowCount:(int64_t)a3;
- (void)setNewsroomTotalDuration:(double)a3;
- (void)setNewsroomTotalFrameCount:(int64_t)a3;
- (void)setPixelFormat:(id)a3;
- (void)setPortraitEffectTotalDuration:(double)a3;
- (void)setPortraitIntensityEndValue:(int64_t)a3;
- (void)setPreserveAspectRatio:(BOOL)a3;
- (void)setRecordingEndReason:(int64_t)a3;
- (void)setRecordingOutputCount:(int64_t)a3;
- (void)setRecordingOutputDuration:(int64_t)a3;
- (void)setRecordingOutputFileSize:(int64_t)a3;
- (void)setRecordingOutputFileType:(int64_t)a3;
- (void)setRecordingOutputVideoCodecType:(int64_t)a3;
- (void)setRecordingTotalDuration:(int64_t)a3;
- (void)setRecordingTotalFileSize:(int64_t)a3;
- (void)setScaleToFit:(BOOL)a3;
- (void)setShowCursor:(BOOL)a3;
- (void)setShowMouseClicks:(BOOL)a3;
- (void)setStartWithCompositeMode:(int64_t)a3;
- (void)setStreamID:(id)a3;
- (void)setStudioLightEffectTotalDuration:(double)a3;
- (void)setStudioLightIntensityEndValue:(int64_t)a3;
- (void)setTargetFrameRate:(int64_t)a3;
- (void)setTotalAudioFrameCount:(int64_t)a3;
- (void)setTotalFrameCount:(int64_t)a3;
- (void)setTotalMicFrameCount:(int64_t)a3;
- (void)setUserStopped:(BOOL)a3;
- (void)thermalPressureDidChangeWithLevel:(int64_t)a3;
- (void)updateReportWithClientProperties:(id)a3;
- (void)updateReportWithContentFilterDictionary:(id)a3;
- (void)updateReportWithRecordingFinishDuration:(int64_t)a3 fileSize:(int64_t)a4;
- (void)updateReportWithRecordingStartConfiguration:(id)a3;
@end

@implementation SCReporting

- (SCReporting)initWithClientBundleID:(id)a3 clientMainBundleID:(id)a4 streamID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SCReporting;
  v11 = [(SCReporting *)&v23 init];
  if (v11)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "-[SCReporting initWithClientBundleID:clientMainBundleID:streamID:]";
      __int16 v26 = 1024;
      int v27 = 89;
      __int16 v28 = 2048;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    [(SCReporting *)v11 setPixelFormat:&stru_100087990];
    [(SCReporting *)v11 setColorMatrix:&stru_100087990];
    [(SCReporting *)v11 setColorSpace:&stru_100087990];
    [(SCReporting *)v11 setUserStopped:0];
    uint64_t v12 = +[NSDate date];
    captureStartTime = v11->_captureStartTime;
    v11->_captureStartTime = (NSDate *)v12;

    id v14 = [v8 copy];
    [(SCReporting *)v11 setClientBundleID:v14];

    unsigned int v15 = [v9 isEqualToString:@"com.apple.systemuiserver"];
    id v16 = 0;
    if (v15) {
      id v16 = [v8 hasPrefix:@"/usr/sbin/screencapture"];
    }
    [(SCReporting *)v11 setIsClientScreenCapture:v16];
    id v17 = [v10 copy];
    [(SCReporting *)v11 setStreamID:v17];

    v18 = objc_alloc_init(RPThermalPressure);
    thermalPressureMonitor = v11->_thermalPressureMonitor;
    v11->_thermalPressureMonitor = v18;

    [(RPThermalPressure *)v11->_thermalPressureMonitor setDelegate:v11];
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    thermalResults = v11->_thermalResults;
    v11->_thermalResults = v20;

    [(SCReporting *)v11 resetThermalResults];
  }

  return v11;
}

- (int64_t)stringToSCReportingPixelFormat:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 integerValue];
  if (v3 > 1111970368)
  {
    if (v3 != 1111970369)
    {
      if (v3 == 1815162994) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
  else
  {
    if (v3 != 875704422)
    {
      if (v3 == 875704438) {
        return 3;
      }
      return 0;
    }
    return 4;
  }
}

- (int64_t)stringToSCReportingColorMatrix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ITU_R_601_4"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SMPTE_240M_1995"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = [v3 isEqualToString:@"ITU_R_709_2"];
  }

  return v4;
}

- (int64_t)stringToSCReportingColorSpace:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kCGColorSpaceDisplayP3"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceDisplayP3_HLG"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearDisplayP3"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceSRGB"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceLinearSRGB"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedSRGB"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearSRGB"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericGrayGamma2_2"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceLinearGray"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedGray"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearGray"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericRGBLinear"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericCMYK"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericXYZ"])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericLab"])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceACESCGLinear"])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceAdobeRGB1998"])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceDCIP3"])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceITUR_709"])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceROMMRGB"])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceITUR_2020"])
  {
    int64_t v4 = 21;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearITUR_2020"])
  {
    int64_t v4 = 22;
  }
  else if ([v3 isEqualToString:@"kCGColorSpaceGenericRGB"])
  {
    int64_t v4 = 23;
  }
  else
  {
    int64_t v4 = 24;
  }

  return v4;
}

- (int64_t)intToSCReportingAudioSampleRate:(int64_t)a3
{
  if (a3 > 23999)
  {
    if (a3 != 24000)
    {
      if (a3 == 48000) {
        return 4;
      }
      return 0;
    }
    return 3;
  }
  else
  {
    if (a3 != 8000)
    {
      if (a3 == 16000) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
}

- (int64_t)getCurrentStreamScreenConfiguration
{
  if (self->_individualWindow) {
    return 6;
  }
  int64_t includedApplicationsCount = self->_includedApplicationsCount;
  if (includedApplicationsCount && self->_excludedApplicationsCount) {
    return 4;
  }
  if (self->_includedWindowsCount)
  {
    if (self->_excludedWindowsCount) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if (includedApplicationsCount)
  {
    return 3;
  }
  else
  {
    return 5;
  }
}

- (int64_t)getColorFromRGBA:(double)a3 withGreen:(double)a4 withBlue:(double)a5 withAlpha:(double)a6
{
  if (a3 > 1.0 && a4 > 1.0 && a5 > 1.0)
  {
    a3 = a3 / 255.0;
    a4 = a4 / 255.0;
    a5 = a5 / 255.0;
  }
  BOOL v8 = a3 == 0.0;
  if (a4 != 0.0) {
    BOOL v8 = 0;
  }
  BOOL v9 = a5 == 0.0 && v8;
  if (a6 == 0.0 && v9) {
    int64_t result = 16;
  }
  else {
    int64_t result = 2;
  }
  if (!v9)
  {
    if (a3 == 0.333 && a4 == 0.333 && a5 == 0.333)
    {
      return 3;
    }
    else if (a3 == 0.667 && a4 == 0.667 && a5 == 0.667)
    {
      return 4;
    }
    else if (a3 == 0.5 && a4 == 0.5 && a5 == 0.5)
    {
      return 6;
    }
    else
    {
      BOOL v11 = a3 == 1.0;
      if (a4 != 1.0) {
        BOOL v11 = 0;
      }
      if (v11 && a5 == 1.0)
      {
        return 5;
      }
      else
      {
        BOOL v12 = a3 == 1.0;
        if (a4 != 0.0) {
          BOOL v12 = 0;
        }
        if (v12 && a5 == 0.0)
        {
          return 7;
        }
        else
        {
          BOOL v13 = a3 == 0.0;
          if (a4 != 1.0) {
            BOOL v13 = 0;
          }
          if (v13 && a5 == 0.0)
          {
            return 8;
          }
          else
          {
            if (a5 != 1.0) {
              BOOL v8 = 0;
            }
            if (v8)
            {
              return 9;
            }
            else if (a5 == 1.0 && v13)
            {
              return 10;
            }
            else if (a5 == 0.0 && v11)
            {
              return 11;
            }
            else if (a5 == 1.0 && v12)
            {
              return 12;
            }
            else if (a3 == 1.0 && a4 == 0.5 && a5 == 0.0)
            {
              return 13;
            }
            else if (a3 == 0.5 && a4 == 0.0 && a5 == 0.5)
            {
              return 14;
            }
            else if (a5 == 0.2 && a4 == 0.4 && a3 == 0.6)
            {
              return 15;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)collectSummaryEventMetrics
{
  [(SCReporting *)self addToThermalResultsWithLevel:[(RPThermalPressure *)self->_thermalPressureMonitor getCurrentPressureLevel]];
  id v83 = objc_alloc((Class)NSMutableDictionary);
  v104[0] = @"SID";
  v97 = [(SCReporting *)self streamID];
  v105[0] = v97;
  v104[1] = @"CVCW";
  v96 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self frameWidth]), 0x32uLL)];
  v105[1] = v96;
  v104[2] = @"CVCH";
  v95 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self frameHeight]), 0x32uLL)];
  v105[2] = v95;
  v104[3] = @"CVCR";
  v94 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf((float)[(SCReporting *)self targetFrameRate]), 2uLL)];
  v105[3] = v94;
  v104[4] = @"PVFC";
  v93 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf((float)[(SCReporting *)self totalFrameCount]), 2uLL)];
  v105[4] = v93;
  v104[5] = @"CBID";
  v92 = [(SCReporting *)self clientBundleID];
  unsigned int v91 = -[SCReporting shouldReportBundleID:](self, "shouldReportBundleID:");
  if (v91)
  {
    CFStringRef v3 = [(SCReporting *)self clientBundleID];
  }
  else
  {
    CFStringRef v3 = &stru_100087990;
  }
  v32 = (__CFString *)v3;
  v105[5] = v3;
  v104[6] = @"CPF";
  v90 = [(SCReporting *)self pixelFormat];
  if (v90)
  {
    v31 = [(SCReporting *)self pixelFormat];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingPixelFormat:](self, "stringToSCReportingPixelFormat:"));
    CFStringRef v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v4 = &stru_100087990;
  }
  v35 = (__CFString *)v4;
  v105[6] = v4;
  v104[7] = @"CSF";
  v89 = +[NSNumber numberWithBool:[(SCReporting *)self scaleToFit]];
  v105[7] = v89;
  v104[8] = @"CPA";
  v88 = +[NSNumber numberWithBool:[(SCReporting *)self preserveAspectRatio]];
  v105[8] = v88;
  v104[9] = @"CSC";
  v87 = +[NSNumber numberWithBool:[(SCReporting *)self showCursor]];
  v105[9] = v87;
  v104[10] = @"CBG";
  v86 = +[NSNumber numberWithInteger:[(SCReporting *)self backgroundColor]];
  v105[10] = v86;
  v104[11] = @"CSW";
  v85 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self inputSurfaceWidth]), 0x32uLL)];
  v105[11] = v85;
  v104[12] = @"CSH";
  v82 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self inputSurfaceHeight]), 0x32uLL)];
  v105[12] = v82;
  v104[13] = @"CDW";
  v81 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self destSurfaceWidth]), 0x32uLL)];
  v105[13] = v81;
  v104[14] = @"CDH";
  v80 = +[NSNumber numberWithUnsignedLongLong:sub_10001C258(llroundf((float)[(SCReporting *)self destSurfaceHeight]), 0x32uLL)];
  v105[14] = v80;
  v104[15] = @"CQD";
  v79 = +[NSNumber numberWithInteger:[(SCReporting *)self frameQueueSize]];
  v105[15] = v79;
  v104[16] = @"CCM";
  uint64_t v5 = [(SCReporting *)self colorMatrix];
  if (v5)
  {
    v30 = [(SCReporting *)self colorMatrix];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingColorMatrix:](self, "stringToSCReportingColorMatrix:"));
    CFStringRef v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v6 = &stru_100087990;
  }
  v34 = (__CFString *)v6;
  v105[16] = v6;
  v104[17] = @"CCS";
  v77 = [(SCReporting *)self colorSpace];
  v78 = (void *)v5;
  if (v77)
  {
    v29 = [(SCReporting *)self colorSpace];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SCReporting stringToSCReportingColorSpace:](self, "stringToSCReportingColorSpace:"));
    CFStringRef v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v7 = &stru_100087990;
  }
  v33 = (__CFString *)v7;
  v105[17] = v7;
  v104[18] = @"PDUR";
  [(SCReporting *)self activeDuration];
  *(float *)&double v8 = v8;
  v76 = +[NSNumber numberWithLong:llroundf(*(float *)&v8)];
  v105[18] = v76;
  v104[19] = @"PLAT";
  [(SCReporting *)self averageFrameLatency];
  *(float *)&double v9 = round(v9 * 1000000.0);
  v75 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v9), 2uLL)];
  v105[19] = v75;
  v104[20] = @"AE";
  v74 = +[NSNumber numberWithBool:[(SCReporting *)self audioEnabled]];
  v105[20] = v74;
  v104[21] = @"ASR";
  v73 = +[NSNumber numberWithInteger:[(SCReporting *)self intToSCReportingAudioSampleRate:[(SCReporting *)self audioSampleRate]]];
  v105[21] = v73;
  v104[22] = @"ACC";
  v72 = +[NSNumber numberWithInteger:[(SCReporting *)self audioChannelCount]];
  v105[22] = v72;
  v104[23] = @"AEXC";
  v71 = +[NSNumber numberWithInteger:[(SCReporting *)self excludeCallingClientAudio]];
  v105[23] = v71;
  v104[24] = @"ALAT";
  [(SCReporting *)self averageFrameLatencyAudio];
  *(float *)&double v10 = round(v10 * 1000000.0);
  v70 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v10), 2uLL)];
  v105[24] = v70;
  v104[25] = @"CFD";
  v69 = +[NSNumber numberWithInteger:[(SCReporting *)self getCurrentStreamScreenConfiguration]];
  v105[25] = v69;
  v104[26] = @"CFSRC";
  v68 = +[NSNumber numberWithInteger:[(SCReporting *)self filterSource]];
  v105[26] = v68;
  v104[27] = @"SWCMD";
  v67 = +[NSNumber numberWithInteger:[(SCReporting *)self startWithCompositeMode]];
  v105[27] = v67;
  v104[28] = @"NDUR";
  [(SCReporting *)self newsroomTotalDuration];
  *(float *)&double v11 = v11;
  v66 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v11), 2uLL)];
  v105[28] = v66;
  v104[29] = @"FDUR";
  [(SCReporting *)self floatingTotalDuration];
  *(float *)&double v12 = v12;
  v65 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v12), 2uLL)];
  v105[29] = v65;
  v104[30] = @"NSC";
  v64 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomSessionCount], 2uLL)];
  v105[30] = v64;
  v104[31] = @"FSC";
  v63 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self floatingSessionCount], 2uLL)];
  v105[31] = v63;
  v104[32] = @"NFC";
  v62 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomTotalFrameCount], 2uLL)];
  v105[32] = v62;
  v104[33] = @"FFC";
  v61 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self floatingTotalFrameCount], 2uLL)];
  v105[33] = v61;
  v104[34] = @"NTFC";
  v60 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomToFloatingTransitionCount], 2uLL)];
  v105[34] = v60;
  v104[35] = @"FTNC";
  v59 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self floatingToNewsroomTransitionCount], 2uLL)];
  v105[35] = v59;
  v104[36] = @"NTLC";
  v58 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomTopLeftWindowCount], 2uLL)];
  v105[36] = v58;
  v104[37] = @"NTRC";
  v57 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomTopRightWindowCount], 2uLL)];
  v105[37] = v57;
  v104[38] = @"NBRC";
  v56 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomBottomRightWindowCount], 2uLL)];
  v105[38] = v56;
  v104[39] = @"NBLC";
  v55 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomBottomLeftWindowCount], 2uLL)];
  v105[39] = v55;
  v104[40] = @"NFMC";
  v54 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self newsroomFullScreenContentCount], 2uLL)];
  v105[40] = v54;
  v104[41] = @"PDR";
  [(SCReporting *)self portraitEffectTotalDuration];
  *(float *)&double v13 = v13;
  v53 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v13), 2uLL)];
  v105[41] = v53;
  v104[42] = @"CSDR";
  [(SCReporting *)self centerStageEffectTotalDuration];
  *(float *)&double v14 = v14;
  v52 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v14), 2uLL)];
  v105[42] = v52;
  v104[43] = @"SLDR";
  [(SCReporting *)self studioLightEffectTotalDuration];
  *(float *)&double v15 = v15;
  v51 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v15), 2uLL)];
  v105[43] = v51;
  v104[44] = @"BGDR";
  [(SCReporting *)self backgroundReplacementTotalDuration];
  *(float *)&double v16 = v16;
  v50 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v16), 2uLL)];
  v105[44] = v50;
  v104[45] = @"GBRE";
  v49 = +[NSNumber numberWithBool:[(SCReporting *)self gestureDetectionBasedReactionsEnabled]];
  v105[45] = v49;
  v104[46] = @"MTRC";
  v48 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self manualTriggeredReactionsCount], 2uLL)];
  v105[46] = v48;
  v104[47] = @"PIEV";
  v47 = +[NSNumber numberWithInteger:[(SCReporting *)self portraitIntensityEndValue]];
  v105[47] = v47;
  v104[48] = @"SIEV";
  v46 = +[NSNumber numberWithInteger:[(SCReporting *)self studioLightIntensityEndValue]];
  v105[48] = v46;
  v104[49] = @"CDT";
  v45 = +[NSNumber numberWithInteger:[(SCReporting *)self cameraDeviceType]];
  v105[49] = v45;
  v104[50] = @"IWC";
  v44 = +[NSNumber numberWithInteger:[(SCReporting *)self includedWindowsCount]];
  v105[50] = v44;
  v104[51] = @"IAC";
  v43 = +[NSNumber numberWithInteger:[(SCReporting *)self includedApplicationsCount]];
  v105[51] = v43;
  v104[52] = @"EWC";
  v42 = +[NSNumber numberWithInteger:[(SCReporting *)self excludedWindowsCount]];
  v105[52] = v42;
  v104[53] = @"EAC";
  v41 = +[NSNumber numberWithInteger:[(SCReporting *)self excludedApplicationsCount]];
  v105[53] = v41;
  v104[54] = @"US";
  v40 = +[NSNumber numberWithBool:[(SCReporting *)self userStopped]];
  v105[54] = v40;
  v104[55] = @"DUID";
  v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[RPStringUtility rotatingDeviceUniqueID]);
  v105[55] = v39;
  v104[56] = @"CRT";
  v38 = +[NSNumber numberWithInteger:[(SCReporting *)self captureResolutionType]];
  v105[56] = v38;
  v104[57] = @"CHDR";
  v37 = +[NSNumber numberWithInteger:[(SCReporting *)self captureDynamicRange]];
  v105[57] = v37;
  v104[58] = @"MICE";
  v36 = +[NSNumber numberWithBool:[(SCReporting *)self micEnabled]];
  v105[58] = v36;
  v104[59] = @"MLAT";
  [(SCReporting *)self averageFrameLatencyMic];
  *(float *)&double v17 = round(v17 * 1000000.0);
  v18 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf(*(float *)&v17), 2uLL)];
  v105[59] = v18;
  v104[60] = @"REC";
  v19 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self recordingOutputCount], 2uLL)];
  v105[60] = v19;
  v104[61] = @"RED";
  v20 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self recordingTotalDuration], 2uLL)];
  v105[61] = v20;
  v104[62] = @"RES";
  v21 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self recordingTotalFileSize], 2uLL)];
  v105[62] = v21;
  v104[63] = @"CSS";
  v22 = +[NSNumber numberWithBool:[(SCReporting *)self isClientScreenCapture]];
  v105[63] = v22;
  v104[64] = @"CSMC";
  objc_super v23 = +[NSNumber numberWithBool:[(SCReporting *)self showMouseClicks]];
  v105[64] = v23;
  v104[65] = @"PAFC";
  v24 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf((float)[(SCReporting *)self totalAudioFrameCount]), 2uLL)];
  v105[65] = v24;
  v104[66] = @"PMFC";
  v25 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278(llroundf((float)[(SCReporting *)self totalMicFrameCount]), 2uLL)];
  v105[66] = v25;
  v104[67] = @"TPL";
  __int16 v26 = [(SCReporting *)self thermalDescription];
  v105[67] = v26;
  int v27 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:68];
  id v84 = [v83 initWithDictionary:v27];

  if (v77)
  {
  }
  if (v78)
  {
  }
  if (v90)
  {
  }
  if (v91) {

  }
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v99 = "-[SCReporting collectSummaryEventMetrics]";
    __int16 v100 = 1024;
    int v101 = 328;
    __int16 v102 = 2112;
    id v103 = v84;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@", buf, 0x1Cu);
  }

  return v84;
}

- (id)thermalDescription
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_thermalResults allKeys];
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  CFStringRef v4 = &stru_100087990;
  if (v3)
  {
    id v5 = v3;
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      double v8 = 0;
      double v9 = v4;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [(NSMutableDictionary *)self->_thermalResults objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)v8)];
        double v11 = (void *)v10;
        double v12 = ",";
        if (!(v6 + v8)) {
          double v12 = "";
        }
        if (v10) {
          CFStringRef v13 = (const __CFString *)v10;
        }
        else {
          CFStringRef v13 = &stru_100087990;
        }
        CFStringRef v4 = [(__CFString *)v9 stringByAppendingFormat:@"%s%@", v12, v13];

        double v8 = (char *)v8 + 1;
        double v9 = v4;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      v6 += (int)v8;
    }
    while (v5);
  }

  return v4;
}

- (void)updateReportWithContentFilterDictionary:(id)a3
{
  id v18 = a3;
  CFStringRef v4 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterIndividualWindowID"];

  if (v4)
  {
    self->_individualWindow = 1;
  }
  else
  {
    id v5 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedWindows"];
    self->_includedWindowsCount = (int64_t)[v5 count];

    int v6 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedWindows"];
    self->_excludedWindowsCount = (int64_t)[v6 count];

    uint64_t v7 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedBundleIDs"];
    id v8 = [v7 count];
    double v9 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedVideoPIDs"];
    self->_int64_t includedApplicationsCount = (int64_t)v8 + (void)[v9 count];

    uint64_t v10 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedBundleIDs"];
    id v11 = [v10 count];
    double v12 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedVideoPIDs"];
    self->_excludedApplicationsCount = (int64_t)v11 + (void)[v12 count];
  }
  CFStringRef v13 = [v18 objectForKeyedSubscript:@"SCStreamPreservedContentFilterCompositeConfig"];
  double v14 = [v13 objectForKeyedSubscript:@"SCStreamPropertiesCompositeSessionMode"];
  id v15 = 0;
  if (v13 && v14) {
    id v15 = [v14 integerValue];
  }
  self->_startWithCompositeMode = (int64_t)v15;
  id v16 = [v18 objectForKeyedSubscript:@"SCStreamContentFilterSource"];
  long long v17 = v16;
  if (v16) {
    id v16 = [v16 integerValue];
  }
  self->_filterSource = (int64_t)v16;
}

- (void)updateReportWithClientProperties:(id)a3
{
  id v104 = a3;
  uint64_t v4 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesWidth"];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesHeight"];

    if (v6)
    {
      uint64_t v7 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesWidth"];
      [v7 floatValue];
      float v9 = v8;
      uint64_t v10 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesHeight"];
      [v10 floatValue];
      float v12 = v11;

      self->_frameWidth = (uint64_t)v9;
      self->_frameHeight = (uint64_t)v12;
    }
  }
  CFStringRef v13 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesPixelFormat"];

  if (v13)
  {
    double v14 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesPixelFormat"];
    pixelFormat = self->_pixelFormat;
    self->_pixelFormat = v14;
  }
  uint64_t v16 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"];
  if (v16)
  {
    long long v17 = (void *)v16;
    id v18 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"];
    [v18 doubleValue];
    double v20 = v19;

    if (v20 > 0.0)
    {
      v21 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"];
      [v21 doubleValue];
      self->_targetFrameRate = (uint64_t)(1.0 / v22);
    }
  }
  objc_super v23 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesScaleToFit"];

  if (v23)
  {
    v24 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesScaleToFit"];
    self->_scaleToFit = [v24 BOOLValue];
  }
  v25 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesPreserveAspectRatio"];

  if (v25)
  {
    __int16 v26 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesPreserveAspectRatio"];
    self->_preserveAspectRatio = [v26 BOOLValue];
  }
  uint64_t v27 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"];
  if (v27)
  {
    __int16 v28 = (void *)v27;
    v29 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"];
    if ((uint64_t)[v29 longValue] <= 0)
    {
    }
    else
    {
      v30 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"];
      uint64_t v31 = (uint64_t)[v30 longValue];

      if (v31 > 8) {
        goto LABEL_19;
      }
      __int16 v28 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"];
      self->_frameQueueSize = (int64_t)[v28 longValue];
    }
  }
LABEL_19:
  v32 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesShowCursor"];

  if (v32)
  {
    v33 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesShowCursor"];
    self->_showCursor = [v33 BOOLValue];
  }
  v34 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorR"];
  [v34 doubleValue];
  double v36 = v35;
  v37 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorG"];
  [v37 doubleValue];
  double v39 = v38;
  v40 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorB"];
  [v40 doubleValue];
  double v42 = v41;
  v43 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorA"];
  [v43 doubleValue];
  self->_backgroundColor = [(SCReporting *)self getColorFromRGBA:v36 withGreen:v39 withBlue:v42 withAlpha:v44];

  v45 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectX"];
  if (v45)
  {
    uint64_t v46 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectY"];
    if (v46)
    {
      v47 = (void *)v46;
      uint64_t v48 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectWidth"];
      if (v48)
      {
        v49 = (void *)v48;
        v50 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectHeight"];

        if (v50)
        {
          v51 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectX"];
          [v51 floatValue];
          v52 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectY"];
          [v52 floatValue];
          v53 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectWidth"];
          [v53 floatValue];
          float v55 = v54;
          v56 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectHeight"];
          [v56 floatValue];
          float v58 = v57;

          self->_inputSurfaceWidth = (uint64_t)v55;
          self->_inputSurfaceHeight = (uint64_t)v58;
        }
        goto LABEL_28;
      }
    }
  }
LABEL_28:
  v59 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectX"];
  v60 = v104;
  if (!v59) {
    goto LABEL_35;
  }
  uint64_t v61 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectY"];
  if (!v61) {
    goto LABEL_34;
  }
  v62 = (void *)v61;
  uint64_t v63 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectWidth"];
  if (!v63)
  {

LABEL_34:
    v60 = v104;
    goto LABEL_35;
  }
  v64 = (void *)v63;
  v65 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectHeight"];

  v60 = v104;
  if (v65)
  {
    v66 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectX"];
    [v66 floatValue];
    v67 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectY"];
    [v67 floatValue];
    v68 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectWidth"];
    [v68 floatValue];
    float v70 = v69;
    v71 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectHeight"];
    [v71 floatValue];
    float v73 = v72;

    v60 = v104;
    self->_destSurfaceWidth = (uint64_t)v70;
    self->_destSurfaceHeight = (uint64_t)v73;
  }
LABEL_35:
  v74 = [v60 objectForKeyedSubscript:@"SCStreamPropertiesColorSpace"];

  if (v74)
  {
    v75 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesColorSpace"];
    colorSpace = self->_colorSpace;
    self->_colorSpace = v75;
  }
  v77 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesColorMatrix"];

  if (v77)
  {
    v78 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesColorMatrix"];
    colorMatrix = self->_colorMatrix;
    self->_colorMatrix = v78;
  }
  v80 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesContentScale"];

  if (v80)
  {
    v81 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesContentScale"];
    [v81 floatValue];
    self->_contentScale = v82;
  }
  id v83 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesAudioEnabled"];

  if (v83)
  {
    id v84 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesAudioEnabled"];
    self->_audioEnabled = [v84 BOOLValue];
  }
  v85 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSampleRate"];

  if (v85)
  {
    v86 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesSampleRate"];
    self->_audioSampleRate = (int)[v86 intValue];
  }
  v87 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesChannelCount"];

  if (v87)
  {
    v88 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesChannelCount"];
    self->_audioChannelCount = (int)[v88 intValue];
  }
  v89 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesExcludeCallingClientAudio"];

  if (v89)
  {
    v90 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesExcludeCallingClientAudio"];
    self->_excludeCallingClientAudio = [v90 BOOLValue];
  }
  unsigned int v91 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBestResolution"];
  if ([v91 BOOLValue])
  {
    v92 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesNominalResolution"];
    unsigned int v93 = [v92 BOOLValue];

    if (!v93)
    {
      int64_t v94 = 2;
      goto LABEL_58;
    }
  }
  else
  {
  }
  v95 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesNominalResolution"];
  if ([v95 BOOLValue])
  {
    v96 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesBestResolution"];
    unsigned int v97 = [v96 BOOLValue];

    if (!v97)
    {
      int64_t v94 = 3;
      goto LABEL_58;
    }
  }
  else
  {
  }
  int64_t v94 = 1;
LABEL_58:
  self->_captureResolutionType = v94;
  v98 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesCaptureDynamicRange"];

  if (v98)
  {
    v99 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesCaptureDynamicRange"];
    self->_captureDynamicRange = [v99 unsignedIntValue];
  }
  __int16 v100 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesMicrophoneEnabled"];

  if (v100)
  {
    int v101 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesMicrophoneEnabled"];
    self->_micEnabled = [v101 BOOLValue];
  }
  __int16 v102 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesShowMouseClicks"];

  if (v102)
  {
    id v103 = [v104 objectForKeyedSubscript:@"SCStreamPropertiesShowMouseClicks"];
    self->_showMouseClicks = [v103 BOOLValue];
  }
}

- (int64_t)stringToSCReportingRecordingFileType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AVFileTypeMPEG4])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:AVFileTypeQuickTimeMovie])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)stringToSCReportingRecordingVideoCodecType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AVVideoCodecTypeH264])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:AVVideoCodecTypeHEVC])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)updateReportWithRecordingStartConfiguration:(id)a3
{
  int64_t v4 = self->_recordingOutputCount + 1;
  self->_recordingOutputDuration = 0;
  self->_recordingOutputFileSize = 0;
  self->_recordingOutputCount = v4;
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"SCRecordingOutputConfigOutputFileType"];
  self->_recordingOutputFileType = [(SCReporting *)self stringToSCReportingRecordingFileType:v6];

  id v7 = [v5 objectForKeyedSubscript:@"SCRecordingOutputConfigVideoCodecType"];

  self->_recordingOutputVideoCodecType = [(SCReporting *)self stringToSCReportingRecordingVideoCodecType:v7];
}

- (void)updateReportWithRecordingFinishDuration:(int64_t)a3 fileSize:(int64_t)a4
{
  self->_recordingOutputDuration = a3;
  self->_recordingOutputFileSize = a4;
  self->_recordingTotalDuration += a3;
  self->_recordingTotalFileSize += a4;
}

- (id)collectSummaryRecordingEventMetrics
{
  v11[0] = @"SID";
  id v3 = [(SCReporting *)self streamID];
  v12[0] = v3;
  v11[1] = @"RED";
  int64_t v4 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self recordingOutputDuration], 2uLL)];
  v12[1] = v4;
  v11[2] = @"RES";
  id v5 = +[NSNumber numberWithUnsignedLongLong:sub_10001C278([(SCReporting *)self recordingOutputFileSize], 2uLL)];
  v12[2] = v5;
  v11[3] = @"REFT";
  int v6 = +[NSNumber numberWithInteger:[(SCReporting *)self recordingOutputFileType]];
  v12[3] = v6;
  v11[4] = @"REVC";
  id v7 = +[NSNumber numberWithInteger:[(SCReporting *)self recordingOutputVideoCodecType]];
  v12[4] = v7;
  v11[5] = @"CSS";
  float v8 = +[NSNumber numberWithBool:[(SCReporting *)self isClientScreenCapture]];
  v12[5] = v8;
  float v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (void)reportRecordingRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = [(SCReporting *)self collectSummaryRecordingEventMetrics];
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    uint64_t v10 = "-[SCReporting reportRecordingRTCEvent:withStreamID:]";
    __int16 v11 = 1024;
    int v12 = 502;
    __int16 v13 = 2112;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d reportingMetric=%@", (uint8_t *)&v9, 0x1Cu);
  }
  [v6 reportSCEventWithType:1 dictionary:v8 streamID:v7];
}

- (void)resetReportingMetrics
{
  id v3 = +[NSDate date];
  captureStartTime = self->_captureStartTime;
  self->_captureStartTime = v3;

  self->_totalFrameCount = 0;
  self->_userStopped = 0;
  *(_OWORD *)&self->_totalAudioFrameCount = 0u;
  *(_OWORD *)&self->_newsroomTotalDuration = 0u;
  *(_OWORD *)&self->_newsroomSessionCount = 0u;
  *(_OWORD *)&self->_recordingTotalDuration = 0u;

  [(SCReporting *)self resetThermalResults];
}

- (void)resetThermalResults
{
  [(RPThermalPressure *)self->_thermalPressureMonitor stopMonitoring];
  [(NSMutableDictionary *)self->_thermalResults removeAllObjects];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089BD0];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089BE8];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089C00];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089C18];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089C30];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089BB8 forKeyedSubscript:&off_100089C48];
  id v3 = +[NSDate date];
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v3;

  thermalPressureMonitor = self->_thermalPressureMonitor;

  [(RPThermalPressure *)thermalPressureMonitor startMonitoring];
}

- (void)reportRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:self->_captureStartTime];
  self->_double activeDuration = v9;

  if (self->_activeDuration <= 5.0)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double activeDuration = self->_activeDuration;
      int v12 = 136446978;
      __int16 v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      __int16 v14 = 1024;
      int v15 = 542;
      __int16 v16 = 2048;
      double v17 = activeDuration;
      __int16 v18 = 1024;
      int v19 = 5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d not reporting session of %f seconds less than %d seconds", (uint8_t *)&v12, 0x22u);
    }
  }
  else
  {
    uint64_t v10 = [(SCReporting *)self collectSummaryEventMetrics];
    if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      __int16 v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      __int16 v14 = 1024;
      int v15 = 538;
      __int16 v16 = 2112;
      double v17 = *(double *)&v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d reportingMetric=%@", (uint8_t *)&v12, 0x1Cu);
    }
    [v6 reportSCEventWithType:1 dictionary:v10 streamID:v7];
    [(SCReporting *)self resetReportingMetrics];
  }
  [(SCReporting *)self resetReportingMetrics];
}

- (BOOL)shouldReportBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if (qword_100099C50 != -1) {
      dispatch_once(&qword_100099C50, &stru_1000856E0);
    }
    v11.tv_sec = 0;
    *(void *)&v11.tv_usec = 0;
    memset(&v10, 0, sizeof(v10));
    gettimeofday(&v11, 0);
    localtime_r(&v11.tv_sec, &v10);
    int data = v10.tm_yday + 366 * v10.tm_year;
    memset(&v8, 0, sizeof(v8));
    CC_SHA256_Init(&v8);
    CC_SHA256_Update(&v8, &unk_100099C40, 0x10u);
    CC_SHA256_Update(&v8, &data, 4u);
    if (v3)
    {
      int64_t v4 = (const char *)[v3 UTF8String];
      CC_LONG v5 = strlen(v4);
      CC_SHA256_Update(&v8, v4, v5);
    }
    CC_SHA256_Final(md, &v8);
    BOOL v6 = *(unsigned __int16 *)md < 0x290u;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)thermalPressureDidChangeWithLevel:(int64_t)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    BOOL v6 = "-[SCReporting thermalPressureDidChangeWithLevel:]";
    __int16 v7 = 1024;
    int v8 = 580;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d level=%ld", (uint8_t *)&v5, 0x1Cu);
  }
  [(SCReporting *)self addToThermalResultsWithLevel:a3];
}

- (void)addToThermalResultsWithLevel:(int64_t)a3
{
  int v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:self->_thermalLevelIntervalStartTime];
  *(float *)&double v6 = v6;
  double v7 = (double)(uint64_t)llroundf(*(float *)&v6);

  thermalResults = self->_thermalResults;
  __int16 v9 = +[NSNumber numberWithInteger:a3];
  int64_t v10 = [(NSMutableDictionary *)thermalResults objectForKeyedSubscript:v9];
  [v10 doubleValue];
  double v12 = v11 + v7;

  __int16 v13 = +[NSNumber numberWithDouble:v12];
  __int16 v14 = self->_thermalResults;
  int v15 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  self->_thermalLevelIntervalStartTime = +[NSDate date];

  _objc_release_x1();
}

+ (void)reportAlertRTCEventWithClientBundelID:(id)a3 isLegacy:(BOOL)a4 didAlert:(BOOL)a5 methodType:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  [v13 setObject:v9 forKeyedSubscript:@"CBID"];

  int64_t v10 = +[NSNumber numberWithBool:v7];
  [v13 setObject:v10 forKeyedSubscript:@"ALT"];

  double v11 = +[NSNumber numberWithBool:v8];
  [v13 setObject:v11 forKeyedSubscript:@"LGC"];

  double v12 = +[NSNumber numberWithUnsignedInteger:a6];
  [v13 setObject:v12 forKeyedSubscript:@"MTY"];

  +[RPReportingAgent sendReportEventWithType:6 dictionary:v13 withServiceName:@"SCKCapture" clientBundleId:@"com.apple.replayd" sessionID:&stru_100087990];
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
}

- (int64_t)frameWidth
{
  return self->_frameWidth;
}

- (void)setFrameWidth:(int64_t)a3
{
  self->_frameWidth = a3;
}

- (int64_t)frameHeight
{
  return self->_frameHeight;
}

- (void)setFrameHeight:(int64_t)a3
{
  self->_frameHeight = a3;
}

- (int64_t)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(int64_t)a3
{
  self->_targetFrameRate = a3;
}

- (int64_t)totalFrameCount
{
  return self->_totalFrameCount;
}

- (void)setTotalFrameCount:(int64_t)a3
{
  self->_totalFrameCount = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
}

- (BOOL)scaleToFit
{
  return self->_scaleToFit;
}

- (void)setScaleToFit:(BOOL)a3
{
  self->_scaleToFit = a3;
}

- (BOOL)preserveAspectRatio
{
  return self->_preserveAspectRatio;
}

- (void)setPreserveAspectRatio:(BOOL)a3
{
  self->_preserveAspectRatio = a3;
}

- (BOOL)showCursor
{
  return self->_showCursor;
}

- (void)setShowCursor:(BOOL)a3
{
  self->_showCursor = a3;
}

- (int64_t)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int64_t)a3
{
  self->_backgroundColor = a3;
}

- (int64_t)inputSurfaceWidth
{
  return self->_inputSurfaceWidth;
}

- (void)setInputSurfaceWidth:(int64_t)a3
{
  self->_inputSurfaceWidth = a3;
}

- (int64_t)inputSurfaceHeight
{
  return self->_inputSurfaceHeight;
}

- (void)setInputSurfaceHeight:(int64_t)a3
{
  self->_inputSurfaceHeight = a3;
}

- (int64_t)destSurfaceWidth
{
  return self->_destSurfaceWidth;
}

- (void)setDestSurfaceWidth:(int64_t)a3
{
  self->_destSurfaceWidth = a3;
}

- (int64_t)destSurfaceHeight
{
  return self->_destSurfaceHeight;
}

- (void)setDestSurfaceHeight:(int64_t)a3
{
  self->_destSurfaceHeight = a3;
}

- (int64_t)frameQueueSize
{
  return self->_frameQueueSize;
}

- (void)setFrameQueueSize:(int64_t)a3
{
  self->_frameQueueSize = a3;
}

- (NSString)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
}

- (float)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(float)a3
{
  self->_contentScale = a3;
}

- (int64_t)totalAudioFrameCount
{
  return self->_totalAudioFrameCount;
}

- (void)setTotalAudioFrameCount:(int64_t)a3
{
  self->_totalAudioFrameCount = a3;
}

- (int64_t)totalMicFrameCount
{
  return self->_totalMicFrameCount;
}

- (void)setTotalMicFrameCount:(int64_t)a3
{
  self->_totalMicFrameCount = a3;
}

- (int64_t)includedWindowsCount
{
  return self->_includedWindowsCount;
}

- (void)setIncludedWindowsCount:(int64_t)a3
{
  self->_includedWindowsCount = a3;
}

- (int64_t)excludedWindowsCount
{
  return self->_excludedWindowsCount;
}

- (void)setExcludedWindowsCount:(int64_t)a3
{
  self->_excludedWindowsCount = a3;
}

- (int64_t)includedApplicationsCount
{
  return self->_includedApplicationsCount;
}

- (void)setIncludedApplicationsCount:(int64_t)a3
{
  self->_int64_t includedApplicationsCount = a3;
}

- (int64_t)excludedApplicationsCount
{
  return self->_excludedApplicationsCount;
}

- (void)setExcludedApplicationsCount:(int64_t)a3
{
  self->_excludedApplicationsCount = a3;
}

- (BOOL)userStopped
{
  return self->_userStopped;
}

- (void)setUserStopped:(BOOL)a3
{
  self->_userStopped = a3;
}

- (BOOL)individualWindow
{
  return self->_individualWindow;
}

- (void)setIndividualWindow:(BOOL)a3
{
  self->_individualWindow = a3;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (void)setActiveDuration:(double)a3
{
  self->_double activeDuration = a3;
}

- (double)averageFrameLatency
{
  return self->_averageFrameLatency;
}

- (void)setAverageFrameLatency:(double)a3
{
  self->_averageFrameLatency = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (int64_t)audioSampleRate
{
  return self->_audioSampleRate;
}

- (void)setAudioSampleRate:(int64_t)a3
{
  self->_audioSampleRate = a3;
}

- (int64_t)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)setAudioChannelCount:(int64_t)a3
{
  self->_audioChannelCount = a3;
}

- (int64_t)excludeCallingClientAudio
{
  return self->_excludeCallingClientAudio;
}

- (void)setExcludeCallingClientAudio:(int64_t)a3
{
  self->_excludeCallingClientAudio = a3;
}

- (double)averageFrameLatencyAudio
{
  return self->_averageFrameLatencyAudio;
}

- (void)setAverageFrameLatencyAudio:(double)a3
{
  self->_averageFrameLatencyAudio = a3;
}

- (int64_t)filterSource
{
  return self->_filterSource;
}

- (void)setFilterSource:(int64_t)a3
{
  self->_filterSource = a3;
}

- (int64_t)startWithCompositeMode
{
  return self->_startWithCompositeMode;
}

- (void)setStartWithCompositeMode:(int64_t)a3
{
  self->_startWithCompositeMode = a3;
}

- (double)newsroomTotalDuration
{
  return self->_newsroomTotalDuration;
}

- (void)setNewsroomTotalDuration:(double)a3
{
  self->_newsroomTotalDuration = a3;
}

- (double)floatingTotalDuration
{
  return self->_floatingTotalDuration;
}

- (void)setFloatingTotalDuration:(double)a3
{
  self->_floatingTotalDuration = a3;
}

- (int64_t)newsroomSessionCount
{
  return self->_newsroomSessionCount;
}

- (void)setNewsroomSessionCount:(int64_t)a3
{
  self->_newsroomSessionCount = a3;
}

- (int64_t)floatingSessionCount
{
  return self->_floatingSessionCount;
}

- (void)setFloatingSessionCount:(int64_t)a3
{
  self->_floatingSessionCount = a3;
}

- (int64_t)newsroomTotalFrameCount
{
  return self->_newsroomTotalFrameCount;
}

- (void)setNewsroomTotalFrameCount:(int64_t)a3
{
  self->_newsroomTotalFrameCount = a3;
}

- (int64_t)floatingTotalFrameCount
{
  return self->_floatingTotalFrameCount;
}

- (void)setFloatingTotalFrameCount:(int64_t)a3
{
  self->_floatingTotalFrameCount = a3;
}

- (int64_t)newsroomAverageLatency
{
  return self->_newsroomAverageLatency;
}

- (void)setNewsroomAverageLatency:(int64_t)a3
{
  self->_newsroomAverageLatency = a3;
}

- (int64_t)floatingAverageLatency
{
  return self->_floatingAverageLatency;
}

- (void)setFloatingAverageLatency:(int64_t)a3
{
  self->_floatingAverageLatency = a3;
}

- (int64_t)newsroomToFloatingTransitionCount
{
  return self->_newsroomToFloatingTransitionCount;
}

- (void)setNewsroomToFloatingTransitionCount:(int64_t)a3
{
  self->_newsroomToFloatingTransitionCount = a3;
}

- (int64_t)floatingToNewsroomTransitionCount
{
  return self->_floatingToNewsroomTransitionCount;
}

- (void)setFloatingToNewsroomTransitionCount:(int64_t)a3
{
  self->_floatingToNewsroomTransitionCount = a3;
}

- (int64_t)newsroomTopLeftWindowCount
{
  return self->_newsroomTopLeftWindowCount;
}

- (void)setNewsroomTopLeftWindowCount:(int64_t)a3
{
  self->_newsroomTopLeftWindowCount = a3;
}

- (int64_t)newsroomTopRightWindowCount
{
  return self->_newsroomTopRightWindowCount;
}

- (void)setNewsroomTopRightWindowCount:(int64_t)a3
{
  self->_newsroomTopRightWindowCount = a3;
}

- (int64_t)newsroomBottomLeftWindowCount
{
  return self->_newsroomBottomLeftWindowCount;
}

- (void)setNewsroomBottomLeftWindowCount:(int64_t)a3
{
  self->_newsroomBottomLeftWindowCount = a3;
}

- (int64_t)newsroomBottomRightWindowCount
{
  return self->_newsroomBottomRightWindowCount;
}

- (void)setNewsroomBottomRightWindowCount:(int64_t)a3
{
  self->_newsroomBottomRightWindowCount = a3;
}

- (int64_t)newsroomFullScreenContentCount
{
  return self->_newsroomFullScreenContentCount;
}

- (void)setNewsroomFullScreenContentCount:(int64_t)a3
{
  self->_newsroomFullScreenContentCount = a3;
}

- (double)portraitEffectTotalDuration
{
  return self->_portraitEffectTotalDuration;
}

- (void)setPortraitEffectTotalDuration:(double)a3
{
  self->_portraitEffectTotalDuration = a3;
}

- (double)centerStageEffectTotalDuration
{
  return self->_centerStageEffectTotalDuration;
}

- (void)setCenterStageEffectTotalDuration:(double)a3
{
  self->_centerStageEffectTotalDuration = a3;
}

- (double)studioLightEffectTotalDuration
{
  return self->_studioLightEffectTotalDuration;
}

- (void)setStudioLightEffectTotalDuration:(double)a3
{
  self->_studioLightEffectTotalDuration = a3;
}

- (double)backgroundReplacementTotalDuration
{
  return self->_backgroundReplacementTotalDuration;
}

- (void)setBackgroundReplacementTotalDuration:(double)a3
{
  self->_backgroundReplacementTotalDuration = a3;
}

- (BOOL)gestureDetectionBasedReactionsEnabled
{
  return self->_gestureDetectionBasedReactionsEnabled;
}

- (void)setGestureDetectionBasedReactionsEnabled:(BOOL)a3
{
  self->_gestureDetectionBasedReactionsEnabled = a3;
}

- (int64_t)manualTriggeredReactionsCount
{
  return self->_manualTriggeredReactionsCount;
}

- (void)setManualTriggeredReactionsCount:(int64_t)a3
{
  self->_manualTriggeredReactionsCount = a3;
}

- (int64_t)studioLightIntensityEndValue
{
  return self->_studioLightIntensityEndValue;
}

- (void)setStudioLightIntensityEndValue:(int64_t)a3
{
  self->_studioLightIntensityEndValue = a3;
}

- (int64_t)portraitIntensityEndValue
{
  return self->_portraitIntensityEndValue;
}

- (void)setPortraitIntensityEndValue:(int64_t)a3
{
  self->_portraitIntensityEndValue = a3;
}

- (int64_t)cameraDeviceType
{
  return self->_cameraDeviceType;
}

- (void)setCameraDeviceType:(int64_t)a3
{
  self->_cameraDeviceType = a3;
}

- (int64_t)captureResolutionType
{
  return self->_captureResolutionType;
}

- (void)setCaptureResolutionType:(int64_t)a3
{
  self->_captureResolutionType = a3;
}

- (int64_t)captureDynamicRange
{
  return self->_captureDynamicRange;
}

- (void)setCaptureDynamicRange:(int64_t)a3
{
  self->_captureDynamicRange = a3;
}

- (BOOL)micEnabled
{
  return self->_micEnabled;
}

- (void)setMicEnabled:(BOOL)a3
{
  self->_micEnabled = a3;
}

- (double)averageFrameLatencyMic
{
  return self->_averageFrameLatencyMic;
}

- (void)setAverageFrameLatencyMic:(double)a3
{
  self->_averageFrameLatencyMic = a3;
}

- (int64_t)recordingOutputCount
{
  return self->_recordingOutputCount;
}

- (void)setRecordingOutputCount:(int64_t)a3
{
  self->_recordingOutputCount = a3;
}

- (int64_t)recordingOutputDuration
{
  return self->_recordingOutputDuration;
}

- (void)setRecordingOutputDuration:(int64_t)a3
{
  self->_recordingOutputDuration = a3;
}

- (int64_t)recordingOutputFileSize
{
  return self->_recordingOutputFileSize;
}

- (void)setRecordingOutputFileSize:(int64_t)a3
{
  self->_recordingOutputFileSize = a3;
}

- (int64_t)recordingOutputFileType
{
  return self->_recordingOutputFileType;
}

- (void)setRecordingOutputFileType:(int64_t)a3
{
  self->_recordingOutputFileType = a3;
}

- (int64_t)recordingOutputVideoCodecType
{
  return self->_recordingOutputVideoCodecType;
}

- (void)setRecordingOutputVideoCodecType:(int64_t)a3
{
  self->_recordingOutputVideoCodecType = a3;
}

- (int64_t)recordingTotalDuration
{
  return self->_recordingTotalDuration;
}

- (void)setRecordingTotalDuration:(int64_t)a3
{
  self->_recordingTotalDuration = a3;
}

- (int64_t)recordingTotalFileSize
{
  return self->_recordingTotalFileSize;
}

- (void)setRecordingTotalFileSize:(int64_t)a3
{
  self->_recordingTotalFileSize = a3;
}

- (BOOL)isClientScreenCapture
{
  return self->_isClientScreenCapture;
}

- (void)setIsClientScreenCapture:(BOOL)a3
{
  self->_isClientScreenCapture = a3;
}

- (BOOL)showMouseClicks
{
  return self->_showMouseClicks;
}

- (void)setShowMouseClicks:(BOOL)a3
{
  self->_showMouseClicks = a3;
}

- (int64_t)recordingEndReason
{
  return self->_recordingEndReason;
}

- (void)setRecordingEndReason:(int64_t)a3
{
  self->_recordingEndReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_thermalLevelIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_thermalResults, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);

  objc_storeStrong((id *)&self->_captureStartTime, 0);
}

@end