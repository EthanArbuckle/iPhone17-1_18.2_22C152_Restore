@interface TUIFeedCaptureController
+ (id)feedCaptureInfoWithURL:(id)a3 packagesURL:(id)a4;
- (NSMutableArray)sections;
- (NSString)title;
- (NSURL)url;
- (OS_dispatch_group)completionGroup;
- (TUIFeedCaptureController)initWithEntry:(id)a3 title:(id)a4;
- (TUIFeedCaptureController)initWithTitle:(id)a3;
- (TUIFeedEntry)entry;
- (TUITemplateFactory)factory;
- (id)_feedInfo;
- (id)_makeDir:(id)a3;
- (id)instantiateCaptureForEntry:(id)a3;
- (void)_copyPackages;
- (void)_emitDynamicState;
- (void)_emitImages;
- (void)beginCaptureWithFactory:(id)a3 completion:(id)a4;
- (void)captureSectionWithEntry:(id)a3 bindings:(id)a4 template:(id)a5;
- (void)endCapture;
@end

@implementation TUIFeedCaptureController

- (TUIFeedCaptureController)initWithTitle:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TUIFeedCaptureController;
  v5 = [(TUIFeedCaptureController *)&v31 init];
  if (v5)
  {
    id v30 = v4;
    v6 = (__CFString *)[v4 copy];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = @"Untitled";
    }
    objc_storeStrong((id *)&v5->_title, v8);

    v9 = NSTemporaryDirectory();
    v10 = +[NSURL fileURLWithPath:v9 isDirectory:1];
    v11 = [v10 URLByAppendingPathComponent:v5->_title];
    uint64_t v12 = [v11 URLByAppendingPathExtension:@"feed"];
    url = v5->_url;
    v5->_url = (NSURL *)v12;

    v14 = +[NSFileManager defaultManager];
    v15 = [(NSURL *)v5->_url path];
    LODWORD(v11) = [v14 fileExistsAtPath:v15];

    if (v11)
    {
      uint64_t v16 = 1;
      do
      {
        uint64_t v17 = NSTemporaryDirectory();
        v18 = +[NSURL fileURLWithPath:v17 isDirectory:1];
        v19 = +[NSString stringWithFormat:@"%@-%lu", v5->_title, v16];
        v20 = [v18 URLByAppendingPathComponent:v19];
        uint64_t v21 = [v20 URLByAppendingPathExtension:@"feed"];
        v22 = v5->_url;
        v5->_url = (NSURL *)v21;

        v23 = [(NSURL *)v5->_url path];
        LOBYTE(v17) = [v14 fileExistsAtPath:v23];

        ++v16;
      }
      while ((v17 & 1) != 0);
    }
    v24 = +[NSFileManager defaultManager];
    [v24 createDirectoryAtURL:v5->_url withIntermediateDirectories:1 attributes:0 error:0];

    uint64_t v25 = objc_opt_new();
    sections = v5->_sections;
    v5->_sections = (NSMutableArray *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    completionGroup = v5->_completionGroup;
    v5->_completionGroup = (OS_dispatch_group *)v27;

    id v4 = v30;
  }

  return v5;
}

- (TUIFeedCaptureController)initWithEntry:(id)a3 title:(id)a4
{
  id v7 = a3;
  v8 = [(TUIFeedCaptureController *)self initWithTitle:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_entry, a3);
  }

  return v9;
}

- (id)_makeDir:(id)a3
{
  v3 = [(NSURL *)self->_url URLByAppendingPathComponent:a3];
  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];

  return v3;
}

- (void)beginCaptureWithFactory:(id)a3 completion:(id)a4
{
  objc_storeStrong((id *)&self->_factory, a3);
  id v7 = a3;
  id v8 = a4;
  dispatch_group_enter((dispatch_group_t)self->_completionGroup);
  TUIDispatchGroupNotifyViaRunloopIfMain(self->_completionGroup, &_dispatch_main_q, v8);
}

- (void)endCapture
{
  [(TUIFeedCaptureController *)self _copyPackages];
  [(TUIFeedCaptureController *)self _emitDynamicState];
  [(TUIFeedCaptureController *)self _emitImages];
  id v5 = [(NSURL *)self->_url URLByAppendingPathComponent:@"feed.json"];
  v3 = [(TUIFeedCaptureController *)self _feedInfo];
  id v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:0];
  [v4 writeToURL:v5 atomically:0];

  dispatch_group_leave((dispatch_group_t)self->_completionGroup);
}

- (void)captureSectionWithEntry:(id)a3 bindings:(id)a4 template:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_TUIFeedCaptureSection alloc] initWithEntry:v10 bindings:v9 template:v8];

  [(NSMutableArray *)self->_sections addObject:v11];
}

- (id)instantiateCaptureForEntry:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_sections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 entry:v12];
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_feedInfo
{
  v3 = objc_opt_new();
  sections = self->_sections;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_7716C;
  long long v12 = &unk_253498;
  id v13 = v3;
  id v5 = v3;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:&v9];
  title = self->_title;
  v14[0] = @"title";
  v14[1] = @"sections";
  v15[0] = title;
  v15[1] = v5;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2, v9, v10, v11, v12);

  return v7;
}

- (void)_copyPackages
{
  v3 = +[NSHashTable hashTableWithOptions:512];
  sections = self->_sections;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_773CC;
  v21[3] = &unk_253498;
  id v5 = v3;
  id v22 = v5;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v21];
  id v6 = [(TUIFeedCaptureController *)self _makeDir:@"packages"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v11) url:(void)v17];
        id v13 = [v12 URLByDeletingLastPathComponent];

        long long v14 = [v13 lastPathComponent];
        long long v15 = [v6 URLByAppendingPathComponent:v14];

        uint64_t v16 = +[NSFileManager defaultManager];
        [v16 copyItemAtURL:v13 toURL:v15 error:0];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)_emitDynamicState
{
  v3 = objc_opt_new();
  sections = self->_sections;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_77760;
  v31[3] = &unk_253498;
  id v5 = v3;
  id v32 = v5;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v31];
  if ([v5 count])
  {
    id v22 = [(TUIFeedCaptureController *)self _makeDir:@"dynamic-state"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v5;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v9);
          v11 = objc_opt_new();
          long long v12 = self->_sections;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_77858;
          v25[3] = &unk_253510;
          v25[4] = v10;
          id v26 = v11;
          id v13 = v11;
          [(NSMutableArray *)v12 enumerateObjectsUsingBlock:v25];
          long long v14 = objc_opt_new();
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_779E0;
          v23[3] = &unk_253560;
          id v24 = v14;
          id v15 = v14;
          [v13 enumerateKeysAndObjectsUsingBlock:v23];
          CFStringRef v33 = @"instances";
          id v34 = v15;
          uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          long long v17 = [v22 URLByAppendingPathComponent:v10];
          long long v18 = [v17 URLByAppendingPathExtension:@"json"];

          long long v19 = +[NSJSONSerialization dataWithJSONObject:v16 options:1 error:0];
          [v19 writeToURL:v18 atomically:0];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v7);
    }

    id v5 = v20;
  }
}

- (void)_emitImages
{
  v3 = objc_opt_new();
  sections = self->_sections;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_78380;
  v33[3] = &unk_253498;
  id v5 = v3;
  id v34 = v5;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v33];
  if ([v5 count])
  {
    v23 = [(TUIFeedCaptureController *)self _makeDir:@"images"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = v5;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v9);
          v11 = objc_opt_new();
          long long v12 = self->_sections;
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_78478;
          v27[3] = &unk_253510;
          v27[4] = v10;
          id v28 = v11;
          id v13 = v11;
          [(NSMutableArray *)v12 enumerateObjectsUsingBlock:v27];
          long long v14 = objc_opt_new();
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_78600;
          v24[3] = &unk_253600;
          id v15 = v23;
          id v25 = v15;
          id v26 = v14;
          id v16 = v14;
          [v13 enumerateKeysAndObjectsUsingBlock:v24];
          CFStringRef v35 = @"instances";
          id v36 = v16;
          long long v17 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          long long v18 = [v15 URLByAppendingPathComponent:v10];
          long long v19 = [v18 URLByAppendingPathExtension:@"json"];

          id v20 = +[NSJSONSerialization dataWithJSONObject:v17 options:1 error:0];
          [v20 writeToURL:v19 atomically:0];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v7);
    }

    id v5 = v21;
  }
}

+ (id)feedCaptureInfoWithURL:(id)a3 packagesURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_TUIFeedCaptureInfo alloc] initWithURL:v6 packagesURL:v5];

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (TUITemplateFactory)factory
{
  return self->_factory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end