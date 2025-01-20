@interface MapsRadarImageAttachment
+ (MapsRadarImageAttachment)attachmentWithFileName:(id)a3 image:(id)a4;
- (MapsRadarImageAttachment)initWithFileName:(id)a3 image:(id)a4;
- (UIImage)image;
- (id)debugDescription;
- (id)description;
- (id)temporaryFileURL;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation MapsRadarImageAttachment

- (MapsRadarImageAttachment)initWithFileName:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[MapsRadarImageAttachment initWithFileName:image:]";
      __int16 v17 = 2080;
      v18 = "MapsRadarAttachment.m";
      __int16 v19 = 1024;
      int v20 = 225;
      __int16 v21 = 2080;
      v22 = "image != nil";
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
  v14.super_class = (Class)MapsRadarImageAttachment;
  v8 = [(MapsRadarAttachment *)&v14 initWithFileName:v6];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_image, a4);
  }

  return v9;
}

+ (MapsRadarImageAttachment)attachmentWithFileName:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFileName:v7 image:v6];

  return (MapsRadarImageAttachment *)v8;
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
    v9 = [(MapsRadarImageAttachment *)self image];
    v10 = UIImagePNGRepresentation(v9);
    id v19 = 0;
    unsigned int v11 = [v10 writeToURL:v5 options:1 error:&v19];
    id v12 = v19;

    if (v11)
    {
      v13 = v5;
    }
    else
    {
      objc_super v14 = sub_1009D046C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [(MapsRadarAttachment *)self fileName];
        v16 = [(MapsRadarImageAttachment *)self image];
        *(_DWORD *)buf = 138413058;
        __int16 v21 = v15;
        __int16 v22 = 2112;
        v23 = v16;
        __int16 v24 = 2112;
        v25 = v4;
        __int16 v26 = 2112;
        id v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to save file with name '%@' from image '%@' at path '%@': %@", buf, 0x2Au);
      }
      v13 = 0;
    }
    __int16 v17 = self->_temporaryFileURL;
    self->_temporaryFileURL = v13;

    temporaryFileURL = self->_temporaryFileURL;
  }

  return temporaryFileURL;
}

- (id)description
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000920BC;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarImageAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarImageAttachment *)v5 performSelector:"accessibilityIdentifier"];
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

  unsigned int v11 = [v3 componentsJoinedByString:@", "];
  id v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return v12;
}

- (id)debugDescription
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1009D25AC;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarImageAttachment *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarImageAttachment *)v5 performSelector:"accessibilityIdentifier"];
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

  unsigned int v11 = [v3 componentsJoinedByString:@"\n"];
  id v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsRadarImageAttachment;
  v4 = (void (**)(id, const __CFString *, UIImage *))a3;
  [(MapsRadarAttachment *)&v5 _maps_buildDescriptionWithBlock:v4];
  v4[2](v4, @"image", self->_image);
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end