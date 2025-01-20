@interface ISBiometricSignatureOperation
- (BOOL)_promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:(id)a3 accountName:(id)a4;
- (ISBiometricSignatureOperation)initWithBiometricAuthenticationContext:(id)a3 touchIDDialog:(id)a4 fallbackDialog:(id)a5;
- (ISBiometricStore)biometricStore;
- (ISDialog)fallbackDialog;
- (ISTouchIDDialog)touchIDDialog;
- (SSBiometricAuthenticationContext)context;
- (id)outputBlock;
- (void)run;
- (void)setBiometricStore:(id)a3;
- (void)setContext:(id)a3;
- (void)setFallbackDialog:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)setTouchIDDialog:(id)a3;
@end

@implementation ISBiometricSignatureOperation

- (ISBiometricSignatureOperation)initWithBiometricAuthenticationContext:(id)a3 touchIDDialog:(id)a4 fallbackDialog:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ISBiometricSignatureOperation;
  v12 = [(ISOperation *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    biometricStore = v12->_biometricStore;
    v12->_biometricStore = (ISBiometricStore *)v13;

    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v12->_fallbackDialog, a5);
    objc_storeStrong((id *)&v12->_touchIDDialog, a4);
  }

  return v12;
}

- (void)run
{
  v2 = self;
  uint64_t v190 = *MEMORY[0x263EF8340];
  v3 = [(ISBiometricSignatureOperation *)self context];
  v4 = [v3 accountIdentifier];

  v5 = [(ISBiometricSignatureOperation *)v2 context];
  v179 = [v5 challenge];

  v6 = [(ISBiometricSignatureOperation *)v2 biometricStore];
  uint64_t v7 = [v6 biometricAvailabilityForAccountIdentifier:v4];
  v180 = v6;
  v181 = v2;
  switch(v7)
  {
    case 0:
      v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v8)
      {
        v8 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      id v11 = [v8 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        v10 &= 2u;
      }
      if (!v10) {
        goto LABEL_12;
      }
      int v186 = 138543362;
      id v187 = (id)objc_opt_class();
      id v12 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v186, v171);
        free(v13);
        v165 = (int *)v11;
        SSFileLog();
LABEL_12:
      }
      goto LABEL_122;
    case 2:
      v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v14)
      {
        v14 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      v17 = [v14 OSLogObject];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        v16 &= 2u;
      }
      if (!v16) {
        goto LABEL_24;
      }
      int v186 = 138543362;
      id v187 = (id)objc_opt_class();
      id v18 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (v19)
      {
        v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v186, v171);
        free(v19);
        v165 = (int *)v17;
        SSFileLog();
LABEL_24:
      }
      v20 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v20)
      {
        v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v21 = objc_msgSend(v20, "shouldLog", v165);
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      v23 = [v20 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        v22 &= 2u;
      }
      if (!v22) {
        goto LABEL_35;
      }
      v24 = objc_opt_class();
      int v186 = 138543362;
      id v187 = v24;
      id v25 = v24;
      LODWORD(v171) = 12;
      v165 = &v186;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v186, v171);
        free(v26);
        v165 = (int *)v23;
        SSFileLog();
LABEL_35:
      }
      v27 = [(ISBiometricSignatureOperation *)v2 context];
      v28 = [v27 accountName];

      if ([(ISBiometricSignatureOperation *)v2 _promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:v4 accountName:v28])
      {
        v29 = +[ISBiometricStore sharedInstance];
        [v29 saveIdentityMapForAccountIdentifier:v4];

        uint64_t v7 = [v6 biometricAvailabilityForAccountIdentifier:v4];
        goto LABEL_89;
      }
      v42 = [(ISBiometricSignatureOperation *)v2 context];
      [v42 setIsIdentityMapInvalid:1];

      v43 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v43)
      {
        v43 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v44 = objc_msgSend(v43, "shouldLog", v165);
      if ([v43 shouldLogToDisk]) {
        int v45 = v44 | 2;
      }
      else {
        int v45 = v44;
      }
      v46 = [v43 OSLogObject];
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        v45 &= 2u;
      }
      if (!v45) {
        goto LABEL_87;
      }
      v47 = objc_opt_class();
      int v186 = 138543362;
      id v187 = v47;
      id v48 = v47;
      LODWORD(v171) = 12;
      v165 = &v186;
      v49 = (void *)_os_log_send_and_compose_impl();

      if (v49)
      {
        v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v49, 4, &v186, v171);
        free(v49);
        v165 = (int *)v46;
        SSFileLog();
LABEL_87:
      }
      v50 = [(ISBiometricSignatureOperation *)v2 touchIDDialog];
      v51 = [v50 paymentSheet];
      [v51 setMerchantSession:0];

      v52 = [(ISBiometricSignatureOperation *)v2 touchIDDialog];
      v53 = [v52 paymentSheet];
      [v53 setApplePayClassic:0];

      uint64_t v7 = 2;
LABEL_89:

LABEL_90:
      if (v7)
      {
LABEL_91:
        v54 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v165);
        if (!v54)
        {
          v54 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v55 = [v54 shouldLog];
        if ([v54 shouldLogToDisk]) {
          int v56 = v55 | 2;
        }
        else {
          int v56 = v55;
        }
        v57 = [v54 OSLogObject];
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          v56 &= 2u;
        }
        if (v56)
        {
          v58 = objc_opt_class();
          v59 = NSNumber;
          id v60 = v58;
          v61 = [v59 numberWithInteger:v7];
          int v186 = 138543618;
          id v187 = v58;
          __int16 v188 = 2114;
          v189 = v61;
          LODWORD(v171) = 22;
          v166 = &v186;
          v62 = (void *)_os_log_send_and_compose_impl();

          v2 = v181;
          if (!v62)
          {
LABEL_102:

            id v63 = [(ISBiometricSignatureOperation *)v2 touchIDDialog];
            v64 = [v63 paymentSheet];
            if (v64)
            {
              v65 = [(ISBiometricSignatureOperation *)v2 context];
              [v65 setPaymentSheet:v64];
            }
            v66 = [(ISBiometricSignatureOperation *)v2 context];
            char v67 = [v66 isExtendedAction];

            if (v67)
            {
              v68 = SSError();
              v69 = [NSNumber numberWithInteger:v7];
              SSErrorBySettingUserInfoValue();
              v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_117:

              v76 = 0;
              v77 = 0;
              v78 = 0;
LABEL_118:

              v79 = v70;
              v2 = v181;
              goto LABEL_119;
            }
            v69 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
            if (!v69)
            {
              v69 = [MEMORY[0x263F7B1F8] sharedConfig];
            }
            int v71 = [v69 shouldLog];
            if ([v69 shouldLogToDisk]) {
              int v72 = v71 | 2;
            }
            else {
              int v72 = v71;
            }
            v68 = [v69 OSLogObject];
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
              v72 &= 2u;
            }
            if (!v72)
            {
LABEL_116:
              v70 = 0;
              goto LABEL_117;
            }
            v73 = objc_opt_class();
            int v186 = 138543362;
            id v187 = v73;
            id v74 = v73;
            LODWORD(v171) = 12;
            v167 = &v186;
            v75 = (void *)_os_log_send_and_compose_impl();

            if (v75)
            {
              v68 = objc_msgSend(NSString, "stringWithCString:encoding:", v75, 4, &v186, v171);
              free(v75);
              v167 = (int *)v68;
              SSFileLog();
              goto LABEL_116;
            }
LABEL_193:
            v76 = 0;
            v77 = 0;
            v78 = 0;
            v70 = 0;
            goto LABEL_118;
          }
          v57 = objc_msgSend(NSString, "stringWithCString:encoding:", v62, 4, &v186, v171);
          free(v62);
          v166 = (int *)v57;
          SSFileLog();
        }

        goto LABEL_102;
      }
LABEL_122:
      v82 = [(ISBiometricSignatureOperation *)v2 context];
      unsigned int v83 = [v82 isExtendedAction];
      char v84 = v83;
      uint64_t v85 = v83;

      if (v84) {
        goto LABEL_140;
      }
      v86 = [(ISBiometricSignatureOperation *)v2 touchIDDialog];
      uint64_t v87 = [v86 isDualAction];

      v88 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v88)
      {
        v88 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v89 = [v88 shouldLog];
      if ([v88 shouldLogToDisk]) {
        int v90 = v89 | 2;
      }
      else {
        int v90 = v89;
      }
      v91 = [v88 OSLogObject];
      if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
        v90 &= 2u;
      }
      if (!v90) {
        goto LABEL_133;
      }
      v92 = objc_opt_class();
      v93 = NSNumber;
      id v94 = v92;
      v95 = [v93 numberWithBool:v87];
      int v186 = 138543618;
      id v187 = v92;
      __int16 v188 = 2114;
      v189 = v95;
      LODWORD(v171) = 22;
      v168 = &v186;
      v96 = (void *)_os_log_send_and_compose_impl();

      v2 = v181;
      if (v96)
      {
        v91 = objc_msgSend(NSString, "stringWithCString:encoding:", v96, 4, &v186, v171);
        free(v96);
        v168 = (int *)v91;
        SSFileLog();
LABEL_133:
      }
      if (!v87) {
        goto LABEL_140;
      }
      if (+[ISBiometricStore shouldUseApplePayClassic])
      {
        v97 = [(ISBiometricSignatureOperation *)v2 context];
        BOOL v98 = +[ISBiometricStore isActionSupported:3 withBiometricAuthenticationContext:v97];

        if (!+[ISBiometricStore shouldUseAutoEnrollment]) {
          goto LABEL_154;
        }
        goto LABEL_139;
      }
      if (+[ISBiometricStore shouldUseAutoEnrollment])
      {
LABEL_139:
        v99 = [(ISBiometricSignatureOperation *)v2 context];
        uint64_t v100 = 4;
        goto LABEL_153;
      }
LABEL_140:
      v101 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v168);
      if (!v101)
      {
        v101 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v102 = [v101 shouldLog];
      if ([v101 shouldLogToDisk]) {
        int v103 = v102 | 2;
      }
      else {
        int v103 = v102;
      }
      v104 = [v101 OSLogObject];
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
        v103 &= 2u;
      }
      if (!v103) {
        goto LABEL_150;
      }
      v105 = objc_opt_class();
      v106 = NSNumber;
      id v107 = v105;
      v108 = [v106 numberWithInteger:v85];
      int v186 = 138543618;
      id v187 = v105;
      __int16 v188 = 2114;
      v189 = v108;
      LODWORD(v171) = 22;
      v168 = &v186;
      v109 = (void *)_os_log_send_and_compose_impl();

      v2 = v181;
      if (v109)
      {
        v104 = objc_msgSend(NSString, "stringWithCString:encoding:", v109, 4, &v186, v171);
        free(v109);
        v168 = (int *)v104;
        SSFileLog();
LABEL_150:
      }
      if (v85) {
        goto LABEL_155;
      }
      v99 = [(ISBiometricSignatureOperation *)v2 context];
      uint64_t v100 = 1;
LABEL_153:
      BOOL v98 = +[ISBiometricStore isActionSupported:withBiometricAuthenticationContext:](ISBiometricStore, "isActionSupported:withBiometricAuthenticationContext:", v100, v99, v168);

LABEL_154:
      if (!v98)
      {
        v130 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v130)
        {
          v130 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v131 = objc_msgSend(v130, "shouldLog", v168);
        if ([v130 shouldLogToDisk]) {
          int v132 = v131 | 2;
        }
        else {
          int v132 = v131;
        }
        v133 = [v130 OSLogObject];
        if (!os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT)) {
          v132 &= 2u;
        }
        if (v132)
        {
          v134 = objc_opt_class();
          int v186 = 138543362;
          id v187 = v134;
          id v135 = v134;
          LODWORD(v171) = 12;
          v170 = &v186;
          v136 = (void *)_os_log_send_and_compose_impl();

          if (!v136) {
            goto LABEL_181;
          }
          v133 = objc_msgSend(NSString, "stringWithCString:encoding:", v136, 4, &v186, v171);
          free(v136);
          v170 = (int *)v133;
          SSFileLog();
        }

LABEL_181:
        v137 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v137)
        {
          v137 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v138 = objc_msgSend(v137, "shouldLog", v170);
        if ([v137 shouldLogToDisk]) {
          int v139 = v138 | 2;
        }
        else {
          int v139 = v138;
        }
        v140 = [v137 OSLogObject];
        if (!os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
          v139 &= 2u;
        }
        if (v139)
        {
          v141 = objc_opt_class();
          int v186 = 138543618;
          id v187 = v141;
          __int16 v188 = 2114;
          v189 = @"Incorrect ACL version";
          id v142 = v141;
          LODWORD(v171) = 22;
          v143 = (void *)_os_log_send_and_compose_impl();

          if (!v143)
          {
LABEL_192:

            id v63 = [NSString stringWithFormat:@"mt-tid-%@", v4];
            uint64_t v184 = *MEMORY[0x263F08128];
            id v185 = v63;
            v64 = [NSDictionary dictionaryWithObjects:&v185 forKeys:&v184 count:1];
            v69 = [MEMORY[0x263F7B380] sharedStorage];
            [v69 removeCookiesWithProperties:v64];
            goto LABEL_193;
          }
          v140 = objc_msgSend(NSString, "stringWithCString:encoding:", v143, 4, &v186, v171);
          free(v143);
          SSFileLog();
        }

        goto LABEL_192;
      }
LABEL_155:
      unint64_t v110 = 0x263F7B000uLL;
      v111 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v168);
      if (!v111)
      {
        v111 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v112 = [v111 shouldLog];
      if ([v111 shouldLogToDisk]) {
        int v113 = v112 | 2;
      }
      else {
        int v113 = v112;
      }
      v114 = [v111 OSLogObject];
      if (!os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT)) {
        v113 &= 2u;
      }
      if (v113)
      {
        v115 = objc_opt_class();
        int v186 = 138543362;
        id v187 = v115;
        id v116 = v115;
        LODWORD(v171) = 12;
        v169 = &v186;
        v117 = (void *)_os_log_send_and_compose_impl();

        if (!v117) {
          goto LABEL_166;
        }
        v114 = objc_msgSend(NSString, "stringWithCString:encoding:", v117, 4, &v186, v171);
        free(v117);
        v169 = (int *)v114;
        SSFileLog();
      }

LABEL_166:
      id v183 = 0;
      id v63 = [v6 publicKeyDataForAccountIdentifier:v4 purpose:v85 error:&v183];
      v79 = (__CFString *)v183;
      if (v63)
      {
        id v63 = v63;
        v64 = (void *)ISCopyEncodedBase64((unsigned __int8 *)[v63 bytes], objc_msgSend(v63, "length"));
        v69 = [v179 stringByAppendingString:v64];
        v178 = [v69 dataUsingEncoding:4];
        v118 = [(ISBiometricSignatureOperation *)v2 touchIDDialog];
        v174 = v4;
        v175 = v118;
        if (v118)
        {
          v119 = (void *)MEMORY[0x263F7B2A8];
          v120 = [v118 body];
          [(ISBiometricSignatureOperation *)v2 context];
          v122 = v121 = v2;
          v123 = [v122 accountName];
          v177 = [v119 stringWithFormattedUsernameForString:v120 username:v123];

          v124 = [v175 buttonForButtonType:0];
          uint64_t v125 = [v124 title];

          v176 = [v175 title];
          v126 = [v175 paymentSheet];

          if (!v126)
          {
            v2 = v121;
            v6 = v180;
            unint64_t v110 = 0x263F7B000uLL;
            goto LABEL_207;
          }
          v127 = [(ISBiometricSignatureOperation *)v121 context];
          [v175 paymentSheet];
          v129 = uint64_t v128 = v125;
          [v127 setPaymentSheet:v129];

          uint64_t v125 = v128;
          v2 = v121;
          v6 = v180;
          unint64_t v110 = 0x263F7B000;
        }
        else
        {
          v127 = [(ISBiometricSignatureOperation *)v2 context];
          [v127 accountName];
          v177 = v176 = 0;
          uint64_t v125 = 0;
        }

LABEL_207:
        id v147 = objc_alloc_init(MEMORY[0x263F7B140]);
        [v147 setCancelLabel:v125];
        [v147 setReason:v177];
        [v147 setTitle:v176];
        v148 = [(ISBiometricSignatureOperation *)v2 context];
        v172 = v147;
        [v148 setConsolidatedDialog:v147];

        v149 = [(ISBiometricSignatureOperation *)v2 context];
        v182 = v79;
        v150 = [v6 signData:v178 context:v149 error:&v182];
        v70 = v182;

        v173 = (void *)v125;
        if (v150 && !v70)
        {
          id v151 = v150;
          v78 = (void *)ISCopyEncodedBase64((unsigned __int8 *)[v151 bytes], objc_msgSend(v151, "length"));
          [v6 saveIdentityMapForAccountIdentifier:v174];
          v152 = [*(id *)(v110 + 504) sharediTunesStoreConfig];
          if (!v152)
          {
            v152 = [*(id *)(v110 + 504) sharedConfig];
          }
          int v153 = objc_msgSend(v152, "shouldLog", v169);
          if ([v152 shouldLogToDisk]) {
            int v154 = v153 | 2;
          }
          else {
            int v154 = v153;
          }
          v155 = [v152 OSLogObject];
          if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG)) {
            v154 &= 2u;
          }
          if (!v154) {
            goto LABEL_230;
          }
          v156 = objc_opt_class();
          int v186 = 138543362;
          id v187 = v156;
          id v157 = v156;
          LODWORD(v171) = 12;
          v167 = &v186;
          v158 = (void *)_os_log_send_and_compose_impl();

          if (v158)
          {
            v155 = objc_msgSend(NSString, "stringWithCString:encoding:", v158, 4, &v186, v171);
            free(v158);
            v167 = (int *)v155;
            SSFileLog();
LABEL_230:
          }
LABEL_231:

          v163 = [(ISBiometricSignatureOperation *)v181 context];
          v77 = [v163 paymentTokenData];

          v164 = [(ISBiometricSignatureOperation *)v181 context];
          v76 = [v164 fpanID];

          v4 = v174;
          goto LABEL_118;
        }
        v152 = objc_msgSend(*(id *)(v110 + 504), "sharediTunesStoreConfig", v169);
        if (!v152)
        {
          v152 = [*(id *)(v110 + 504) sharedConfig];
        }
        int v159 = [v152 shouldLog];
        if ([v152 shouldLogToDisk]) {
          int v160 = v159 | 2;
        }
        else {
          int v160 = v159;
        }
        v155 = [v152 OSLogObject];
        if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
          v160 &= 2u;
        }
        if (v160)
        {
          v161 = objc_opt_class();
          int v186 = 138543618;
          id v187 = v161;
          __int16 v188 = 2114;
          v189 = v70;
          id v162 = v161;
          LODWORD(v171) = 22;
          v167 = &v186;
          v78 = (void *)_os_log_send_and_compose_impl();

          if (!v78) {
            goto LABEL_231;
          }
          v155 = objc_msgSend(NSString, "stringWithCString:encoding:", v78, 4, &v186, v171);
          free(v78);
          v167 = (int *)v155;
          SSFileLog();
        }
        v78 = 0;
        goto LABEL_230;
      }
      v64 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v64)
      {
        v64 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v144 = objc_msgSend(v64, "shouldLog", v169);
      if ([v64 shouldLogToDisk]) {
        v144 |= 2u;
      }
      v69 = [v64 OSLogObject];
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        v144 &= 2u;
      }
      if (!v144)
      {
LABEL_203:
        v76 = 0;
        v77 = 0;
        v78 = 0;
        v70 = v79;
        goto LABEL_118;
      }
      v145 = objc_opt_class();
      int v186 = 138543618;
      id v187 = v145;
      __int16 v188 = 2114;
      v189 = v79;
      id v146 = v145;
      LODWORD(v171) = 22;
      v167 = &v186;
      v77 = (void *)_os_log_send_and_compose_impl();

      if (v77)
      {
        v69 = objc_msgSend(NSString, "stringWithCString:encoding:", v77, 4, &v186, v171);
        free(v77);
        v167 = (int *)v69;
        SSFileLog();
        goto LABEL_203;
      }
      v76 = 0;
      v78 = 0;
LABEL_119:

      [(ISOperation *)v2 setError:v79];
      -[ISOperation setSuccess:](v2, "setSuccess:", v78 != 0, v167);
      uint64_t v80 = [(ISBiometricSignatureOperation *)v2 outputBlock];
      v81 = (void *)v80;
      if (v80) {
        (*(void (**)(uint64_t, void *, void *, void *, __CFString *))(v80 + 16))(v80, v78, v77, v76, v79);
      }

      return;
    case 3:
      v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v31 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v32 = v31 | 2;
      }
      else {
        int v32 = v31;
      }
      v33 = [v30 OSLogObject];
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        v32 &= 2u;
      }
      if (v32) {
        goto LABEL_73;
      }
      goto LABEL_75;
    case 4:
      v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v34 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v35 = v34 | 2;
      }
      else {
        int v35 = v34;
      }
      v33 = [v30 OSLogObject];
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        v35 &= 2u;
      }
      if (v35) {
        goto LABEL_73;
      }
      goto LABEL_75;
    case 5:
      v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v36 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v37 = v36 | 2;
      }
      else {
        int v37 = v36;
      }
      v33 = [v30 OSLogObject];
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        v37 &= 2u;
      }
      if (v37) {
        goto LABEL_73;
      }
      goto LABEL_75;
    case 6:
      v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v38 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v39 = v38 | 2;
      }
      else {
        int v39 = v38;
      }
      v33 = [v30 OSLogObject];
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        v39 &= 2u;
      }
      if (!v39) {
        goto LABEL_75;
      }
LABEL_73:
      int v186 = 138543362;
      id v187 = (id)objc_opt_class();
      id v40 = v187;
      LODWORD(v171) = 12;
      v165 = &v186;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (v41)
      {
        v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v186, v171);
        free(v41);
        v165 = (int *)v33;
        SSFileLog();
LABEL_75:
      }
      goto LABEL_91;
    default:
      goto LABEL_90;
  }
}

- (BOOL)_promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier:(id)a3 accountName:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = +[ISDevice sharedInstance];
  uint64_t v9 = [v8 deviceBiometricStyle];

  int v10 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:v7];
  [v10 setCanCreateNewAccount:0];
  [v10 setCanSetActiveAccount:0];
  [v10 setPromptStyle:1];
  [v10 setShouldCreateNewSession:1];
  v62 = v6;
  if ([v6 length])
  {
    if (v9 == 3)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = v12;
      v14 = @"PROMPT_REASON_NEW_FACE_FORMAT_%@";
      goto LABEL_9;
    }
    if (v9 == 2)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = v12;
      v14 = @"PROMPT_REASON_NEW_FINGERS_FORMAT_%@";
LABEL_9:
      v17 = [v12 localizedStringForKey:v14 value:&stru_26C6A2310 table:@"Mesa"];
      id v18 = objc_msgSend(v11, "stringWithFormat:", v17, v6);

LABEL_22:
      goto LABEL_36;
    }
    v19 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v19)
    {
      v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    int v22 = [v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      int v23 = v21;
    }
    else {
      int v23 = v21 & 2;
    }
    if (!v23) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v9 == 3)
  {
    int v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = v15;
    int v16 = @"PROMPT_REASON_NEW_FACE_ANONYMOUS";
    goto LABEL_21;
  }
  if (v9 == 2)
  {
    int v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = v15;
    int v16 = @"PROMPT_REASON_NEW_FINGERS_ANONYMOUS";
LABEL_21:
    id v18 = [v15 localizedStringForKey:v16 value:&stru_26C6A2310 table:@"Mesa"];
    goto LABEL_22;
  }
  v19 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v19)
  {
    v19 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v24 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  int v22 = [v19 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    int v26 = v25;
  }
  else {
    int v26 = v25 & 2;
  }
  if (!v26) {
    goto LABEL_34;
  }
LABEL_32:
  int v65 = 138543362;
  id v66 = (id)objc_opt_class();
  id v27 = v66;
  LODWORD(v60) = 12;
  v58 = &v65;
  v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v65, v60);
    free(v28);
    v58 = (int *)v22;
    SSFileLog();
LABEL_34:
  }
  id v18 = 0;
LABEL_36:
  objc_msgSend(v10, "setReasonDescription:", v18, v58);
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
  v30 = objc_alloc_init(ISServerAuthenticationOperation);
  [(ISServerAuthenticationOperation *)v30 setAuthenticationContext:v10];
  int v31 = [(ISBiometricSignatureOperation *)self fallbackDialog];
  [(ISServerAuthenticationOperation *)v30 setDialog:v31];

  [(ISServerAuthenticationOperation *)v30 setPerformsButtonAction:0];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __112__ISBiometricSignatureOperation__promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier_accountName___block_invoke;
  v63[3] = &unk_264260B58;
  v63[4] = self;
  int v32 = v29;
  v64 = v32;
  [(ISServerAuthenticationOperation *)v30 setCompletionBlock:v63];
  v33 = +[ISOperationQueue mainQueue];
  [v33 addOperation:v30];

  dispatch_time_t v34 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v32, v34)) {
    goto LABEL_50;
  }
  int v35 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v35)
  {
    int v35 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v36 = [v35 shouldLog];
  if ([v35 shouldLogToDisk]) {
    int v37 = v36 | 2;
  }
  else {
    int v37 = v36;
  }
  int v38 = [v35 OSLogObject];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    int v39 = v37;
  }
  else {
    int v39 = v37 & 2;
  }
  if (!v39) {
    goto LABEL_48;
  }
  id v40 = objc_opt_class();
  int v65 = 138543362;
  id v66 = v40;
  id v41 = v40;
  LODWORD(v60) = 12;
  v59 = &v65;
  v42 = (void *)_os_log_send_and_compose_impl();

  if (v42)
  {
    int v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v65, v60);
    free(v42);
    v59 = (int *)v38;
    SSFileLog();
LABEL_48:
  }
LABEL_50:
  BOOL v43 = [(ISOperation *)v30 success];
  int v44 = [(ISOperation *)v30 error];

  if (v44)
  {
    int v45 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v45)
    {
      int v45 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v46 = [v45 shouldLog];
    if ([v45 shouldLogToDisk]) {
      int v47 = v46 | 2;
    }
    else {
      int v47 = v46;
    }
    id v48 = [v45 OSLogObject];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      int v49 = v47;
    }
    else {
      int v49 = v47 & 2;
    }
    if (v49)
    {
      v50 = objc_opt_class();
      id v61 = v50;
      [(ISOperation *)v30 error];
      v51 = v32;
      BOOL v52 = v43;
      v53 = v10;
      int v55 = v54 = v18;
      int v65 = 138543618;
      id v66 = v50;
      __int16 v67 = 2114;
      v68 = v55;
      LODWORD(v60) = 22;
      int v56 = (void *)_os_log_send_and_compose_impl();

      id v18 = v54;
      int v10 = v53;
      BOOL v43 = v52;
      int v32 = v51;

      if (!v56)
      {
LABEL_63:

        goto LABEL_64;
      }
      id v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, &v65, v60);
      free(v56);
      SSFileLog();
    }

    goto LABEL_63;
  }
LABEL_64:

  return v43;
}

intptr_t __112__ISBiometricSignatureOperation__promptUserToAuthenticateForIdentityMapChangeWithAccountIdentifier_accountName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
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
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setOutputBlock:(id)a3
{
}

- (ISBiometricStore)biometricStore
{
  return self->_biometricStore;
}

- (void)setBiometricStore:(id)a3
{
}

- (SSBiometricAuthenticationContext)context
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
}

- (void)setContext:(id)a3
{
}

- (ISDialog)fallbackDialog
{
  return self->_fallbackDialog;
}

- (void)setFallbackDialog:(id)a3
{
}

- (ISTouchIDDialog)touchIDDialog
{
  return self->_touchIDDialog;
}

- (void)setTouchIDDialog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDialog, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_biometricStore, 0);

  objc_storeStrong(&self->_outputBlock, 0);
}

@end