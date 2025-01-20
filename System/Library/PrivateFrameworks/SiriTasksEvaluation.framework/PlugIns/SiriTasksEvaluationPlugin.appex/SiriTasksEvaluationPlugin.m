uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend_getEvaluationResults(void *a1, const char *a2, ...)
{
  return [a1 getEvaluationResults];
}

id objc_msgSend_jsonSELFResults(void *a1, const char *a2, ...)
{
  return [a1 jsonSELFResults];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_toJSON(void *a1, const char *a2, ...)
{
  return [a1 toJSON];
}
objc_claimAutoreleasedReturnValue();
  v9 = [v7 stringValueForKey:@"taskName" defaultValue:0];
  [v6 performSiriEvaluationTaskWithTaskName:v9 bmStreamIdentifier:v8 outError:a4];
  v10 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = [v6 getEvaluationResults];
  v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v12)
  {
    v13 = v12;
    v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) toJSON];
        [v10 addObject:v16];
      }
      v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v13);
  }

  v26[0] = @"evaluationData";
  v26[1] = @"sELFResults";
  v27[0] = v10;
  v17 = [v6 jsonSELFResults];
  v27[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  v19 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:v18 unprivatizedVector:0];

  return v19;
}

@end