@interface PFMetadataStateBreadcrumb
- (NSString)breadcrumbDescription;
- (NSString)message;
- (PFMetadataStateBreadcrumb)initWithTimeInterval:(double)a3 message:(id)a4;
- (double)timeInterval;
- (unint64_t)threadID;
- (unsigned)qualityOfService;
@end

@implementation PFMetadataStateBreadcrumb

- (void).cxx_destruct
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (NSString)breadcrumbDescription
{
  v3 = [MEMORY[0x1E4F8A228] stringFromTimestamp:self->_timeInterval];
  signed int qualityOfService = self->_qualityOfService;
  v5 = @"UI";
  v6 = @"UT";
  v7 = @"DF";
  v8 = @"IN";
  if (qualityOfService != 25) {
    v8 = @"UI";
  }
  if (qualityOfService != 21) {
    v7 = v8;
  }
  if (qualityOfService != 17) {
    v6 = v7;
  }
  if (qualityOfService == 9) {
    v5 = @"BG";
  }
  if (!qualityOfService) {
    v5 = @"UN";
  }
  if (qualityOfService <= 16) {
    v9 = v5;
  }
  else {
    v9 = v6;
  }
  v10 = [NSString stringWithFormat:@"%@: Thread 0x%-8llx QoS %@ %@", v3, self->_threadID, v9, self->_message];

  return (NSString *)v10;
}

- (PFMetadataStateBreadcrumb)initWithTimeInterval:(double)a3 message:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFMetadataStateBreadcrumb;
  v7 = [(PFMetadataStateBreadcrumb *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_timeInterval = a3;
    uint64_t v9 = [v6 copy];
    message = v8->_message;
    v8->_message = (NSString *)v9;

    v8->_signed int qualityOfService = qos_class_self();
    pthread_threadid_np(0, &v8->_threadID);
    v11 = v8;
  }

  return v8;
}

@end