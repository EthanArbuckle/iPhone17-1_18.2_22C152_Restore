@interface RPNWActivityMessageMetrics
+ (id)startMessageMetrics:(int)a3 withParent:(id)a4;
- (NSString)peerDeviceModel;
- (NSString)peerOSVersion;
- (id)_metricsDictionary;
- (int)linkType;
- (int)messageType;
- (unint64_t)messageSize;
- (void)setLinkType:(int)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setMessageType:(int)a3;
- (void)setPeerDeviceModel:(id)a3;
- (void)setPeerOSVersion:(id *)a3;
@end

@implementation RPNWActivityMessageMetrics

+ (id)startMessageMetrics:(int)a3 withParent:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)nw_activity_create();
  id v8 = [objc_alloc((Class)a1) _initWithNWActivity:v7];
  [v8 setMessageType:v4];
  if (v6)
  {
    v9 = [v6 nwActivity];
    nw_activity_set_parent_activity();
  }
  nw_activity_activate();

  return v8;
}

- (void)setMessageType:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000726D0;
  v3[3] = &unk_1001218E0;
  v3[4] = self;
  int v4 = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (int)messageType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000727A4;
  v4[3] = &unk_1001233D8;
  v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setMessageSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10007282C;
  v3[3] = &unk_100122AE0;
  v3[4] = self;
  void v3[5] = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (unint64_t)messageSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000728FC;
  v4[3] = &unk_1001233D8;
  v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setLinkType:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100072988;
  v3[3] = &unk_1001218E0;
  v3[4] = self;
  int v4 = a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (int)linkType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072A5C;
  v4[3] = &unk_1001233D8;
  v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setPeerDeviceModel:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072B0C;
  v4[3] = &unk_1001219D0;
  uint64_t v5 = (os_unfair_lock_s *)self;
  id v6 = a3;
  id v3 = v6;
  sub_100071A30(v5, v4);
}

- (NSString)peerDeviceModel
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = sub_100071C4C;
  v9 = sub_100071C5C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072C20;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setPeerOSVersion:(id *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100072CB8;
  v3[3] = &unk_100123400;
  v3[4] = self;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v4 = *a3;
  sub_100071A30((os_unfair_lock_s *)self, v3);
}

- (NSString)peerOSVersion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = sub_100071C4C;
  v9 = sub_100071C5C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072E14;
  v4[3] = &unk_1001233D8;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100071A30((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(RPNWActivityMessageMetrics *)self messageType];
  if (v4 > 3) {
    uint64_t v5 = "?";
  }
  else {
    uint64_t v5 = off_100123420[v4];
  }
  id v6 = +[NSString stringWithUTF8String:v5];
  [v3 setObject:v6 forKeyedSubscript:@"messageType"];

  uint64_t v7 = +[NSNumber numberWithUnsignedLong:[(RPNWActivityMessageMetrics *)self messageSize]];
  [v3 setObject:v7 forKeyedSubscript:@"bytesOut"];

  unsigned int v8 = [(RPNWActivityMessageMetrics *)self linkType];
  if (v8 > 0xB) {
    v9 = "?";
  }
  else {
    v9 = off_100123440[v8];
  }
  id v10 = +[NSString stringWithUTF8String:v9];
  [v3 setObject:v10 forKeyedSubscript:@"linkType"];

  v11 = [(RPNWActivityMessageMetrics *)self peerDeviceModel];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"peerModel"];
  }
  v12 = [(RPNWActivityMessageMetrics *)self peerOSVersion];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"peerOSVersion"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerOSVersion, 0);

  objc_storeStrong((id *)&self->_peerDeviceModel, 0);
}

@end