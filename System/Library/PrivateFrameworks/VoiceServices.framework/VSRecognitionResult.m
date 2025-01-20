@interface VSRecognitionResult
+ (id)recognitionResultWithModelIdentifier:(id)a3 classIdentifiers:(id)a4 values:(id)a5;
+ (void)initialize;
- (BOOL)getElementClassIdentifier:(id *)a3 value:(id *)a4 atIndex:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (VSRecognitionResult)init;
- (VSRecognitionResult)retain;
- (id)createHandler;
- (id)description;
- (id)modelIdentifier;
- (id)recognitionAction;
- (id)recognitionResultByReplacingValueForClassIdentifier:(id)a3 withValue:(id)a4;
- (id)valueOfFirstElementWithClassIdentifier:(id)a3;
- (int64_t)elementCount;
- (void)setRecognitionAction:(id)a3;
@end

@implementation VSRecognitionResult

- (id)description
{
  v2 = (__CFString *)CFCopyDescription(self);
  return v2;
}

- (id)recognitionAction
{
  return self[6].super.isa;
}

- (void)setRecognitionAction:(id)a3
{
  self[6].super.isa = (Class)a3;
}

- (id)createHandler
{
  CFStringRef isa = (const __CFString *)self[5].super.isa;
  if (!isa) {
    return 0;
  }
  aClassName = 0;
  CFTypeRef cf = 0;
  if (!VSRecognitionPluginStringCopyInfo(isa, (CFURLRef *)&cf, (CFStringRef *)&aClassName)) {
    return 0;
  }
  v3 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", objc_msgSend((id)cf, "path"));
  if (!v3) {
    goto LABEL_10;
  }
  [v3 load];
  Class v4 = NSClassFromString(aClassName);
  v5 = v4;
  if (v4)
  {
    if ([(objc_class *)v4 conformsToProtocol:&unk_26C1C7430]
      && (([(objc_class *)v5 instancesRespondToSelector:sel_actionForRecognitionResult_] & 1) != 0
       || [(objc_class *)v5 instancesRespondToSelector:sel_actionForRecognitionResults_]))
    {
      v5 = (objc_class *)objc_alloc_init(v5);
      goto LABEL_11;
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  if (aClassName) {
    CFRelease(aClassName);
  }
  return v5;
}

- (id)valueOfFirstElementWithClassIdentifier:(id)a3
{
  uint64_t v5 = [(VSRecognitionResult *)self elementCount];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    v10 = 0;
    id v11 = 0;
    uint64_t v7 = 1;
    while (1)
    {
      if ([(VSRecognitionResult *)self getElementClassIdentifier:&v11 value:&v10 atIndex:v7 - 1])
      {
        if ([v11 isEqualToString:a3]) {
          id result = v10;
        }
        else {
          id result = 0;
        }
        if (result) {
          return result;
        }
      }
      else
      {
        id result = 0;
      }
      if (v7++ >= v6) {
        return result;
      }
    }
  }
  return 0;
}

- (BOOL)getElementClassIdentifier:(id *)a3 value:(id *)a4 atIndex:(int64_t)a5
{
  if (a3 && !*a3) {
    return 0;
  }
  if (a4) {
    return *a4 != 0;
  }
  return 1;
}

- (int64_t)elementCount
{
  int64_t result = (int64_t)self[3].super.isa;
  if (result) {
    return CFArrayGetCount((CFArrayRef)result);
  }
  return result;
}

- (id)modelIdentifier
{
  return self[4].super.isa;
}

- (id)recognitionResultByReplacingValueForClassIdentifier:(id)a3 withValue:(id)a4
{
  Class isa = self[2].super.isa;
  CFRetain(isa);
  Class v8 = self[3].super.isa;
  CFRetain(v8);
  uint64_t v9 = [(objc_class *)isa count];
  BOOL v10 = [(objc_class *)v8 count] != v9 || v9 < 1;
  v21 = self;
  if (!v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (objc_msgSend((id)-[objc_class objectAtIndex:](isa, "objectAtIndex:", v12), "isEqualToString:", a3))
      {
        if (v14)
        {
          if (!a4) {
            goto LABEL_12;
          }
        }
        else
        {
          v14 = (void *)[(objc_class *)v8 mutableCopy];
          if (!a4)
          {
LABEL_12:
            if (!v13) {
              v13 = (void *)[(objc_class *)isa mutableCopy];
            }
            [v13 removeObjectAtIndex:v12 - v11];
            [v14 removeObjectAtIndex:v12 - v11++];
            goto LABEL_15;
          }
        }
        [v14 replaceObjectAtIndex:v12 withObject:a4];
      }
LABEL_15:
      if (v9 == ++v12) {
        goto LABEL_16;
      }
    }
  }
  v14 = 0;
  v13 = 0;
LABEL_16:

  if (v14)
  {
    v15 = objc_opt_class();
    uint64_t v16 = [(VSRecognitionResult *)v21 modelIdentifier];
    if (v13) {
      Class v17 = (Class)v13;
    }
    else {
      Class v17 = isa;
    }
    v18 = (void *)[v15 recognitionResultWithModelIdentifier:v16 classIdentifiers:v17 values:v14];

    return v18;
  }
  else
  {
    v20 = v21;
    return v20;
  }
}

- (VSRecognitionResult)retain
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && CFEqual(self, a3) != 0;
}

- (VSRecognitionResult)init
{
  return 0;
}

+ (id)recognitionResultWithModelIdentifier:(id)a3 classIdentifiers:(id)a4 values:(id)a5
{
  uint64_t v5 = VSRecognitionResultCreateWithHandlerInfo(*MEMORY[0x263EFFB08], a3, a4, (CFArrayRef)a5, 0);
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    pthread_once(&VSRecognitionResultGetTypeID___VSRecognitionResultRegisterOnce, (void (*)(void))_VSRecognitionResultRegisterClass);
  }
}

@end