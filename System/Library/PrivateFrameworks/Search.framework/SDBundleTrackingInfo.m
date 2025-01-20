@interface SDBundleTrackingInfo
+ (id)_trackingInfoDir;
- (BOOL)shouldContinueIndexingAfterTransitioToState:(int)a3;
- (BOOL)shouldRunIndexer;
- (SDBundleTrackingInfo)initWithCompositeIdentifier:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_filename;
- (void)_loadFromPlist;
- (void)_saveToPlist;
- (void)save;
@end

@implementation SDBundleTrackingInfo

- (id)_dictionaryRepresentation
{
  return 0;
}

- (id)_filename
{
  return [(NSString *)self->_compositeIdentifier stringByAppendingString:@".plist"];
}

+ (id)_trackingInfoDir
{
  v2 = (void *)qword_1000A8C88;
  if (!qword_1000A8C88)
  {
    v3 = SPSpotlightSupportDirectoryPath();
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"BundleTrackingInfo"];
    v5 = (void *)qword_1000A8C88;
    qword_1000A8C88 = v4;

    v2 = (void *)qword_1000A8C88;
  }

  return v2;
}

- (void)_saveToPlist
{
  v3 = [(SDBundleTrackingInfo *)self _dictionaryRepresentation];
  if (v3)
  {
    id v12 = 0;
    uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v12];
    id v5 = v12;
    if (v4)
    {
      v6 = +[SDBundleTrackingInfo _trackingInfoDir];
      v7 = +[NSFileManager defaultManager];
      unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

      if ((v8 & 1) == 0)
      {
        v9 = +[NSFileManager defaultManager];
        [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
      }
      v10 = [(SDBundleTrackingInfo *)self _filename];
      v11 = [v6 stringByAppendingPathComponent:v10];

      [v4 writeToFile:v11 atomically:0];
    }
    else
    {
      v6 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100064A54((uint64_t)self, (uint64_t)v5, v6);
      }
    }
  }
}

- (void)_loadFromPlist
{
  v3 = +[SDBundleTrackingInfo _trackingInfoDir];
  uint64_t v4 = [(SDBundleTrackingInfo *)self _filename];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5];
    id v12 = 0;
    v9 = +[NSPropertyListSerialization propertyListWithData:v8 options:0 format:0 error:&v12];
    id v10 = v12;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SDBundleTrackingInfo *)self _copyInfoFromDictionary:v9];
LABEL_10:

        goto LABEL_11;
      }
      v11 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100064B48((uint64_t)v9, v11);
      }
    }
    else
    {
      v11 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100064AD0((uint64_t)v5, (uint64_t)v10, v11);
      }
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (SDBundleTrackingInfo)initWithCompositeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDBundleTrackingInfo;
  v6 = [(SDBundleTrackingInfo *)&v9 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_compositeIdentifier, a3);
    [(SDBundleTrackingInfo *)v7 _loadFromPlist];
  }

  return v7;
}

- (void)save
{
  if (self->_isDirty) {
    [(SDBundleTrackingInfo *)self _saveToPlist];
  }
}

- (BOOL)shouldRunIndexer
{
  return self->_shouldRun;
}

- (BOOL)shouldContinueIndexingAfterTransitioToState:(int)a3
{
  switch(self->_state)
  {
    case 0:
      if (a3 == 1) {
        goto LABEL_6;
      }
      goto LABEL_12;
    case 1:
      if (a3 != 2) {
        goto LABEL_5;
      }
      goto LABEL_6;
    case 2:
      if ((a3 - 3) >= 2) {
        goto LABEL_12;
      }
      goto LABEL_6;
    case 3:
      if (a3 != 4) {
        goto LABEL_12;
      }
      goto LABEL_6;
    case 4:
LABEL_5:
      if (a3 == 5) {
        goto LABEL_6;
      }
      goto LABEL_12;
    case 5:
      if (a3 != 6) {
        goto LABEL_12;
      }
LABEL_6:
      self->_state = a3;
      BOOL result = 1;
      break;
    default:
LABEL_12:
      id v5 = +[NSNumber numberWithInt:*(void *)&a3];
      v6 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"kTransitioningState", 0];
      [(SDBundleTrackingInfo *)self recordEvent:5 info:v6 forBundleWithKey:self->_compositeIdentifier inState:self->_state];

      BOOL result = 0;
      break;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end