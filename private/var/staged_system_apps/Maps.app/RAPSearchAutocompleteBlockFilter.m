@interface RAPSearchAutocompleteBlockFilter
+ (id)addressAutocompleteFilter;
+ (id)poiAutocompleteFilterWithExcludedMUIDs:(id)a3;
- (BOOL)shouldFilterItem:(id)a3;
- (RAPSearchAutocompleteBlockFilter)initWithBlock:(id)a3;
@end

@implementation RAPSearchAutocompleteBlockFilter

- (BOOL)shouldFilterItem:(id)a3
{
  return (*((uint64_t (**)(void))self->_block + 2))();
}

- (RAPSearchAutocompleteBlockFilter)initWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)RAPSearchAutocompleteBlockFilter;
    v5 = [(RAPSearchAutocompleteBlockFilter *)&v10 init];
    if (v5)
    {
      id v6 = [v4 copy];
      id block = v5->_block;
      v5->_id block = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: block != ((void *)0)", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)addressAutocompleteFilter
{
  v2 = [[RAPSearchAutocompleteBlockFilter alloc] initWithBlock:&stru_1012EA228];

  return v2;
}

+ (id)poiAutocompleteFilterWithExcludedMUIDs:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10042DB04;
  v7[3] = &unk_1012EA250;
  id v8 = a3;
  id v3 = v8;
  id v4 = objc_retainBlock(v7);
  v5 = [[RAPSearchAutocompleteBlockFilter alloc] initWithBlock:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end