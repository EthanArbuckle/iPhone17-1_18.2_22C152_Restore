@interface ASPrecomputationRunner
- (void)runPrecomputationWithProfile:(id)a3 profileInfo:(id)a4 bindings:(id)a5 externalDataArray:(id)a6 nonce:(id)a7 completion:(id)a8;
@end

@implementation ASPrecomputationRunner

- (void)runPrecomputationWithProfile:(id)a3 profileInfo:(id)a4 bindings:(id)a5 externalDataArray:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = +[pNjRsniwrVEhiG7R sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000F620;
  v21[3] = &unk_10065EDE0;
  id v22 = v13;
  id v20 = v13;
  [v19 zGi22DPZsVGfawap:v18 xz5EHXEN4FjlhJbi:v17 uhVTXyAfCFn7u0Ue:v16 EQUjQp7JcQbqcPcD:v15 A5wDLa5TFdFZlz3A:0 TJKMyOe6zn5PdGIr:v14 eCqgGM0WcnHOslnr:0 eCszfxdv3kUXvhgV:24 uWp4aZpP2vLhc04Q:0 QZYtNpvp0hKd248p:0 oCwPYmtRv8s31KUH:0 completion:v21];
}

@end