@interface POAnalytics
+ (void)analyticsForLoginConfiguration:(id)a3;
+ (void)analyticsForLoginManager:(id)a3;
+ (void)analyticsForLoginType:(id)a3 result:(id)a4;
+ (void)analyticsForPasswordChange:(BOOL)a3 credentialNeeded:(BOOL)a4 result:(BOOL)a5;
+ (void)analyticsForRegistrationType:(id)a3 options:(int64_t)a4 result:(int64_t)a5;
+ (void)analyticsForStatus;
+ (void)analyticsForTestMessages;
@end

@implementation POAnalytics

+ (void)analyticsForLoginConfiguration:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __46__POAnalytics_analyticsForLoginConfiguration___block_invoke(uint64_t a1)
{
  v34[11] = *MEMORY[0x263EF8340];
  v33[0] = @"hasInvalidCredentialPredicate";
  v2 = NSNumber;
  v32 = [*(id *)(a1 + 32) invalidCredentialPredicate];
  v31 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v32, "length") != 0);
  v34[0] = v31;
  v33[1] = @"includePreviousRefreshTokenInLoginRequest";
  v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "includePreviousRefreshTokenInLoginRequest"));
  v34[1] = v30;
  v33[2] = @"kerberosTicketMappingsCount";
  id v3 = NSNumber;
  v29 = [*(id *)(a1 + 32) kerberosTicketMappings];
  v28 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
  v34[2] = v28;
  v33[3] = @"hasCustomNonceRequestValues";
  id v4 = NSNumber;
  v27 = [*(id *)(a1 + 32) customNonceRequestValues];
  v26 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v27, "count") != 0);
  v34[3] = v26;
  v33[4] = @"hasCustomAssertionRequestHeaderClaims";
  v5 = NSNumber;
  v25 = [*(id *)(a1 + 32) customAssertionRequestHeaderClaims];
  v24 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v25, "count") != 0);
  v34[4] = v24;
  v33[5] = @"hasCustomAssertionRequestBodyClaims";
  v6 = NSNumber;
  v23 = [*(id *)(a1 + 32) customAssertionRequestBodyClaims];
  v22 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v23, "count") != 0);
  v34[5] = v22;
  v33[6] = @"hasCustomLoginRequestHeaderClaims";
  v7 = NSNumber;
  v21 = [*(id *)(a1 + 32) customLoginRequestHeaderClaims];
  v8 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v21, "count") != 0);
  v34[6] = v8;
  v33[7] = @"hasCustomLoginRequestBodyClaims";
  v9 = NSNumber;
  v10 = [*(id *)(a1 + 32) customLoginRequestBodyClaims];
  v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "count") != 0);
  v34[7] = v11;
  v33[8] = @"hasCustomRefreshRequestHeaderClaims";
  v12 = NSNumber;
  v13 = [*(id *)(a1 + 32) customRefreshRequestHeaderClaims];
  v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "count") != 0);
  v34[8] = v14;
  v33[9] = @"hasCustomRefreshRequestBodyClaims";
  v15 = NSNumber;
  v16 = [*(id *)(a1 + 32) customRefreshRequestBodyClaims];
  v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "count") != 0);
  v34[9] = v17;
  v33[10] = @"federationType";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "federationType"));
  v34[10] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:11];

  return v19;
}

+ (void)analyticsForLoginType:(id)a3 result:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  AnalyticsSendEventLazy();
}

id __44__POAnalytics_analyticsForLoginType_result___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"type";
  v4[1] = @"result";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (void)analyticsForPasswordChange:(BOOL)a3 credentialNeeded:(BOOL)a4 result:(BOOL)a5
{
}

id __66__POAnalytics_analyticsForPasswordChange_credentialNeeded_result___block_invoke(unsigned __int8 *a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"shouldChangePassword";
  v2 = [NSNumber numberWithBool:a1[32]];
  v8[0] = v2;
  v7[1] = @"credentialNeeded";
  id v3 = [NSNumber numberWithBool:a1[33]];
  v8[1] = v3;
  v7[2] = @"result";
  id v4 = [NSNumber numberWithBool:a1[34]];
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (void)analyticsForRegistrationType:(id)a3 options:(int64_t)a4 result:(int64_t)a5
{
  id v6 = a3;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __59__POAnalytics_analyticsForRegistrationType_options_result___block_invoke(void *a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[5];
  v8[0] = a1[4];
  v7[0] = @"type";
  v7[1] = @"options";
  id v3 = [NSNumber numberWithInteger:v2];
  v8[1] = v3;
  v7[2] = @"result";
  id v4 = [NSNumber numberWithInteger:a1[6]];
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (void)analyticsForLoginManager:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __40__POAnalytics_analyticsForLoginManager___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)analyticsForTestMessages
{
}

void *__39__POAnalytics_analyticsForTestMessages__block_invoke()
{
  return &unk_2707DBCE0;
}

+ (void)analyticsForStatus
{
}

void *__33__POAnalytics_analyticsForStatus__block_invoke()
{
  return &unk_2707DBD08;
}

@end