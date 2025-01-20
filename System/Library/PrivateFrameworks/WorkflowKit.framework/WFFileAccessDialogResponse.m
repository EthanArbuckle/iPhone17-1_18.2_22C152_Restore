@interface WFFileAccessDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (WFFileAccessDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFFileAccessDialogResponse)initWithCoder:(id)a3;
- (WFFileAccessDialogResponse)initWithFileResponseCode:(unint64_t)a3 error:(id)a4;
- (id)description;
- (unint64_t)fileResponseCode;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileAccessDialogResponse

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)fileResponseCode
{
  return self->_fileResponseCode;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFFileAccessDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v7 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode", v7.receiver, v7.super_class), @"fileResponseCode");
  v5 = [(WFFileAccessDialogResponse *)self error];
  v6 = WFEncodableError();
  [v4 encodeObject:v6 forKey:@"error"];
}

- (WFFileAccessDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileAccessDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_fileResponseCode = [v4 decodeInt64ForKey:@"fileResponseCode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFFileAccessDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode", v7.receiver, v7.super_class), @"fileResponseCode");
  v5 = [(WFFileAccessDialogResponse *)self error];
  uint64_t v6 = WFEncodableError();
  [v4 encodeObject:v6 forKey:@"error"];
}

- (WFFileAccessDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileAccessDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_fileResponseCode = [v4 decodeIntegerForKey:@"fileResponseCode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p, responseCode: %tu>", v5, self, -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode")];

  return v6;
}

- (WFFileAccessDialogResponse)initWithFileResponseCode:(unint64_t)a3 error:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFFileAccessDialogResponse;
  v8 = [(WFDialogResponse *)&v12 initWithCancelled:a3 == 0];
  v9 = v8;
  if (v8)
  {
    v8->_fileResponseCode = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end