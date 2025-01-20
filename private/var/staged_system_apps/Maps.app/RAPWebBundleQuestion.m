@interface RAPWebBundleQuestion
- (BOOL)isAnonymous;
- (BOOL)isComplete;
- (GEORPFeedbackDynamicForm)dynamicForm;
- (RAPCommentQuestion)geotaggedPhotoCommentQuestion;
- (RAPPlace)reportedPlace;
- (RAPWebBundleQuestion)initWithReport:(id)a3 directionsRecording:(id)a4;
- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 poiCorrectionType:(int)a5 questionType:(int64_t)a6;
- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 questionType:(int64_t)a5;
- (RAPWebBundleQuestion)initWithReport:(id)a3 questionType:(int64_t)a4;
- (id)_alternateDirectionsRecording;
- (id)questionTypeAsString;
- (int64_t)questionType;
- (void)_fetchChildContainmentWithCompletion:(id)a3;
- (void)_fetchContainmentItems:(id)a3 withCompletion:(id)a4;
- (void)_fetchParentContainmentWithCompletion:(id)a3;
- (void)_fetchTransitInfoFromReportedLine:(id)a3 withCompletion:(id)a4;
- (void)_fetchTransitInfoFromStation:(id)a3 withCompletion:(id)a4;
- (void)_fillSubmissionParameters:(id)a3;
- (void)retrieveContextwithLocales:(id)a3 contextCompletion:(id)a4;
- (void)setDirectionsRecording:(id)a3;
- (void)setDynamicForm:(id)a3;
- (void)setReportedUserPath:(id)a3;
@end

@implementation RAPWebBundleQuestion

- (RAPWebBundleQuestion)initWithReport:(id)a3 questionType:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RAPWebBundleQuestion;
  result = [(RAPQuestion *)&v6 initWithReport:a3 parentQuestion:0];
  if (result) {
    result->_questionType = a4;
  }
  return result;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 questionType:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RAPWebBundleQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reportedPlace, a4);
    v11->_questionType = a5;
  }

  return v11;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 poiCorrectionType:(int)a5 questionType:(int64_t)a6
{
  result = [(RAPWebBundleQuestion *)self initWithReport:a3 place:a4 questionType:a6];
  if (result) {
    result->_poiCorrectionType = a5;
  }
  return result;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 directionsRecording:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPWebBundleQuestion;
  v8 = [(RAPQuestion *)&v11 initWithReport:a3 parentQuestion:0];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_directionsRecording, a4);
    v9->_questionType = 23;
  }

  return v9;
}

- (void)setReportedUserPath:(id)a3
{
  p_reportedUserPath = &self->_reportedUserPath;
  id v5 = a3;
  if (!-[RAPUserPathEntry isEqual:](*p_reportedUserPath, "isEqual:")) {
    objc_storeStrong((id *)p_reportedUserPath, a3);
  }
}

- (void)setDirectionsRecording:(id)a3
{
  p_directionsRecording = &self->_directionsRecording;
  id v5 = a3;
  if (!-[RAPDirectionsRecording isEqual:](*p_directionsRecording, "isEqual:")) {
    objc_storeStrong((id *)p_directionsRecording, a3);
  }
}

- (BOOL)isAnonymous
{
  v5.receiver = self;
  v5.super_class = (Class)RAPWebBundleQuestion;
  BOOL v3 = [(RAPQuestion *)&v5 isAnonymous];
  if (v3) {
    LOBYTE(v3) = self->_questionType != 10;
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 details];

  if (!v5)
  {
    objc_super v6 = objc_opt_new();
    [v4 setDetails:v6];
  }
  id v7 = [(RAPWebBundleQuestion *)self dynamicForm];
  [v4 setDynamicForm:v7];

  switch(self->_questionType)
  {
    case 1:
    case 0xALL:
      v16 = [v4 details];
      id v9 = [v16 addressPointFeedback];

      if (!v9)
      {
        id v9 = objc_alloc_init((Class)GEORPAddressFeedback);
        v17 = [v4 details];
        [v17 setAddressPointFeedback:v9];
      }
      v18 = [v9 place];

      if (!v18)
      {
        v19 = [(RAPPlace *)self->_reportedPlace mapItem];
        v20 = [v19 _geoMapItem];
        v21 = [v20 _placeData];
        [v9 setPlace:v21];
      }
      v22 = [(RAPPlace *)self->_reportedPlace placeInfo];

      if (v22)
      {
        v23 = [(RAPPlace *)self->_reportedPlace placeInfo];
        v24 = [v23 placeRequest];
        [v9 setPlaceRequest:v24];
      }
      v25 = [(RAPPlace *)self->_reportedPlace mapItem];
      unsigned int v26 = [v25 _maps_isHomeWorkOrSchool];

      if (!v26) {
        goto LABEL_80;
      }
      id v12 = [v9 personalizedMaps];
      if (!v12)
      {
        id v12 = objc_alloc_init((Class)GEORPPersonalizedMapsContext);
        [v9 setPersonalizedMaps:v12];
      }
      [v12 setAddressType:9];
      v27 = [(RAPPlace *)self->_reportedPlace mapItem];
      unsigned __int8 v28 = [v27 _maps_isHome];

      if (v28)
      {
        uint64_t v29 = 1;
      }
      else
      {
        v89 = [(RAPPlace *)self->_reportedPlace mapItem];
        unsigned __int8 v90 = [v89 _maps_isWork];

        if (v90)
        {
          uint64_t v29 = 2;
        }
        else
        {
          v114 = [(RAPPlace *)self->_reportedPlace mapItem];
          unsigned int v115 = [v114 _maps_isSchool];

          if (v115) {
            uint64_t v29 = 3;
          }
          else {
            uint64_t v29 = 0;
          }
        }
      }
      [v12 setPlaceType:v29];
      goto LABEL_79;
    case 2:
    case 9:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x18:
    case 0x19:
    case 0x1DLL:
      v8 = [v4 details];
      id v9 = [v8 poiFeedback];

      if (!v9)
      {
        id v9 = objc_alloc_init((Class)GEORPPoiFeedback);
        v10 = [v4 details];
        [v10 setPoiFeedback:v9];
      }
      [v9 setCorrectionType:self->_poiCorrectionType];
      objc_super v11 = [v9 place];

      if (v11) {
        goto LABEL_80;
      }
      id v12 = [(RAPPlace *)self->_reportedPlace mapItem];
      objc_super v13 = [v12 _geoMapItem];
      v14 = [v13 _placeData];
      [v9 setPlace:v14];
      goto LABEL_8;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 0x1CLL:
      v15 = [v4 details];
      id v9 = [v15 addMapFeedback];

      if (v9) {
        goto LABEL_80;
      }
      id v9 = objc_alloc_init((Class)GEORPAddToMapFeedback);
      [v9 setIsEntrypointReportSomethingMissing:GEOConfigGetBOOL()];
      id v12 = [v4 details];
      [v12 setAddMapFeedback:v9];
      goto LABEL_79;
    case 0xBLL:
      v39 = [v4 details];
      id v9 = [v39 localityFeedback];

      if (!v9)
      {
        id v9 = objc_alloc_init((Class)GEORPLocalityFeedback);
        v40 = [v4 details];
        [v40 setLocalityFeedback:v9];
      }
      v41 = [v9 place];

      if (!v41)
      {
        v42 = [(RAPWebBundleQuestion *)self reportedPlace];
        v43 = [v42 mapItem];
        v44 = [v43 _geoMapItem];
        v45 = [v44 _placeData];
        [v9 setPlace:v45];
      }
      v46 = [(RAPPlace *)self->_reportedPlace placeInfo];

      if (!v46) {
        goto LABEL_80;
      }
      id v12 = [(RAPWebBundleQuestion *)self reportedPlace];
      objc_super v13 = [v12 placeInfo];
      v14 = [v13 placeRequest];
      [v9 setPlaceRequest:v14];
      goto LABEL_8;
    case 0x15:
    case 0x16:
      v30 = [v4 details];
      id v9 = [v30 streetFeedback];

      if (v9) {
        goto LABEL_80;
      }
      id v9 = objc_alloc_init((Class)GEORPStreetFeedback);
      id v12 = [v4 details];
      [v12 setStreetFeedback:v9];
      goto LABEL_79;
    case 0x17:
      v47 = [v4 details];
      id v48 = [v47 directionsFeedback];

      if (!v48)
      {
        id v48 = objc_alloc_init((Class)GEORPDirectionsFeedback);
        v49 = [v4 details];
        [v49 setDirectionsFeedback:v48];
      }
      v50 = self->_directionsRecording;
      id v51 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
      reportedUserPath = self->_reportedUserPath;
      if (reportedUserPath
        && (unsigned int v53 = [(RAPUserPathEntry *)reportedUserPath routeIndex],
            [(RAPDirectionsRecording *)v50 routes],
            v54 = objc_claimAutoreleasedReturnValue(),
            id v55 = [v54 count],
            v54,
            (unint64_t)v55 > v53))
      {
        v56 = [(RAPDirectionsRecording *)v50 routes];
        uint64_t v57 = [v56 objectAtIndexedSubscript:-[RAPUserPathEntry routeIndex](self->_reportedUserPath, "routeIndex")];

        id v58 = [objc_alloc((Class)NSMutableArray) initWithObjects:v57, 0];
        [v51 setRoutes:v58];

        v59 = sub_10057670C();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = self->_reportedUserPath;
          *(_DWORD *)buf = 138412546;
          v148 = v60;
          __int16 v149 = 2112;
          id v150 = (id)v57;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "updating RAPWebBundleQuestion with reportedUserPath: %@ and singleRoute: %@", buf, 0x16u);
        }
      }
      else
      {
        v61 = [(RAPDirectionsRecording *)v50 routes];
        id v62 = [v61 mutableCopy];
        [v51 setRoutes:v62];

        v59 = sub_10057670C();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          id v63 = v51;
          v64 = self->_reportedUserPath;
          v65 = [(RAPDirectionsRecording *)v50 routes];
          *(_DWORD *)buf = 138412546;
          v148 = v64;
          id v51 = v63;
          __int16 v149 = 2048;
          id v150 = [v65 count];
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "updating RAPWebBundleQuestion with reportedUserPath: %@ and multiple routes (count: %ld)", buf, 0x16u);
        }
        uint64_t v57 = 0;
      }
      v135 = (void *)v57;
      id v136 = v48;

      uint64_t v66 = [(RAPUserPathEntry *)self->_reportedUserPath rerouteLocation];
      if (v66)
      {
        v67 = (void *)v66;
        unsigned int v68 = [(RAPUserPathEntry *)self->_reportedUserPath traversal];

        if (v68 == 2)
        {
          id v69 = objc_alloc((Class)NSMutableArray);
          v70 = [(RAPUserPathEntry *)self->_reportedUserPath rerouteLocation];
          id v71 = [v69 initWithObjects:v70, 0];
          [v51 setRerouteLocations:v71];
        }
      }
      id v72 = objc_alloc((Class)GEORPPlaceInfo);
      v73 = [(RAPDirectionsRecording *)v50 startWaypointCorrectedSearchTemplate];
      id v74 = [v72 initWithCorrectedSearch:v73];

      [v74 clearSessionId];
      id v75 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      v76 = [v74 placeRequest];
      [v75 setPlaceRequest:v76];

      v134 = v74;
      v77 = [v74 placeResponse];
      [v75 setPlaceResponse:v77];

      id v78 = objc_alloc((Class)GEORPPlaceInfo);
      v79 = [(RAPDirectionsRecording *)v50 endWaypointCorrectedSearchTemplate];
      id v80 = [v78 initWithCorrectedSearch:v79];

      [v80 clearSessionId];
      id v81 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      v82 = [v80 placeRequest];
      [v81 setPlaceRequest:v82];

      v133 = v80;
      v83 = [v80 placeResponse];
      [v81 setPlaceResponse:v83];

      v84 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v75, v81, 0);
      [v51 setDirectionsWaypointPlaceInfos:v84];

      v85 = [(RAPDirectionsRecording *)v50 startWaypoint];
      if (v85)
      {
        id v86 = objc_alloc((Class)GEORPUserSearchInput);
        v87 = [(RAPDirectionsRecording *)v50 startWaypoint];
        id v88 = [v86 initWithRAPUserSearchInput:v87];
        [v51 setStartWaypoint:v88];
      }
      else
      {
        [v51 setStartWaypoint:0];
      }

      v91 = [(RAPDirectionsRecording *)v50 endWaypoint];
      if (v91)
      {
        id v92 = objc_alloc((Class)GEORPUserSearchInput);
        v93 = [(RAPDirectionsRecording *)v50 endWaypoint];
        id v94 = [v92 initWithRAPUserSearchInput:v93];
        [v51 setEndWaypoint:v94];
      }
      else
      {
        [v51 setEndWaypoint:0];
      }
      v95 = v135;

      v96 = [(RAPDirectionsRecording *)v50 endWaypoint];
      v97 = [v96 findMyHandleID];

      if (v97) {
        [v51 setIsRouteToPerson:1];
      }
      if (!v135) {
        goto LABEL_88;
      }
      v98 = self->_reportedUserPath;
      if (!v98) {
        goto LABEL_88;
      }
      unsigned int v99 = [(RAPUserPathEntry *)v98 stepIndex];
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      v100 = [v135 routeLegs];
      v101 = (char *)[v100 countByEnumeratingWithState:&v141 objects:v146 count:16];
      if (!v101) {
        goto LABEL_73;
      }
      v102 = 0;
      uint64_t v131 = v99;
      uint64_t v132 = 0;
      uint64_t v103 = *(void *)v142;
      id v128 = v75;
      v129 = v51;
      v130 = v100;
      uint64_t v126 = *(void *)v142;
      break;
    case 0x1ALL:
    case 0x1BLL:
      v31 = [v4 details];
      id v9 = [v31 transitPoiFeedback];

      if (!v9)
      {
        id v9 = objc_alloc_init((Class)GEORPTransitPoiFeedback);
        v32 = [v4 details];
        [v32 setTransitPoiFeedback:v9];
      }
      v33 = [v4 details];
      v34 = [v33 transitPoiFeedback];
      v35 = [v34 place];

      if (v35) {
        goto LABEL_80;
      }
      id v12 = [(RAPWebBundleQuestion *)self reportedPlace];
      objc_super v13 = [v12 mapItem];
      v14 = [v13 _geoMapItem];
      v36 = [v14 _placeData];
      v37 = [v4 details];
      v38 = [v37 transitPoiFeedback];
      [v38 setPlace:v36];

LABEL_8:
LABEL_79:

LABEL_80:
      goto LABEL_81;
    default:
      goto LABEL_81;
  }
  do
  {
    v104 = 0;
    v105 = v102;
    v125 = &v102[(void)v101];
    v127 = v101;
    do
    {
      if (*(void *)v142 != v103) {
        objc_enumerationMutation(v100);
      }
      v106 = *(void **)(*((void *)&v141 + 1) + 8 * (void)v104);
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      v107 = [v106 steps];
      id v108 = [v107 countByEnumeratingWithState:&v137 objects:v145 count:16];
      if (v108)
      {
        id v109 = v108;
        uint64_t v110 = *(void *)v138;
        while (2)
        {
          uint64_t v111 = v131 - v132;
          v132 += (uint64_t)v109;
          do
          {
            if (*(void *)v138 != v110) {
              objc_enumerationMutation(v107);
            }
            if (!v111)
            {

              unint64_t v117 = (unint64_t)(v105 + 1);
              v118 = [(RAPDirectionsRecording *)v50 waypoints];
              id v119 = [v118 count];

              if (v117 >= (unint64_t)v119)
              {
                v112 = sub_10057670C();
                id v48 = v136;
                id v75 = v128;
                id v51 = v129;
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  v123 = [(RAPDirectionsRecording *)v50 waypoints];
                  id v124 = [v123 count];
                  *(_DWORD *)buf = 134218240;
                  v148 = (RAPUserPathEntry *)v117;
                  __int16 v149 = 2048;
                  id v150 = v124;
                  _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "found waypointIndex: %lu but recorded waypoints did not match: %lu", buf, 0x16u);
                }
                v95 = v135;
              }
              else
              {
                id v120 = objc_alloc((Class)GEORPUserSearchInput);
                v112 = [(RAPDirectionsRecording *)v50 waypoints];
                v121 = [v112 objectAtIndexedSubscript:v117];
                id v122 = [v120 initWithRAPUserSearchInput:v121];
                id v51 = v129;
                [v129 setEndWaypoint:v122];

                v95 = v135;
                id v48 = v136;
                id v75 = v128;
              }
              goto LABEL_87;
            }
            --v111;
            id v109 = (char *)v109 - 1;
          }
          while (v109);
          id v109 = [v107 countByEnumeratingWithState:&v137 objects:v145 count:16];
          if (v109) {
            continue;
          }
          break;
        }
      }

      ++v105;
      ++v104;
      uint64_t v103 = v126;
      id v48 = v136;
      id v51 = v129;
      v100 = v130;
    }
    while (v104 != v127);
    v101 = (char *)[v130 countByEnumeratingWithState:&v141 objects:v146 count:16];
    v95 = v135;
    id v75 = v128;
    v102 = v125;
  }
  while (v101);
LABEL_73:

  v112 = sub_10057670C();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
  {
    v113 = self->_reportedUserPath;
    *(_DWORD *)buf = 138412546;
    v148 = v113;
    __int16 v149 = 2112;
    id v150 = v95;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "Did not find waypointIndex for path: %@ in route: %@", buf, 0x16u);
  }
LABEL_87:

LABEL_88:
  [v48 setDirectionsContext:v51];

LABEL_81:
  v116 = [(RAPWebBundleQuestion *)self geotaggedPhotoCommentQuestion];
  [v116 _fillSubmissionParameters:v4];
}

- (BOOL)isComplete
{
  return 1;
}

- (id)questionTypeAsString
{
  unint64_t v2 = [(RAPWebBundleQuestion *)self questionType];
  if (v2 > 0x1D) {
    return @"poi";
  }
  else {
    return off_1012F3520[v2];
  }
}

- (RAPCommentQuestion)geotaggedPhotoCommentQuestion
{
  geotaggedPhotoCommentQuestion = self->_geotaggedPhotoCommentQuestion;
  if (!geotaggedPhotoCommentQuestion)
  {
    id v4 = [RAPCommentQuestion alloc];
    objc_super v5 = [(RAPQuestion *)self report];
    objc_super v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Details [Report a Problem photos]" value:@"localized string not found" table:0];
    v8 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v7 placeholderText:0 emphasis:4];
    id v9 = self->_geotaggedPhotoCommentQuestion;
    self->_geotaggedPhotoCommentQuestion = v8;

    geotaggedPhotoCommentQuestion = self->_geotaggedPhotoCommentQuestion;
  }

  return geotaggedPhotoCommentQuestion;
}

- (void)retrieveContextwithLocales:(id)a3 contextCompletion:(id)a4
{
  id v70 = a3;
  id v69 = a4;
  group = dispatch_group_create();
  uint64_t v110 = 0;
  uint64_t v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = sub_100103E4C;
  v114 = sub_1001047B0;
  id v115 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = sub_100103E4C;
  v108[4] = sub_1001047B0;
  id v109 = objc_alloc_init((Class)NSMutableArray);
  switch([(RAPWebBundleQuestion *)self questionType])
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 0xALL:
      v42 = [RAPWebBundleAddToMapContext alloc];
      v43 = [(RAPWebBundleQuestion *)self questionTypeAsString];
      v44 = [(RAPWebBundleBaseContext *)v42 initWithType:v43 locales:v70];

      v45 = [RAPPlaceCorrectableAddress alloc];
      v46 = [(RAPWebBundleQuestion *)self reportedPlace];
      v47 = [v46 mapItem];
      v41 = [(RAPPlaceCorrectableAddress *)v45 _initWithMapItem:v47];

      id v48 = [v41 freeformAddress];
      v49 = [v48 value];
      [(RAPWebBundleAddToMapContext *)v44 setAddress:v49];

      v50 = (void *)v111[5];
      v111[5] = (uint64_t)v44;

      goto LABEL_21;
    case 9:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x18:
    case 0x19:
    case 0x1ALL:
    case 0x1DLL:
      id v71 = self;
      objc_super v6 = [RAPWebBundlePOIContext alloc];
      id v7 = [(RAPWebBundleQuestion *)self questionTypeAsString];
      id v74 = [(RAPWebBundleBaseContext *)v6 initWithType:v7 locales:v70];

      v8 = [(RAPWebBundleQuestion *)self reportedPlace];
      v73 = [v8 mapItem];

      id v67 = [objc_alloc((Class)_MKLocalizedHoursBuilder) initWithMapItem:v73 localizedHoursStringOptions:0];
      unsigned int v68 = [v67 operatingHours];
      id v9 = [v68 pdHours];
      unint64_t v10 = sub_100B8E894(v9);

      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      obunint64_t j = (id)v10;
      id v12 = [obj countByEnumeratingWithState:&v98 objects:v116 count:16];
      if (v12)
      {
        uint64_t v76 = *(void *)v99;
        do
        {
          objc_super v13 = 0;
          do
          {
            if (*(void *)v99 != v76) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v13);
            id v15 = objc_alloc_init((Class)NSMutableArray);
            for (unint64_t i = 0; i < (unint64_t)[v14 daysCount]; ++i)
            {
              v17 = [v14 daysAsString:[v14 dayAtIndex:i]];
              [v15 addObject:v17];
            }
            if ([v15 count])
            {
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472;
              v96[2] = sub_10065CFD0;
              v96[3] = &unk_1012F3460;
              id v97 = v15;
              v18 = objc_retainBlock(v96);
              for (unint64_t j = 0; j < (unint64_t)[v14 timeRangesCount]; ++j)
              {
                id v20 = [v14 timeRangeAtIndex:j];
                unint64_t v10 = v10 & 0xFFFFFFFF00000000 | v21;
                v22 = ((void (*)(void *, id, unint64_t))v18[2])(v18, v20, v10);
                [v11 addObject:v22];
              }
            }

            objc_super v13 = (char *)v13 + 1;
          }
          while (v13 != v12);
          id v12 = [obj countByEnumeratingWithState:&v98 objects:v116 count:16];
        }
        while (v12);
      }

      v23 = [RAPPlaceCorrectableAddress alloc];
      v24 = [(RAPWebBundleQuestion *)v71 reportedPlace];
      v25 = [v24 mapItem];
      id v26 = [(RAPPlaceCorrectableAddress *)v23 _initWithMapItem:v25];

      v27 = [v26 freeformAddress];
      unsigned __int8 v28 = [v27 value];
      [(RAPWebBundleAddToMapContext *)v74 setAddress:v28];

      [(RAPWebBundlePOIContext *)v74 setBusinessHours:v11];
      uint64_t v29 = [v73 name];
      [(RAPWebBundlePOIContext *)v74 setName:v29];

      v30 = [v73 phoneNumber];
      [(RAPWebBundlePOIContext *)v74 setPhoneNumber:v30];

      v31 = [v73 url];
      uint64_t v32 = [v31 absoluteString];
      [(RAPWebBundlePOIContext *)v74 setUrl:v32];

      v33 = [v73 _localizedCategoryNamesForType:0];
      [(RAPWebBundlePOIContext *)v74 setCategories:v33];

      -[RAPWebBundlePOIContext setPermanentClosed:](v74, "setPermanentClosed:", [v68 hoursType] == (id)4);
      -[RAPWebBundlePOIContext setTemporaryClosed:](v74, "setTemporaryClosed:", [v68 hoursType] == (id)3);
      [(RAPWebBundlePOIContext *)v74 setAcceptsApplePay:[v73 _acceptsApplePay]];
      v34 = [v73 _transitInfo];
      LOBYTE(v32) = [v34 linesCount] == 0;

      if ((v32 & 1) == 0)
      {
        dispatch_group_enter(group);
        v35 = [(RAPWebBundleQuestion *)v71 reportedPlace];
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_10065D080;
        v91[3] = &unk_1012F3488;
        v91[4] = v71;
        id v94 = v108;
        id v92 = v74;
        v95 = &v110;
        v93 = group;
        [(RAPWebBundleQuestion *)v71 _fetchTransitInfoFromStation:v35 withCompletion:v91];
      }
      dispatch_group_enter(group);
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_10065D1D4;
      v86[3] = &unk_1012F34B0;
      v36 = v74;
      v87 = v36;
      v89 = v108;
      unsigned __int8 v90 = &v110;
      v37 = group;
      id v88 = v37;
      [(RAPWebBundleQuestion *)v71 _fetchChildContainmentWithCompletion:v86];
      dispatch_group_enter(v37);
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_10065D270;
      v81[3] = &unk_1012F34B0;
      v38 = v36;
      v82 = v38;
      v84 = v108;
      v85 = &v110;
      v83 = v37;
      [(RAPWebBundleQuestion *)v71 _fetchParentContainmentWithCompletion:v81];
      v39 = (void *)v111[5];
      v111[5] = (uint64_t)v38;
      v40 = v38;

      v41 = v73;
      goto LABEL_21;
    case 0x15:
    case 0x16:
      v52 = [RAPWebBundleBaseContext alloc];
      unsigned int v53 = [(RAPWebBundleQuestion *)self questionTypeAsString];
      v54 = [(RAPWebBundleBaseContext *)v52 initWithType:v53 locales:v70];

      v41 = v111[5];
      v111[5] = (uint64_t)v54;
      goto LABEL_21;
    case 0x17:
      v41 = sub_10057670C();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, ".context called on RAPWebBundleQuestion.directions. This is not supported.", buf, 2u);
      }
      goto LABEL_21;
    case 0x1BLL:
      id v55 = [RAPWebBundlePOIContext alloc];
      v56 = [(RAPWebBundleQuestion *)self questionTypeAsString];
      uint64_t v57 = [(RAPWebBundleBaseContext *)v55 initWithType:v56 locales:v70];

      id v58 = [(RAPQuestion *)self report];
      v59 = [v58 _context];
      v60 = [v59 reportedLine];

      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_10065CEAC;
      v102[3] = &unk_1012F34B0;
      id v61 = v60;
      id v103 = v61;
      v105 = v108;
      v41 = v57;
      v104 = v41;
      v106 = &v110;
      [(RAPWebBundleQuestion *)self _fetchTransitInfoFromReportedLine:v61 withCompletion:v102];

      goto LABEL_21;
    case 0x1CLL:
      id v62 = [RAPWebBundleAddToMapContext alloc];
      id v63 = [(RAPWebBundleQuestion *)self questionTypeAsString];
      v64 = [(RAPWebBundleBaseContext *)v62 initWithType:v63 locales:v70];

      v65 = [(RAPWebBundleQuestion *)self reportedPlace];
      uint64_t v66 = [v65 userVisibleTitle];
      [(RAPWebBundleAddToMapContext *)v64 setEntityName:v66];

      v41 = v111[5];
      v111[5] = (uint64_t)v64;
LABEL_21:

      break;
    default:
      break;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10065D30C;
  block[3] = &unk_1012E9F68;
  id v78 = v69;
  v79 = &v110;
  id v80 = v108;
  id v51 = v69;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(&v110, 8);
}

- (void)_fetchTransitInfoFromStation:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v10 = [v5 mapItem];
  id v11 = [v10 _transitInfo];
  id v12 = [v11 lines];

  objc_super v13 = (char *)[v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = MKMapItemIdentifierFromGEOTransitLine();
        [v9 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      v14 = (char *)[v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  v18 = +[MKMapService sharedService];
  v19 = [v9 allObjects];
  id v20 = +[MKMapService sharedService];
  unsigned int v21 = [v20 mapsDefaultTraits];
  v22 = [v18 ticketForTransitLines:v19 traits:v21];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10065D624;
  v26[3] = &unk_1012F09D8;
  id v27 = v8;
  id v28 = v7;
  id v29 = v6;
  id v23 = v6;
  id v24 = v7;
  id v25 = v8;
  [v22 submitWithHandler:v26 networkActivity:0];
}

- (void)_fetchTransitInfoFromReportedLine:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *, void *))a4;
  id v6 = a3;
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  unint64_t v10 = [v6 artwork];
  id v11 = +[UIImage _mapkit_transitArtworkImageWithDataSource:v10 size:6 scale:v9];

  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v6 lineFeatureID]);
  objc_super v13 = objc_alloc_init(RAPWebBundleImageContext);
  v14 = UIImagePNGRepresentation(v11);
  [(RAPWebBundleImageContext *)v13 setImage:v14];

  [(RAPWebBundleImageContext *)v13 setIdentifier:v12];
  uint64_t v15 = objc_alloc_init(RAPWebBundleTransitLineContext);
  v16 = [v6 displayName];

  [(RAPWebBundleTransitLineContext *)v15 setName:v16];
  [(RAPWebBundleTransitLineContext *)v15 setIdentifier:v12];
  [(RAPWebBundleTransitLineContext *)v15 setImageContext:v13];
  if (v5)
  {
    id v20 = v15;
    v17 = +[NSArray arrayWithObjects:&v20 count:1];
    v19 = v13;
    v18 = +[NSArray arrayWithObjects:&v19 count:1];
    v5[2](v5, v17, v18);
  }
}

- (void)_fetchChildContainmentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(RAPWebBundleQuestion *)self reportedPlace];
  id v7 = [v6 mapItem];
  double v8 = [v7 _firstRelatedPlaceListForType:3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v9 = [v8 mapIdentifiers];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      objc_super v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) muid]);
        [v5 addObject:v14];

        objc_super v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if ([v5 count])
  {
    [(RAPWebBundleQuestion *)self _fetchContainmentItems:v5 withCompletion:v4];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)_fetchParentContainmentWithCompletion:(id)a3
{
  id v20 = a3;
  id v4 = [(RAPWebBundleQuestion *)self reportedPlace];
  id v5 = [v4 mapItem];

  id v6 = [v5 _geoMapItem];
  id v7 = [v6 _containedPlace];
  double v8 = [v7 parent];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  if ([v8 _hasMUID])
  {
    id v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 _muid]);
    [v9 addObject:v10];
  }
  id v11 = [(RAPWebBundleQuestion *)self reportedPlace];
  uint64_t v12 = [v11 mapItem];
  objc_super v13 = [v12 _geoMapItem];
  v14 = [v13 _venueInfo];

  long long v15 = [v14 parent];
  if ([v15 businessID])
  {
    long long v16 = [v14 parent];
    id v17 = [v16 businessID];
    id v18 = [v8 _muid];

    if (v17 == v18) {
      goto LABEL_7;
    }
    long long v15 = [v14 parent];
    v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 businessID]);
    [v9 addObject:v19];
  }
LABEL_7:
  if ([v9 count])
  {
    [(RAPWebBundleQuestion *)self _fetchContainmentItems:v9 withCompletion:v20];
  }
  else if (v20)
  {
    (*((void (**)(id, void, void))v20 + 2))(v20, 0, 0);
  }
}

- (void)_fetchContainmentItems:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = +[GEOMapService sharedService];
  id v11 = +[GEOMapService sharedService];
  uint64_t v12 = [v11 defaultTraits];
  objc_super v13 = [v10 ticketForMUIDs:v6 traits:v12];

  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10065E044;
  v18[3] = &unk_1012F3500;
  objc_copyWeak(&v22, &location);
  id v14 = v7;
  id v21 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v8;
  id v20 = v16;
  id v17 = &_dispatch_main_q;
  [v13 submitWithHandler:v18 networkActivity:0 queue:&_dispatch_main_q];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (id)_alternateDirectionsRecording
{
  return self->_directionsRecording;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (GEORPFeedbackDynamicForm)dynamicForm
{
  return self->_dynamicForm;
}

- (void)setDynamicForm:(id)a3
{
}

- (int64_t)questionType
{
  return self->_questionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicForm, 0);
  objc_storeStrong((id *)&self->_reportedPlace, 0);
  objc_storeStrong((id *)&self->_geotaggedPhotoCommentQuestion, 0);
  objc_storeStrong((id *)&self->_reportedUserPath, 0);

  objc_storeStrong((id *)&self->_directionsRecording, 0);
}

@end