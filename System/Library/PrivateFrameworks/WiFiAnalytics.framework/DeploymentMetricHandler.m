@interface DeploymentMetricHandler
- (AnalyticsStoreMOHandler)storeMOHandler;
- (BOOL)appendBssAnalyticsToMetric:(id)a3 bssMo:(id)a4 maxAgeInDays:(unint64_t)a5;
- (BOOL)appendNetworkAnalyticsToMetric:(id)a3 ssid:(id)a4 deploymentUuid:(id)a5 maxAgeInDays:(unint64_t)a6;
- (BOOL)isInternalInstall;
- (BOOL)metricNeedsSubmission:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5;
- (DeploymentMetricHandler)initWithAnalyticsStore:(id)a3;
- (id)leavesSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5;
- (id)roamsSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5;
- (void)appendJoinsSummaryToMetric:(id)a3 ssid:(id)a4 maxAgeInDays:(unint64_t)a5;
- (void)networkDeploymentMetricCheckAndSubmit:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setStoreMOHandler:(id)a3;
- (void)submitBssAnalyticsMetrics:(id)a3 deploymentUuid:(id)a4 stitchIndex:(int64_t)a5;
@end

@implementation DeploymentMetricHandler

- (DeploymentMetricHandler)initWithAnalyticsStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DeploymentMetricHandler;
  v6 = [(DeploymentMetricHandler *)&v11 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_storeMOHandler, a3);
  if (!v7->_storeMOHandler)
  {
    v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[DeploymentMetricHandler initWithAnalyticsStore:]";
      __int16 v14 = 1024;
      int v15 = 101;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v7->_isInternalInstall = MGGetBoolAnswer();
  v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)metricNeedsSubmission:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v33 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 120;
      v34 = "%{public}s::%d:networkMO nil";
LABEL_33:
      _os_log_impl(&dword_21D96D000, v33, OS_LOG_TYPE_ERROR, v34, v35, 0x12u);
    }
LABEL_34:

    LOBYTE(v29) = 0;
    goto LABEL_28;
  }
  if (!v9)
  {
    v33 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 121;
      v34 = "%{public}s::%d:deploymentUuid nil";
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  objc_super v11 = (void *)MEMORY[0x223C0F2E0]();
  v12 = [MEMORY[0x263EFF910] date];
  v13 = +[NetworkMO networkManagedObjectPropertyValue:v8 forKey:@"DeploymentMetricInfo"];
  __int16 v14 = v13;
  if (v13)
  {
    int v15 = [v13 objectForKey:v10];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = [v15 objectForKey:@"DeploymentMetricLastSubmissionDate"];

      if (v17) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v35 = 136446722;
      *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 136;
      *(_WORD *)&v35[18] = 2112;
      *(void *)&v35[20] = v10;
      v19 = "%{public}s::%d:No previous metric info for deployment:%@";
      v20 = v18;
      uint32_t v21 = 28;
      goto LABEL_11;
    }
  }
  else
  {
    v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v35 = 136446466;
      *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 139;
      v19 = "%{public}s::%d:No previous deployment metric available";
      v20 = v18;
      uint32_t v21 = 18;
LABEL_11:
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_DEBUG, v19, v35, v21);
    }
  }

LABEL_13:
  v22 = objc_msgSend(v8, "ssid", *(_OWORD *)v35, *(_OWORD *)&v35[16]);
  v23 = [(DeploymentMetricHandler *)self storeMOHandler];
  v24 = [v23 managedObjectContext];
  v17 = +[JoinMO earliestJoinDate:v22 moc:v24];

  v25 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v35 = 136446722;
    *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
    *(_WORD *)&v35[12] = 1024;
    *(_DWORD *)&v35[14] = 144;
    *(_WORD *)&v35[18] = 2112;
    *(void *)&v35[20] = v17;
    _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No previous submission: Earliest join date %@", v35, 0x1Cu);
  }

  if (!v17)
  {
    v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 147;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough time elapsed.. bailing", v35, 0x12u);
    }
    LOBYTE(v29) = 0;
    goto LABEL_27;
  }
LABEL_16:
  [v12 timeIntervalSinceDate:v17];
  uint64_t v27 = (uint64_t)(v26 / 86400.0);
  if (a5) {
    BOOL v28 = v27 <= (uint64_t)a5;
  }
  else {
    BOOL v28 = 0;
  }
  BOOL v29 = !v28;
  v30 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(void *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
    *(_WORD *)&v35[12] = 1024;
    v31 = "NO";
    *(_DWORD *)&v35[14] = 154;
    *(_WORD *)&v35[18] = 2080;
    *(_DWORD *)v35 = 136447490;
    if (v29) {
      v31 = "YES";
    }
    *(void *)&v35[20] = v31;
    *(_WORD *)&v35[28] = 2112;
    *(void *)&v35[30] = v17;
    __int16 v36 = 2048;
    uint64_t v37 = v27;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Needs submisssion: %s (Previous metric from %@, diffDays:%ld interval:%ld) ", v35, 0x3Au);
  }

LABEL_27:
LABEL_28:

  return v29;
}

- (void)networkDeploymentMetricCheckAndSubmit:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v32 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      __int16 v36 = 1024;
      int v37 = 163;
      v33 = "%{public}s::%d:ssid nil";
LABEL_25:
      _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x12u);
    }
LABEL_26:

    goto LABEL_20;
  }
  if (!v9)
  {
    v32 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      __int16 v36 = 1024;
      int v37 = 164;
      v33 = "%{public}s::%d:deploymentUuid nil";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  objc_super v11 = (void *)MEMORY[0x223C0F2E0]();
  v12 = [(DeploymentMetricHandler *)self storeMOHandler];
  v13 = [v12 managedObjectContext];
  __int16 v14 = +[NetworkMO getInstance:v8 moc:v13];

  if (!v14)
  {
    int v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      __int16 v36 = 1024;
      int v37 = 169;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }
    goto LABEL_18;
  }
  if ([(DeploymentMetricHandler *)self metricNeedsSubmission:v14 deploymentUuid:v10 interval:a5])
  {
    int v15 = [MEMORY[0x263EFF9A0] dictionary];
    if (![(DeploymentMetricHandler *)self appendNetworkAnalyticsToMetric:v15 ssid:v8 deploymentUuid:v10 maxAgeInDays:14])
    {
LABEL_18:

      goto LABEL_19;
    }
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    unint64_t v17 = llround(v16);
    v18 = [NSNumber numberWithInteger:v17];
    [v15 setObject:v18 forKeyedSubscript:@"MetricStitchIndex"];

    int v15 = v15;
    char v19 = AnalyticsSendEventLazy();
    v20 = WALogCategoryDeviceStoreHandle();
    uint32_t v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136447234;
        v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
        __int16 v36 = 1024;
        int v37 = 190;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2112;
        v41 = v10;
        __int16 v42 = 2048;
        uint64_t v43 = [v15 count];
        v22 = "%{public}s::%d:Sending DeploymentMetric for ssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
        v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl(&dword_21D96D000, v23, v24, v22, buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      __int16 v36 = 1024;
      int v37 = 188;
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2112;
      v41 = v10;
      __int16 v42 = 2048;
      uint64_t v43 = [v15 count];
      v22 = "%{public}s::%d:Failed sending DeploymentMetric for ssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
      v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }

    [(DeploymentMetricHandler *)self submitBssAnalyticsMetrics:v8 deploymentUuid:v10 stitchIndex:v17];
    v25 = [MEMORY[0x263EFF910] date];
    double v26 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v27 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      __int16 v36 = 1024;
      int v37 = 198;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Metric updated date: %@", buf, 0x1Cu);
    }

    [v26 setObject:v25 forKey:@"DeploymentMetricLastSubmissionDate"];
    BOOL v28 = +[NetworkMO networkManagedObjectPropertyValue:v14 forKey:@"DeploymentMetricInfo"];
    BOOL v29 = v28;
    if (v28)
    {
      [v28 removeObjectForKey:v10];
      [v29 setObject:v26 forKey:v10];
      id v30 = v29;
    }
    else
    {
      id v30 = [MEMORY[0x263EFF9A0] dictionary];
      [v30 setObject:v26 forKey:v10];
    }
    v31 = [(DeploymentMetricHandler *)self storeMOHandler];
    [v31 setNetworkManagedObjectPropertyValueForKeyWithoutSave:v14 forKey:@"DeploymentMetricInfo" withValue:v30];

    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
}

id __89__DeploymentMetricHandler_networkDeploymentMetricCheckAndSubmit_deploymentUuid_interval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitBssAnalyticsMetrics:(id)a3 deploymentUuid:(id)a4 stitchIndex:(int64_t)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x223C0F2E0]();
  if (!v7)
  {
    __int16 v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      __int16 v69 = 1024;
      int v70 = 232;
      v57 = "%{public}s::%d:ssid nil";
LABEL_49:
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, v57, buf, 0x12u);
    }
LABEL_50:
    id v12 = 0;
LABEL_44:

    goto LABEL_40;
  }
  v10 = [(DeploymentMetricHandler *)self storeMOHandler];
  objc_super v11 = [v10 managedObjectContext];
  id v12 = +[BSSMO copyBssidsForDeployment:v7 deploymentUuid:v8 moc:v11];

  if (!v12)
  {
    __int16 v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      __int16 v69 = 1024;
      int v70 = 236;
      v57 = "%{public}s::%d:bssidArray nil";
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if (![v12 count])
  {
    __int16 v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      __int16 v69 = 1024;
      int v70 = 237;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray empty", buf, 0x12u);
    }
    goto LABEL_44;
  }
  uint64_t v60 = [v12 count];
  if (v60)
  {
    v66 = self;
    v58 = v9;
    v61 = v8;
    uint64_t v13 = 0;
    v59 = v7;
    v65 = v12;
    while (1)
    {
      __int16 v14 = [v12 objectAtIndex:v13];
      if (v14) {
        break;
      }
LABEL_38:

      if (++v13 == v60)
      {
        id v8 = v61;
        id v9 = v58;
        goto LABEL_40;
      }
    }
    int v15 = [(DeploymentMetricHandler *)v66 storeMOHandler];
    double v16 = [v15 managedObjectContext];
    unint64_t v17 = +[BSSMO getInstance:v14 ssid:v7 moc:v16];

    if (!v17)
    {
      v56 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
        __int16 v69 = 1024;
        int v70 = 246;
        __int16 v71 = 2112;
        v72 = v7;
        __int16 v73 = 2112;
        v74 = v14;
        _os_log_impl(&dword_21D96D000, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMo nil for %@[%@]", buf, 0x26u);
      }

      id v8 = v61;
      id v9 = v58;
      goto LABEL_44;
    }
    v18 = [v17 bssid];
    uint64_t v19 = [v12 indexOfObject:v18];

    v20 = +[BSSMO bssManagedObjectPropertyValue:v17 forKey:@"NeighborInfo"];
    uint32_t v21 = (void *)MEMORY[0x223C0F2E0]();
    v22 = [MEMORY[0x263EFF9A0] dictionary];
    v62 = v14;
    if (![(DeploymentMetricHandler *)v66 appendBssAnalyticsToMetric:v22 bssMo:v17 maxAgeInDays:14]|| v19 == 0x7FFFFFFFFFFFFFFFLL)
    {

LABEL_37:

      v7 = v59;
      id v12 = v65;
      __int16 v14 = v62;
      goto LABEL_38;
    }
    v23 = [NSNumber numberWithInteger:a5];
    [v22 setObject:v23 forKeyedSubscript:@"MetricStitchIndex"];

    if (v20)
    {
      uint64_t v24 = [v20 count];
      v25 = [NSNumber numberWithUnsignedInteger:v24];
      [v22 setObject:v25 forKeyedSubscript:@"NeighborsCount"];
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v63 = v19 + 1;
    double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v22 setObject:v26 forKeyedSubscript:@"BssIndex"];

    id v27 = v22;
    int v28 = AnalyticsSendEventLazy();
    BOOL v29 = WALogCategoryDeviceStoreHandle();
    id v30 = v29;
    if (v28)
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      uint64_t v31 = [v27 count];
      *(_DWORD *)buf = 136447234;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      __int16 v69 = 1024;
      int v70 = 272;
      __int16 v71 = 2112;
      v72 = v14;
      __int16 v73 = 2112;
      v74 = v61;
      __int16 v75 = 2048;
      uint64_t v76 = v31;
      v32 = v30;
      os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
      v34 = "%{public}s::%d:Send success DeploymentBssInfo for bssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
    }
    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      uint64_t v35 = [v27 count];
      *(_DWORD *)buf = 136447234;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      __int16 v69 = 1024;
      int v70 = 274;
      __int16 v71 = 2112;
      v72 = v14;
      __int16 v73 = 2112;
      v74 = v61;
      __int16 v75 = 2048;
      uint64_t v76 = v35;
      v32 = v30;
      os_log_type_t v33 = OS_LOG_TYPE_ERROR;
      v34 = "%{public}s::%d:Failed sending DeploymentBssInfo for bssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
    }
    _os_log_impl(&dword_21D96D000, v32, v33, v34, buf, 0x30u);
LABEL_20:

    if (v24)
    {
      __int16 v36 = 0;
      while (1)
      {
        int v37 = (void *)MEMORY[0x223C0F2E0]();
        __int16 v38 = [v20 objectAtIndex:v36];
        if (!v38)
        {
          v45 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v54 = [v17 bssid];
            *(_DWORD *)buf = 136446978;
            v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
            __int16 v69 = 1024;
            int v70 = 284;
            __int16 v71 = 2048;
            v72 = v36;
            __int16 v73 = 2112;
            v74 = v54;
            _os_log_impl(&dword_21D96D000, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:No neighbor data at index %lu for bssid:%@", buf, 0x26u);
          }
          goto LABEL_36;
        }
        id v39 = [MEMORY[0x263EFF9A0] dictionary];
        [v39 addEntriesFromDictionary:v38];
        __int16 v40 = [v38 valueForKey:@"NeighborBssid"];
        uint64_t v41 = [v65 indexOfObject:v40];

        if (v41 != 0x7FFFFFFFFFFFFFFFLL)
        {
          __int16 v42 = [NSNumber numberWithUnsignedInteger:v41 + 1];
          [v39 setObject:v42 forKeyedSubscript:@"NeighborBssIndex"];
        }
        if (![(DeploymentMetricHandler *)v66 isInternalInstall]) {
          [v39 removeObjectForKey:@"NeighborBssid"];
        }
        uint64_t v43 = [NSNumber numberWithInteger:a5];
        [v39 setObject:v43 forKeyedSubscript:@"MetricStitchIndex"];

        uint64_t v44 = [NSNumber numberWithUnsignedInteger:v63];
        [v39 setObject:v44 forKeyedSubscript:@"BssIndex"];

        v45 = v39;
        int v46 = AnalyticsSendEventLazy();
        v47 = WALogCategoryDeviceStoreHandle();
        v48 = v47;
        if (v46)
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v49 = [v38 valueForKey:@"NeighborBssid"];
            uint64_t v50 = [v45 count];
            *(_DWORD *)buf = 136447490;
            v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
            __int16 v69 = 1024;
            int v70 = 311;
            __int16 v71 = 2112;
            v72 = v49;
            __int16 v73 = 2112;
            v74 = v62;
            __int16 v75 = 2112;
            uint64_t v76 = (uint64_t)v61;
            __int16 v77 = 2048;
            uint64_t v78 = v50;
            v51 = v48;
            os_log_type_t v52 = OS_LOG_TYPE_DEBUG;
            v53 = "%{public}s::%d:Send success DeploymentBssNeighborInfo for neighbor: %@ of bssid: %@ (deploymentUuid: %"
                  "@) with fieldCount: %lu";
LABEL_34:
            _os_log_impl(&dword_21D96D000, v51, v52, v53, buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v49 = [v38 valueForKey:@"NeighborBssid"];
          uint64_t v55 = [v45 count];
          *(_DWORD *)buf = 136447490;
          v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
          __int16 v69 = 1024;
          int v70 = 313;
          __int16 v71 = 2112;
          v72 = v49;
          __int16 v73 = 2112;
          v74 = v62;
          __int16 v75 = 2112;
          uint64_t v76 = (uint64_t)v61;
          __int16 v77 = 2048;
          uint64_t v78 = v55;
          v51 = v48;
          os_log_type_t v52 = OS_LOG_TYPE_ERROR;
          v53 = "%{public}s::%d:Failed sending DeploymentBssNeighborInfo for neighbor: %@ of bssid: %@ (deploymentUuid: %"
                "@) with fieldCount: %lu";
          goto LABEL_34;
        }

LABEL_36:
        __int16 v36 = ((char *)v36 + 1);
        if (v24 == v36) {
          goto LABEL_37;
        }
      }
    }
    goto LABEL_37;
  }
LABEL_40:
}

id __80__DeploymentMetricHandler_submitBssAnalyticsMetrics_deploymentUuid_stitchIndex___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __80__DeploymentMetricHandler_submitBssAnalyticsMetrics_deploymentUuid_stitchIndex___block_invoke_93(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)appendNetworkAnalyticsToMetric:(id)a3 ssid:(id)a4 deploymentUuid:(id)a5 maxAgeInDays:(unint64_t)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    uint64_t v43 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      __int16 v51 = 1024;
      int v52 = 331;
      uint64_t v44 = "%{public}s::%d:ssidStr nil";
LABEL_17:
      _os_log_impl(&dword_21D96D000, v43, OS_LOG_TYPE_ERROR, v44, buf, 0x12u);
    }
LABEL_18:

    BOOL v17 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    uint64_t v43 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      __int16 v51 = 1024;
      int v52 = 332;
      uint64_t v44 = "%{public}s::%d:metricDict nil";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v13 = (void *)MEMORY[0x223C0F2E0]();
  __int16 v14 = [(DeploymentMetricHandler *)self storeMOHandler];
  int v15 = [v14 managedObjectContext];
  double v16 = +[NetworkMO getInstance:v11 moc:v15];

  BOOL v17 = v16 != 0;
  if (v16)
  {
    v47 = v13;
    id v48 = v12;
    v18 = [(DeploymentMetricHandler *)self storeMOHandler];
    uint64_t v19 = [v18 managedObjectContext];
    unint64_t v46 = +[RoamMO dwellTimeInBand:v11 bandIs24:1 bssid:0 maxAgeInDays:0 moc:v19];

    v20 = [(DeploymentMetricHandler *)self storeMOHandler];
    uint32_t v21 = [v20 managedObjectContext];
    unint64_t v22 = +[RoamMO dwellTimeInBand:v11 bandIs24:0 bssid:0 maxAgeInDays:0 moc:v21];

    v23 = [(DeploymentMetricHandler *)self storeMOHandler];
    uint64_t v24 = [v23 managedObjectContext];
    unint64_t v25 = +[BSSMO numBssInBand:v11 bandIs24:1 moc:v24];

    double v26 = [(DeploymentMetricHandler *)self storeMOHandler];
    id v27 = [v26 managedObjectContext];
    unint64_t v28 = +[BSSMO numBssInBand:v11 bandIs24:0 moc:v27];

    BOOL v29 = +[NetworkMO networkManagedObjectPropertyValue:v16 forKey:@"NetworkSummaryNetworkFlags"];
    if ([(DeploymentMetricHandler *)self isInternalInstall])
    {
      id v30 = [v16 ssid];
      [v10 setObject:v30 forKeyedSubscript:@"Ssid"];
    }
    [v10 setObject:v29 forKeyedSubscript:@"AuthFlags"];
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "numBSS"));
    [v10 setObject:v31 forKeyedSubscript:@"NumBss"];

    v32 = [NSNumber numberWithUnsignedInteger:v46];
    [v10 setObject:v32 forKeyedSubscript:@"DwellTimePct_24GHZ"];

    os_log_type_t v33 = [NSNumber numberWithUnsignedInteger:v22];
    [v10 setObject:v33 forKeyedSubscript:@"DwellTimePct_5GHZ"];

    v34 = [NSNumber numberWithUnsignedInteger:v25];
    [v10 setObject:v34 forKeyedSubscript:@"NumBss_24GHZ"];

    uint64_t v35 = [NSNumber numberWithUnsignedInteger:v28];
    [v10 setObject:v35 forKeyedSubscript:@"NumBss_5GHZ"];

    __int16 v36 = (void *)MEMORY[0x223C0F2E0]([(DeploymentMetricHandler *)self appendJoinsSummaryToMetric:v10 ssid:v11 maxAgeInDays:a6]);
    uint64_t v37 = [(DeploymentMetricHandler *)self roamsSummary:v11 bssid:0 maxAgeInDays:a6];
    if (v37)
    {
      __int16 v38 = (void *)v37;
      [v10 addEntriesFromDictionary:v37];
    }
    id v39 = (void *)MEMORY[0x223C0F2E0]();
    uint64_t v40 = [(DeploymentMetricHandler *)self leavesSummary:v11 bssid:0 maxAgeInDays:a6];
    id v12 = v48;
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      [v10 addEntriesFromDictionary:v40];
    }

    uint64_t v13 = v47;
    BOOL v17 = 1;
  }
  else
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      __int16 v51 = 1024;
      int v52 = 340;
      __int16 v53 = 2112;
      id v54 = v11;
      _os_log_impl(&dword_21D96D000, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMo nil for ssid %@", buf, 0x1Cu);
    }
  }
LABEL_12:

  return v17;
}

- (id)roamsSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    int v70 = self;
    context = (void *)MEMORY[0x223C0F2E0]();
    uint64_t v10 = +[RoamMO entityName];
    id v11 = (void *)MEMORY[0x263F08730];
    uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.network.ssid == %@", v8];
    uint64_t v13 = (void *)v12;
    id v73 = v8;
    __int16 v71 = (void *)v10;
    if (v9)
    {
      v89[0] = v12;
      __int16 v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v9];
      v89[1] = v14;
      int v15 = +[AnalyticsStoreProxy predicateForEntityWithAge:v10 maxAge:a5];
      double v16 = (void *)[v15 copy];
      v89[2] = v16;
      BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:3];
      uint64_t v18 = [v11 andPredicateWithSubpredicates:v17];
    }
    else
    {
      v88[0] = v12;
      __int16 v14 = +[AnalyticsStoreProxy predicateForEntityWithAge:v10 maxAge:a5];
      int v15 = (void *)[v14 copy];
      v88[1] = v15;
      double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
      uint64_t v18 = [v11 andPredicateWithSubpredicates:v16];
    }

    uint64_t v19 = (void *)MEMORY[0x263F08730];
    v87[0] = v18;
    v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"status == 0"];
    v87[1] = v20;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    v22 = uint32_t v21 = (void *)v18;
    v74 = [v19 andPredicateWithSubpredicates:v22];

    v23 = (void *)MEMORY[0x263F08730];
    v86[0] = v21;
    uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"status != 0"];
    v86[1] = v24;
    unint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    uint64_t v79 = [v23 andPredicateWithSubpredicates:v25];

    double v26 = (void *)MEMORY[0x263F08730];
    v85[0] = v21;
    id v27 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"status == %d", 3766617089);
    v85[1] = v27;
    unint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:2];
    uint64_t v78 = [v26 andPredicateWithSubpredicates:v28];

    BOOL v29 = (void *)MEMORY[0x263F08730];
    v84[0] = v21;
    id v30 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"status == %d", 3766617092);
    v84[1] = v30;
    uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
    __int16 v77 = [v29 andPredicateWithSubpredicates:v31];

    v32 = (void *)MEMORY[0x263F08730];
    v83[0] = v21;
    os_log_type_t v33 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"status == %d", 3766617091);
    v83[1] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
    uint64_t v76 = [v32 andPredicateWithSubpredicates:v34];

    uint64_t v35 = (void *)MEMORY[0x263F08730];
    v82[0] = v21;
    __int16 v36 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"status == %d", 3766617163);
    v82[1] = v36;
    uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
    __int16 v75 = [v35 andPredicateWithSubpredicates:v37];

    __int16 v38 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    id v39 = [v38 managedObjectContext];
    unint64_t v69 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v21 moc:v39];

    uint64_t v40 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    uint64_t v41 = [v40 managedObjectContext];
    unint64_t v68 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v74 moc:v41];

    __int16 v42 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    uint64_t v43 = [v42 managedObjectContext];
    unint64_t v44 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v79 moc:v43];

    v45 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    unint64_t v46 = [v45 managedObjectContext];
    unint64_t v47 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v78 moc:v46];

    id v48 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    v49 = [v48 managedObjectContext];
    unint64_t v50 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v77 moc:v49];

    __int16 v51 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    int v52 = [v51 managedObjectContext];
    unint64_t v53 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v76 moc:v52];

    id v54 = [(DeploymentMetricHandler *)v70 storeMOHandler];
    uint64_t v55 = [v54 managedObjectContext];
    unint64_t v56 = +[AnalyticsStoreProxy entityCount:v71 withPredicate:v75 moc:v55];

    v80[0] = @"RoamsAttempted";
    v57 = [NSNumber numberWithUnsignedInteger:v69];
    v81[0] = v57;
    v80[1] = @"RoamsSuccess";
    v58 = [NSNumber numberWithUnsignedInteger:v68];
    v81[1] = v58;
    v80[2] = @"RoamsFailed";
    v59 = [NSNumber numberWithUnsignedInteger:v44];
    v81[2] = v59;
    v80[3] = @"RoamsFailReasonFailed";
    uint64_t v60 = [NSNumber numberWithUnsignedInteger:v47];
    v81[3] = v60;
    v80[4] = @"RoamsFailReasonAbort";
    v61 = [NSNumber numberWithUnsignedInteger:v50];
    v81[4] = v61;
    v80[5] = @"RoamsFailReasonNoCand";
    v62 = [NSNumber numberWithUnsignedInteger:v53];
    v81[5] = v62;
    v80[6] = @"RoamsFailReasonNoCandByScore";
    uint64_t v63 = [NSNumber numberWithUnsignedInteger:v56];
    v81[6] = v63;
    v64 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:7];

    v65 = (void *)[v64 copy];
    id v8 = v73;
  }
  else
  {
    v67 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v91 = "-[DeploymentMetricHandler roamsSummary:bssid:maxAgeInDays:]";
      __int16 v92 = 1024;
      int v93 = 385;
      _os_log_impl(&dword_21D96D000, v67, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v65 = 0;
  }

  return v65;
}

- (id)leavesSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    context = (void *)MEMORY[0x223C0F2E0]();
    uint64_t v10 = +[LeaveMO entityName];
    id v11 = (void *)MEMORY[0x263F08730];
    id v94 = v8;
    uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v8];
    uint64_t v13 = (void *)v12;
    id v93 = v9;
    v91 = (void *)v10;
    if (v9)
    {
      v110[0] = v12;
      __int16 v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.bssid == %@", v9];
      v110[1] = v14;
      int v15 = +[AnalyticsStoreProxy predicateForEntityWithAge:v10 maxAge:a5];
      double v16 = (void *)[v15 copy];
      v110[2] = v16;
      BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:3];
      uint64_t v18 = [v11 andPredicateWithSubpredicates:v17];
    }
    else
    {
      v109[0] = v12;
      __int16 v14 = +[AnalyticsStoreProxy predicateForEntityWithAge:v10 maxAge:a5];
      int v15 = (void *)[v14 copy];
      v109[1] = v15;
      double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:2];
      uint64_t v18 = [v11 andPredicateWithSubpredicates:v16];
    }

    uint64_t v19 = (void *)MEMORY[0x263F08730];
    v108[0] = v18;
    v20 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 0);
    v108[1] = v20;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:2];
    v22 = uint32_t v21 = (void *)v18;
    v98 = [v19 andPredicateWithSubpredicates:v22];

    v23 = (void *)MEMORY[0x263F08730];
    v107[0] = v21;
    uint64_t v24 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1);
    v107[1] = v24;
    unint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:2];
    v99 = [v23 andPredicateWithSubpredicates:v25];

    double v26 = (void *)MEMORY[0x263F08730];
    v106[0] = v21;
    id v27 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 2);
    v106[1] = v27;
    unint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
    v96 = [v26 andPredicateWithSubpredicates:v28];

    BOOL v29 = (void *)MEMORY[0x263F08730];
    v105[0] = v21;
    id v30 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 4);
    v105[1] = v30;
    uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
    v97 = [v29 andPredicateWithSubpredicates:v31];

    v32 = (void *)MEMORY[0x263F08730];
    v104[0] = v21;
    os_log_type_t v33 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1000);
    v104[1] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:2];
    v90 = [v32 andPredicateWithSubpredicates:v34];

    uint64_t v35 = (void *)MEMORY[0x263F08730];
    v103[0] = v21;
    __int16 v36 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1006);
    v103[1] = v36;
    uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
    v95 = [v35 andPredicateWithSubpredicates:v37];

    __int16 v38 = (void *)MEMORY[0x263F08730];
    v102[0] = v21;
    id v39 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1011);
    v102[1] = v39;
    uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:2];
    v89 = [v38 andPredicateWithSubpredicates:v40];

    uint64_t v41 = (void *)MEMORY[0x263F08730];
    v101[0] = v21;
    __int16 v42 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1013);
    v101[1] = v42;
    uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:2];
    v88 = [v41 andPredicateWithSubpredicates:v43];

    unint64_t v44 = (void *)MEMORY[0x263F08730];
    v100[0] = v21;
    v45 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1007);
    v100[1] = v45;
    unint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:2];
    v87 = [v44 andPredicateWithSubpredicates:v46];

    unint64_t v47 = [(DeploymentMetricHandler *)self storeMOHandler];
    id v48 = [v47 managedObjectContext];
    unint64_t v86 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v98 moc:v48];

    v49 = [(DeploymentMetricHandler *)self storeMOHandler];
    unint64_t v50 = [v49 managedObjectContext];
    unint64_t v85 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v99 moc:v50];

    __int16 v51 = [(DeploymentMetricHandler *)self storeMOHandler];
    int v52 = [v51 managedObjectContext];
    unint64_t v84 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v96 moc:v52];

    unint64_t v53 = [(DeploymentMetricHandler *)self storeMOHandler];
    id v54 = [v53 managedObjectContext];
    unint64_t v83 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v97 moc:v54];

    uint64_t v55 = [(DeploymentMetricHandler *)self storeMOHandler];
    unint64_t v56 = [v55 managedObjectContext];
    unint64_t v57 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v90 moc:v56];

    v58 = [(DeploymentMetricHandler *)self storeMOHandler];
    v59 = [v58 managedObjectContext];
    unint64_t v82 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v95 moc:v59];

    uint64_t v60 = [(DeploymentMetricHandler *)self storeMOHandler];
    v61 = [v60 managedObjectContext];
    unint64_t v81 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v89 moc:v61];

    v62 = [(DeploymentMetricHandler *)self storeMOHandler];
    uint64_t v63 = [v62 managedObjectContext];
    unint64_t v64 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v88 moc:v63];

    v65 = [(DeploymentMetricHandler *)self storeMOHandler];
    v66 = [v65 managedObjectContext];
    unint64_t v67 = +[AnalyticsStoreProxy entityCount:v91 withPredicate:v87 moc:v66];

    unint64_t v68 = [MEMORY[0x263EFF9A0] dictionary];
    unint64_t v69 = [NSNumber numberWithUnsignedInteger:v86];
    [v68 setObject:v69 forKeyedSubscript:@"LinkDownReasonUnknown"];

    int v70 = [NSNumber numberWithUnsignedInteger:v85];
    [v68 setObject:v70 forKeyedSubscript:@"LinkDownReasonDeauth"];

    __int16 v71 = [NSNumber numberWithUnsignedInteger:v84];
    [v68 setObject:v71 forKeyedSubscript:@"LinkDownReasonBeaconLoss"];

    v72 = [NSNumber numberWithUnsignedInteger:v83];
    [v68 setObject:v72 forKeyedSubscript:@"LinkDownReasonSystemSleep"];

    id v73 = [NSNumber numberWithUnsignedInteger:v57];
    [v68 setObject:v73 forKeyedSubscript:@"LinkDownReasonTrigDisc"];

    v74 = [NSNumber numberWithUnsignedInteger:v82];
    [v68 setObject:v74 forKeyedSubscript:@"LinkDownReasonThermal"];

    __int16 v75 = [NSNumber numberWithUnsignedInteger:v81];
    [v68 setObject:v75 forKeyedSubscript:@"LinkDownReasonControlCenter"];

    uint64_t v76 = [NSNumber numberWithUnsignedInteger:v64];
    [v68 setObject:v76 forKeyedSubscript:@"LinkDownReasonNetworkTrans"];

    __int16 v77 = [NSNumber numberWithUnsignedInteger:v67];
    [v68 setObject:v77 forKeyedSubscript:@"LinkDownReasonInternetSharing"];

    uint64_t v78 = (void *)[v68 copy];
    id v9 = v93;
    id v8 = v94;
  }
  else
  {
    v80 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v112 = "-[DeploymentMetricHandler leavesSummary:bssid:maxAgeInDays:]";
      __int16 v113 = 1024;
      int v114 = 435;
      _os_log_impl(&dword_21D96D000, v80, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    uint64_t v78 = 0;
  }

  return v78;
}

- (void)appendJoinsSummaryToMetric:(id)a3 ssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v59 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v85 = "-[DeploymentMetricHandler appendJoinsSummaryToMetric:ssid:maxAgeInDays:]";
      __int16 v86 = 1024;
      int v87 = 505;
      uint64_t v60 = "%{public}s::%d:ssid nil";
LABEL_9:
      _os_log_impl(&dword_21D96D000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0x12u);
    }
LABEL_10:

    goto LABEL_4;
  }
  if (!v8)
  {
    v59 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v85 = "-[DeploymentMetricHandler appendJoinsSummaryToMetric:ssid:maxAgeInDays:]";
      __int16 v86 = 1024;
      int v87 = 506;
      uint64_t v60 = "%{public}s::%d:dict nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  context = (void *)MEMORY[0x223C0F2E0]();
  v66 = +[JoinMO entityName];
  uint64_t v10 = (void *)MEMORY[0x263F08730];
  unint64_t v68 = v8;
  [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v9];
  id v11 = v72 = v9;
  v83[0] = v11;
  uint64_t v12 = +[AnalyticsStoreProxy predicateForEntityWithAge:v66 maxAge:a5];
  uint64_t v13 = (void *)[v12 copy];
  v83[1] = v13;
  __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
  [v10 andPredicateWithSubpredicates:v14];
  int v15 = v65 = self;

  uint64_t v16 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 1);
  __int16 v75 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"reason == %d", 0);
  BOOL v17 = (void *)MEMORY[0x263F08A98];
  uint64_t v18 = [NSNumber numberWithBool:0];
  uint64_t v19 = [v17 predicateWithFormat:@"success == %@", v18];

  v20 = (void *)MEMORY[0x263F08A98];
  uint32_t v21 = [NSNumber numberWithBool:1];
  unint64_t v22 = [v20 predicateWithFormat:@"success == %@", v21];

  v23 = (void *)MEMORY[0x263F08730];
  v82[0] = v15;
  v82[1] = v16;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
  unint64_t v67 = [v23 andPredicateWithSubpredicates:v24];

  unint64_t v25 = (void *)MEMORY[0x263F08730];
  v81[0] = v15;
  v81[1] = v19;
  unint64_t v69 = (void *)v19;
  int v70 = (void *)v16;
  v81[2] = v16;
  double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:3];
  id v73 = [v25 andPredicateWithSubpredicates:v26];

  id v27 = (void *)MEMORY[0x263F08730];
  v80[0] = v15;
  v80[1] = v22;
  v80[2] = v16;
  unint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];
  uint64_t v76 = [v27 andPredicateWithSubpredicates:v28];

  BOOL v29 = (void *)MEMORY[0x263F08730];
  v79[0] = v15;
  v79[1] = v75;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  v74 = [v29 andPredicateWithSubpredicates:v30];

  uint64_t v31 = (void *)MEMORY[0x263F08730];
  v78[0] = v15;
  v78[1] = v19;
  v78[2] = v75;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
  unint64_t v64 = [v31 andPredicateWithSubpredicates:v32];

  os_log_type_t v33 = (void *)MEMORY[0x263F08730];
  v77[0] = v15;
  v77[1] = v22;
  v77[2] = v75;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
  uint64_t v35 = [v33 andPredicateWithSubpredicates:v34];

  __int16 v36 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  uint64_t v37 = [v36 managedObjectContext];
  unint64_t v63 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v67 moc:v37];

  __int16 v38 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  id v39 = [v38 managedObjectContext];
  unint64_t v62 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v73 moc:v39];

  uint64_t v40 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  uint64_t v41 = [v40 managedObjectContext];
  unint64_t v61 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v76 moc:v41];

  __int16 v42 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  uint64_t v43 = [v42 managedObjectContext];
  unint64_t v44 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v74 moc:v43];

  v45 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  unint64_t v46 = [v45 managedObjectContext];
  unint64_t v47 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v64 moc:v46];

  id v48 = [(DeploymentMetricHandler *)v65 storeMOHandler];
  v49 = [v48 managedObjectContext];
  unint64_t v50 = (void *)v35;
  unint64_t v51 = +[AnalyticsStoreProxy entityCount:v66 withPredicate:v35 moc:v49];

  int v52 = [NSNumber numberWithUnsignedInteger:v63];
  id v8 = v68;
  [v68 setObject:v52 forKeyedSubscript:@"ManualJoinsAttempted"];

  unint64_t v53 = [NSNumber numberWithUnsignedInteger:v62];
  [v68 setObject:v53 forKeyedSubscript:@"ManualJoinsFailed"];

  id v54 = [NSNumber numberWithUnsignedInteger:v61];
  [v68 setObject:v54 forKeyedSubscript:@"ManualJoinsSuccess"];

  unint64_t v55 = v44;
  id v9 = v72;
  unint64_t v56 = [NSNumber numberWithUnsignedInteger:v55];
  [v68 setObject:v56 forKeyedSubscript:@"AutoJoinsAttempted"];

  unint64_t v57 = [NSNumber numberWithUnsignedInteger:v47];
  [v68 setObject:v57 forKeyedSubscript:@"AutoJoinsFailed"];

  v58 = [NSNumber numberWithUnsignedInteger:v51];
  [v68 setObject:v58 forKeyedSubscript:@"AutoJoinsSuccess"];

LABEL_4:
}

- (BOOL)appendBssAnalyticsToMetric:(id)a3 bssMo:(id)a4 maxAgeInDays:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v30 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v37 = "-[DeploymentMetricHandler appendBssAnalyticsToMetric:bssMo:maxAgeInDays:]";
      __int16 v38 = 1024;
      int v39 = 565;
      uint64_t v31 = "%{public}s::%d:metricDict nil";
LABEL_11:
      _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x12u);
    }
LABEL_12:

    BOOL v28 = 0;
    goto LABEL_6;
  }
  if (!v9)
  {
    id v30 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v37 = "-[DeploymentMetricHandler appendBssAnalyticsToMetric:bssMo:maxAgeInDays:]";
      __int16 v38 = 1024;
      int v39 = 566;
      uint64_t v31 = "%{public}s::%d:bssMo nil";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  context = (void *)MEMORY[0x223C0F2E0]();
  id v11 = [v10 network];
  uint64_t v12 = [v11 ssid];

  uint64_t v13 = [v10 bssid];
  v34 = [(DeploymentMetricHandler *)self leavesSummary:v12 bssid:v13 maxAgeInDays:a5];

  __int16 v14 = [v10 bssid];
  os_log_type_t v33 = [(DeploymentMetricHandler *)self roamsSummary:v12 bssid:v14 maxAgeInDays:a5];

  int v15 = [v10 channel];
  BOOL v16 = v15 < 15;
  BOOL v32 = v15 > 14;
  BOOL v17 = [v10 bssid];
  uint64_t v18 = [(DeploymentMetricHandler *)self storeMOHandler];
  uint64_t v19 = [v18 managedObjectContext];
  unint64_t v20 = +[RoamMO dwellTimeInBand:v12 bandIs24:v16 bssid:v17 maxAgeInDays:a5 moc:v19];

  uint32_t v21 = [v10 parsedBeacon];
  if ([(DeploymentMetricHandler *)self isInternalInstall])
  {
    unint64_t v22 = [v10 bssid];
    [v8 setObject:v22 forKeyedSubscript:@"Bssid"];
  }
  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isEdgeForJoin"));
  [v8 setObject:v23 forKeyedSubscript:@"IsEdgeForJoin"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isEdgeForLeave"));
  [v8 setObject:v24 forKeyedSubscript:@"IsEdgeForLeave"];

  unint64_t v25 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v10, "roamTriggerRssi"));
  [v8 setObject:v25 forKeyedSubscript:@"RoamTriggerRssi"];

  double v26 = [NSNumber numberWithUnsignedInteger:v20];
  [v8 setObject:v26 forKeyedSubscript:@"DwellTime"];

  id v27 = [NSNumber numberWithUnsignedInteger:v32];
  [v8 setObject:v27 forKeyedSubscript:@"Band"];

  [v8 addEntriesFromDictionary:v34];
  [v8 addEntriesFromDictionary:v33];
  [v8 addEntriesFromDictionary:v21];

  BOOL v28 = 1;
LABEL_6:

  return v28;
}

- (AnalyticsStoreMOHandler)storeMOHandler
{
  return self->_storeMOHandler;
}

- (void)setStoreMOHandler:(id)a3
{
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (void).cxx_destruct
{
}

@end