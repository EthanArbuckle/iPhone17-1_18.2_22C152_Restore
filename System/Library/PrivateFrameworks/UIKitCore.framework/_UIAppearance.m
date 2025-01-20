@interface _UIAppearance
+ (BOOL)_hasAnyCustomizations;
+ (BOOL)_hasCustomizationsForClass:(Class)a3 guideClass:(Class)a4;
+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4;
+ (id)_appearanceNodeForClassInfo:(id)a3 containerList:(id)a4;
+ (id)_appearanceWithClassInfo:(id)a3 containerList:(id)a4;
+ (id)_currentAppearanceSource;
+ (id)_newAppearanceWithClassInfo:(id)a3 containerList:(id)a4;
+ (id)_pendingRecordInvocationsForSource:(id)a3;
+ (id)_recorderForSource:(id)a3;
+ (id)_recordersExcludingSource:(id)a3 withWindow:(id)a4;
+ (id)_rootAppearancesNode;
+ (id)_windowsForSource:(id)a3;
+ (id)appearancesAtNode:(id)a3 withObject:(id)a4;
+ (id)recursiveDescription;
+ (void)_addWindow:(id)a3 forSource:(id)a4;
+ (void)_appendDescriptionOfNode:(id)a3 toString:(id)a4 atLevel:(unint64_t)a5;
+ (void)_applyInvocationsTo:(id)a3 window:(id)a4;
+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5;
+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5 onlySystemInvocations:(BOOL)a6;
+ (void)_removeInvocationsForSource:(id)a3;
+ (void)_removeWindow:(id)a3 forSource:(id)a4;
+ (void)_setCurrentAppearanceSource:(id)a3;
+ (void)_setInvalidatesViewsOnAppearanceChange:(BOOL)a3;
- (BOOL)_isRecordingInvocations;
- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3;
- (SEL)_beginListeningForAppearanceEventsForSetter:(SEL)a3;
- (_UIAppearanceCustomizableClassInfo)_customizableClassInfo;
- (id)_appearanceInvocations;
- (id)_traitCollection;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_appendDescriptionToString:(id)a3 atLevel:(unint64_t)a4;
- (void)_handleGetterInvocation:(id)a3;
- (void)_handleSetterInvocation:(id)a3;
- (void)_invalidateAppearanceInWindow:(id)a3;
- (void)_removeInvocationsForSource:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIAppearance

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5
{
}

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = [(_UIAppearanceCustomizableClassInfo *)self->_customizableClassInfo _customizableViewClass];
  return (id)[(objc_class *)v4 instanceMethodSignatureForSelector:a3];
}

+ (id)_appearanceWithClassInfo:(id)a3 containerList:(id)a4
{
  v7 = objc_msgSend(a1, "_appearanceNodeForClassInfo:containerList:");
  v8 = (void *)[v7 objectForKey:@"_UIAppearanceKey"];
  if (!v8)
  {
    v8 = (void *)[a1 _newAppearanceWithClassInfo:a3 containerList:a4];
    [v7 setObject:v8 forKey:@"_UIAppearanceKey"];
  }
  return v8;
}

+ (id)_appearanceNodeForClassInfo:(id)a3 containerList:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  IfNecessary = appearancesNodeInNodeForClassCreateIfNecessary((void *)[a1 _rootAppearancesNode], (uint64_t)a3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(a4);
      }
      if (!IfNecessary) {
        break;
      }
      IfNecessary = appearancesNodeInNodeForClassCreateIfNecessary(IfNecessary, (uint64_t)+[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:*(void *)(*((void *)&v11 + 1) + 8 * v9++) withGuideClass:0]);
      if (v7 == v9)
      {
        uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        return IfNecessary;
      }
    }
  }
  return IfNecessary;
}

+ (void)_applyInvocationsTo:(id)a3 window:(id)a4 matchingSelector:(SEL)a5 onlySystemInvocations:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v11 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", objc_opt_class(), [a3 _appearanceGuideClass]);
  long long v12 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses((uint64_t)+[_UIAppearance _rootAppearancesNode], v11);
  if ([v12 count])
  {
    context = (void *)MEMORY[0x18C108260]();
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v61 = __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke;
    v62 = &unk_1E52F1370;
    id v63 = a1;
    id v64 = a3;
    id v65 = a4;
    id v66 = v14;
    id v32 = v14;
    v33 = v13;
    id v67 = v13;
    SEL v68 = a5;
    __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke((uint64_t)v60, v12, !v6);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (void *)[a3 _appearanceContainer];
    }
    else {
      uint64_t v16 = 0;
    }
    LOBYTE(v37) = v6;
    id object = a3;
    id v43 = v15;
    if (objc_opt_respondsToSelector())
    {
      obuint64_t j = v12;
      do
      {
        id v17 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", objc_opt_class(), [v16 _appearanceGuideClass]);
        v18 = (void *)[v17 _customizableViewClass];
        v36 = v16;
        if (v37) {
          int v37 = 1;
        }
        else {
          int v37 = [v18 _preventsAppearanceProxyCustomization];
        }
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
        if (v40)
        {
          uint64_t v39 = *(void *)v57;
          uint64_t v19 = v37 ^ 1u;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v57 != v39) {
                objc_enumerationMutation(obj);
              }
              uint64_t v41 = v20;
              uint64_t v42 = *(void *)(*((void *)&v56 + 1) + 8 * v20);
              if (![v43 count] || objc_msgSend((id)objc_msgSend(v43, "objectAtIndex:", 0), "count"))
              {
                id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v43 insertObject:v21 atIndex:0];
              }
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              uint64_t v45 = [v43 countByEnumeratingWithState:&v52 objects:v70 count:16];
              if (v45)
              {
                uint64_t v44 = *(void *)v53;
                do
                {
                  uint64_t v22 = 0;
                  do
                  {
                    if (*(void *)v53 != v44) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v46 = v22;
                    v23 = *(void **)(*((void *)&v52 + 1) + 8 * v22);
                    if ([v23 count])
                    {
                      uint64_t v47 = [v23 count];
                      if (v47)
                      {
                        for (uint64_t i = 0; i != v47; ++i)
                        {
                          v25 = (void *)[v23 objectAtIndex:i];
                          long long v48 = 0u;
                          long long v49 = 0u;
                          long long v50 = 0u;
                          long long v51 = 0u;
                          uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v69 count:16];
                          if (v26)
                          {
                            uint64_t v27 = v26;
                            uint64_t v28 = *(void *)v49;
                            do
                            {
                              for (uint64_t j = 0; j != v27; ++j)
                              {
                                if (*(void *)v49 != v28) {
                                  objc_enumerationMutation(v25);
                                }
                                v30 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses(*(void *)(*((void *)&v48 + 1) + 8 * j), v17);
                                if ([v30 count])
                                {
                                  [v23 addObject:v30];
                                  v61((uint64_t)v60, v30, v19);
                                }
                              }
                              uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v69 count:16];
                            }
                            while (v27);
                          }
                        }
                      }
                    }
                    else
                    {
                      v31 = (void *)existingAppearancesNodesInNodeForClassAndSuperclasses(v42, v17);
                      if ([v31 count])
                      {
                        [v23 addObject:v31];
                        v61((uint64_t)v60, v31, v19);
                      }
                    }
                    uint64_t v22 = v46 + 1;
                  }
                  while (v46 + 1 != v45);
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v52 objects:v70 count:16];
                }
                while (v45);
              }
              uint64_t v20 = v41 + 1;
            }
            while (v41 + 1 != v40);
            uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
          }
          while (v40);
        }
        uint64_t v16 = (void *)[v36 _appearanceContainer];
      }
      while ((objc_opt_respondsToSelector() & 1) != 0);
    }
    applyInvocationsToTarget(v32, object);
    if ((v37 & 1) == 0) {
      applyInvocationsToTarget(v33, object);
    }
  }
}

+ (BOOL)_hasCustomizationsForClass:(Class)a3 guideClass:(Class)a4
{
  int v6 = [a1 _hasAnyCustomizations];
  if (v6)
  {
    uint64_t v7 = (void *)[(id)objc_opt_class() _rootAppearancesNode];
    LOBYTE(v6) = existingAppearancesNodeInNodeForClass(v7, +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:a3 withGuideClass:a4]) != 0;
  }
  return v6;
}

+ (BOOL)_hasAnyCustomizations
{
  return __rootAppearances != 0;
}

+ (id)_rootAppearancesNode
{
  id result = (id)__rootAppearances;
  if (!__rootAppearances)
  {
    id result = (id)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    __rootAppearances = (uint64_t)result;
  }
  return result;
}

+ (id)appearancesAtNode:(id)a3 withObject:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  int v6 = (void *)[a3 objectForKey:@"_UIAppearanceKey"];
  if ((dyld_program_sdk_at_least() & 1) == 0 && v6)
  {
    v56[0] = v6;
    uint64_t v7 = (void **)v56;
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"_UIAppearanceHasExtendedAppearancesKey"), "BOOLValue"))
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    if (dyld_program_sdk_at_least())
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      uint64_t v46 = __46___UIAppearance_appearancesAtNode_withObject___block_invoke;
      uint64_t v47 = &unk_1E52F1320;
      id v48 = a3;
      id v49 = a4;
      long long v50 = v6;
      __46___UIAppearance_appearancesAtNode_withObject___block_invoke((uint64_t)v45, @"_UIAppearanceKey");
      uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v9 = [a3 countByEnumeratingWithState:&v41 objects:v55 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(a3);
            }
            uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v8 addObject:v13];
            }
          }
          uint64_t v10 = [a3 countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v10);
      }
      [v8 sortUsingSelector:sel__compare_];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v14 = [v8 countByEnumeratingWithState:&v37 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v8);
            }
            v46((uint64_t)v45, *(void *)(*((void *)&v37 + 1) + 8 * j));
          }
          uint64_t v15 = [v8 countByEnumeratingWithState:&v37 objects:v54 count:16];
        }
        while (v15);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v18 = [a3 countByEnumeratingWithState:&v33 objects:v53 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(a3);
            }
            uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([v22 isEqualToString:@"_UIAppearanceKey"] & 1) == 0
              && ([v22 isEqualToString:@"_UIAppearanceHasExtendedAppearancesKey"] & 1) == 0)
            {
              v46((uint64_t)v45, (uint64_t)v22);
            }
          }
          uint64_t v19 = [a3 countByEnumeratingWithState:&v33 objects:v53 count:16];
        }
        while (v19);
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v24 = [a3 countByEnumeratingWithState:&v29 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v30;
        do
        {
          for (uint64_t m = 0; m != v25; ++m)
          {
            if (*(void *)v30 != v26) {
              objc_enumerationMutation(a3);
            }
            uint64_t v28 = (void *)[a3 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * m)];
            if ((objc_opt_respondsToSelector() & 1) != 0
              && [v28 _isValidAppearanceForCustomizableObject:a4])
            {
              [v6 addObject:v28];
            }
          }
          uint64_t v25 = [a3 countByEnumeratingWithState:&v29 objects:v52 count:16];
        }
        while (v25);
      }
    }
  }
  else if (v6)
  {
    long long v51 = v6;
    uint64_t v7 = &v51;
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  return v6;
}

- (void)_handleSetterInvocation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (const char *)[a3 selector];
  int v6 = NSStringFromSelector(v5);
  uint64_t v7 = [(_UIAppearanceCustomizableClassInfo *)self->_customizableClassInfo _customizableViewClass];
  if (!self->_appearanceInvocations) {
    self->_appearanceInvocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v8 = UIAppearancePrefixedSelectorForSelectorString(v6);
  objc_msgSend(a3, "setSelector:", -[_UIAppearance _beginListeningForAppearanceEventsForSetter:](self, "_beginListeningForAppearanceEventsForSetter:", v5));
  objc_msgSend(a3, "setTarget:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  [a3 retainArguments];
  [(NSMutableArray *)self->_appearanceInvocations addObject:a3];
  if (__isSettingUpSystemAppearanceProxyModifications == 1) {
    objc_setAssociatedObject(a3, &_MergedGlobals_1088, (id)[NSNumber numberWithBool:1], (void *)3);
  }
  uint64_t v9 = [(id)objc_opt_class() _currentAppearanceSource];
  if ([(_UIAppearance *)self _isRecordingInvocations])
  {
    uint64_t v10 = (void *)[(id)objc_opt_class() _pendingRecordInvocationsForSource:v9];
    if ((-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", [a3 selector]) & 1) == 0) {
      int v6 = NSStringFromSelector(v8);
    }
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v6, @"_UIAppearanceWrapperKeySelector", a3, @"_UIAppearanceWrapperKeyInvocation", v7, @"_UIAppearanceWrapperKeyClass", 0);
    long long v12 = v11;
    containerList = self->_containerList;
    if (containerList) {
      [v11 setObject:containerList forKey:@"_UIAppearanceWrapperKeyContainerClasses"];
    }
    id v14 = [(_UIAppearance *)self _traitCollection];
    if (v14) {
      [v12 setObject:v14 forKey:@"_UIAppearanceWrapperKeyTraitCollection"];
    }
    [v10 addObject:v12];
  }
  if (v9)
  {
    invocationSources = self->_invocationSources;
    if (!invocationSources)
    {
      invocationSources = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:0];
      self->_invocationSources = invocationSources;
    }
    [(NSMapTable *)invocationSources setObject:v9 forKey:a3];
  }
  if (byte_1EB260D59)
  {
    id v16 = (id)[(id)objc_opt_class() _windowsForSource:v9];
    if (!v16) {
      id v16 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          [(_UIAppearance *)self _invalidateAppearanceInWindow:*(void *)(*((void *)&v21 + 1) + 8 * v20++)];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v18);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"_UIAppearanceInvocationsDidChangeNotification", self);
}

- (SEL)_beginListeningForAppearanceEventsForSetter:(SEL)a3
{
  v3 = a3;
  int v6 = NSStringFromSelector(a3);
  uint64_t v7 = UIAppearancePrefixedSelectorForSelectorString(v6);
  uint64_t v8 = [(_UIAppearanceCustomizableClassInfo *)self->_customizableClassInfo _customizableViewClass];
  uint64_t v9 = _classWithImplementationOfSelector(v8, v7, 0);
  uint64_t v10 = _classWithImplementationOfSelector(v8, v3, 1);
  if (v9 != v10)
  {
    uint64_t v11 = v10;
    if (v9 && (!v10 || [(objc_class *)v9 isSubclassOfClass:v10]))
    {
      if ([[(NSString *)v6 substringToIndex:1] isEqualToString:@"_"])
      {
        long long v12 = [(NSString *)v6 substringFromIndex:1];
      }
      else
      {
        long long v12 = (NSString *)[@"_" stringByAppendingString:v6];
      }
      v3 = NSSelectorFromString(v12);
      if (_classWithImplementationOfSelector(v8, v3, 1) != v9) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIAppearance.m", 1502, @"Bad selector setup for -[%@ %@]", NSStringFromClass(v8), v6);
      }
    }
    else
    {
      [(objc_class *)v11 _installAppearanceSwizzlesForSetter:v6];
    }
  }
  return v3;
}

+ (id)_currentAppearanceSource
{
  return (id)__currentAppearanceSource;
}

+ (id)_windowsForSource:(id)a3
{
  return (id)[(id)__appearanceSourceWindows objectForKey:a3];
}

- (id)_traitCollection
{
  return 0;
}

- (BOOL)_isRecordingInvocations
{
  return (__isSettingUpSystemAppearanceProxyModifications & 1) == 0;
}

+ (id)_pendingRecordInvocationsForSource:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  id v4 = (id)__pendingRecordInvocations;
  if (!__pendingRecordInvocations)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __pendingRecordInvocations = (uint64_t)v4;
  }
  id v5 = (id)[v4 objectForKey:v3];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(id)__pendingRecordInvocations setObject:v5 forKey:v3];
  }
  return v5;
}

+ (id)_newAppearanceWithClassInfo:(id)a3 containerList:(id)a4
{
  int v6 = objc_alloc_init((Class)a1);
  v6[4] = a3;
  v6[1] = [a4 copy];
  return v6;
}

- (void)_invalidateAppearanceInWindow:(id)a3
{
  id v4 = [(_UIAppearanceCustomizableClassInfo *)self->_customizableClassInfo _customizableViewClass];
  [a3 _invalidateAppearanceForSubviewsOfClass:v4];
}

- (void)_handleGetterInvocation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[a3 methodSignature];
  int v6 = NSStringFromSelector((SEL)[a3 selector]);
  unint64_t v7 = [v5 numberOfArguments];
  if ([(NSString *)v6 characterAtIndex:0] == 95) {
    int v6 = [(NSString *)v6 substringFromIndex:1];
  }
  if (v7 < 3)
  {
    uint64_t v11 = [(NSString *)v6 stringByAppendingString:@":"];
  }
  else
  {
    uint64_t v8 = [(NSString *)v6 rangeOfString:@"For"];
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      while (1)
      {
        int v10 = [(NSString *)v6 characterAtIndex:v9 + 3];
        if (v10 == -[NSString characterAtIndex:](-[NSString uppercaseString](-[NSString substringWithRange:](v6, "substringWithRange:", v9 + 3, 1), "uppercaseString"), "characterAtIndex:", 0))break; {
        uint64_t v9 = [(NSString *)v6 rangeOfString:@"For", 0, v9 + 1, [(NSString *)v6 length] - (v9 + 1) options range];
        }
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }
    uint64_t v11 = (NSString *)[NSString stringWithFormat:@"%@:f%@", -[NSString substringToIndex:](v6, "substringToIndex:", v9), -[NSString substringFromIndex:](v6, "substringFromIndex:", v9 + 1)];
  }
  uint64_t v12 = [NSString stringWithFormat:@"set%@%@", -[NSString uppercaseString](-[NSString substringToIndex:](v11, "substringToIndex:", 1), "uppercaseString"), -[NSString substringFromIndex:](v11, "substringFromIndex:", 1)];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  long long v21 = __Block_byref_object_copy__106;
  long long v22 = __Block_byref_object_dispose__106;
  uint64_t v23 = 0;
  appearanceInvocations = self->_appearanceInvocations;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41___UIAppearance__handleGetterInvocation___block_invoke;
  v17[3] = &unk_1E52F1398;
  v17[7] = &v18;
  v17[8] = v7;
  v17[4] = v12;
  v17[5] = a3;
  v17[6] = v5;
  [(NSMutableArray *)appearanceInvocations enumerateObjectsWithOptions:2 usingBlock:v17];
  size_t v14 = [v5 methodReturnLength];
  unint64_t v15 = v14;
  memset(v24, 0, sizeof(v24));
  if (v14 < 0x21) {
    id v16 = v24;
  }
  else {
    id v16 = malloc_type_calloc(v14, 1uLL, 0x100004077774924uLL);
  }
  [(id)v19[5] getArgument:v16 atIndex:2];
  [a3 setReturnValue:v16];
  if (v15 >= 0x21) {
    free(v16);
  }
  _Block_object_dispose(&v18, 8);
}

- (void)forwardInvocation:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnLength"))
  {
    [(_UIAppearance *)self _handleGetterInvocation:a3];
  }
  else
  {
    [(_UIAppearance *)self _handleSetterInvocation:a3];
  }
}

+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4
{
  id v6 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:a3 withGuideClass:0];
  return (id)[a1 _appearanceWithClassInfo:v6 containerList:a4];
}

+ (void)_setInvalidatesViewsOnAppearanceChange:(BOOL)a3
{
  byte_1EB260D59 = a3;
}

- (id)_appearanceInvocations
{
  return self->_appearanceInvocations;
}

+ (void)_setCurrentAppearanceSource:(id)a3
{
  __currentAppearanceSource = [a3 copyWithZone:0];
}

+ (void)_addWindow:(id)a3 forSource:(id)a4
{
  id v6 = (id)__appearanceSourceWindows;
  if (!__appearanceSourceWindows)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __appearanceSourceWindows = (uint64_t)v6;
  }
  unint64_t v7 = (void *)[v6 objectForKey:a4];
  if (!v7)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    [(id)__appearanceSourceWindows setObject:v7 forKey:a4];
  }
  [v7 addObject:a3];
}

+ (void)_removeWindow:(id)a3 forSource:(id)a4
{
  id v5 = (void *)[(id)__appearanceSourceWindows objectForKey:a4];
  [v5 removeObject:a3];
}

+ (id)_recorderForSource:(id)a3
{
  if (qword_1EB260D98 != -1) {
    dispatch_once(&qword_1EB260D98, &__block_literal_global_458_1);
  }
  if (!byte_1EB260D5B) {
    return 0;
  }
  if (!a3) {
    a3 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  if (qword_1EB260D78 != -1) {
    dispatch_once(&qword_1EB260D78, &__block_literal_global_276);
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  int v10 = __Block_byref_object_copy__106;
  uint64_t v11 = __Block_byref_object_dispose__106;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36___UIAppearance__recorderForSource___block_invoke_107;
  v6[3] = &unk_1E52EBC10;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)qword_1EB260D70, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)_recordersExcludingSource:(id)a3 withWindow:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54___UIAppearance__recordersExcludingSource_withWindow___block_invoke;
  v9[3] = &unk_1E52F12F8;
  v9[4] = a3;
  v9[5] = a1;
  v9[6] = a4;
  v9[7] = v7;
  [(id)__pendingRecordInvocations enumerateKeysAndObjectsUsingBlock:v9];
  return v7;
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  return 1;
}

+ (void)_removeInvocationsForSource:(id)a3
{
  id v4 = (void *)[(id)objc_opt_class() _rootAppearancesNode];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___UIAppearance__removeInvocationsForSource___block_invoke;
  v5[3] = &unk_1E52F1348;
  v5[4] = a3;
  _enumerateAppearancesHelper(v4, (uint64_t)v5);
}

- (void)_removeInvocationsForSource:(id)a3
{
  if ([(NSMapTable *)self->_invocationSources count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_appearanceInvocations count];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSMutableArray *)self->_appearanceInvocations objectAtIndex:i];
        if (objc_msgSend(-[NSMapTable objectForKey:](self->_invocationSources, "objectForKey:", v7), "isEqual:", a3))
        {
          [v8 addIndex:i];
          [(NSMapTable *)self->_invocationSources removeObjectForKey:v7];
        }
      }
    }
    [(NSMutableArray *)self->_appearanceInvocations removeObjectsAtIndexes:v8];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAppearance;
  [(_UIAppearance *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  customizableClassInfo = self->_customizableClassInfo;
  if (self->_containerList) {
    uint64_t v7 = (__CFString *)[NSString stringWithFormat:@" when contained in %@", self->_containerList];
  }
  else {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  return (id)[v3 stringWithFormat:@"<%@:%p> %@%@ with invocations %@>", v5, self, customizableClassInfo, v7, self->_appearanceInvocations];
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_appearanceInvocations;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v22)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v7 = a4 + 1;
        if (a4 != -1)
        {
          do
          {
            [a3 appendString:@"    "];
            --v7;
          }
          while (v7);
        }
        id v8 = objc_msgSend(MEMORY[0x1E4F28FE8], "scannerWithString:", NSStringFromSelector((SEL)objc_msgSend(v6, "selector")));
        id v26 = 0;
        [v8 scanUpToString:@"s" intoString:0];
        [v8 scanString:@"set" intoString:0];
        [v8 scanUpToString:@":" intoString:&v26];
        [v8 scanString:@":" intoString:0];
        uint64_t v9 = objc_msgSend((id)objc_msgSend(v26, "substringToIndex:", 1), "lowercaseString");
        int v10 = objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(v26, "substringFromIndex:", 1));
        uint64_t v25 = 0;
        id v26 = v10;
        [v6 getArgument:&v25 atIndex:2];
        if (*(unsigned char *)objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "getArgumentTypeAtIndex:", 2) == 64) {
          [a3 appendFormat:@"%@ = %@", v26, v25];
        }
        else {
          [a3 appendFormat:@"%@ = %ld", v26, v25];
        }
        unint64_t v11 = objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "numberOfArguments");
        if (v11 >= 4)
        {
          unint64_t v12 = v11;
          for (uint64_t j = 3; j != v12; ++j)
          {
            id v24 = 0;
            [v8 scanUpToString:@":" intoString:&v24];
            [v8 scanString:@":" intoString:0];
            uint64_t v23 = 0;
            [v6 getArgument:&v23 atIndex:j];
            if (j == 3)
            {
              [a3 appendString:@" for "];
              size_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "substringFromIndex:", 3), "substringToIndex:", 1), "lowercaseString");
              id v15 = (id)objc_msgSend(v14, "stringByAppendingString:", objc_msgSend(v24, "substringFromIndex:", 4));
              id v24 = v15;
            }
            else
            {
              [a3 appendString:@", "];
              id v15 = v24;
            }
            [a3 appendFormat:@"%@ = %ld", v15, v23];
          }
        }
        id v16 = [(NSMapTable *)self->_invocationSources objectForKey:v6];
        uint64_t v17 = @" pid";
        if (!v16) {
          uint64_t v17 = &stru_1ED0E84C0;
        }
        [a3 appendFormat:@" (source%@ = %@)\n", v17, v16];
      }
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }
}

+ (void)_appendDescriptionOfNode:(id)a3 toString:(id)a4 atLevel:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a3;
    a3 = 0;
  }
  else
  {
    id v8 = (id)[a3 objectForKey:@"_UIAppearanceKey"];
  }
  [v8 _appendDescriptionToString:a4 atLevel:a5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = (id)[a3 keyEnumerator];
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = @"_UIAppearanceKey";
    uint64_t v12 = *(void *)v26;
    unint64_t v24 = a5 + 1;
    do
    {
      uint64_t v13 = 0;
      uint64_t v22 = v10;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        size_t v14 = *(__CFString **)(*((void *)&v25 + 1) + 8 * v13);
        if (v14 != v11 && v14 != @"_UIAppearanceHasExtendedAppearancesKey")
        {
          uint64_t v16 = v12;
          uint64_t v17 = v11;
          id v18 = a3;
          uint64_t v19 = [a3 objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * v13)];
          for (unint64_t i = v24; i; --i)
            [a4 appendString:@"    "];
          [a4 appendFormat:@"-> when contained in %@\n", v14];
          [a1 _appendDescriptionOfNode:v19 toString:a4 atLevel:v24];
          a3 = v18;
          unint64_t v11 = v17;
          uint64_t v12 = v16;
          uint64_t v10 = v22;
        }
        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
}

+ (id)recursiveDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[a1 _rootAppearancesNode];
  id v4 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v5 = (void *)[v3 keyEnumerator];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(__CFString **)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 != @"_UIAppearanceKey")
        {
          [v4 appendFormat:@"%@\n", *(void *)(*((void *)&v12 + 1) + 8 * v9)];
          objc_msgSend(a1, "_appendDescriptionOfNode:toString:atLevel:", objc_msgSend(v3, "objectForKey:", v10), v4, 0);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  if ([v4 length]) {
    return v4;
  }
  else {
    return @"No appearance invocations have been saved.";
  }
}

- (_UIAppearanceCustomizableClassInfo)_customizableClassInfo
{
  return self->_customizableClassInfo;
}

@end