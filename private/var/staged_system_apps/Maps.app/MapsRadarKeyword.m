@interface MapsRadarKeyword
+ (MapsRadarKeyword)keywordWithName:(id)a3 number:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (MapsRadarKeyword)initWithName:(id)a3 number:(unint64_t)a4;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (unint64_t)hash;
- (unint64_t)number;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation MapsRadarKeyword

+ (MapsRadarKeyword)keywordWithName:(id)a3 number:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithName:v6 number:a4];

  return (MapsRadarKeyword *)v7;
}

- (MapsRadarKeyword)initWithName:(id)a3 number:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[MapsRadarKeyword initWithName:number:]";
      __int16 v17 = 2080;
      v18 = "MapsRadarKeyword.m";
      __int16 v19 = 1024;
      int v20 = 31;
      __int16 v21 = 2080;
      v22 = "name != nil";
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
  v14.super_class = (Class)MapsRadarKeyword;
  id v7 = [(MapsRadarKeyword *)&v14 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    name = v7->_name;
    v7->_name = v8;

    v7->_number = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithUnsignedInteger:self->_number];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MapsRadarKeyword *)self number];
    BOOL v6 = v5 == [v4 number];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100091F28;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarKeyword *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(MapsRadarKeyword *)v5 performSelector:"accessibilityIdentifier"];
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
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_10082A228;
  __int16 v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapsRadarKeyword *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(MapsRadarKeyword *)v5 performSelector:"accessibilityIdentifier"];
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
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, id))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_number];
  (*v4)(v6, @"number", v7);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)number
{
  return self->_number;
}

- (void).cxx_destruct
{
}

@end