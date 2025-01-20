@interface STSTapToProvisionReader
- (BOOL)cancelProvisionAndReturnError:(id *)a3;
- (ORReader)reader;
- (STSTapToProvisionDelegate)delegate;
- (STSTapToProvisionReader)init;
- (id)checkStatusWithError:(id *)a3;
- (void)checkStatusWithCompletion:(id)a3;
- (void)onUpdateWithEvent:(int64_t)a3;
- (void)provisionCardWithParameters:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setReader:(id)a3;
@end

@implementation STSTapToProvisionReader

- (STSTapToProvisionReader)init
{
  v22.receiver = self;
  v22.super_class = (Class)STSTapToProvisionReader;
  v2 = [(STSTapToProvisionReader *)&v22 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F779F8] shared];
    id v21 = 0;
    uint64_t v4 = [v3 makeORReaderAndReturnError:&v21];
    id v5 = v21;
    reader = v2->_reader;
    v2->_reader = (ORReader *)v4;

    if (v5)
    {
      char v9 = 1;
      do
      {
        uint64_t v10 = [v5 code];
        if ((v9 & 1) == 0 || v10 != 14001) {
          goto LABEL_11;
        }

        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"[(STSTapToProvisionReader *)"Failed to create OR reader : %@ init], v11, v12, 0);
        v13 = [MEMORY[0x263F779F8] shared];
        id v20 = 0;
        uint64_t v14 = [v13 makeORReaderAndReturnError:&v20];
        id v5 = v20;
        v15 = v2->_reader;
        v2->_reader = (ORReader *)v14;

        char v9 = 0;
      }
      while (v5);
    }
    v16 = v2->_reader;
    if (!v16)
    {
      id v5 = 0;
LABEL_11:
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSTapToProvisionReader init]", 46, v2, @"Failed to create OR reader : %@", v7, v8, (uint64_t)v5);
      v18 = v2->_reader;
      v2->_reader = 0;

      v17 = 0;
      goto LABEL_12;
    }
    [(ORReader *)v16 setDelegate:v2];
  }
  v17 = v2;
LABEL_12:

  return v17;
}

- (void)onUpdateWithEvent:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained onUpdateWithEvent:a3];
}

- (id)checkStatusWithError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  objc_super v22 = sub_22119E3C0;
  v23 = sub_22119E3D0;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_22119E3C0;
  v17 = sub_22119E3D0;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22119E3D8;
  v9[3] = &unk_264594E10;
  uint64_t v11 = &v13;
  uint64_t v12 = &v19;
  v6 = v5;
  uint64_t v10 = v6;
  [(STSTapToProvisionReader *)self checkStatusWithCompletion:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v14[5];
  }
  id v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)checkStatusWithCompletion:(id)a3
{
  id v4 = a3;
  reader = self->_reader;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22119E504;
  v7[3] = &unk_264594E38;
  id v8 = v4;
  id v6 = v4;
  [(ORReader *)reader checkStatusWithCompletion:v7];
}

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 toOR];
  reader = self->_reader;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_22119E644;
  v10[3] = &unk_264594E60;
  id v11 = v6;
  id v9 = v6;
  [(ORReader *)reader provisionCardWithParameters:v7 completion:v10];
}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
{
  return MEMORY[0x270F9A6D0](self->_reader, sel_cancelProvisionAndReturnError_);
}

- (STSTapToProvisionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STSTapToProvisionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ORReader)reader
{
  return (ORReader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end