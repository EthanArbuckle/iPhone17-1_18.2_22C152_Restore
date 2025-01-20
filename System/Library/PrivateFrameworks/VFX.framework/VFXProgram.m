@interface VFXProgram
+ (BOOL)supportsSecureCoding;
+ (VFXProgram)programWithLibrary:(id)a3;
+ (id)program;
- (BOOL)isOpaque;
- (MTLLibrary)library;
- (NSString)fragmentFunctionName;
- (NSString)fragmentShader;
- (NSString)vertexFunctionName;
- (NSString)vertexShader;
- (VFXProgram)init;
- (VFXProgram)initWithCoder:(id)a3;
- (VFXProgramDelegate)delegate;
- (id)_allSymbolsWithVFXSemantic;
- (id)_bufferBindings;
- (id)_optionsForSymbol:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (id)semanticForSymbol:(id)a3;
- (id)sourceFile;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfBufferNamed:(id)a3 frequency:(int64_t)a4 usingBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setFragmentFunctionName:(id)a3;
- (void)setFragmentShader:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setName:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setSemantic:(id)a3 forSymbol:(id)a4;
- (void)setSemantic:(id)a3 forSymbol:(id)a4 options:(id)a5;
- (void)setSemanticInfos:(id)a3;
- (void)setSourceFile:(id)a3;
- (void)setVertexFunctionName:(id)a3;
- (void)setVertexShader:(id)a3;
@end

@implementation VFXProgram

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXProgram;
  [(VFXProgram *)&v3 dealloc];
}

- (VFXProgram)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXProgram;
  result = [(VFXProgram *)&v3 init];
  if (result) {
    result->_opaque = 1;
  }
  return result;
}

- (void)setLibrary:(id)a3
{
  id library = self->_library;
  if (library != a3)
  {

    self->_id library = a3;
    v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
    objc_msgSend_postNotificationName_object_userInfo_(v9, v10, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (MTLLibrary)library
{
  return (MTLLibrary *)self->_library;
}

- (void)setName:(id)a3
{
  if ((objc_msgSend_isEqualToString_(self->_name, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_name = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
  }
}

- (id)name
{
  return self->_name;
}

+ (id)program
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (VFXProgram)programWithLibrary:(id)a3
{
  v4 = (VFXProgram *)objc_alloc_init((Class)a1);
  objc_msgSend_setLibrary_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (void)setSourceFile:(id)a3
{
  sourceFile = self->_sourceFile;
  if (sourceFile != a3)
  {

    self->_sourceFile = (NSString *)a3;
  }
}

- (id)sourceFile
{
  return self->_sourceFile;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  if (self->_opaque != a3)
  {
    self->_opaque = a3;
    v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    objc_msgSend_postNotificationName_object_userInfo_(v5, v6, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (void)setVertexFunctionName:(id)a3
{
  if ((objc_msgSend_isEqualToString_(self->_vertexFunctionName, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_vertexFunctionName = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (void)setFragmentFunctionName:(id)a3
{
  if ((objc_msgSend_isEqualToString_(self->_fragmentFunctionName, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_fragmentFunctionName = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (void)setVertexShader:(id)a3
{
  if ((objc_msgSend_isEqualToString_(self->_vertexShader, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_vertexShader = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (NSString)vertexShader
{
  return self->_vertexShader;
}

- (void)setFragmentShader:(id)a3
{
  if ((objc_msgSend_isEqualToString_(self->_fragmentShader, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_fragmentShader = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (NSString)fragmentShader
{
  return self->_fragmentShader;
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4 options:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!self->_semanticInfos) {
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v9 = objc_msgSend_infoWithSemantic_options_(VFXProgramSemanticInfo, a2, (uint64_t)a3, (uint64_t)a5);
  objc_msgSend_setValue_forKey_(self->_semanticInfos, v10, v9, (uint64_t)a4);
  v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
  v18 = @"parameter";
  v19[0] = a4;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v19, (uint64_t)&v18, 1);
  objc_msgSend_postNotificationName_object_userInfo_(v14, v17, @"VFXProgramDidChangeNotification", (uint64_t)self, v16);
}

- (id)semanticForSymbol:(id)a3
{
  v4 = objc_msgSend_valueForKey_(self->_semanticInfos, a2, (uint64_t)a3, v3);

  return (id)objc_msgSend_semantic(v4, v5, v6, v7);
}

- (id)_optionsForSymbol:(id)a3
{
  v4 = objc_msgSend_valueForKey_(self->_semanticInfos, a2, (uint64_t)a3, v3);

  return (id)objc_msgSend_options(v4, v5, v6, v7);
}

- (id)_allSymbolsWithVFXSemantic
{
  id result = self->_semanticInfos;
  if (result) {
    return (id)objc_msgSend_allKeys(result, a2, v2, v3);
  }
  return result;
}

- (void)setSemanticInfos:(id)a3
{
  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
  {
    objc_msgSend_removeAllObjects(semanticInfos, a2, (uint64_t)a3, v3);
    if (!a3) {
      return;
    }
  }
  else
  {
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (!a3) {
      return;
    }
  }
  uint64_t v9 = self->_semanticInfos;

  objc_msgSend_addEntriesFromDictionary_(v9, v7, (uint64_t)a3, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_vertexShader(self, v5, v6, v7);
  objc_msgSend_setVertexShader_(v4, v9, v8, v10);
  uint64_t v14 = objc_msgSend_vertexFunctionName(self, v11, v12, v13);
  objc_msgSend_setVertexFunctionName_(v4, v15, v14, v16);
  uint64_t v20 = objc_msgSend_fragmentFunctionName(self, v17, v18, v19);
  objc_msgSend_setFragmentFunctionName_(v4, v21, v20, v22);
  uint64_t v26 = objc_msgSend_fragmentShader(self, v23, v24, v25);
  objc_msgSend_setFragmentShader_(v4, v27, v26, v28);
  uint64_t v32 = objc_msgSend_name(self, v29, v30, v31);
  objc_msgSend_setName_(v4, v33, v32, v34);
  objc_msgSend_setSemanticInfos_(v4, v35, (uint64_t)self->_semanticInfos, v36);
  return v4;
}

- (id)_bufferBindings
{
  return self->_bufferBindings;
}

- (void)handleBindingOfBufferNamed:(id)a3 frequency:(int64_t)a4 usingBlock:(id)a5
{
  bufferBindings = self->_bufferBindings;
  if (a5)
  {
    if (!bufferBindings) {
      self->_bufferBindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v10 = objc_alloc_init(VFXBufferBinding);
    objc_msgSend_setName_(v10, v11, (uint64_t)a3, v12);
    objc_msgSend_setFrequency_(v10, v13, a4, v14);
    v15 = _Block_copy(a5);
    objc_msgSend_setBlock_(v10, v16, (uint64_t)v15, v17);
    objc_msgSend_setValue_forKey_(self->_bufferBindings, v18, (uint64_t)v10, (uint64_t)a3);

    uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
    objc_msgSend_postNotificationName_object_userInfo_(v22, v23, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(bufferBindings, a2, (uint64_t)a3, a4);
    uint64_t v31 = objc_alloc_init(VFXBufferBinding);
    objc_msgSend_setName_(v31, v24, (uint64_t)a3, v25);
    v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
    objc_msgSend_postNotificationName_object_userInfo_(v29, v30, @"VFXProgramDidChangeNotification", (uint64_t)self, 0);
  }
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (VFXProgramDelegate)delegate
{
  return (VFXProgramDelegate *)self->_delegate;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend__customEncodingOfVFXProgram_(self, a2, (uint64_t)a3, v3);
  vertexShader = self->_vertexShader;
  if (vertexShader) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)vertexShader, @"vertexShader");
  }
  fragmentShader = self->_fragmentShader;
  if (fragmentShader) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)fragmentShader, @"fragmentShader");
  }
  vertexFunctionName = self->_vertexFunctionName;
  if (vertexFunctionName) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)vertexFunctionName, @"vertexFunctionName");
  }
  sourceFile = self->_sourceFile;
  if (sourceFile) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)sourceFile, @"sourceFile");
  }
  fragmentFunctionName = self->_fragmentFunctionName;
  if (fragmentFunctionName) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)fragmentFunctionName, @"fragmentFunctionName");
  }
  name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)name, @"name");
  }
  semanticInfos = self->_semanticInfos;
  if (semanticInfos) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)semanticInfos, @"semanticInfos");
  }
  BOOL opaque = self->_opaque;

  objc_msgSend_encodeBool_forKey_(a3, v6, opaque, @"opaque");
}

- (VFXProgram)initWithCoder:(id)a3
{
  v60.receiver = self;
  v60.super_class = (Class)VFXProgram;
  uint64_t v7 = [(VFXProgram *)&v60 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXProgram_(v7, v11, (uint64_t)a3, v12);
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"vertexShader");
    objc_msgSend_setVertexShader_(v7, v16, v15, v17);
    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, @"fragmentShader");
    objc_msgSend_setFragmentShader_(v7, v21, v20, v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, @"vertexFunctionName");
    objc_msgSend_setVertexFunctionName_(v7, v26, v25, v27);
    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v29, v28, @"fragmentFunctionName");
    objc_msgSend_setFragmentFunctionName_(v7, v31, v30, v32);
    uint64_t v33 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, @"sourceFile");
    objc_msgSend_setSourceFile_(v7, v36, v35, v37);
    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v39, v38, @"name");
    objc_msgSend_setName_(v7, v41, v40, v42);
    v43 = (void *)sub_1B64FBF0C();
    uint64_t v44 = objc_opt_class();
    uint64_t v47 = objc_msgSend_setByAddingObject_(v43, v45, v44, v46);
    uint64_t v49 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v48, v47, @"semanticInfos");
    objc_msgSend_setSemanticInfos_(v7, v50, v49, v51);
    uint64_t v54 = objc_msgSend_decodeBoolForKey_(a3, v52, @"opaque", v53);
    objc_msgSend_setOpaque_(v7, v55, v54, v56);
    objc_msgSend_setImmediateMode_(VFXTransaction, v57, v8, v58);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end