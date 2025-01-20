@interface _UIRIPDeliveryRecord
- (NSSet)presses;
- (UIEvent)event;
- (_UIRIPDeliveryRecord)initWithPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5;
- (id)description;
- (id)diffToRecord:(id)a3 press:(id)a4;
- (int64_t)phase;
- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7;
@end

@implementation _UIRIPDeliveryRecord

- (_UIRIPDeliveryRecord)initWithPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIRIPDeliveryRecord;
  v11 = [(_UIRIPDeliveryRecord *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presses, a3);
    v12->_phase = a4;
    objc_storeStrong((id *)&v12->_event, a5);
    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    receivers = v12->_receivers;
    v12->_receivers = (NSMapTable *)v13;
  }
  return v12;
}

- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v13;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v20 = [(NSMapTable *)self->_receivers objectForKey:v19];
        if (!v20)
        {
          v20 = objc_opt_new();
          [(NSMapTable *)self->_receivers setObject:v20 forKey:v19];
        }
        v21 = [[_UIRIPReceiver alloc] initWithResponder:v12 class:a4 press:v19 inPhase:a6 withEvent:v14];
        [v20 addObject:v21];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Delivery record for phase %d:\n", self->_phase);
  [v3 appendFormat:@"event delivered:   %@\n", self->_event];
  [v3 appendFormat:@"presses delivered: %@\n", self->_presses];
  return v3;
}

- (id)diffToRecord:(id)a3 press:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  v8 = [(_UIRIPDeliveryRecord *)self event];
  id v9 = [v6 event];

  if (v8 != v9)
  {
    id v10 = NSString;
    v11 = [(_UIRIPDeliveryRecord *)self event];
    id v12 = [v6 event];
    objc_msgSend(v10, "stringWithFormat:", @"Unable to generate diff for records from different events: %p and %p", v11, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_66;
  }
  id v14 = [(NSMapTable *)self->_receivers objectForKey:v7];
  uint64_t v15 = [v6[1] objectForKey:v7];
  uint64_t v16 = (void *)v15;
  if (!v14 || !v15)
  {
    id v13 = [NSString stringWithFormat:@"Unable to generate diff. Press is not present in both records."];
    goto LABEL_65;
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F28E78];
  v18 = _NSStringFromUIPressPhase([(_UIRIPDeliveryRecord *)self phase]);
  uint64_t v19 = _NSStringFromUIPressPhase([v6 phase]);
  v20 = [v17 stringWithFormat:@"Difference between phase %@ and %@:\n", v18, v19];

  v21 = [v14 differenceFromArray:v16];
  if (![v21 hasChanges])
  {
    id v13 = 0;
    goto LABEL_64;
  }
  v63 = self;
  id v58 = v7;
  v59 = v6;
  v22 = [v21 removals];
  long long v23 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v74 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(v23, "addIndex:", objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * i), "index"));
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v26);
  }
  v68 = v20;

  v57 = v21;
  v29 = [v21 insertions];
  v30 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v70 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(v30, "addIndex:", objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * j), "index"));
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v33);
  }
  unint64_t v36 = 0;
  unint64_t v37 = 0;
  v38 = 0;
  v56 = v31;
  v65 = v23;
  v66 = v16;
  id v64 = v24;
  v67 = v14;
  v60 = v30;
  while (1)
  {

    if (v36 >= [v14 count] && v37 >= objc_msgSend(v16, "count")) {
      break;
    }
    if (v36 >= [v14 count])
    {
      id v31 = 0;
    }
    else
    {
      id v31 = [v14 objectAtIndexedSubscript:v36];
    }
    if (v37 >= [v16 count])
    {
      v39 = 0;
    }
    else
    {
      v39 = [v16 objectAtIndexedSubscript:v37];
    }
    v40 = [v31 responder];
    v41 = [v39 responder];
    if (v40 == v41)
    {
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_opt_class();

      if (v42 == v43)
      {
        __appendDescription(v68, v38, v31, 0);
        uint64_t v54 = [v31 responder];

        ++v36;
        ++v37;
        v38 = (void *)v54;
        goto LABEL_60;
      }
    }
    else
    {
    }
    uint64_t v44 = [v31 responder];
    if ((void *)v44 == v38)
    {

      if (([v23 containsIndex:v37] & 1) == 0)
      {
        ++v37;
        if (([v30 containsIndex:v36] & 1) == 0)
        {
LABEL_58:
          ++v36;
          goto LABEL_60;
        }
        goto LABEL_48;
      }
LABEL_37:
      v47 = _NSStringFromUIPressPhase([(_UIRIPDeliveryRecord *)v63 phase]);
      [v68 appendFormat:@"  --- missing calls in %@ ---\n", v47];
      char v61 = 0;
      goto LABEL_38;
    }
    v45 = (void *)v44;
    v46 = [v39 responder];

    if (([v23 containsIndex:v37] & 1) == 0)
    {
      ++v37;
      if (([v30 containsIndex:v36] & 1) == 0) {
        goto LABEL_58;
      }
      if (v46 == v38) {
        goto LABEL_48;
      }
      goto LABEL_46;
    }
    if (v46 == v38) {
      goto LABEL_37;
    }
    v47 = _NSStringFromUIPressPhase([(_UIRIPDeliveryRecord *)v63 phase]);
    [v68 appendFormat:@"-#- missing responder in %@ -#-\n", v47];
    char v61 = 1;
LABEL_38:

    if ([v23 containsIndex:v37])
    {
      v48 = v39;
      v49 = v38;
      do
      {
        v39 = [v66 objectAtIndexedSubscript:v37];

        __appendDescription(v68, v49, v39, -1);
        v38 = [v39 responder];

        ++v37;
        v48 = v39;
        v49 = v38;
      }
      while (([v65 containsIndex:v37] & 1) != 0);
    }
    if ((v61 & 1) == 0)
    {
      [v68 appendFormat:@"  === end missing calls ===\n"];
      v30 = v60;
      long long v23 = v65;
      if (([v60 containsIndex:v36] & 1) == 0) {
        goto LABEL_58;
      }
LABEL_48:
      v50 = _NSStringFromUIPressPhase([(_UIRIPDeliveryRecord *)v63 phase]);
      [v68 appendFormat:@"  +++ additional calls in %@ +++\n", v50];
      int v62 = 0;
      goto LABEL_49;
    }
    [v68 appendFormat:@"=#= end missing responder =#=\n"];
    v30 = v60;
    long long v23 = v65;
    if (([v60 containsIndex:v36] & 1) == 0) {
      goto LABEL_58;
    }
LABEL_46:
    v50 = _NSStringFromUIPressPhase([(_UIRIPDeliveryRecord *)v63 phase]);
    [v68 appendFormat:@"+#+ additional responder in %@ +#+\n", v50];
    int v62 = 1;
LABEL_49:
    v51 = v38;

    if ([v30 containsIndex:v36])
    {
      do
      {
        v52 = [v67 objectAtIndexedSubscript:v36];

        __appendDescription(v68, v51, v52, 1);
        v38 = [v52 responder];

        ++v36;
        id v31 = v52;
        v51 = v38;
      }
      while (([v30 containsIndex:v36] & 1) != 0);
    }
    else
    {
      v52 = v31;
    }
    long long v23 = v65;
    if (v62) {
      v53 = @"=#= end additional responder =#=\n";
    }
    else {
      v53 = @"  === end additional calls ===\n";
    }
    [v68 appendFormat:v53];
    id v31 = v52;
LABEL_60:
    id v24 = v64;

    uint64_t v16 = v66;
    id v14 = v67;
  }
  v20 = v68;
  id v13 = v68;

  id v7 = v58;
  v6 = v59;
  v21 = v57;
LABEL_64:

LABEL_65:
LABEL_66:

  return v13;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIEvent)event
{
  return self->_event;
}

- (NSSet)presses
{
  return self->_presses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presses, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
}

@end