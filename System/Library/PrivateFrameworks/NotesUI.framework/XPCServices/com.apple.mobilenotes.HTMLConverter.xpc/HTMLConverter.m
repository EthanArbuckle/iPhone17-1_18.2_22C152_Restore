@interface HTMLConverter
- (void)attributedStringFromHTMLString:(id)a3 baseURL:(id)a4 completionBlock:(id)a5;
@end

@implementation HTMLConverter

- (void)attributedStringFromHTMLString:(id)a3 baseURL:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v11 = [v7 dataUsingEncoding:4];
  v12 = +[NSMutableDictionary dictionary];
  [v12 setObject:NSHTMLTextDocumentType forKeyedSubscript:NSDocumentTypeDocumentAttribute];
  [v12 setObject:&off_1000042E8 forKeyedSubscript:NSCharacterEncodingDocumentAttribute];
  v13 = +[ICReaderDelegateUtilities sharedInstance];
  [v12 setObject:v13 forKeyedSubscript:NSReaderDelegateDocumentOption];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100002CE4;
  v28[4] = sub_100002CF4;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100002CE4;
  v26[4] = sub_100002CF4;
  id v27 = 0;
  id v14 = [v9 copy];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002CFC;
  v19[3] = &unk_1000041B0;
  id v20 = v12;
  id v15 = v8;
  id v21 = v15;
  id v22 = v11;
  v24 = v26;
  v25 = v28;
  id v23 = v14;
  id v16 = v14;
  id v17 = v11;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

@end