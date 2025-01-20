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
  id v7 = a3;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)MOEventBundleLabelFormat;
    v8 = [(MOEventBundleLabelFormat *)&v13 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_format, a3);
      v9->_capitalizationType = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](v11);
    }

    v10 = 0;
  }

  return v10;
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