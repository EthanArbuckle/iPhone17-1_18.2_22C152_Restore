@interface MNTraceLoader
- (BOOL)_executeQuery:(id)a3 rowHandler:(id)a4;
- (BOOL)_loadAnnotatedUserBehaviorTable;
- (BOOL)_loadAnnotatedUserEnvironmentTable;
- (BOOL)_loadCompassHeadingDataTable;
- (BOOL)_loadDirectionsTableAllowDeprecatedProtocol:(BOOL)a3 outError:(id *)a4;
- (BOOL)_loadETAUpdatesTable;
- (BOOL)_loadEVDataTable;
- (BOOL)_loadInfoTable;
- (BOOL)_loadLocationsTable:(BOOL)a3;
- (BOOL)_loadMiscInfo;
- (BOOL)_loadMotionDataTable;
- (BOOL)_loadNavigationEventsTable;
- (BOOL)_loadNavigationUpdatesTable;
- (BOOL)_loadNetworkEvents;
- (BOOL)_loadRouteCreationActionsTable;
- (BOOL)_loadTraceVersion;
- (BOOL)_loadVehicleDataTable;
- (BOOL)_tableExists:(id)a3;
- (BOOL)_updateTraceFromVersion:(unint64_t)a3 outError:(id *)a4;
- (BOOL)loadExtraData;
- (id)_errorWithCode:(int64_t)a3 errorDescriptionFormat:(id)a4;
- (id)_handleUpdateError;
- (id)loadTraceWithPath:(id)a3 options:(int64_t)a4 outError:(id *)a5;
- (id)loadTraceWithPath:(id)a3 outError:(id *)a4;
- (id)trace;
@end

@implementation MNTraceLoader

- (id)loadTraceWithPath:(id)a3 outError:(id *)a4
{
  return [(MNTraceLoader *)self loadTraceWithPath:a3 options:15355 outError:a4];
}

- (id)loadTraceWithPath:(id)a3 options:(int64_t)a4 outError:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = objc_alloc_init(MNTrace);
  if (![(MNTrace *)v9 openTrace:v8 outError:a5])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

LABEL_9:
      v14 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to open trace: %@";
LABEL_7:
    _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_trace, v9);
  [(MNTraceLoader *)self _loadTraceVersion];
  unint64_t v10 = [(MNTrace *)self->_trace version];
  if (v10 <= +[MNTrace currentVersion])
  {
    if (![(MNTraceLoader *)self _updateTraceFromVersion:[(MNTrace *)self->_trace version] outError:a5])
    {
      v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "Failed to update trace to current version: %@", buf, 0xCu);
      }

      if (a5 && !*a5)
      {
        id v18 = [(MNTraceLoader *)self _errorWithCode:0 errorDescriptionFormat:@"Unknown error."];
        *a5 = v18;
      }
      goto LABEL_9;
    }
  }
  else if (a5)
  {
    id v11 = [(MNTraceLoader *)self _errorWithCode:6, @"Attempting to open trace with version %d which is newer than this build's version of %d. Forward compatibility usually works, but is not guaranteed.", [(MNTrace *)self->_trace version], +[MNTrace currentVersion] errorDescriptionFormat];
    *a5 = v11;
  }
  if ((a4 & 1) != 0 && ![(MNTraceLoader *)self _loadInfoTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load info table for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 2) != 0 && ![(MNTraceLoader *)self _loadLocationsTable:(~a4 & 6) == 0])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load locations for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 8) != 0
    && ![(MNTraceLoader *)self _loadDirectionsTableAllowDeprecatedProtocol:(~a4 & 0xFFFFFFFF80000008) == 0 outError:a5])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load direction for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x10) != 0 && ![(MNTraceLoader *)self _loadETAUpdatesTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load ETA updates for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x20) != 0 && ![(MNTraceLoader *)self _loadCompassHeadingDataTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load compass heading data for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x40) != 0 && ![(MNTraceLoader *)self _loadMotionDataTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load motion data for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x80) != 0 && ![(MNTraceLoader *)self _loadVehicleDataTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load vehicle data for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x100) != 0 && ![(MNTraceLoader *)self _loadEVDataTable])
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "Failed to load ev data for trace: %@", buf, 0xCu);
    }
  }
  if ((a4 & 0x200) != 0 && ![(MNTraceLoader *)self _loadNavigationEventsTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load navigation events table for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x400) != 0)
  {
    if (![(MNTraceLoader *)self _loadAnnotatedUserBehaviorTable])
    {
      v12 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      v13 = "Failed to load annotated user behavior for trace: %@";
      goto LABEL_7;
    }
    if (![(MNTraceLoader *)self _loadAnnotatedUserEnvironmentTable])
    {
      v12 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      v13 = "Failed to load annotated user environment for trace: %@";
      goto LABEL_7;
    }
  }
  if ((a4 & 0x800) != 0 && ![(MNTraceLoader *)self _loadMiscInfo])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load misc info table for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x1000) != 0 && ![(MNTraceLoader *)self _loadNavigationUpdatesTable])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to navigation updates table for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x2000) != 0 && ![(MNTraceLoader *)self _loadNetworkEvents])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load network event table for trace: %@";
    goto LABEL_7;
  }
  if ((a4 & 0x4000) != 0 && ![(MNTraceLoader *)self _loadRouteCreationActionsTable])
  {
    v12 = MNGetMNTraceLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load route creation actions table for trace: %@";
    goto LABEL_7;
  }
  if (![(MNTraceLoader *)self loadExtraData])
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    v13 = "Failed to load extra data for trace: %@";
    goto LABEL_7;
  }
  v14 = v9;
LABEL_10:

  return v14;
}

- (BOOL)_loadInfoTable
{
  trace = self->_trace;
  id v15 = 0;
  v4 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"SELECT trace_type, recording_start_time, directions_start_time, navigation_start_time, navigation_end_time, simulation, original_version FROM info LIMIT 1" outError:&v15];
  id v5 = v15;
  if (!v5 && [v4 stepRow])
  {
    do
    {
      -[MNTrace setTraceType:](self->_trace, "setTraceType:", (int)[v4 columnInt:0]);
      [v4 columnDouble:1];
      if (v6 > 0.0)
      {
        v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        [(MNTrace *)self->_trace setRecordingStartDate:v7];
      }
      [v4 columnDouble:2];
      if (v8 > 0.0)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        [(MNTrace *)self->_trace setDirectionsStartDate:v9];
      }
      [v4 columnDouble:3];
      if (v10 > 0.0)
      {
        id v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        [(MNTrace *)self->_trace setNavigationStartDate:v11];
      }
      [v4 columnDouble:4];
      if (v12 > 0.0)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        [(MNTrace *)self->_trace setNavigationEndDate:v13];
      }
      -[MNTrace setIsSimulation:](self->_trace, "setIsSimulation:", [v4 columnInt:5] != 0);
      -[MNTrace setOriginalVersion:](self->_trace, "setOriginalVersion:", (int)[v4 columnInt:6]);
    }
    while (([v4 stepRow] & 1) != 0);
  }

  return v5 == 0;
}

- (BOOL)_loadLocationsTable:(BOOL)a3
{
  BOOL v3 = a3;
  v75 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [[_TtC10Navigation29MNTraceSelectStatementBuilder alloc] initWithTrace:self->_trace tableName:@"locations"];
  [(MNTraceSelectStatementBuilder *)v5 addColumns:&unk_1F0E35808];
  BOOL v74 = v3;
  if (v3) {
    [(MNTraceSelectStatementBuilder *)v5 addColumns:&unk_1F0E35820];
  }
  double v6 = [(MNTraceSelectStatementBuilder *)v5 selectStatement];
  v7 = v6;
  if (v6)
  {
    v72 = v5;
    v73 = self;
    if ([v6 stepRow])
    {
      do
      {
        double v8 = objc_alloc_init(MNTraceLocationRow);
        [v7 doubleValue:@"db_timestamp"];
        -[MNTraceLocationRow setTimestamp:](v8, "setTimestamp:");
        -[MNTraceLocationRow setLocationEventType:](v8, "setLocationEventType:", [v7 intValue:@"event_type"]);
        -[MNTraceLocationRow setOriginalMatchType:](v8, "setOriginalMatchType:", [v7 intValue:@"match_type"]);
        v9 = [v7 objectValue:@"error_data" ofClass:objc_opt_class()];
        [(MNTraceLocationRow *)v8 setError:v9];

        if (v74)
        {
          [v7 doubleValue:@"corrected_latitude"];
          double v11 = v10;
          [v7 doubleValue:@"corrected_longitude"];
          -[MNTraceLocationRow setCorrectedCoordinate:](v8, "setCorrectedCoordinate:", v11, v12);
          [v7 doubleValue:@"corrected_course"];
          -[MNTraceLocationRow setCorrectedCourse:](v8, "setCorrectedCourse:");
        }
        uint64_t v13 = [v7 intValue:@"match_info_quality"];
        if (v13)
        {
          uint64_t v14 = v13;
          [v7 doubleValue:@"match_info_latitude"];
          CLLocationDegrees v16 = v15;
          [v7 doubleValue:@"match_info_longitude"];
          CLLocationDegrees v18 = v17;
          [v7 doubleValue:@"match_info_course"];
          double v20 = v19;
          uint64_t v21 = [v7 intValue:@"match_info_form_of_way"];
          uint64_t v22 = [v7 intValue:@"match_info_road_class"];
          BOOL v23 = [v7 intValue:@"match_info_shifted"] != 0;
          v24 = [MNLocationMatchInfo alloc];
          CLLocationCoordinate2D v25 = CLLocationCoordinate2DMake(v16, v18);
          v26 = -[MNLocationMatchInfo initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:](v24, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:", v14, v21, v22, v23, v25.latitude, v25.longitude, v20);
          [(MNTraceLocationRow *)v8 setMatchInfo:v26];
        }
        else
        {
          v26 = 0;
        }
        [v7 doubleValue:@"cl_timestamp"];
        uint64_t v82 = v27;
        [v7 doubleValue:@"latitude"];
        uint64_t v81 = v28;
        [v7 doubleValue:@"longitude"];
        uint64_t v80 = v29;
        [v7 doubleValue:@"horizontal_accuracy"];
        uint64_t v79 = v30;
        [v7 doubleValue:@"altitude"];
        uint64_t v78 = v31;
        [v7 doubleValue:@"vertical_accuracy"];
        uint64_t v83 = v32;
        [v7 doubleValue:@"speed"];
        uint64_t v34 = v33;
        [v7 doubleValue:@"speed_accuracy"];
        uint64_t v36 = v35;
        [v7 doubleValue:@"course"];
        uint64_t v38 = v37;
        [v7 doubleValue:@"course_accuracy"];
        uint64_t v40 = v39;
        int v41 = [v7 intValue:@"type"];
        int v42 = [v7 intValue:@"reference_frame"];
        int v43 = [v7 intValue:@"raw_reference_frame"];
        [v7 doubleValue:@"raw_latitude"];
        uint64_t v45 = v44;
        [v7 doubleValue:@"raw_longitude"];
        uint64_t v47 = v46;
        [v7 doubleValue:@"raw_course"];
        uint64_t v49 = v48;
        if (v26)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F1E620]);
          uint64_t v51 = [(MNLocationMatchInfo *)v26 matchQuality];
          [(MNLocationMatchInfo *)v26 matchCoordinate];
          uint64_t v76 = v49;
          uint64_t v77 = v45;
          uint64_t v52 = v40;
          uint64_t v53 = v38;
          uint64_t v54 = v36;
          double v56 = v55;
          uint64_t v57 = v47;
          uint64_t v58 = v34;
          double v60 = v59;
          [(MNLocationMatchInfo *)v26 matchCourse];
          double v62 = v61;
          uint64_t v63 = [(MNLocationMatchInfo *)v26 matchFormOfWay];
          uint64_t v64 = [(MNLocationMatchInfo *)v26 matchRoadClass];
          uint64_t v65 = [(MNLocationMatchInfo *)v26 matchShifted];
          double v66 = v56;
          uint64_t v36 = v54;
          uint64_t v38 = v53;
          uint64_t v40 = v52;
          double v67 = v60;
          uint64_t v34 = v58;
          uint64_t v47 = v57;
          uint64_t v49 = v76;
          uint64_t v45 = v77;
          v68 = objc_msgSend(v50, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", v51, v63, v64, v65, 0, v66, v67, v62);
        }
        else
        {
          v68 = 0;
        }
        v69 = [MNLocation alloc];
        int v84 = 0xFFFF;
        uint64_t v85 = v81;
        uint64_t v86 = v80;
        uint64_t v87 = v79;
        uint64_t v88 = v78;
        uint64_t v89 = v83;
        uint64_t v90 = v34;
        uint64_t v91 = v36;
        uint64_t v92 = v38;
        uint64_t v93 = v40;
        uint64_t v94 = v82;
        int v95 = 0;
        unint64_t v96 = 0xBFF0000000000000;
        int v97 = v41;
        uint64_t v98 = v45;
        uint64_t v99 = v47;
        uint64_t v100 = v49;
        uint64_t v101 = 0;
        int v102 = v42;
        int v103 = v43;
        uint64_t v104 = 0;
        uint64_t v105 = 0;
        v70 = [(MNLocation *)v69 initWithClientLocation:&v84 matchInfo:v68];
        [(MNTraceLocationRow *)v8 setLocation:v70];
        [v75 addObject:v8];
      }
      while (([v7 stepRow] & 1) != 0);
    }
    [(MNTrace *)v73->_trace setLocations:v75];
    id v5 = v72;
  }

  return v7 != 0;
}

- (BOOL)_loadDirectionsTableAllowDeprecatedProtocol:(BOOL)a3 outError:(id *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  double v66 = self;
  trace = self->_trace;
  id v83 = 0;
  v7 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data, waypoints_data, selected_route_index FROM directions" outError:&v83];
  id v65 = v83;
  if (![v7 stepRow])
  {
LABEL_51:
    [(MNTrace *)v66->_trace setDirections:v5];
    uint64_t v57 = v65;
    BOOL v58 = v65 == 0;
    goto LABEL_52;
  }
  v68 = v7;
  double v62 = v5;
  while (1)
  {
    double v8 = objc_alloc_init(MNTraceDirectionsRow);
    [v7 columnDouble:0];
    -[MNTraceDirectionsRow setRequestTimestamp:](v8, "setRequestTimestamp:");
    [v7 columnDouble:1];
    -[MNTraceDirectionsRow setResponseTimestamp:](v8, "setResponseTimestamp:");
    v9 = [v7 columnData:2];
    if (v9)
    {
      double v10 = (void *)[objc_alloc(MEMORY[0x1E4F64520]) initWithData:v9];
      [(MNTraceDirectionsRow *)v8 setRequest:v10];
    }
    double v11 = [v7 columnData:3];
    if (v11) {
      break;
    }
LABEL_26:
    uint64_t v33 = [v7 columnData:4];
    if (v33)
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
      id v74 = 0;
      uint64_t v38 = [v34 unarchivedObjectOfClasses:v37 fromData:v33 error:&v74];
      id v39 = v74;
      [(MNTraceDirectionsRow *)v8 setError:v38];

      if (v39)
      {
        uint64_t v40 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v39;
          _os_log_impl(&dword_1B542B000, v40, OS_LOG_TYPE_ERROR, "Error decoding directions response error: %@", buf, 0xCu);
        }
      }
    }
    int v41 = [v7 columnData:5];
    if (!v41) {
      goto LABEL_47;
    }
    int v42 = (void *)MEMORY[0x1E4F28DC0];
    int v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    id v73 = 0;
    uint64_t v46 = [v42 unarchivedObjectOfClasses:v45 fromData:v41 error:&v73];
    id v47 = v73;
    [(MNTraceDirectionsRow *)v8 setWaypoints:v46];

    if (v47)
    {
      uint64_t v48 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v86 = v47;
        _os_log_impl(&dword_1B542B000, v48, OS_LOG_TYPE_ERROR, "Error decoding waypoints: %@", buf, 0xCu);
      }
LABEL_45:

      goto LABEL_46;
    }
    if ([(MNTrace *)v66->_trace version] <= 0x39)
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v48 = [(MNTraceDirectionsRow *)v8 waypoints];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v69 objects:v84 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v63 = v11;
        uint64_t v64 = v9;
        uint64_t v51 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v70 != v51) {
              objc_enumerationMutation(v48);
            }
            uint64_t v53 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            uint64_t v54 = [v53 waypoint];
            objc_msgSend(v53, "setIsCurrentLocation:", objc_msgSend(v54, "isCurrentLocation"));
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v69 objects:v84 count:16];
        }
        while (v50);
        id v5 = v62;
        double v11 = v63;
        v7 = v68;
        v9 = v64;
      }
      goto LABEL_45;
    }
LABEL_46:

LABEL_47:
    int v55 = [v7 columnInt:6];
    if (v55 < 0) {
      uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v56 = v55;
    }
    [(MNTraceDirectionsRow *)v8 setSelectedRouteIndex:v56];
    [v5 addObject:v8];

    if (([v7 stepRow] & 1) == 0) {
      goto LABEL_51;
    }
  }
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F64538]) initWithData:v11];
  [(MNTraceDirectionsRow *)v8 setResponse:v12];

  if (a3) {
    goto LABEL_11;
  }
  uint64_t v13 = [(MNTraceDirectionsRow *)v8 response];
  uint64_t v14 = [v13 routes];
  if (![v14 count])
  {

    goto LABEL_11;
  }
  double v15 = [(MNTraceDirectionsRow *)v8 response];
  CLLocationDegrees v16 = [v15 waypointRoutes];
  uint64_t v17 = [v16 count];

  if (v17)
  {
LABEL_11:
    CLLocationDegrees v18 = v11;
    double v19 = v9;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    double v20 = [(MNTraceDirectionsRow *)v8 response];
    uint64_t v21 = [v20 routes];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v80 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * j) setUnpackedLatLngVertices:0];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v23);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v26 = [(MNTraceDirectionsRow *)v8 response];
    uint64_t v27 = [v26 decoderData];
    uint64_t v28 = [v27 walkings];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v76 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * k) setUnpackedLatLngVertices:0];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v75 objects:v87 count:16];
      }
      while (v30);
    }

    v7 = v68;
    v9 = v19;
    double v11 = v18;
    goto LABEL_26;
  }
  if (a4)
  {
    id v60 = [(MNTraceLoader *)v66 _errorWithCode:12 errorDescriptionFormat:@"Navtrace is using a deprecated Routing protocol which is no longer supported. This trace will need to be manually re-generated."];
    *a4 = v60;
  }
  BOOL v58 = 0;
  uint64_t v57 = v65;
LABEL_52:

  return v58;
}

- (BOOL)_loadETAUpdatesTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MNTraceLoader__loadETAUpdatesTable__block_invoke;
  v7[3] = &unk_1E60FBD30;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(MNTraceLoader *)self _executeQuery:@"SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data FROM eta_traffic_updates ORDER BY request_timestamp ASC" rowHandler:v7];
  [(MNTrace *)self->_trace setEtaUpdates:v4];

  return v5;
}

void __37__MNTraceLoader__loadETAUpdatesTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double v20 = objc_alloc_init(MNTraceETAUpdateRow);
  [(MNTraceETAUpdateRow *)v20 setRequestTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceETAUpdateRow *)v20 setResponseTimestamp:sqlite3_column_double(a2, 1)];
  id v4 = sqlite3_column_blob(a2, 2);
  int v5 = sqlite3_column_bytes(a2, 2);
  if (v5)
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v5];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F64558]) initWithData:v6];
    [(MNTraceETAUpdateRow *)v20 setRequest:v7];
  }
  id v8 = sqlite3_column_blob(a2, 3);
  int v9 = sqlite3_column_bytes(a2, 3);
  if (v9)
  {
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:v9];
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F64568]) initWithData:v10];
    [(MNTraceETAUpdateRow *)v20 setResponse:v11];
  }
  double v12 = sqlite3_column_blob(a2, 4);
  int v13 = sqlite3_column_bytes(a2, 4);
  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 length:v13];
    double v15 = (void *)MEMORY[0x1E4F28DC0];
    CLLocationDegrees v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    CLLocationDegrees v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    double v19 = [v15 unarchivedObjectOfClasses:v18 fromData:v14 error:0];
    [(MNTraceETAUpdateRow *)v20 setError:v19];
  }
  [*(id *)(a1 + 32) addObject:v20];
}

- (BOOL)_loadCompassHeadingDataTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MNTraceLoader__loadCompassHeadingDataTable__block_invoke;
  v7[3] = &unk_1E60FBD30;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(MNTraceLoader *)self _executeQuery:@"SELECT relative_timestamp, true_heading, magnetic_heading, accuracy FROM compass_heading_data ORDER BY relative_timestamp ASC" rowHandler:v7];
  [(MNTrace *)self->_trace setHeadingData:v4];

  return v5;
}

void __45__MNTraceLoader__loadCompassHeadingDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceHeadingDataRow);
  [(MNTraceHeadingDataRow *)v4 setTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceHeadingDataRow *)v4 setTrueHeading:sqlite3_column_double(a2, 1)];
  [(MNTraceHeadingDataRow *)v4 setMagneticHeading:sqlite3_column_double(a2, 2)];
  [(MNTraceHeadingDataRow *)v4 setHeadingAccuracy:sqlite3_column_double(a2, 3)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_loadMotionDataTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MNTraceLoader__loadMotionDataTable__block_invoke;
  v7[3] = &unk_1E60FBD30;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(MNTraceLoader *)self _executeQuery:@"SELECT relative_timestamp, type, exit_type, confidence FROM motion_data ORDER BY relative_timestamp ASC" rowHandler:v7];
  [(MNTrace *)self->_trace setMotionData:v4];

  return v5;
}

void __37__MNTraceLoader__loadMotionDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceMotionDataRow);
  [(MNTraceMotionDataRow *)v4 setTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceMotionDataRow *)v4 setMotionType:sqlite3_column_int(a2, 1)];
  [(MNTraceMotionDataRow *)v4 setExitType:sqlite3_column_int(a2, 2)];
  [(MNTraceMotionDataRow *)v4 setConfidence:sqlite3_column_int(a2, 3)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_loadVehicleDataTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__MNTraceLoader__loadVehicleDataTable__block_invoke;
  v14[3] = &unk_1E60FBD30;
  id v4 = v3;
  id v15 = v4;
  if ([(MNTraceLoader *)self _executeQuery:@"SELECT relative_timestamp, heading FROM vehicle_heading_data ORDER BY relative_timestamp ASC" rowHandler:v14])
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __38__MNTraceLoader__loadVehicleDataTable__block_invoke_2;
    double v12 = &unk_1E60FBD30;
    id v13 = v5;
    id v6 = v5;
    BOOL v7 = [(MNTraceLoader *)self _executeQuery:@"SELECT relative_timestamp, speed FROM vehicle_speed_data ORDER BY relative_timestamp ASC" rowHandler:&v9];
    -[MNTrace setVehicleHeadingData:](self->_trace, "setVehicleHeadingData:", v4, v9, v10, v11, v12);
    [(MNTrace *)self->_trace setVehicleSpeedData:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __38__MNTraceLoader__loadVehicleDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceVehicleHeadingRow);
  [(MNTraceVehicleHeadingRow *)v4 setTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceVehicleHeadingRow *)v4 setVehicleHeading:sqlite3_column_double(a2, 1)];
  [*(id *)(a1 + 32) addObject:v4];
}

void __38__MNTraceLoader__loadVehicleDataTable__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceVehicleSpeedRow);
  [(MNTraceVehicleSpeedRow *)v4 setTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceVehicleSpeedRow *)v4 setVehicleSpeed:sqlite3_column_double(a2, 1)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_loadEVDataTable
{
  trace = self->_trace;
  v74[0] = 0;
  BOOL v3 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"SELECT relative_timestamp, absolute_timestamp, identifier, current_range_m, max_range_m, battery_percentage, min_battery_capacity_kwh, current_battery_capacity_kwh, max_battery_capacity_kwh, consumption_arguments, charging_arguments, is_charging, active_connector, vehicle_state_origin, vehicle_data FROM ev_data ORDER BY relative_timestamp ASC" outError:v74];
  id v51 = v74[0];
  id v4 = 0;
  BOOL v5 = 0;
  if ([v3 stepRow])
  {
    BOOL v5 = 0;
    id v4 = 0;
    do
    {
      [v3 columnDouble:0];
      double v7 = v6;
      [v3 columnDouble:1];
      double v9 = v8;
      uint64_t v10 = [v3 columnString:2];
      [v3 columnDouble:3];
      double v12 = v11;
      [v3 columnDouble:4];
      double v14 = v13;
      [v3 columnDouble:5];
      double v16 = v15;
      [v3 columnDouble:6];
      double v18 = v17;
      [v3 columnDouble:7];
      double v20 = v19;
      [v3 columnDouble:8];
      double v22 = v21;
      uint64_t v23 = [v3 columnString:9];
      uint64_t v24 = [v3 columnString:10];
      int v25 = [v3 columnInt:11];
      int v26 = [v3 columnInt:12];
      int v27 = [v3 columnInt:13];
      if (v27)
      {
        int v28 = v27;
        uint64_t v29 = [v3 columnData:14];
        long long v71 = v5;
        if (v29)
        {
          uint64_t v30 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:0];

          id v4 = (void *)v30;
        }
        double v67 = (void *)v29;
        long long v72 = v24;
        id v73 = v23;
        uint64_t v31 = v26;
        uint64_t v32 = v28;
        if (!v4)
        {
          uint64_t v33 = v31;
          uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4FB3E28]) initWithIdentifier:v10 displayName:@"TraceVehicle" year:0 manufacturer:0 model:0 colorHex:0 licensePlate:0 lprVehicleType:0 lprPowerType:0];
          id v4 = v34;
          if (v32 == 2)
          {
            [v34 setSiriIntentsIdentifier:v10];
          }
          else if (v32 == 1)
          {
            [v34 setIapIdentifier:v10];
          }
          uint64_t v31 = v33;
        }
        uint64_t v61 = v31;
        long long v70 = v4;
        BOOL v68 = v25 != 0;
        id v62 = objc_alloc(MEMORY[0x1E4FB3E38]);
        id v60 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
        [NSNumber numberWithDouble:v16];
        v59 = uint64_t v58 = v32;
        id v35 = objc_alloc(MEMORY[0x1E4F28E28]);
        double v66 = [MEMORY[0x1E4F291E0] meters];
        id v65 = (void *)[v35 initWithDoubleValue:v66 unit:v12];
        uint64_t v64 = [MEMORY[0x1E4F291E0] kilometers];
        uint64_t v54 = [v65 measurementByConvertingToUnit:v64];
        id v36 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v57 = [MEMORY[0x1E4F291E0] meters];
        uint64_t v56 = (void *)[v36 initWithDoubleValue:v57 unit:v14];
        int v55 = [MEMORY[0x1E4F291E0] kilometers];
        uint64_t v37 = [v56 measurementByConvertingToUnit:v55];
        id v38 = objc_alloc(MEMORY[0x1E4F28E28]);
        id v39 = v10;
        uint64_t v53 = [MEMORY[0x1E4F291B0] kilowattHours];
        uint64_t v40 = (void *)[v38 initWithDoubleValue:v53 unit:v18];
        id v41 = objc_alloc(MEMORY[0x1E4F28E28]);
        int v42 = [MEMORY[0x1E4F291B0] kilowattHours];
        int v43 = (void *)[v41 initWithDoubleValue:v42 unit:v20];
        id v44 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v45 = [MEMORY[0x1E4F291B0] kilowattHours];
        uint64_t v46 = (void *)[v44 initWithDoubleValue:v45 unit:v22];
        LOBYTE(v50) = v68;
        long long v69 = v39;
        uint64_t v63 = (void *)[v62 initWithIdentifier:v39 dateOfUpdate:v60 origin:v58 batteryPercentage:v59 currentEVRange:v54 maxEVRange:v37 minBatteryCapacity:v40 currentBatteryCapacity:v43 maxBatteryCapacity:v46 consumptionArguments:v73 chargingArguments:v72 isCharging:v50 activeConnector:v61];

        id v4 = v70;
        id v47 = (void *)[v70 copy];
        [v47 _updateWithVehicleState:v63];
        uint64_t v48 = objc_alloc_init(MNTraceEVDataRow);
        [(MNTraceEVDataRow *)v48 setTimestamp:v7];
        [(MNTraceEVDataRow *)v48 setVehicle:v47];
        BOOL v5 = v71;
        if (!v71)
        {
          BOOL v5 = [MEMORY[0x1E4F1CA48] array];
        }
        [v5 addObject:v48];

        uint64_t v10 = v69;
        uint64_t v24 = v72;
        uint64_t v23 = v73;
      }
    }
    while (([v3 stepRow] & 1) != 0);
  }
  [(MNTrace *)self->_trace setEvData:v5];

  return 1;
}

- (BOOL)_loadNavigationEventsTable
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MNTraceLoader__loadNavigationEventsTable__block_invoke;
  v5[3] = &unk_1E60FBD58;
  v5[4] = &v6;
  BOOL v3 = [(MNTraceLoader *)self _executeQuery:@"SELECT relative_timestamp, absolute_timestamp, last_location_id, event_name, event_description, navigation_events.event_id FROM navigation_events INNER JOIN navigation_event_types ON navigation_events.event_id = navigation_event_types.event_id" rowHandler:v5];
  [(MNTrace *)self->_trace setNavigationEvents:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__MNTraceLoader__loadNavigationEventsTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double v4 = sqlite3_column_double(a2, 0);
  double v5 = sqlite3_column_double(a2, 1);
  int v6 = sqlite3_column_int(a2, 2);
  double v7 = sqlite3_column_text(a2, 3);
  uint64_t v8 = sqlite3_column_text(a2, 4);
  int v9 = sqlite3_column_int(a2, 5);
  double v14 = objc_alloc_init(MNTraceNavigationEventRow);
  [(MNTraceNavigationEventRow *)v14 setRelativeTimestamp:v4];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v5];
  [(MNTraceNavigationEventRow *)v14 setDate:v10];

  if (v6 < 0) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = v6;
  }
  [(MNTraceNavigationEventRow *)v14 setLocationID:v11];
  if (v7)
  {
    double v12 = [NSString stringWithUTF8String:v7];
    [(MNTraceNavigationEventRow *)v14 setEventName:v12];

    if (v8)
    {
LABEL_6:
      double v13 = [NSString stringWithUTF8String:v8];
      [(MNTraceNavigationEventRow *)v14 setEventDescription:v13];

      goto LABEL_9;
    }
  }
  else
  {
    [(MNTraceNavigationEventRow *)v14 setEventName:0];
    if (v8) {
      goto LABEL_6;
    }
  }
  [(MNTraceNavigationEventRow *)v14 setEventDescription:0];
LABEL_9:
  [(MNTraceNavigationEventRow *)v14 setEventType:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v14];
}

- (BOOL)_loadAnnotatedUserBehaviorTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MNTraceLoader__loadAnnotatedUserBehaviorTable__block_invoke;
  v7[3] = &unk_1E60FBD30;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(MNTraceLoader *)self _executeQuery:@"SELECT timestamp, event FROM annotated_user_behavior ORDER BY timestamp ASC" rowHandler:v7];
  [(MNTrace *)self->_trace setAnnotatedUserBehavior:v4];

  return v5;
}

void __48__MNTraceLoader__loadAnnotatedUserBehaviorTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceAnnotatedUserBehaviorRow);
  [(MNTraceAnnotatedUserBehaviorRow *)v4 setTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceAnnotatedUserBehaviorRow *)v4 setEvent:sqlite3_column_int(a2, 1)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_loadAnnotatedUserEnvironmentTable
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MNTraceLoader__loadAnnotatedUserEnvironmentTable__block_invoke;
  v7[3] = &unk_1E60FBD30;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(MNTraceLoader *)self _executeQuery:@"SELECT start_timestamp, end_timestamp, environment_type FROM annotated_user_environments ORDER BY start_timestamp ASC" rowHandler:v7];
  [(MNTrace *)self->_trace setAnnotatedUserEnvironments:v4];

  return v5;
}

void __51__MNTraceLoader__loadAnnotatedUserEnvironmentTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(MNTraceAnnotatedUserEnvironmentRow);
  [(MNTraceAnnotatedUserEnvironmentRow *)v4 setStartTimestamp:sqlite3_column_double(a2, 0)];
  [(MNTraceAnnotatedUserEnvironmentRow *)v4 setEndTimestamp:sqlite3_column_double(a2, 1)];
  [(MNTraceAnnotatedUserEnvironmentRow *)v4 setEnvironmentType:sqlite3_column_int(a2, 2)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_loadNavigationUpdatesTable
{
  v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [[_TtC10Navigation29MNTraceSelectStatementBuilder alloc] initWithTrace:self->_trace tableName:@"navigation_updates"];
  [(MNTraceSelectStatementBuilder *)v4 addColumns:&unk_1F0E35838];
  BOOL v5 = [(MNTraceSelectStatementBuilder *)v4 selectStatement];
  int v6 = v5;
  if (v5)
  {
    double v18 = self;
    if ([v5 stepRow])
    {
      while (1)
      {
        uint64_t v7 = [v6 intValue:@"type"];
        if (v7 == 2) {
          break;
        }
        if (v7 == 1)
        {
          id v8 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
          [v6 doubleValue:@"timestamp"];
          -[MNTraceNavigationUpdatesRow setTimestamp:](v8, "setTimestamp:");
          v20[0] = objc_opt_class();
          v20[1] = objc_opt_class();
          int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
          uint64_t v10 = [v6 objectsValue:@"parameters" ofClasses:v9];

          uint64_t v11 = [v10 objectForKeyedSubscript:@"directionsResponseID"];
          [(MNTraceNavigationUpdatesChangeRouteRow *)v8 setDirectionsResponseID:v11];

          double v12 = [v10 objectForKeyedSubscript:@"etauResponseID"];
          [(MNTraceNavigationUpdatesChangeRouteRow *)v8 setEtauResponseID:v12];

          double v13 = [v10 objectForKeyedSubscript:@"routeIndex"];
          -[MNTraceNavigationUpdatesChangeRouteRow setRouteIndex:](v8, "setRouteIndex:", [v13 unsignedIntValue]);
          goto LABEL_7;
        }
LABEL_9:
        if (([v6 stepRow] & 1) == 0) {
          goto LABEL_10;
        }
      }
      id v8 = objc_alloc_init(MNTraceNavigationUpdatesDepartWaypointRow);
      [v6 doubleValue:@"timestamp"];
      -[MNTraceNavigationUpdatesRow setTimestamp:](v8, "setTimestamp:");
      v19[0] = objc_opt_class();
      v19[1] = objc_opt_class();
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v10 = [v6 objectsValue:@"parameters" ofClasses:v14];

      double v15 = [v10 objectForKeyedSubscript:@"waypoint"];
      [(MNTraceNavigationUpdatesChangeRouteRow *)v8 setWaypoint:v15];

      double v13 = [v10 objectForKeyedSubscript:@"legIndex"];
      -[MNTraceNavigationUpdatesChangeRouteRow setLegIndex:](v8, "setLegIndex:", [v13 unsignedIntValue]);
LABEL_7:

      double v16 = [v10 objectForKeyedSubscript:@"reason"];
      -[MNTraceNavigationUpdatesChangeRouteRow setReason:](v8, "setReason:", [v16 unsignedIntValue]);

      if (v8)
      {
        [v3 addObject:v8];
      }
      goto LABEL_9;
    }
LABEL_10:
    [(MNTrace *)v18->_trace setNavigationUpdates:v3];
  }

  return v6 != 0;
}

- (BOOL)_loadMiscInfo
{
  if (![(MNTraceLoader *)self _tableExists:@"misc_info"]) {
    return 1;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MNTraceLoader__loadMiscInfo__block_invoke;
  v5[3] = &unk_1E60FBD58;
  v5[4] = &v6;
  BOOL v3 = [(MNTraceLoader *)self _executeQuery:@"SELECT key, value FROM misc_info" rowHandler:v5];
  [(MNTrace *)self->_trace setMiscInfo:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MNTraceLoader__loadMiscInfo__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MNTraceMiscInfo);
  BOOL v5 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  [(MNTraceMiscInfo *)v4 setKey:v5];

  int v6 = sqlite3_column_type(a2, 1);
  if (v6 == 1)
  {
    [(MNTraceMiscInfo *)v4 setIntValue:sqlite3_column_int(a2, 1)];
    goto LABEL_7;
  }
  int v7 = v6;
  if (v6 == 2)
  {
    [(MNTraceMiscInfo *)v4 setDoubleValue:sqlite3_column_double(a2, 1)];
    goto LABEL_7;
  }
  if (v6 == 3)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
    [(MNTraceMiscInfo *)v4 setStringValue:v8];

LABEL_7:
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      int v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    double v13 = [(MNTraceMiscInfo *)v4 key];
    [v9 setObject:v4 forKeyedSubscript:v13];
    goto LABEL_10;
  }
  double v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Error loading row from misc_info. Type %d is not supported.", (uint8_t *)v14, 8u);
  }
LABEL_10:
}

- (BOOL)_loadNetworkEvents
{
  if ([(MNTraceLoader *)self _tableExists:@"network_events"])
  {
    trace = self->_trace;
    id v11 = 0;
    id v4 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"SELECT timestamp, wifi_on, cell_on, nlc_profile FROM network_events ORDER BY timestamp" outError:&v11];
    id v5 = v11;
    int v6 = 0;
    if ([v4 stepRow])
    {
      int v6 = 0;
      do
      {
        int v7 = objc_alloc_init(MNTraceNetworkEvent);
        [v4 columnDouble:0];
        -[MNTraceNetworkEvent setTimestamp:](v7, "setTimestamp:");
        -[MNTraceNetworkEvent setWifiEnabled:](v7, "setWifiEnabled:", [v4 columnInt:1] != 0);
        -[MNTraceNetworkEvent setCellEnabled:](v7, "setCellEnabled:", [v4 columnInt:2] != 0);
        uint64_t v8 = [v4 columnString:3];
        -[MNTraceNetworkEvent setNlcEnabled:](v7, "setNlcEnabled:", [v8 length] != 0);
        if ([v8 length]) {
          int v9 = v8;
        }
        else {
          int v9 = 0;
        }
        [(MNTraceNetworkEvent *)v7 setNlcProfile:v9];
        if (!v6)
        {
          int v6 = [MEMORY[0x1E4F1CA48] array];
        }
        [v6 addObject:v7];
      }
      while (([v4 stepRow] & 1) != 0);
    }
    [(MNTrace *)self->_trace setNetworkEvents:v6];
  }
  return 1;
}

- (BOOL)_loadRouteCreationActionsTable
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  trace = self->_trace;
  id v43 = 0;
  id v4 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data, anchor_points_data, action FROM custom_route_creation_actions" outError:&v43];
  id v5 = v43;
  int v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7;
  if (v7)
  {
    id v36 = self;
    id v37 = v5;
    BOOL v38 = v8;
    uint64_t v33 = 0;
    if ([v4 stepRow])
    {
      unint64_t v9 = 0x1E60F5000uLL;
      unint64_t v10 = 0x1E4F28000uLL;
      do
      {
        id v11 = objc_opt_new();
        [v4 columnDouble:0];
        objc_msgSend(v11, "setRequestTimestamp:");
        [v4 columnDouble:1];
        objc_msgSend(v11, "setResponseTimestamp:");
        uint64_t v12 = [v4 columnData:2];
        if (v12)
        {
          double v13 = (void *)[objc_alloc(MEMORY[0x1E4F64520]) initWithData:v12];
          [v11 setRequest:v13];
        }
        uint64_t v40 = (void *)v12;
        double v14 = [v4 columnData:3];
        if (v14)
        {
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F64538]) initWithData:v14];
          [v11 setResponse:v15];
        }
        double v16 = [v4 columnData:4];
        if (v16)
        {
          double v17 = *(void **)(v10 + 3520);
          double v18 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v19 = objc_opt_class();
          double v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
          id v42 = 0;
          double v21 = [v17 unarchivedObjectOfClasses:v20 fromData:v16 error:&v42];
          id v22 = v42;

          [v11 setError:v21];
          if (v22)
          {
            uint64_t v23 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v22;
              _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "Error decoding directions response error: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v24 = [v4 columnData:5];
        if (v24)
        {
          int v25 = *(void **)(v10 + 3520);
          uint64_t v26 = objc_opt_class();
          id v41 = 0;
          int v27 = [v25 unarchivedArrayOfObjectsOfClass:v26 fromData:v24 error:&v41];
          id v28 = v41;
          [v11 setAnchorPoints:v27];
          if (v28)
          {
            id v39 = v14;
            unint64_t v29 = v10;
            uint64_t v30 = v33;
            unint64_t v31 = v9;
            uint64_t v32 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v28;
              _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "Error decoding anchor points: %@", buf, 0xCu);
            }

            unint64_t v9 = v31;
            uint64_t v33 = v30;
            unint64_t v10 = v29;
            double v14 = v39;
          }
        }
        objc_msgSend(v11, "setAction:", (int)objc_msgSend(v4, "columnInt:", 6));
        if (!v33)
        {
          uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
        }
        [v33 addObject:v11];
      }
      while (([v4 stepRow] & 1) != 0);
    }
    [(MNTrace *)v36->_trace setRouteCreationActions:v33];
    BOOL v8 = v38;
    int v6 = v37;
  }
  else
  {
    uint64_t v33 = MNGetMNTraceLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v6;
      _os_log_impl(&dword_1B542B000, v33, OS_LOG_TYPE_ERROR, "Error loading custom_route_creation_actions table with error: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (BOOL)_loadTraceVersion
{
  BOOL v3 = [[_TtC10Navigation29MNTraceSelectStatementBuilder alloc] initWithTrace:self->_trace tableName:@"info"];
  [(MNTraceSelectStatementBuilder *)v3 addColumn:@"version"];
  id v4 = [(MNTraceSelectStatementBuilder *)v3 selectStatement];
  int v5 = [v4 stepRow];
  if (v5) {
    -[MNTrace setVersion:](self->_trace, "setVersion:", [v4 intValue:@"version"]);
  }

  return v5;
}

- (BOOL)_updateTraceFromVersion:(unint64_t)a3 outError:(id *)a4
{
  *(void *)&v27[5] = *MEMORY[0x1E4F143B8];
  if (+[MNTrace currentVersion] != a3)
  {
    if (+[MNTrace currentVersion] < a3)
    {
      BOOL v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Trace was recorded with a newer build than the current build. Trace load failed because we can't downgrade.", buf, 2u);
      }

      if (!a4) {
        return 0;
      }
      id v9 = [(MNTraceLoader *)self _errorWithCode:6, @"Attempting to update a trace with a newer trace version: %d. Current trace version: %d", a3, +[MNTrace currentVersion] errorDescriptionFormat];
      char v7 = 0;
      *a4 = v9;
LABEL_30:

      return v7;
    }
    id v25 = 0;
    unint64_t v10 = +[MNTrace upgradeSchemaFromVersion:a3 error:&v25];
    id v11 = v25;
    if (v11)
    {
      id v9 = v11;
      uint64_t v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        double v13 = [v9 localizedDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)int v27 = v13;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Error trying to upgrade trace schema: %@", buf, 0xCu);
      }
      if (a4)
      {
        id v9 = v9;
        char v7 = 0;
        *a4 = v9;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if (![v10 length]
        || (errmsg = 0,
            !sqlite3_exec(-[MNTrace db](self->_trace, "db"), (const char *)[v10 UTF8String], 0, 0, &errmsg)))
      {
        [(MNTrace *)self->_trace setVersion:+[MNTrace currentVersion]];
        trace = self->_trace;
        id v23 = 0;
        double v18 = +[MNTracePreparedStatement preparedStatementForTrace:trace statement:@"UPDATE info SET version = :version" outError:&v23];
        id v9 = v23;
        objc_msgSend(v18, "bindParameter:int:", @":version", +[MNTrace currentVersion](MNTrace, "currentVersion"));
        char v7 = [v18 execute];
        if (v7)
        {
          uint64_t v19 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = +[MNTrace currentVersion];
            *(_DWORD *)buf = 67109376;
            v27[0] = a3;
            LOWORD(v27[1]) = 1024;
            *(_DWORD *)((char *)&v27[1] + 2) = v20;
            _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEFAULT, "Successfully updated trace from version %d to %d", buf, 0xEu);
          }
        }
        else if (a4)
        {
          double v21 = [(MNTraceLoader *)self _errorWithCode:11 errorDescriptionFormat:@"Unexpected error writing new trace version."];

          id v9 = v21;
          *a4 = v9;
        }

        goto LABEL_29;
      }
      double v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error running migrator query for version %d. sqlite3 error description: \"%s\"", a3, errmsg);
      uint64_t v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v27 = v14;
        _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      double v16 = [(MNTraceLoader *)self _errorWithCode:11, @"%@", v14 errorDescriptionFormat];
      id v9 = v16;
      if (a4) {
        *a4 = v16;
      }
    }
    char v7 = 0;
    goto LABEL_29;
  }
  return 1;
}

- (BOOL)_executeQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, sqlite3_stmt *))a4;
  if (v7
    && (ppStmt = 0,
        BOOL v8 = [(MNTrace *)self->_trace db],
        id v9 = v6,
        !sqlite3_prepare_v2(v8, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), &ppStmt, 0)))
  {
    int v11 = sqlite3_step(ppStmt);
    if (v11 == 100)
    {
      do
      {
        v7[2](v7, ppStmt);
        int v12 = sqlite3_step(ppStmt);
      }
      while (v12 == 100);
      int v11 = v12;
    }
    sqlite3_finalize(ppStmt);
    BOOL v10 = v11 == 101;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_handleUpdateError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(MNTrace *)self->_trace tracePath];
  int v5 = [v4 stringByDeletingLastPathComponent];

  id v6 = [v3 attributesOfItemAtPath:v5 error:0];
  if (([v6 filePosixPermissions] & 0x80) != 0)
  {
    id v9 = [v6 fileOwnerAccountName];
    char v10 = [v9 isEqualToString:@"mobile"];

    if (v10)
    {
      char v7 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      int v11 = NSString;
      int v12 = [v6 fileOwnerAccountName];
      char v7 = [v11 stringWithFormat:@"Error updating trace because traces directory owner is '%@' instead of 'mobile'. Try running as root:\nchown mobile: %@", v12, v5];

      uint64_t v8 = 5;
    }
  }
  else
  {
    char v7 = [NSString stringWithFormat:@"Can't update trace to current version because traces directory does not have write permission set. Try running as root:\n> chmod u+w %@", v5];
    uint64_t v8 = 4;
  }
  double v13 = [(MNTrace *)self->_trace tracePath];
  double v14 = [v3 attributesOfItemAtPath:v13 error:0];

  if (([v14 filePosixPermissions] & 0x80) != 0)
  {
    double v18 = [v14 fileOwnerAccountName];
    char v19 = [v18 isEqualToString:@"mobile"];

    if (v19) {
      goto LABEL_11;
    }
    int v20 = NSString;
    double v16 = [v14 fileOwnerAccountName];
    uint64_t v21 = [(MNTrace *)self->_trace tracePath];
    uint64_t v17 = [v20 stringWithFormat:@"Can't open file because owner is '%@' instead of 'mobile'. Try running as root:\n> chown mobile: %@", v16, v21];

    uint64_t v8 = 3;
    char v7 = (void *)v21;
  }
  else
  {
    uint64_t v15 = NSString;
    double v16 = [(MNTrace *)self->_trace tracePath];
    uint64_t v17 = [v15 stringWithFormat:@"Can't update trace to current version because file is readonly. Try running as root:\n> chmod u+w %@", v16];
    uint64_t v8 = 2;
  }

  char v7 = (void *)v17;
LABEL_11:
  if (v7)
  {
    id v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  id v23 = [(MNTraceLoader *)self _errorWithCode:v8, @"%@", v7 errorDescriptionFormat];

  return v23;
}

- (BOOL)_tableExists:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[MNTrace db](self->_trace, "db"), (const char *)[@"SELECT count(*) FROM sqlite_master WHERE type='table' AND name=?" UTF8String], objc_msgSend(@"SELECT count(*) FROM sqlite_master WHERE type='table' AND name=?", "length"), &ppStmt, 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = ppStmt;
    id v7 = v4;
    sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], objc_msgSend(v7, "length"), 0);
    BOOL v5 = (sqlite3_step(ppStmt) & 0xFFFFFFFE) == 0x64 && sqlite3_column_int(ppStmt, 0) > 0;
    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (id)_errorWithCode:(int64_t)a3 errorDescriptionFormat:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v14];

  if (v7)
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"MNTraceErrorDomain", a3, v8, &v14);

  return v9;
}

- (BOOL)loadExtraData
{
  return 1;
}

- (id)trace
{
  return self->_trace;
}

- (void).cxx_destruct
{
}

@end