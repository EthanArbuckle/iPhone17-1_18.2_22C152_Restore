@interface PKPaymentBackgroundDownloadRecord
+ (BOOL)supportsSecureCoding;
+ (id)taskWithType:(int64_t)a3;
- (PKPaymentBackgroundDownloadRecord)initWithCoder:(id)a3;
- (int64_t)retryCount;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setTaskType:(int64_t)a3;
@end

@implementation PKPaymentBackgroundDownloadRecord

- (PKPaymentBackgroundDownloadRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentBackgroundDownloadRecord;
  v5 = [(PKPaymentBackgroundDownloadRecord *)&v7 init];
  if (v5)
  {
    -[PKPaymentBackgroundDownloadRecord setTaskType:](v5, "setTaskType:", [v4 decodeIntegerForKey:@"taskType"]);
    -[PKPaymentBackgroundDownloadRecord setRetryCount:](v5, "setRetryCount:", [v4 decodeIntegerForKey:@"retryCount"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPaymentBackgroundDownloadRecord taskType](self, "taskType"), @"taskType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPaymentBackgroundDownloadRecord retryCount](self, "retryCount"), @"retryCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)taskWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    id v4 = 0;
  }
  else {
    id v4 = (objc_class *)objc_opt_class();
  }
  id v5 = objc_alloc_init(v4);
  [v5 setTaskType:a3];
  return v5;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(int64_t)a3
{
  self->_taskType = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

@end