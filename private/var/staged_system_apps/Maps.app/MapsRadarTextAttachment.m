@interface MapsRadarTextAttachment
+ (id)attachmentWithFileName:(id)a3 text:(id)a4;
- (MapsRadarTextAttachment)initWithFileName:(id)a3 text:(id)a4;
- (NSString)text;
- (id)debugDescription;
- (id)description;
- (id)temporaryFileURL;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation MapsRadarTextAttachment

- (MapsRadarTextAttachment)initWithFileName:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[MapsRadarTextAttachment initWithFileName:text:]";
      __int16 v18 = 2080;
      v19 = "MapsRadarAttachment.m";
      __int16 v20 = 1024;
      int v21 = 69;
      __int16 v22 = 2080;
      v23 = "text != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MapsRadarTextAttachment;
  v8 = [(MapsRadarAttachment *)&v15 initWithFileName:v6];
  if (v8)
  {
    v9 = (NSString *)[v7 copy];
    text = v8->_text;
    v8->_text = v9;
  }
  return v8;
}

+ (id)attachmentWithFileName:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFileName:v7 text:v6];

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
    v9 = [(MapsRadarTextAttachment *)self text];
    id v18 = 0;
    unsigned int v10 = [v9 writeToURL:v5 atomically:1 encoding:4 error:&v18];
    id v11 = v18;

    if (v10)
    {
      v12 = v5;
    }
    else
    {
      v13 = sub_1009D046C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [(MapsRadarAttachment *)self fileName];
        objc_super v15 = [(MapsRadarTextAttachment *)self text];
        *(_DWORD *)buf = 138413058;
        __int16 v20 = v14;
        __int16 v21 = 2112;
        __int16 v22 = v15;
        __int16 v23 = 2112;
        v24 = v4;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to save file with name '%@' from text '%@' at path '%@': %@", buf, 0x2Au);
      }
      v12 = 0;
    }
    v16 = self->_temporaryFileURL;
    self->_temporaryFileURL = v12;

    temporaryFileURL = self->_temporaryFileURL;
  }

  return temporaryFileURL;
}

- (id)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000920BC;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarTextAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarTextAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unsigned int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unsigned int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unsigned int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return v12;
}

- (id)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1009D25AC;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarTextAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarTextAttachment *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unsigned int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unsigned int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unsigned int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsRadarTextAttachment;
  v4 = (void (**)(id, const __CFString *, NSString *))a3;
  [(MapsRadarAttachment *)&v5 _maps_buildDescriptionWithBlock:v4];
  v4[2](v4, @"text", self->_text);
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end