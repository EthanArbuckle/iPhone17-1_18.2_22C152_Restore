@interface TIKeyboardLayoutFactory
+ (id)layoutsFileName;
+ (id)sharedKeyboardFactory;
- (NSMutableDictionary)internalCache;
- (TIKeyboardLayoutFactory)init;
- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4;
- (id)keyboardWithName:(id)a3 inCache:(id)a4;
- (void)layoutsLibraryHandle;
- (void)setInternalCache:(id)a3;
@end

@implementation TIKeyboardLayoutFactory

- (void).cxx_destruct
{
}

- (void)setInternalCache:(id)a3
{
}

- (NSMutableDictionary)internalCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)layoutsLibraryHandle
{
  return self->_layoutsLibraryHandle;
}

- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (*)(BOOL, double))dlsym(-[TIKeyboardLayoutFactory layoutsLibraryHandle](self, "layoutsLibraryHandle"), (const char *)[@"UIKBGetKeyboardPrefixForWidthAndEdge" UTF8String]);
  if (v6)
  {
    v6(v4, a3);
    v6 = (void (*)(BOOL, double))objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)keyboardWithName:(id)a3 inCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      v9 = [(TIKeyboardLayoutFactory *)self internalCache];

      if (!v9)
      {
        v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:100];
        [(TIKeyboardLayoutFactory *)self setInternalCache:v10];
      }
      v8 = [(TIKeyboardLayoutFactory *)self internalCache];
    }
    v11 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    v12 = [@"UIKBBuildTreeNamed_" stringByAppendingString:v11];

    v13 = [(TIKeyboardLayoutFactory *)self layoutsLibraryHandle];
    id v14 = v12;
    v15 = (void (*)(void *))dlsym(v13, (const char *)[v14 UTF8String]);
    if (v15)
    {
      v16 = v15(v8);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (TIKeyboardLayoutFactory)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardLayoutFactory;
  v2 = [(TIKeyboardLayoutFactory *)&v7 init];
  if (v2)
  {
    v3 = +[TIKeyboardLayoutFactory layoutsFileName];
    id v4 = [@"/System/Library/PrivateFrameworks/TextInputUI.framework" stringByAppendingPathComponent:v3];
    v5 = dlopen((const char *)[v4 fileSystemRepresentation], 1);
    v2->_layoutsLibraryHandle = v5;
    if (!v5) {
      NSLog(&cfstr_SUnableToLoadK.isa, "-[TIKeyboardLayoutFactory init]", v4);
    }
  }
  return v2;
}

+ (id)layoutsFileName
{
  v2 = (void *)MGCopyAnswer();
  if (v2)
  {
    v3 = [NSString stringWithFormat:@"KBLayouts_%@.dylib", v2];
    if (([(__CFString *)v3 isEqualToString:@"KBLayouts_iPod.dylib"] & 1) == 0)
    {
      if (v3) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_6:

    v3 = @"KBLayouts_iPhone.dylib";
    goto LABEL_8;
  }
  v3 = 0;
  if ([0 isEqualToString:@"KBLayouts_iPod.dylib"]) {
    goto LABEL_6;
  }
LABEL_7:
  v3 = @"KBLayouts_iPad.dylib";
LABEL_8:

  return v3;
}

+ (id)sharedKeyboardFactory
{
  if (sharedKeyboardFactory_onceToken != -1) {
    dispatch_once(&sharedKeyboardFactory_onceToken, &__block_literal_global_5769);
  }
  v2 = (void *)sharedKeyboardFactory_instance;

  return v2;
}

uint64_t __48__TIKeyboardLayoutFactory_sharedKeyboardFactory__block_invoke()
{
  sharedKeyboardFactory_instance = objc_alloc_init(TIKeyboardLayoutFactory);

  return MEMORY[0x1F41817F8]();
}

@end