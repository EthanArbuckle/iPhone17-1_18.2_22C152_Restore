@interface BCMutableFutureValue
- (void)set:(id)a3 error:(id)a4;
@end

@implementation BCMutableFutureValue

- (void)set:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1676D4;
  v24 = sub_1676E4;
  id v25 = 0;
  v8 = [(BCFutureValue *)self sync];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_169868;
  v15 = &unk_2C5658;
  v16 = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  v19 = &v20;
  dispatch_sync(v8, &v12);

  uint64_t v11 = v21[5];
  if (v11) {
    -[BCFutureValue _notifyBlocks:withValue:error:](self, "_notifyBlocks:withValue:error:", v11, v9, v10, v12, v13, v14, v15, v16, v17);
  }

  _Block_object_dispose(&v20, 8);
}

@end