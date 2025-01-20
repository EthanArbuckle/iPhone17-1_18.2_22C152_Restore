void sub_10000468C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000047E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100004800(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(DEPLogObjects() + 8);
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v14 = 138543362;
    id v15 = v6;
    v9 = "Error retrieving mid: %{public}@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    LOWORD(v14) = 0;
    v9 = "Successfully retrieved mid";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
LABEL_7:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v8);
  }
}

void *sub_100004910(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100025598)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100004A50;
    v5[4] = &unk_10001C658;
    v5[5] = v5;
    long long v6 = off_10001C640;
    uint64_t v7 = 0;
    qword_100025598 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_100025598;
    if (qword_100025598)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100025598;
LABEL_5:
  result = dlsym(v2, "MAECopyActivationRecordWithError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100025590 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004A50()
{
  uint64_t result = _sl_dlopen();
  qword_100025598 = result;
  return result;
}

Class sub_100004AC4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000255A8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100004C08;
    v3[4] = &unk_10001C658;
    v3[5] = v3;
    long long v4 = off_10001C678;
    uint64_t v5 = 0;
    qword_1000255A8 = _sl_dlopen();
    if (!qword_1000255A8)
    {
      abort_report_np();
LABEL_8:
      sub_100011E48();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AKAnisetteProvisioningController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_1000255A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004C08()
{
  uint64_t result = _sl_dlopen();
  qword_1000255A8 = result;
  return result;
}

void sub_1000052BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copy];
  id v3 = *(id *)(a1 + 40);
  DeviceIdentityIssueClientCertificateWithCompletion();
}

void sub_10000535C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      os_log_type_t v11 = [v8 description];
      int v13 = 138543362;
      int v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error while retrieving client certificates: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      (*(void (**)(uint64_t, void *, id, void))(v12 + 16))(v12, a2, v7, 0);
    }
  }
}

void sub_100007224(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceType];
  byte_1000255B0 = [v1 isEqualToString:@"iPad"];
}

void sub_100007308(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceType];
  byte_1000255C0 = [v1 isEqualToString:@"AppleTV"];
}

void sub_1000073EC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceType];
  byte_1000255D0 = [v1 isEqualToString:@"Watch"];
}

void sub_1000074D0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceType];
  byte_1000255E0 = [v1 isEqualToString:@"AudioAccessory"];
}

void sub_1000075B4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceType];
  byte_1000255F0 = [v1 isEqualToString:@"iPhone"];
}

void sub_10000765C(id a1)
{
  uint64_t v1 = MGCopyAnswer();
  if (v1)
  {
    id v2 = (void *)v1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(v1) = [v2 BOOLValue];
    }
    else {
      LOBYTE(v1) = 0;
    }
  }
  byte_100025600 = v1;

  _objc_release_x1();
}

void sub_10000786C(id a1)
{
  qword_100025610 = (uint64_t)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];

  _objc_release_x1();
}

void sub_10000A380(uint64_t a1)
{
  v13[0] = @"PROFILE_NOT_ACTIVE";
  id v2 = [*(id *)(a1 + 32) profileNotActiveError];
  v14[0] = v2;
  v13[1] = @"PROFILE_NOT_FOUND";
  id v3 = [*(id *)(a1 + 32) profileNotFoundError];
  v14[1] = v3;
  v13[2] = @"DEVICE_NOT_FOUND";
  long long v4 = [*(id *)(a1 + 32) deviceNotFoundError];
  v14[2] = v4;
  v13[3] = @"DEVICE_NOT_ENROLLED";
  uint64_t v5 = [*(id *)(a1 + 32) deviceNotEnrolledError];
  v14[3] = v5;
  v13[4] = @"NONCE_EXPIRED";
  long long v6 = [*(id *)(a1 + 32) nonceExpiredError];
  v14[4] = v6;
  v13[5] = @"INVALID_SIGNATURE";
  id v7 = [*(id *)(a1 + 32) invalidSignatureError];
  v14[5] = v7;
  v13[6] = @"INVALID_DEVICE";
  id v8 = [*(id *)(a1 + 32) invalidDeviceError];
  v14[6] = v8;
  v13[7] = @"INVALID_PROFILE";
  v9 = [*(id *)(a1 + 32) invalidProfileError];
  v14[7] = v9;
  v13[8] = @"CANNOT_ENROLL";
  v10 = [*(id *)(a1 + 32) deviceAlreadyEnrolledError];
  v14[8] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:9];
  uint64_t v12 = (void *)qword_100025628;
  qword_100025628 = v11;
}

void sub_10000AF5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idleTimer];
  [v2 invalidate];

  id v3 = objc_alloc((Class)NSTimer);
  long long v4 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
  id v5 = [v3 initWithFireDate:v4 interval:*(void *)(a1 + 32) target:"idleTimerDidFire:" selector:0 userInfo:0 repeats:0.0];
  [*(id *)(a1 + 32) setIdleTimer:v5];

  id v7 = +[NSRunLoop mainRunLoop];
  long long v6 = [*(id *)(a1 + 32) idleTimer];
  [v7 addTimer:v6 forMode:NSRunLoopCommonModes];
}

void sub_10000BECC(id a1)
{
  uint64_t v1 = +[CCDDeviceUtilities deviceType];
  id v2 = +[CCDDeviceUtilities productName];
  id v3 = +[CCDDeviceUtilities productBuildVersion];
  long long v4 = +[CCDDeviceUtilities productBuildVersion];
  v16 = (void *)v1;
  v21[0] = v1;
  v21[1] = v2;
  v21[2] = v3;
  v21[3] = v4;
  id v5 = +[NSArray arrayWithObjects:v21 count:4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v11)
        {
          if ([v8 length])
          {
            [v8 appendFormat:@"; %@", v11];
          }
          else
          {
            id v12 = [v11 mutableCopy];

            id v8 = v12;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  if ([v8 length])
  {
    int v13 = +[NSString stringWithFormat:@" (%@)", v8];
  }
  else
  {
    int v13 = &stru_10001DAB0;
  }
  uint64_t v14 = +[NSString stringWithFormat:@"ConfigClient/1.0%@", v13];
  id v15 = (void *)qword_100025630;
  qword_100025630 = v14;
}

void sub_10000C1BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v10 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve the client certificate: %{public}@.", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) setCertificateRetrievalFailed:1];
    [*(id *)(a1 + 32) _retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _completeOperationWithReferenceKey:v7 certificates:v8 error:v9];
  }
}

void sub_10000CC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 240), 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CCDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000CCEC(uint64_t a1)
{
}

id sub_10000CCF4(void *a1)
{
  id v2 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Done retrieving mid", v4, 2u);
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) lock];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else {
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
  }
  return [*(id *)(*(void *)(a1[5] + 8) + 40) unlock];
}

void sub_10000CDD0(void *a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  v10 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Done retrieving cloud configuration", v11, 2u);
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) lock];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), a4);
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) unlock];
}

uint64_t sub_10000D3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0, a2);
}

void sub_10000D604(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setPrivateKey:a2];
    [*(id *)(a1 + 32) setClientCertificates:v8];
    id v7 = [*(id *)(a1 + 40) _operationForEnrollmentRequest:*(void *)(a1 + 32)];
    [v7 setEnrollmentCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _addOperationToQueue:v7];
  }
}

void sub_10000F1F8(id a1)
{
  v144[0] = @"org";
  v143[0] = &__kCFBooleanTrue;
  v142[0] = @"isRequired";
  v142[1] = @"keyInfo";
  v140[0] = @"name";
  v138[0] = @"isRequired";
  v138[1] = @"validationType";
  v139[0] = &__kCFBooleanTrue;
  v139[1] = &off_10001EAA8;
  v138[2] = @"destinationKey";
  v139[2] = @"OrganizationName";
  v49 = +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:3];
  v141[0] = v49;
  v140[1] = @"address";
  v136[0] = @"isRequired";
  v136[1] = @"validationType";
  v137[0] = &__kCFBooleanFalse;
  v137[1] = &off_10001EAA8;
  v136[2] = @"destinationKey";
  v137[2] = @"OrganizationAddress";
  v48 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:3];
  v141[1] = v48;
  v140[2] = @"address-line-1";
  v134[0] = @"isRequired";
  v134[1] = @"validationType";
  v135[0] = &__kCFBooleanFalse;
  v135[1] = &off_10001EAA8;
  v134[2] = @"destinationKey";
  v135[2] = @"OrganizationAddressLine1";
  v47 = +[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:3];
  v141[2] = v47;
  v140[3] = @"address-line-2";
  v132[0] = @"isRequired";
  v132[1] = @"validationType";
  v133[0] = &__kCFBooleanFalse;
  v133[1] = &off_10001EAA8;
  v132[2] = @"destinationKey";
  v133[2] = @"OrganizationAddressLine2";
  v46 = +[NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:3];
  v141[3] = v46;
  v140[4] = @"address-line-3";
  v130[0] = @"isRequired";
  v130[1] = @"validationType";
  v131[0] = &__kCFBooleanFalse;
  v131[1] = &off_10001EAA8;
  v130[2] = @"destinationKey";
  v131[2] = @"OrganizationAddressLine3";
  v45 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:3];
  v141[4] = v45;
  v140[5] = @"city";
  v128[0] = @"isRequired";
  v128[1] = @"validationType";
  v129[0] = &__kCFBooleanFalse;
  v129[1] = &off_10001EAA8;
  v128[2] = @"destinationKey";
  v129[2] = @"OrganizationCity";
  v44 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:3];
  v141[5] = v44;
  v140[6] = @"region";
  v126[0] = @"isRequired";
  v126[1] = @"validationType";
  v127[0] = &__kCFBooleanFalse;
  v127[1] = &off_10001EAA8;
  v126[2] = @"destinationKey";
  v127[2] = @"OrganizationRegion";
  v43 = +[NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:3];
  v141[6] = v43;
  v140[7] = @"zip-code";
  v124[0] = @"isRequired";
  v124[1] = @"validationType";
  v125[0] = &__kCFBooleanFalse;
  v125[1] = &off_10001EAA8;
  v124[2] = @"destinationKey";
  v125[2] = @"OrganizationZipCode";
  v42 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:3];
  v141[7] = v42;
  v140[8] = @"country";
  v122[0] = @"isRequired";
  v122[1] = @"validationType";
  v123[0] = &__kCFBooleanFalse;
  v123[1] = &off_10001EAA8;
  v122[2] = @"destinationKey";
  v123[2] = @"OrganizationCountry";
  v41 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:3];
  v141[8] = v41;
  v140[9] = @"phone";
  v120[0] = @"isRequired";
  v120[1] = @"validationType";
  v121[0] = &__kCFBooleanFalse;
  v121[1] = &off_10001EAA8;
  v120[2] = @"destinationKey";
  v121[2] = @"OrganizationPhone";
  v40 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:3];
  v141[9] = v40;
  v140[10] = @"magic";
  v118[0] = @"isRequired";
  v118[1] = @"validationType";
  v119[0] = &__kCFBooleanFalse;
  v119[1] = &off_10001EAA8;
  v118[2] = @"destinationKey";
  v119[2] = @"OrganizationMagic";
  v39 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:3];
  v141[10] = v39;
  v140[11] = @"email";
  v116[0] = @"isRequired";
  v116[1] = @"validationType";
  v117[0] = &__kCFBooleanFalse;
  v117[1] = &off_10001EAA8;
  v116[2] = @"destinationKey";
  v117[2] = @"OrganizationEmail";
  v38 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:3];
  v141[11] = v38;
  v140[12] = @"department";
  v114[0] = @"isRequired";
  v114[1] = @"validationType";
  v115[0] = &__kCFBooleanFalse;
  v115[1] = &off_10001EAA8;
  v114[2] = @"destinationKey";
  v115[2] = @"OrganizationDepartment";
  uint64_t v37 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:3];
  v141[12] = v37;
  v140[13] = @"support-phone-number";
  v112[0] = @"isRequired";
  v112[1] = @"validationType";
  v113[0] = &__kCFBooleanFalse;
  v113[1] = &off_10001EAA8;
  v112[2] = @"destinationKey";
  v113[2] = @"OrganizationSupportPhone";
  v36 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:3];
  v141[13] = v36;
  v140[14] = @"support-email-address";
  v110[0] = @"isRequired";
  v110[1] = @"validationType";
  v111[0] = &__kCFBooleanFalse;
  v111[1] = &off_10001EAA8;
  v110[2] = @"destinationKey";
  v111[2] = @"OrganizationSupportEmail";
  v35 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:3];
  v141[14] = v35;
  v34 = +[NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:15];
  v143[1] = v34;
  v33 = +[NSDictionary dictionaryWithObjects:v143 forKeys:v142 count:2];
  v145[0] = v33;
  v144[1] = @"config";
  v109[0] = &__kCFBooleanFalse;
  v108[0] = @"isRequired";
  v108[1] = @"keyInfo";
  v106[0] = @"url";
  v104[0] = @"isRequired";
  v104[1] = @"validationType";
  v105[0] = &__kCFBooleanTrue;
  v105[1] = &off_10001EAC0;
  v104[2] = @"destinationKey";
  v105[2] = @"ConfigurationURL";
  v32 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:3];
  v107[0] = v32;
  v106[1] = @"management-protocol-version";
  v102[0] = @"isRequired";
  v102[1] = @"validationType";
  v103[0] = &__kCFBooleanFalse;
  v103[1] = &off_10001EAD8;
  v102[2] = @"destinationKey";
  v103[2] = @"MDMProtocolVersion";
  v31 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:3];
  v107[1] = v31;
  v106[2] = @"is-supervised";
  v100[0] = @"isRequired";
  v100[1] = @"validationType";
  v101[0] = &__kCFBooleanFalse;
  v101[1] = &off_10001EAF0;
  v100[2] = @"destinationKey";
  v101[2] = @"IsSupervised";
  v30 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];
  v107[2] = v30;
  v106[3] = @"allow-pairing";
  v98[0] = @"isRequired";
  v98[1] = @"validationType";
  v99[0] = &__kCFBooleanFalse;
  v99[1] = &off_10001EAF0;
  v98[2] = @"destinationKey";
  v99[2] = @"AllowPairing";
  v29 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
  v107[3] = v29;
  v106[4] = @"is-mandatory";
  v96[0] = @"isRequired";
  v96[1] = @"validationType";
  v97[0] = &__kCFBooleanFalse;
  v97[1] = &off_10001EAF0;
  v96[2] = @"destinationKey";
  v97[2] = @"IsMandatory";
  v28 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:3];
  v107[4] = v28;
  v106[5] = @"is-mdm-removable";
  v94[0] = @"isRequired";
  v94[1] = @"validationType";
  v95[0] = &__kCFBooleanFalse;
  v95[1] = &off_10001EB08;
  v94[2] = @"destinationKey";
  v95[2] = @"IsMDMUnremovable";
  v27 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];
  v107[5] = v27;
  v106[6] = @"anchor-certs";
  v92[0] = @"isRequired";
  v92[1] = @"validationType";
  v93[0] = &__kCFBooleanFalse;
  v93[1] = &off_10001EB20;
  v92[2] = @"destinationKey";
  v93[2] = @"AnchorCertificates";
  v26 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:3];
  v107[6] = v26;
  v106[7] = @"supervision-host-certs";
  v90[0] = @"isRequired";
  v90[1] = @"validationType";
  v91[0] = &__kCFBooleanFalse;
  v91[1] = &off_10001EB20;
  v90[2] = @"destinationKey";
  v91[2] = @"SupervisorHostCertificates";
  v25 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:3];
  v107[7] = v25;
  v106[8] = @"skip-buddy-items";
  v88[0] = @"isRequired";
  v88[1] = @"validationType";
  v89[0] = &__kCFBooleanFalse;
  v89[1] = &off_10001EB38;
  v88[2] = @"destinationKey";
  v89[2] = @"SkipSetup";
  v24 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:3];
  v107[8] = v24;
  v106[9] = @"is-multi-user";
  v86[0] = @"isRequired";
  v86[1] = @"validationType";
  v87[0] = &__kCFBooleanFalse;
  v87[1] = &off_10001EAF0;
  v86[2] = @"destinationKey";
  v87[2] = @"IsMultiUser";
  v23 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:3];
  v107[9] = v23;
  v106[10] = @"await-device-configured";
  v84[0] = @"isRequired";
  v84[1] = @"validationType";
  v85[0] = &__kCFBooleanFalse;
  v85[1] = &off_10001EAF0;
  v84[2] = @"destinationKey";
  v85[2] = @"AwaitDeviceConfigured";
  v22 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:3];
  v107[10] = v22;
  v106[11] = @"auto-advance-setup";
  v82[0] = @"isRequired";
  v82[1] = @"validationType";
  v83[0] = &__kCFBooleanFalse;
  v83[1] = &off_10001EAF0;
  v82[2] = @"destinationKey";
  v83[2] = @"AutoAdvanceSetup";
  v21 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];
  v107[11] = v21;
  v106[12] = @"language";
  v80[0] = @"isRequired";
  v80[1] = @"validationType";
  v81[0] = &__kCFBooleanFalse;
  v81[1] = &off_10001EAA8;
  v80[2] = @"destinationKey";
  v81[2] = @"Language";
  long long v20 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
  v107[12] = v20;
  v106[13] = @"region";
  v78[0] = @"isRequired";
  v78[1] = @"validationType";
  v79[0] = &__kCFBooleanFalse;
  v79[1] = &off_10001EAA8;
  v78[2] = @"destinationKey";
  v79[2] = @"Region";
  long long v19 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
  v107[13] = v19;
  v106[14] = @"script";
  v76[0] = @"isRequired";
  v76[1] = @"validationType";
  v77[0] = &__kCFBooleanFalse;
  v77[1] = &off_10001EAA8;
  v76[2] = @"destinationKey";
  v77[2] = @"Script";
  long long v18 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];
  v107[14] = v18;
  v106[15] = @"configuration-web-url";
  v74[0] = @"isRequired";
  v74[1] = @"validationType";
  v75[0] = &__kCFBooleanFalse;
  v75[1] = &off_10001EAA8;
  v74[2] = @"destinationKey";
  v75[2] = @"ConfigurationWebURL";
  long long v17 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
  v106[16] = @"enrollment-server";
  v73[0] = &__kCFBooleanFalse;
  v73[1] = &off_10001EB50;
  v107[15] = v17;
  v73[2] = @"EnrollmentServer";
  v72[0] = @"isRequired";
  v72[1] = @"validationType";
  v72[2] = @"destinationKey";
  v72[3] = @"subKey";
  v70[0] = @"enrollment-url";
  v68[0] = @"isRequired";
  v68[1] = @"validationType";
  v69[0] = &__kCFBooleanTrue;
  v69[1] = &off_10001EAC0;
  v68[2] = @"destinationKey";
  v69[2] = @"EnrollmentURL";
  v16 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];
  v71[0] = v16;
  v70[1] = @"enrollment-anchor-certificates";
  v66[0] = @"isRequired";
  v66[1] = @"validationType";
  v67[0] = &__kCFBooleanFalse;
  v67[1] = &off_10001EB20;
  v66[2] = @"destinationKey";
  v67[2] = @"EnrollmentAnchorCertificates";
  id v15 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
  v71[1] = v15;
  v70[2] = @"supported-features";
  v64[0] = @"isRequired";
  v64[1] = @"validationType";
  v65[0] = &__kCFBooleanFalse;
  v65[1] = &off_10001EB68;
  v64[2] = @"destinationKey";
  v65[2] = @"SupportedFeatures";
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
  v71[2] = v14;
  int v13 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];
  v73[3] = v13;
  id v12 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];
  v107[16] = v12;
  int v11 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:17];
  v109[1] = v11;
  v10 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
  v145[1] = v10;
  v144[2] = @"enrollment";
  v63[0] = &__kCFBooleanFalse;
  v62[0] = @"isRequired";
  v62[1] = @"keyInfo";
  CFStringRef v60 = @"expiry";
  v58[0] = @"isRequired";
  v58[1] = @"validationType";
  v59[0] = &__kCFBooleanTrue;
  v59[1] = &off_10001EAD8;
  v58[2] = @"destinationKey";
  v59[2] = @"ProvisionalEnrollmentExpiry";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
  v61 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v63[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
  v145[2] = v3;
  v144[3] = @"user";
  v56[1] = @"keyInfo";
  v57[0] = &__kCFBooleanFalse;
  v56[0] = @"isRequired";
  v54[0] = @"ft_maid";
  v52[0] = @"isRequired";
  v52[1] = @"validationType";
  v53[0] = &__kCFBooleanFalse;
  v53[1] = &off_10001EAA8;
  v52[2] = @"destinationKey";
  v53[2] = @"MAIDUsername";
  long long v4 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
  v55[0] = v4;
  v54[1] = @"ft_token";
  v50[0] = @"isRequired";
  v50[1] = @"validationType";
  v51[0] = &__kCFBooleanFalse;
  v51[1] = &off_10001EB80;
  v50[2] = @"destinationKey";
  v51[2] = @"MAIDHasCredential";
  id v5 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
  v55[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  v57[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
  v145[3] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v145 forKeys:v144 count:4];
  id v9 = (void *)qword_100025640;
  qword_100025640 = v8;
}

uint64_t start()
{
  v0 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "service starting...", buf, 2u);
  }
  uint64_t v1 = objc_alloc_init(CCDServer);
  id v2 = objc_opt_new();
  [v2 setServer:v1];
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = [v3 initWithMachServiceName:kCCServiceName];
  [v4 setDelegate:v2];
  id v5 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "awaiting connections...", v9, 2u);
  }
  [v4 resume];
  CFRunLoopRun();
  [v4 invalidate];
  id v6 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "service stopping.", v8, 2u);
  }

  return 0;
}

void sub_100011E24()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_100011E48(v0);
}

void sub_100011E48()
{
  uint64_t v0 = (__CFDictionary *)abort_report_np();
  CFDictionaryAddValue(v0, v1, v2);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t DEPErrorArray()
{
  return _DEPErrorArray();
}

uint64_t DEPLogObjects()
{
  return _DEPLogObjects();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return _DeviceIdentityIssueClientCertificateWithCompletion();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesFlushCachesForIdentifier()
{
  return __CFPreferencesFlushCachesForIdentifier();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UDID(void *a1, const char *a2, ...)
{
  return [a1 UDID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cloudConfigErrorResponses(void *a1, const char *a2, ...)
{
  return [a1 _cloudConfigErrorResponses];
}

id objc_msgSend__contentType(void *a1, const char *a2, ...)
{
  return [a1 _contentType];
}

id objc_msgSend__deviceDetails(void *a1, const char *a2, ...)
{
  return [a1 _deviceDetails];
}

id objc_msgSend__deviceInfoDictionary(void *a1, const char *a2, ...)
{
  return [a1 _deviceInfoDictionary];
}

id objc_msgSend__endpointURL(void *a1, const char *a2, ...)
{
  return [a1 _endpointURL];
}

id objc_msgSend__enrollmentURL(void *a1, const char *a2, ...)
{
  return [a1 _enrollmentURL];
}

id objc_msgSend__invalidateAndCancelURLSession(void *a1, const char *a2, ...)
{
  return [a1 _invalidateAndCancelURLSession];
}

id objc_msgSend__requestBodyData(void *a1, const char *a2, ...)
{
  return [a1 _requestBodyData];
}

id objc_msgSend__requestHeader(void *a1, const char *a2, ...)
{
  return [a1 _requestHeader];
}

id objc_msgSend__sendFailureNoticeToRemote(void *a1, const char *a2, ...)
{
  return [a1 _sendFailureNoticeToRemote];
}

id objc_msgSend__systemInfo(void *a1, const char *a2, ...)
{
  return [a1 _systemInfo];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_approver(void *a1, const char *a2, ...)
{
  return [a1 approver];
}

id objc_msgSend_badFormatError(void *a1, const char *a2, ...)
{
  return [a1 badFormatError];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_certificateRetrievalCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 certificateRetrievalCompletionBlock];
}

id objc_msgSend_certificateRetrievalFailed(void *a1, const char *a2, ...)
{
  return [a1 certificateRetrievalFailed];
}

id objc_msgSend_certificateRetrievalRequestCount(void *a1, const char *a2, ...)
{
  return [a1 certificateRetrievalRequestCount];
}

id objc_msgSend_clientCertificates(void *a1, const char *a2, ...)
{
  return [a1 clientCertificates];
}

id objc_msgSend_cloudConfigurationValidationDictionary(void *a1, const char *a2, ...)
{
  return [a1 cloudConfigurationValidationDictionary];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationKey(void *a1, const char *a2, ...)
{
  return [a1 destinationKey];
}

id objc_msgSend_deviceAlreadyEnrolledError(void *a1, const char *a2, ...)
{
  return [a1 deviceAlreadyEnrolledError];
}

id objc_msgSend_deviceCapacity(void *a1, const char *a2, ...)
{
  return [a1 deviceCapacity];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return [a1 deviceColor];
}

id objc_msgSend_deviceNotEnrolledError(void *a1, const char *a2, ...)
{
  return [a1 deviceNotEnrolledError];
}

id objc_msgSend_deviceNotFoundError(void *a1, const char *a2, ...)
{
  return [a1 deviceNotFoundError];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_deviceUploadCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 deviceUploadCompletionBlock];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dsToken(void *a1, const char *a2, ...)
{
  return [a1 dsToken];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_endOperation(void *a1, const char *a2, ...)
{
  return [a1 endOperation];
}

id objc_msgSend_endpointPath(void *a1, const char *a2, ...)
{
  return [a1 endpointPath];
}

id objc_msgSend_enrollmentCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 enrollmentCompletionBlock];
}

id objc_msgSend_enrollmentURLString(void *a1, const char *a2, ...)
{
  return [a1 enrollmentURLString];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_httpMethod(void *a1, const char *a2, ...)
{
  return [a1 httpMethod];
}

id objc_msgSend_httpResponseContentType(void *a1, const char *a2, ...)
{
  return [a1 httpResponseContentType];
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return [a1 idleTimer];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidDeviceError(void *a1, const char *a2, ...)
{
  return [a1 invalidDeviceError];
}

id objc_msgSend_invalidProfileError(void *a1, const char *a2, ...)
{
  return [a1 invalidProfileError];
}

id objc_msgSend_invalidSignatureError(void *a1, const char *a2, ...)
{
  return [a1 invalidSignatureError];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return [a1 isAppleTV];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDEPPushEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDEPPushEnabled];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return [a1 isRequired];
}

id objc_msgSend_isRunningInDiagnosticsMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInDiagnosticsMode];
}

id objc_msgSend_isRunningInRecovery(void *a1, const char *a2, ...)
{
  return [a1 isRunningInRecovery];
}

id objc_msgSend_isRunningInRootLaunchdContext(void *a1, const char *a2, ...)
{
  return [a1 isRunningInRootLaunchdContext];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return [a1 isiPhone];
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return [a1 keyInfo];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return [a1 nonce];
}

id objc_msgSend_nonceExpiredError(void *a1, const char *a2, ...)
{
  return [a1 nonceExpiredError];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_orgId(void *a1, const char *a2, ...)
{
  return [a1 orgId];
}

id objc_msgSend_orgName(void *a1, const char *a2, ...)
{
  return [a1 orgName];
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return [a1 organization];
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return [a1 privateKey];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_profileNotActiveError(void *a1, const char *a2, ...)
{
  return [a1 profileNotActiveError];
}

id objc_msgSend_profileNotFoundError(void *a1, const char *a2, ...)
{
  return [a1 profileNotFoundError];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return [a1 pushToken];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return [a1 pushTopic];
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return [a1 requestBody];
}

id objc_msgSend_requestCount(void *a1, const char *a2, ...)
{
  return [a1 requestCount];
}

id objc_msgSend_requestFailed(void *a1, const char *a2, ...)
{
  return [a1 requestFailed];
}

id objc_msgSend_requestPayload(void *a1, const char *a2, ...)
{
  return [a1 requestPayload];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_resetIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 resetIdleTimer];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseData(void *a1, const char *a2, ...)
{
  return [a1 responseData];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retryAfterInterval(void *a1, const char *a2, ...)
{
  return [a1 retryAfterInterval];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceBusyError(void *a1, const char *a2, ...)
{
  return [a1 serviceBusyError];
}

id objc_msgSend_shouldActivateAnisette(void *a1, const char *a2, ...)
{
  return [a1 shouldActivateAnisette];
}

id objc_msgSend_soldToId(void *a1, const char *a2, ...)
{
  return [a1 soldToId];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subKeys(void *a1, const char *a2, ...)
{
  return [a1 subKeys];
}

id objc_msgSend_submitDeviceRequestPayload(void *a1, const char *a2, ...)
{
  return [a1 submitDeviceRequestPayload];
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return [a1 submitter];
}

id objc_msgSend_teslaRequest(void *a1, const char *a2, ...)
{
  return [a1 teslaRequest];
}

id objc_msgSend_teslaServiceDownError(void *a1, const char *a2, ...)
{
  return [a1 teslaServiceDownError];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return [a1 urlSession];
}

id objc_msgSend_userAgentString(void *a1, const char *a2, ...)
{
  return [a1 userAgentString];
}

id objc_msgSend_userCredentials(void *a1, const char *a2, ...)
{
  return [a1 userCredentials];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validationInfo(void *a1, const char *a2, ...)
{
  return [a1 validationInfo];
}

id objc_msgSend_validationType(void *a1, const char *a2, ...)
{
  return [a1 validationType];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}