@interface YNHF5E1zsUQomY0e
- (YNHF5E1zsUQomY0e)initWithtaDFBApmLBObrNlM:(_KUwyEjpVZR65eUyl *)a3 itCyNcNHxjurvzrS:(id)a4;
- (_KUwyEjpVZR65eUyl)LvlWuLAGTFjI8z1M;
- (eTBtehykeBvfpeTP)fubP36M2a0RaVUtL;
- (void)nQ82YhFf5OQDL4Qk:(id)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6;
- (void)setFubP36M2a0RaVUtL:(id)a3;
- (void)setLvlWuLAGTFjI8z1M:(_KUwyEjpVZR65eUyl *)a3;
@end

@implementation YNHF5E1zsUQomY0e

- (YNHF5E1zsUQomY0e)initWithtaDFBApmLBObrNlM:(_KUwyEjpVZR65eUyl *)a3 itCyNcNHxjurvzrS:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)YNHF5E1zsUQomY0e;
  v8 = [(YNHF5E1zsUQomY0e *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_LvlWuLAGTFjI8z1M = a3;
    objc_storeStrong((id *)&v8->_fubP36M2a0RaVUtL, a4);
  }

  return v9;
}

- (void)nQ82YhFf5OQDL4Qk:(id)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  v10 = (void (**)(id, void))a3;
  id v11 = a6;
  if (qword_1006A5DD8 != -1) {
    dispatch_once(&qword_1006A5DD8, &stru_10065F518);
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100026C60;
  v41 = sub_100026C70;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3810000000;
  v30[3] = "";
  long long v31 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v13 = qword_1006A5DE0;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100026C78;
  v22 = &unk_10065F540;
  v26 = &v37;
  v27 = v30;
  v23 = self;
  unsigned int v29 = a5;
  id v14 = v11;
  id v24 = v14;
  v28 = &v33;
  v15 = v12;
  v25 = v15;
  dispatch_async(v13, &v19);
  dispatch_time_t v16 = dispatch_time(0, 1000000 * self->_LvlWuLAGTFjI8z1M->var3);
  if (dispatch_semaphore_wait(v15, v16) && !*((unsigned char *)v34 + 24))
  {
    uint64_t v17 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", 200, v19, v20, v21, v22, v23, v24);
    v18 = (void *)v38[5];
    v38[5] = v17;
  }
  v10[2](v10, v38[5]);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

- (_KUwyEjpVZR65eUyl)LvlWuLAGTFjI8z1M
{
  return self->_LvlWuLAGTFjI8z1M;
}

- (void)setLvlWuLAGTFjI8z1M:(_KUwyEjpVZR65eUyl *)a3
{
  self->_LvlWuLAGTFjI8z1M = a3;
}

- (eTBtehykeBvfpeTP)fubP36M2a0RaVUtL
{
  return (eTBtehykeBvfpeTP *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFubP36M2a0RaVUtL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end