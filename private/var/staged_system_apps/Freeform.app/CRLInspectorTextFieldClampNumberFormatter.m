@interface CRLInspectorTextFieldClampNumberFormatter
+ (id)formatterWithMinValue:(id)a3 maxValue:(id)a4;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9;
- (BOOL)p_textShouldBeginEditingWithContent:(id)a3;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (CRLInspectorTextFieldClampNumberFormatter)init;
- (CRLInspectorTextFieldClampNumberFormatter)initWithCoder:(id)a3;
- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6;
- (id)stringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3 originalValue:(id)a4;
- (id)valueBeforeEditing;
- (void)p_commonInitClampNumberFormatter;
- (void)setValueBeforeEditing:(id)a3;
@end

@implementation CRLInspectorTextFieldClampNumberFormatter

+ (id)formatterWithMinValue:(id)a3 maxValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 formatter];
  [v8 setMinimum:v7];

  [v8 setMaximum:v6];

  return v8;
}

- (void)p_commonInitClampNumberFormatter
{
  [(CRLInspectorTextFieldClampNumberFormatter *)self setLenient:1];

  [(CRLInspectorTextFieldAbstractNumberFormatter *)self setCrlaxRulerUnitType:5];
}

- (CRLInspectorTextFieldClampNumberFormatter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v3 = [(CRLInspectorTextFieldClampNumberFormatter *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLInspectorTextFieldClampNumberFormatter *)v3 p_commonInitClampNumberFormatter];
  }
  return v4;
}

- (CRLInspectorTextFieldClampNumberFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v2 = [(CRLInspectorTextFieldAbstractNumberFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLInspectorTextFieldClampNumberFormatter *)v2 p_commonInitClampNumberFormatter];
  }
  return v3;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (v10 && v11)
  {
    if ([v10 compare:v11] != (id)-1 && objc_msgSend(v10, "compare:", v11))
    {
      unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBFA0);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v23 = v13;
        __int16 v24 = 2082;
        v25 = "-[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:]";
        __int16 v26 = 2082;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m";
        __int16 v28 = 1024;
        int v29 = 135;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid minimum %@ and maximum %@", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBFC0);
      }
      v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v15);
      }
      v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:]");
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16, v17, 135, 0, "invalid minimum %@ and maximum %@", v10, v11 file lineNumber isFatal description];
    }
  }
  else if (!v10)
  {
    goto LABEL_16;
  }
  if ([v12 compare:v10] != (id)-1)
  {
LABEL_16:
    BOOL v18 = 0;
    id v19 = v12;
    if (!v11) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  id v19 = v10;

  BOOL v18 = 1;
  if (!v11) {
    goto LABEL_21;
  }
LABEL_19:
  if ([v19 compare:v11] == (id)1)
  {
    id v20 = v11;

    BOOL v18 = 1;
    id v19 = v20;
  }
LABEL_21:
  if (a6) {
    *a6 = v18;
  }

  return v19;
}

- (id)stringForObjectValue:(id)a3 originalValue:(id)a4
{
  objc_super v6 = (__CFString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  uint64_t v7 = [(CRLPositiveZeroNumberFormatter *)&v10 stringForObjectValue:a3];
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    if (!v6) {
      objc_super v6 = &stru_101538650;
    }
    v8 = [(__CFString *)v6 description];
  }

  return v8;
}

- (id)stringForObjectValue:(id)a3
{
  return [(CRLInspectorTextFieldClampNumberFormatter *)self stringForObjectValue:a3 originalValue:self->mValueBeforeEditing];
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  v14 = a9;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a4;
  id v19 = [(CRLInspectorTextFieldClampNumberFormatter *)self minimum];
  id v20 = [(CRLInspectorTextFieldClampNumberFormatter *)self maximum];
  [(CRLInspectorTextFieldClampNumberFormatter *)self setMinimum:0];
  [(CRLInspectorTextFieldClampNumberFormatter *)self setMaximum:0];
  v27.receiver = self;
  v27.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  id v28 = 0;
  BOOL v21 = [(CRLInspectorTextFieldClampNumberFormatter *)&v27 getObjectValue:a3 forString:v18 errorDescription:&v28];

  id v22 = v28;
  [(CRLInspectorTextFieldClampNumberFormatter *)self setMinimum:v19];
  [(CRLInspectorTextFieldClampNumberFormatter *)self setMaximum:v20];
  char v26 = 0;
  if (a3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v24 = *a3;
    if (isKindOfClass)
    {
      *a3 = [(CRLInspectorTextFieldClampNumberFormatter *)self p_clampNumber:v24 toMinimum:v15 andMaximum:v16 wasNumberClamped:&v26];
      v14 = a9;
    }
    else
    {
      v14 = a9;
      if (!v24
        && (!v21
         || ![(CRLInspectorTextFieldAbstractNumberFormatter *)self inspectorTextFieldAllowsNilObjectValue]))
      {
        *a3 = v17;
        char v26 = 1;
      }
    }
  }
  if (v14) {
    BOOL *v14 = v26;
  }

  return v21;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = a4;
  id v9 = [(CRLInspectorTextFieldClampNumberFormatter *)self minimum];
  objc_super v10 = [(CRLInspectorTextFieldClampNumberFormatter *)self maximum];
  [(CRLInspectorTextFieldClampNumberFormatter *)self p_getObjectValue:a3 forString:v8 withMinimum:v9 andMaximum:v10 originalValue:self->mValueBeforeEditing errorDescription:a5 valueObjectWasAdjusted:0];

  return 1;
}

- (BOOL)p_textShouldBeginEditingWithContent:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  unsigned __int8 v5 = [(CRLInspectorTextFieldClampNumberFormatter *)self getObjectValue:&v14 forString:v4 errorDescription:0];
  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBFE0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B64DC((uint64_t)v4, v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC000);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldClampNumberFormatter p_textShouldBeginEditingWithContent:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 221, 0, "invalid initial string %@", v4 file lineNumber isFatal description];
  }
  id mValueBeforeEditing = self->mValueBeforeEditing;
  self->id mValueBeforeEditing = v6;

  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = [a3 text];
  LOBYTE(self) = [(CRLInspectorTextFieldClampNumberFormatter *)self p_textShouldBeginEditingWithContent:v4];

  return (char)self;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (id)valueBeforeEditing
{
  return self->mValueBeforeEditing;
}

- (void)setValueBeforeEditing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end