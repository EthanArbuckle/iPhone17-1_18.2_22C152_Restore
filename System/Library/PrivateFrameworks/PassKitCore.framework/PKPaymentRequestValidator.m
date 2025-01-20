@interface PKPaymentRequestValidator
+ (Class)validatedClass;
+ (id)validatorWithObject:(id)a3;
- (BOOL)_checkMultiTokenTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5;
- (BOOL)_checkTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5;
- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (PKPaymentRequestValidator)initWithPaymentRequest:(id)a3;
- (id)_errorDescriptionFromMultiTokenContextAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4;
- (id)_errorDescriptionFromPaymentTotalAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4;
- (id)_errorDescriptionFromTotalAmountValidationResult:(unint64_t)a3 prefix:(id)a4;
- (unint64_t)_checkTotalAmount:(id)a3;
@end

@implementation PKPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPaymentRequest:v3];

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentRequestValidator)initWithPaymentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRequestValidator;
  v6 = [(PKPaymentRequestValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (BOOL)_checkTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(PKPaymentRequestValidator *)self _checkTotalAmount:a3];
  unint64_t v9 = v8;
  if (a5 && v8)
  {
    v10 = [(PKPaymentRequestValidator *)self _errorDescriptionFromPaymentTotalAmountValidationResult:v8 withAPIType:a4];
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a5 = [v11 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v12];
  }
  return v9 == 0;
}

- (unint64_t)_checkTotalAmount:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "pk_isNegativeNumber"))
  {
    unint64_t v4 = 1;
  }
  else if (PKIsCurrencyDecimalTooLarge(v3))
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_errorDescriptionFromPaymentTotalAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    unint64_t v4 = @"PKPaymentRequest total";
  }
  else {
    unint64_t v4 = @"Total amount";
  }
  return [(PKPaymentRequestValidator *)self _errorDescriptionFromTotalAmountValidationResult:a3 prefix:v4];
}

- (id)_errorDescriptionFromTotalAmountValidationResult:(unint64_t)a3 prefix:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    v6 = @"%@ must be greater than or equal to zero";
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v6 = @"%@ is too large";
LABEL_5:
    v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v5);
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_checkMultiTokenTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v9 = [(PKPaymentRequest *)self->_request multiTokenContexts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [*(id *)(*((void *)&v36 + 1) + 8 * v13) amount];
      unint64_t v15 = [(PKPaymentRequestValidator *)self _checkTotalAmount:v14];

      if (v15) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if (!a5) {
      goto LABEL_27;
    }
    v24 = [(PKPaymentRequestValidator *)self _errorDescriptionFromMultiTokenContextAmountValidationResult:v15 withAPIType:a4];
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44 = v24;
    v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = &v44;
    v28 = &v43;
  }
  else
  {
LABEL_9:
    id v31 = v8;

    unint64_t v9 = [MEMORY[0x1E4F28C28] zero];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = [(PKPaymentRequest *)self->_request multiTokenContexts];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        uint64_t v20 = 0;
        v21 = v9;
        do
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = [*(id *)(*((void *)&v32 + 1) + 8 * v20) amount];
          unint64_t v9 = [v21 decimalNumberByAdding:v22];

          ++v20;
          v21 = v9;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v18);
    }

    if (![(PKPaymentRequest *)self->_request isMultiTokenRequest])
    {
      LOBYTE(a5) = 1;
      id v8 = v31;
      goto LABEL_27;
    }
    id v8 = v31;
    if (![v9 compare:v31])
    {
      LOBYTE(a5) = 1;
      goto LABEL_27;
    }
    if ((unint64_t)(a4 - 1) >= 2) {
      v23 = @"PKPaymentRequest total";
    }
    else {
      v23 = @"total amount";
    }
    v24 = [NSString stringWithFormat:@"The sum of all payment token context amounts must be equal to the %@", v23];
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41 = v24;
    v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = &v41;
    v28 = &v40;
  }
  v29 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
  *a5 = [v25 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v29];

  LOBYTE(a5) = 0;
LABEL_27:

  return (char)a5;
}

- (id)_errorDescriptionFromMultiTokenContextAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    unint64_t v4 = @"PKPaymentTokenContext amount";
  }
  else {
    unint64_t v4 = @"Payment token context amount";
  }
  return [(PKPaymentRequestValidator *)self _errorDescriptionFromTotalAmountValidationResult:a3 prefix:v4];
}

- (BOOL)isValidWithError:(id *)a3
{
  int64_t v5 = [(PKPaymentRequest *)self->_request APIType];
  return [(PKPaymentRequestValidator *)self isValidWithAPIType:v5 withError:a3];
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  v6 = self;
  v369[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(PKPaymentRequest *)self->_request requestType];
  BOOL v8 = [(PKPaymentRequest *)v6->_request isPeerPaymentRequest];
  uint64_t v268 = [(PKPaymentRequest *)v6->_request requestType];
  if (v7 == 3)
  {
    BOOL v265 = 1;
  }
  else if (v7 == 1)
  {
    unint64_t v9 = [(PKPaymentRequest *)v6->_request merchantSession];
    BOOL v265 = v9 != 0;
  }
  else
  {
    BOOL v265 = 0;
  }
  int64x2_t v272 = vdupq_n_s64(v7);
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  int64x2_t v264 = vceqq_s64(v272, (int64x2_t)xmmword_191674E80);
  char v11 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)v264, (int32x4_t)vceqq_s64(v272, (int64x2_t)xmmword_191674E90))));
  unint64_t v270 = v7;
  BOOL v13 = v7 == 4 || v7 == 15;
  int64_t v273 = a3;
  p_isa = (id *)&v6->super.isa;
  if (!(v11 & 1 | (v7 == 2) | v13 | ((isKindOfClass & 1) == 0) | v8))
  {
    BOOL v266 = v8;
    request = v6->_request;
    uint64_t v17 = objc_opt_class();
    id v18 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
    id v330 = 0;
    int v19 = _PKPaymentValidatePropertyMembership(request, @"countryCode", v17, v18, a3, &v330);
    id v15 = v330;
    if (v19)
    {
      uint64_t v20 = v6->_request;
      v21 = v6;
      uint64_t v22 = objc_opt_class();
      v23 = [MEMORY[0x1E4F1CA20] ISOCurrencyCodes];
      id v329 = v15;
      LODWORD(v22) = _PKPaymentValidatePropertyMembership(v20, @"currencyCode", v22, v23, a3, &v329);
      id v24 = v329;

      if (v22)
      {
        v25 = v21->_request;
        uint64_t v26 = objc_opt_class();
        id v328 = v24;
        LOBYTE(v25) = _PKPaymentValidateProperty(v25, @"applicationData", v26, 0, a3, (uint64_t)&v328);
        id v27 = v328;

        if (v25)
        {
          v28 = v21->_request;
          v29 = objc_opt_class();
          id v327 = v27;
          LODWORD(v28) = _PKPaymentValidatePropertyArray(v28, @"shippingMethods", v29, 0, 0, a3, &v327);
          id v15 = v327;

          if (v28)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke;
            aBlock[3] = &unk_1E56ED228;
            aBlock[4] = v21;
            v30 = _Block_copy(aBlock);
            id v31 = v21->_request;
            long long v32 = objc_opt_class();
            id v325 = v15;
            int v33 = _PKPaymentValidatePropertyArray(v31, @"paymentSummaryItems", v32, v30, 1, a3, &v325);
            id v18 = v325;

            v6 = v21;
            if (v33)
            {
              if ([(PKPaymentRequest *)v21->_request supportsCouponCode])
              {
                long long v34 = v21->_request;
                uint64_t v35 = objc_opt_class();
                id v324 = v18;
                int v19 = _PKPaymentValidateProperty(v34, @"couponCode", v35, 0, a3, (uint64_t)&v324);
                id v15 = v324;
                goto LABEL_24;
              }
              int v19 = 1;
            }
            else
            {
              int v19 = 0;
            }
            id v15 = v18;
          }
          else
          {
            int v19 = 0;
            v6 = v21;
          }
LABEL_25:
          uint64_t v36 = [(PKPaymentRequest *)v6->_request recurringPaymentRequest];

          [(PKPaymentRequest *)v6->_request automaticReloadPaymentRequest];
          v38 = long long v37 = v6;

          long long v39 = [(PKPaymentRequest *)v37->_request multiTokenContexts];
          uint64_t v40 = [v39 count];

          if (v19)
          {
            int v41 = 1;
            if (v36 | v38)
            {
              v42 = p_isa;
              if (v40)
              {
                uint64_t v368 = *MEMORY[0x1E4F28568];
                v369[0] = @"Recurring or automatic reload payment requests and multi-token contexts cannot be used together on the same payment request";
                uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v369 forKeys:&v368 count:1];
                uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v43];

                int v41 = 0;
                id v15 = (id)v44;
              }
LABEL_31:
              v45 = [v42[1] deferredPaymentRequest];

              if (v41 && v45 && v40)
              {
                uint64_t v366 = *MEMORY[0x1E4F28568];
                v367 = @"Deferred payment requests and multi-token contexts cannot be used together on the same payment request";
                uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v367 forKeys:&v366 count:1];
                v47 = (void *)MEMORY[0x1E4F28C58];
LABEL_35:
                uint64_t v48 = [v47 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v46];

                char v49 = 1;
                id v15 = (id)v48;
                goto LABEL_40;
              }
              if (v41)
              {
                v50 = [v42[1] multiTokenContexts];

                if (!v50)
                {
                  v87 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v364 = *MEMORY[0x1E4F28568];
                  v365 = @"The multi-token contexts field cannot be nil";
                  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v365 forKeys:&v364 count:1];
                  v47 = v87;
                  goto LABEL_35;
                }
                char v49 = 0;
              }
              else
              {
                char v49 = 1;
              }
LABEL_40:
              v323[0] = MEMORY[0x1E4F143A8];
              v323[1] = 3221225472;
              v323[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2;
              v323[3] = &unk_1E56ED228;
              v323[4] = v42;
              v51 = _Block_copy(v323);
              if (v49)
              {
                v52 = a4;
                int v14 = 0;
              }
              else
              {
                id v53 = v42[1];
                v54 = objc_opt_class();
                id v322 = v15;
                int v14 = _PKPaymentValidatePropertyArray(v53, @"multiTokenContexts", v54, v51, 0, a3, &v322);
                id v55 = v322;

                v52 = a4;
                if (v14)
                {
                  v56 = [v42[1] paymentSummaryItems];
                  v57 = [v56 lastObject];
                  v58 = [v57 amount];

                  id v321 = v55;
                  int v14 = [p_isa _checkMultiTokenTotal:v58 withAPIType:a3 error:&v321];
                  id v15 = v321;

                  v42 = p_isa;
                }
                else
                {
                  id v15 = v55;
                }
              }
              v59 = [v42[1] recurringPaymentRequest];
              v60 = [v42[1] automaticReloadPaymentRequest];
              uint64_t v61 = [v42[1] deferredPaymentRequest];
              v62 = (void *)v61;
              unint64_t v63 = v59 != 0;
              uint64_t v64 = 1;
              if (v59) {
                uint64_t v64 = 2;
              }
              if (v60) {
                unint64_t v63 = v64;
              }
              if (v61) {
                ++v63;
              }
              if (v63 >= 2)
              {
                uint64_t v362 = *MEMORY[0x1E4F28568];
                v363 = @"A payment request can only have one of recurring, automatic reload, or deferred payment request set.";
                v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v363 forKeys:&v362 count:1];
                id v66 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v65];

                int v14 = 0;
                goto LABEL_53;
              }
              if (v14 && v59)
              {
                v67 = [[PKRecurringPaymentRequestValidator alloc] initWithRecurringPaymentRequest:v59];
                v68 = [v42[1] currencyCode];
                [(PKRecurringPaymentRequestValidator *)v67 setCurrencyCode:v68];

                id v320 = v15;
                int v14 = [(PKRecurringPaymentRequestValidator *)v67 isValidWithAPIType:v273 withError:&v320];
                id v69 = v320;

                id v15 = v69;
              }
              if (v60 && v14)
              {
                v70 = [[PKAutomaticReloadPaymentRequestValidator alloc] initWithAutomaticReloadPaymentRequest:v60];
                v71 = [p_isa[1] currencyCode];
                [(PKAutomaticReloadPaymentRequestValidator *)v70 setCurrencyCode:v71];

                -[PKAutomaticReloadPaymentRequestValidator setRequestType:](v70, "setRequestType:", [p_isa[1] requestType]);
                id v319 = v15;
                int v14 = [(PKAutomaticReloadPaymentRequestValidator *)v70 isValidWithAPIType:v273 withError:&v319];
                id v72 = v319;

                id v15 = v72;
              }
              if (v62 && v14)
              {
                v73 = [[PKDeferredPaymentRequestValidator alloc] initWithDeferredPaymentRequest:v62];
                v74 = [p_isa[1] currencyCode];
                [(PKDeferredPaymentRequestValidator *)v73 setCurrencyCode:v74];

                id v318 = v15;
                int v14 = [(PKDeferredPaymentRequestValidator *)v73 isValidWithAPIType:v273 withError:&v318];
                id v75 = v318;

                id v15 = v75;
              }
              v6 = (PKPaymentRequestValidator *)p_isa;
              if (v14)
              {
                uint64_t v76 = v7;
                if (v7 == 10 || !v7)
                {
                  v77 = _PKAllNetworks();
                  v78 = v77;
                  if (v268 != 8)
                  {
                    uint64_t v79 = objc_msgSend(v77, "pk_arrayByRemovingObject:", @"Barcode");

                    v78 = (void *)v79;
                  }
                  id v80 = p_isa[1];
                  v81 = (objc_class *)objc_opt_class();
                  uint64_t v82 = objc_opt_class();
                  id v317 = v15;
                  LODWORD(v81) = _PKPaymentValidatePropertyUnion(v80, @"supportedNetworks", v81, v82, v78, 1, v273, &v317);
                  id v83 = v317;

                  if (!v81)
                  {
                    int v14 = 0;
                    id v15 = v83;
                    goto LABEL_55;
                  }
                  id v15 = v83;
                  v6 = (PKPaymentRequestValidator *)p_isa;
                  uint64_t v76 = v7;
                }
                if (v265 || v76 == 10 || !v76)
                {
                  v84 = v6->_request;
                  id v316 = v15;
                  int v14 = _PKPaymentValidateMerchantCapabilities(v84, v273, v76, (uint64_t)&v316);
                  v85 = v6;
                  id v66 = v316;

                  if (v14)
                  {
                    v86 = [(PKPaymentRequest *)v85->_request merchantSession];

                    if (v86)
                    {
                      if (PKBypassCertValidation())
                      {
                        int v14 = 1;
                        goto LABEL_54;
                      }
                      v65 = [p_isa[1] merchantSession];
                      v152 = PKValidatePaymentMerchantSession(v65);
                      int v14 = v152 == 0;

LABEL_53:
LABEL_54:
                      id v15 = v66;
LABEL_55:
                      v6 = (PKPaymentRequestValidator *)p_isa;
                      goto LABEL_86;
                    }
                    if (![(PKPaymentRequest *)v85->_request shouldUseMerchantSession])
                    {
                      v170 = v85->_request;
                      uint64_t v171 = objc_opt_class();
                      id v315 = v66;
                      int v14 = _PKPaymentValidateProperty(v170, @"merchantIdentifier", v171, 1, v273, (uint64_t)&v315);
                      v65 = v66;
                      id v66 = v315;
                      goto LABEL_53;
                    }
                    int v14 = 1;
                  }
                  id v15 = v66;
                  v6 = v85;
                }
                else
                {
                  int v14 = 1;
                }
              }
LABEL_86:

              a4 = v52;
              a3 = v273;
              BOOL v8 = v266;
              if ((v14 & 1) == 0) {
                goto LABEL_97;
              }
              goto LABEL_87;
            }
          }
          else
          {
            int v41 = 0;
          }
          v42 = p_isa;
          goto LABEL_31;
        }
        id v24 = v27;
      }

      int v19 = 0;
      id v15 = v24;
      v6 = (PKPaymentRequestValidator *)p_isa;
    }
LABEL_24:

    goto LABEL_25;
  }
  int v14 = isKindOfClass;
  id v15 = 0;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_97;
  }
LABEL_87:
  if (v268 == 8)
  {
    v88 = v6->_request;
    uint64_t v89 = objc_opt_class();
    id v314 = v15;
    LODWORD(v88) = _PKPaymentValidateProperty(v88, @"serviceProviderOrder", v89, 1, a3, (uint64_t)&v314);
    id v90 = v314;

    if (!v88) {
      goto LABEL_145;
    }
    v91 = [(PKPaymentRequest *)v6->_request serviceProviderPaymentRequest];
    v92 = [v91 serviceProviderOrder];

    uint64_t v93 = objc_opt_class();
    id v313 = v90;
    int v14 = _PKPaymentValidateProperty(v92, @"identifier", v93, 1, a3, (uint64_t)&v313);
    id v15 = v313;

    if (!v14) {
      goto LABEL_96;
    }
    uint64_t v94 = objc_opt_class();
    id v312 = v15;
    int v95 = _PKPaymentValidateProperty(v92, @"itemDescription", v94, 0, a3, (uint64_t)&v312);
    id v96 = v312;

    if (v95)
    {
      uint64_t v97 = objc_opt_class();
      id v311 = v96;
      int v14 = _PKPaymentValidateProperty(v92, @"serviceProviderIdentifier", v97, 1, a3, (uint64_t)&v311);
      id v15 = v311;

      if (!v14)
      {
LABEL_95:
        v6 = (PKPaymentRequestValidator *)p_isa;
LABEL_96:

        goto LABEL_97;
      }
      uint64_t v98 = objc_opt_class();
      id v310 = v15;
      int v14 = _PKPaymentValidateProperty(v92, @"serviceProviderData", v98, 0, a3, (uint64_t)&v310);
      id v96 = v310;
    }
    else
    {
      int v14 = 0;
    }
    id v15 = v96;
    goto LABEL_95;
  }
LABEL_97:
  if ((v14 & v8) != 1)
  {
    if (v14) {
      goto LABEL_110;
    }
    int v137 = 0;
    id v90 = v15;
    goto LABEL_172;
  }
  v99 = v6->_request;
  uint64_t v100 = objc_opt_class();
  id v309 = v15;
  LODWORD(v99) = _PKPaymentValidateProperty(v99, @"peerPaymentQuote", v100, 1, a3, (uint64_t)&v309);
  id v90 = v309;

  if (!v99) {
    goto LABEL_145;
  }
  v101 = v6->_request;
  uint64_t v102 = objc_opt_class();
  id v103 = [MEMORY[0x1E4F1CA20] ISOCurrencyCodes];
  id v308 = v90;
  LODWORD(v101) = _PKPaymentValidatePropertyMembership(v101, @"currencyCode", v102, v103, a3, &v308);
  v104 = v6;
  id v105 = v308;

  if (!v101) {
    goto LABEL_169;
  }
  v106 = v104->_request;
  v107 = objc_opt_class();
  id v307 = v105;
  LODWORD(v106) = _PKPaymentValidatePropertyArray(v106, @"shippingMethods", v107, 0, 0, a3, &v307);
  id v90 = v307;

  if (!v106)
  {
    int v137 = 0;
    v6 = v104;
    goto LABEL_172;
  }
  v306[0] = MEMORY[0x1E4F143A8];
  v306[1] = 3221225472;
  v306[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3;
  v306[3] = &unk_1E56ED228;
  v306[4] = v104;
  v108 = _Block_copy(v306);
  v109 = v104->_request;
  v110 = objc_opt_class();
  id v305 = v90;
  int v111 = _PKPaymentValidatePropertyArray(v109, @"paymentSummaryItems", v110, v108, 1, a3, &v305);
  id v103 = v305;

  v6 = v104;
  if (!v111)
  {
LABEL_205:
    int v137 = 0;
    id v90 = v103;
    goto LABEL_172;
  }
  v112 = [(PKPaymentRequest *)v104->_request peerPaymentRequest];
  v113 = [v112 peerPaymentQuote];

  uint64_t v114 = objc_opt_class();
  id v304 = v103;
  LODWORD(v112) = _PKPaymentValidateProperty(v113, @"appleHash", v114, 1, a3, (uint64_t)&v304);
  id v90 = v304;

  if (!v112) {
    goto LABEL_134;
  }
  uint64_t v115 = objc_opt_class();
  id v303 = v90;
  int v116 = _PKPaymentValidateProperty(v113, @"externalHash", v115, 1, a3, (uint64_t)&v303);
  id v117 = v303;

  if (!v116) {
    goto LABEL_214;
  }
  uint64_t v118 = objc_opt_class();
  id v302 = v117;
  int v119 = _PKPaymentValidateProperty(v113, @"totalReceiveAmount", v118, 1, a3, (uint64_t)&v302);
  id v90 = v302;

  if (!v119)
  {
LABEL_134:
    char v126 = 0;
    goto LABEL_215;
  }
  uint64_t v120 = objc_opt_class();
  id v301 = v90;
  int v121 = _PKPaymentValidateProperty(v113, @"totalReceiveAmountCurrency", v120, 1, a3, (uint64_t)&v301);
  id v117 = v301;

  if (!v121)
  {
LABEL_214:
    char v126 = 0;
    id v90 = v117;
    goto LABEL_215;
  }
  uint64_t v122 = objc_opt_class();
  id v300 = v117;
  int v123 = _PKPaymentValidateProperty(v113, @"items", v122, 1, a3, (uint64_t)&v300);
  id v90 = v300;

  if (!v123) {
    goto LABEL_134;
  }
  v124 = [v113 items];
  uint64_t v125 = [v124 count];

  if (!v125)
  {
    v215 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v360 = *MEMORY[0x1E4F28568];
    v361 = @"Quote items must contain at least one item";
    v216 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v361 forKeys:&v360 count:1];
    id v117 = [v215 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v216];

    goto LABEL_214;
  }
  char v126 = 1;
LABEL_215:
  v262 = v113;
  v263 = a4;
  long long v298 = 0u;
  long long v299 = 0u;
  long long v296 = 0u;
  long long v297 = 0u;
  v217 = [v113 items];
  uint64_t v218 = [v217 countByEnumeratingWithState:&v296 objects:v359 count:16];
  if (!v218) {
    goto LABEL_247;
  }
  uint64_t v219 = v218;
  uint64_t v220 = *(void *)v297;
  uint64_t v267 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v221 = 0;
    do
    {
      if (*(void *)v297 != v220) {
        objc_enumerationMutation(v217);
      }
      if (v126)
      {
        v222 = *(void **)(*((void *)&v296 + 1) + 8 * v221);
        uint64_t v223 = [v222 type];
        if ((unint64_t)(v223 - 2) >= 3)
        {
          if (v223 != 1)
          {
            v236 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v357 = v267;
            v358 = @"Unsupported PKPeerPaymentQuoteItem type";
            v237 = (void *)MEMORY[0x1E4F1C9E8];
            v238 = &v358;
            v239 = &v357;
            goto LABEL_239;
          }
          uint64_t v240 = objc_opt_class();
          id v295 = v90;
          int v241 = _PKPaymentValidateProperty(v222, @"totalAmount", v240, 1, v273, (uint64_t)&v295);
          id v226 = v295;

          if (!v241) {
            goto LABEL_237;
          }
          uint64_t v242 = objc_opt_class();
          id v294 = v226;
          int v243 = _PKPaymentValidateProperty(v222, @"totalAmountCurrency", v242, 1, v273, (uint64_t)&v294);
          id v90 = v294;

          if (!v243) {
            goto LABEL_236;
          }
          v244 = (objc_class *)objc_opt_class();
          uint64_t v245 = objc_opt_class();
          v246 = _PKAllNetworks();
          id v293 = v90;
          LODWORD(v245) = _PKPaymentValidatePropertyUnion(v222, @"supportedNetworks", v244, v245, v246, 1, v273, &v293);
          id v247 = v293;

          if (!v245) {
            goto LABEL_240;
          }
          uint64_t v248 = objc_opt_class();
          id v292 = v247;
          int v249 = _PKPaymentValidateProperty(v222, @"merchantIdentifier", v248, 1, v273, (uint64_t)&v292);
          id v250 = v292;

          if (!v249)
          {
            id v247 = v250;
            goto LABEL_240;
          }
          uint64_t v251 = objc_opt_class();
          id v291 = v250;
          int v252 = _PKPaymentValidateProperty(v222, @"countryCode", v251, 1, v273, (uint64_t)&v291);
          id v247 = v291;

          if (!v252) {
            goto LABEL_240;
          }
          id v290 = v247;
          int v253 = _PKPaymentValidateMerchantCapabilities(v222, v273, v270, (uint64_t)&v290);
          id v254 = v290;

          if (!v253)
          {
            id v247 = v254;
            goto LABEL_240;
          }
          uint64_t v255 = objc_opt_class();
          id v289 = v254;
          char v256 = _PKPaymentValidateProperty(v222, @"nonce", v255, 1, v273, (uint64_t)&v289);
          id v90 = v289;

          if ((v256 & 1) == 0)
          {
LABEL_236:
            char v126 = 0;
            goto LABEL_241;
          }
        }
        else
        {
          uint64_t v224 = objc_opt_class();
          id v288 = v90;
          int v225 = _PKPaymentValidateProperty(v222, @"totalAmount", v224, 1, v273, (uint64_t)&v288);
          id v226 = v288;

          if (!v225) {
            goto LABEL_237;
          }
          uint64_t v227 = objc_opt_class();
          id v287 = v226;
          int v228 = _PKPaymentValidateProperty(v222, @"totalAmountCurrency", v227, 1, v273, (uint64_t)&v287);
          id v90 = v287;

          if (!v228) {
            goto LABEL_236;
          }
          uint64_t v229 = objc_opt_class();
          id v286 = v90;
          char v230 = _PKPaymentValidateProperty(v222, @"countryCode", v229, 1, v273, (uint64_t)&v286);
          id v226 = v286;

          if ((v230 & 1) == 0)
          {
LABEL_237:
            char v126 = 0;
            id v90 = v226;
            goto LABEL_241;
          }
          uint64_t v231 = objc_opt_class();
          id v285 = v226;
          int v232 = _PKPaymentValidateProperty(v222, @"nonce", v231, 1, v273, (uint64_t)&v285);
          id v90 = v285;

          if (!v232) {
            goto LABEL_236;
          }
        }
        v233 = [v222 totalAmount];
        v234 = [MEMORY[0x1E4F28C28] notANumber];
        int v235 = [v233 isEqualToNumber:v234];

        if (v235)
        {
          v236 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v355 = v267;
          v356 = @"PKPeerPaymentQuoteItem totalAmount value can't be NaN";
          v237 = (void *)MEMORY[0x1E4F1C9E8];
          v238 = &v356;
          v239 = &v355;
LABEL_239:
          v246 = [v237 dictionaryWithObjects:v238 forKeys:v239 count:1];
          id v247 = [v236 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v246];

LABEL_240:
          char v126 = 0;
          id v90 = v247;
          goto LABEL_241;
        }
        char v126 = 1;
      }
LABEL_241:
      ++v221;
    }
    while (v219 != v221);
    uint64_t v257 = [v217 countByEnumeratingWithState:&v296 objects:v359 count:16];
    uint64_t v219 = v257;
  }
  while (v257);
LABEL_247:

  if ((v126 & 1) == 0)
  {
    int v137 = 0;
    a4 = v263;
    goto LABEL_249;
  }
  id v15 = v90;
  a4 = v263;
  a3 = v273;
  v6 = (PKPaymentRequestValidator *)p_isa;
LABEL_110:
  unint64_t v127 = v270;
  if (v270 != 1
    && ![(PKPaymentRequest *)v6->_request _isPSD2StyleRequest]
    && ![(PKPaymentRequest *)v6->_request _isAMPApplePayClassicRequest])
  {
    goto LABEL_127;
  }
  v128 = v6->_request;
  uint64_t v129 = objc_opt_class();
  id v284 = v15;
  int v130 = _PKPaymentValidateProperty(v128, @"externalizedContext", v129, 0, a3, (uint64_t)&v284);
  id v131 = v284;

  if (v130)
  {
    v132 = v6->_request;
    v133 = objc_opt_class();
    id v283 = v131;
    int v134 = _PKPaymentValidatePropertyArray(v132, @"paymentContentItems", v133, 0, 1, a3, &v283);
    id v90 = v283;

    if (v134)
    {
      v135 = v6->_request;
      uint64_t v136 = objc_opt_class();
      id v282 = v90;
      int v134 = _PKPaymentValidateProperty(v135, @"appleIDAuthenticationContext", v136, 0, a3, (uint64_t)&v282);
      id v131 = v282;

      goto LABEL_118;
    }
  }
  else
  {
    int v134 = 0;
LABEL_118:
    id v90 = v131;
  }
  uint64_t v138 = [(PKPaymentRequest *)v6->_request externalizedContext];
  if (v138)
  {
    v139 = (void *)v138;
    v140 = [(PKPaymentRequest *)v6->_request appleIDAuthenticationContext];

    if (!v140)
    {
      v143 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v353 = *MEMORY[0x1E4F28568];
      v354 = @"If you are setting an externalizedContext you must also provide a fallback appleIDAuthenticationContext";
      v144 = (void *)MEMORY[0x1E4F1C9E8];
      v145 = &v354;
      v146 = &v353;
LABEL_147:
      id v103 = [v144 dictionaryWithObjects:v145 forKeys:v146 count:1];
      id v105 = [v143 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v103];

LABEL_169:
      int v137 = 0;
LABEL_170:

      id v90 = v105;
LABEL_171:
      v6 = (PKPaymentRequestValidator *)p_isa;
      goto LABEL_172;
    }
  }
  if (!v134) {
    goto LABEL_145;
  }
  v141 = [(PKPaymentRequest *)v6->_request paymentContentItems];
  unint64_t v142 = [v141 count];

  if (v142 >= 0x65)
  {
    v143 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v351 = *MEMORY[0x1E4F28568];
    v352 = @"paymentContentItems may not contain more than 100 items";
    v144 = (void *)MEMORY[0x1E4F1C9E8];
    v145 = &v352;
    v146 = &v351;
    goto LABEL_147;
  }
  id v15 = v90;
  unint64_t v127 = v270;
LABEL_127:
  if (v127 > 0xD || ((1 << v127) & 0x20C0) == 0)
  {
LABEL_141:
    if (v127 > 0xF || ((1 << v127) & 0xA0C0) == 0)
    {
      v176 = [(PKPaymentRequest *)v6->_request paymentSummaryItems];
      id v103 = [v176 lastObject];

      uint64_t v177 = objc_opt_class();
      if (!_PKPaymentValidateProperty(v103, @"amount", v177, 1, a3, 0)
        || ([v103 amount],
            v178 = objc_claimAutoreleasedReturnValue(),
            [MEMORY[0x1E4F28C28] notANumber],
            v179 = objc_claimAutoreleasedReturnValue(),
            int v180 = [v178 isEqualToNumber:v179],
            v179,
            v178,
            v180))
      {
        if ((unint64_t)(a3 - 1) >= 2) {
          v181 = @"You must provide a total amount to be charged in the final payment summary item, even if the total item is pending.";
        }
        else {
          v181 = @"You must provide a total amount, even if the total item is pending.";
        }
        v161 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v347 = *MEMORY[0x1E4F28568];
        v348 = v181;
        v162 = (void *)MEMORY[0x1E4F1C9E8];
        v163 = (id *)&v348;
        v164 = &v347;
        goto LABEL_168;
      }

      v6 = (PKPaymentRequestValidator *)p_isa;
    }
    v157 = [(PKPaymentRequest *)v6->_request paymentSummaryItems];
    unint64_t v158 = [v157 count];

    if (v158 >= 0x65)
    {
      v159 = NSString;
      v160 = _PKPaymentRequestGetDescriptivePropertyName(@"paymentSummaryItems", a3, (unint64_t)(a3 - 1) < 2);
      id v103 = [v159 stringWithFormat:@"%@ may not contain more than 100 items", v160];

      v161 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v345 = *MEMORY[0x1E4F28568];
      id v346 = v103;
      v162 = (void *)MEMORY[0x1E4F1C9E8];
      v163 = &v346;
      v164 = &v345;
LABEL_168:
      v184 = [v162 dictionaryWithObjects:v163 forKeys:v164 count:1];
      id v105 = [v161 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v184];

      goto LABEL_169;
    }
    v165 = [(PKPaymentRequest *)v6->_request availableShippingMethods];
    v166 = [v165 methods];
    unint64_t v167 = [v166 count];

    if (v167 >= 0x65)
    {
      v168 = NSString;
      v169 = _PKPaymentRequestGetDescriptivePropertyName(@"shippingMethods", a3, (unint64_t)(a3 - 1) < 2);
      id v103 = [v168 stringWithFormat:@"%@ may not contain more than 100 items", v169];

      v161 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v343 = *MEMORY[0x1E4F28568];
      id v344 = v103;
      v162 = (void *)MEMORY[0x1E4F1C9E8];
      v163 = &v344;
      v164 = &v343;
      goto LABEL_168;
    }
    v172 = [(PKPaymentRequest *)v6->_request applicationData];
    char v173 = (unint64_t)[v172 length] < 0x401 || v265;

    if ((v173 & 1) == 0)
    {
      v182 = NSString;
      v183 = _PKPaymentRequestGetDescriptivePropertyName(@"applicationData", a3, (unint64_t)(a3 - 1) < 2);
      id v103 = [v182 stringWithFormat:@"%@ may not be more than 1024 bytes", v183];

      v161 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v341 = *MEMORY[0x1E4F28568];
      id v342 = v103;
      v162 = (void *)MEMORY[0x1E4F1C9E8];
      v163 = &v342;
      v164 = &v341;
      goto LABEL_168;
    }
    if (![(PKPaymentRequest *)v6->_request isShippingEditable])
    {
      v174 = [(PKPaymentRequest *)v6->_request shippingContact];

      if (!v174)
      {
        v202 = NSString;
        v203 = _PKPaymentRequestGetDescriptivePropertyName(@"shippingEditable", a3, 0);
        id v103 = [v202 stringWithFormat:@"When %@ is set to NO a shipping contact must be provided", v203];

        v161 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v339 = *MEMORY[0x1E4F28568];
        id v340 = v103;
        v162 = (void *)MEMORY[0x1E4F1C9E8];
        v163 = &v340;
        v164 = &v339;
        goto LABEL_168;
      }
    }
    if ([(PKPaymentRequest *)v6->_request APIType] >= 5)
    {
      v175 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v337 = *MEMORY[0x1E4F28568];
      v338 = @"The API type is not valid";
      id v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
      id v105 = [v175 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v103];

      goto LABEL_169;
    }
    if (v270 > 0xD || ((1 << v270) & 0x20C0) == 0)
    {
      v211 = [(PKPaymentRequest *)v6->_request paymentSummaryItems];
      v212 = [v211 lastObject];
      [v212 amount];
      v214 = v213 = v6;

      id v279 = v15;
      LODWORD(v211) = [(PKPaymentRequestValidator *)v213 _checkTotal:v214 withAPIType:a3 error:&v279];
      id v90 = v279;

      if (!v211)
      {
        int v137 = 0;
        goto LABEL_171;
      }
      id v15 = v90;
      v6 = (PKPaymentRequestValidator *)p_isa;
    }
    v196 = [(PKPaymentRequest *)v6->_request supportedCountries];
    uint64_t v197 = [v196 count];

    if (v197)
    {
      v198 = v6->_request;
      v199 = (objc_class *)objc_opt_class();
      uint64_t v200 = objc_opt_class();
      v201 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
      id v278 = v15;
      LODWORD(v198) = _PKPaymentValidatePropertyUnion(v198, @"supportedCountries", v199, v200, v201, 0, a3, &v278);
      id v90 = v278;

      v6 = (PKPaymentRequestValidator *)p_isa;
      int v137 = 0;
      if (!v198) {
        goto LABEL_172;
      }
    }
    else
    {
      id v90 = v15;
    }
    if (v265)
    {
      if (v270 == 3)
      {
        v204 = [(PKPaymentRequest *)v6->_request merchantSession];

        if (v204)
        {
          v205 = v6->_request;
          uint64_t v206 = objc_opt_class();
          id v277 = v90;
          int v207 = _PKPaymentValidateProperty(v205, @"passTypeIdentifier", v206, 1, a3, (uint64_t)&v277);
          id v103 = v277;

          if (v207)
          {
            v208 = v6->_request;
            uint64_t v209 = objc_opt_class();
            id v276 = v103;
            int v137 = _PKPaymentValidateProperty(v208, @"passSerialNumber", v209, 1, a3, (uint64_t)&v276);
            id v105 = v276;
            goto LABEL_170;
          }
          goto LABEL_205;
        }
      }
    }
    else
    {
      if (![(PKPaymentRequest *)v6->_request isVirtualCardRequest])
      {
        v210 = [(PKPaymentRequest *)v6->_request peerPaymentRequest];
        if (v210)
        {
        }
        else
        {
          v259 = [(PKPaymentRequest *)v6->_request passTypeIdentifier];

          if (v259)
          {
            v143 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v335 = *MEMORY[0x1E4F28568];
            v336 = @"This sort of request may not use the passTypeIdentifier field";
            v144 = (void *)MEMORY[0x1E4F1C9E8];
            v145 = &v336;
            v146 = &v335;
            goto LABEL_147;
          }
        }
      }
      if (![(PKPaymentRequest *)v6->_request isVirtualCardRequest])
      {
        uint64_t v258 = [(PKPaymentRequest *)v6->_request peerPaymentRequest];
        if (v258)
        {
          id v103 = (id)v258;
          int v137 = 1;
          id v105 = v90;
        }
        else
        {
          v260 = [p_isa[1] passSerialNumber];

          if (!v260)
          {
            int v137 = 1;
LABEL_249:
            a3 = v273;
            goto LABEL_171;
          }
          v261 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v333 = *MEMORY[0x1E4F28568];
          v334 = @"This sort of request may not use the passSerialNumber field";
          id v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
          id v105 = [v261 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v103];

          int v137 = 0;
          a3 = v273;
        }
        goto LABEL_170;
      }
    }
    int v137 = 1;
    goto LABEL_172;
  }
  v147.i64[1] = v264.i64[1];
  *(int32x2_t *)v147.i8 = vmovn_s64(v264);
  unsigned __int8 v269 = vmovn_s32(v147).u8[0];
  v148 = v6->_request;
  uint64_t v149 = objc_opt_class();
  id v281 = v15;
  int v150 = _PKPaymentValidateProperty(v148, @"externalizedContext", v149, 0, a3, (uint64_t)&v281);
  id v90 = v281;

  if ((v269 & 1) == 0 && v150)
  {
    v151 = [(PKPaymentRequest *)v6->_request clientViewSourceIdentifier];
    if (v151)
    {
      int v150 = 1;
    }
    else
    {
      v153 = v6->_request;
      v154 = objc_opt_class();
      id v280 = v90;
      int v150 = _PKPaymentValidatePropertyArray(v153, @"paymentContentItems", v154, 0, 1, a3, &v280);
      id v155 = v280;

      id v90 = v155;
    }
  }
  v156 = [(PKPaymentRequest *)v6->_request externalizedContext];

  if (!v156)
  {
    v143 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v349 = *MEMORY[0x1E4F28568];
    v350 = @"An externalizedContext must be set";
    v144 = (void *)MEMORY[0x1E4F1C9E8];
    v145 = &v350;
    v146 = &v349;
    goto LABEL_147;
  }
  if (v150)
  {
    id v15 = v90;
    unint64_t v127 = v270;
    goto LABEL_141;
  }
LABEL_145:
  int v137 = 0;
LABEL_172:
  v185 = [(PKPaymentRequest *)v6->_request paymentSummaryItems];
  int v186 = objc_msgSend(v185, "pk_containsObjectPassingTest:", &__block_literal_global_607);

  if (v270 != 10 && v137 && v186)
  {
    v187 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190E10000, v187, OS_LOG_TYPE_ERROR, "PKPaymentRequests cannot contain disbursement specific summary items", buf, 2u);
    }

    if (!a4)
    {
LABEL_190:
      LOBYTE(v137) = 0;
      goto LABEL_191;
    }
LABEL_186:
    if (v90)
    {
      v331[0] = *MEMORY[0x1E4F28568];
      v193 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_13.isa, 0);
      v331[1] = *MEMORY[0x1E4F28A50];
      v332[0] = v193;
      v332[1] = v90;
      v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v332 forKeys:v331 count:2];
    }
    else
    {
      v194 = 0;
    }
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v194];

    goto LABEL_190;
  }
  char v188 = v137 ^ 1;
  if (v270 != 10) {
    char v188 = 1;
  }
  if ((v188 & 1) == 0)
  {
    v189 = [(PKPaymentRequest *)v6->_request disbursementPaymentRequest];
    v190 = [[PKDisbursementPaymentRequestValidator alloc] initWithDisbursementPaymentRequest:v189];
    v191 = [(PKPaymentRequest *)v6->_request currencyCode];
    [(PKDisbursementPaymentRequestValidator *)v190 setCurrencyCode:v191];

    id v274 = v90;
    int v137 = [(PKDisbursementPaymentRequestValidator *)v190 isValidWithAPIType:a3 withError:&v274];
    id v192 = v274;

    id v90 = v192;
  }
  if (a4)
  {
    if (!v137) {
      goto LABEL_186;
    }
    *a4 = 0;
    LOBYTE(v137) = 1;
  }
LABEL_191:

  return v137;
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = v6;
    int64_t v5 = [v3 currencyCode];
    [v4 setCurrencyCode:v5];
  }
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = v6;
    int64_t v5 = [v3 currencyCode];
    [v4 setCurrencyCode:v5];
  }
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = v6;
    int64_t v5 = [v3 currencyCode];
    [v4 setCurrencyCode:v5];
  }
}

uint64_t __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
}

@end