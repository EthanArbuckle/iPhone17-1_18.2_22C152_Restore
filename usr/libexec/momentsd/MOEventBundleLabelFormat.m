@interface MOEventBundleLabelFormat
- (MOEventBundleLabelFormat)initWithFormat:(id)a3;
- (MOEventBundleLabelFormat)initWithFormat:(id)a3 capitalizationType:(unint64_t)a4;
- (NSString)format;
- (id)description;
- (unint64_t)capitalizationType;
- (void)setCapitalizationType:(unint64_t)a3;
- (void)setFormat:(id)a3;
@end

@implementation MOEventBundleLabelFormat

- (MOEventBundleLabelFormat)initWithFormat:(id)a3 capitalizationType:(unint64_t)a4
{
  id v8 = a3;
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)MOEventBundleLabelFormat;
    v9 = [(MOEventBundleLabelFormat *)&v15 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_format, a3);
      v10->_capitalizationType = a4;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](v12);
    }

    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelFormat.m" lineNumber:16 description:@"Invalid parameter not satisfying: format"];

    v11 = 0;
  }

  return v11;
}

- (MOEventBundleLabelFormat)initWithFormat:(id)a3
{
  return [(MOEventBundleLabelFormat *)self initWithFormat:a3 capitalizationType:1];
}

- (id)description
{
  v3 = [(MOEventBundleLabelFormat *)self format];
  v4 = +[NSString stringWithFormat:@"labels, %@, capitalization type, %lu", v3, [(MOEventBundleLabelFormat *)self capitalizationType]];

  return v4;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (unint64_t)capitalizationType
{
  return self->_capitalizationType;
}

- (void)setCapitalizationType:(unint64_t)a3
{
  self->_capitalizationType = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithFormat:(os_log_t)log capitalizationType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: format", v1, 2u);
}

@end