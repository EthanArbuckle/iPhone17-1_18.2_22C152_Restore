@interface TMLBlock
+ (id)blockWithFunction:(id)a3;
+ (id)createBlockForJSFunction:(id)a3 argumentsEncoding:(id)a4;
+ (id)createBlockWithValueForJSFunction:(id)a3 argumentsEncoding:(id)a4;
+ (void)callBlock:(id)a3 arguments:(id)a4;
+ (void)initializeJSContext:(id)a3;
- (TMLBlock)initWithFunction:(id)a3 argumentsEncoding:(id)a4;
- (TMLBlock)initWithFunctionWithValue:(id)a3 argumentsEncoding:(id)a4;
- (id)blockValue;
- (void)dealloc;
@end

@implementation TMLBlock

- (TMLBlock)initWithFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TMLBlock;
  v8 = [(TMLBlock *)&v31 init];
  if (v8
    && (v9 = objc_opt_class(),
        objc_msgSend_createBlockForJSFunction_argumentsEncoding_(v9, v10, v11, v6, v7),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        id block = v8->_block,
        v8->_id block = (id)v12,
        block,
        !v8->_block))
  {
    v17 = (void *)MEMORY[0x263F10390];
    v18 = objc_msgSend_stringWithFormat_(NSString, v14, v15, @"Unsupported block signature <%@>", v7);
    v21 = objc_msgSend_currentContext(MEMORY[0x263F10378], v19, v20);
    v24 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v17, v22, v23, v18, v21);
    v27 = objc_msgSend_currentContext(MEMORY[0x263F10378], v25, v26);
    objc_msgSend_setException_(v27, v28, v29, v24);

    v16 = 0;
  }
  else
  {
    v16 = v8;
  }

  return v16;
}

- (TMLBlock)initWithFunctionWithValue:(id)a3 argumentsEncoding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TMLBlock;
  v8 = [(TMLBlock *)&v31 init];
  if (v8
    && (v9 = objc_opt_class(),
        objc_msgSend_createBlockWithValueForJSFunction_argumentsEncoding_(v9, v10, v11, v6, v7),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        id block = v8->_block,
        v8->_id block = (id)v12,
        block,
        !v8->_block))
  {
    v17 = (void *)MEMORY[0x263F10390];
    v18 = objc_msgSend_stringWithFormat_(NSString, v14, v15, @"Unsupported block signature <%@>", v7);
    v21 = objc_msgSend_currentContext(MEMORY[0x263F10378], v19, v20);
    v24 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v17, v22, v23, v18, v21);
    v27 = objc_msgSend_currentContext(MEMORY[0x263F10378], v25, v26);
    objc_msgSend_setException_(v27, v28, v29, v24);

    v16 = 0;
  }
  else
  {
    v16 = v8;
  }

  return v16;
}

+ (id)blockWithFunction:(id)a3
{
  return (id)objc_msgSend_blockWithFunction_argumentsEncoding_(a1, a2, v3, a3, &stru_26ECF02A8);
}

- (void)dealloc
{
  id block = self->_block;
  self->_id block = 0;

  v4.receiver = self;
  v4.super_class = (Class)TMLBlock;
  [(TMLBlock *)&v4 dealloc];
}

+ (void)callBlock:(id)a3 arguments:(id)a4
{
  uint64_t v12 = (void (**)(id, void *))a3;
  id v6 = a4;
  if (v12)
  {
    uint64_t v8 = objc_msgSend_count(v6, v5, v7);
    if (v8 == 1)
    {
      double v11 = objc_msgSend_objectAtIndexedSubscript_(v6, v9, v10, 0);
      v12[2](v12, v11);
    }
    else if (!v8)
    {
      ((void (*)(void))v12[2])();
    }
  }
}

- (id)blockValue
{
  return self->_block;
}

+ (id)createBlockForJSFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_currentContext(TMLJSEnvironment, v7, v8);
  uint64_t v12 = objc_msgSend_managedValueWithValue_(MEMORY[0x263F10388], v10, v11, v5);
  switch(objc_msgSend_length(v6, v13, v14))
  {
    case 1:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@"))
      {
        v19 = v71;
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        double v20 = &unk_264DAB8E0;
        v21 = sub_239834984;
        goto LABEL_19;
      }
      v30 = objc_msgSend_stringWithUTF8String_(NSString, v17, v18, "B");
      int isEqualToString = objc_msgSend_isEqualToString_(v6, v31, v32, v30);

      if (isEqualToString)
      {
        v19 = v70;
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        double v20 = &unk_264DAB930;
        v21 = sub_239834B10;
        goto LABEL_19;
      }
      v40 = objc_msgSend_stringWithUTF8String_(NSString, v34, v35, "f");
      int v43 = objc_msgSend_isEqualToString_(v6, v41, v42, v40);

      if (!v43) {
        goto LABEL_21;
      }
      v19 = v69;
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      double v20 = &unk_264DAB980;
      v21 = sub_239834C74;
      goto LABEL_19;
    case 2:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@@"))
      {
        v19 = v68;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        double v20 = &unk_264DAB9D0;
        v21 = sub_239834DE0;
        goto LABEL_19;
      }
      v36 = objc_msgSend_stringWithFormat_(NSString, v24, v25, @"%s@", "B");
      int v39 = objc_msgSend_isEqualToString_(v6, v37, v38, v36);

      if (!v39) {
        goto LABEL_21;
      }
      v19 = v67;
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      double v20 = &unk_264DABA20;
      v21 = sub_239834FD4;
      goto LABEL_19;
    case 3:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@@@"))
      {
        v19 = v66;
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        double v20 = &unk_264DABA70;
        v21 = sub_239835190;
      }
      else
      {
        double v26 = objc_msgSend_stringWithFormat_(NSString, v22, v23, @"@%s@", "B");
        int v29 = objc_msgSend_isEqualToString_(v6, v27, v28, v26);

        if (!v29) {
          goto LABEL_21;
        }
        v19 = v65;
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        double v20 = &unk_264DABAC0;
        v21 = sub_2398353DC;
      }
LABEL_19:
      v19[2] = v21;
      v19[3] = v20;
      id v44 = v9;
      v19[4] = v44;
      id v45 = v12;
      v19[5] = v45;
      v46 = (void *)MEMORY[0x23ECA7DD0](v19);

      if (v46)
      {
        v49 = objc_msgSend_context(v5, v47, v48);
        v52 = objc_msgSend_virtualMachine(v49, v50, v51);

        objc_msgSend_addManagedReference_withOwner_(v52, v53, v54, v45, v44);
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = sub_23983589C;
        v60[3] = &unk_264DAB8B8;
        id v61 = v52;
        id v62 = v45;
        id v63 = v44;
        id v55 = v52;
        objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v56, v57, v60, v46);
        id v58 = v46;

        goto LABEL_22;
      }
LABEL_21:
      id v58 = 0;
LABEL_22:

      return v58;
    case 4:
      if (!objc_msgSend_isEqualToString_(v6, v15, v16, @"@@@@")) {
        goto LABEL_21;
      }
      v19 = v64;
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      double v20 = &unk_264DABB10;
      v21 = sub_2398355F0;
      goto LABEL_19;
    default:
      v19 = v72;
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      double v20 = &unk_264DAB890;
      v21 = sub_239834750;
      goto LABEL_19;
  }
}

+ (id)createBlockWithValueForJSFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_currentContext(TMLJSEnvironment, v7, v8);
  uint64_t v12 = objc_msgSend_managedValueWithValue_(MEMORY[0x263F10388], v10, v11, v5);
  switch(objc_msgSend_length(v6, v13, v14))
  {
    case 1:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@"))
      {
        v19 = v78;
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        double v20 = &unk_264DABB60;
        v21 = sub_239836040;
        goto LABEL_21;
      }
      v30 = objc_msgSend_stringWithUTF8String_(NSString, v17, v18, "B");
      int isEqualToString = objc_msgSend_isEqualToString_(v6, v31, v32, v30);

      if (isEqualToString)
      {
        v19 = v77;
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        double v20 = &unk_264DABB88;
        v21 = sub_239836138;
        goto LABEL_21;
      }
      double v42 = objc_msgSend_stringWithUTF8String_(NSString, v34, v35, "f");
      int v45 = objc_msgSend_isEqualToString_(v6, v43, v44, v42);

      if (!v45) {
        goto LABEL_23;
      }
      v19 = v76;
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      double v20 = &unk_264DABBB0;
      v21 = sub_23983621C;
      goto LABEL_21;
    case 2:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@@"))
      {
        v19 = v75;
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        double v20 = &unk_264DABBD8;
        v21 = sub_239836300;
        goto LABEL_21;
      }
      v36 = objc_msgSend_stringWithFormat_(NSString, v24, v25, @"%s@", "B");
      int v39 = objc_msgSend_isEqualToString_(v6, v37, v38, v36);

      if (v39)
      {
        v19 = v74;
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        double v20 = &unk_264DABC00;
        v21 = sub_239836440;
        goto LABEL_21;
      }
      v46 = objc_msgSend_stringWithFormat_(NSString, v40, v41, @"%s@", "q");
      int v49 = objc_msgSend_isEqualToString_(v6, v47, v48, v46);

      if (!v49) {
        goto LABEL_23;
      }
      v19 = v73;
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      double v20 = &unk_264DABC28;
      v21 = sub_23983655C;
      goto LABEL_21;
    case 3:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, @"@@@"))
      {
        v19 = v72;
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        double v20 = &unk_264DABC50;
        v21 = sub_239836678;
      }
      else
      {
        double v26 = objc_msgSend_stringWithFormat_(NSString, v22, v23, @"@%s@", "B");
        int v29 = objc_msgSend_isEqualToString_(v6, v27, v28, v26);

        if (!v29) {
          goto LABEL_23;
        }
        v19 = v71;
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        double v20 = &unk_264DABC78;
        v21 = sub_2398367FC;
      }
LABEL_21:
      v19[2] = v21;
      v19[3] = v20;
      id v50 = v9;
      v19[4] = v50;
      id v51 = v12;
      v19[5] = v51;
      v52 = (void *)MEMORY[0x23ECA7DD0](v19);

      if (v52)
      {
        id v55 = objc_msgSend_context(v5, v53, v54);
        id v58 = objc_msgSend_virtualMachine(v55, v56, v57);

        objc_msgSend_addManagedReference_withOwner_(v58, v59, v60, v51, v50);
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = sub_239836B1C;
        v66[3] = &unk_264DAB8B8;
        id v67 = v58;
        id v68 = v51;
        id v69 = v50;
        id v61 = v58;
        objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v62, v63, v66, v52);
        id v64 = v52;

        goto LABEL_24;
      }
LABEL_23:
      id v64 = 0;
LABEL_24:

      return v64;
    case 4:
      if (!objc_msgSend_isEqualToString_(v6, v15, v16, @"@@@@")) {
        goto LABEL_23;
      }
      v19 = v70;
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      double v20 = &unk_264DABCA0;
      v21 = sub_239836958;
      goto LABEL_21;
    default:
      v19 = v79;
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      double v20 = &unk_264DABB38;
      v21 = sub_239835EC0;
      goto LABEL_21;
  }
}

+ (void)initializeJSContext:(id)a3
{
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_239836C70;
  v17[3] = &unk_264DABCC0;
  v17[4] = a1;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x23ECA7DD0](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v6, v7, v5, @"block");

  double v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, v9, @"block");
  objc_msgSend_setObject_forKeyedSubscript_(v10, v11, v12, &unk_26ECEBBD8, @"invoke");

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_239837750;
  v16[3] = &unk_264DABCC0;
  v16[4] = a1;
  v13 = (void *)MEMORY[0x23ECA7DD0](v16);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, v15, v13, @"blockWithValue");
}

- (void).cxx_destruct
{
}

@end