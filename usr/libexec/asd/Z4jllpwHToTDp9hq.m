@interface Z4jllpwHToTDp9hq
- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 nN3snF4sAp0Cxy6t:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 tNXuX79TcZPxzyjn:(id)a6;
@end

@implementation Z4jllpwHToTDp9hq

- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 nN3snF4sAp0Cxy6t:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 tNXuX79TcZPxzyjn:(id)a6
{
  id v27 = a3;
  v8 = (void (**)(id, kjAS9HuCdR1m5txL *))a6;
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5->var3];
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5->var3];
  if (a5->var3)
  {
    unint64_t v11 = 0;
    do
    {
      [v9 setObject:&stru_100686790 atIndexedSubscript:v11];
      [v10 setObject:&off_100688268 atIndexedSubscript:v11++];
      unint64_t var3 = a5->var3;
    }
    while (v11 < var3);
    if (var3)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        v15 = (char *)a5->var2 + v13;
        uint64_t v16 = *((int *)v15 + 1);
        v17 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*((void *)v15 + 2) gsx0MJUoOpcxcozG:*((unsigned int *)v15 + 2)];
        [v9 setObject:v17 atIndexedSubscript:v16];

        v18 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)a5->var2 + v13)];
        [v10 setObject:v18 atIndexedSubscript:v16];

        ++v14;
        v13 += 24;
      }
      while (v14 < a5->var3);
    }
  }
  v19 = objc_opt_new();
  id v28 = 0;
  v20 = [v19 runWithQuery:v27 inputColNames:v9 inputColTypes:v10 error:&v28];
  id v21 = v28;
  v22 = v21;
  if (v21)
  {
    id v23 = [v21 code];

    v24 = 0;
  }
  else
  {
    id v23 = 0;
    v24 = v20;
  }
  v25 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v24 qfSDGTGvqd3Hruzg:v23];
  v8[2](v8, v25);

  return (int64_t)v23;
}

@end