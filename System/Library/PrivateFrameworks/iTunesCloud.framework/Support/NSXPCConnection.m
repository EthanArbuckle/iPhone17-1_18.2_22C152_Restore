@interface NSXPCConnection
- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3;
- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3 validationReason:(int64_t)a4;
@end

@implementation NSXPCConnection

- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3 validationReason:(int64_t)a4
{
  uint64_t v7 = [(NSXPCConnection *)self processIdentifier];
  [(NSXPCConnection *)self auditToken];
  memset(buf, 0, 32);
  MSVBundleIDForAuditToken();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ICCloudServerSupportedServiceGetName();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = (int)v7;
      *(_WORD *)&buf[32] = 2114;
      *(void *)&buf[34] = v9;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Incoming XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].", buf, 0x34u);
    }
  }
  if (a3 != 4 && a3 != 1)
  {
LABEL_14:
    memset(buf, 0, 32);
    if (!TCCAccessCheckAuditToken())
    {
      if (!a4)
      {
        v17 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544642;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v7;
          *(_WORD *)&buf[28] = 2114;
          *(void *)&buf[30] = v9;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = a3;
          *(_WORD *)&buf[48] = 2114;
          *(void *)&buf[50] = @"TCC not granted";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Refusing XPC connection %{public}@ from %{public}@[%d] for %{public}@[%ld]: %{public}@.", buf, 0x3Au);
        }
      }
      uint64_t v18 = MSVAutoBugCaptureDomainiTunesCloud;
      v24[0] = @"processIdentifier";
      uint64_t v19 = +[NSNumber numberWithInt:v7];
      v12 = (void *)v19;
      if (v8) {
        CFStringRef v20 = v8;
      }
      else {
        CFStringRef v20 = &stru_1001BF9F0;
      }
      v25[0] = v19;
      v25[1] = v20;
      v24[1] = @"bundleID";
      v24[2] = @"serviceName";
      v24[3] = @"refusalReason";
      if (v9) {
        CFStringRef v21 = v9;
      }
      else {
        CFStringRef v21 = &stru_1001BF9F0;
      }
      v25[2] = v21;
      v25[3] = @"TCC not granted";
      v15 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
      v26 = v15;
      v22 = +[NSArray arrayWithObjects:&v26 count:1];
      +[MSVAutoBugCapture snapshotWithDomain:v18 type:@"Bug" subType:@"RefuseXPCConnection" context:&stru_1001BF9F0 triggerThresholdValues:0 events:v22 completion:0];

      BOOL v16 = 0;
      goto LABEL_27;
    }
    goto LABEL_15;
  }
  uint64_t v11 = ICCloudServiceEntitlementStatusAccessExemptedFromUserConsentRequirement;
  v12 = [(NSXPCConnection *)self valueForEntitlement:ICCloudServiceEntitlementStatusAccessExemptedFromUserConsentRequirement];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_14;
  }
  unsigned int v13 = [v12 BOOLValue];
  char v14 = v13;
  if (!a4 && v13)
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Client has %{public}@ entitlement. No need to check TCC access for cloud status monitor connection.", buf, 0x16u);
    }
    BOOL v16 = 1;
LABEL_27:

    goto LABEL_28;
  }

  if ((v14 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  BOOL v16 = 1;
LABEL_28:

  return v16;
}

- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3
{
  return [(NSXPCConnection *)self icd_isConnectionAllowedForService:a3 validationReason:0];
}

@end