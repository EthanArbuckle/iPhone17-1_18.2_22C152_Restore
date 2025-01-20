@interface DefaultObserver
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 valueForKey:v8];
  if (qword_269FE5228 != -1) {
    dispatch_once(&qword_269FE5228, &unk_27063FB98);
  }
  v11 = qword_269FE5220;
  if (os_log_type_enabled((os_log_t)qword_269FE5220, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v16 = 138543618;
    *(void *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v10;
    _os_log_impl(&dword_2570AE000, v11, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", v16, 0x16u);
  }
  id v12 = v8;
  v13 = (void *)[v10 copy];
  [*((id *)a6 + 2) setObject:v13 forKeyedSubscript:v12];

  if (!*(unsigned char *)a6)
  {
    *(unsigned char *)a6 = 1;
    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    if (qword_269FE5218 != -1) {
      dispatch_once(&qword_269FE5218, &unk_27063FB78);
    }
    v15 = (id)qword_269FE5210;
    *(void *)v16 = MEMORY[0x263EF8330];
    *(void *)&v16[8] = 3221225472;
    *(void *)&v16[16] = sub_2570B2844;
    v17 = &unk_2654269B8;
    v18 = a6;
    dispatch_after(v14, v15, v16);
  }
}

@end