@interface _UIViewCALayerKeyValueMapper
+ (id)CALayerKeyPathForUIViewKeyPath:(id)a3;
+ (id)CALayerValueForUIViewValue:(id)a3 forUIViewKey:(id)a4;
@end

@implementation _UIViewCALayerKeyValueMapper

+ (id)CALayerValueForUIViewValue:(id)a3 forUIViewKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB265020 != -1) {
    dispatch_once(&qword_1EB265020, &__block_literal_global_35_4);
  }
  uint64_t v7 = [(id)qword_1EB265018 objectForKeyedSubscript:v6];
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  v10 = v9;

  return v10;
}

+ (id)CALayerKeyPathForUIViewKeyPath:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_15;
  }
  if (qword_1EB265010 != -1) {
    dispatch_once(&qword_1EB265010, &__block_literal_global_658);
  }
  v4 = [(id)_MergedGlobals_1324 objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v5 = [v3 componentsSeparatedByString:@"."];
    id v6 = (void *)qword_1EB265008;
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    v8 = [v6 objectForKeyedSubscript:v7];

    id v9 = v3;
    v10 = v9;
    if (v8)
    {
      if ([v5 count] != 1)
      {
        v12 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
        v13 = NSString;
        v14 = [v12 componentsJoinedByString:@"."];
        v4 = [v13 stringWithFormat:@"%@.%@", v8, v14];

        goto LABEL_13;
      }
      id v11 = v8;
    }
    else
    {
      v4 = v9;
      if (![v9 hasPrefix:@"layer."])
      {
LABEL_14:
        [(id)_MergedGlobals_1324 setObject:v4 forKeyedSubscript:v10];

        goto LABEL_15;
      }
      id v11 = [v10 substringFromIndex:6];
    }
    v4 = v11;
    v12 = v10;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

@end