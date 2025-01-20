@interface WBEscher
+ (id)readRootWithType:(int *)a3 reader:(id)a4;
+ (void)readRootContainer:(id *)a3 type:(int *)a4 reader:(id)a5;
@end

@implementation WBEscher

+ (void)readRootContainer:(id *)a3 type:(int *)a4 reader:(id)a5
{
  id v8 = a5;
  *a4 = 0;
  id v12 = v8;
  v9 = objc_msgSend(a1, "readRootWithType:reader:", a4);
  v10 = v9;
  if (v9 && [v9 childCount])
  {
    [v10 childCount];
    v11 = [v10 childAt:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *a3 = v11;
    }
  }
}

+ (id)readRootWithType:(int *)a3 reader:(id)a4
{
  id v5 = a4;
  int v13 = *a3;
  uint64_t v6 = [v5 wrdReader];
  (*(void (**)(uint64_t, int *))(*(void *)v6 + 440))(v6, &v13);
  int v7 = v13;
  *a3 = v13;
  if (v7)
  {
    id v8 = [ESDRoot alloc];
    uint64_t v9 = [v5 wrdReader];
    if (v9) {
      uint64_t v10 = v9 + 8;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = [(ESDRoot *)v8 initFromReader:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end