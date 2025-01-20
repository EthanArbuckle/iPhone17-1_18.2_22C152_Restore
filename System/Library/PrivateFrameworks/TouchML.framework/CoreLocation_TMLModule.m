@interface CoreLocation_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation CoreLocation_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23986514C;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05860 != -1) {
    dispatch_once(&qword_268A05860, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v24 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v24, v6, v7, &unk_26ECED008, @"CLLocationCoordinate2DMake");
  objc_msgSend_setObject_forKeyedSubscript_(v24, v8, v9, &unk_26ECED008, @"CLLocationCoordinate");
  objc_msgSend_setObject_forKeyedSubscript_(v24, v10, v11, &unk_26ECED028, @"CLLocationCoordinate2DIsValid");
  v14 = objc_msgSend_objectForKeyedSubscript_(v24, v12, v13, @"CLLocationCoordinate");
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, v16, &unk_26ECED048, @"latitude");

  v19 = objc_msgSend_objectForKeyedSubscript_(v24, v17, v18, @"CLLocationCoordinate");
  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, &unk_26ECED068, @"longitude");

  objc_msgSend_setObject_forKeyedSubscript_(v24, v22, v23, &unk_26ECED088, @"CLLocation");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  char v8 = objc_msgSend_numberWithDouble_(NSNumber, v7, *MEMORY[0x263F00B18]);
  uint64_t v9 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v82, v10, v11, v8, *MEMORY[0x263F10368]);

  objc_msgSend_defineProperty_descriptor_(v4, v12, v13, @"kCLLocationAccuracyBestForNavigation", v82);
  v15 = objc_msgSend_numberWithDouble_(NSNumber, v14, *MEMORY[0x263F00B10]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v16, v17, v15, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"kCLLocationAccuracyBest", v82);
  double v21 = objc_msgSend_numberWithDouble_(NSNumber, v20, *MEMORY[0x263F00B40]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v22, v23, v21, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v24, v25, @"kCLLocationAccuracyNearestTenMeters", v82);
  v27 = objc_msgSend_numberWithDouble_(NSNumber, v26, *MEMORY[0x263F00B28]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v28, v29, v27, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"kCLLocationAccuracyHundredMeters", v82);
  v33 = objc_msgSend_numberWithDouble_(NSNumber, v32, *MEMORY[0x263F00B30]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v34, v35, v33, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v36, v37, @"kCLLocationAccuracyKilometer", v82);
  v39 = objc_msgSend_numberWithDouble_(NSNumber, v38, *MEMORY[0x263F00B50]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v40, v41, v39, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"kCLLocationAccuracyThreeKilometers", v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v44, v45, &unk_26ED19C10, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"kCLAuthorizationStatusNotDetermined", v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v48, v49, &unk_26ED19C28, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"kCLAuthorizationStatusRestricted", v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v52, v53, &unk_26ED19C40, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"kCLAuthorizationStatusDenied", v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v56, v57, &unk_26ED19C58, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"kCLAuthorizationStatusAuthorizedAlways", v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v60, v61, &unk_26ED19C70, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"kCLAuthorizationStatusAuthorizedWhenInUse", v82);
  v65 = objc_msgSend_numberWithDouble_(NSNumber, v64, *MEMORY[0x263F009F8]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v66, v67, v65, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v68, v69, @"CLLocationDistanceMax", v82);
  v71 = objc_msgSend_numberWithDouble_(NSNumber, v70, *MEMORY[0x263F00A00]);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v72, v73, v71, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"CLTimeIntervalMax", v82);
  v77 = objc_msgSend_valueWithMKCoordinate_(MEMORY[0x263F08D40], v76, *MEMORY[0x263F00B58], *(double *)(MEMORY[0x263F00B58] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v82, v78, v79, v77, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v80, v81, @"kCLLocationCoordinate2DInvalid", v82);
}

@end