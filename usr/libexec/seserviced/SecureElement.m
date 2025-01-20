@interface SecureElement
+ (void)setQueueKey:(id)a3;
- (BOOL)getStatusModulesWithFilterAID:(id)a3 tags:(id)a4 error:(id *)a5 closure:(id)a6;
- (id)transceive:(id)a3 error:(id *)a4;
- (void)log:(id)a3;
- (void)sync:(id)a3;
@end

@implementation SecureElement

- (id)transceive:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100055FAC;
  v23 = sub_100055FBC;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100055FAC;
  v17 = sub_100055FBC;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055FC4;
  v8[3] = &unk_10040DA60;
  v11 = &v19;
  v9 = self;
  id v5 = a3;
  id v10 = v5;
  v12 = &v13;
  [(SecureElement *)v9 sync:v8];
  if (a4) {
    *a4 = (id) v14[5];
  }
  id v6 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (void)log:(id)a3
{
  id v3 = a3;
  v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SLAM] %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_transceiver, 0);
  objc_storeStrong((id *)&self->_currentSelectedAIDRapdu, 0);

  objc_storeStrong((id *)&self->_currentSelectedAID, 0);
}

- (BOOL)getStatusModulesWithFilterAID:(id)a3 tags:(id)a4 error:(id *)a5 closure:(id)a6
{
  v9 = _Block_copy(a6);
  id v10 = a4;
  v11 = self;
  if (a3)
  {
    id v12 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
  }
  else
  {
    unint64_t v14 = 0xF000000000000000;
  }
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  __chkstk_darwin(v16, v17);
  v19[2] = v9;
  sub_10007BC00((uint64_t)a3, v14, v15, (void (*)(uint64_t, unint64_t))sub_10007BFA4, (unint64_t)v19);

  _Block_release(v9);
  swift_bridgeObjectRelease();
  sub_100075868((uint64_t)a3, v14);
  return 1;
}

+ (void)setQueueKey:(id)a3
{
  uint64_t v3 = qword_100453918;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  OS_dispatch_queue.setSpecific<A>(key:value:)();
}

- (void)sync:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  int v5 = self;
  sub_1002B6A18((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end