@interface RTWorkoutMetricsManager
+ (id)stringFromWorkoutMetricsEvent:(unint64_t)a3;
- (BOOL)_computeMetricsForClustersEventWithData:(id)a3 error:(id *)a4;
- (BOOL)_computeMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5;
- (BOOL)_computeMetricsForProcessNewWorkoutEventWithData:(id)a3 error:(id *)a4;
- (BOOL)_computeMetricsForProcessWorkoutsEventWithData:(id)a3 error:(id *)a4;
- (BOOL)_computeMetricsForUpdateRelevanceScoresEventWithData:(id)a3 error:(id *)a4;
- (BOOL)_doesMandatoryKeysExist:(unint64_t)a3 data:(id)a4 error:(id *)a5;
- (BOOL)_submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5;
- (BOOL)_updateNSNumberMetricsData:(id)a3 key:(id)a4 binsStart:(id)a5 binsEnd:(id)a6 gap:(id)a7 error:(id *)a8;
- (BOOL)submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5;
- (RTManagedConfiguration)managedConfiguration;
- (RTWorkoutMetricsManager)init;
- (RTWorkoutMetricsManager)initWithManagedConfiguration:(id)a3;
- (id)_mandatoryMetricKeysForEvent:(unint64_t)a3 error:(id *)a4;
- (void)setManagedConfiguration:(id)a3;
@end

@implementation RTWorkoutMetricsManager

- (RTWorkoutMetricsManager)init
{
  v3 = objc_opt_new();
  v4 = [(RTWorkoutMetricsManager *)self initWithManagedConfiguration:v3];

  return v4;
}

- (RTWorkoutMetricsManager)initWithManagedConfiguration:(id)a3
{
  v3 = self;
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)RTWorkoutMetricsManager;
    v4 = [(RTWorkoutMetricsManager *)&v10 init];
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      managedConfiguration = v4->_managedConfiguration;
      v4->_managedConfiguration = (RTManagedConfiguration *)v5;
    }
    v3 = v4;
    v7 = v3;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedConfiguration", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)stringFromWorkoutMetricsEvent:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B99D08[a3 - 1];
  }
}

- (BOOL)submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(RTWorkoutMetricsManager *)self managedConfiguration];
  char v10 = [v9 isHealthDataSubmissionAllowed];

  if (v10)
  {
    v53 = [MEMORY[0x1E4F1C9C8] date];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v11 = v8;
    uint64_t v54 = [v11 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v61;
      id v52 = v11;
      v50 = a5;
      id v51 = v8;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(v11);
        }
        v13 = *(void **)(*((void *)&v60 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1E016D870]();
        id v59 = 0;
        BOOL v15 = [(RTWorkoutMetricsManager *)self _doesMandatoryKeysExist:a3 data:v13 error:&v59];
        v16 = v59;
        if (v16)
        {
LABEL_23:
          v35 = v16;
LABEL_34:
          a5 = v50;
          id v8 = v51;
          goto LABEL_35;
        }
        if (!v15) {
          break;
        }
        id v58 = 0;
        BOOL v15 = [(RTWorkoutMetricsManager *)self _computeMetricsForEvent:a3 data:v13 error:&v58];
        v16 = v58;
        if (v16) {
          goto LABEL_23;
        }
        v17 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v18 = v17;
        if (!v15)
        {
          id v8 = v51;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v46 = (objc_class *)objc_opt_class();
            v47 = NSStringFromClass(v46);
            v48 = NSStringFromSelector(a2);
            v49 = [(id)objc_opt_class() stringFromWorkoutMetricsEvent:a3];
            *(_DWORD *)buf = 138412802;
            v65 = v47;
            __int16 v66 = 2112;
            v67 = v48;
            __int16 v68 = 2112;
            v69 = v49;
            _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, %@, metrics computation for event, %@, failed", buf, 0x20u);
          }
          goto LABEL_30;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          v21 = NSStringFromSelector(a2);
          v22 = [(id)objc_opt_class() stringFromWorkoutMetricsEvent:a3];
          uint64_t v23 = [v13 count];
          *(_DWORD *)buf = 138413058;
          v65 = v20;
          __int16 v66 = 2112;
          v67 = v21;
          __int16 v68 = 2112;
          v69 = v22;
          __int16 v70 = 2048;
          v71 = (__CFString *)v23;
          _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, submiting metrics for event, %@, keys count, %lu", buf, 0x2Au);
        }
        id v57 = 0;
        [(RTWorkoutMetricsManager *)self _submitMetricsForEvent:a3 data:v13 error:&v57];
        v24 = v57;
        if (v24)
        {
          v35 = v24;
          BOOL v15 = 1;
          goto LABEL_34;
        }
        v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          v28 = NSStringFromSelector(a2);
          v29 = [(id)objc_opt_class() stringFromWorkoutMetricsEvent:a3];
          uint64_t v30 = [v13 count];
          v31 = [MEMORY[0x1E4F1C9C8] date];
          [v31 timeIntervalSinceDate:v53];
          uint64_t v33 = v32;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413570;
          v65 = v27;
          __int16 v66 = 2112;
          v67 = v28;
          __int16 v68 = 2112;
          v69 = v29;
          __int16 v70 = 2048;
          v71 = (__CFString *)v30;
          __int16 v72 = 2048;
          uint64_t v73 = v33;
          __int16 v74 = 2048;
          uint64_t v75 = v34;
          _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, submitted metrics for event, %@, keys count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

          id v11 = v52;
        }

        if (v54 == ++v12)
        {
          v35 = 0;
          BOOL v15 = 1;
          a5 = v50;
          id v8 = v51;
          uint64_t v54 = [v11 countByEnumeratingWithState:&v60 objects:v76 count:16];
          if (v54) {
            goto LABEL_4;
          }
          goto LABEL_35;
        }
      }
      v36 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      id v8 = v51;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = NSStringFromSelector(a2);
        v40 = [(id)objc_opt_class() stringFromWorkoutMetricsEvent:a3];
        uint64_t v41 = [v13 count];
        *(_DWORD *)buf = 138413314;
        v65 = v38;
        __int16 v66 = 2112;
        v67 = v39;
        __int16 v68 = 2112;
        v69 = v40;
        __int16 v70 = 2112;
        v71 = @"NO";
        __int16 v72 = 2048;
        uint64_t v73 = v41;
        _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "%@, %@, does mandatory keys for event, %@, exist, %@, keys count, %lu, skipping metric submission", buf, 0x34u);

        id v11 = v52;
      }

LABEL_30:
      if (v50) {
        id *v50 = 0;
      }

      v35 = 0;
      BOOL v15 = 0;
    }
    else
    {
      v35 = 0;
      BOOL v15 = 1;
LABEL_35:

      if (a5)
      {
        v35 = v35;
        *a5 = v35;
      }
    }
  }
  else
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v65 = v44;
      __int16 v66 = 2112;
      v67 = v45;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, %@, Health Data Submission not allowed on this device.", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_doesMandatoryKeysExist:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v6 = a4;
  if (v6)
  {
    if (a5)
    {
      id v7 = 0;
LABEL_8:
      *a5 = v7;
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", v10, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"data");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }

  return v6 != 0;
}

- (BOOL)_computeMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (v9)
  {
    v28 = [MEMORY[0x1E4F1C9C8] date];
    switch(a3)
    {
      case 1uLL:
        uint64_t v32 = 0;
        char v10 = (id *)&v32;
        BOOL v11 = [(RTWorkoutMetricsManager *)self _computeMetricsForClustersEventWithData:v9 error:&v32];
        goto LABEL_12;
      case 2uLL:
        uint64_t v31 = 0;
        char v10 = (id *)&v31;
        BOOL v11 = [(RTWorkoutMetricsManager *)self _computeMetricsForProcessNewWorkoutEventWithData:v9 error:&v31];
        goto LABEL_12;
      case 3uLL:
        uint64_t v30 = 0;
        char v10 = (id *)&v30;
        BOOL v11 = [(RTWorkoutMetricsManager *)self _computeMetricsForProcessWorkoutsEventWithData:v9 error:&v30];
        goto LABEL_12;
      case 4uLL:
        uint64_t v29 = 0;
        char v10 = (id *)&v29;
        BOOL v11 = [(RTWorkoutMetricsManager *)self _computeMetricsForUpdateRelevanceScoresEventWithData:v9 error:&v29];
LABEL_12:
        BOOL v13 = v11;
        id v14 = *v10;
        BOOL v15 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v16);
          v26 = NSStringFromSelector(a2);
          v17 = [(id)objc_opt_class() stringFromWorkoutMetricsEvent:a3];
          v18 = @"NO";
          if (v13) {
            v18 = @"YES";
          }
          uint64_t v19 = [v9 count:v18];
          v20 = [MEMORY[0x1E4F1C9C8] date];
          [v20 timeIntervalSinceDate:v28];
          uint64_t v22 = v21;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413826;
          uint64_t v34 = v27;
          __int16 v35 = 2112;
          v36 = v26;
          __int16 v37 = 2112;
          v38 = v17;
          __int16 v39 = 2112;
          uint64_t v40 = v25;
          __int16 v41 = 2048;
          uint64_t v42 = v19;
          __int16 v43 = 2048;
          uint64_t v44 = v22;
          __int16 v45 = 2048;
          uint64_t v46 = v23;
          _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, computed metrics for event, %@, status, %@, keys count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);
        }
        if (a5)
        {
          id v14 = v14;
          *a5 = v14;
        }
        break;
      default:
        id v14 = 0;
        LOBYTE(v13) = 0;
        break;
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"data");
      LOBYTE(v13) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (BOOL)_submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (v7)
  {
    switch(a3)
    {
      case 1uLL:
        id v8 = [NSString alloc];
        BOOL v9 = 1;
        char v10 = (void *)[v8 initWithCString:RTAnalyticsEventWorkoutRouteManagerClusters encoding:1];
        log_analytics_submission(v10, v7);
        BOOL v11 = [NSString stringWithFormat:@"com.apple.%@", v10];
        AnalyticsSendEvent();

        break;
      case 2uLL:
        id v13 = [NSString alloc];
        uint64_t v14 = RTAnalyticsEventWorkoutRouteManagerProcessNewWorkout;
        goto LABEL_12;
      case 3uLL:
        id v13 = [NSString alloc];
        uint64_t v14 = RTAnalyticsEventWorkoutRouteManagerProcessWorkouts;
        goto LABEL_12;
      case 4uLL:
        id v13 = [NSString alloc];
        uint64_t v14 = RTAnalyticsEventWorkoutRouteManagerUpdateRelevanceScores;
LABEL_12:
        BOOL v15 = (void *)[v13 initWithCString:v14 encoding:1];
        log_analytics_submission(v15, v7);
        v16 = [NSString stringWithFormat:@"com.apple.%@", v15];
        AnalyticsSendEvent();

        BOOL v9 = 1;
        break;
      default:
        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"data");
      BOOL v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)_mandatoryMetricKeysForEvent:(unint64_t)a3 error:(id *)a4
{
  v15[7] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E016D870](self, a2, a3, a4);
  switch(a3)
  {
    case 1uLL:
      v15[0] = @"activity_type";
      v15[1] = @"is_decimated";
      v15[2] = @"is_new_cluster";
      v15[3] = @"is_best_also_last_workout";
      v15[4] = @"count_workouts";
      v15[5] = @"duration";
      v15[6] = @"total_distance";
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v15;
      uint64_t v8 = 7;
      goto LABEL_7;
    case 2uLL:
      v14[0] = @"footprint_delta";
      v14[1] = @"is_reference_route_best_route";
      v14[2] = @"is_reference_route_last_route";
      v14[3] = @"time_elapsed_mini_worldbuild_check";
      v14[4] = @"is_new_workout_similar_to_reference_route";
      v14[5] = @"is_new_workout_clustered_other";
      v14[6] = @"is_new_workout_clustered_reference_route";
      v14[7] = @"time_elapsed_reference_route_cluster_check";
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v14;
      uint64_t v8 = 8;
      goto LABEL_7;
    case 3uLL:
      v13[0] = @"clustering_average_cluster_size";
      v13[1] = @"clustering_count_clusters";
      v13[2] = @"clustering_footprint_delta";
      v13[3] = @"clustering_is_success";
      v13[4] = @"clustering_max_cluster_size";
      v13[5] = @"clustering_min_cluster_size";
      v13[6] = @"clustering_percentage_workouts_clustered";
      v13[7] = @"clustering_time_elapsed";
      v13[8] = @"distance_matric_count_prefiltercache";
      v13[9] = @"distance_matrix_average_time_already_computed";
      v13[10] = @"distance_matrix_average_time_exceeded_dtw";
      v13[11] = @"distance_matrix_average_time_exceeded_quicksimilarity";
      v13[12] = @"distance_matrix_average_time_lessthan_orequal_dtw";
      v13[13] = @"distance_matrix_average_time_lessthan_orequal_quicksimilarity";
      v13[14] = @"distance_matrix_average_time_prefiltered_centroid";
      v13[15] = @"distance_matrix_average_time_prefiltered_firstlocation";
      v13[16] = @"distance_matrix_average_time_prefiltered_iou";
      v13[17] = @"distance_matrix_average_time_prefiltered_lastlocation";
      v13[18] = @"distance_matrix_average_time_prefiltered_locationscount";
      v13[19] = @"distance_matrix_average_time_prefiltered_metadata";
      v13[20] = @"distance_matrix_count_already_computed";
      v13[21] = @"distance_matrix_count_both_workouts_decimated";
      v13[22] = @"distance_matrix_count_exceeded_dtw";
      v13[23] = @"distance_matrix_count_exceeded_quicksimilarity";
      v13[24] = @"distance_matrix_count_lessthan_orequal_dtw";
      v13[25] = @"distance_matrix_count_lessthan_orequal_quicksimilarity";
      v13[26] = @"distance_matrix_count_no_workout_decimated";
      v13[27] = @"distance_matrix_count_prefiltered_centroid";
      v13[28] = @"distance_matrix_count_prefiltered_firstlocation";
      v13[29] = @"distance_matrix_count_prefiltered_iou";
      v13[30] = @"distance_matrix_count_prefiltered_lastlocation";
      v13[31] = @"distance_matrix_count_prefiltered_locationscount";
      v13[32] = @"distance_matrix_count_prefiltered_metadata";
      v13[33] = @"distance_matrix_count_single_workout_decimated";
      v13[34] = @"distance_matrix_final_size";
      v13[35] = @"distance_matrix_footprint_delta";
      v13[36] = @"distance_matrix_initial_size";
      v13[37] = @"distance_matrix_is_success";
      v13[38] = @"distance_matrix_max_time_already_computed";
      v13[39] = @"distance_matrix_max_time_exceeded_dtw";
      v13[40] = @"distance_matrix_max_time_exceeded_quicksimilarity";
      v13[41] = @"distance_matrix_max_time_lessthan_orequal_dtw";
      v13[42] = @"distance_matrix_max_time_lessthan_orequal_quicksimilarity";
      v13[43] = @"distance_matrix_max_time_prefiltered_centroid";
      v13[44] = @"distance_matrix_max_time_prefiltered_firstlocation";
      v13[45] = @"distance_matrix_max_time_prefiltered_iou";
      v13[46] = @"distance_matrix_max_time_prefiltered_lastlocation";
      v13[47] = @"distance_matrix_max_time_prefiltered_locationscount";
      v13[48] = @"distance_matrix_max_time_prefiltered_metadata";
      v13[49] = @"distance_matrix_min_time_already_computed";
      v13[50] = @"distance_matrix_min_time_exceeded_dtw";
      v13[51] = @"distance_matrix_min_time_exceeded_quicksimilarity";
      v13[52] = @"distance_matrix_min_time_lessthan_orequal_dtw";
      v13[53] = @"distance_matrix_min_time_lessthan_orequal_quicksimilarity";
      v13[54] = @"distance_matrix_min_time_prefiltered_centroid";
      v13[55] = @"distance_matrix_min_time_prefiltered_firstlocation";
      v13[56] = @"distance_matrix_min_time_prefiltered_iou";
      v13[57] = @"distance_matrix_min_time_prefiltered_lastlocation";
      v13[58] = @"distance_matrix_min_time_prefiltered_locationscount";
      v13[59] = @"distance_matrix_min_time_prefiltered_metadata";
      v13[60] = @"distance_matrix_time_elapsed";
      v13[61] = @"distance_matrix_total_number_of_comparisons";
      v13[62] = @"is_scheduler_triggered";
      v13[63] = @"number_of_workouts_cycling";
      v13[64] = @"number_of_workouts_running";
      v13[65] = @"number_of_workouts_wheel_chair_run_pace";
      v13[66] = @"parameter_buildDistanceMatrix";
      v13[67] = @"parameter_clearClusters";
      v13[68] = @"parameter_clearExistingDistanceMatrix";
      v13[69] = @"parameter_distance_threshold";
      v13[70] = @"parameter_filter_size";
      v13[71] = @"parameter_syncClustersToHealhtKit";
      v13[72] = @"parameter_syncClustersToWatch";
      v13[73] = @"sync_from_healthkit_count_final_local_clusters";
      v13[74] = @"sync_from_healthkit_count_final_remote_clusters";
      v13[75] = @"sync_from_healthkit_count_local_clusters";
      v13[76] = @"sync_from_healthkit_count_remote_clusters";
      v13[77] = @"sync_from_healthkit_footprint_delta";
      v13[78] = @"sync_from_healthkit_is_success";
      v13[79] = @"sync_from_healthkit_time_elapsed";
      v13[80] = @"sync_to_healthkit_average_time_save_new_cluster";
      v13[81] = @"sync_to_healthkit_average_time_snapshot";
      v13[82] = @"sync_to_healthkit_average_time_update_cluster";
      v13[83] = @"sync_to_healthkit_footprint_delta";
      v13[84] = @"sync_to_healthkit_is_success";
      v13[85] = @"sync_to_healthkit_max_time_save_new_cluster";
      v13[86] = @"sync_to_healthkit_max_time_snapshot";
      v13[87] = @"sync_to_healthkit_max_time_update_cluster";
      v13[88] = @"sync_to_healthkit_min_time_save_new_cluster";
      v13[89] = @"sync_to_healthkit_min_time_snapshot";
      v13[90] = @"sync_to_healthkit_min_time_update_cluster";
      v13[91] = @"sync_to_healthkit_time_elapsed";
      v13[92] = @"sync_to_watch_count_clusters";
      v13[93] = @"sync_to_watch_footprint_delta";
      v13[94] = @"sync_to_watch_is_success";
      v13[95] = @"sync_to_watch_time_elapsed";
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v13;
      uint64_t v8 = 96;
      goto LABEL_7;
    case 4uLL:
      v12[0] = @"count_clusters_existing";
      v12[1] = @"count_clusters_existing_zero_relevance";
      v12[2] = @"count_clusters_existing_greaterthanzero_relevance";
      v12[3] = @"count_clusters_new_zero_relevance";
      v12[4] = @"count_clusters_new_greaterthanzero_relevance";
      v12[5] = @"count_clusters_relevance_decreased";
      v12[6] = @"count_clusters_relevance_increased";
      v12[7] = @"count_clusters_relevance_score_not_updated";
      v12[8] = @"count_clusters_relevance_score_updated";
      v12[9] = @"count_clusters_relevance_to_zero";
      v12[10] = @"count_clusters_zero_to_relevance";
      v12[11] = @"footprint_delta";
      v12[12] = @"time_elapsed";
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v12;
      uint64_t v8 = 13;
LABEL_7:
      uint64_t v9 = [v6 arrayWithObjects:v7 count:v8];
      break;
    default:
      uint64_t v9 = [MEMORY[0x1E4F1C978] array];
      break;
  }
  char v10 = (void *)v9;

  return v10;
}

- (BOOL)_computeMetricsForClustersEventWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E016D870]();
    id v14 = 0;
    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_workouts" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v14];
    id v8 = v14;
    if (!v8)
    {
      id v13 = 0;
      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"duration" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B30 gap:&unk_1F3451B18 error:&v13];
      id v8 = v13;
      if (!v8)
      {
        id v12 = 0;
        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"total_distance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B48 gap:&unk_1F3451B18 error:&v12];
        id v8 = v12;
      }
    }
    if (a4) {
      *a4 = v8;
    }
    BOOL v9 = v8 == 0;
  }
  else
  {
    char v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"data");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForProcessNewWorkoutEventWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E016D870]();
    id v14 = 0;
    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v14];
    id v8 = v14;
    if (!v8)
    {
      id v13 = 0;
      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"time_elapsed_mini_worldbuild_check" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v13];
      id v8 = v13;
      if (!v8)
      {
        id v12 = 0;
        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"time_elapsed_reference_route_cluster_check" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v12];
        id v8 = v12;
      }
    }
    if (a4) {
      *a4 = v8;
    }
    BOOL v9 = v8 == 0;
  }
  else
  {
    char v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"data");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForProcessWorkoutsEventWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E016D870]();
    id v96 = 0;
    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_average_cluster_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v96];
    id v8 = v96;
    if (!v8)
    {
      id v95 = 0;
      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_count_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v95];
      id v8 = v95;
      if (!v8)
      {
        id v94 = 0;
        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v94];
        id v8 = v94;
        if (!v8)
        {
          id v93 = 0;
          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_max_cluster_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v93];
          id v8 = v93;
          if (!v8)
          {
            id v92 = 0;
            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_min_cluster_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v92];
            id v8 = v92;
            if (!v8)
            {
              id v91 = 0;
              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_percentage_workouts_clustered" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BA8 gap:&unk_1F3451B18 error:&v91];
              id v8 = v91;
              if (!v8)
              {
                id v90 = 0;
                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"clustering_time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v90];
                id v8 = v90;
                if (!v8)
                {
                  id v89 = 0;
                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matric_count_prefiltercache" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v89];
                  id v8 = v89;
                  if (!v8)
                  {
                    id v88 = 0;
                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_already_computed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v88];
                    id v8 = v88;
                    if (!v8)
                    {
                      id v87 = 0;
                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_exceeded_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v87];
                      id v8 = v87;
                      if (!v8)
                      {
                        id v86 = 0;
                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_exceeded_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v86];
                        id v8 = v86;
                        if (!v8)
                        {
                          id v85 = 0;
                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_lessthan_orequal_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v85];
                          id v8 = v85;
                          if (!v8)
                          {
                            id v84 = 0;
                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_lessthan_orequal_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v84];
                            id v8 = v84;
                            if (!v8)
                            {
                              id v83 = 0;
                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_centroid" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v83];
                              id v8 = v83;
                              if (!v8)
                              {
                                id v82 = 0;
                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_firstlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v82];
                                id v8 = v82;
                                if (!v8)
                                {
                                  id v81 = 0;
                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_iou" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v81];
                                  id v8 = v81;
                                  if (!v8)
                                  {
                                    id v80 = 0;
                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_lastlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v80];
                                    id v8 = v80;
                                    if (!v8)
                                    {
                                      id v79 = 0;
                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_locationscount" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v79];
                                      id v8 = v79;
                                      if (!v8)
                                      {
                                        id v78 = 0;
                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_average_time_prefiltered_metadata" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v78];
                                        id v8 = v78;
                                        if (!v8)
                                        {
                                          id v77 = 0;
                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_already_computed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v77];
                                          id v8 = v77;
                                          if (!v8)
                                          {
                                            id v76 = 0;
                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_both_workouts_decimated" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v76];
                                            id v8 = v76;
                                            if (!v8)
                                            {
                                              id v75 = 0;
                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_exceeded_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v75];
                                              id v8 = v75;
                                              if (!v8)
                                              {
                                                id v74 = 0;
                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_exceeded_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v74];
                                                id v8 = v74;
                                                if (!v8)
                                                {
                                                  id v73 = 0;
                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_lessthan_orequal_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v73];
                                                  id v8 = v73;
                                                  if (!v8)
                                                  {
                                                    id v72 = 0;
                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_lessthan_orequal_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v72];
                                                    id v8 = v72;
                                                    if (!v8)
                                                    {
                                                      id v71 = 0;
                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_no_workout_decimated" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v71];
                                                      id v8 = v71;
                                                      if (!v8)
                                                      {
                                                        id v70 = 0;
                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_centroid" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v70];
                                                        id v8 = v70;
                                                        if (!v8)
                                                        {
                                                          id v69 = 0;
                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_firstlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v69];
                                                          id v8 = v69;
                                                          if (!v8)
                                                          {
                                                            id v68 = 0;
                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_iou" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v68];
                                                            id v8 = v68;
                                                            if (!v8)
                                                            {
                                                              id v67 = 0;
                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_lastlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v67];
                                                              id v8 = v67;
                                                              if (!v8)
                                                              {
                                                                id v66 = 0;
                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_locationscount" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v66];
                                                                id v8 = v66;
                                                                if (!v8)
                                                                {
                                                                  id v65 = 0;
                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_prefiltered_metadata" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v65];
                                                                  id v8 = v65;
                                                                  if (!v8)
                                                                  {
                                                                    id v64 = 0;
                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_count_single_workout_decimated" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v64];
                                                                    id v8 = v64;
                                                                    if (!v8)
                                                                    {
                                                                      id v63 = 0;
                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_final_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v63];
                                                                      id v8 = v63;
                                                                      if (!v8)
                                                                      {
                                                                        id v62 = 0;
                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v62];
                                                                        id v8 = v62;
                                                                        if (!v8)
                                                                        {
                                                                          id v61 = 0;
                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_initial_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v61];
                                                                          id v8 = v61;
                                                                          if (!v8)
                                                                          {
                                                                            id v60 = 0;
                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_already_computed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v60];
                                                                            id v8 = v60;
                                                                            if (!v8)
                                                                            {
                                                                              id v59 = 0;
                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_exceeded_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v59];
                                                                              id v8 = v59;
                                                                              if (!v8)
                                                                              {
                                                                                id v58 = 0;
                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_exceeded_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v58];
                                                                                id v8 = v58;
                                                                                if (!v8)
                                                                                {
                                                                                  id v57 = 0;
                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_lessthan_orequal_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v57];
                                                                                  id v8 = v57;
                                                                                  if (!v8)
                                                                                  {
                                                                                    id v56 = 0;
                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_lessthan_orequal_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v56];
                                                                                    id v8 = v56;
                                                                                    if (!v8)
                                                                                    {
                                                                                      id v55 = 0;
                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_centroid" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v55];
                                                                                      id v8 = v55;
                                                                                      if (!v8)
                                                                                      {
                                                                                        id v54 = 0;
                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_firstlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v54];
                                                                                        id v8 = v54;
                                                                                        if (!v8)
                                                                                        {
                                                                                          id v53 = 0;
                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_iou" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v53];
                                                                                          id v8 = v53;
                                                                                          if (!v8)
                                                                                          {
                                                                                            id v52 = 0;
                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_lastlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v52];
                                                                                            id v8 = v52;
                                                                                            if (!v8)
                                                                                            {
                                                                                              id v51 = 0;
                                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_locationscount" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v51];
                                                                                              id v8 = v51;
                                                                                              if (!v8)
                                                                                              {
                                                                                                id v50 = 0;
                                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_max_time_prefiltered_metadata" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v50];
                                                                                                id v8 = v50;
                                                                                                if (!v8)
                                                                                                {
                                                                                                  id v49 = 0;
                                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_already_computed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v49];
                                                                                                  id v8 = v49;
                                                                                                  if (!v8)
                                                                                                  {
                                                                                                    id v48 = 0;
                                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_exceeded_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v48];
                                                                                                    id v8 = v48;
                                                                                                    if (!v8)
                                                                                                    {
                                                                                                      id v47 = 0;
                                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_exceeded_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v47];
                                                                                                      id v8 = v47;
                                                                                                      if (!v8)
                                                                                                      {
                                                                                                        id v46 = 0;
                                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_lessthan_orequal_dtw" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v46];
                                                                                                        id v8 = v46;
                                                                                                        if (!v8)
                                                                                                        {
                                                                                                          id v45 = 0;
                                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_lessthan_orequal_quicksimilarity" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v45];
                                                                                                          id v8 = v45;
                                                                                                          if (!v8)
                                                                                                          {
                                                                                                            id v44 = 0;
                                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_centroid" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v44];
                                                                                                            id v8 = v44;
                                                                                                            if (!v8)
                                                                                                            {
                                                                                                              id v43 = 0;
                                                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_firstlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v43];
                                                                                                              id v8 = v43;
                                                                                                              if (!v8)
                                                                                                              {
                                                                                                                id v42 = 0;
                                                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_iou" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v42];
                                                                                                                id v8 = v42;
                                                                                                                if (!v8)
                                                                                                                {
                                                                                                                  id v41 = 0;
                                                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_lastlocation" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v41];
                                                                                                                  id v8 = v41;
                                                                                                                  if (!v8)
                                                                                                                  {
                                                                                                                    id v40 = 0;
                                                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_locationscount" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v40];
                                                                                                                    id v8 = v40;
                                                                                                                    if (!v8)
                                                                                                                    {
                                                                                                                      id v39 = 0;
                                                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_min_time_prefiltered_metadata" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v39];
                                                                                                                      id v8 = v39;
                                                                                                                      if (!v8)
                                                                                                                      {
                                                                                                                        id v38 = 0;
                                                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v38];
                                                                                                                        id v8 = v38;
                                                                                                                        if (!v8)
                                                                                                                        {
                                                                                                                          id v37 = 0;
                                                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"distance_matrix_total_number_of_comparisons" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BD8 gap:&unk_1F3451BA8 error:&v37];
                                                                                                                          id v8 = v37;
                                                                                                                          if (!v8)
                                                                                                                          {
                                                                                                                            id v36 = 0;
                                                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"number_of_workouts_cycling" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v36];
                                                                                                                            id v8 = v36;
                                                                                                                            if (!v8)
                                                                                                                            {
                                                                                                                              id v35 = 0;
                                                                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"number_of_workouts_running" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v35];
                                                                                                                              id v8 = v35;
                                                                                                                              if (!v8)
                                                                                                                              {
                                                                                                                                id v34 = 0;
                                                                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"number_of_workouts_wheel_chair_run_pace" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v34];
                                                                                                                                id v8 = v34;
                                                                                                                                if (!v8)
                                                                                                                                {
                                                                                                                                  id v33 = 0;
                                                                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"parameter_distance_threshold" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BF0 gap:&unk_1F3451B18 error:&v33];
                                                                                                                                  id v8 = v33;
                                                                                                                                  if (!v8)
                                                                                                                                  {
                                                                                                                                    id v32 = 0;
                                                                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"parameter_filter_size" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B00 gap:&unk_1F3451B18 error:&v32];
                                                                                                                                    id v8 = v32;
                                                                                                                                    if (!v8)
                                                                                                                                    {
                                                                                                                                      id v31 = 0;
                                                                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_count_final_local_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v31];
                                                                                                                                      id v8 = v31;
                                                                                                                                      if (!v8)
                                                                                                                                      {
                                                                                                                                        id v30 = 0;
                                                                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_count_final_remote_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v30];
                                                                                                                                        id v8 = v30;
                                                                                                                                        if (!v8)
                                                                                                                                        {
                                                                                                                                          id v29 = 0;
                                                                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_count_local_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v29];
                                                                                                                                          id v8 = v29;
                                                                                                                                          if (!v8)
                                                                                                                                          {
                                                                                                                                            id v28 = 0;
                                                                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_count_remote_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v28];
                                                                                                                                            id v8 = v28;
                                                                                                                                            if (!v8)
                                                                                                                                            {
                                                                                                                                              id v27 = 0;
                                                                                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v27];
                                                                                                                                              id v8 = v27;
                                                                                                                                              if (!v8)
                                                                                                                                              {
                                                                                                                                                id v26 = 0;
                                                                                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_from_healthkit_time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v26];
                                                                                                                                                id v8 = v26;
                                                                                                                                                if (!v8)
                                                                                                                                                {
                                                                                                                                                  id v25 = 0;
                                                                                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_average_time_save_new_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v25];
                                                                                                                                                  id v8 = v25;
                                                                                                                                                  if (!v8)
                                                                                                                                                  {
                                                                                                                                                    id v24 = 0;
                                                                                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_average_time_snapshot" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v24];
                                                                                                                                                    id v8 = v24;
                                                                                                                                                    if (!v8)
                                                                                                                                                    {
                                                                                                                                                      id v23 = 0;
                                                                                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_average_time_update_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v23];
                                                                                                                                                      id v8 = v23;
                                                                                                                                                      if (!v8)
                                                                                                                                                      {
                                                                                                                                                        id v22 = 0;
                                                                                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v22];
                                                                                                                                                        id v8 = v22;
                                                                                                                                                        if (!v8)
                                                                                                                                                        {
                                                                                                                                                          id v21 = 0;
                                                                                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_max_time_save_new_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v21];
                                                                                                                                                          id v8 = v21;
                                                                                                                                                          if (!v8)
                                                                                                                                                          {
                                                                                                                                                            id v20 = 0;
                                                                                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_max_time_snapshot" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v20];
                                                                                                                                                            id v8 = v20;
                                                                                                                                                            if (!v8)
                                                                                                                                                            {
                                                                                                                                                              id v19 = 0;
                                                                                                                                                              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_max_time_update_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v19];
                                                                                                                                                              id v8 = v19;
                                                                                                                                                              if (!v8)
                                                                                                                                                              {
                                                                                                                                                                id v18 = 0;
                                                                                                                                                                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_min_time_save_new_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v18];
                                                                                                                                                                id v8 = v18;
                                                                                                                                                                if (!v8)
                                                                                                                                                                {
                                                                                                                                                                  id v17 = 0;
                                                                                                                                                                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_min_time_snapshot" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v17];
                                                                                                                                                                  id v8 = v17;
                                                                                                                                                                  if (!v8)
                                                                                                                                                                  {
                                                                                                                                                                    id v16 = 0;
                                                                                                                                                                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_min_time_update_cluster" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451BC0 gap:&unk_1F3451B18 error:&v16];
                                                                                                                                                                    id v8 = v16;
                                                                                                                                                                    if (!v8)
                                                                                                                                                                    {
                                                                                                                                                                      id v15 = 0;
                                                                                                                                                                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_healthkit_time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v15];
                                                                                                                                                                      id v8 = v15;
                                                                                                                                                                      if (!v8)
                                                                                                                                                                      {
                                                                                                                                                                        id v14 = 0;
                                                                                                                                                                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_watch_count_clusters" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v14];
                                                                                                                                                                        id v8 = v14;
                                                                                                                                                                        if (!v8)
                                                                                                                                                                        {
                                                                                                                                                                          id v13 = 0;
                                                                                                                                                                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_watch_footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v13];
                                                                                                                                                                          id v8 = v13;
                                                                                                                                                                          if (!v8)
                                                                                                                                                                          {
                                                                                                                                                                            id v12 = 0;
                                                                                                                                                                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"sync_to_watch_time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v12];
                                                                                                                                                                            id v8 = v12;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (a4) {
      *a4 = v8;
    }
    BOOL v9 = v8 == 0;
  }
  else
  {
    char v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"data");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForUpdateRelevanceScoresEventWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E016D870]();
    id v24 = 0;
    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_existing" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v24];
    id v8 = v24;
    if (!v8)
    {
      id v23 = 0;
      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_existing_zero_relevance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v23];
      id v8 = v23;
      if (!v8)
      {
        id v22 = 0;
        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_existing_greaterthanzero_relevance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v22];
        id v8 = v22;
        if (!v8)
        {
          id v21 = 0;
          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_new_zero_relevance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v21];
          id v8 = v21;
          if (!v8)
          {
            id v20 = 0;
            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_new_greaterthanzero_relevance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v20];
            id v8 = v20;
            if (!v8)
            {
              id v19 = 0;
              [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_relevance_decreased" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v19];
              id v8 = v19;
              if (!v8)
              {
                id v18 = 0;
                [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_relevance_increased" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v18];
                id v8 = v18;
                if (!v8)
                {
                  id v17 = 0;
                  [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_relevance_score_not_updated" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v17];
                  id v8 = v17;
                  if (!v8)
                  {
                    id v16 = 0;
                    [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_relevance_score_updated" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v16];
                    id v8 = v16;
                    if (!v8)
                    {
                      id v15 = 0;
                      [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_relevance_to_zero" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v15];
                      id v8 = v15;
                      if (!v8)
                      {
                        id v14 = 0;
                        [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"count_clusters_zero_to_relevance" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B90 gap:&unk_1F3451B18 error:&v14];
                        id v8 = v14;
                        if (!v8)
                        {
                          id v13 = 0;
                          [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"footprint_delta" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B60 gap:&unk_1F3451B18 error:&v13];
                          id v8 = v13;
                          if (!v8)
                          {
                            id v12 = 0;
                            [(RTWorkoutMetricsManager *)self _updateNSNumberMetricsData:v6 key:@"time_elapsed" binsStart:&unk_1F3451AE8 binsEnd:&unk_1F3451B78 gap:&unk_1F3451B18 error:&v12];
                            id v8 = v12;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (a4) {
      *a4 = v8;
    }
    BOOL v9 = v8 == 0;
  }
  else
  {
    char v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"data");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_updateNSNumberMetricsData:(id)a3 key:(id)a4 binsStart:(id)a5 binsEnd:(id)a6 gap:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = v17;
  if (!v13)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (!a8) {
      goto LABEL_23;
    }
    id v25 = @"data";
    goto LABEL_22;
  }
  if (!v15)
  {
    id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v32 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: binsStart", v32, 2u);
    }

    if (!a8) {
      goto LABEL_23;
    }
    id v25 = @"binsStart";
    goto LABEL_22;
  }
  if (!v16)
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v31 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: binsEnd", v31, 2u);
    }

    if (!a8) {
      goto LABEL_23;
    }
    id v25 = @"binsEnd";
LABEL_22:
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    BOOL v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!v17)
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v30 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: gap", v30, 2u);
    }

    if (a8)
    {
      id v25 = @"gap";
      goto LABEL_22;
    }
LABEL_23:
    BOOL v23 = 0;
    goto LABEL_24;
  }
  id v19 = (void *)MEMORY[0x1E016D870]();
  id v20 = [v13 objectForKeyedSubscript:v14];
  id v21 = +[RTMetric binsFromStart:v15 toEnd:v16 gap:v18];
  id v22 = +[RTMetric binForNumber:v20 bins:v21];

  [v13 setObject:v22 forKeyedSubscript:v14];
  BOOL v23 = 1;
LABEL_24:

  return v23;
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end