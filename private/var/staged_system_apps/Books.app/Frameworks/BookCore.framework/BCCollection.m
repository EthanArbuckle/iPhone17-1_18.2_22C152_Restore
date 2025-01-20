@interface BCCollection
+ (id)identifierForMyBooksCollection;
+ (id)sortKeyForDefaultCollectionID:(id)a3;
+ (id)titleForDefaultCollectionID:(id)a3;
+ (id)uniqueTitleForMyBooksCollection:(id)a3;
@end

@implementation BCCollection

+ (id)titleForDefaultCollectionID:(id)a3
{
  uint64_t v3 = qword_345698;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_345698, &stru_2C5EE0);
  }
  v5 = [(id)qword_345690 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)identifierForMyBooksCollection
{
  v2 = +[BUAccountsProvider sharedProvider];
  uint64_t v3 = [v2 activeStoreAccount];
  id v4 = [v3 username];

  v5 = [v4 dataUsingEncoding:4];
  v6 = [v5 bu_sha1];

  if (v6)
  {
    v7 = [@"My_Books_Collection_" stringByAppendingString:v6];
  }
  else
  {
    v7 = @"My_Books_Collection_";
  }

  return v7;
}

+ (id)uniqueTitleForMyBooksCollection:(id)a3
{
  id v3 = a3;
  id v4 = IMCommonCoreBundle();
  v5 = [v4 localizedStringForKey:@"My Books" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  v6 = IMCommonCoreBundle();
  v7 = [v6 localizedStringForKey:@"My Books %lu" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  if ([v3 count] == (id)-1)
  {
LABEL_8:
    v10 = v5;
  }
  else
  {
    uint64_t v8 = 0;
    while (1)
    {
      if (v8)
      {
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = v5;
      }
      v10 = v9;
      if ((objc_msgSend(v3, "bu_containsLocalizedStringCaseInsensitive:", v9) & 1) == 0) {
        break;
      }

      if (++v8 >= (unint64_t)[v3 count] + 1) {
        goto LABEL_8;
      }
    }
  }

  return v10;
}

+ (id)sortKeyForDefaultCollectionID:(id)a3
{
  uint64_t v3 = qword_3456A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_3456A8, &stru_2C5F00);
  }
  v5 = [(id)qword_3456A0 objectForKeyedSubscript:v4];

  return v5;
}

@end