@interface _UIAppearanceRecorder
+ (id)_sharedAppearanceRecorder;
+ (id)_sharedAppearanceRecorderForClass:(Class)a3 whenContainedIn:(id)a4;
+ (id)_sharedAppearanceRecorderForClassNamed:(id)a3 superclass:(Class)a4 whenContainedIn:(id)a5;
- (Class)_superclassToRecord;
- (NSArray)_containerClassNames;
- (NSData)_serializedRepresentation;
- (NSString)_classNameToRecord;
- (_UIAppearanceRecorder)init;
- (_UIAppearanceRecorder)initWithSerializedRepresentation:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_applyCustomizations;
- (void)_importCustomizations:(id)a3 withArchiveVersion:(int64_t)a4;
- (void)_recordInvocation:(id)a3 withClassName:(id)a4 containerClassNames:(id)a5 traitCollection:(id)a6 selectorString:(id)a7 forRemoteProcess:(BOOL)a8;
- (void)_setClassNameToRecord:(id)a3;
- (void)_setContainerClassNames:(id)a3;
- (void)_setSuperclassToRecord:(Class)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIAppearanceRecorder

- (void)_importCustomizations:(id)a3 withArchiveVersion:(int64_t)a4
{
  if (a4 == 1) {
    self->_unarchivedCustomizations = (NSArray *)a3;
  }
  else {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIAppearance.m", 2137, @"Can't import customizations with archive version %ld", a4);
  }
}

- (_UIAppearanceRecorder)initWithSerializedRepresentation:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIAppearanceRecorder;
  v5 = [(_UIAppearanceRecorder *)&v10 init];
  if (v5)
  {
    if (a3)
    {
      id v9 = 0;
      v6 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v9];
      if (!v6)
      {
        v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, v5, @"UIAppearance.m", 2165, @"Encountered error attempting to deserialize customizations: %@", objc_msgSend(v9, "localizedDescription") object file lineNumber description];
      }
      if (objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"_UIARAVersionKey"), "integerValue") == 1) {
        -[_UIAppearanceRecorder _importCustomizations:withArchiveVersion:](v5, "_importCustomizations:withArchiveVersion:", [v6 objectForKey:@"_UIARACustomizationsKey"], 1);
      }
    }
    else
    {
      v5->_customizations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  return v5;
}

- (_UIAppearanceRecorder)init
{
  return [(_UIAppearanceRecorder *)self initWithSerializedRepresentation:0];
}

+ (id)_sharedAppearanceRecorder
{
  id v3 = (id)_sharedAppearanceRecorder_sharedAppearance;
  if (!_sharedAppearanceRecorder_sharedAppearance)
  {
    id v3 = objc_alloc_init((Class)a1);
    _sharedAppearanceRecorder_sharedAppearance = (uint64_t)v3;
  }
  [v3 _setClassNameToRecord:0];
  [(id)_sharedAppearanceRecorder_sharedAppearance _setSuperclassToRecord:0];
  [(id)_sharedAppearanceRecorder_sharedAppearance _setContainerClassNames:0];
  return (id)_sharedAppearanceRecorder_sharedAppearance;
}

+ (id)_sharedAppearanceRecorderForClassNamed:(id)a3 superclass:(Class)a4 whenContainedIn:(id)a5
{
  v8 = (void *)[a1 _sharedAppearanceRecorder];
  [v8 _setClassNameToRecord:a3];
  [v8 _setSuperclassToRecord:a4];
  [v8 _setContainerClassNames:a5];
  return v8;
}

+ (id)_sharedAppearanceRecorderForClass:(Class)a3 whenContainedIn:(id)a4
{
  v6 = NSStringFromClass(a3);
  return (id)[a1 _sharedAppearanceRecorderForClassNamed:v6 superclass:0 whenContainedIn:a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAppearanceRecorder;
  [(_UIAppearanceRecorder *)&v3 dealloc];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Class superclassToRecord = self->_superclassToRecord;
  if (!superclassToRecord) {
    Class superclassToRecord = NSClassFromString(self->_classNameToRecord);
  }
  return (id)[(objc_class *)superclassToRecord instanceMethodSignatureForSelector:a3];
}

- (void)_recordInvocation:(id)a3 withClassName:(id)a4 containerClassNames:(id)a5 traitCollection:(id)a6 selectorString:(id)a7 forRemoteProcess:(BOOL)a8
{
  BOOL v50 = a8;
  v12 = self;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIAppearance.m", 2367, @"No class to record");
  }
  v48 = (NSString *)a7;
  if ([(NSArray *)v12->_unarchivedCustomizations count])
  {
    v12->_customizations = (NSMutableArray *)[(NSArray *)v12->_unarchivedCustomizations mutableCopy];

    v12->_unarchivedCustomizations = 0;
  }
  v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "numberOfArguments") < 3)
  {
LABEL_87:
    v38 = v48;
    if (!v48) {
      v38 = NSStringFromSelector((SEL)[a3 selector]);
    }
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a4, @"_UIARACustomizationsClassNameKey", v38, @"_UIARACustomizationsSelectorNameKey", v13, @"_UIARACustomizationsArgsKey", 0);
    v40 = v39;
    if (a5) {
      [v39 setObject:a5 forKey:@"_UIARACustomizationsContainerClassNamesKey"];
    }
    if (a6) {
      objc_msgSend(v40, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", a6, 1, 0), @"_UIARACustomizationsTraitCollectionArchiveKey");
    }
    [(NSMutableArray *)v12->_customizations addObject:v40];

    return;
  }
  uint64_t v14 = 2;
  uint64_t v15 = *(void *)off_1E52D2040;
  uint64_t v16 = *(void *)off_1E52D2238;
  uint64_t v52 = *(void *)off_1E52D2048;
  id v45 = a5;
  id v46 = a6;
  id v47 = a3;
  v51 = v13;
  while (1)
  {
    v17 = (const char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "getArgumentTypeAtIndex:", v14);
    if (!strcmp(v17, "@"))
    {
      id v57 = 0;
      [a3 getArgument:&v57 atIndex:v14];
      if (!v57)
      {
        id v24 = 0;
        goto LABEL_43;
      }
      v19 = (void *)qword_1EB260DA8;
      if (!qword_1EB260DA8)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v21 = objc_opt_class();
        uint64_t v42 = objc_opt_class();
        uint64_t v43 = objc_opt_class();
        a5 = v45;
        a6 = v46;
        v19 = objc_msgSend(v20, "initWithObjects:", v21, v42, v43, objc_opt_class(), 0);
        qword_1EB260DA8 = (uint64_t)v19;
      }
      if ([v19 count])
      {
        unint64_t v22 = 1;
        do
        {
          [v19 objectAtIndex:v22 - 1];
          char isKindOfClass = objc_opt_isKindOfClass();
          if (v22 >= [v19 count]) {
            break;
          }
          ++v22;
        }
        while ((isKindOfClass & 1) == 0);
        a3 = v47;
        if (isKindOfClass)
        {
          id v24 = v57;
LABEL_43:
          v25 = @"_UIARACustomizationArgsHintIsPlistType";
          goto LABEL_47;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = @"_UIARACustomizationArgsHintIsUIImage";
        }
        else {
          v25 = @"_UIARACustomizationArgsHintIsUIColor";
        }
        if (v50 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          uint64_t v26 = [v57 _serializedData];
        }
        else {
          uint64_t v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v57 requiringSecureCoding:1 error:0];
        }
        id v24 = (id)v26;
LABEL_47:
        uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"id", @"_UIARACustomizationArgsObjCTypeKey", v25, @"_UIARACustomizationArgsHintKey", v24, @"_UIARACustomizationArgsRepresentationKey", 0);
LABEL_48:
        v13 = v51;
        goto LABEL_81;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v27 = 0;
        goto LABEL_48;
      }
      uint64_t v28 = objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](NSStringFromSelector((SEL)objc_msgSend(a3, "selector")), "componentsSeparatedByString:", @":"), "objectAtIndex:", 0), "rangeOfString:", @"TitleTextAttributes");
      uint64_t v27 = 0;
      v13 = v51;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v24 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", 0);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v29 = (void *)[v57 allKeys];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (!v30)
        {
          v25 = @"_UIARACustomizationArgsHintIsUITextAttribute";
          a5 = v45;
          a6 = v46;
          goto LABEL_47;
        }
        uint64_t v31 = v30;
        v44 = v12;
        uint64_t v32 = *(void *)v54;
        while (2)
        {
          uint64_t v33 = 0;
LABEL_55:
          if (*(void *)v54 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v53 + 1) + 8 * v33);
          if (([v34 isEqual:v15] & 1) != 0
            || ([v34 isEqual:v16] & 1) != 0
            || ([v34 isEqual:v52] & 1) != 0
            || ([v34 isEqual:@"Font"] & 1) != 0
            || ([v34 isEqual:@"TextColor"] & 1) != 0
            || ([v34 isEqual:@"NSColor"] & 1) != 0
            || ([v34 isEqual:@"TextShadowColor"] & 1) != 0
            || [v34 isEqual:@"NSFont"])
          {
            v35 = (NSString *)objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(v57, "objectForKey:", v34), 1, 0);
            goto LABEL_66;
          }
          if ([v34 isEqual:@"TextShadowOffset"])
          {
            objc_msgSend((id)objc_msgSend(v57, "objectForKey:", v34), "UIOffsetValue");
            v35 = NSStringFromUIOffset(v61);
LABEL_66:
            [v24 setObject:v35 forKey:v34];
          }
          else
          {
            v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Appearance", &qword_1EB260DA0) + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.top) = 138412290;
              *(void *)((char *)&buf.top + 4) = v34;
              _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "Unknown key, \"%@\" in title text attributes dictionary. Ignoring.", (uint8_t *)&buf, 0xCu);
            }
          }
          if (v31 == ++v33)
          {
            uint64_t v37 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
            uint64_t v31 = v37;
            if (!v37)
            {
              v25 = @"_UIARACustomizationArgsHintIsUITextAttribute";
              v12 = v44;
              a5 = v45;
              a6 = v46;
              a3 = v47;
              goto LABEL_47;
            }
            continue;
          }
          goto LABEL_55;
        }
      }
    }
    else
    {
      if (!strcmp(v17, "{CGPoint=dd}"))
      {
        memset(&buf, 0, 16);
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"CGPoint", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromCGPoint(*(CGPoint *)&buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "{CGSize=dd}"))
      {
        memset(&buf, 0, 16);
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"CGSize", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromCGSize(*(CGSize *)&buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "{UIOffset=dd}"))
      {
        memset(&buf, 0, 16);
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"UIOffset", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromUIOffset(*(UIOffset *)&buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
      {
        memset(&buf, 0, sizeof(buf));
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"CGRect", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromCGRect((CGRect)buf), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "{UIEdgeInsets=dddd}"))
      {
        memset(&buf, 0, sizeof(buf));
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"UIEdgeInsets", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromUIEdgeInsets(buf), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "d") || !strcmp(v17, "f"))
      {
        buf.top = 0.0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"double", @"_UIARACustomizationArgsObjCTypeKey", objc_msgSend(NSNumber, "numberWithDouble:", buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "Q") || !strcmp(v17, "q"))
      {
        buf.top = 0.0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"NSUInteger", @"_UIARACustomizationArgsObjCTypeKey", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)&buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "I") || !strcmp(v17, "i"))
      {
        LODWORD(buf.top) = 0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"unsigned int", @"_UIARACustomizationArgsObjCTypeKey", objc_msgSend(NSNumber, "numberWithUnsignedInt:", LODWORD(buf.top)), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "B"))
      {
        LOBYTE(buf.top) = 0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"BOOL", @"_UIARACustomizationArgsObjCTypeKey", objc_msgSend(NSNumber, "numberWithUnsignedInt:", LOBYTE(buf.top)), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else if (!strcmp(v17, "c"))
      {
        LOBYTE(buf.top) = 0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"char", @"_UIARACustomizationArgsObjCTypeKey", objc_msgSend(NSNumber, "numberWithUnsignedInt:", SLOBYTE(buf.top)), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      else
      {
        if (strcmp(v17, "#")) {
          break;
        }
        buf.top = 0.0;
        [a3 getArgument:&buf atIndex:v14];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Class", @"_UIARACustomizationArgsObjCTypeKey", NSStringFromClass(*(Class *)&buf.top), @"_UIARACustomizationArgsRepresentationKey", 0);
      }
      uint64_t v27 = v18;
    }
LABEL_81:
    if (!v27) {
      break;
    }
    objc_msgSend(v13, "addObject:");
    if (++v14 >= (unint64_t)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "numberOfArguments")) {
      goto LABEL_87;
    }
  }
  if (!v50 && !v13)
  {
    v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[_UIAppearanceRecorder _recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:]"), @"UIAppearance.m", 2384, @"Failed to record argument %lu of invocation %@", v14, a3 file lineNumber description];
  }
}

- (void)forwardInvocation:(id)a3
{
  v5 = [(_UIAppearanceRecorder *)self _classNameToRecord];
  containerClassNames = self->_containerClassNames;
  [(_UIAppearanceRecorder *)self _recordInvocation:a3 withClassName:v5 containerClassNames:containerClassNames traitCollection:0 selectorString:0 forRemoteProcess:0];
}

- (void)_applyCustomizations
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  unarchivedCustomizations = (NSMutableArray *)self->_unarchivedCustomizations;
  if (!unarchivedCustomizations) {
    unarchivedCustomizations = self->_customizations;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v73 = [(NSMutableArray *)unarchivedCustomizations countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v73)
  {
    uint64_t v72 = *(void *)v86;
    uint64_t v78 = *MEMORY[0x1E4F1C3C8];
    uint64_t v74 = *(void *)off_1E52D2040;
    objc_super v3 = @"_UIARACustomizationArgsObjCTypeKey";
    uint64_t v66 = *(void *)off_1E52D2048;
    uint64_t v67 = *(void *)off_1E52D2238;
    obj = unarchivedCustomizations;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v86 != v72) {
          objc_enumerationMutation(obj);
        }
        v77 = *(void **)(*((void *)&v85 + 1) + 8 * v4);
        v5 = (NSString *)[v77 objectForKey:@"_UIARACustomizationsClassNameKey"];
        Class v6 = NSClassFromString(v5);
        Class v7 = v6;
        if (v6 && ([(objc_class *)v6 conformsToProtocol:&unk_1ED402D00] & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v78, @"*** Invalid class for appearance customization: %@", v7 format];
        }
        uint64_t v8 = [v77 objectForKey:@"_UIARACustomizationsSelectorNameKey"];
        SEL v9 = NSSelectorFromString((NSString *)[v77 objectForKey:@"_UIARACustomizationsSelectorNameKey"]);
        if (v7) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          goto LABEL_138;
        }
        v11 = v9;
        if (![(objc_class *)v7 instancesRespondToSelector:v9]) {
          goto LABEL_138;
        }
        if (os_variant_has_internal_diagnostics())
        {
          v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppearanceRecorderSecurity", &qword_1EB260DB0) + 8);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543618;
            *(void *)((char *)&buf.origin.x + 4) = v5;
            WORD2(buf.origin.y) = 2114;
            *(void *)((char *)&buf.origin.y + 6) = v8;
            _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking untrusted customization, -[%{public}@ %{public}@]", (uint8_t *)&buf, 0x16u);
          }
        }
        v12 = (void *)[(objc_class *)v7 instanceMethodSignatureForSelector:v11];
        v75 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v12];
        [v75 setSelector:v11];
        unint64_t v80 = [v12 numberOfArguments];
        if (v80 <= 2) {
          [MEMORY[0x1E4F1CA00] raise:v78, @"*** Invalid selector for appearance customization: %@", NSStringFromSelector(v11) format];
        }
        aSelector = v11;
        Class v68 = v7;
        v79 = (void *)[v77 objectForKey:@"_UIARACustomizationsArgsKey"];
        if ([v79 count] != v80 - 2) {
          [MEMORY[0x1E4F1CA00] raise:v78 format:@"*** Number of arguments in appearance customization data does not match method signature"];
        }
        v13 = (const char *)[v12 getArgumentTypeAtIndex:2];
        uint64_t v14 = (void *)[v79 objectAtIndexedSubscript:0];
        uint64_t v15 = (void *)[v14 objectForKey:v3];
        if (os_variant_has_internal_diagnostics())
        {
          v63 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppearanceRecorderSecurity", &qword_1EB260DB8) + 8);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543618;
            *(void *)((char *)&buf.origin.x + 4) = v15;
            WORD2(buf.origin.y) = 2082;
            *(void *)((char *)&buf.origin.y + 6) = v13;
            _os_log_impl(&dword_1853B0000, v63, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the third argument type, %{public}@, for expected property type, %{public}s", (uint8_t *)&buf, 0x16u);
          }
        }
        v76 = v12;
        if (strcmp(v13, "@"))
        {
          if (!strcmp(v13, "q") || !strcmp(v13, "Q"))
          {
            uint64_t v16 = @"NSUInteger";
            if (![v15 isEqualToString:@"NSUInteger"]) {
              goto LABEL_97;
            }
            Class v17 = (Class)objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "unsignedIntegerValue");
LABEL_40:
            *(void *)&buf.origin.CGFloat x = v17;
            goto LABEL_86;
          }
          if (strcmp(v13, "i") && strcmp(v13, "I"))
          {
            if (!strcmp(v13, "d") || !strcmp(v13, "f"))
            {
              uint64_t v16 = @"double";
              if (![v15 isEqualToString:@"double"]) {
                goto LABEL_97;
              }
              objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "doubleValue");
              buf.origin.CGFloat x = v22;
              goto LABEL_86;
            }
            if (!strcmp(v13, "{CGPoint=dd}"))
            {
              uint64_t v16 = @"CGPoint";
              if (![v15 isEqualToString:@"CGPoint"]) {
                goto LABEL_97;
              }
              CGPoint v41 = CGPointFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
              CGFloat y = v41.y;
              CGFloat x = v41.x;
            }
            else if (!strcmp(v13, "{CGSize=dd}"))
            {
              uint64_t v16 = @"CGSize";
              if (![v15 isEqualToString:@"CGSize"]) {
                goto LABEL_97;
              }
              CGSize v42 = CGSizeFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
              CGFloat y = v42.height;
              CGFloat x = v42.width;
            }
            else
            {
              if (strcmp(v13, "{UIOffset=dd}"))
              {
                if (!strcmp(v13, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
                {
                  uint64_t v16 = @"CGRect";
                  if (![v15 isEqualToString:@"CGRect"]) {
                    goto LABEL_97;
                  }
                  CGRect v99 = CGRectFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
                }
                else
                {
                  if (strcmp(v13, "{UIEdgeInsets=dddd}"))
                  {
                    if (!strcmp(v13, "B"))
                    {
                      uint64_t v16 = @"BOOL";
                      if (![v15 isEqualToString:@"BOOL"]) {
                        goto LABEL_97;
                      }
                      LOBYTE(buf.origin.x) = objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "BOOLValue");
                      goto LABEL_86;
                    }
                    if (strcmp(v13, "c"))
                    {
                      if (strcmp(v13, "#"))
                      {
                        [MEMORY[0x1E4F1CA00] raise:v78, @"*** Invalid property type, %s, for appearance customization: %@", v13, NSStringFromSelector(aSelector) format];
                        uint64_t v16 = 0;
LABEL_97:
                        [MEMORY[0x1E4F1CA00] raise:v78, @"*** Property type for appearance customization data (%@) does not match method signature. Expected %@", v15, v16 format];
                        goto LABEL_98;
                      }
                      uint64_t v16 = @"Class";
                      if (![v15 isEqualToString:@"Class"]) {
                        goto LABEL_97;
                      }
                      Class v17 = NSClassFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
                      goto LABEL_40;
                    }
                    uint64_t v21 = v15;
                    uint64_t v16 = @"char";
                    goto LABEL_46;
                  }
                  uint64_t v16 = @"UIEdgeInsets";
                  if (![v15 isEqualToString:@"UIEdgeInsets"]) {
                    goto LABEL_97;
                  }
                  CGRect v99 = (CGRect)UIEdgeInsetsFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
                }
                CGRect buf = v99;
                goto LABEL_86;
              }
              uint64_t v16 = @"UIOffset";
              if (![v15 isEqualToString:@"UIOffset"]) {
                goto LABEL_97;
              }
              UIOffset v43 = UIOffsetFromString((NSString *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"]);
              CGFloat y = v43.vertical;
              CGFloat x = v43.horizontal;
            }
            buf.origin.CGFloat x = x;
            buf.origin.CGFloat y = y;
            goto LABEL_86;
          }
          uint64_t v21 = v15;
          uint64_t v16 = @"unsigned int";
LABEL_46:
          if (![v21 isEqualToString:v16]) {
            goto LABEL_97;
          }
          LODWORD(buf.origin.x) = objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "unsignedIntValue");
LABEL_86:
          [v75 setArgument:&buf atIndex:2];
LABEL_98:
          v19 = v76;
          goto LABEL_99;
        }
        uint64_t v16 = @"id";
        if (![v15 isEqualToString:@"id"]) {
          goto LABEL_97;
        }
        uint64_t v18 = (void *)[v14 objectForKey:@"_UIARACustomizationArgsHintKey"];
        v19 = v76;
        if (os_variant_has_internal_diagnostics())
        {
          v64 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppearanceRecorderSecurity", &qword_1EB260DC0) + 8);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.origin.x) = 138543362;
            *(void *)((char *)&buf.origin.x + 4) = v18;
            _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the hint for a third-argument type of id, %{public}@]", (uint8_t *)&buf, 0xCu);
          }
        }
        if ([v18 isEqual:@"_UIARACustomizationArgsHintIsPlistType"])
        {
          uint64_t v20 = [v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"];
          goto LABEL_51;
        }
        if (([v18 isEqual:@"_UIARACustomizationArgsHintIsUIImage"] & 1) != 0
          || [v18 isEqual:@"_UIARACustomizationArgsHintIsUIColor"])
        {
          [v18 isEqual:@"_UIARACustomizationArgsHintIsUIImage"];
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(v14, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), 0);
LABEL_51:
          *(void *)&buf.origin.CGFloat x = v20;
          if (!v20) {
            goto LABEL_99;
          }
LABEL_52:
          [v75 setArgument:&buf atIndex:2];
          goto LABEL_99;
        }
        if (![v18 isEqual:@"_UIARACustomizationArgsHintIsUITextAttribute"]) {
          goto LABEL_99;
        }
        v23 = (void *)[v14 objectForKey:@"_UIARACustomizationArgsRepresentationKey"];
        id v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v71 = (id)[v23 allKeys];
        uint64_t v25 = [v71 countByEnumeratingWithState:&v90 objects:v97 count:16];
        if (!v25) {
          goto LABEL_77;
        }
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v91;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v91 != v27) {
              objc_enumerationMutation(v71);
            }
            v29 = *(void **)(*((void *)&v90 + 1) + 8 * v28);
            if (([v29 isEqual:v74] & 1) != 0
              || ([v29 isEqual:@"Font"] & 1) != 0
              || ([v29 isEqual:@"NSFont"] & 1) != 0
              || ([v29 isEqual:v67] & 1) != 0
              || ([v29 isEqual:v66] & 1) != 0
              || ([v29 isEqual:@"TextColor"] & 1) != 0
              || ([v29 isEqual:@"NSColor"] & 1) != 0
              || [v29 isEqual:@"TextShadowColor"])
            {
              uint64_t v30 = objc_opt_class();
              uint64_t v31 = v3;
              uint64_t v32 = (void *)MEMORY[0x1E4F28DC0];
              uint64_t v33 = [v23 objectForKey:v29];
              v34 = v32;
              objc_super v3 = v31;
              v19 = v76;
              uint64_t v35 = [v34 unarchivedObjectOfClass:v30 fromData:v33 error:0];
              if (!v35) {
                goto LABEL_71;
              }
              goto LABEL_70;
            }
            if ([v29 isEqual:@"TextShadowOffset"])
            {
              v36 = (void *)MEMORY[0x1E4F29238];
              UIOffset v89 = UIOffsetFromString((NSString *)[v23 objectForKey:v29]);
              uint64_t v35 = [v36 valueWithBytes:&v89 objCType:"{UIOffset=dd}"];
LABEL_70:
              [v24 setObject:v35 forKey:v29];
              goto LABEL_71;
            }
            uint64_t v37 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
            [v37 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSInvocation *_invocationFromCustomizationRaiseForUnexpectedData(NSDictionary *, Class *)"), @"UIAppearance.m", 2521, @"Unknown key, \"%@\" in title text attributes dictionary", v29 file lineNumber description];
LABEL_71:
            ++v28;
          }
          while (v26 != v28);
          uint64_t v38 = [v71 countByEnumeratingWithState:&v90 objects:v97 count:16];
          uint64_t v26 = v38;
        }
        while (v38);
LABEL_77:
        *(void *)&buf.origin.CGFloat x = v24;
        if (v24) {
          goto LABEL_52;
        }
LABEL_99:
        if (v80 >= 4)
        {
          for (uint64_t i = 3; v80 != i; ++i)
          {
            id v45 = (const char *)[v19 getArgumentTypeAtIndex:i];
            id v46 = (void *)[v79 objectAtIndexedSubscript:i - 2];
            id v47 = (void *)[v46 objectForKey:v3];
            if (os_variant_has_internal_diagnostics())
            {
              v48 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppearanceRecorderSecurity", &qword_1EB260DC8) + 8);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.origin.x) = 134218498;
                *(void *)((char *)&buf.origin.x + 4) = i + 1;
                WORD2(buf.origin.y) = 2114;
                *(void *)((char *)&buf.origin.y + 6) = v47;
                HIWORD(buf.size.width) = 2082;
                *(void *)&buf.size.height = v45;
                _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_DEFAULT, "Appearance Recorder is checking the %luth argument type, %{public}@, for expected property type, %{public}s", (uint8_t *)&buf, 0x20u);
              }
            }
            if (!strcmp(v45, "q") || !strcmp(v45, "Q"))
            {
              if (![v47 isEqualToString:@"NSUInteger"]) {
                goto LABEL_112;
              }
              buf.origin.CGFloat x = 0.0;
              *(void *)&buf.origin.CGFloat x = objc_msgSend((id)objc_msgSend(v46, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "unsignedIntegerValue");
            }
            else
            {
              if (strcmp(v45, "i") && strcmp(v45, "I"))
              {
                [MEMORY[0x1E4F1CA00] raise:v78, @"*** Invalid axis type, %s, for appearance customization, %@", v45, NSStringFromSelector(aSelector) format];
LABEL_112:
                [MEMORY[0x1E4F1CA00] raise:v78, @"*** Axis type, %s, for appearance customization data is not integer", v45 format];
                continue;
              }
              if (![v47 isEqualToString:@"unsigned int"]) {
                goto LABEL_112;
              }
              LODWORD(buf.origin.x) = 0;
              LODWORD(buf.origin.x) = objc_msgSend((id)objc_msgSend(v46, "objectForKey:", @"_UIARACustomizationArgsRepresentationKey"), "unsignedIntValue");
            }
            [v75 setArgument:&buf atIndex:i];
          }
        }
        if (!v75) {
          goto LABEL_138;
        }
        v49 = (void *)[v77 objectForKey:@"_UIARACustomizationsContainerClassNamesKey"];
        uint64_t v50 = [v77 objectForKey:@"_UIARACustomizationsTraitCollectionArchiveKey"];
        if (!v50)
        {
          uint64_t v55 = [v49 count];
          Class v53 = v68;
          if (v55)
          {
            uint64_t v51 = 0;
LABEL_124:
            long long v56 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v57 = [v49 countByEnumeratingWithState:&v81 objects:v94 count:16];
            if (!v57)
            {
LABEL_132:
              if (v51) {
                id v54 = +[_UITraitBasedAppearance _appearanceForTraitCollection:v51 forClass:v68 withContainerList:v56];
              }
              else {
                id v54 = (id)[(objc_class *)v68 _appearanceWhenContainedIn:v56];
              }
              goto LABEL_136;
            }
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v82;
LABEL_126:
            uint64_t v60 = 0;
            while (1)
            {
              if (*(void *)v82 != v59) {
                objc_enumerationMutation(v49);
              }
              Class v61 = NSClassFromString(*(NSString **)(*((void *)&v81 + 1) + 8 * v60));
              if (!v61) {
                goto LABEL_138;
              }
              [v56 addObject:v61];
              if (v58 == ++v60)
              {
                uint64_t v58 = [v49 countByEnumeratingWithState:&v81 objects:v94 count:16];
                if (v58) {
                  goto LABEL_126;
                }
                goto LABEL_132;
              }
            }
          }
LABEL_134:
          id v54 = (id)[(objc_class *)v53 appearance];
          goto LABEL_136;
        }
        uint64_t v51 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v50 error:0];
        uint64_t v52 = [v49 count];
        Class v53 = v68;
        if (v52) {
          goto LABEL_124;
        }
        if (!v51) {
          goto LABEL_134;
        }
        id v54 = (id)[(objc_class *)v68 appearanceForTraitCollection:v51];
LABEL_136:
        if (v54) {
          [v75 invokeWithTarget:v54];
        }
LABEL_138:
        ++v4;
      }
      while (v4 != v73);
      uint64_t v65 = [(NSMutableArray *)obj countByEnumeratingWithState:&v85 objects:v95 count:16];
      uint64_t v73 = v65;
    }
    while (v65);
  }
}

- (NSData)_serializedRepresentation
{
  id v8 = 0;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"_UIARAVersionKey", self->_customizations, @"_UIARACustomizationsKey", 0);
  v5 = (NSData *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v8];
  if (!v5)
  {
    Class v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIAppearance.m", 2725, @"Encountered error attempting to serialize customizations: %@", objc_msgSend(v8, "localizedDescription") object file lineNumber description];
  }
  return v5;
}

- (NSString)_classNameToRecord
{
  return self->_classNameToRecord;
}

- (void)_setClassNameToRecord:(id)a3
{
}

- (Class)_superclassToRecord
{
  return self->_superclassToRecord;
}

- (void)_setSuperclassToRecord:(Class)a3
{
  self->_Class superclassToRecord = a3;
}

- (NSArray)_containerClassNames
{
  return self->_containerClassNames;
}

- (void)_setContainerClassNames:(id)a3
{
}

@end