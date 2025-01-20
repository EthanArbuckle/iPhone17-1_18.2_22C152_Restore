@interface _PSFeedbackUtils
+ (id)feedbackPayloadWithIndex:(id)a3 reasonType:(id)a4 reason:(id)a5 sourceBundleId:(id)a6 transportBundleId:(id)a7 numberOfVisibleSuggestions:(id)a8 sessionId:(id)a9 delay:(id)a10 testEvent:(id)a11 iCloudFamilyInvocation:(id)a12 engagementType:(int64_t)a13 trialID:(id)a14;
@end

@implementation _PSFeedbackUtils

+ (id)feedbackPayloadWithIndex:(id)a3 reasonType:(id)a4 reason:(id)a5 sourceBundleId:(id)a6 transportBundleId:(id)a7 numberOfVisibleSuggestions:(id)a8 sessionId:(id)a9 delay:(id)a10 testEvent:(id)a11 iCloudFamilyInvocation:(id)a12 engagementType:(int64_t)a13 trialID:(id)a14
{
  id v19 = a3;
  id v58 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v59 = a8;
  id v60 = a9;
  id v23 = a10;
  v24 = (void *)MEMORY[0x1E4F1CA60];
  id v25 = a14;
  id v26 = a12;
  id v55 = a11;
  v27 = [v24 dictionary];
  v57 = v19;
  v56 = v26;
  id v28 = v21;
  if ([v19 integerValue] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v29 forKeyedSubscript:@"indexSelected"];
  }
  else
  {
    [v27 setObject:v19 forKeyedSubscript:@"indexSelected"];
  }
  v30 = v22;
  v31 = [v27 objectForKeyedSubscript:@"indexSelected"];
  v32 = [MEMORY[0x1E4F1CA98] null];

  if (v31 == v32)
  {
    v33 = v58;
    v34 = v28;
    if (([v58 containsString:@"PS Rewrite"] & 1) == 0
      && ![v58 containsString:@"PS Legacy"])
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v27 setObject:v48 forKeyedSubscript:@"reason"];

      v49 = [MEMORY[0x1E4F1CA98] null];
      [v27 setObject:v49 forKeyedSubscript:@"reasonType"];

LABEL_29:
      id v35 = v59;
      if (v34) {
        goto LABEL_30;
      }
LABEL_25:
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v27 setObject:v45 forKeyedSubscript:@"sourceBundleID"];

      if (v30) {
        goto LABEL_31;
      }
      goto LABEL_26;
    }
    id v35 = v59;
    if (v58)
    {
      [v27 setObject:v58 forKeyedSubscript:@"reasonType"];
      if (v20) {
        goto LABEL_11;
      }
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v27 setObject:v43 forKeyedSubscript:@"reasonType"];

      if (v20)
      {
LABEL_11:
        [v27 setObject:v20 forKeyedSubscript:@"reason"];
        if (v34) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
    }
    v44 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v44 forKeyedSubscript:@"reason"];

    if (v34) {
      goto LABEL_30;
    }
    goto LABEL_25;
  }
  if (v58)
  {
    [v27 setObject:v58 forKeyedSubscript:@"reasonType"];
  }
  else
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v36 forKeyedSubscript:@"reasonType"];
  }
  v37 = [v27 objectForKeyedSubscript:@"reasonType"];
  objc_opt_class();
  id v38 = v20;
  if (objc_opt_isKindOfClass())
  {
    v39 = [v27 objectForKeyedSubscript:@"reasonType"];
    int v40 = [v39 containsString:@"_PSRuleMiningModel"];

    v34 = v28;
    if (v40)
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v27 setObject:v41 forKeyedSubscript:@"reason"];

      id v20 = v38;
      v30 = v22;
      v33 = v58;
      goto LABEL_29;
    }
  }
  else
  {

    v34 = v28;
  }
  id v20 = v38;
  id v35 = v59;
  if (v38)
  {
    [v27 setObject:v38 forKeyedSubscript:@"reason"];
  }
  else
  {
    v42 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v42 forKeyedSubscript:@"reason"];
  }
  v30 = v22;
  v33 = v58;
  if (!v34) {
    goto LABEL_25;
  }
LABEL_30:
  [v27 setObject:v34 forKeyedSubscript:@"sourceBundleID"];
  if (v30)
  {
LABEL_31:
    [v27 setObject:v30 forKeyedSubscript:@"transportBundleID"];
    if (v35) {
      goto LABEL_32;
    }
LABEL_27:
    v47 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v47 forKeyedSubscript:@"numberOfVisibleSuggestions"];

    goto LABEL_33;
  }
LABEL_26:
  v46 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v46 forKeyedSubscript:@"transportBundleID"];

  if (!v35) {
    goto LABEL_27;
  }
LABEL_32:
  [v27 setObject:v35 forKeyedSubscript:@"numberOfVisibleSuggestions"];
LABEL_33:
  if (v60)
  {
    [v27 setObject:v60 forKeyedSubscript:@"sessionID"];
    if (v23)
    {
LABEL_35:
      [v27 setObject:v23 forKeyedSubscript:@"delay"];
      goto LABEL_38;
    }
  }
  else
  {
    v50 = [MEMORY[0x1E4F1CA98] null];
    [v27 setObject:v50 forKeyedSubscript:@"sessionID"];

    if (v23) {
      goto LABEL_35;
    }
  }
  v51 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v51 forKeyedSubscript:@"delay"];

LABEL_38:
  [v27 setObject:v55 forKeyedSubscript:@"testEvent"];

  [v27 setObject:v56 forKeyedSubscript:@"iCloudFamilyInvocation"];
  v52 = [NSNumber numberWithInteger:a13];
  [v27 setObject:v52 forKeyedSubscript:@"engagementType"];

  [v27 setObject:v25 forKeyedSubscript:@"trackingID"];
  [v27 setObject:v25 forKeyedSubscript:@"trialSessionID"];
  LODWORD(v52) = [v25 isEqualToString:@"null"];

  if (v52) {
    uint64_t v53 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v53 = MEMORY[0x1E4F1CC38];
  }
  [v27 setObject:v53 forKeyedSubscript:@"inTrialSession"];

  return v27;
}

@end