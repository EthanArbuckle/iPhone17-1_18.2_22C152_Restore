@interface SignpostSupportMetadataSegment(LoggingSupport)
+ (id)placeholderArrayWithOSLogEventProxy:()LoggingSupport;
@end

@implementation SignpostSupportMetadataSegment(LoggingSupport)

+ (id)placeholderArrayWithOSLogEventProxy:()LoggingSupport
{
  id v3 = a3;
  id v4 = [v3 decomposedMessage];
  if (v4)
  {
    v5 = [v3 decomposedMessage];
    uint64_t v6 = [v5 state];

    if (v6)
    {
      id v4 = 0;
    }
    else
    {
      v35 = [MEMORY[0x263EFF980] array];
      id v33 = v3;
      v7 = [v3 decomposedMessage];
      if ([v7 placeholderCount])
      {
        uint64_t v8 = 0;
        unsigned int v9 = 1;
        v34 = v7;
        while (1)
        {
          v10 = [v7 literalPrefixAtIndex:v8];
          v11 = (void *)[v10 copy];

          v12 = [v7 placeholderAtIndex:v8];
          v13 = [v12 typeNamespace];
          v14 = (void *)[v13 copy];

          v15 = [v12 type];
          v16 = (void *)[v15 copy];

          v17 = [v12 tokens];

          if (v17)
          {
            id v18 = objc_alloc(MEMORY[0x263EFF8C0]);
            v19 = [v12 tokens];
            v20 = (void *)[v18 initWithArray:v19 copyItems:1];
          }
          else
          {
            v20 = 0;
          }
          v21 = [v7 argumentAtIndex:v8];
          v22 = v21;
          if (v21)
          {
            v23 = [v21 objectRepresentation];
            v24 = (void *)[v23 copy];

            v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "privacy"));
          }
          else
          {
            v24 = 0;
            v25 = 0;
          }
          uint64_t v26 = [objc_alloc(MEMORY[0x263F6C5A0]) initWithArgumentObject:v24 typeNamespace:v14 type:v16 tokens:v20 stringPrefix:v11 privacy:v25];
          if (!v26) {
            break;
          }
          v27 = (void *)v26;
          [v35 addObject:v26];

          uint64_t v8 = v9;
          v7 = v34;
          if ([v34 placeholderCount] <= (unint64_t)v9++) {
            goto LABEL_14;
          }
        }

        id v4 = 0;
        id v3 = v33;
        v7 = v34;
        v30 = v35;
      }
      else
      {
LABEL_14:
        v29 = objc_msgSend(v7, "literalPrefixAtIndex:", objc_msgSend(v7, "placeholderCount"));
        v24 = (void *)[v29 copy];

        v30 = v35;
        if (v24)
        {
          v31 = (void *)[objc_alloc(MEMORY[0x263F6C5A0]) initWithArgumentObject:0 typeNamespace:0 type:0 tokens:0 stringPrefix:v24 privacy:0];
          [v35 addObject:v31];
        }
        id v4 = v35;
        id v3 = v33;
      }
    }
  }

  return v4;
}

@end