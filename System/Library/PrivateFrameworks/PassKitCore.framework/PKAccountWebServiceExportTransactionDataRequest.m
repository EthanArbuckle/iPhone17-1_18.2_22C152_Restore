@interface PKAccountWebServiceExportTransactionDataRequest
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSString)accountIdentifier;
- (NSString)fileFormat;
- (NSString)statementIdentifier;
- (NSTimeZone)productTimeZone;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)trigger;
- (unint64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFileFormat:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setStatementIdentifier:(id)a3;
- (void)setTrigger:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountWebServiceExportTransactionDataRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "_baseURL";
LABEL_27:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_28;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "appleAccountInformation";
    goto LABEL_27;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v20 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "_accountIdentifier";
    goto LABEL_27;
  }
  if (!self->_fileFormat)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v21 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "_fileFormat";
    goto LABEL_27;
  }
  if (!self->_beginDate)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v22 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "_beginDate";
    goto LABEL_27;
  }
  if (!self->_endDate)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v23 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2082;
    v32 = "_endDate";
    goto LABEL_27;
  }
  if (!self->_productTimeZone)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2082;
      v32 = "_productTimeZone";
      goto LABEL_27;
    }
LABEL_28:
    id v25 = 0;
    goto LABEL_29;
  }
  v28[0] = @"accounts";
  v28[1] = accountIdentifier;
  v28[2] = @"exportTransactionData";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:self->_fileFormat forKeyedSubscript:@"fileFormat"];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v11 setLocale:v12];

  [v11 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
  [v11 setTimeZone:self->_productTimeZone];
  v13 = [v11 stringFromDate:self->_beginDate];
  [v10 setObject:v13 forKeyedSubscript:@"beginDate"];

  v14 = [v11 stringFromDate:self->_endDate];
  [v10 setObject:v14 forKeyedSubscript:@"endDate"];

  if (self->_type) {
    v15 = @"transactionMetadata";
  }
  else {
    v15 = @"default";
  }
  [v10 setObject:v15 forKeyedSubscript:@"type"];
  [v10 safelySetObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  switch(self->_trigger)
  {
    case 0uLL:
      goto LABEL_36;
    case 1uLL:
      v16 = @"manual";
      goto LABEL_35;
    case 2uLL:
      v16 = @"statementChanged";
      goto LABEL_35;
    case 3uLL:
      v16 = @"scheduledActivity";
      goto LABEL_35;
    default:
      v16 = @"unknown";
LABEL_35:
      [v10 safelySetObject:v16 forKey:@"trigger"];
LABEL_36:
      if (v10)
      {
        v27 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
        [v9 setHTTPBody:v27];
      }
      id v25 = [v9 copy];

      break;
  }
LABEL_29:

  return v25;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (NSString)fileFormat
{
  return self->_fileFormat;
}

- (void)setFileFormat:(id)a3
{
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_fileFormat, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end