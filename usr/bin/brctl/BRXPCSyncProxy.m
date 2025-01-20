@interface BRXPCSyncProxy
- (id)resultWithTimeout:(int)a3 exitMessage:(id)a4;
@end

@implementation BRXPCSyncProxy

- (id)resultWithTimeout:(int)a3 exitMessage:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = dispatch_get_global_queue(0, 0);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100009E94;
  v19 = &unk_100024AB0;
  v20 = self;
  v9 = v7;
  v21 = v9;
  dispatch_async(v8, &v16);

  dispatch_time_t v10 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v13 = +[NSError br_errorWithPOSIXCode:](NSError, "br_errorWithPOSIXCode:", 60, v16, v17, v18, v19, v20);
    goto LABEL_10;
  }
  v11 = [(BRXPCSyncProxy *)self result];

  v12 = [(BRXPCSyncProxy *)self result];

  if (v12)
  {
    v13 = 0;
    if (!v11) {
LABEL_10:
    }
      sub_100016DB8(v6, v13);
  }
  else
  {
    v13 = [(BRXPCSyncProxy *)self error];
    if (!v11) {
      goto LABEL_10;
    }
  }
  v14 = [(BRXPCSyncProxy *)self result];

  return v14;
}

@end