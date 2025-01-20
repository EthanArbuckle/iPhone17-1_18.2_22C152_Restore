@interface _UIResponderChainFixerUpper
- (NSMapTable)currentDelivery;
- (NSMapTable)deliveryRecords;
- (_UIResponderChainFixerUpper)init;
- (id)_nextResponders;
- (id)_recursiveDescription:(id)a3;
- (id)_recursiveDescriptionStep:(unint64_t)a3;
- (id)description;
- (id)recursiveDescription;
- (void)_callResponder:(id)a3 phase:(int64_t)a4 components:(id)a5 event:(id)a6;
- (void)_deliverComponents:(id)a3 phase:(int64_t)a4 forEvent:(id)a5 toResponder:(id)a6;
- (void)_recordDeliveryOfComponents:(id)a3 toResponder:(id)a4;
- (void)_removeDeliveryRecordForComponents:(id)a3;
- (void)_snapshotDeliveryOfComponents:(id)a3 map:(id)a4 block:(id)a5;
- (void)deliverPressesEvent:(id)a3 toResponder:(id)a4;
- (void)deliverTouchesEvent:(id)a3 toResponder:(id)a4;
- (void)forward:(id)a3 phase:(int64_t)a4 withEvent:(id)a5 fromResponder:(id)a6;
- (void)setCurrentDelivery:(id)a3;
@end

@implementation _UIResponderChainFixerUpper

- (_UIResponderChainFixerUpper)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIResponderChainFixerUpper;
  v2 = [(_UIResponderChainFixerUpper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    deliveryRecords = v2->_deliveryRecords;
    v2->_deliveryRecords = (NSMapTable *)v3;
  }
  return v2;
}

- (void)_snapshotDeliveryOfComponents:(id)a3 map:(id)a4 block:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  v20 = self;
  v19 = [(_UIResponderChainFixerUpper *)self currentDelivery];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v12 = [v9 keyEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v17, v19))
        {
          v18 = [v9 objectForKey:v17];
          [v11 setObject:v18 forKey:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [(_UIResponderChainFixerUpper *)v20 setCurrentDelivery:v11];
  v10[2](v10);
  [(_UIResponderChainFixerUpper *)v20 setCurrentDelivery:v19];
}

- (void)deliverTouchesEvent:(id)a3 toResponder:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v8 = [v9 _touchesForResponder:v6 withPhase:i];
    if (v8)
    {
      [(_UIResponderChainFixerUpper *)self _deliverComponents:v8 phase:i forEvent:v9 toResponder:v6];
      [(id)UIApp _registerEstimatedTouches:v8 event:v9 forTouchable:v6];
    }
  }
}

- (void)deliverPressesEvent:(id)a3 toResponder:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v8 = [v9 _pressesForResponder:v6 withPhase:i];
    if (v8) {
      [(_UIResponderChainFixerUpper *)self _deliverComponents:v8 phase:i forEvent:v9 toResponder:v6];
    }
  }
}

- (void)_deliverComponents:(id)a3 phase:(int64_t)a4 forEvent:(id)a5 toResponder:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11 || ![v11 count])
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_UIResponderChainFixerUpper.m", 162, @"Invalid parameter not satisfying: %@", @"components != nil && components.count > 0" object file lineNumber description];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDelivery", &_deliverComponents_phase_forEvent_toResponder____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v25 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = v13;
      if (v26)
      {
        v27 = NSString;
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = [v27 stringWithFormat:@"<%@: %p>", v29, v26];
      }
      else
      {
        v30 = @"(nil)";
      }

      *(_DWORD *)buf = 134218498;
      int64_t v40 = a4;
      __int16 v41 = 2112;
      id v42 = v11;
      __int16 v43 = 2112;
      v44 = v30;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Delivering phase %ld components %@ to responder %@", buf, 0x20u);
    }
  }
  switch(a4)
  {
    case 0:
      [(_UIResponderChainFixerUpper *)self _recordDeliveryOfComponents:v11 toResponder:v13];
      [(_UIResponderChainFixerUpper *)self _callResponder:v13 phase:0 components:v11 event:v12];
      break;
    case 1:
    case 4:
      goto LABEL_22;
    case 3:
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(_WORD **)(*((void *)&v34 + 1) + 8 * i);
            if ([v20 _eventComponentType] == 1)
            {
              [v20 setSentPressesEnded:1];
            }
            else
            {
              uint64_t v21 = [v20 _eventComponentType];
              if (v20) {
                BOOL v22 = v21 == 0;
              }
              else {
                BOOL v22 = 0;
              }
              if (v22) {
                v20[118] |= 8u;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v17);
      }

LABEL_22:
      long long v23 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke;
      v31[3] = &unk_1E52DA070;
      v31[4] = self;
      int64_t v33 = a4;
      id v32 = v12;
      [(_UIResponderChainFixerUpper *)self _snapshotDeliveryOfComponents:v11 map:v23 block:v31];

      if (a4 != 1) {
        [(_UIResponderChainFixerUpper *)self _removeDeliveryRecordForComponents:v11];
      }

      break;
    default:
      break;
  }
}

- (id)_nextResponders
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = [(_UIResponderChainFixerUpper *)self currentDelivery];
  if (!v4)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UIResponderChainFixerUpper.m" lineNumber:225 description:@"Trying to enumerate responders without a current delivery record."];
  }
  uint64_t v21 = self;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [v4 keyEnumerator];
  v7 = [v6 allObjects];

  id obj = v7;
  uint64_t v24 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v10 = objc_msgSend(v4, "objectForKey:", v9, v21);
        id v11 = (void *)[v10 mutableCopy];
        id v12 = [v11 firstObject];
        [v11 removeObjectAtIndex:0];
        id v13 = [v5 objectForKey:v12];
        uint64_t v14 = (void *)[v13 mutableCopy];
        id v15 = v14;
        if (v14) {
          id v16 = v14;
        }
        else {
          id v16 = (id)objc_opt_new();
        }
        uint64_t v17 = v16;

        [v17 addObject:v9];
        uint64_t v18 = (void *)[v17 copy];
        [v5 setObject:v18 forKey:v12];

        if ([v11 count]) {
          [v4 setObject:v11 forKey:v9];
        }
        else {
          [v4 removeObjectForKey:v9];
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }

  [(_UIResponderChainFixerUpper *)v21 setCurrentDelivery:v4];
  return v5;
}

- (void)forward:(id)a3 phase:(int64_t)a4 withEvent:(id)a5 fromResponder:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a5;
  id v10 = a6;
  id v11 = v10;
  if ((unint64_t)(a4 - 3) < 2 || a4 == 1)
  {
    id v13 = [(_UIResponderChainFixerUpper *)self _nextResponders];
    if ([v13 count])
    {
      if ([v13 count] == 1)
      {
        uint64_t v14 = [v13 keyEnumerator];
        id v15 = [v14 nextObject];

        id v16 = [v13 objectForKey:v15];
        [(_UIResponderChainFixerUpper *)self _callResponder:v15 phase:a4 components:v16 event:v25];
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id obj = [v13 keyEnumerator];
        uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              BOOL v22 = [(_UIResponderChainFixerUpper *)self currentDelivery];
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __69___UIResponderChainFixerUpper_forward_phase_withEvent_fromResponder___block_invoke;
              v26[3] = &unk_1E52DAD48;
              id v27 = v13;
              uint64_t v28 = v21;
              v29 = self;
              int64_t v31 = a4;
              id v30 = v25;
              [(_UIResponderChainFixerUpper *)self _snapshotDeliveryOfComponents:v24 map:v22 block:v26];
            }
            uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v18);
        }
      }
    }
  }
  else if (!a4)
  {
    id v12 = [v10 nextResponder];
    if (v12)
    {
      [(_UIResponderChainFixerUpper *)self _recordDeliveryOfComponents:v24 toResponder:v12];
      [(_UIResponderChainFixerUpper *)self _callResponder:v12 phase:0 components:v24 event:v25];
    }
  }
}

- (void)_callResponder:(id)a3 phase:(int64_t)a4 components:(id)a5 event:(id)a6
{
  id v15 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 anyObject];
  uint64_t v13 = [v12 _eventComponentType];

  if (v13 == 1)
  {
    switch(a4)
    {
      case 0:
        [v15 pressesBegan:v10 withEvent:v11];
        break;
      case 1:
        [v15 pressesChanged:v10 withEvent:v11];
        goto LABEL_16;
      case 3:
        [v15 pressesEnded:v10 withEvent:v11];
        goto LABEL_16;
      case 4:
        [v15 pressesCancelled:v10 withEvent:v11];
        goto LABEL_16;
      case 5:
LABEL_9:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Invalid phase."];
        goto LABEL_16;
      default:
        goto LABEL_16;
    }
  }
  else if (v13)
  {
    if (a4)
    {
LABEL_16:
      uint64_t v14 = [(_UIResponderChainFixerUpper *)self currentDelivery];
      if ([v14 count]) {
        [(_UIResponderChainFixerUpper *)self forward:v10 phase:a4 withEvent:v11 fromResponder:v15];
      }
    }
  }
  else
  {
    switch(a4)
    {
      case 0:
        [v15 touchesBegan:v10 withEvent:v11];
        break;
      case 1:
        [v15 touchesMoved:v10 withEvent:v11];
        goto LABEL_16;
      case 3:
        [v15 touchesEnded:v10 withEvent:v11];
        goto LABEL_16;
      case 4:
        [v15 touchesCancelled:v10 withEvent:v11];
        goto LABEL_16;
      case 5:
        goto LABEL_9;
      default:
        goto LABEL_16;
    }
  }
}

- (void)_recordDeliveryOfComponents:(id)a3 toResponder:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v12 _eventComponentPhase];
        uint64_t v14 = [v13 value];

        if (v14)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2 object:self file:@"_UIResponderChainFixerUpper.m" lineNumber:372 description:@"Only components in the begin phase can be recorded."];
        }
        id v15 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
        id v16 = [v15 objectForKey:v12];

        uint64_t v17 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
        if (v16)
        {
          [v16 arrayByAddingObject:v7];
        }
        else
        {
          id v25 = v7;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        uint64_t v18 = };
        [v17 setObject:v18 forKey:v12];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)_removeDeliveryRecordForComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 _eventComponentPhase];
        if ([v11 value] != 3 && objc_msgSend(v11, "value") != 4)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"_UIResponderChainFixerUpper.m" lineNumber:387 description:@"Only components in the ended or cancelled phase can be removed."];
        }
        id v12 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
        [v12 removeObjectForKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
    objc_msgSend(v6, "appendFormat:", @"; currently tracking %lu components>\n", objc_msgSend(v9, "count"));

    uint64_t v10 = [(_UIResponderChainFixerUpper *)self recursiveDescription];
    [v6 appendString:v10];
  }
  else
  {
    [v6 appendString:@">"];
  }
  return v6;
}

- (id)recursiveDescription
{
  return [(_UIResponderChainFixerUpper *)self _recursiveDescription:0];
}

- (id)_recursiveDescription:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
    uint64_t v7 = [v6 keyEnumerator];
    uint64_t v8 = [v7 allObjects];
    id v4 = [v5 setWithArray:v8];
  }
  uint64_t v9 = [MEMORY[0x1E4F28E78] string];
  uint64_t v10 = [(_UIResponderChainFixerUpper *)self deliveryRecords];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53___UIResponderChainFixerUpper__recursiveDescription___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v11 = v9;
  id v15 = v11;
  long long v16 = self;
  [(_UIResponderChainFixerUpper *)self _snapshotDeliveryOfComponents:v4 map:v10 block:v14];

  id v12 = v11;
  return v12;
}

- (id)_recursiveDescriptionStep:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = [(_UIResponderChainFixerUpper *)self _nextResponders];
  if ([v5 count])
  {
    uint64_t v6 = [v5 count];
    if (a3 && v6 == 1)
    {
      uint64_t v7 = [v5 keyEnumerator];
      uint64_t v8 = [v7 nextObject];

      uint64_t v9 = (__CFString *)objc_opt_new();
      id v10 = v8;
      if (v10)
      {
        id v11 = NSString;
        id v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        long long v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
      }
      else
      {
        long long v14 = @"(nil)";
      }

      [(__CFString *)v9 appendFormat:@" - %@\n", v14];
      long long v26 = [(_UIResponderChainFixerUpper *)self _recursiveDescriptionStep:a3 + 1];
      [(__CFString *)v9 appendString:v26];
    }
    else
    {
      uint64_t v9 = (__CFString *)objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = [v5 keyEnumerator];
      uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v29 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v19 = [v5 objectForKey:v18];
            [&stru_1ED0E84C0 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];
            long long v21 = v20 = v5;
            [(__CFString *)v9 appendString:v21];

            [(__CFString *)v9 appendString:@" + "];
            long long v22 = objc_opt_new();
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke;
            v35[3] = &unk_1E52FF318;
            id v36 = v22;
            id v23 = v22;
            [v19 enumerateObjectsUsingBlock:v35];
            long long v24 = [v23 componentsJoinedByString:@", "];
            [(__CFString *)v9 appendString:v24];

            [(__CFString *)v9 appendString:@":\n"];
            id v25 = [(_UIResponderChainFixerUpper *)self currentDelivery];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke_2;
            v30[3] = &unk_1E52ED900;
            int64_t v31 = v9;
            uint64_t v32 = v18;
            long long v33 = self;
            unint64_t v34 = a3;
            [(_UIResponderChainFixerUpper *)self _snapshotDeliveryOfComponents:v19 map:v25 block:v30];

            id v5 = v20;
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v16);
      }
    }
  }
  else
  {
    uint64_t v9 = &stru_1ED0E84C0;
  }

  return v9;
}

- (NSMapTable)deliveryRecords
{
  return self->_deliveryRecords;
}

- (NSMapTable)currentDelivery
{
  return self->_currentDelivery;
}

- (void)setCurrentDelivery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDelivery, 0);
  objc_storeStrong((id *)&self->_deliveryRecords, 0);
}

@end