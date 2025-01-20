@interface MapsRadarAttachment
+ (MapsRadarAttachment)attachmentWithFileName:(id)a3;
- (MapsRadarAttachment)initWithFileName:(id)a3;
- (NSDate)creationDate;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)fileName;
- (NSURL)temporaryFileURL;
- (id)_filePath;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation MapsRadarAttachment

- (MapsRadarAttachment)initWithFileName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[MapsRadarAttachment initWithFileName:]";
      __int16 v17 = 2080;
      v18 = "MapsRadarAttachment.m";
      __int16 v19 = 1024;
      int v20 = 28;
      __int16 v21 = 2080;
      v22 = "fileName != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MapsRadarAttachment;
  v5 = [(MapsRadarAttachment *)&v14 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    fileName = v5->_fileName;
    v5->_fileName = v6;

    uint64_t v8 = +[NSDate date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;
  }
  return v5;
}

+ (MapsRadarAttachment)attachmentWithFileName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithFileName:v4];

  return (MapsRadarAttachment *)v5;
}

- (NSURL)temporaryFileURL
{
  v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315650;
    v7 = "-[MapsRadarAttachment temporaryFileURL]";
    __int16 v8 = 2080;
    v9 = "MapsRadarAttachment.m";
    __int16 v10 = 1024;
    int v11 = 44;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v6, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = +[NSThread callStackSymbols];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (id)_filePath
{
  v3 = NSTemporaryDirectory();
  id v4 = [(MapsRadarAttachment *)self fileName];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (NSString)description
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000920BC;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    int v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      __int16 v8 = [(MapsRadarAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        __int16 v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    __int16 v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  __int16 v10 = @"<nil>";
LABEL_9:

  int v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1009D25AC;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    int v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      __int16 v8 = [(MapsRadarAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        __int16 v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    __int16 v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  __int16 v10 = @"<nil>";
LABEL_9:

  int v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, NSDate *))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"creation date", self->_creationDate);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_fileName, 0);
}

@end