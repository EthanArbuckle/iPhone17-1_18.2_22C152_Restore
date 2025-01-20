@interface MTDateParser
+ (id)dateFormatters;
- (id)dateFromRSSDateString:(id)a3;
@end

@implementation MTDateParser

- (id)dateFromRSSDateString:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = +[MTDateParser dateFormatters];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(id *)(*((void *)&v11 + 1) + 8 * v7);
      objc_sync_enter(v8);
      v9 = [v8 dateFromString:v3];
      objc_sync_exit(v8);

      if (v9) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

+ (id)dateFormatters
{
  if (qword_10060A820 != -1) {
    dispatch_once(&qword_10060A820, &stru_1005513A0);
  }
  v2 = (void *)qword_10060A818;

  return v2;
}

@end