@interface PLPhotosKnowledgeGraphAvailabilityStatus
- (NSString)statusDescription;
- (PLPhotosKnowledgeGraphAvailabilityStatus)initWithDictionary:(id)a3;
- (int64_t)availability;
@end

@implementation PLPhotosKnowledgeGraphAvailabilityStatus

- (void).cxx_destruct
{
}

- (int64_t)availability
{
  return self->_availability;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (PLPhotosKnowledgeGraphAvailabilityStatus)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLPhotosKnowledgeGraphAvailabilityStatus;
  v5 = [(PLPhotosKnowledgeGraphAvailabilityStatus *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"graphStatusDescription"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"No status description";
    }
    objc_storeStrong((id *)&v5->_statusDescription, v8);

    v9 = [v4 objectForKeyedSubscript:@"graphIsReadyStatus"];
    if (v9)
    {
      v10 = [v4 objectForKeyedSubscript:@"graphIsReadyStatus"];
      if ([v10 BOOLValue]) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }

    v5->_availability = v11;
    v12 = v5;
  }

  return v5;
}

@end