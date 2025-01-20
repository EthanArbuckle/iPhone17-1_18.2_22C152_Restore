@interface UISApplicationInitializationContextParameters
- (BOOL)preferSmallerDisplaySize;
- (BOOL)requiresFullScreen;
- (BOOL)supportsMultiwindow;
- (BOOL)useTrueDisplaySize;
- (CGSize)usableDisplaySizeHint;
- (NSArray)deviceFamilies;
- (UISApplicationInitializationContextParameters)init;
- (UISApplicationInitializationContextParameters)initWithXPCDictionary:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)initialCGDirectDisplayID;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setDeviceFamilies:(id)a3;
- (void)setInitialCGDirectDisplayID:(unsigned int)a3;
- (void)setPreferSmallerDisplaySize:(BOOL)a3;
- (void)setRequiresFullScreen:(BOOL)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setSupportsMultiwindow:(BOOL)a3;
- (void)setUsableDisplaySizeHint:(CGSize)a3;
- (void)setUseTrueDisplaySize:(BOOL)a3;
@end

@implementation UISApplicationInitializationContextParameters

- (UISApplicationInitializationContextParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)UISApplicationInitializationContextParameters;
  v2 = [(UISApplicationInitializationContextParameters *)&v7 init];
  v3 = v2;
  if (v2)
  {
    deviceFamilies = v2->_deviceFamilies;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_supportedInterfaceOrientations = 0;
    v2->_deviceFamilies = v5;

    *(_WORD *)&v3->_requiresFullScreen = 0;
    v3->_initialCGDirectDisplayID = 0;
    v3->_usableDisplaySizeHint = (CGSize)*MEMORY[0x1E4F1DB30];
    *(_WORD *)&v3->_preferSmallerDisplaySize = 0;
  }
  return v3;
}

- (UISApplicationInitializationContextParameters)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISApplicationInitializationContextParameters;
  v5 = [(UISApplicationInitializationContextParameters *)&v14 init];
  if (v5)
  {
    v5->_supportedInterfaceOrientations = xpc_dictionary_get_int64(v4, "supportedInterfaceOrientations");
    v6 = xpc_dictionary_get_array(v4, "deviceFamilies");
    if (v6)
    {
      objc_super v7 = [MEMORY[0x1E4F1CA48] array];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __71__UISApplicationInitializationContextParameters_initWithXPCDictionary___block_invoke;
      applier[3] = &unk_1E5735620;
      applier[4] = v7;
      xpc_array_apply(v6, applier);
      uint64_t v8 = [v7 copyWithZone:0];
      deviceFamilies = v5->_deviceFamilies;
      v5->_deviceFamilies = (NSArray *)v8;
    }
    else
    {
      objc_super v7 = v5->_deviceFamilies;
      v5->_deviceFamilies = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v5->_requiresFullScreen = xpc_dictionary_get_BOOL(v4, "requiresFullScreen");
    v5->_supportsMultiwindow = xpc_dictionary_get_BOOL(v4, "supportsMultiwindow");
    v5->_initialCGDirectDisplayID = xpc_dictionary_get_uint64(v4, "initialCGDirectDisplayID");
    double v10 = xpc_dictionary_get_double(v4, "usableDisplaySizeHint_w");
    double v11 = xpc_dictionary_get_double(v4, "usableDisplaySizeHint_h");
    v5->_usableDisplaySizeHint.width = v10;
    v5->_usableDisplaySizeHint.height = v11;
    v5->_preferSmallerDisplaySize = xpc_dictionary_get_BOOL(v4, "preferSmallerDisplaySize");
    v5->_useTrueDisplaySize = xpc_dictionary_get_BOOL(v4, "useTrueDisplaySize");
  }
  return v5;
}

uint64_t __71__UISApplicationInitializationContextParameters_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x192FE1920]() == MEMORY[0x1E4F145C0])
  {
    v5 = *(void **)(a1 + 32);
    v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:xpc_int64_get_value(v4)];
    [v5 addObject:v6];
  }
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_dictionary_set_int64(v4, "supportedInterfaceOrientations", self->_supportedInterfaceOrientations);
  if (self->_deviceFamilies)
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = self->_deviceFamilies;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "integerValue", (void)v11));
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    xpc_dictionary_set_value(v4, "deviceFamilies", v5);
  }
  xpc_dictionary_set_BOOL(v4, "requiresFullScreen", self->_requiresFullScreen);
  xpc_dictionary_set_BOOL(v4, "supportsMultiwindow", self->_supportsMultiwindow);
  xpc_dictionary_set_uint64(v4, "initialCGDirectDisplayID", self->_initialCGDirectDisplayID);
  xpc_dictionary_set_double(v4, "usableDisplaySizeHint_w", self->_usableDisplaySizeHint.width);
  xpc_dictionary_set_double(v4, "usableDisplaySizeHint_h", self->_usableDisplaySizeHint.height);
  xpc_dictionary_set_BOOL(v4, "preferSmallerDisplaySize", self->_preferSmallerDisplaySize);
  xpc_dictionary_set_BOOL(v4, "useTrueDisplaySize", self->_useTrueDisplaySize);
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(id)a3
{
}

- (BOOL)requiresFullScreen
{
  return self->_requiresFullScreen;
}

- (void)setRequiresFullScreen:(BOOL)a3
{
  self->_requiresFullScreen = a3;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (void)setSupportsMultiwindow:(BOOL)a3
{
  self->_supportsMultiwindow = a3;
}

- (unsigned)initialCGDirectDisplayID
{
  return self->_initialCGDirectDisplayID;
}

- (void)setInitialCGDirectDisplayID:(unsigned int)a3
{
  self->_initialCGDirectDisplayID = a3;
}

- (CGSize)usableDisplaySizeHint
{
  double width = self->_usableDisplaySizeHint.width;
  double height = self->_usableDisplaySizeHint.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUsableDisplaySizeHint:(CGSize)a3
{
  self->_usableDisplaySizeHint = a3;
}

- (BOOL)preferSmallerDisplaySize
{
  return self->_preferSmallerDisplaySize;
}

- (void)setPreferSmallerDisplaySize:(BOOL)a3
{
  self->_preferSmallerDisplaySize = a3;
}

- (BOOL)useTrueDisplaySize
{
  return self->_useTrueDisplaySize;
}

- (void)setUseTrueDisplaySize:(BOOL)a3
{
  self->_useTrueDisplaySize = a3;
}

- (void).cxx_destruct
{
}

@end