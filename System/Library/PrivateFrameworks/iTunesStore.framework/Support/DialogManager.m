@interface DialogManager
+ (BOOL)checkInDialog:(id)a3;
+ (void)checkOutDialog:(id)a3;
@end

@implementation DialogManager

+ (BOOL)checkInDialog:(id)a3
{
  pthread_mutex_lock(&stru_1004007C8);
  id v4 = (id)qword_100401C18;
  if (!qword_100401C18)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    qword_100401C18 = (uint64_t)v4;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isEqual:a3])
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  [(id)qword_100401C18 addObject:a3];
  BOOL v9 = 1;
LABEL_13:
  pthread_mutex_unlock(&stru_1004007C8);
  return v9;
}

+ (void)checkOutDialog:(id)a3
{
  pthread_mutex_lock(&stru_1004007C8);
  [(id)qword_100401C18 removeObject:a3];

  pthread_mutex_unlock(&stru_1004007C8);
}

@end