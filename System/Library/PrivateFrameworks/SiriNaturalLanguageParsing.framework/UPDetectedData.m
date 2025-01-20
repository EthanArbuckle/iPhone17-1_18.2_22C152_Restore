@interface UPDetectedData
- (NSString)label;
- (UPDetectedData)initWithLabel:(id)a3 dataDetectorResult:(__CFArray *)a4;
- (__CFArray)dataDetectorResult;
- (void)dealloc;
@end

@implementation UPDetectedData

- (void).cxx_destruct
{
}

- (__CFArray)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  CFRelease(self->_dataDetectorResult);
  v3.receiver = self;
  v3.super_class = (Class)UPDetectedData;
  [(UPDetectedData *)&v3 dealloc];
}

- (UPDetectedData)initWithLabel:(id)a3 dataDetectorResult:(__CFArray *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UPDetectedData;
  v8 = [(UPDetectedData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_dataDetectorResult = a4;
  }

  return v9;
}

@end