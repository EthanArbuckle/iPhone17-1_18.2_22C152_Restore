@interface _NSAttributedStringAgent
- (void)readFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 extensionTokens:(id)a6 withReply:(id)a7;
- (void)renderHTML:(id)a3 options:(id)a4 extensionTokens:(id)a5 withReply:(id)a6;
- (void)startWithReply:(id)a3;
@end

@implementation _NSAttributedStringAgent

- (void)startWithReply:(id)a3
{
}

- (void)renderHTML:(id)a3 options:(id)a4 extensionTokens:(id)a5 withReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!sub_10000242C()) {
    +[NSException raise:NSInternalInconsistencyException format:@"Failed to load WebKit."];
  }
  v13 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * (void)v18) bytes];
        v19 = +[NSNumber numberWithLongLong:sandbox_extension_consume()];
        [v13 addObject:v19];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v16);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100002510;
  v34[3] = &unk_100004228;
  id v20 = v13;
  id v35 = v20;
  id v21 = v12;
  id v36 = v21;
  v22 = objc_retainBlock(v34);
  v23 = [v10 objectForKeyedSubscript:@"DocumentType"];
  unsigned int v24 = [v23 isEqualToString:@"NSWebArchive"];

  if (v24)
  {
    id v25 = [v10 objectForKeyedSubscript:@"BaseURL"];
    if (!v25) {
      id v25 = objc_alloc_init((Class)NSURL);
    }
    uint64_t v26 = [v10 objectForKey:@"TextEncodingName"];
    if (v26) {
      v27 = (__CFString *)v26;
    }
    else {
      v27 = &stru_1000043A8;
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000265C;
    v30[3] = &unk_100004250;
    id v31 = v9;
    v32 = v27;
    id v33 = v25;
    id v28 = v25;
    v29 = v27;
    +[NSAttributedString _loadFromHTMLWithOptions:v10 contentLoader:v30 completionHandler:v22];
  }
  else
  {
    +[NSAttributedString loadFromHTMLWithData:v9 options:v10 completionHandler:v22];
  }
}

- (void)readFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 extensionTokens:(id)a6 withReply:(id)a7
{
  id v28 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!sub_10000242C()) {
    +[NSException raise:NSInternalInconsistencyException format:@"Failed to load WebKit."];
  }
  id v15 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) bytes];
        id v20 = +[NSNumber numberWithLongLong:sandbox_extension_consume()];
        [v15 addObject:v20];
      }
      id v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100002994;
  v29[3] = &unk_100004278;
  id v21 = v15;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  id v23 = v11;
  id v24 = v28;
  id v25 = v12;
  uint64_t v26 = v29;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v27 = (void (*)(id, id, id, void *))off_100008880;
  long long v40 = off_100008880;
  if (!off_100008880)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100002C98;
    v36[3] = &unk_1000041C8;
    v36[4] = &v37;
    sub_100002C98((uint64_t)v36);
    v27 = (void (*)(id, id, id, void *))v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v27) {
    sub_100002E4C();
  }
  v27(v23, v24, v25, v26);
}

@end