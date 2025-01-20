@interface MOLabelBasedContextBuilder
- (id)generateContextStringFromBundleContent:(id)a3;
- (id)generateContextStringsFromBundleContents:(id)a3;
@end

@implementation MOLabelBasedContextBuilder

- (id)generateContextStringsFromBundleContents:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "bundleType", (void)v16) == (id)2)
        {
          v12 = [(MOLabelBasedContextBuilder *)self generateContextStringFromBundleContent:v11];
          if (v12)
          {
            v13 = +[NSArray arrayWithObject:v12];
            v14 = [v11 bundleContentIdentifier];
            [v5 setObject:v13 forKey:v14];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)generateContextStringFromBundleContent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 suggestionLabel];

  if (v4)
  {
    v5 = [MOContextString alloc];
    id v6 = +[NSUUID UUID];
    id v7 = [v3 suggestionLabel];
    id v8 = [v7 copy];
    id v4 = [(MOContextString *)v5 initWithIdentifier:v6 string:v8];

    [(MOContextString *)v4 setSource:1];
    [(MOContextString *)v4 setAccuracy:1.0];
    [(MOContextString *)v4 setSatisfaction:1.0];
    if ([v3 hasPersonName]) {
      [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 1];
    }
    if ([v3 peopleClassification])
    {
      [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 2];
      if ([v3 peopleClassification] == (id)1) {
        [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x200];
      }
      if ([v3 peopleClassification] == (id)2) {
        [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x400];
      }
      if ([v3 peopleClassification] == (id)3) {
        [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x800];
      }
      if ([v3 peopleClassification] == (id)4) {
        [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x1000];
      }
      if ([v3 peopleClassification] == (id)5) {
        [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x2000];
      }
    }
    if ([v3 hasPlaceName]) {
      [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 4];
    }
    if ([v3 hasCityName]) {
      [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 8];
    }
    if ([v3 photoTrait]) {
      [(MOContextString *)v4 setContentType:[(MOContextString *)v4 contentType] | 0x100];
    }
  }

  return v4;
}

@end