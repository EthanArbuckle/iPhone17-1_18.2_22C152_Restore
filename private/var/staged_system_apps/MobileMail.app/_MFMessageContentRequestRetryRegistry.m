@interface _MFMessageContentRequestRetryRegistry
+ (id)sharedRegistry;
- (NSMutableDictionary)storage;
- (_MFMessageContentRequestRetryRegistry)init;
- (unint64_t)numberOfRetryForContentRepresentation:(id)a3;
- (void)logRetryForContentRequest:(id)a3;
- (void)removeContentRequest:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation _MFMessageContentRequestRetryRegistry

+ (id)sharedRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100133494;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699850 != -1) {
    dispatch_once(&qword_100699850, block);
  }
  v2 = (void *)qword_100699848;

  return v2;
}

- (_MFMessageContentRequestRetryRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MFMessageContentRequestRetryRegistry;
  v2 = [(_MFMessageContentRequestRetryRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storage = v2->_storage;
    v2->_storage = v3;
  }
  return v2;
}

- (void)logRetryForContentRequest:(id)a3
{
  sub_100133654(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v4 = [(_MFMessageContentRequestRetryRegistry *)self storage];
    v5 = [v4 objectForKeyedSubscript:v8];
    objc_super v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 unsignedIntegerValue] + 1);
    v7 = [(_MFMessageContentRequestRetryRegistry *)self storage];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (void)removeContentRequest:(id)a3
{
  sub_100133654(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4 = [(_MFMessageContentRequestRetryRegistry *)self storage];
    [v4 removeObjectForKey:v5];
  }
}

- (unint64_t)numberOfRetryForContentRepresentation:(id)a3
{
  v4 = sub_100133654(a3);
  if (v4)
  {
    id v5 = [(_MFMessageContentRequestRetryRegistry *)self storage];
    objc_super v6 = [v5 objectForKeyedSubscript:v4];
    unint64_t v7 = (unint64_t)[v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end