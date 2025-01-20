@interface RPNWActivityEventMetrics
- (NSString)destination;
- (id)_metricsDictionary;
- (unint64_t)eventSize;
- (void)setDestination:(id)a3;
- (void)setEventSize:(unint64_t)a3;
@end

@implementation RPNWActivityEventMetrics

- (void)setDestination:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100071B38;
  v4[3] = &unk_1001219D0;
  v5 = (os_unfair_lock_s *)self;
  id v6 = a3;
  id v3 = v6;
  sub_100071A30(v5, v4);
}

- (NSString)destination
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100071C4C;
  v9 = sub_100071C5C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100071C64;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setEventSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100071CEC;
  v3[3] = &unk_100122AE0;
  v3[4] = self;
  v3[5] = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (unint64_t)eventSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100071DBC;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(RPNWActivityEventMetrics *)self destination];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"destination"];
  }
  uint64_t v5 = +[NSNumber numberWithUnsignedLong:[(RPNWActivityEventMetrics *)self eventSize]];
  [v3 setObject:v5 forKeyedSubscript:@"bytesOut"];

  return v3;
}

- (void).cxx_destruct
{
}

@end