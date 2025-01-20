@interface ICSyncSettings
+ (BOOL)hasOptions:(unint64_t)a3;
+ (id)sharedSettings;
+ (void)initSharedSettingsWithOptions:(unint64_t)a3;
- (BOOL)hasAnyOptions:(unint64_t)a3;
- (BOOL)hasOptions:(unint64_t)a3;
- (ICSyncSettings)initWithOptions:(unint64_t)a3;
- (unint64_t)options;
- (void)setOptions:(unint64_t)a3;
@end

@implementation ICSyncSettings

+ (void)initSharedSettingsWithOptions:(unint64_t)a3
{
  if (qword_100922A38)
  {
    v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100752D40(v6);
    }
  }
  v4 = [[ICSyncSettings alloc] initWithOptions:a3];
  v5 = (void *)qword_100922A38;
  qword_100922A38 = (uint64_t)v4;
}

+ (id)sharedSettings
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BE70;
  block[3] = &unk_1008AFF00;
  block[4] = a1;
  if (qword_100922A40 != -1) {
    dispatch_once(&qword_100922A40, block);
  }
  v2 = (void *)qword_100922A38;

  return v2;
}

- (ICSyncSettings)initWithOptions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSyncSettings;
  v4 = [(ICSyncSettings *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ICSyncSettings *)v4 setOptions:a3];
  }
  return v5;
}

+ (BOOL)hasOptions:(unint64_t)a3
{
  BOOL result = qword_100922A38;
  if (qword_100922A38) {
    return [(id)qword_100922A38 hasOptions:a3];
  }
  return result;
}

- (BOOL)hasOptions:(unint64_t)a3
{
  return (a3 & ~[(ICSyncSettings *)self options]) == 0;
}

- (BOOL)hasAnyOptions:(unint64_t)a3
{
  return ([(ICSyncSettings *)self options] & a3) != 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end