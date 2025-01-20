@interface GKBulletinMonogramRenderer
+ (void)monogramImageForPlayerID:(id)a3 withCompletion:(id)a4;
@end

@implementation GKBulletinMonogramRenderer

+ (void)monogramImageForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = [a3 componentsSeparatedByString:@":"];
  if ([v6 count] == (id)2)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100160088;
    v9[3] = &unk_1002DC988;
    int64x2_t v13 = vdupq_n_s64(0x4060000000000000uLL);
    uint64_t v14 = 0x4008000000000000;
    id v10 = v6;
    id v11 = v7;
    id v12 = v5;
    id v8 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

@end