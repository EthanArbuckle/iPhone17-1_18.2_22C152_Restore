@interface OTTooManyPeersActualAdapter
- (BOOL)shouldPopDialog;
- (unint64_t)getLimit;
- (void)popDialogWithCount:(unint64_t)a3 limit:(unint64_t)a4;
@end

@implementation OTTooManyPeersActualAdapter

- (void)popDialogWithCount:(unint64_t)a3 limit:(unint64_t)a4
{
  v6 = dispatch_get_global_queue(9, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001558D4;
  v7[3] = &unk_100308EC8;
  v7[4] = a3;
  v7[5] = a4;
  dispatch_async(v6, v7);
}

- (unint64_t)getLimit
{
  return 170;
}

- (BOOL)shouldPopDialog
{
  if (qword_10035D148 != -1) {
    dispatch_once(&qword_10035D148, &stru_100305048);
  }
  if (!byte_10035BF10) {
    return 0;
  }

  return _os_variant_has_internal_ui("iCloudKeychain");
}

@end