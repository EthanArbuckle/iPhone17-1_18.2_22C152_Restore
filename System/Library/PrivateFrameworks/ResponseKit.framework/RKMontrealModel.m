@interface RKMontrealModel
+ (id)modelForLanguage:(id)a3;
+ (id)pathForLanguage:(id)a3;
- (RKMontrealModel)initWithPath:(id)a3;
- (void)dealloc;
- (void)model;
- (void)reset;
@end

@implementation RKMontrealModel

+ (id)modelForLanguage:(id)a3
{
  v4 = [a1 pathForLanguage:a3];
  pthread_mutex_lock(&+[RKMontrealModel modelForLanguage:]::lock);
  v5 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
  if (!+[RKMontrealModel modelForLanguage:]::instances)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:5 capacity:1];
    v7 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
    +[RKMontrealModel modelForLanguage:]::instances = v6;

    v5 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
  }
  v8 = [v5 objectForKey:v4];
  if (!v8)
  {
    uint64_t v9 = [objc_alloc((Class)a1) initWithPath:v4];
    if (v9)
    {
      v8 = (void *)v9;
      [(id)+[RKMontrealModel modelForLanguage:]::instances setObject:v9 forKey:v4];
    }
    else
    {
      v8 = 0;
    }
  }
  pthread_mutex_unlock(&+[RKMontrealModel modelForLanguage:]::lock);

  return v8;
}

- (RKMontrealModel)initWithPath:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_10;
  }
  if (-[RKMontrealModel initWithPath:]::once != -1) {
    dispatch_once(&-[RKMontrealModel initWithPath:]::once, &__block_literal_global_7);
  }
  v8.receiver = self;
  v8.super_class = (Class)RKMontrealModel;
  self = [(RKMontrealModel *)&v8 init];
  if (!self || !-[RKMontrealModel initWithPath:]::montrealIsLoaded) {
    goto LABEL_9;
  }
  uint64_t v9 = @"fileLocation";
  v10[0] = v4;
  v5 = (void *)((uint64_t (*)(uint64_t))weak_MRLModelCreate)([NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1]);
  self->_model = v5;
  if (!v5)
  {
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (weak_MRLModelGetOutputSize() != 5) {
    __assert_rtn("-[RKMontrealModel initWithPath:]", "RKEventIdentifier.mm", 130, "outputSize == RKEventIDCount");
  }
  weak_MRLModelSetMaxSequenceLength(self->_model, (kMaxSequenceLength + 1));
LABEL_9:
  self = self;
  uint64_t v6 = self;
LABEL_11:

  return v6;
}

void *__32__RKMontrealModel_initWithPath___block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/Montreal.framework/Montreal", 1);
  if (result)
  {
    v1 = result;
    weak_MRLModelCreate = dlsym(result, "MRLModelCreate");
    weak_MRLModelGetIOMappings = dlsym(v1, "MRLModelGetIOMappings");
    weak_MRLModelGetOutputSize = (uint64_t (*)(void))dlsym(v1, "MRLModelGetOutputSize");
    weak_MRLModelSetMaxSequenceLength = (uint64_t (*)(void, void))dlsym(v1, "MRLModelSetMaxSequenceLength");
    weak_MRLModelStateCreate = dlsym(v1, "MRLModelStateCreate");
    weak_MRLModelStateSave = (uint64_t)dlsym(v1, "MRLModelStateSave");
    weak_MRLModelStateRestore = (uint64_t)dlsym(v1, "MRLModelStateRestore");
    weak_MRLModelRecognizeIncremental = (uint64_t)dlsym(v1, "MRLModelRecognizeIncremental");
    weak_MRLModelRecognize = (uint64_t)dlsym(v1, "MRLModelRecognize");
    weak_MRLModelRecognizeSequence = dlsym(v1, "MRLModelRecognize");
    weak_MRLModelReset = (uint64_t (*)(void))dlsym(v1, "MRLModelReset");
    weak_MRLModelRelease = dlsym(v1, "MRLModelRelease");
    result = dlsym(v1, "MRLModelStateRelease");
    weak_MRLModelStateRelease = result;
    if (weak_MRLModelCreate) {
      BOOL v2 = weak_MRLModelReset == 0;
    }
    else {
      BOOL v2 = 1;
    }
    char v14 = !v2
       && weak_MRLModelRelease != 0
       && weak_MRLModelGetIOMappings != 0
       && weak_MRLModelRecognizeIncremental != 0
       && weak_MRLModelRecognize != 0
       && weak_MRLModelRecognizeSequence != 0
       && weak_MRLModelGetOutputSize != 0
       && weak_MRLModelSetMaxSequenceLength != 0
       && weak_MRLModelStateCreate != 0
       && weak_MRLModelStateSave != 0
       && weak_MRLModelStateRestore != 0
       && result != 0;
    -[RKMontrealModel initWithPath:]::montrealIsLoaded = v14;
  }
  return result;
}

- (void)dealloc
{
  model = self->_model;
  if (model) {
    weak_MRLModelRelease(model, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)RKMontrealModel;
  [(RKMontrealModel *)&v4 dealloc];
}

- (void)reset
{
  if (self->_model) {
    weak_MRLModelReset();
  }
}

+ (id)pathForLanguage:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v3];

  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  uint64_t v6 = [@"Polarity-" stringByAppendingString:v4];
  v7 = [v6 stringByAppendingString:@".lstm"];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  id v8 = v7;
  v13 = v8;
  LDEnumerateAssetDataItems();
  uint64_t v9 = (void *)v15[5];
  if (v9)
  {
    v10 = objc_msgSend(v9, "path", v12, 3221225472, __35__RKMontrealModel_pathForLanguage___block_invoke, &unk_2642D2A58, v8, &v14);
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __35__RKMontrealModel_pathForLanguage___block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const void *a5, unsigned char *a6)
{
  PathComponent = (__CFString *)CFURLCopyLastPathComponent(url);
  if (PathComponent
    && CFEqual(a5, (CFTypeRef)*MEMORY[0x263F517A0])
    && [(__CFString *)PathComponent isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v10 = [(__CFURL *)url copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a6 = 1;
  }
}

- (void)model
{
  return self->_model;
}

@end