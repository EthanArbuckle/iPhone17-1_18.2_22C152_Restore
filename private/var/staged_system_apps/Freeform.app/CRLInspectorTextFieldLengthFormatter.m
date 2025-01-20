@interface CRLInspectorTextFieldLengthFormatter
+ (CRLInspectorTextFieldLengthFormatter)sharedFormatter;
- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9;
- (id)crl_numberFormatterForAnalysis;
- (id)crlaxLocalizedDescriptionFromValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation CRLInspectorTextFieldLengthFormatter

+ (CRLInspectorTextFieldLengthFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldLengthFormatter *)+[CRLInspectorTextFieldNumberFormatter rulerLengthFormatter];
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  id v31 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = +[CRLRulerUnits instance];
  id v18 = [v17 rulerUnits];

  if (v18 == (id)4)
  {
    v19 = &qword_1016A9CB0;
    uint64_t v38 = qword_1016A9CA0;
    v20 = &qword_1016A9CB8;
    v21 = &qword_1016A9C90;
    v22 = &v38;
  }
  else if (v18 == (id)1)
  {
    v19 = &qword_1016A9CB0;
    uint64_t v39 = qword_1016A9CB8;
    v20 = &qword_1016A9CA0;
    v21 = &qword_1016A9C90;
    v22 = &v39;
  }
  else
  {
    v19 = &qword_1016A9CB8;
    if (v18)
    {
      uint64_t v37 = qword_1016A9C90;
      v20 = &qword_1016A9CA0;
      v21 = &qword_1016A9CB0;
      v22 = &v37;
    }
    else
    {
      uint64_t v40 = qword_1016A9CB0;
      v20 = &qword_1016A9CA0;
      v21 = &qword_1016A9C90;
      v22 = &v40;
    }
  }
  uint64_t v23 = *v20;
  v22[1] = *v21;
  v22[2] = v23;
  v22[3] = *v19;
  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        if (objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:", a3, v31, v14, v15, v16, a8, a9))
        {
          BOOL v29 = 1;
          goto LABEL_18;
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  BOOL v29 = 0;
LABEL_18:

  return v29;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  v5 = +[CRLRulerUnits instance];
  unint64_t v6 = (unint64_t)[v5 rulerUnits];

  uint64_t v7 = objc_opt_class();
  v8 = sub_1002469D0(v7, v4);
  if (v8)
  {
    [v4 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    id v4 = (id)v9;
  }
  v10 = [(CRLInspectorTextFieldClampNumberFormatter *)self valueBeforeEditing];
  if (v6 > 4) {
    v11 = &qword_1016A9C90;
  }
  else {
    v11 = (&off_1014FC060)[v6];
  }
  v12 = [(id)*v11 stringForObjectValue:v4 originalValue:v10];

  return v12;
}

- (id)crl_numberFormatterForAnalysis
{
  v2 = +[CRLRulerUnits instance];
  unint64_t v3 = (unint64_t)[v2 rulerUnits];

  if (v3 > 4) {
    id v4 = &qword_1016A9C90;
  }
  else {
    id v4 = (&off_1014FC060)[v3];
  }
  id v5 = (id)*v4;

  return v5;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = [(CRLInspectorTextFieldLengthFormatter *)self crl_numberFormatterForAnalysis];
  id v7 = [v6 copy];
  sub_1002469D0(v5, v7);
  v8 = (CRLInspectorTextFieldLengthFormatter *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [(CRLInspectorTextFieldAbstractNumberFormatter *)v8 crlaxValueFormat];

  if (v9) {
    BOOL v10 = v8 == self;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC020);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6598(v11, v12);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC040);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v13);
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldLengthFormatter crlaxLocalizedDescriptionFromValue:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:586 isFatal:0 description:"Did not find a valid number formatter for accessible description."];

    v19.receiver = self;
    v19.super_class = (Class)CRLInspectorTextFieldLengthFormatter;
    uint64_t v16 = [(CRLInspectorTextFieldAbstractNumberFormatter *)&v19 crlaxLocalizedDescriptionFromValue:v4];
  }
  else
  {
    uint64_t v16 = [(CRLInspectorTextFieldLengthFormatter *)v8 crlaxLocalizedDescriptionFromValue:v4];
  }
  v17 = (void *)v16;

  return v17;
}

@end