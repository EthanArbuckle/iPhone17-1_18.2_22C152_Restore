@interface ocfHk3pjIqg7tBvb
+ (id)sharedInstance;
- (int64_t)dOcbonNWKg7PJwsF:(int64_t)a3 QlGRpofDrDPpBRod:(int64_t)a4 mfJ8r89KwA6nfqNY:(sqlite3 *)a5;
- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 gqhuZKS8Xs6ugnFL:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 x1IqrF8Flbgd3Jhk:(id)a6;
- (unsigned)hi5ump20ke7n4x6o:(id)a3 hikv315wqxcu0dpl:(id)a4;
@end

@implementation ocfHk3pjIqg7tBvb

- (int64_t)dOcbonNWKg7PJwsF:(int64_t)a3 QlGRpofDrDPpBRod:(int64_t)a4 mfJ8r89KwA6nfqNY:(sqlite3 *)a5
{
  int64_t result = a3;
  if (a3 > 22)
  {
    switch(a3)
    {
      case 513:
        return 13714;
      case 257:
        return 13713;
      case 23:
        return 13702;
      default:
LABEL_16:
        int64_t v6 = 13799;
        if (a4 == 1) {
          int64_t v6 = 13710;
        }
        if (a4) {
          return v6;
        }
        else {
          return 13700;
        }
    }
  }
  else
  {
    switch(a3)
    {
      case 7:
        int64_t result = 13715;
        break;
      case 8:
      case 9:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
        goto LABEL_16;
      case 10:
        int64_t result = 13716;
        break;
      case 13:
        int64_t result = 13717;
        break;
      case 17:
        int64_t result = 13711;
        break;
      case 18:
        int64_t result = 13712;
        break;
      default:
        if (a3) {
          goto LABEL_16;
        }
        break;
    }
  }
  return result;
}

- (unsigned)hi5ump20ke7n4x6o:(id)a3 hikv315wqxcu0dpl:(id)a4
{
  id v5 = a4;
  if (![a3 isEqualToString:@"/var/mobile/Library/Accounts/Accounts3.sqlite"]) {
    goto LABEL_4;
  }
  int64_t v6 = +[NSString stringWithFormat:@"%@\\s*%@\\s*%@", @"zusername", @"(IS|IS NOT|LIKE|GLOB|=|<|>)", @"[A-Z0-9a-z\\._%+-]+"];
  uint64_t v11 = 0;
  v7 = +[NSRegularExpression regularExpressionWithPattern:v6 options:1 error:&v11];
  id v8 = [v7 numberOfMatchesInString:v5 options:8 range:[v5 length]];

  if (v8) {
    unsigned __int8 v9 = 0;
  }
  else {
LABEL_4:
  }
    unsigned __int8 v9 = 1;

  return v9;
}

+ (id)sharedInstance
{
  if (qword_1006A5DC0 != -1) {
    dispatch_once(&qword_1006A5DC0, &stru_10065F230);
  }
  v2 = (void *)qword_1006A5DB8;

  return v2;
}

- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 gqhuZKS8Xs6ugnFL:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 x1IqrF8Flbgd3Jhk:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, kjAS9HuCdR1m5txL *))a6;
  ppStmt = 0;
  ppDb = 0;
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5->var3];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  if ([(ocfHk3pjIqg7tBvb *)self hi5ump20ke7n4x6o:v11 hikv315wqxcu0dpl:v10])
  {
    v37 = self;
    v38 = v14;
    if (a5->var3)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      do
      {
        v17 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*(void *)((char *)a5->var2 + v15 + 16) gsx0MJUoOpcxcozG:*(unsigned int *)((char *)a5->var2 + v15 + 8)];
        [v13 setObject:v17 atIndexedSubscript:v16];

        ++v16;
        v15 += 24;
      }
      while (v16 < a5->var3);
    }
    int v18 = sqlite3_open_v2((const char *)[v11 UTF8String], &ppDb, 1, 0);
    if (v18)
    {
      int64_t v19 = [(ocfHk3pjIqg7tBvb *)v37 dOcbonNWKg7PJwsF:v18 QlGRpofDrDPpBRod:0 mfJ8r89KwA6nfqNY:ppDb];
LABEL_36:
      id v14 = v38;
      v34 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v38 qfSDGTGvqd3Hruzg:v19];
      v12[2](v12, v34);

      sqlite3_finalize(ppStmt);
      sqlite3_close(ppDb);
      goto LABEL_37;
    }
    v21 = ppDb;
    id v36 = v10;
    id v22 = v10;
    int v23 = sqlite3_prepare_v2(v21, (const char *)[v22 UTF8String], (int)[v22 lengthOfBytesUsingEncoding:4], &ppStmt, 0);
    if (v23)
    {
      int64_t v19 = [(ocfHk3pjIqg7tBvb *)v37 dOcbonNWKg7PJwsF:v23 QlGRpofDrDPpBRod:1 mfJ8r89KwA6nfqNY:ppDb];
LABEL_35:
      id v10 = v36;
      goto LABEL_36;
    }
    int v24 = sqlite3_step(ppStmt);
    v25 = 0;
    while (v24 == 100)
    {
      id v26 = objc_alloc_init((Class)NSMutableDictionary);

      if (a5->var3)
      {
        uint64_t v27 = 0;
        unint64_t v28 = 0;
        while (2)
        {
          v29 = (_DWORD *)((char *)a5->var2 + v27);
          int v30 = v29[1];
          switch(*v29)
          {
            case 1:
              uint64_t v31 = +[NSNumber numberWithDouble:sqlite3_column_double(ppStmt, v30)];
              goto LABEL_18;
            case 2:
              uint64_t v31 = +[NSNumber numberWithInt:sqlite3_column_int(ppStmt, v30)];
              goto LABEL_18;
            case 3:
              uint64_t v31 = +[NSNumber numberWithLongLong:sqlite3_column_int64(ppStmt, v30)];
LABEL_18:
              v32 = (void *)v31;
              goto LABEL_19;
            case 4:
              v32 = +[NSString stringWithUTF8String:sqlite3_column_text(ppStmt, v30)];
              if (!v32) {
                goto LABEL_20;
              }
LABEL_19:
              v33 = [v13 objectAtIndexedSubscript:v28];
              [v26 setObject:v32 forKey:v33];

LABEL_20:
              ++v28;
              v27 += 24;
              if (v28 >= a5->var3) {
                break;
              }
              continue;
            default:

              int64_t v19 = 138;
              goto LABEL_35;
          }
          break;
        }
      }
      [v38 addObject:v26];
      int v24 = sqlite3_step(ppStmt);
      v25 = v26;
    }
    if (v24 > 20)
    {
      if (v24 == 21) {
        goto LABEL_33;
      }
      if (v24 != 101)
      {
LABEL_34:
        int64_t v19 = [(ocfHk3pjIqg7tBvb *)v37 dOcbonNWKg7PJwsF:v24 QlGRpofDrDPpBRod:2 mfJ8r89KwA6nfqNY:ppDb];

        goto LABEL_35;
      }
    }
    else if (v24)
    {
      if (v24 != 1) {
        goto LABEL_34;
      }
LABEL_33:

      int64_t v19 = -1;
      goto LABEL_35;
    }

    int64_t v19 = 0;
    goto LABEL_35;
  }
  int64_t v19 = 152;
  v20 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:152];
  v12[2](v12, v20);

LABEL_37:
  return v19;
}

@end