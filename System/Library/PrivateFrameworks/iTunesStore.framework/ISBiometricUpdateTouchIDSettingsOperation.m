@interface ISBiometricUpdateTouchIDSettingsOperation
- (AMSBiometricsTokenUpdateTaskShim)shim;
- (BOOL)regeneratePublicKey;
- (BOOL)shouldSuppressAuthPrompts;
- (ISBiometricStore)biometricStore;
- (ISBiometricUpdateTouchIDSettingsOperation)initWithAccountIdentifier:(id)a3;
- (NSArray)certChainExtended;
- (NSArray)certChainPrimary;
- (NSNumber)accountIdentifier;
- (NSString)attestationStringExtendedActions;
- (NSString)attestationStringPurchase;
- (id)_newUpdateTouchIDSettingsOperation;
- (id)resultBlock;
- (int64_t)status;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setAttestationStringExtendedActions:(id)a3;
- (void)setAttestationStringPurchase:(id)a3;
- (void)setBiometricStore:(id)a3;
- (void)setCertChainExtended:(id)a3;
- (void)setCertChainPrimary:(id)a3;
- (void)setRegeneratePublicKey:(BOOL)a3;
- (void)setResultBlock:(id)a3;
- (void)setShouldSuppressAuthPrompts:(BOOL)a3;
@end

@implementation ISBiometricUpdateTouchIDSettingsOperation

- (ISBiometricUpdateTouchIDSettingsOperation)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISBiometricUpdateTouchIDSettingsOperation;
  v5 = [(ISOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    status = (void *)v5->_status;
    v5->_status = v6;

    uint64_t v8 = objc_opt_new();
    attestationStringExtendedActions = v5->_attestationStringExtendedActions;
    v5->_attestationStringExtendedActions = (NSString *)v8;

    *(&v5->super._success + 1) = 1;
    *(&v5->super._success + 2) = 0;
    v5->_resultBlock = (id)-1;
    if (_os_feature_enabled_impl())
    {
      v10 = [[AMSBiometricsTokenUpdateTaskShim alloc] initWithAccountIdentifier:v5->_status];
      certChainExtended = v5->_certChainExtended;
      v5->_certChainExtended = (NSArray *)v10;
    }
  }

  return v5;
}

- (void)run
{
  uint64_t v210 = *MEMORY[0x263EF8340];
  certChainExtended = self->_certChainExtended;
  if (certChainExtended)
  {
    v199[0] = MEMORY[0x263EF8330];
    v199[1] = 3221225472;
    v199[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke;
    v199[3] = &unk_2642616A0;
    v199[4] = self;
    [(NSArray *)certChainExtended runUpdateWithCompletionBlock:v199];
    return;
  }
  v179 = SSGenerateLogCorrelationString();
  if (!+[ISBiometricStore tokenUpdateShouldStartWithLogKey:v179])
  {
    v12 = SSError();
    objc_super v13 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v13)
    {
      objc_super v13 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      v14 |= 2u;
    }
    v15 = [v13 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      *(_DWORD *)v206 = 138543362;
      *(void *)&v206[4] = objc_opt_class();
      id v16 = *(id *)&v206[4];
      LODWORD(v168) = 12;
      v167 = (int *)v206;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, v206, v168);
        v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v167 = v18;
        SSFileLog();
      }
    }
    else
    {
    }
    goto LABEL_227;
  }
  id v4 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    v5 |= 2u;
  }
  uint64_t v6 = [v4 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    int64_t status = self->_status;
    *(_DWORD *)v206 = 138543618;
    *(void *)&v206[4] = v7;
    *(_WORD *)&v206[12] = 2112;
    *(void *)&v206[14] = status;
    id v9 = v7;
    LODWORD(v168) = 22;
    v167 = (int *)v206;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v206, v168);
      v11 = (int *)objc_claimAutoreleasedReturnValue();
      free(v10);
      v167 = v11;
      SSFileLog();
    }
  }
  else
  {
  }
  if ([(ISBiometricUpdateTouchIDSettingsOperation *)self regeneratePublicKey])
  {
    v19 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v19)
    {
      v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v20 = objc_msgSend(v19, "shouldLog", v167);
    if ([v19 shouldLogToDisk]) {
      v20 |= 2u;
    }
    v21 = [v19 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v22 = objc_opt_class();
      *(_DWORD *)v206 = 138543362;
      *(void *)&v206[4] = v22;
      id v23 = v22;
      LODWORD(v168) = 12;
      v167 = (int *)v206;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24) {
        goto LABEL_34;
      }
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, v206, v168);
      free(v24);
      v167 = (int *)v21;
      SSFileLog();
    }

LABEL_34:
    attestationStringExtendedActions = self->_attestationStringExtendedActions;
    int64_t v26 = self->_status;
    id v198 = 0;
    char v27 = [(NSString *)attestationStringExtendedActions deleteKeychainTokensForAccountIdentifier:v26 error:&v198];
    id v28 = v198;
    if (v27)
    {
LABEL_46:

      goto LABEL_47;
    }
    v29 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v29)
    {
      v29 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v30 = objc_msgSend(v29, "shouldLog", v167);
    if ([v29 shouldLogToDisk]) {
      v30 |= 2u;
    }
    v31 = [v29 OSLogObject];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      v30 &= 2u;
    }
    if (v30)
    {
      v32 = objc_opt_class();
      int64_t v33 = self->_status;
      *(_DWORD *)v206 = 138543874;
      *(void *)&v206[4] = v32;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v33;
      *(_WORD *)&v206[22] = 2114;
      v207 = (uint64_t (*)(uint64_t, uint64_t))v28;
      id v34 = v32;
      LODWORD(v168) = 32;
      v167 = (int *)v206;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_45:

        goto LABEL_46;
      }
      v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, v206, v168);
      free(v35);
      v167 = (int *)v31;
      SSFileLog();
    }

    goto LABEL_45;
  }
LABEL_47:
  if (!+[ISBiometricStore shouldUseX509])
  {
    v72 = self->_attestationStringExtendedActions;
    int64_t v73 = self->_status;
    id v184 = 0;
    v177 = [(NSString *)v72 publicKeyDataForAccountIdentifier:v73 purpose:0 error:&v184];
    v74 = v184;
    v75 = self->_attestationStringExtendedActions;
    int64_t v76 = self->_status;
    id v183 = 0;
    v172 = [(NSString *)v75 publicKeyDataForAccountIdentifier:v76 purpose:1 error:&v183];
    id v77 = v183;
    v78 = v77;
    if (v74 && v77)
    {
      v79 = SSError();
      v80 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v80)
      {
        v80 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v81 = [v80 shouldLog];
      if ([v80 shouldLogToDisk]) {
        v81 |= 2u;
      }
      v82 = [v80 OSLogObject];
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        v81 &= 2u;
      }
      if (!v81) {
        goto LABEL_130;
      }
      v83 = objc_opt_class();
      int64_t v84 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v83;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v84;
      id v85 = v83;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v86 = (void *)_os_log_send_and_compose_impl();

      if (v86)
      {
LABEL_129:
        v82 = objc_msgSend(NSString, "stringWithCString:encoding:", v86, 4, v206, v168);
        free(v86);
        v167 = (int *)v82;
        SSFileLog();
LABEL_130:
      }
    }
    else if (v74)
    {
      v79 = v74;
      v80 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v80)
      {
        v80 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v95 = [v80 shouldLog];
      if ([v80 shouldLogToDisk]) {
        v95 |= 2u;
      }
      v82 = [v80 OSLogObject];
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        v95 &= 2u;
      }
      if (!v95) {
        goto LABEL_130;
      }
      v96 = objc_opt_class();
      int64_t v97 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v96;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v97;
      id v98 = v96;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v86 = (void *)_os_log_send_and_compose_impl();

      if (v86) {
        goto LABEL_129;
      }
    }
    else
    {
      if (!v77)
      {
        v79 = 0;
        goto LABEL_132;
      }
      v79 = v77;
      v80 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v80)
      {
        v80 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v105 = [v80 shouldLog];
      if ([v80 shouldLogToDisk]) {
        v105 |= 2u;
      }
      v82 = [v80 OSLogObject];
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        v105 &= 2u;
      }
      if (!v105) {
        goto LABEL_130;
      }
      v106 = objc_opt_class();
      int64_t v107 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v106;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v107;
      id v108 = v106;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v86 = (void *)_os_log_send_and_compose_impl();

      if (v86) {
        goto LABEL_129;
      }
    }

LABEL_132:
    if (!v177 || !v172)
    {
      id v170 = v78;
      dispatch_group_t group = v74;
      v115 = v79;
      goto LABEL_187;
    }
    v109 = self->_attestationStringExtendedActions;
    int64_t v110 = self->_status;
    v182 = v74;
    v111 = [(NSString *)v109 createAttestationDataForAccountIdentifier:v110 purpose:0 error:&v182];
    dispatch_group_t group = v182;

    v112 = self->_attestationStringExtendedActions;
    int64_t v113 = self->_status;
    id v181 = v78;
    v114 = [(NSString *)v112 createAttestationDataForAccountIdentifier:v113 purpose:1 error:&v181];
    id v170 = v181;

    if (group && v170)
    {
      v115 = SSError();

      v116 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v116)
      {
        v116 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v117 = objc_msgSend(v116, "shouldLog", v167);
      if ([v116 shouldLogToDisk]) {
        v117 |= 2u;
      }
      v118 = [v116 OSLogObject];
      if (!os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
        v117 &= 2u;
      }
      if (!v117) {
        goto LABEL_181;
      }
      v119 = objc_opt_class();
      int64_t v120 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v119;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v120;
      id v121 = v119;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v122 = (void *)_os_log_send_and_compose_impl();

      if (!v122) {
        goto LABEL_182;
      }
    }
    else if (group)
    {
      v115 = group;

      v116 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v116)
      {
        v116 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v123 = objc_msgSend(v116, "shouldLog", v167);
      if ([v116 shouldLogToDisk]) {
        v123 |= 2u;
      }
      v118 = [v116 OSLogObject];
      if (!os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
        v123 &= 2u;
      }
      if (!v123) {
        goto LABEL_181;
      }
      v124 = objc_opt_class();
      int64_t v125 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v124;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v125;
      id v126 = v124;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v122 = (void *)_os_log_send_and_compose_impl();

      if (!v122) {
        goto LABEL_182;
      }
    }
    else
    {
      if (!v170)
      {
        v115 = v79;
        if (!v111) {
          goto LABEL_184;
        }
        goto LABEL_183;
      }
      v115 = v170;

      v116 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v116)
      {
        v116 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v133 = objc_msgSend(v116, "shouldLog", v167);
      if ([v116 shouldLogToDisk]) {
        v133 |= 2u;
      }
      v118 = [v116 OSLogObject];
      if (!os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
        v133 &= 2u;
      }
      if (!v133) {
        goto LABEL_181;
      }
      v134 = objc_opt_class();
      int64_t v135 = self->_status;
      *(_DWORD *)v206 = 138543618;
      *(void *)&v206[4] = v134;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v135;
      id v136 = v134;
      LODWORD(v168) = 22;
      v167 = (int *)v206;
      v122 = (void *)_os_log_send_and_compose_impl();

      if (!v122) {
        goto LABEL_182;
      }
    }
    v118 = objc_msgSend(NSString, "stringWithCString:encoding:", v122, 4, v206, v168);
    free(v122);
    v167 = (int *)v118;
    SSFileLog();
LABEL_181:

LABEL_182:
    if (!v111)
    {
LABEL_184:
      if (v114)
      {
        id v140 = v114;
        v141 = (NSString *)ISCopyEncodedBase64((unsigned __int8 *)[v140 bytes], objc_msgSend(v140, "length"));
        attestationStringPurchase = self->_attestationStringPurchase;
        self->_attestationStringPurchase = v141;
      }
LABEL_187:
      if (!self->_accountIdentifier)
      {
        v12 = v115;
LABEL_225:

        goto LABEL_226;
      }
      id v174 = [(ISBiometricUpdateTouchIDSettingsOperation *)self _newUpdateTouchIDSettingsOperation];
      v143 = +[ISDataProvider provider];
      [v174 setDataProvider:v143];

      v180 = v115;
      LODWORD(v143) = [(ISOperation *)self runSubOperation:v174 returningError:&v180];
      v12 = v180;

      if (!v143)
      {
        v145 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v145)
        {
          v145 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v156 = objc_msgSend(v145, "shouldLog", v167);
        if ([v145 shouldLogToDisk]) {
          v156 |= 2u;
        }
        v147 = [v145 OSLogObject];
        if (!os_log_type_enabled(v147, OS_LOG_TYPE_ERROR)) {
          v156 &= 2u;
        }
        if (v156)
        {
          v157 = objc_opt_class();
          id v158 = v157;
          v159 = [v12 localizedDescription];
          *(_DWORD *)v206 = 138543618;
          *(void *)&v206[4] = v157;
          *(_WORD *)&v206[12] = 2114;
          *(void *)&v206[14] = v159;
          LODWORD(v168) = 22;
          v167 = (int *)v206;
          v160 = (void *)_os_log_send_and_compose_impl();

          if (!v160)
          {
LABEL_224:

            goto LABEL_225;
          }
          v147 = objc_msgSend(NSString, "stringWithCString:encoding:", v160, 4, v206, v168);
          free(v160);
          v167 = (int *)v147;
          SSFileLog();
        }
LABEL_223:

        goto LABEL_224;
      }
      v144 = [v174 dataProvider];
      v145 = [v144 output];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v161 = SSError();

        v147 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v147)
        {
          v147 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v162 = [v147 shouldLog];
        if ([v147 shouldLogToDisk]) {
          v162 |= 2u;
        }
        v148 = [v147 OSLogObject];
        if (!os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
          v162 &= 2u;
        }
        if (v162)
        {
          v163 = objc_opt_class();
          *(_DWORD *)v206 = 138543362;
          *(void *)&v206[4] = v163;
          id v164 = v163;
          LODWORD(v168) = 12;
          v167 = (int *)v206;
          v165 = (void *)_os_log_send_and_compose_impl();

          if (!v165)
          {
            v12 = v161;
            goto LABEL_223;
          }
          v148 = objc_msgSend(NSString, "stringWithCString:encoding:", v165, 4, v206, v168);
          free(v165);
          v167 = (int *)v148;
          SSFileLog();
        }
        v12 = v161;
        goto LABEL_222;
      }
      v146 = [v145 objectForKey:@"status"];
      v147 = v146;
      if (v146) {
        self->_id resultBlock = (id)[v146 integerValue];
      }
      v148 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v167);
      if (!v148)
      {
        v148 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v149 = [v148 shouldLog];
      if ([v148 shouldLogToDisk]) {
        v149 |= 2u;
      }
      v150 = [v148 OSLogObject];
      if (!os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT)) {
        v149 &= 2u;
      }
      if (v149)
      {
        v151 = objc_opt_class();
        v152 = NSNumber;
        id resultBlock = self->_resultBlock;
        id v169 = v151;
        v154 = [v152 numberWithInteger:resultBlock];
        *(_DWORD *)v206 = 138543618;
        *(void *)&v206[4] = v151;
        *(_WORD *)&v206[12] = 2114;
        *(void *)&v206[14] = v154;
        LODWORD(v168) = 22;
        v167 = (int *)v206;
        v155 = (void *)_os_log_send_and_compose_impl();

        if (!v155)
        {
LABEL_222:

          goto LABEL_223;
        }
        v150 = objc_msgSend(NSString, "stringWithCString:encoding:", v155, 4, v206, v168);
        free(v155);
        v167 = (int *)v150;
        SSFileLog();
      }

      goto LABEL_222;
    }
LABEL_183:
    id v137 = v111;
    v138 = (NSNumber *)ISCopyEncodedBase64((unsigned __int8 *)[v137 bytes], objc_msgSend(v137, "length"));
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v138;

    goto LABEL_184;
  }
  v36 = dispatch_group_create();
  *(void *)v206 = 0;
  *(void *)&v206[8] = v206;
  *(void *)&v206[16] = 0x3032000000;
  v207 = __Block_byref_object_copy__12;
  v208 = __Block_byref_object_dispose__12;
  id v209 = 0;
  v37 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_22;
  block[3] = &unk_264260CD0;
  block[4] = self;
  block[5] = v206;
  dispatch_group_t group = v36;
  dispatch_group_async(v36, v37, block);

  uint64_t v191 = 0;
  v192 = &v191;
  uint64_t v193 = 0x3032000000;
  v194 = __Block_byref_object_copy__12;
  v195 = __Block_byref_object_dispose__12;
  id v196 = 0;
  v190[0] = MEMORY[0x263EF8330];
  v190[1] = 3221225472;
  v190[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_25;
  v190[3] = &unk_264260CD0;
  v190[4] = self;
  v190[5] = &v191;
  dispatch_group_async(v36, v37, v190);

  dispatch_time_t v38 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(v36, v38))
  {
    v39 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v39)
    {
      v39 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v40 = [v39 shouldLog];
    int v41 = [v39 shouldLogToDisk];
    v42 = [v39 OSLogObject];
    v43 = v42;
    if (v41) {
      v40 |= 2u;
    }
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      v40 &= 2u;
    }
    if (v40)
    {
      v44 = objc_opt_class();
      int v200 = 138543362;
      id v201 = v44;
      id v45 = v44;
      LODWORD(v168) = 12;
      v167 = &v200;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_59:

        goto LABEL_60;
      }
      v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v200, v168);
      free(v46);
      v167 = (int *)v43;
      SSFileLog();
    }

    goto LABEL_59;
  }
LABEL_60:
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  v48 = *(void **)(*(void *)&v206[8] + 40);
  v188[0] = MEMORY[0x263EF8330];
  v188[1] = 3221225472;
  v188[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_27;
  v188[3] = &unk_2642616C8;
  id v49 = v47;
  id v189 = v49;
  [v48 enumerateObjectsUsingBlock:v188];
  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  v51 = (void *)v192[5];
  v186[0] = MEMORY[0x263EF8330];
  v186[1] = 3221225472;
  v186[2] = __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_2;
  v186[3] = &unk_2642616C8;
  id v52 = v50;
  id v187 = v52;
  [v51 enumerateObjectsUsingBlock:v186];
  v53 = (ISBiometricStore *)[v49 copy];
  biometricStore = self->_biometricStore;
  self->_biometricStore = v53;

  v55 = (NSArray *)[v52 copy];
  certChainPrimary = self->_certChainPrimary;
  self->_certChainPrimary = v55;

  if ([*(id *)(*(void *)&v206[8] + 40) count] && objc_msgSend((id)v192[5], "count"))
  {
    id v57 = [(ISBiometricUpdateTouchIDSettingsOperation *)self _newUpdateTouchIDSettingsOperation];
    v58 = +[ISDataProvider provider];
    [v57 setDataProvider:v58];

    id v185 = 0;
    LODWORD(v58) = [(ISOperation *)self runSubOperation:v57 returningError:&v185];
    v12 = v185;
    if (v58)
    {
      v59 = [v57 dataProvider];
      v60 = [v59 output];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v176 = SSError();

        id v61 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v61)
        {
          id v61 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v127 = objc_msgSend(v61, "shouldLog", v167);
        int v128 = [v61 shouldLogToDisk];
        v129 = [v61 OSLogObject];
        v71 = v129;
        if (v128) {
          v127 |= 2u;
        }
        if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
          v127 &= 2u;
        }
        if (v127)
        {
          v130 = objc_opt_class();
          int v200 = 138543362;
          id v201 = v130;
          id v131 = v130;
          LODWORD(v168) = 12;
          v167 = &v200;
          v132 = (void *)_os_log_send_and_compose_impl();

          if (!v132)
          {
LABEL_167:
            v12 = v176;
            goto LABEL_168;
          }
          v71 = objc_msgSend(NSString, "stringWithCString:encoding:", v132, 4, &v200, v168);
          free(v132);
          v167 = (int *)v71;
          SSFileLog();
        }
LABEL_166:

        goto LABEL_167;
      }
      id v61 = v60;
      v173 = [v61 objectForKey:@"status"];
      if (v173) {
        self->_id resultBlock = (id)[v173 integerValue];
      }
      v62 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v167);
      if (!v62)
      {
        v62 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v63 = [v62 shouldLog];
      int v64 = [v62 shouldLogToDisk];
      v175 = v62;
      v65 = [v62 OSLogObject];
      v66 = v65;
      if (v64) {
        v63 |= 2u;
      }
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
        v63 &= 2u;
      }
      if (v63)
      {
        id v67 = (id)objc_opt_class();
        uint64_t v68 = [NSNumber numberWithInteger:self->_resultBlock];
        int v200 = 138543618;
        v171 = v67;
        id v201 = v67;
        __int16 v202 = 2114;
        uint64_t v203 = v68;
        LODWORD(v168) = 22;
        v167 = &v200;
        v69 = (void *)v68;
        v70 = (void *)_os_log_send_and_compose_impl();

        if (!v70)
        {
LABEL_76:

          uint64_t v176 = (uint64_t)v12;
          v71 = v173;
          goto LABEL_166;
        }
        v66 = objc_msgSend(NSString, "stringWithCString:encoding:", v70, 4, &v200, v168);
        free(v70);
        v167 = (int *)v66;
        SSFileLog();
      }

      goto LABEL_76;
    }
    v60 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v60)
    {
      v60 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v99 = objc_msgSend(v60, "shouldLog", v167);
    int v100 = [v60 shouldLogToDisk];
    v101 = [v60 OSLogObject];
    id v61 = v101;
    if (v100) {
      v99 |= 2u;
    }
    if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      v99 &= 2u;
    }
    if (!v99) {
      goto LABEL_168;
    }
    id v102 = (id)objc_opt_class();
    v103 = [v12 localizedDescription];
    int v200 = 138543618;
    id v201 = v102;
    __int16 v202 = 2114;
    uint64_t v203 = (uint64_t)v103;
    LODWORD(v168) = 22;
    v167 = &v200;
    v104 = (void *)_os_log_send_and_compose_impl();

    if (v104)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v104, 4, &v200, v168);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      free(v104);
      v167 = (int *)v61;
      SSFileLog();
LABEL_168:
    }
LABEL_169:

    goto LABEL_170;
  }
  objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v167);
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  if (!v57)
  {
    id v57 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v87 = [v57 shouldLog];
  int v88 = [v57 shouldLogToDisk];
  v89 = [v57 OSLogObject];
  v60 = v89;
  if (v88) {
    v87 |= 2u;
  }
  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
    int v90 = v87;
  }
  else {
    int v90 = v87 & 2;
  }
  if (!v90)
  {
LABEL_100:
    v12 = 0;
    goto LABEL_169;
  }
  id v91 = (id)objc_opt_class();
  v92 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)&v206[8] + 40), "count"));
  v93 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v192[5], "count"));
  int v200 = 138543874;
  id v201 = v91;
  __int16 v202 = 2114;
  uint64_t v203 = (uint64_t)v92;
  __int16 v204 = 2114;
  v205 = v93;
  LODWORD(v168) = 32;
  v167 = &v200;
  v94 = (void *)_os_log_send_and_compose_impl();

  if (v94)
  {
    v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v94, 4, &v200, v168);
    free(v94);
    v167 = (int *)v60;
    SSFileLog();
    goto LABEL_100;
  }
  v12 = 0;
LABEL_170:

  _Block_object_dispose(&v191, 8);
  _Block_object_dispose(v206, 8);

LABEL_226:
  +[ISBiometricStore tokenUpdateDidFinishWithLogKey:v179];
LABEL_227:
  -[ISOperation setError:](self, "setError:", v12, v167);
  [(ISOperation *)self setSuccess:v12 == 0];
  v166 = [(ISBiometricUpdateTouchIDSettingsOperation *)self resultBlock];
  if (v166) {
    ((void (**)(void, int64_t, NSObject *))v166)[2](v166, [(ISBiometricUpdateTouchIDSettingsOperation *)self status], v12);
  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  [*(id *)(a1 + 32) setSuccess:a2];
  uint64_t v5 = [*(id *)(a1 + 32) resultBlock];
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, a2, v7);
  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_22(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  uint64_t v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v35 = 138543362;
    id v36 = (id)objc_opt_class();
    id v6 = v36;
    LODWORD(v33) = 12;
    v32 = &v35;
    id v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v35, v33);
    free(v7);
    v32 = (int *)v5;
    SSFileLog();
  }

LABEL_12:
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 376);
  uint64_t v10 = *(void *)(v8 + 352);
  id v34 = 0;
  uint64_t v11 = [v9 x509CertChainDataForAccountIdentifier:v10 purpose:0 regenerateCerts:1 error:&v34];
  id v12 = v34;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;

  if (!v12) {
    goto LABEL_25;
  }
  v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v15)
  {
    v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = objc_msgSend(v15, "shouldLog", v32);
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_23;
  }
  v19 = objc_opt_class();
  int v35 = 138543618;
  id v36 = v19;
  __int16 v37 = 2114;
  id v38 = v12;
  id v20 = v19;
  LODWORD(v33) = 22;
  v32 = &v35;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v35, v33);
    free(v21);
    v32 = (int *)v18;
    SSFileLog();
LABEL_23:
  }
LABEL_25:
  v22 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v32);
  if (!v22)
  {
    v22 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    int v24 = v23 | 2;
  }
  else {
    int v24 = v23;
  }
  v25 = [v22 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
    v24 &= 2u;
  }
  if (!v24) {
    goto LABEL_35;
  }
  int64_t v26 = objc_opt_class();
  char v27 = NSNumber;
  id v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v29 = v26;
  int v30 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  int v35 = 138543618;
  id v36 = v26;
  __int16 v37 = 2114;
  id v38 = v30;
  LODWORD(v33) = 22;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v35, v33);
    free(v31);
    SSFileLog();
LABEL_35:
  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_25(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  uint64_t v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v35 = 138543362;
    id v36 = (id)objc_opt_class();
    id v6 = v36;
    LODWORD(v33) = 12;
    v32 = &v35;
    id v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v35, v33);
    free(v7);
    v32 = (int *)v5;
    SSFileLog();
  }

LABEL_12:
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 376);
  uint64_t v10 = *(void *)(v8 + 352);
  id v34 = 0;
  uint64_t v11 = [v9 x509CertChainDataForAccountIdentifier:v10 purpose:1 regenerateCerts:1 error:&v34];
  id v12 = v34;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;

  if (!v12) {
    goto LABEL_25;
  }
  v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v15)
  {
    v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = objc_msgSend(v15, "shouldLog", v32);
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_23;
  }
  v19 = objc_opt_class();
  int v35 = 138543618;
  id v36 = v19;
  __int16 v37 = 2114;
  id v38 = v12;
  id v20 = v19;
  LODWORD(v33) = 22;
  v32 = &v35;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v35, v33);
    free(v21);
    v32 = (int *)v18;
    SSFileLog();
LABEL_23:
  }
LABEL_25:
  v22 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v32);
  if (!v22)
  {
    v22 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    int v24 = v23 | 2;
  }
  else {
    int v24 = v23;
  }
  v25 = [v22 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
    v24 &= 2u;
  }
  if (!v24) {
    goto LABEL_35;
  }
  int64_t v26 = objc_opt_class();
  char v27 = NSNumber;
  id v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v29 = v26;
  int v30 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  int v35 = 138543618;
  id v36 = v26;
  __int16 v37 = 2114;
  id v38 = v30;
  LODWORD(v33) = 22;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v35, v33);
    free(v31);
    SSFileLog();
LABEL_35:
  }
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_27(uint64_t a1, id a2)
{
  id v3 = a2;
  int v4 = (unsigned __int8 *)[v3 bytes];
  unint64_t v5 = [v3 length];

  id v6 = (id)ISCopyEncodedBase64(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

void __48__ISBiometricUpdateTouchIDSettingsOperation_run__block_invoke_2(uint64_t a1, id a2)
{
  id v3 = a2;
  int v4 = (unsigned __int8 *)[v3 bytes];
  unint64_t v5 = [v3 length];

  id v6 = (id)ISCopyEncodedBase64(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)_newUpdateTouchIDSettingsOperation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(ISStoreURLOperation);
  id v4 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v4 setITunesStoreRequest:1];
  [v4 setURLBagKey:@"update-touch-id-settings"];
  [v4 setHTTPMethod:@"POST"];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!+[ISBiometricStore shouldUseX509])
  {
    [v5 setObject:self->_accountIdentifier forKey:@"touchIdAttestation"];
    [v5 setObject:self->_attestationStringPurchase forKey:@"extendedAttestation"];
    goto LABEL_34;
  }
  id v6 = [(ISBiometricUpdateTouchIDSettingsOperation *)self certChainPrimary];
  if ([v6 count])
  {
    [v5 setObject:v6 forKey:@"primaryX509Chain"];
    goto LABEL_18;
  }
  id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (!v11) {
    goto LABEL_16;
  }
  id v12 = v6;
  uint64_t v13 = objc_opt_class();
  id v50 = v3;
  int v14 = NSNumber;
  id v47 = v13;
  v15 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  int v53 = 138543618;
  v54 = v13;
  id v6 = v12;
  __int16 v55 = 2112;
  v56 = v15;
  LODWORD(v46) = 22;
  id v45 = &v53;
  int v16 = (void *)_os_log_send_and_compose_impl();

  id v3 = v50;
  if (v16)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v53, v46);
    free(v16);
    id v45 = (int *)v10;
    SSFileLog();
LABEL_16:
  }
LABEL_18:
  int v17 = [(ISBiometricUpdateTouchIDSettingsOperation *)self certChainExtended];
  if (![v17 count])
  {
    v51 = v6;
    v18 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v18)
    {
      v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v18 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    if (v22)
    {
      int v23 = v3;
      int v24 = objc_opt_class();
      id v25 = v5;
      int64_t v26 = NSNumber;
      id v48 = v24;
      char v27 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      int v53 = 138543618;
      v54 = v24;
      id v3 = v23;
      __int16 v55 = 2112;
      v56 = v27;
      LODWORD(v46) = 22;
      id v45 = &v53;
      id v28 = (void *)_os_log_send_and_compose_impl();

      id v5 = v25;
      if (!v28)
      {
LABEL_32:

        id v6 = v51;
        goto LABEL_33;
      }
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v53, v46);
      free(v28);
      id v45 = (int *)v21;
      SSFileLog();
    }

    goto LABEL_32;
  }
  [v5 setObject:v17 forKey:@"extendedX509Chain"];
LABEL_33:

LABEL_34:
  id v52 = objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", v5, 100, 0, 0, v45);
  objc_msgSend(v4, "setHTTPBody:");
  [(ISURLOperation *)v3 setRequestProperties:v4];
  if ([(ISBiometricUpdateTouchIDSettingsOperation *)self shouldSuppressAuthPrompts]) {
    uint64_t v29 = 1000;
  }
  else {
    uint64_t v29 = 0;
  }
  int v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v30)
  {
    int v30 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v31 = [v30 shouldLog];
  if ([v30 shouldLogToDisk]) {
    int v32 = v31 | 2;
  }
  else {
    int v32 = v31;
  }
  uint64_t v33 = [v30 OSLogObject];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
    int v34 = v32;
  }
  else {
    int v34 = v32 & 2;
  }
  if (!v34) {
    goto LABEL_48;
  }
  id v35 = v5;
  id v36 = v4;
  __int16 v37 = self;
  id v38 = v3;
  uint64_t v39 = objc_opt_class();
  int v40 = NSNumber;
  id v49 = v39;
  int v41 = [v40 numberWithInteger:v29];
  int v53 = 138543618;
  v54 = v39;
  id v3 = v38;
  self = v37;
  id v4 = v36;
  id v5 = v35;
  __int16 v55 = 2114;
  v56 = v41;
  LODWORD(v46) = 22;
  v42 = (void *)_os_log_send_and_compose_impl();

  if (v42)
  {
    uint64_t v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v53, v46);
    free(v42);
    SSFileLog();
LABEL_48:
  }
  v43 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:self->_status];
  [v43 setCanCreateNewAccount:0];
  [v43 setCanSetActiveAccount:0];
  [v43 setPromptStyle:v29];
  [(ISURLOperation *)v3 setAuthenticationContext:v43];

  return v3;
}

- (BOOL)regeneratePublicKey
{
  return *(&self->super._success + 1);
}

- (void)setRegeneratePublicKey:(BOOL)a3
{
  *(&self->super._success + 1) = a3;
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
}

- (BOOL)shouldSuppressAuthPrompts
{
  return *(&self->super._success + 2);
}

- (void)setShouldSuppressAuthPrompts:(BOOL)a3
{
  *(&self->super._success + 2) = a3;
}

- (int64_t)status
{
  return (int64_t)self->_resultBlock;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)self->_status;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)attestationStringPurchase
{
  return (NSString *)&self->_accountIdentifier->super.super.isa;
}

- (void)setAttestationStringPurchase:(id)a3
{
}

- (NSString)attestationStringExtendedActions
{
  return self->_attestationStringPurchase;
}

- (void)setAttestationStringExtendedActions:(id)a3
{
}

- (ISBiometricStore)biometricStore
{
  return (ISBiometricStore *)self->_attestationStringExtendedActions;
}

- (void)setBiometricStore:(id)a3
{
}

- (NSArray)certChainPrimary
{
  return (NSArray *)self->_biometricStore;
}

- (void)setCertChainPrimary:(id)a3
{
}

- (NSArray)certChainExtended
{
  return self->_certChainPrimary;
}

- (void)setCertChainExtended:(id)a3
{
}

- (AMSBiometricsTokenUpdateTaskShim)shim
{
  return (AMSBiometricsTokenUpdateTaskShim *)objc_getProperty(self, a2, 400, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certChainExtended, 0);
  objc_storeStrong((id *)&self->_certChainPrimary, 0);
  objc_storeStrong((id *)&self->_biometricStore, 0);
  objc_storeStrong((id *)&self->_attestationStringExtendedActions, 0);
  objc_storeStrong((id *)&self->_attestationStringPurchase, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_regeneratePublicKey, 0);
}

@end