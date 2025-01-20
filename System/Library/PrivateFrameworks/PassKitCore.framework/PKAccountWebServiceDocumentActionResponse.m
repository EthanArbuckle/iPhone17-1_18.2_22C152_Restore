@interface PKAccountWebServiceDocumentActionResponse
- (NSData)documentPDFData;
- (NSString)documentDataFilename;
- (NSString)documentDataHash;
- (PKAccountWebServiceDocumentActionResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceDocumentActionResponse

- (PKAccountWebServiceDocumentActionResponse)initWithData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServiceDocumentActionResponse;
  v3 = [(PKWebServiceResponse *)&v20 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_15:
    v13 = v4;
    goto LABEL_19;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKStringForKey:@"statementDataFilename"];
    v7 = v6;
    if (!v6)
    {
      v7 = [v5 PKStringForKey:@"dataFilename"];
    }
    objc_storeStrong((id *)&v4->_documentDataFilename, v7);
    if (!v6) {

    }
    v8 = [v5 PKStringForKey:@"statementDataHash"];
    v9 = v8;
    if (!v8)
    {
      v9 = [v5 PKStringForKey:@"dataHash"];
    }
    objc_storeStrong((id *)&v4->_documentDataHash, v9);
    if (!v8) {

    }
    v10 = [v5 PKStringForKey:@"statementPDFData"];
    if (v10
      || ([v5 PKStringForKey:@"pdfData"],
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
      documentPDFData = v4->_documentPDFData;
      v4->_documentPDFData = (NSData *)v11;
    }
    goto LABEL_15;
  }
  v14 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2114;
    v24 = v18;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (NSData)documentPDFData
{
  return self->_documentPDFData;
}

- (NSString)documentDataFilename
{
  return self->_documentDataFilename;
}

- (NSString)documentDataHash
{
  return self->_documentDataHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentDataHash, 0);
  objc_storeStrong((id *)&self->_documentDataFilename, 0);
  objc_storeStrong((id *)&self->_documentPDFData, 0);
}

@end