@interface JSASessionStorage
+ (id)sharedInstance;
- (JSASessionStorage)init;
- (NSMutableDictionary)values;
- (id)getItem:(id)a3;
- (unint64_t)length;
- (void)clear;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3 :(id)a4;
- (void)setValues:(id)a3;
@end

@implementation JSASessionStorage

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A6F0;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE2F0 != -1) {
    dispatch_once(&qword_CE2F0, block);
  }
  v2 = (void *)qword_CE2F8;

  return v2;
}

- (JSASessionStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)JSASessionStorage;
  v2 = [(JSASessionStorage *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    values = v2->_values;
    v2->_values = v3;
  }
  return v2;
}

- (unint64_t)length
{
  return (unint64_t)[(NSMutableDictionary *)self->_values count];
}

- (id)getItem:(id)a3
{
  return [(NSMutableDictionary *)self->_values objectForKeyedSubscript:a3];
}

- (void)setItem:(id)a3 :(id)a4
{
}

- (void)removeItem:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_values, "removeObjectForKey:");
  }
}

- (void)clear
{
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end