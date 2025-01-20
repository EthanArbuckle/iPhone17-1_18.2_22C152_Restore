@interface TUIKeyboardLayoutFactory
+ (id)crescendoLayouts;
+ (id)layoutsFileNameForDeviceClass;
+ (id)sharedKeyboardFactory;
- (NSMutableDictionary)internalCache;
- (NSMutableDictionary)overlayDecoders;
- (TUIKBGraphSerialization)decoder;
- (TUIKeyboardLayoutFactory)init;
- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4;
- (id)keyboardSuffixForScreenDimensions:(CGSize)a3;
- (id)keyboardWithName:(id)a3 inCache:(id)a4;
- (void)_createDecoderFromFilename:(id)a3;
- (void)_createDecoderIfNecessary;
- (void)dealloc;
- (void)layoutsLibraryHandle;
- (void)setData:(id)a3 forKeyboard:(id)a4;
- (void)setDecoder:(id)a3;
- (void)setInternalCache:(id)a3;
- (void)setOverlayDecoders:(id)a3;
@end

@implementation TUIKeyboardLayoutFactory

- (void)setOverlayDecoders:(id)a3
{
}

- (NSMutableDictionary)overlayDecoders
{
  return self->_overlayDecoders;
}

- (void)setDecoder:(id)a3
{
}

- (TUIKBGraphSerialization)decoder
{
  return (TUIKBGraphSerialization *)objc_getProperty(self, a2, 24, 1);
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

- (void)setData:(id)a3 forKeyboard:(id)a4
{
  if ([(TUIKeyboardLayoutFactory *)self overlayDecoders])
  {
    if (!a4) {
      return;
    }
  }
  else
  {
    -[TUIKeyboardLayoutFactory setOverlayDecoders:](self, "setOverlayDecoders:", [MEMORY[0x1E4F1CA60] dictionary]);
    if (!a4) {
      return;
    }
  }
  if (a3)
  {
    v7 = objc_alloc_init(TUIKBGraphSerialization);
    [(TUIKBGraphSerialization *)v7 setSerializedData:a3];
    -[TUIKBGraphSerialization setDeserializationCache:](v7, "setDeserializationCache:", [MEMORY[0x1E4F1CA60] dictionary]);
    v8 = [(TUIKeyboardLayoutFactory *)self overlayDecoders];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:a4];
  }
  else
  {
    v9 = [(TUIKeyboardLayoutFactory *)self overlayDecoders];
    [(NSMutableDictionary *)v9 removeObjectForKey:a4];
  }
}

- (id)keyboardSuffixForScreenDimensions:(CGSize)a3
{
  if (a3.height < a3.width) {
    a3.float width = a3.height;
  }
  float width = a3.width;
  v4 = [(TUIKeyboardLayoutFactory *)self decoder];
  *(float *)&double v5 = width;
  return [(TUIKBGraphSerialization *)v4 keyboardSuffixForPortraitWidth:v5];
}

- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4
{
  BOOL v4 = a4;
  [(TUIKeyboardLayoutFactory *)self _createDecoderIfNecessary];
  id result = [(TUIKeyboardLayoutFactory *)self decoder];
  if (result)
  {
    v8 = [(TUIKeyboardLayoutFactory *)self decoder];
    *(float *)&double v9 = a3;
    return [(TUIKBGraphSerialization *)v8 keyboardPrefixForWidth:v4 andEdge:v9];
  }
  return result;
}

- (id)keyboardWithName:(id)a3 inCache:(id)a4
{
  overlayDecoders = self->_overlayDecoders;
  if (overlayDecoders)
  {
    v8 = (TUIKBGraphSerialization *)[(NSMutableDictionary *)overlayDecoders objectForKeyedSubscript:a3];
    if (v8)
    {
LABEL_12:
      return [(TUIKBGraphSerialization *)v8 keyboardForName:a3];
    }
  }
  if (!a4)
  {
    if (![(TUIKeyboardLayoutFactory *)self internalCache]) {
      -[TUIKeyboardLayoutFactory setInternalCache:](self, "setInternalCache:", [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:100]);
    }
    a4 = [(TUIKeyboardLayoutFactory *)self internalCache];
  }
  if ([a3 hasPrefix:@"Dynamic"]) {
    [(TUIKeyboardLayoutFactory *)self _createDecoderFromFilename:@"KBLayouts_Dynamic.dat"];
  }
  else {
    [(TUIKeyboardLayoutFactory *)self _createDecoderIfNecessary];
  }
  id result = [(TUIKeyboardLayoutFactory *)self decoder];
  if (result)
  {
    [(TUIKBGraphSerialization *)[(TUIKeyboardLayoutFactory *)self decoder] setDeserializationCache:a4];
    v8 = [(TUIKeyboardLayoutFactory *)self decoder];
    goto LABEL_12;
  }
  return result;
}

- (void)_createDecoderFromFilename:(id)a3
{
  decoder = self->_decoder;
  if (!decoder || [(TUIKBGraphSerialization *)decoder currentFileType] != 3)
  {
    uint64_t v6 = [@"/System/Library/PrivateFrameworks/TextInputUI.framework" stringByAppendingPathComponent:a3];
    [(TUIKeyboardLayoutFactory *)self setDecoder:objc_alloc_init(TUIKBGraphSerialization)];
    uint64_t v10 = 0;
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:8 error:&v10];
    if (v7) {
      BOOL v8 = v10 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      uint64_t v9 = v7;
      [(TUIKBGraphSerialization *)[(TUIKeyboardLayoutFactory *)self decoder] setCurrentFileType:3];
      [(TUIKBGraphSerialization *)[(TUIKeyboardLayoutFactory *)self decoder] setSerializedData:v9];
    }
    else
    {
      [(TUIKeyboardLayoutFactory *)self _createDecoderIfNecessary];
    }
  }
}

- (void)_createDecoderIfNecessary
{
  decoder = self->_decoder;
  if (!decoder
    || [(TUIKBGraphSerialization *)decoder currentFileType] == 3
    || [(TUIKBGraphSerialization *)self->_decoder currentFileType] == -1)
  {
    uint64_t v4 = objc_msgSend(@"/System/Library/PrivateFrameworks/TextInputUI.framework", "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "layoutsFileNameForDeviceClass"));
    [(TUIKeyboardLayoutFactory *)self setDecoder:objc_alloc_init(TUIKBGraphSerialization)];
    uint64_t v6 = 0;
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:8 error:&v6];
    if (!v5 || v6) {
      [(TUIKeyboardLayoutFactory *)self setDecoder:0];
    }
    else {
      [(TUIKBGraphSerialization *)[(TUIKeyboardLayoutFactory *)self decoder] setSerializedData:v5];
    }
  }
}

- (TUIKeyboardLayoutFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardLayoutFactory;
  v2 = [(TUIKeyboardLayoutFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TUIKeyboardLayoutFactory *)v2 _createDecoderIfNecessary];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TUIKeyboardLayoutFactory;
  [(TUIKeyboardLayoutFactory *)&v3 dealloc];
}

+ (id)crescendoLayouts
{
  if (TIGetEnableMoltoCrescendoValue_onceToken != -1) {
    dispatch_once(&TIGetEnableMoltoCrescendoValue_onceToken, &__block_literal_global_315);
  }
  int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FAE3D8], "sharedPreferencesController"), "valueForPreferenceKey:", @"EnableMoltoCrescendo"), "BOOLValue");
  id result = (id)crescendoLayouts___layouts;
  if (!crescendoLayouts___layouts)
  {
    id result = (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Dvorak", @"QWERTY-Chickasaw", @"QWERTY-Choctaw", @"QWERTY-Mikmaw", @"QWERTY-Mvskoke", @"QWERTY-Lushootseed", @"QWERTY-Shawnee", @"Shawnee", @"Sami-Inari", @"Sami-Julev", @"Sami-Julev-Norway", @"Sami-Kildin", @"Sami-Northern", @"Sami-Pite", @"Sami-Skolt", @"Sami-Southern", @"Sami-Ume",
                   @"Osage-QWERTY",
                   @"Coptic",
                   @"Mandaic",
                   @"Mandaic-QWERTY",
                   @"Mandaic-Alphabetic",
                   @"Tamazight-Tifinagh",
                   @"Tamazight-Tifinagh-Alphabetic",
                   @"QWERTY-Kabyle",
                   @"AZERTY-Kabyle",
                   @"Ingush",
                   @"NKo",
                   @"Wancho",
                   @"Wancho-QWERTY",
                   @"Rejang",
                   @"Pahawh-Hmong",
                   @"Yi",
                   @"Inuktitut",
                   @"QWERTY-Wolastoqey",
                   @"Chuvash",
                   @"QWERTY-Akan",
                   @"QWERTY-Hausa",
                   @"QWERTY-Yoruba",
                   @"Bengali-Alphabetic",
                   @"Gujarati-Alphabetic",
                   @"Hindi-Alphabetic",
                   @"Kannada-Alphabetic",
                   0x1EDC66000,
                   @"Marathi-Alphabetic",
                   @"Oriya-Alphabetic",
                   @"Punjabi-Alphabetic",
                   @"Tamil-Alphabetic",
                   @"Telugu-Alphabetic",
                   @"Urdu-Alphabetic",
                   @"Zhuyin-Grid",
                   0);
    crescendoLayouts___layouts = (uint64_t)result;
    if (v2)
    {
      id result = (id)[result setByAddingObjectsFromArray:&unk_1EDC79B60];
      crescendoLayouts___layouts = (uint64_t)result;
    }
  }
  return result;
}

+ (id)layoutsFileNameForDeviceClass
{
  uint64_t v2 = MGCopyAnswer();
  if (v2)
  {
    objc_super v3 = (const void *)v2;
    uint64_t v4 = (__CFString *)[NSString stringWithFormat:@"KBLayouts_%@.dat", v2];
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(__CFString *)v4 isEqualToString:@"KBLayouts_iPod.dat"]) {
    uint64_t v4 = @"KBLayouts_iPhone.dat";
  }
  if ([(__CFString *)v4 isEqualToString:@"KBLayouts_Watch.dat"]) {
    objc_super v5 = @"KBLayouts_iPhone.dat";
  }
  else {
    objc_super v5 = v4;
  }
  if (v5) {
    return v5;
  }
  else {
    return @"KBLayouts_iPad.dat";
  }
}

+ (id)sharedKeyboardFactory
{
  if (sharedKeyboardFactory_onceToken != -1) {
    dispatch_once(&sharedKeyboardFactory_onceToken, &__block_literal_global_2080);
  }
  return (id)sharedKeyboardFactory_instance;
}

TUIKeyboardLayoutFactory *__49__TUIKeyboardLayoutFactory_sharedKeyboardFactory__block_invoke()
{
  id result = objc_alloc_init(TUIKeyboardLayoutFactory);
  sharedKeyboardFactory_instance = (uint64_t)result;
  return result;
}

@end