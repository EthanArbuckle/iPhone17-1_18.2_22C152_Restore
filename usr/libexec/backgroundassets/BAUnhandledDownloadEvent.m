@interface BAUnhandledDownloadEvent
+ (BOOL)supportsSecureCoding;
+ (id)classesForSerialization;
- (BADownload)download;
- (BAUnhandledDownloadEvent)initWithCoder:(id)a3;
- (BAUnhandledDownloadEvent)initWithEventType:(int64_t)a3 download:(id)a4 error:(id)a5;
- (NSError)eventError;
- (id)description;
- (id)typeString;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDownload:(id)a3;
- (void)setEventError:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BAUnhandledDownloadEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_1000695B0 != -1) {
    dispatch_once(&qword_1000695B0, &stru_10005D740);
  }
  v2 = (void *)qword_1000695A8;

  return v2;
}

- (BAUnhandledDownloadEvent)initWithEventType:(int64_t)a3 download:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (a3 == 2 && !v9)
  {
    result = (BAUnhandledDownloadEvent *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (result) {
      sub_10003B380();
    }
    qword_1000694C8 = (uint64_t)"BUG IN BackgroundAssets: BAUnhandledDownloadEvent initialized with a failure event but a nil error.";
    qword_1000694F8 = 6;
    __break(1u);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BAUnhandledDownloadEvent;
    v11 = [(BAUnhandledDownloadEvent *)&v14 init];
    v12 = v11;
    if (v11)
    {
      [(BAUnhandledDownloadEvent *)v11 setType:a3];
      [(BAUnhandledDownloadEvent *)v12 setDownload:v8];
      [(BAUnhandledDownloadEvent *)v12 setEventError:v10];
    }

    return v12;
  }
  return result;
}

- (BAUnhandledDownloadEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BAUnhandledDownloadEvent;
  v5 = [(BAUnhandledDownloadEvent *)&v12 init];
  if (!v5) {
    goto LABEL_6;
  }
  -[BAUnhandledDownloadEvent setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
  v6 = +[BADownload classesForSerialization];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"download"];
  [(BAUnhandledDownloadEvent *)v5 setDownload:v7];

  if ([v4 containsValueForKey:@"eventError"])
  {
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"eventError"];
    [(BAUnhandledDownloadEvent *)v5 setEventError:v9];
  }
  if ((id)[(BAUnhandledDownloadEvent *)v5 type] == (id)2
    && ([(BAUnhandledDownloadEvent *)v5 eventError],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    result = (BAUnhandledDownloadEvent *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (result) {
      sub_10003B408();
    }
    qword_1000694C8 = (uint64_t)"BUG IN BackgroundAssets: BAUnhandledDownloadEvent initialized from coder as a failure eve"
                               "nt but with a nil error.";
    qword_1000694F8 = 6;
    __break(1u);
  }
  else
  {
LABEL_6:

    return v5;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:-[BAUnhandledDownloadEvent type](self, "type") forKey:@"type"];
  id v4 = [(BAUnhandledDownloadEvent *)self download];
  [v7 encodeObject:v4 forKey:@"download"];

  v5 = [(BAUnhandledDownloadEvent *)self eventError];

  if (v5)
  {
    v6 = [(BAUnhandledDownloadEvent *)self eventError];
    [v7 encodeObject:v6 forKey:@"eventError"];
  }
}

- (id)typeString
{
  int64_t v2 = [(BAUnhandledDownloadEvent *)self type];
  CFStringRef v3 = @"Unknown";
  if (v2 == 2) {
    CFStringRef v3 = @"Download Failed";
  }
  if (v2 == 1) {
    return @"Download Finished";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  int64_t v3 = [(BAUnhandledDownloadEvent *)self type];
  id v4 = [(BAUnhandledDownloadEvent *)self typeString];
  if (v3 == 2)
  {
    v5 = [(BAUnhandledDownloadEvent *)self eventError];
    v6 = [(BAUnhandledDownloadEvent *)self download];
    id v7 = [v6 description];
    id v8 = +[NSString stringWithFormat:@"Event: %@ - Error %@ - Download %@", v4, v5, v7];
  }
  else
  {
    v5 = [(BAUnhandledDownloadEvent *)self download];
    v6 = [v5 description];
    id v8 = +[NSString stringWithFormat:@"Event: %@ - Download %@", v4, v6];
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BADownload)download
{
  return (BADownload *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDownload:(id)a3
{
}

- (NSError)eventError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEventError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventError, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end