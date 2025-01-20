@interface RPNWActivityRequestMetrics
- (NSString)destination;
- (id)_metricsDictionary;
- (unint64_t)replyTime;
- (unint64_t)requestSize;
- (unint64_t)responseSize;
- (void)setDestination:(id)a3;
- (void)setReplyTime:(unint64_t)a3;
- (void)setRequestSize:(unint64_t)a3;
- (void)setResponseSize:(unint64_t)a3;
@end

@implementation RPNWActivityRequestMetrics

- (void)setDestination:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100071F34;
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
  v4[2] = sub_100072048;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setRequestSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000720D0;
  v3[3] = &unk_100122AE0;
  v3[4] = self;
  v3[5] = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (unint64_t)requestSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000721A0;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setResponseSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100072228;
  v3[3] = &unk_100122AE0;
  v3[4] = self;
  v3[5] = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (unint64_t)responseSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000722F8;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setReplyTime:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100072380;
  v3[3] = &unk_100122AE0;
  v3[4] = self;
  v3[5] = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (unint64_t)replyTime
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072450;
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
  v4 = [(RPNWActivityRequestMetrics *)self destination];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"destination"];
  }
  uint64_t v5 = +[NSNumber numberWithUnsignedLong:[(RPNWActivityRequestMetrics *)self requestSize]];
  [v3 setObject:v5 forKeyedSubscript:@"bytesOut"];

  id v6 = +[NSNumber numberWithUnsignedLong:[(RPNWActivityRequestMetrics *)self responseSize]];
  [v3 setObject:v6 forKeyedSubscript:@"bytesIn"];

  if ([(RPNWActivityRequestMetrics *)self replyTime])
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:[(RPNWActivityRequestMetrics *)self replyTime]];
    [v3 setObject:v7 forKeyedSubscript:@"replyTime"];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end