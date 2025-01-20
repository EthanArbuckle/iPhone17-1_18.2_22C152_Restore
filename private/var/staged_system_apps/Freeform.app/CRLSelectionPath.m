@interface CRLSelectionPath
+ (CRLSelectionPath)selectionPathWithSelectionArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CRLSelectionPath)initWithSelectionArray:(id)a3;
- (CRLSelectionPath)selectionPathWithAppendedSelection:(id)a3;
- (CRLSelectionPath)selectionPathWithAppendedSelections:(id)a3;
- (NSArray)orderedSelections;
- (NSString)UUIDDescription;
- (id)description;
- (id)leastSpecificSelectionOfClass:(Class)a3;
- (id)mostSpecificSelectionConformingToProtocol:(id)a3;
- (id)mostSpecificSelectionOfClass:(Class)a3;
- (id)selectionAtIndex:(unint64_t)a3;
- (id)selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:(id)a3;
- (id)selectionPathPoppingOffSelection:(id)a3;
- (id)selectionPathPoppingToSelection:(id)a3;
- (id)selectionPathReplacingMostSpecificLocationOfSelection:(id)a3 withSelection:(id)a4;
- (unint64_t)hash;
- (unint64_t)indexForSelection:(id)a3;
- (void)enumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3;
- (void)enumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3;
@end

@implementation CRLSelectionPath

- (CRLSelectionPath)initWithSelectionArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLSelectionPath;
  v5 = [(CRLSelectionPath *)&v9 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = +[NSArray array];
    }
    v6 = (NSArray *)[v4 copy];
    currentSelection = v5->_currentSelection;
    v5->_currentSelection = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLSelectionPath *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [v5[1] count];
      if (v6 == (id)[(NSArray *)self->_currentSelection count])
      {
        if ([(NSArray *)self->_currentSelection count])
        {
          unint64_t v7 = 0;
          do
          {
            v8 = [(NSArray *)self->_currentSelection objectAtIndexedSubscript:v7];
            objc_super v9 = [v5[1] objectAtIndexedSubscript:v7];
            unsigned __int8 v10 = [v8 isEqual:v9];

            if ((v10 & 1) == 0) {
              break;
            }
            ++v7;
          }
          while (v7 < [(NSArray *)self->_currentSelection count]);
        }
        else
        {
          unsigned __int8 v10 = 1;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSArray *)self->_currentSelection hash];
}

- (NSArray)orderedSelections
{
  return self->_currentSelection;
}

- (id)selectionAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_currentSelection count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500270);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD134();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500290);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    unint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionAtIndex:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 68, 0, "Requested selection index %tu is out of range!", a3);

    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_currentSelection objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)indexForSelection:(id)a3
{
  return [(NSArray *)self->_currentSelection indexOfObjectIdenticalTo:a3];
}

+ (CRLSelectionPath)selectionPathWithSelectionArray:(id)a3
{
  id v3 = a3;
  id v4 = [[CRLSelectionPath alloc] initWithSelectionArray:v3];

  return v4;
}

- (CRLSelectionPath)selectionPathWithAppendedSelection:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    id v4 = a3;
    v5 = +[NSArray arrayWithObjects:&v8 count:1];

    -[CRLSelectionPath selectionPathWithAppendedSelections:](self, "selectionPathWithAppendedSelections:", v5, v8);
    id v6 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = self;
  }

  return v6;
}

- (CRLSelectionPath)selectionPathWithAppendedSelections:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015002B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD268();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015002D0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathWithAppendedSelections:]");
    unint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 92, 0, "invalid nil value for '%{public}s'", "selections");
  }
  if (![v4 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015002F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD1E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500310);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathWithAppendedSelections:]");
    unsigned __int8 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:93 isFatal:0 description:"Must send in some selection to append"];
  }
  v11 = [(CRLSelectionPath *)self orderedSelections];
  id v12 = [v11 mutableCopy];

  [v12 addObjectsFromArray:v4];
  v13 = +[CRLSelectionPath selectionPathWithSelectionArray:v12];

  return (CRLSelectionPath *)v13;
}

- (id)selectionPathPoppingOffSelection:(id)a3
{
  id v4 = a3;
  v5 = [(CRLSelectionPath *)self orderedSelections];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 indexOfObjectIdenticalTo:v4];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500330);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD300();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500350);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathPoppingOffSelection:]");
    unsigned __int8 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:102 isFatal:0 description:"Cannot pop to selection that is not in a selection path."];
  }
  else
  {
    [v6 crl_trimObjectsFromIndex:v7];
  }
  v11 = +[CRLSelectionPath selectionPathWithSelectionArray:v6];

  return v11;
}

- (id)selectionPathPoppingToSelection:(id)a3
{
  id v4 = a3;
  v5 = [(CRLSelectionPath *)self orderedSelections];
  id v6 = [v5 mutableCopy];

  id v7 = (char *)[v6 indexOfObjectIdenticalTo:v4];
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500370);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD388();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500390);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathPoppingToSelection:]");
    unsigned __int8 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:112 isFatal:0 description:"Cannot pop to selection that is not in a selection path."];
  }
  else if (v7 < (char *)[v6 count] - 1)
  {
    [v6 crl_trimObjectsFromIndex:v7 + 1];
  }
  v11 = +[CRLSelectionPath selectionPathWithSelectionArray:v6];

  return v11;
}

- (id)selectionPathReplacingMostSpecificLocationOfSelection:(id)a3 withSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015003B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD4A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015003D0);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 120, 0, "invalid nil value for '%{public}s'", "oldSelection");

    if (v8) {
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  if (!v7)
  {
LABEL_17:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015003F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD410();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500410);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 121, 0, "invalid nil value for '%{public}s'", "newSelection");

LABEL_26:
    v18 = self;
    goto LABEL_38;
  }
  NSUInteger v9 = [(NSArray *)self->_currentSelection count];
  if ((uint64_t)(v9 - 1) < 0) {
    goto LABEL_28;
  }
  uint64_t v10 = v9;
  while (1)
  {
    id v11 = [(NSArray *)self->_currentSelection objectAtIndexedSubscript:--v10];
    if (v11 == v6) {
      break;
    }

    if (v10 <= 0) {
      goto LABEL_28;
    }
  }
  id v19 = [(NSArray *)self->_currentSelection mutableCopy];
  [v19 replaceObjectAtIndex:v10 withObject:v8];
  v20 = +[CRLSelectionPath selectionPathWithSelectionArray:v19];

  v21 = v20;
  if (!v20)
  {
LABEL_28:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500430);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD540();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500450);
    }
    v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]");
    v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"];
    +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:137 isFatal:0 description:"Cannot replace a selection that is not in the selection path."];

    v20 = 0;
    v21 = self;
  }
  v18 = v21;

LABEL_38:

  return v18;
}

- (id)selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CRLSelectionPath *)self orderedSelections];
    id v6 = [v5 mutableCopy];

    id v7 = [v6 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 replaceObjectAtIndex:[v6 count] - 1 withObject:v4];
    }
    else {
      [v6 addObject:v4];
    }
    id v8 = +[CRLSelectionPath selectionPathWithSelectionArray:v6];
  }
  else
  {
    id v8 = self;
  }

  return v8;
}

- (id)mostSpecificSelectionOfClass:(Class)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(NSArray *)self->_currentSelection reverseObjectEnumerator];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            goto LABEL_12;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_12:
  }
  else
  {
    id v9 = [(NSArray *)self->_currentSelection lastObject];
  }

  return v9;
}

- (id)mostSpecificSelectionConformingToProtocol:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSArray *)self->_currentSelection reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 conformsToProtocol:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)leastSpecificSelectionOfClass:(Class)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = self->_currentSelection;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            goto LABEL_12;
          }
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_12:
  }
  else
  {
    id v9 = [(NSArray *)self->_currentSelection firstObject];
  }

  return v9;
}

- (void)enumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSArray *)self->_currentSelection reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSArray *)self->_currentSelection objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)description
{
  id v3 = sub_10003F328(self->_currentSelection);
  id v4 = +[NSString stringWithFormat:@"<CRLSelectionPath: %p  %@>", self, v3];

  return v4;
}

- (NSString)UUIDDescription
{
  id v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSArray *)self->_currentSelection objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) UUIDDescription];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v10 = sub_10003F328(v3);
  long long v11 = +[NSString stringWithFormat:@"<CRLSelectionPath: %@>", v10];

  return (NSString *)v11;
}

- (void).cxx_destruct
{
}

@end