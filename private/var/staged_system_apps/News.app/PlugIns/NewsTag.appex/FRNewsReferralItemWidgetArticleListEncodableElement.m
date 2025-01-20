@interface FRNewsReferralItemWidgetArticleListEncodableElement
+ (BOOL)supportsSecureCoding;
- (FRNewsReferralItemWidgetArticleListEncodableElement)init;
- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithCoder:(id)a3;
- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithJSONArray:(id)a3;
- (NSArray)JSONArray;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FRNewsReferralItemWidgetArticleListEncodableElement

- (FRNewsReferralItemWidgetArticleListEncodableElement)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRNewsReferralItemWidgetArticleListEncodableElement init]";
    __int16 v7 = 2080;
    v8 = "FRNewsReferralItemWidgetArticleList.m";
    __int16 v9 = 1024;
    int v10 = 164;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRNewsReferralItemWidgetArticleListEncodableElement init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithJSONArray:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C6F7C();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRNewsReferralItemWidgetArticleListEncodableElement;
  v5 = [(FRNewsReferralItemWidgetArticleListEncodableElement *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    JSONArray = v5->_JSONArray;
    v5->_JSONArray = v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FRNewsReferralItemWidgetArticleListEncodableElement *)self JSONArray];
  [v4 encodeObject:v5 forKey:@"b"];
}

- (FRNewsReferralItemWidgetArticleListEncodableElement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  int v10 = [v4 decodeObjectOfClasses:v9 forKey:@"b"];

  __int16 v11 = [(FRNewsReferralItemWidgetArticleListEncodableElement *)self initWithJSONArray:v10];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)JSONArray
{
  return self->_JSONArray;
}

- (void).cxx_destruct
{
}

@end