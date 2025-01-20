@interface PLEventForwardDisplayEntry
+ (id)entryKey;
+ (void)load;
- (id)initEntryWithRawData:(id)a3;
@end

@implementation PLEventForwardDisplayEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventForwardDisplayEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Display"];
}

- (id)initEntryWithRawData:(id)a3
{
  id v4 = a3;
  v5 = +[PLEventForwardDisplayEntry entryKey];
  v16.receiver = self;
  v16.super_class = (Class)PLEventForwardDisplayEntry;
  v6 = [(PLEntry *)&v16 initWithEntryKey:v5 withRawData:v4];

  if (v6 && !+[PLDisplayAgent shouldLogFromDCP])
  {
    v7 = [v4 objectForKey:@"brightness"];
    v8 = [v7 objectForKey:@"value"];
    uint64_t v9 = [v8 longValue];

    v10 = [v7 objectForKey:@"min"];
    uint64_t v11 = [v10 longValue];

    v12 = [v7 objectForKey:@"max"];
    uint64_t v13 = [v12 longValue];

    v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)(v9 - v11) * 100.0 / (double)(v13 - v11)];
    [(PLEntry *)v6 setObject:v14 forKeyedSubscript:@"Brightness"];
  }
  return v6;
}

@end