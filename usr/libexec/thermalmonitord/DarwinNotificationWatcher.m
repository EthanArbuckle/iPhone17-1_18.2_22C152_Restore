@interface DarwinNotificationWatcher
+ (id)monitorNotificationKey:(id)a3 forReason:(id)a4 queue:(id)a5 handler:(id)a6;
@end

@implementation DarwinNotificationWatcher

+ (id)monitorNotificationKey:(id)a3 forReason:(id)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v15 = 0;
  v16 = (int *)&v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v10 = (char *)[a3 UTF8String];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DB20;
  v14[3] = &unk_100084FF8;
  v14[4] = a6;
  sub_1000395F0(v10, v16 + 6, a5, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DB74;
  v13[3] = &unk_100085020;
  v13[4] = &v15;
  v11 = [[TMSimpleAssertion alloc] initWithIdentifier:+[NSString stringWithFormat:@"DarwinNotification (%@)", a3] forReason:a4 invalidationBlock:v13];
  _Block_object_dispose(&v15, 8);
  return v11;
}

@end