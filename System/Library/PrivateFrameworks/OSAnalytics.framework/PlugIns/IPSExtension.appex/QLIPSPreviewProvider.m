@interface QLIPSPreviewProvider
- (id)replyWithPlainTextData:(id)a3 forType:(id)a4;
- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation QLIPSPreviewProvider

- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = [a3 fileURL];
  ssize_t v8 = getxattr((const char *)[v7 fileSystemRepresentation], "bug_type", value, 0x3FFuLL, 0, 0);
  value[v8 & ~(v8 >> 63)] = 0;
  v9 = +[NSString stringWithUTF8String:value];
  if (![v9 length])
  {
    id v10 = objc_alloc((Class)OSALog);
    v11 = [v7 path];
    id v12 = [v10 initWithPath:v11 forRouting:&stru_1000041B0 options:&off_100004380 error:0];

    if (v12
      && ([v12 metaData], v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
    {
      [v12 bugType];
      v9 = v14 = v9;
    }
    else
    {
      v15 = +[NSInputStream inputStreamWithURL:v7];
      v14 = v15;
      if (v15)
      {
        [v15 open];
        id v20 = 0;
        v16 = +[NSJSONSerialization JSONObjectWithStream:v14 options:0 error:&v20];
        id v17 = v20;
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v18 = [v16 objectForKeyedSubscript:@"bug_type"];

          v9 = (void *)v18;
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100003460((uint64_t)v17);
        }
        [v14 close];
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000033E0((uint64_t)v7);
      }
    }
  }
  v19 = [(QLIPSPreviewProvider *)self replyWithPlainTextData:v7 forType:v9];
  v6[2](v6, v19, 0);
}

- (id)replyWithPlainTextData:(id)a3 forType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)QLPreviewReply);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003204;
  v12[3] = &unk_100004190;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = objc_msgSend(v7, "initWithDataOfContentType:contentSize:dataCreationBlock:", UTTypeUTF8PlainText, v12, 800.0, 600.0);

  return v10;
}

@end