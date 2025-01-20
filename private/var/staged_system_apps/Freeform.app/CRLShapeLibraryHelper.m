@interface CRLShapeLibraryHelper
+ (BOOL)shouldAddBaseShapeNameAndKeywordsForLocale:(id)a3;
+ (id)keywordByCapitalizingLowercasedKeyword:(id)a3 locale:(id)a4;
+ (id)keywordsByCapitalizingLowercasedKeywords:(id)a3 locale:(id)a4;
@end

@implementation CRLShapeLibraryHelper

+ (id)keywordsByCapitalizingLowercasedKeywords:(id)a3 locale:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BC214;
  v9[3] = &unk_1014D2C00;
  id v10 = a4;
  id v11 = a1;
  id v6 = v10;
  v7 = [a3 crl_arrayByMappingObjectsUsingBlock:v9];

  return v7;
}

+ (id)keywordByCapitalizingLowercasedKeyword:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1016A8FE8 != -1) {
    dispatch_once(&qword_1016A8FE8, &stru_1014D2C20);
  }
  v7 = [v6 locale];
  v8 = [v5 lowercaseStringWithLocale:v7];
  unsigned int v9 = [v8 isEqualToString:v5];

  if (v9)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_1000BC470;
    v23 = sub_1000BC480;
    id v24 = [(id)qword_1016A8FF0 objectForKey:v5];
    id v10 = (void *)v20[5];
    if (!v10)
    {
      id v11 = [v5 length];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000BC488;
      v15[3] = &unk_1014D2C48;
      v18 = &v19;
      id v12 = v5;
      id v16 = v12;
      id v17 = v6;
      [v12 enumerateSubstringsInRange:0 options:3 usingBlock:v15];
      [(id)qword_1016A8FF0 setObject:v20[5] forKey:v12];

      id v10 = (void *)v20[5];
    }
    id v13 = v10;

    _Block_object_dispose(&v19, 8);
    id v5 = v13;
  }

  return v5;
}

+ (BOOL)shouldAddBaseShapeNameAndKeywordsForLocale:(id)a3
{
  v3 = [a3 locale];
  v4 = [v3 localeIdentifier];

  if ([v4 hasPrefix:@"en"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BC60C;
    v7[3] = &unk_1014D2C70;
    id v8 = v4;
    unsigned __int8 v5 = [&off_10155C1A0 crl_containsObjectPassingTest:v7];
  }
  return v5;
}

@end