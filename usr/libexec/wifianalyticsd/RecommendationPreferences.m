@interface RecommendationPreferences
+ (id)sharedObject;
- (BOOL)disable_dps_wd;
- (BOOL)disable_fast_dps_validation_for_test;
- (BOOL)disable_fast_dps_wd;
- (BOOL)disable_recommendation_engine;
- (BOOL)disable_slow_wifi_dps_is_priority_network;
- (BOOL)disable_slow_wifi_wd;
- (BOOL)force_dps_recommend_always;
- (BOOL)work_report_logs_enabled;
- (RecommendationPreferences)init;
- (int64_t)reset_pd_rssi_threshold;
- (unint64_t)dns_symptoms_duration_between_samples_after_trap;
- (unint64_t)dns_symptoms_duration_between_samples_before_trap;
- (unint64_t)dns_symptoms_interrogation_sample_count;
- (unint64_t)dns_symptoms_trap_evaluated_at_sample;
- (unint64_t)dps_capture_evaluated_at_sample;
- (unint64_t)dps_duration_between_samples;
- (unint64_t)dps_interrogation_sample_count;
- (unint64_t)dps_report_sent_after;
- (unint64_t)dps_stall_dur_for_wd;
- (unint64_t)dps_symptoms_average_cca_threshold;
- (unint64_t)dps_trap_evaluated_at_sample;
- (unint64_t)dps_wd_cca;
- (unint64_t)ior_persist_delay_seconds;
- (unint64_t)ior_rescan_budget_exploratory_seconds;
- (unint64_t)ior_rescan_budget_less_than_previous_max_channels_seconds;
- (unint64_t)ior_rescan_new_phy_delay_seconds;
- (unint64_t)minutes_between_dps_wd;
- (unint64_t)minutes_between_fast_dps_wd_screen_off;
- (unint64_t)minutes_between_fast_dps_wd_screen_on;
- (unint64_t)minutes_between_peer_diagnostics_trigger_for_dns_stall;
- (unint64_t)minutes_between_peer_diagnostics_trigger_for_other_issues;
- (unint64_t)minutes_between_slow_wifi_wd;
- (unint64_t)minutes_between_symptoms_dps_wd_screen_off;
- (unint64_t)minutes_between_symptoms_dps_wd_screen_on;
- (unint64_t)prediction_probability_threshold;
- (unint64_t)prediction_probability_threshold_macos;
- (unint64_t)reset_awdl_activity_threshold;
- (unint64_t)reset_cca_bin_threshold;
- (unint64_t)reset_legacy_chipset_cca_bin_threshold;
- (unint64_t)reset_pd_cca_threshold;
- (unint64_t)reset_rssi_bin_threshold;
- (unint64_t)reset_score_threshold;
- (unint64_t)slow_wifi_duration_between_samples;
- (unint64_t)slow_wifi_interrogation_sample_count;
- (unint64_t)slow_wifi_report_sent_after;
- (unint64_t)work_report_seconds;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisable_dps_wd:(BOOL)a3;
- (void)setDisable_fast_dps_validation_for_test:(BOOL)a3;
- (void)setDisable_fast_dps_wd:(BOOL)a3;
- (void)setDisable_recommendation_engine:(BOOL)a3;
- (void)setDisable_slow_wifi_dps_is_priority_network:(BOOL)a3;
- (void)setDisable_slow_wifi_wd:(BOOL)a3;
- (void)setDns_symptoms_duration_between_samples_after_trap:(unint64_t)a3;
- (void)setDns_symptoms_duration_between_samples_before_trap:(unint64_t)a3;
- (void)setDns_symptoms_interrogation_sample_count:(unint64_t)a3;
- (void)setDns_symptoms_trap_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_capture_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_duration_between_samples:(unint64_t)a3;
- (void)setDps_interrogation_sample_count:(unint64_t)a3;
- (void)setDps_report_sent_after:(unint64_t)a3;
- (void)setDps_stall_dur_for_wd:(unint64_t)a3;
- (void)setDps_symptoms_average_cca_threshold:(unint64_t)a3;
- (void)setDps_trap_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_wd_cca:(unint64_t)a3;
- (void)setForce_dps_recommend_always:(BOOL)a3;
- (void)setIor_persist_delay_seconds:(unint64_t)a3;
- (void)setIor_rescan_budget_exploratory_seconds:(unint64_t)a3;
- (void)setIor_rescan_budget_less_than_previous_max_channels_seconds:(unint64_t)a3;
- (void)setIor_rescan_new_phy_delay_seconds:(unint64_t)a3;
- (void)setMinutes_between_dps_wd:(unint64_t)a3;
- (void)setMinutes_between_fast_dps_wd_screen_off:(unint64_t)a3;
- (void)setMinutes_between_fast_dps_wd_screen_on:(unint64_t)a3;
- (void)setMinutes_between_peer_diagnostics_trigger_for_dns_stall:(unint64_t)a3;
- (void)setMinutes_between_peer_diagnostics_trigger_for_other_issues:(unint64_t)a3;
- (void)setMinutes_between_slow_wifi_wd:(unint64_t)a3;
- (void)setMinutes_between_symptoms_dps_wd_screen_off:(unint64_t)a3;
- (void)setMinutes_between_symptoms_dps_wd_screen_on:(unint64_t)a3;
- (void)setPrediction_probability_threshold:(unint64_t)a3;
- (void)setPrediction_probability_threshold_macos:(unint64_t)a3;
- (void)setReset_awdl_activity_threshold:(unint64_t)a3;
- (void)setReset_cca_bin_threshold:(unint64_t)a3;
- (void)setReset_legacy_chipset_cca_bin_threshold:(unint64_t)a3;
- (void)setReset_pd_cca_threshold:(unint64_t)a3;
- (void)setReset_pd_rssi_threshold:(int64_t)a3;
- (void)setReset_rssi_bin_threshold:(unint64_t)a3;
- (void)setReset_score_threshold:(unint64_t)a3;
- (void)setSlow_wifi_duration_between_samples:(unint64_t)a3;
- (void)setSlow_wifi_interrogation_sample_count:(unint64_t)a3;
- (void)setSlow_wifi_report_sent_after:(unint64_t)a3;
- (void)setWork_report_logs_enabled:(BOOL)a3;
- (void)setWork_report_seconds:(unint64_t)a3;
@end

@implementation RecommendationPreferences

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E8A0;
  block[3] = &unk_1000D0CF8;
  block[4] = a1;
  if (qword_1000F1058 != -1) {
    dispatch_once(&qword_1000F1058, block);
  }
  v2 = (void *)qword_1000F1050;

  return v2;
}

- (RecommendationPreferences)init
{
  v9.receiver = self;
  v9.super_class = (Class)RecommendationPreferences;
  v2 = [(RecommendationPreferences *)&v9 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 persistentDomainForName:@"com.apple.wifianalyticsd"];
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RecommendationPreferences init]";
      __int16 v12 = 1024;
      int v13 = 167;
      __int16 v14 = 2112;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RecommendationPreferences defaults %@", buf, 0x1Cu);
    }

    v6 = +[NSMutableDictionary dictionary];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_recommendation_engine"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_dps_wd"];
    [v6 setObject:&off_1000E40A8 forKey:@"minutes_between_dps_wd"];
    [v6 setObject:&off_1000E40C0 forKey:@"dps_wd_cca"];
    [v6 setObject:&off_1000E40D8 forKey:@"dps_stall_dur_for_wd"];
    [v6 setObject:&off_1000E40F0 forKey:@"dps_capture_evaluated_at_sample"];
    [v6 setObject:&off_1000E4108 forKey:@"dps_trap_evaluated_at_sample"];
    [v6 setObject:&off_1000E4108 forKey:@"dps_interrogation_sample_count"];
    [v6 setObject:&off_1000E4120 forKey:@"dps_duration_between_samples"];
    [v6 setObject:&off_1000E4138 forKey:@"dps_report_sent_after"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"force_dps_recommend_always"];
    [v6 setObject:&off_1000E4108 forKey:@"dns_symptoms_trap_evaluated_at_sample"];
    [v6 setObject:&off_1000E4150 forKey:@"dns_symptoms_interrogation_sample_count"];
    [v6 setObject:&off_1000E4120 forKey:@"dns_symptoms_duration_between_samples_before_trap"];
    [v6 setObject:&off_1000E4168 forKey:@"dns_symptoms_duration_between_samples_after_trap"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_fast_dps_wd"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_fast_dps_validation_for_test"];
    [v6 setObject:&off_1000E4180 forKey:@"minutes_between_fast_dps_wd_screen_on"];
    [v6 setObject:&off_1000E4180 forKey:@"minutes_between_fast_dps_wd_screen_off"];
    [v6 setObject:&off_1000E4198 forKey:@"prediction_probability_threshold"];
    [v6 setObject:&off_1000E40C0 forKey:@"prediction_probability_threshold_macos"];
    [v6 setObject:&off_1000E41B0 forKey:@"reset_cca_bin_threshold"];
    [v6 setObject:&off_1000E41C8 forKey:@"minutes_between_symptoms_dps_wd_screen_on"];
    [v6 setObject:&off_1000E41C8 forKey:@"minutes_between_symptoms_dps_wd_screen_off"];
    [v6 setObject:&off_1000E41E0 forKey:@"minutes_between_peer_diagnostics_trigger_for_dns_stall"];
    [v6 setObject:&off_1000E41E0 forKey:@"minutes_between_peer_diagnostics_trigger_for_other_issues"];
    [v6 setObject:&off_1000E41F8 forKey:@"reset_score_threshold"];
    [v6 setObject:&off_1000E4210 forKey:@"dps_symptoms_average_cca_threshold"];
    [v6 setObject:&off_1000E4228 forKey:@"reset_pd_rssi_threshold"];
    [v6 setObject:&off_1000E40C0 forKey:@"reset_pd_cca_threshold"];
    [v6 setObject:&off_1000E4240 forKey:@"reset_legacy_chipset_cca_bin_threshold"];
    [v6 setObject:&off_1000E4258 forKey:@"reset_rssi_bin_threshold"];
    [v6 setObject:&off_1000E4270 forKey:@"reset_awdl_activity_threshold"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_slow_wifi_wd"];
    [v6 setObject:&off_1000E41E0 forKey:@"minutes_between_slow_wifi_wd"];
    [v6 setObject:&off_1000E4288 forKey:@"slow_wifi_interrogation_sample_count"];
    [v6 setObject:&off_1000E42A0 forKey:@"slow_wifi_duration_between_samples"];
    [v6 setObject:&off_1000E42B8 forKey:@"slow_wifi_report_sent_after"];
    [v6 setObject:&__kCFBooleanFalse forKey:@"disable_slow_wifi_dps_is_priority_network"];
    [v6 setObject:&off_1000E42D0 forKey:@"ior_rescan_budget_less_than_previous_max_channels_seconds"];
    [v6 setObject:&off_1000E42E8 forKey:@"ior_rescan_budget_exploratory_seconds"];
    [v6 setObject:&off_1000E41E0 forKey:@"ior_rescan_new_phy_delay_seconds"];
    [v6 setObject:&off_1000E4300 forKey:@"ior_persist_delay_seconds"];
    [v6 setObject:&off_1000E42E8 forKey:@"work_report_seconds"];
    [v6 setObject:&__kCFBooleanTrue forKey:@"work_report_logs_enabled"];
    [v3 setPersistentDomain:v4 forName:@"com.apple.wifianalyticsd"];
    [v3 registerDefaults:v6];
    [v3 addObserver:v2 forKeyPath:@"disable_recommendation_engine" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_wd_cca" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_stall_dur_for_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_capture_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_trap_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_duration_between_samples" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_report_sent_after" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"force_dps_recommend_always" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_trap_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_duration_between_samples_before_trap" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_duration_between_samples_after_trap" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_fast_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_fast_dps_validation_for_test" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_fast_dps_wd_screen_on" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_fast_dps_wd_screen_off" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"prediction_probability_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"prediction_probability_threshold_macos" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_cca_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_score_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_symptoms_average_cca_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_pd_rssi_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_pd_cca_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_symptoms_dps_wd_screen_on" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_symptoms_dps_wd_screen_off" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_dns_stall" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_other_issues" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_legacy_chipset_cca_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_rssi_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_awdl_activity_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_slow_wifi_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_slow_wifi_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_duration_between_samples" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_report_sent_after" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_slow_wifi_dps_is_priority_network" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_budget_less_than_previous_max_channels_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_budget_exploratory_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_new_phy_delay_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_persist_delay_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"work_report_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"work_report_logs_enabled" options:5 context:0];
    v7 = v2;
  }
  else
  {
    v3 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[RecommendationPreferences init]";
      __int16 v12 = 1024;
      int v13 = 163;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"disable_recommendation_engine"];
  [v3 removeObserver:self forKeyPath:@"disable_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"dps_wd_cca"];
  [v3 removeObserver:self forKeyPath:@"dps_stall_dur_for_wd"];
  [v3 removeObserver:self forKeyPath:@"dps_capture_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dps_trap_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dps_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"dps_duration_between_samples"];
  [v3 removeObserver:self forKeyPath:@"dps_report_sent_after"];
  [v3 removeObserver:self forKeyPath:@"force_dps_recommend_always"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_trap_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_duration_between_samples_before_trap"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_duration_between_samples_after_trap"];
  [v3 removeObserver:self forKeyPath:@"disable_fast_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"disable_fast_dps_validation_for_test"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_fast_dps_wd_screen_on"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_fast_dps_wd_screen_off"];
  [v3 removeObserver:self forKeyPath:@"prediction_probability_threshold"];
  [v3 removeObserver:self forKeyPath:@"prediction_probability_threshold_macos"];
  [v3 removeObserver:self forKeyPath:@"reset_cca_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_symptoms_dps_wd_screen_on"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_symptoms_dps_wd_screen_off"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_dns_stall"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_other_issues"];
  [v3 removeObserver:self forKeyPath:@"reset_score_threshold"];
  [v3 removeObserver:self forKeyPath:@"dps_symptoms_average_cca_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_pd_rssi_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_pd_cca_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_legacy_chipset_cca_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_rssi_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_awdl_activity_threshold"];
  [v3 removeObserver:self forKeyPath:@"disable_slow_wifi_wd"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_slow_wifi_wd"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_duration_between_samples"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_report_sent_after"];
  [v3 removeObserver:self forKeyPath:@"disable_slow_wifi_dps_is_priority_network"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_budget_less_than_previous_max_channels_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_budget_exploratory_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_new_phy_delay_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_persist_delay_seconds"];
  [v3 removeObserver:self forKeyPath:@"work_report_seconds"];
  [v3 removeObserver:self forKeyPath:@"work_report_logs_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)RecommendationPreferences;
  [(RecommendationPreferences *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v14 = v13;
  }
  else {
    __int16 v14 = 0;
  }
  id v15 = v14;
  if ([v10 isEqualToString:@"disable_recommendation_engine"])
  {
    if (v15)
    {
      -[RecommendationPreferences setDisable_recommendation_engine:](self, "setDisable_recommendation_engine:", [v15 BOOLValue]);
      v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = [(RecommendationPreferences *)self disable_recommendation_engine];
        v18 = "NO";
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        *(_DWORD *)buf = 136446722;
        if (v17) {
          v18 = "YES";
        }
        __int16 v38 = 1024;
        int v39 = 484;
        __int16 v40 = 2080;
        int64_t v41 = (int64_t)v18;
        v19 = "%{public}s::%d:disable_recommendation_engine Preference is %s";
        goto LABEL_200;
      }
LABEL_201:
    }
  }
  else
  {
    if (![v10 isEqualToString:@"disable_dps_wd"])
    {
      if ([v10 isEqualToString:@"minutes_between_dps_wd"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setMinutes_between_dps_wd:](self, "setMinutes_between_dps_wd:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 494;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self minutes_between_dps_wd];
        v19 = "%{public}s::%d:minutes_between_dps_wd Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_wd_cca"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_wd_cca:](self, "setDps_wd_cca:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 499;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_wd_cca];
        v19 = "%{public}s::%d:dps_wd_cca Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_stall_dur_for_wd"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_stall_dur_for_wd:](self, "setDps_stall_dur_for_wd:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 504;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_stall_dur_for_wd];
        v19 = "%{public}s::%d:dps_stall_dur_for_wd Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_capture_evaluated_at_sample"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_capture_evaluated_at_sample:](self, "setDps_capture_evaluated_at_sample:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 509;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_capture_evaluated_at_sample];
        v19 = "%{public}s::%d:dps_capture_evaluated_at_sample Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_trap_evaluated_at_sample"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_trap_evaluated_at_sample:](self, "setDps_trap_evaluated_at_sample:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 514;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_trap_evaluated_at_sample];
        v19 = "%{public}s::%d:dps_trap_evaluated_at_sample Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_interrogation_sample_count"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_interrogation_sample_count:](self, "setDps_interrogation_sample_count:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 519;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_interrogation_sample_count];
        v19 = "%{public}s::%d:dps_interrogation_sample_count Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_duration_between_samples"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_duration_between_samples:](self, "setDps_duration_between_samples:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 524;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_duration_between_samples];
        v19 = "%{public}s::%d:dps_duration_between_samples Preference is %ld";
      }
      else if ([v10 isEqualToString:@"dps_report_sent_after"])
      {
        if (!v15) {
          goto LABEL_202;
        }
        -[RecommendationPreferences setDps_report_sent_after:](self, "setDps_report_sent_after:", [v15 unsignedIntegerValue]);
        v16 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_201;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        __int16 v38 = 1024;
        int v39 = 529;
        __int16 v40 = 2048;
        int64_t v41 = [(RecommendationPreferences *)self dps_report_sent_after];
        v19 = "%{public}s::%d:dps_report_sent_after Preference is %ld";
      }
      else
      {
        if ([v10 isEqualToString:@"force_dps_recommend_always"])
        {
          if (v15)
          {
            -[RecommendationPreferences setForce_dps_recommend_always:](self, "setForce_dps_recommend_always:", [v15 BOOLValue]);
            v16 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v22 = [(RecommendationPreferences *)self force_dps_recommend_always];
              v23 = "NO";
              v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              *(_DWORD *)buf = 136446722;
              if (v22) {
                v23 = "YES";
              }
              __int16 v38 = 1024;
              int v39 = 534;
              __int16 v40 = 2080;
              int64_t v41 = (int64_t)v23;
              v19 = "%{public}s::%d:force_dps_recommend_always Preference is %s";
              goto LABEL_200;
            }
            goto LABEL_201;
          }
          goto LABEL_202;
        }
        if ([v10 isEqualToString:@"dns_symptoms_trap_evaluated_at_sample"])
        {
          if (!v15) {
            goto LABEL_202;
          }
          -[RecommendationPreferences setDns_symptoms_trap_evaluated_at_sample:](self, "setDns_symptoms_trap_evaluated_at_sample:", [v15 unsignedIntegerValue]);
          v16 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_201;
          }
          *(_DWORD *)buf = 136446722;
          v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          __int16 v38 = 1024;
          int v39 = 539;
          __int16 v40 = 2048;
          int64_t v41 = [(RecommendationPreferences *)self dns_symptoms_trap_evaluated_at_sample];
          v19 = "%{public}s::%d:dns_symptoms_trap_evaluated_at_sample Preference is %ld";
        }
        else if ([v10 isEqualToString:@"dns_symptoms_interrogation_sample_count"])
        {
          if (!v15) {
            goto LABEL_202;
          }
          -[RecommendationPreferences setDns_symptoms_interrogation_sample_count:](self, "setDns_symptoms_interrogation_sample_count:", [v15 unsignedIntegerValue]);
          v16 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_201;
          }
          *(_DWORD *)buf = 136446722;
          v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          __int16 v38 = 1024;
          int v39 = 544;
          __int16 v40 = 2048;
          int64_t v41 = [(RecommendationPreferences *)self dns_symptoms_interrogation_sample_count];
          v19 = "%{public}s::%d:dns_symptoms_interrogation_sample_count Preference is %ld";
        }
        else if ([v10 isEqualToString:@"dns_symptoms_duration_between_samples_before_trap"])
        {
          if (!v15) {
            goto LABEL_202;
          }
          -[RecommendationPreferences setDns_symptoms_duration_between_samples_before_trap:](self, "setDns_symptoms_duration_between_samples_before_trap:", [v15 unsignedIntegerValue]);
          v16 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_201;
          }
          *(_DWORD *)buf = 136446722;
          v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          __int16 v38 = 1024;
          int v39 = 549;
          __int16 v40 = 2048;
          int64_t v41 = [(RecommendationPreferences *)self dns_symptoms_duration_between_samples_before_trap];
          v19 = "%{public}s::%d:dns_symptoms_duration_between_samples_before_trap Preference is %ld";
        }
        else if ([v10 isEqualToString:@"dns_symptoms_duration_between_samples_after_trap"])
        {
          if (!v15) {
            goto LABEL_202;
          }
          -[RecommendationPreferences setDns_symptoms_duration_between_samples_after_trap:](self, "setDns_symptoms_duration_between_samples_after_trap:", [v15 unsignedIntegerValue]);
          v16 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_201;
          }
          *(_DWORD *)buf = 136446722;
          v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          __int16 v38 = 1024;
          int v39 = 554;
          __int16 v40 = 2048;
          int64_t v41 = [(RecommendationPreferences *)self dns_symptoms_duration_between_samples_after_trap];
          v19 = "%{public}s::%d:dns_symptoms_duration_between_samples_after_trap Preference is %ld";
        }
        else
        {
          if ([v10 isEqualToString:@"disable_fast_dps_wd"])
          {
            if (v15)
            {
              -[RecommendationPreferences setDisable_fast_dps_wd:](self, "setDisable_fast_dps_wd:", [v15 BOOLValue]);
              v16 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v24 = [(RecommendationPreferences *)self disable_fast_dps_wd];
                v25 = "NO";
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                *(_DWORD *)buf = 136446722;
                if (v24) {
                  v25 = "YES";
                }
                __int16 v38 = 1024;
                int v39 = 559;
                __int16 v40 = 2080;
                int64_t v41 = (int64_t)v25;
                v19 = "%{public}s::%d:disable_fast_dps_wd Preference is %s";
                goto LABEL_200;
              }
              goto LABEL_201;
            }
            goto LABEL_202;
          }
          if ([v10 isEqualToString:@"disable_fast_dps_validation_for_test"])
          {
            if (v15)
            {
              -[RecommendationPreferences setDisable_fast_dps_validation_for_test:](self, "setDisable_fast_dps_validation_for_test:", [v15 BOOLValue]);
              v16 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v26 = [(RecommendationPreferences *)self disable_fast_dps_validation_for_test];
                v27 = "NO";
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                *(_DWORD *)buf = 136446722;
                if (v26) {
                  v27 = "YES";
                }
                __int16 v38 = 1024;
                int v39 = 564;
                __int16 v40 = 2080;
                int64_t v41 = (int64_t)v27;
                v19 = "%{public}s::%d:disable_fast_dps_validation_for_test Preference is %s";
                goto LABEL_200;
              }
              goto LABEL_201;
            }
            goto LABEL_202;
          }
          if ([v10 isEqualToString:@"minutes_between_fast_dps_wd_screen_on"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_fast_dps_wd_screen_on:](self, "setMinutes_between_fast_dps_wd_screen_on:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 569;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_fast_dps_wd_screen_on];
            v19 = "%{public}s::%d:minutes_between_fast_dps_wd_screen_on Preference is %ld";
          }
          else if ([v10 isEqualToString:@"minutes_between_fast_dps_wd_screen_off"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_fast_dps_wd_screen_off:](self, "setMinutes_between_fast_dps_wd_screen_off:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 574;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_fast_dps_wd_screen_off];
            v19 = "%{public}s::%d:minutes_between_fast_dps_wd_screen_off Preference is %ld";
          }
          else if ([v10 isEqualToString:@"prediction_probability_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setPrediction_probability_threshold:](self, "setPrediction_probability_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 579;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self prediction_probability_threshold];
            v19 = "%{public}s::%d:prediction_probability_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"prediction_probability_threshold_macos"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setPrediction_probability_threshold_macos:](self, "setPrediction_probability_threshold_macos:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 584;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self prediction_probability_threshold_macos];
            v19 = "%{public}s::%d:prediction_probability_threshold_macos Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_cca_bin_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_cca_bin_threshold:](self, "setReset_cca_bin_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 589;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_cca_bin_threshold];
            v19 = "%{public}s::%d:reset_cca_bin_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_score_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_score_threshold:](self, "setReset_score_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 594;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_score_threshold];
            v19 = "%{public}s::%d:reset_score_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"dps_symptoms_average_cca_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setDps_symptoms_average_cca_threshold:](self, "setDps_symptoms_average_cca_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 599;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self dps_symptoms_average_cca_threshold];
            v19 = "%{public}s::%d:dps_symptoms_average_cca_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_pd_rssi_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_pd_rssi_threshold:](self, "setReset_pd_rssi_threshold:", [v15 integerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 604;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_pd_rssi_threshold];
            v19 = "%{public}s::%d:reset_pd_rssi_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_pd_cca_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_pd_cca_threshold:](self, "setReset_pd_cca_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 609;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_pd_cca_threshold];
            v19 = "%{public}s::%d:reset_pd_cca_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"minutes_between_symptoms_dps_wd_screen_on"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_symptoms_dps_wd_screen_on:](self, "setMinutes_between_symptoms_dps_wd_screen_on:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 614;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_symptoms_dps_wd_screen_on];
            v19 = "%{public}s::%d:minutes_between_symptoms_dps_wd_screen_on Preference is %ld";
          }
          else if ([v10 isEqualToString:@"minutes_between_symptoms_dps_wd_screen_off"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_symptoms_dps_wd_screen_off:](self, "setMinutes_between_symptoms_dps_wd_screen_off:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 619;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_symptoms_dps_wd_screen_off];
            v19 = "%{public}s::%d:minutes_between_symptoms_dps_wd_screen_off Preference is %ld";
          }
          else if ([v10 isEqualToString:@"minutes_between_peer_diagnostics_trigger_for_dns_stall"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_peer_diagnostics_trigger_for_dns_stall:](self, "setMinutes_between_peer_diagnostics_trigger_for_dns_stall:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 624;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_peer_diagnostics_trigger_for_dns_stall];
            v19 = "%{public}s::%d:minutes_between_peer_diagnostics_trigger_for_dns_stall Preference is %ld";
          }
          else if ([v10 isEqualToString:@"minutes_between_peer_diagnostics_trigger_for_other_issues"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setMinutes_between_peer_diagnostics_trigger_for_other_issues:](self, "setMinutes_between_peer_diagnostics_trigger_for_other_issues:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 629;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self minutes_between_peer_diagnostics_trigger_for_other_issues];
            v19 = "%{public}s::%d:minutes_between_peer_diagnostics_trigger_for_other_issues Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_legacy_chipset_cca_bin_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_legacy_chipset_cca_bin_threshold:](self, "setReset_legacy_chipset_cca_bin_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 634;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_legacy_chipset_cca_bin_threshold];
            v19 = "%{public}s::%d:reset_legacy_chipset_cca_bin_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_rssi_bin_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_rssi_bin_threshold:](self, "setReset_rssi_bin_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 639;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_rssi_bin_threshold];
            v19 = "%{public}s::%d:reset_rssi_bin_threshold Preference is %ld";
          }
          else if ([v10 isEqualToString:@"reset_awdl_activity_threshold"])
          {
            if (!v15) {
              goto LABEL_202;
            }
            -[RecommendationPreferences setReset_awdl_activity_threshold:](self, "setReset_awdl_activity_threshold:", [v15 unsignedIntegerValue]);
            v16 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_201;
            }
            *(_DWORD *)buf = 136446722;
            v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            __int16 v38 = 1024;
            int v39 = 644;
            __int16 v40 = 2048;
            int64_t v41 = [(RecommendationPreferences *)self reset_awdl_activity_threshold];
            v19 = "%{public}s::%d:reset_awdl_activity_threshold Preference is %ld";
          }
          else
          {
            if ([v10 isEqualToString:@"disable_slow_wifi_wd"])
            {
              if (v15)
              {
                -[RecommendationPreferences setDisable_slow_wifi_wd:](self, "setDisable_slow_wifi_wd:", [v15 BOOLValue]);
                v16 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v28 = [(RecommendationPreferences *)self disable_slow_wifi_wd];
                  v29 = "NO";
                  v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                  *(_DWORD *)buf = 136446722;
                  if (v28) {
                    v29 = "YES";
                  }
                  __int16 v38 = 1024;
                  int v39 = 649;
                  __int16 v40 = 2080;
                  int64_t v41 = (int64_t)v29;
                  v19 = "%{public}s::%d:disable_slow_wifi_wd Preference is %s";
                  goto LABEL_200;
                }
                goto LABEL_201;
              }
              goto LABEL_202;
            }
            if ([v10 isEqualToString:@"minutes_between_slow_wifi_wd"])
            {
              if (!v15) {
                goto LABEL_202;
              }
              -[RecommendationPreferences setMinutes_between_slow_wifi_wd:](self, "setMinutes_between_slow_wifi_wd:", [v15 unsignedIntegerValue]);
              v16 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_201;
              }
              *(_DWORD *)buf = 136446722;
              v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              __int16 v38 = 1024;
              int v39 = 654;
              __int16 v40 = 2048;
              int64_t v41 = [(RecommendationPreferences *)self minutes_between_slow_wifi_wd];
              v19 = "%{public}s::%d:minutes_between_slow_wifi_wd Preference is %ld";
            }
            else if ([v10 isEqualToString:@"slow_wifi_interrogation_sample_count"])
            {
              if (!v15) {
                goto LABEL_202;
              }
              -[RecommendationPreferences setSlow_wifi_interrogation_sample_count:](self, "setSlow_wifi_interrogation_sample_count:", [v15 unsignedIntegerValue]);
              v16 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_201;
              }
              *(_DWORD *)buf = 136446722;
              v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              __int16 v38 = 1024;
              int v39 = 659;
              __int16 v40 = 2048;
              int64_t v41 = [(RecommendationPreferences *)self slow_wifi_interrogation_sample_count];
              v19 = "%{public}s::%d:slow_wifi_interrogation_sample_count Preference is %ld";
            }
            else if ([v10 isEqualToString:@"slow_wifi_duration_between_samples"])
            {
              if (!v15) {
                goto LABEL_202;
              }
              -[RecommendationPreferences setSlow_wifi_duration_between_samples:](self, "setSlow_wifi_duration_between_samples:", [v15 unsignedIntegerValue]);
              v16 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_201;
              }
              *(_DWORD *)buf = 136446722;
              v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              __int16 v38 = 1024;
              int v39 = 664;
              __int16 v40 = 2048;
              int64_t v41 = [(RecommendationPreferences *)self slow_wifi_duration_between_samples];
              v19 = "%{public}s::%d:slow_wifi_duration_between_samples Preference is %ld";
            }
            else if ([v10 isEqualToString:@"slow_wifi_report_sent_after"])
            {
              if (!v15) {
                goto LABEL_202;
              }
              -[RecommendationPreferences setSlow_wifi_report_sent_after:](self, "setSlow_wifi_report_sent_after:", [v15 unsignedIntegerValue]);
              v16 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_201;
              }
              *(_DWORD *)buf = 136446722;
              v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              __int16 v38 = 1024;
              int v39 = 669;
              __int16 v40 = 2048;
              int64_t v41 = [(RecommendationPreferences *)self slow_wifi_report_sent_after];
              v19 = "%{public}s::%d:slow_wifi_report_sent_after Preference is %ld";
            }
            else
            {
              if ([v10 isEqualToString:@"disable_slow_wifi_dps_is_priority_network"])
              {
                if (v15)
                {
                  -[RecommendationPreferences setDisable_slow_wifi_dps_is_priority_network:](self, "setDisable_slow_wifi_dps_is_priority_network:", [v15 BOOLValue]);
                  v16 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v30 = [(RecommendationPreferences *)self disable_slow_wifi_dps_is_priority_network];
                    v31 = "NO";
                    v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                    *(_DWORD *)buf = 136446722;
                    if (v30) {
                      v31 = "YES";
                    }
                    __int16 v38 = 1024;
                    int v39 = 674;
                    __int16 v40 = 2080;
                    int64_t v41 = (int64_t)v31;
                    v19 = "%{public}s::%d:disable_slow_wifi_dps_is_priority_network Preference is %s";
                    goto LABEL_200;
                  }
                  goto LABEL_201;
                }
                goto LABEL_202;
              }
              if ([v10 isEqualToString:@"ior_rescan_budget_less_than_previous_max_channels_seconds"])
              {
                if (!v15) {
                  goto LABEL_202;
                }
                -[RecommendationPreferences setIor_rescan_budget_less_than_previous_max_channels_seconds:](self, "setIor_rescan_budget_less_than_previous_max_channels_seconds:", [v15 unsignedIntegerValue]);
                v16 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_201;
                }
                *(_DWORD *)buf = 136446722;
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                __int16 v38 = 1024;
                int v39 = 679;
                __int16 v40 = 2048;
                int64_t v41 = [(RecommendationPreferences *)self ior_rescan_budget_less_than_previous_max_channels_seconds];
                v19 = "%{public}s::%d:ior_rescan_budget_less_than_previous_max_channels_seconds Preference is %ld";
              }
              else if ([v10 isEqualToString:@"ior_rescan_budget_exploratory_seconds"])
              {
                if (!v15) {
                  goto LABEL_202;
                }
                -[RecommendationPreferences setIor_rescan_budget_exploratory_seconds:](self, "setIor_rescan_budget_exploratory_seconds:", [v15 unsignedIntegerValue]);
                v16 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_201;
                }
                *(_DWORD *)buf = 136446722;
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                __int16 v38 = 1024;
                int v39 = 684;
                __int16 v40 = 2048;
                int64_t v41 = [(RecommendationPreferences *)self ior_rescan_budget_exploratory_seconds];
                v19 = "%{public}s::%d:ior_rescan_budget_exploratory_seconds Preference is %ld";
              }
              else if ([v10 isEqualToString:@"ior_rescan_new_phy_delay_seconds"])
              {
                if (!v15) {
                  goto LABEL_202;
                }
                -[RecommendationPreferences setIor_rescan_new_phy_delay_seconds:](self, "setIor_rescan_new_phy_delay_seconds:", [v15 unsignedIntegerValue]);
                v16 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_201;
                }
                *(_DWORD *)buf = 136446722;
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                __int16 v38 = 1024;
                int v39 = 689;
                __int16 v40 = 2048;
                int64_t v41 = [(RecommendationPreferences *)self ior_rescan_new_phy_delay_seconds];
                v19 = "%{public}s::%d:ior_rescan_new_phy_delay_seconds Preference is %ld";
              }
              else if ([v10 isEqualToString:@"ior_persist_delay_seconds"])
              {
                if (!v15) {
                  goto LABEL_202;
                }
                -[RecommendationPreferences setIor_persist_delay_seconds:](self, "setIor_persist_delay_seconds:", [v15 unsignedIntegerValue]);
                v16 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_201;
                }
                *(_DWORD *)buf = 136446722;
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                __int16 v38 = 1024;
                int v39 = 694;
                __int16 v40 = 2048;
                int64_t v41 = [(RecommendationPreferences *)self ior_persist_delay_seconds];
                v19 = "%{public}s::%d:ior_persist_delay_seconds Preference is %ld";
              }
              else
              {
                if (![v10 isEqualToString:@"work_report_seconds"])
                {
                  if ([v10 isEqualToString:@"work_report_logs_enabled"])
                  {
                    if (v15)
                    {
                      -[RecommendationPreferences setWork_report_logs_enabled:](self, "setWork_report_logs_enabled:", [v15 BOOLValue]);
                      v16 = WALogCategoryDefaultHandle();
                      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int v32 = [(RecommendationPreferences *)self work_report_logs_enabled];
                        v33 = "NO";
                        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                        *(_DWORD *)buf = 136446722;
                        if (v32) {
                          v33 = "YES";
                        }
                        __int16 v38 = 1024;
                        int v39 = 704;
                        __int16 v40 = 2080;
                        int64_t v41 = (int64_t)v33;
                        v19 = "%{public}s::%d:work_report_logs_enabled Preference is %s";
                        goto LABEL_200;
                      }
                      goto LABEL_201;
                    }
                  }
                  else
                  {
                    v34 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446978;
                      v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                      __int16 v38 = 1024;
                      int v39 = 707;
                      __int16 v40 = 2112;
                      int64_t v41 = (int64_t)v12;
                      __int16 v42 = 2112;
                      id v43 = v10;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}s::%d:Received an unexpected wifianalyticsd preference change: %@ for %@", buf, 0x26u);
                    }

                    v35.receiver = self;
                    v35.super_class = (Class)RecommendationPreferences;
                    [(RecommendationPreferences *)&v35 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
                  }
                  goto LABEL_202;
                }
                if (!v15) {
                  goto LABEL_202;
                }
                -[RecommendationPreferences setWork_report_seconds:](self, "setWork_report_seconds:", [v15 unsignedIntegerValue]);
                v16 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_201;
                }
                *(_DWORD *)buf = 136446722;
                v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                __int16 v38 = 1024;
                int v39 = 699;
                __int16 v40 = 2048;
                int64_t v41 = [(RecommendationPreferences *)self work_report_seconds];
                v19 = "%{public}s::%d:work_report_seconds Preference is %ld";
              }
            }
          }
        }
      }
LABEL_200:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x1Cu);
      goto LABEL_201;
    }
    if (v15)
    {
      -[RecommendationPreferences setDisable_dps_wd:](self, "setDisable_dps_wd:", [v15 BOOLValue]);
      v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = [(RecommendationPreferences *)self disable_dps_wd];
        v21 = "NO";
        v37 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        *(_DWORD *)buf = 136446722;
        if (v20) {
          v21 = "YES";
        }
        __int16 v38 = 1024;
        int v39 = 489;
        __int16 v40 = 2080;
        int64_t v41 = (int64_t)v21;
        v19 = "%{public}s::%d:disable_dps_wd Preference is %s";
        goto LABEL_200;
      }
      goto LABEL_201;
    }
  }
LABEL_202:
}

- (BOOL)disable_recommendation_engine
{
  return self->_disable_recommendation_engine;
}

- (void)setDisable_recommendation_engine:(BOOL)a3
{
  self->_disable_recommendation_engine = a3;
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (void)setDisable_dps_wd:(BOOL)a3
{
  self->_disable_dps_wd = a3;
}

- (unint64_t)minutes_between_dps_wd
{
  return self->_minutes_between_dps_wd;
}

- (void)setMinutes_between_dps_wd:(unint64_t)a3
{
  self->_minutes_between_dps_wd = a3;
}

- (unint64_t)dps_wd_cca
{
  return self->_dps_wd_cca;
}

- (void)setDps_wd_cca:(unint64_t)a3
{
  self->_dps_wd_cca = a3;
}

- (unint64_t)dps_stall_dur_for_wd
{
  return self->_dps_stall_dur_for_wd;
}

- (void)setDps_stall_dur_for_wd:(unint64_t)a3
{
  self->_dps_stall_dur_for_wd = a3;
}

- (unint64_t)dps_capture_evaluated_at_sample
{
  return self->_dps_capture_evaluated_at_sample;
}

- (void)setDps_capture_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_capture_evaluated_at_sample = a3;
}

- (unint64_t)dps_trap_evaluated_at_sample
{
  return self->_dps_trap_evaluated_at_sample;
}

- (void)setDps_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_trap_evaluated_at_sample = a3;
}

- (unint64_t)dps_interrogation_sample_count
{
  return self->_dps_interrogation_sample_count;
}

- (void)setDps_interrogation_sample_count:(unint64_t)a3
{
  self->_dps_interrogation_sample_count = a3;
}

- (unint64_t)dps_duration_between_samples
{
  return self->_dps_duration_between_samples;
}

- (void)setDps_duration_between_samples:(unint64_t)a3
{
  self->_dps_duration_between_samples = a3;
}

- (unint64_t)dps_report_sent_after
{
  return self->_dps_report_sent_after;
}

- (void)setDps_report_sent_after:(unint64_t)a3
{
  self->_dps_report_sent_after = a3;
}

- (BOOL)force_dps_recommend_always
{
  return self->_force_dps_recommend_always;
}

- (void)setForce_dps_recommend_always:(BOOL)a3
{
  self->_force_dps_recommend_always = a3;
}

- (unint64_t)dns_symptoms_trap_evaluated_at_sample
{
  return self->_dns_symptoms_trap_evaluated_at_sample;
}

- (void)setDns_symptoms_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dns_symptoms_trap_evaluated_at_sample = a3;
}

- (unint64_t)dns_symptoms_interrogation_sample_count
{
  return self->_dns_symptoms_interrogation_sample_count;
}

- (void)setDns_symptoms_interrogation_sample_count:(unint64_t)a3
{
  self->_dns_symptoms_interrogation_sample_count = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_before_trap
{
  return self->_dns_symptoms_duration_between_samples_before_trap;
}

- (void)setDns_symptoms_duration_between_samples_before_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_before_trap = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_after_trap
{
  return self->_dns_symptoms_duration_between_samples_after_trap;
}

- (void)setDns_symptoms_duration_between_samples_after_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_after_trap = a3;
}

- (BOOL)disable_fast_dps_wd
{
  return self->_disable_fast_dps_wd;
}

- (void)setDisable_fast_dps_wd:(BOOL)a3
{
  self->_disable_fast_dps_wd = a3;
}

- (BOOL)disable_fast_dps_validation_for_test
{
  return self->_disable_fast_dps_validation_for_test;
}

- (void)setDisable_fast_dps_validation_for_test:(BOOL)a3
{
  self->_disable_fast_dps_validation_for_test = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_on
{
  return self->_minutes_between_fast_dps_wd_screen_on;
}

- (void)setMinutes_between_fast_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_off
{
  return self->_minutes_between_fast_dps_wd_screen_off;
}

- (void)setMinutes_between_fast_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_off = a3;
}

- (unint64_t)prediction_probability_threshold
{
  return self->_prediction_probability_threshold;
}

- (void)setPrediction_probability_threshold:(unint64_t)a3
{
  self->_prediction_probability_threshold = a3;
}

- (unint64_t)prediction_probability_threshold_macos
{
  return self->_prediction_probability_threshold_macos;
}

- (void)setPrediction_probability_threshold_macos:(unint64_t)a3
{
  self->_prediction_probability_threshold_macos = a3;
}

- (unint64_t)reset_cca_bin_threshold
{
  return self->_reset_cca_bin_threshold;
}

- (void)setReset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_cca_bin_threshold = a3;
}

- (unint64_t)reset_legacy_chipset_cca_bin_threshold
{
  return self->_reset_legacy_chipset_cca_bin_threshold;
}

- (void)setReset_legacy_chipset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_legacy_chipset_cca_bin_threshold = a3;
}

- (unint64_t)reset_rssi_bin_threshold
{
  return self->_reset_rssi_bin_threshold;
}

- (void)setReset_rssi_bin_threshold:(unint64_t)a3
{
  self->_reset_rssi_bin_threshold = a3;
}

- (unint64_t)reset_awdl_activity_threshold
{
  return self->_reset_awdl_activity_threshold;
}

- (void)setReset_awdl_activity_threshold:(unint64_t)a3
{
  self->_reset_awdl_activity_threshold = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_on
{
  return self->_minutes_between_symptoms_dps_wd_screen_on;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_off
{
  return self->_minutes_between_symptoms_dps_wd_screen_off;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_off = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_dns_stall
{
  return self->_minutes_between_peer_diagnostics_trigger_for_dns_stall;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_dns_stall:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_dns_stall = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_other_issues
{
  return self->_minutes_between_peer_diagnostics_trigger_for_other_issues;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_other_issues:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_other_issues = a3;
}

- (unint64_t)reset_score_threshold
{
  return self->_reset_score_threshold;
}

- (void)setReset_score_threshold:(unint64_t)a3
{
  self->_reset_score_threshold = a3;
}

- (int64_t)reset_pd_rssi_threshold
{
  return self->_reset_pd_rssi_threshold;
}

- (void)setReset_pd_rssi_threshold:(int64_t)a3
{
  self->_reset_pd_rssi_threshold = a3;
}

- (unint64_t)reset_pd_cca_threshold
{
  return self->_reset_pd_cca_threshold;
}

- (void)setReset_pd_cca_threshold:(unint64_t)a3
{
  self->_reset_pd_cca_threshold = a3;
}

- (unint64_t)dps_symptoms_average_cca_threshold
{
  return self->_dps_symptoms_average_cca_threshold;
}

- (void)setDps_symptoms_average_cca_threshold:(unint64_t)a3
{
  self->_dps_symptoms_average_cca_threshold = a3;
}

- (BOOL)disable_slow_wifi_wd
{
  return self->_disable_slow_wifi_wd;
}

- (void)setDisable_slow_wifi_wd:(BOOL)a3
{
  self->_disable_slow_wifi_wd = a3;
}

- (unint64_t)minutes_between_slow_wifi_wd
{
  return self->_minutes_between_slow_wifi_wd;
}

- (void)setMinutes_between_slow_wifi_wd:(unint64_t)a3
{
  self->_minutes_between_slow_wifi_wd = a3;
}

- (unint64_t)slow_wifi_interrogation_sample_count
{
  return self->_slow_wifi_interrogation_sample_count;
}

- (void)setSlow_wifi_interrogation_sample_count:(unint64_t)a3
{
  self->_slow_wifi_interrogation_sample_count = a3;
}

- (unint64_t)slow_wifi_duration_between_samples
{
  return self->_slow_wifi_duration_between_samples;
}

- (void)setSlow_wifi_duration_between_samples:(unint64_t)a3
{
  self->_slow_wifi_duration_between_samples = a3;
}

- (unint64_t)slow_wifi_report_sent_after
{
  return self->_slow_wifi_report_sent_after;
}

- (void)setSlow_wifi_report_sent_after:(unint64_t)a3
{
  self->_slow_wifi_report_sent_after = a3;
}

- (BOOL)disable_slow_wifi_dps_is_priority_network
{
  return self->_disable_slow_wifi_dps_is_priority_network;
}

- (void)setDisable_slow_wifi_dps_is_priority_network:(BOOL)a3
{
  self->_disable_slow_wifi_dps_is_priority_network = a3;
}

- (unint64_t)ior_rescan_budget_less_than_previous_max_channels_seconds
{
  return self->_ior_rescan_budget_less_than_previous_max_channels_seconds;
}

- (void)setIor_rescan_budget_less_than_previous_max_channels_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_less_than_previous_max_channels_seconds = a3;
}

- (unint64_t)ior_rescan_budget_exploratory_seconds
{
  return self->_ior_rescan_budget_exploratory_seconds;
}

- (void)setIor_rescan_budget_exploratory_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_exploratory_seconds = a3;
}

- (unint64_t)ior_rescan_new_phy_delay_seconds
{
  return self->_ior_rescan_new_phy_delay_seconds;
}

- (void)setIor_rescan_new_phy_delay_seconds:(unint64_t)a3
{
  self->_ior_rescan_new_phy_delay_seconds = a3;
}

- (unint64_t)ior_persist_delay_seconds
{
  return self->_ior_persist_delay_seconds;
}

- (void)setIor_persist_delay_seconds:(unint64_t)a3
{
  self->_ior_persist_delay_seconds = a3;
}

- (unint64_t)work_report_seconds
{
  return self->_work_report_seconds;
}

- (void)setWork_report_seconds:(unint64_t)a3
{
  self->_work_report_seconds = a3;
}

- (BOOL)work_report_logs_enabled
{
  return self->_work_report_logs_enabled;
}

- (void)setWork_report_logs_enabled:(BOOL)a3
{
  self->_work_report_logs_enabled = a3;
}

@end