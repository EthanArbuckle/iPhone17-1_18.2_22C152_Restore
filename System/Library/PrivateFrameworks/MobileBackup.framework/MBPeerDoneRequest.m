@interface MBPeerDoneRequest
- (MBPeerDoneRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerDoneRequest)initWithError:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)dictionaryRepresentation;
@end

@implementation MBPeerDoneRequest

- (id)dictionaryRepresentation
{
  v3 = [(MBPeerDoneRequest *)self error];

  if (v3)
  {
    v4 = [(MBPeerDoneRequest *)self error];
    id v11 = 0;
    v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
    id v6 = v11;

    if (v5)
    {
      CFStringRef v12 = @"MBErrorData";
      v13 = v5;
      v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    }
    else
    {
      v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = [(MBPeerDoneRequest *)self error];
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to archive error %@: %@", buf, 0x16u);

        v10 = [(MBPeerDoneRequest *)self error];
        _MBLog();
      }
      v7 = &__NSDictionary0__struct;
    }
  }
  else
  {
    v7 = &__NSDictionary0__struct;
  }
  return v7;
}

- (MBPeerDoneRequest)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBPeerDoneRequest;
  id v6 = [(MBPeerEmptyMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (MBPeerDoneRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MBPeerDoneRequest;
  v7 = [(MBPeerEmptyMessage *)&v16 init];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"MBErrorData"];
    if (v8)
    {
      id v15 = 0;
      id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v8 error:&v15];
      id v10 = v15;
      if (v9)
      {
        uint64_t v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        error = v7->_error;
        v7->_error = (NSError *)v11;
      }
      else
      {
        v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v8;
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to unarchive error data %@: %@", buf, 0x16u);
          _MBLog();
        }

        if (a4) {
          *a4 = v10;
        }
        error = v7;
        v7 = 0;
      }
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = [(MBPeerDoneRequest *)self error];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  if (v3) {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; error=\"%@\">",
  }
      Name,
      self,
      v3);
  else {
  id v6 = +[NSString stringWithFormat:@"<%s: %p>", Name, self, v8];
  }

  return (NSString *)v6;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end