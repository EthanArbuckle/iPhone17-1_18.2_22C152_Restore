@interface RedeemCodesProtocolDataProvider
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (ISDialogButton)dialogButton;
- (void)setDialogButton:(id)a3;
@end

@implementation RedeemCodesProtocolDataProvider

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v84 = 0;
  v85 = (id *)&v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_1000F60C0;
  v88 = sub_1000F60D0;
  id v89 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  [v5 setPerformsButtonAction:0];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = sub_1000F60C0;
  v74 = sub_1000F60D0;
  id v75 = 0;
  v61 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  v6 = [v5 dialog];
  v7 = [v6 paymentSheet];

  if (!v7) {
    goto LABEL_59;
  }
  v59 = [v5 authenticationContext];
  v8 = [[DisplayPaymentSheetOperation alloc] initWithPaymentSheet:v7];
  v9 = [v59 requiredUniqueIdentifier];
  [(DisplayPaymentSheetOperation *)v8 setAccountIdentifier:v9];

  v10 = [v7 defaultAuthKitAuthenticationContext];
  [(DisplayPaymentSheetOperation *)v8 setAuthenticationContext:v10];

  v11 = [v7 dialogId];
  [(DisplayPaymentSheetOperation *)v8 setDialogId:v11];

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000F60D8;
  v64[3] = &unk_1003A42C0;
  id v12 = v61;
  id v65 = v12;
  v66 = &v84;
  v67 = &v76;
  v68 = &v70;
  v69 = &v80;
  [(DisplayPaymentSheetOperation *)v8 setCompletionHandler:v64];
  v13 = [[DisplayPaymentSheetContainerOperation alloc] initWithDisplayPaymentSheetOperation:v8];
  if (!v13)
  {
    v25 = +[SSLogConfig sharedDaemonConfig];
    if (!v25)
    {
      v25 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v25 shouldLog];
    unsigned int v27 = [v25 shouldLogToDisk];
    v28 = [v25 OSLogObject];
    v29 = v28;
    if (v27) {
      v26 |= 2u;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      int v30 = v26;
    }
    else {
      int v30 = v26 & 2;
    }
    if (v30)
    {
      int v90 = 138543362;
      id v91 = v12;
      LODWORD(v58) = 12;
      v57 = &v90;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
        v22 = 0;
        goto LABEL_40;
      }
      v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v90, v58);
      free(v31);
      v57 = (int *)v29;
      SSFileLog();
    }
    v22 = 0;
    goto LABEL_39;
  }
  v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v15 = [v14 shouldLog];
  unsigned int v16 = [v14 shouldLogToDisk];
  v17 = [v14 OSLogObject];
  v18 = v17;
  if (v16) {
    v15 |= 2u;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
    int v19 = v15;
  }
  else {
    int v19 = v15 & 2;
  }
  if (v19)
  {
    int v90 = 138543362;
    id v91 = v12;
    LODWORD(v58) = 12;
    v57 = &v90;
    v20 = (void *)_os_log_send_and_compose_impl();

    if (!v20) {
      goto LABEL_14;
    }
    v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v90, v58);
    free(v20);
    v57 = (int *)v18;
    SSFileLog();
  }

LABEL_14:
  id v63 = 0;
  [(RedeemCodesProtocolDataProvider *)self runSubOperation:v13 error:&v63];
  id v21 = v63;
  v22 = v21;
  if (!v21) {
    goto LABEL_41;
  }
  v23 = [v21 domain];
  if ([v23 isEqualToString:SSErrorDomain])
  {
    BOOL v24 = [v22 code] == (id)140;

    if (v24) {
      *((unsigned char *)v77 + 24) = 1;
    }
  }
  else
  {
  }
  v25 = +[SSLogConfig sharedDaemonConfig];
  if (!v25)
  {
    v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v32 = [v25 shouldLog];
  unsigned int v33 = [v25 shouldLogToDisk];
  v34 = [v25 OSLogObject];
  v29 = v34;
  if (v33) {
    v32 |= 2u;
  }
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    v32 &= 2u;
  }
  if (!v32) {
    goto LABEL_39;
  }
  v35 = objc_opt_class();
  int v90 = 138543618;
  id v91 = v35;
  __int16 v92 = 2114;
  v93 = v22;
  id v36 = v35;
  LODWORD(v58) = 22;
  v57 = &v90;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v90, v58);
    free(v37);
    v57 = (int *)v29;
    SSFileLog();
LABEL_39:
  }
LABEL_40:

LABEL_41:
  if (*((unsigned char *)v81 + 24))
  {
    v38 = [v5 authenticationContext];
    id v39 = [v38 mutableCopy];

    if (v71[5])
    {
      objc_msgSend(v39, "setPasswordEquivalentToken:");
      [v5 setAuthenticationContext:v39];
    }
  }
  if (v13 && *((unsigned char *)v77 + 24))
  {
    if (!*((unsigned char *)v81 + 24)) {
      goto LABEL_48;
    }
LABEL_60:
    -[RedeemCodesProtocolDataProvider setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", objc_msgSend(v5, "authenticatedAccountCredentialSource", v57));
    v52 = [v5 authenticatedAccountDSID];
    [(RedeemCodesProtocolDataProvider *)self setAuthenticatedAccountDSID:v52];

    v40 = [v5 redirectURL];
    [(RedeemCodesProtocolDataProvider *)self setRedirectURL:v40];
    goto LABEL_61;
  }
LABEL_59:
  v50 = v85;
  id obj = v85[5];
  unsigned int v51 = -[RedeemCodesProtocolDataProvider runSubOperation:error:](self, "runSubOperation:error:", v5, &obj, v57);
  objc_storeStrong(v50 + 5, obj);
  *((unsigned char *)v81 + 24) = v51;
  if (v51) {
    goto LABEL_60;
  }
LABEL_48:
  v40 = +[SSLogConfig sharedDaemonConfig];
  if (!v40)
  {
    v40 = +[SSLogConfig sharedConfig];
  }
  unsigned int v41 = [v40 shouldLog];
  unsigned int v42 = [v40 shouldLogToDisk];
  v43 = [v40 OSLogObject];
  v44 = v43;
  if (v42) {
    v41 |= 2u;
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
    int v45 = v41;
  }
  else {
    int v45 = v41 & 2;
  }
  if (!v45) {
    goto LABEL_58;
  }
  v46 = objc_opt_class();
  id v47 = v85[5];
  int v90 = 138543618;
  id v91 = v46;
  __int16 v92 = 2114;
  v93 = v47;
  id v48 = v46;
  LODWORD(v58) = 22;
  v49 = (void *)_os_log_send_and_compose_impl();

  if (v49)
  {
    v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v90, v58);
    free(v49);
    SSFileLog();
LABEL_58:
  }
LABEL_61:

  v53 = [v5 performedButton];
  [(RedeemCodesProtocolDataProvider *)self setDialogButton:v53];
  int v54 = *((unsigned __int8 *)v81 + 24);
  if (a4 && !*((unsigned char *)v81 + 24))
  {
    *a4 = v85[5];
    int v54 = *((unsigned __int8 *)v81 + 24);
  }
  BOOL v55 = v54 != 0;

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  return v55;
}

- (ISDialogButton)dialogButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDialogButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end