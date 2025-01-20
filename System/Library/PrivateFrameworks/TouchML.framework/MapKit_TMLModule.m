@interface MapKit_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation MapKit_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2398628C4;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05838 != -1) {
    dispatch_once(&qword_268A05838, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v34 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v34);
  objc_msgSend_setObject_forKeyedSubscript_(v34, v6, v7, &unk_26ECECE08, @"MKCoordinateRegionMakeWithDistance");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v8, v9, &unk_26ECECE28, @"MKPlacemarkWithCoordinateAddressDictionary");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v10, v11, &unk_26ECECE48, @"MKMapItemWithCoordinateAddressDictionary");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v12, v13, &unk_26ECECE68, @"MKRoadWidthAtZoomScale");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v14, v15, &unk_26ECECE88, @"MKMapPointForCoordinate");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v16, v17, &unk_26ECECEA8, @"MKCoordinateForMapPoint");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v18, v19, &unk_26ECECEC8, @"MKMetersBetweenMapPoints");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v20, v21, &unk_26ECECEE8, @"MKCoordinateRegionForMapRect");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v22, v23, &unk_26ECECF08, @"MKPointAnnotation");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v24, v25, &unk_26ECECF28, @"MKPinAnnotationView");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v26, v27, &unk_26ECECF48, @"MKMapRectUnion");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v28, v29, &unk_26ECECF68, @"MKMapSizeMake");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v30, v31, &unk_26ECECF88, @"MKMapRectMake");
  objc_msgSend_setObject_forKeyedSubscript_(v34, v32, v33, &unk_26ECECFA8, @"MKLocalSearch");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v135 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v135, v8, v9, &unk_26ED19AF0, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"MKOverlayLevelAboveRoads", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v12, v13, &unk_26ED19B08, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"MKOverlayLevelAboveLabels", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v16, v17, &unk_26ED19B20, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"MKPinAnnotationColorRed", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v20, v21, &unk_26ED19B38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"MKPinAnnotationColorGreen", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v24, v25, &unk_26ED19B50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"MKPinAnnotationColorPurple", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v28, v29, &unk_26ED1B528, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"MKFeatureDisplayPriorityRequired", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v32, v33, &unk_26ED1B538, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"MKFeatureDisplayPriorityDefaultHigh", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v36, v37, &unk_26ED1B548, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"MKFeatureDisplayPriorityDefaultLow", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v40, v41, &unk_26ED19B38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"MKDirectionsTransportTypeAutomobile", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v44, v45, &unk_26ED19B50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"MKDirectionsTransportTypeWalking", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v48, v49, &unk_26ED19B68, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"MKDirectionsTransportTypeAny", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v52, v53, &unk_26ED19B20, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"MKDistanceFormatterUnitsDefault", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v56, v57, &unk_26ED19B38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"MKDistanceFormatterUnitsMetric", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v60, v61, &unk_26ED19B50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"MKDistanceFormatterUnitsImperial", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v64, v65, &unk_26ED19B80, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v66, v67, @"MKDistanceFormatterUnitsImperialWithYards", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v68, v69, &unk_26ED19B20, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v70, v71, @"MKDistanceFormatterUnitStyleDefault", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v72, v73, &unk_26ED19B38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"MKDistanceFormatterUnitStyleAbbreviated", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v76, v77, &unk_26ED19B50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v78, v79, @"MKDistanceFormatterUnitStyleFull", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v80, v81, &unk_26ED19B20, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v82, v83, @"MKMapTypeStandard", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v84, v85, &unk_26ED19B38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v86, v87, @"MKMapTypeSatellite", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v88, v89, &unk_26ED19B50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v90, v91, @"MKMapTypeHybrid", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v92, v93, *MEMORY[0x263F10818], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v94, v95, @"MKLaunchOptionsDirectionsModeKey", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v96, v97, *MEMORY[0x263F10840], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v98, v99, @"MKLaunchOptionsMapTypeKey", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v100, v101, *MEMORY[0x263F10850], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v102, v103, @"MKLaunchOptionsShowsTrafficKey", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v104, v105, *MEMORY[0x263F10810], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v106, v107, @"MKLaunchOptionsDirectionsModeDriving", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v108, v109, *MEMORY[0x263F10828], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v110, v111, @"MKLaunchOptionsDirectionsModeWalking", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v112, v113, *MEMORY[0x263F10820], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v114, v115, @"MKLaunchOptionsDirectionsModeTransit", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v116, v117, *MEMORY[0x263F10830], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v118, v119, @"MKLaunchOptionsMapCenterKey", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v120, v121, *MEMORY[0x263F10838], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v122, v123, @"MKLaunchOptionsMapSpanKey", v135);
  objc_msgSend_setObject_forKeyedSubscript_(v135, v124, v125, *MEMORY[0x263F10800], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v126, v127, @"MKLaunchOptionsCameraKey", v135);
  v130 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v128, v129, MEMORY[0x263F10858], "{?={?=dd}{?=dd}}");
  objc_msgSend_setObject_forKeyedSubscript_(v135, v131, v132, v130, v7);

  objc_msgSend_defineProperty_descriptor_(v4, v133, v134, @"MKMapRectNull", v135);
}

@end