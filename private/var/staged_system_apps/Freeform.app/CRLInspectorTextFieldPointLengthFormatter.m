@interface CRLInspectorTextFieldPointLengthFormatter
+ (CRLInspectorTextFieldPointLengthFormatter)sharedFormatter;
- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9;
- (id)crl_numberFormatterForAnalysis;
- (id)crlaxLocalizedDescriptionFromValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation CRLInspectorTextFieldPointLengthFormatter

+ (CRLInspectorTextFieldPointLengthFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldPointLengthFormatter *)+[CRLInspectorTextFieldNumberFormatter pointsFormatter];
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  id v24 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30[0] = qword_1016A9C90;
  v30[1] = qword_1016A9CA0;
  v30[2] = qword_1016A9CB0;
  v30[3] = qword_1016A9CB8;
  +[NSArray arrayWithObjects:v30 count:4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:", a3, v24, v14, v15, v16, a8, a9))
        {
          BOOL v22 = 1;
          goto LABEL_11;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 0;
LABEL_11:

  return v22;
}

- (id)stringForObjectValue:(id)a3
{
  v4 = (void *)qword_1016A9C90;
  id v5 = a3;
  v6 = [(CRLInspectorTextFieldClampNumberFormatter *)self valueBeforeEditing];
  v7 = [v4 stringForObjectValue:v5 originalValue:v6];

  return v7;
}

- (id)crl_numberFormatterForAnalysis
{
  return (id)qword_1016A9C90;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  return [(id)qword_1016A9C90 crlaxLocalizedDescriptionFromValue:a3];
}

@end