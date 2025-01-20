@interface NTPBAudioPlaylistItem(CK)
+ (id)articleIDFromIdentifier:()CK;
+ (uint64_t)identifierFromArticleID:()CK;
- (id)asCKRecord;
- (id)initWithCKRecord:()CK;
@end

@implementation NTPBAudioPlaylistItem(CK)

+ (uint64_t)identifierFromArticleID:()CK
{
  return [NSString stringWithFormat:@"%@%@", @"apl-", a3];
}

+ (id)articleIDFromIdentifier:()CK
{
  id v3 = a3;
  v4 = [v3 substringFromIndex:objc_msgSend(@"apl-", "length")];

  return v4;
}

- (id)initWithCKRecord:()CK
{
  id v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_1EF94D5A0;
  id v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    v6 = [v4 recordID];
    v7 = [v6 recordName];
    [v5 setIdentifier:v7];

    v8 = [v4 objectForKeyedSubscript:@"articleID"];
    [v5 setArticleID:v8];

    v9 = [v4 objectForKeyedSubscript:@"dateAdded"];
    v10 = [v9 pbDate];
    [v5 setDateAdded:v10];

    v11 = [v4 objectForKeyedSubscript:@"order"];
    objc_msgSend(v5, "setListOrder:", objc_msgSend(v11, "longLongValue"));
  }
  return v5;
}

- (id)asCKRecord
{
  if (qword_1EB5D1860 != -1) {
    dispatch_once(&qword_1EB5D1860, &__block_literal_global_121);
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v3 = [a1 identifier];
  id v4 = (void *)[v2 initWithRecordName:v3 zoneID:_MergedGlobals_194];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"AudioPlaylistItem" recordID:v4];
  v6 = [a1 articleID];
  [v5 setObject:v6 forKeyedSubscript:@"articleID"];

  v7 = (void *)MEMORY[0x1E4F1C9C8];
  v8 = [a1 dateAdded];
  v9 = [v7 dateWithPBDate:v8];
  [v5 setObject:v9 forKeyedSubscript:@"dateAdded"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "listOrder"));
  [v5 setObject:v10 forKeyedSubscript:@"order"];

  return v5;
}

@end