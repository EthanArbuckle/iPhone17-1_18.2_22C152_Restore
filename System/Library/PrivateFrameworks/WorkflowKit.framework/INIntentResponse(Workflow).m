@interface INIntentResponse(Workflow)
- (void)wf_getOutputValueWithCompletionHandler:()Workflow;
@end

@implementation INIntentResponse(Workflow)

- (void)wf_getOutputValueWithCompletionHandler:()Workflow
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"INIntentResponse+Workflow.m", 19, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v6 = [a1 _codableDescription];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "WFEnforceClass";
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      uint64_t v27 = v7;
      id v11 = v25;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  v12 = [v9 outputAttribute];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 propertyName];
    v15 = [a1 valueForKey:v14];

    if (v15)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__INIntentResponse_Workflow__wf_getOutputValueWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E6556940;
      id v19 = v5;
      id v18 = v13;
      objc_msgSend(v15, "wf_transformValueForCodableAttribute:completionHandler:", v18, v17);
    }
    else
    {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

@end