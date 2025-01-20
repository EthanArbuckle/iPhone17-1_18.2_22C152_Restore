@interface NRDataCollector
+ (id)createSharedInstance;
+ (id)sharedInstance;
- (NSMutableDictionary)data;
- (id)getValueForKey:(id)a3;
- (id)incrementCounterForKey:(id)a3;
- (void)reset;
- (void)setData:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation NRDataCollector

+ (id)createSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A864;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A12A8 != -1) {
    dispatch_once(&qword_1001A12A8, block);
  }
  v2 = (void *)qword_1001A12A0;

  return v2;
}

+ (id)sharedInstance
{
  return (id)qword_1001A12A0;
}

- (id)incrementCounterForKey:(id)a3
{
  data = self->_data;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)data objectForKey:v5];
  if (!v6) {
    id v6 = [objc_alloc((Class)NSNumber) initWithInt:0];
  }
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 intValue] + 1);

  [(NSMutableDictionary *)self->_data setObject:v7 forKey:v5];

  return v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)getValueForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_data objectForKey:a3];
}

- (void)reset
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [(id)qword_1001A12A0 setData:v2];
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end