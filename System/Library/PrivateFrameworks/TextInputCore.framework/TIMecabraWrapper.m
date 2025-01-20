@interface TIMecabraWrapper
- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(__CFURL *)a4 creationOptions:(unint64_t)a5;
- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(id)a4 creationOptionsDictionary:(id)a5;
- (__Mecabra)mecabraRef;
- (int)inputMethodType;
- (void)dealloc;
@end

@implementation TIMecabraWrapper

- (__Mecabra)mecabraRef
{
  return self->_mecabraRef;
}

- (int)inputMethodType
{
  return self->_inputMethodType;
}

- (void)dealloc
{
  if (self->_mecabraRef)
  {
    v3 = mecabraCreationQueue();
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __27__TIMecabraWrapper_dealloc__block_invoke;
    v8 = &unk_1E6E2DE00;
    v9 = self;
    TIDispatchSync();
  }
  v4.receiver = self;
  v4.super_class = (Class)TIMecabraWrapper;
  [(TIMecabraWrapper *)&v4 dealloc];
}

uint64_t __27__TIMecabraWrapper_dealloc__block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4180D28](*(void *)(*(void *)(a1 + 32) + 16));
}

- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(id)a4 creationOptionsDictionary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIMecabraWrapper;
  v10 = [(TIMecabraWrapper *)&v20 init];
  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v11 = mecabraCreationQueue();
  id v14 = v9;
  id v15 = v8;
  TIDispatchSync();

  v12 = v17;
  if (v17[3])
  {
    v10->_inputMethodType = a3;
    v10->_mecabraRef = (__Mecabra *)v12[3];

    _Block_object_dispose(&v16, 8);
LABEL_4:

    return v10;
  }
  result = (TIMecabraWrapper *)_os_crash();
  __break(1u);
  return result;
}

void __101__TIMecabraWrapper_initWithInputMethodType_learningDictionaryDirectoryURL_creationOptionsDictionary___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) mutableCopy];
  v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  [v4 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4FBA710]];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FBA700]];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = MecabraCreate();
}

- (TIMecabraWrapper)initWithInputMethodType:(int)a3 learningDictionaryDirectoryURL:(__CFURL *)a4 creationOptions:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TIMecabraWrapper;
  uint64_t v6 = [(TIMecabraWrapper *)&v14 init];
  if (!v6) {
    return v6;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7 = mecabraCreationQueue();
  TIDispatchSync();

  id v8 = v11;
  if (v11[3])
  {
    v6->_inputMethodType = a3;
    v6->_mecabraRef = (__Mecabra *)v8[3];
    _Block_object_dispose(&v10, 8);
    return v6;
  }
  result = (TIMecabraWrapper *)_os_crash();
  __break(1u);
  return result;
}

uint64_t __91__TIMecabraWrapper_initWithInputMethodType_learningDictionaryDirectoryURL_creationOptions___block_invoke(uint64_t a1)
{
  uint64_t result = MecabraCreateWithOptions();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end