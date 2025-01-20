@interface MapsRadarFileAttachment
+ (id)attachmentWithFileName:(id)a3 fileURL:(id)a4;
- (BOOL)deleteOnAttach;
- (MapsRadarFileAttachment)initWithFileName:(id)a3 fileURL:(id)a4;
- (NSURL)fileURL;
- (id)debugDescription;
- (id)description;
- (id)temporaryFileURL;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)setDeleteOnAttach:(BOOL)a3;
@end

@implementation MapsRadarFileAttachment

- (MapsRadarFileAttachment)initWithFileName:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[MapsRadarFileAttachment initWithFileName:fileURL:]";
      __int16 v21 = 2080;
      v22 = "MapsRadarAttachment.m";
      __int16 v23 = 1024;
      int v24 = 169;
      __int16 v25 = 2080;
      v26 = "fileURL != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[MapsRadarFileAttachment initWithFileName:fileURL:]";
      __int16 v21 = 2080;
      v22 = "MapsRadarAttachment.m";
      __int16 v23 = 1024;
      int v24 = 170;
      __int16 v25 = 2080;
      v26 = "[fileURL isFileURL]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)MapsRadarFileAttachment;
  v8 = [(MapsRadarAttachment *)&v18 initWithFileName:v6];
  if (v8)
  {
    v9 = (NSURL *)[v7 copy];
    fileURL = v8->_fileURL;
    v8->_fileURL = v9;
  }
  return v8;
}

+ (id)attachmentWithFileName:(id)a3 fileURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFileName:v7 fileURL:v6];

  return v8;
}

- (id)temporaryFileURL
{
  temporaryFileURL = self->_temporaryFileURL;
  if (!temporaryFileURL)
  {
    v4 = [(MapsRadarAttachment *)self _filePath];
    v5 = +[NSURL fileURLWithPath:v4];
    id v6 = +[NSFileManager defaultManager];
    unsigned int v7 = [v6 fileExistsAtPath:v4];

    if (v7)
    {
      id v8 = +[NSFileManager defaultManager];
      [v8 removeItemAtPath:v4 error:0];
    }
    BOOL deleteOnAttach = self->_deleteOnAttach;
    v10 = +[NSFileManager defaultManager];
    v11 = [(MapsRadarFileAttachment *)self fileURL];
    if (deleteOnAttach)
    {
      id v23 = 0;
      unsigned __int8 v12 = [v10 moveItemAtURL:v11 toURL:v5 error:&v23];
      id v13 = v23;

      if (v12)
      {
LABEL_6:
        v14 = v5;
LABEL_14:
        v20 = self->_temporaryFileURL;
        self->_temporaryFileURL = v14;

        temporaryFileURL = self->_temporaryFileURL;
        goto LABEL_15;
      }
    }
    else
    {
      id v22 = 0;
      unsigned int v15 = [v10 copyItemAtURL:v11 toURL:v5 error:&v22];
      id v13 = v22;

      if (v15) {
        goto LABEL_6;
      }
    }
    v16 = sub_1009D046C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self->_deleteOnAttach) {
        CFStringRef v17 = @"move";
      }
      else {
        CFStringRef v17 = @"copy";
      }
      objc_super v18 = [(MapsRadarAttachment *)self fileName];
      v19 = [(MapsRadarFileAttachment *)self fileURL];
      *(_DWORD *)buf = 138413314;
      CFStringRef v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v4;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to %@ file with name '%@' from path '%@' to path '%@': %@", buf, 0x34u);
    }
    v14 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return temporaryFileURL;
}

- (id)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000920BC;
  CFStringRef v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarFileAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarFileAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  unsigned __int8 v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return v12;
}

- (id)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1009D25AC;
  CFStringRef v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarFileAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarFileAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  unsigned __int8 v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsRadarFileAttachment;
  v4 = (void (**)(id, const __CFString *, NSURL *))a3;
  [(MapsRadarAttachment *)&v5 _maps_buildDescriptionWithBlock:v4];
  v4[2](v4, @"file url", self->_fileURL);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)deleteOnAttach
{
  return self->_deleteOnAttach;
}

- (void)setDeleteOnAttach:(BOOL)a3
{
  self->_BOOL deleteOnAttach = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end