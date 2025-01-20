@interface ObjMeshDataCodable
+ (BOOL)supportsSecureCoding;
- (ObjMeshDataCodable)initWithCoder:(id)a3;
- (ObjMeshDataCodable)initWithObjMeshDataNoCopy:(const void *)a3;
- (const)objMeshData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ObjMeshDataCodable

- (ObjMeshDataCodable)initWithObjMeshDataNoCopy:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ObjMeshDataCodable;
  v4 = [(ObjMeshDataCodable *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_pObjMeshData = a3;
    v4->_freeWhenDone = 0;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_freeWhenDone)
  {
    pObjMeshData = (void **)self->_pObjMeshData;
    if (pObjMeshData)
    {
      if (*((unsigned char *)pObjMeshData + 200)) {
        free(pObjMeshData[22]);
      }
      if (*((unsigned char *)pObjMeshData + 168)) {
        free(pObjMeshData[18]);
      }
      if (*((unsigned char *)pObjMeshData + 136)) {
        free(pObjMeshData[14]);
      }
      if (*((unsigned char *)pObjMeshData + 104)) {
        free(pObjMeshData[10]);
      }
      if (*((unsigned char *)pObjMeshData + 72)) {
        free(pObjMeshData[6]);
      }
      free(pObjMeshData[3]);
      free(*pObjMeshData);
      MEMORY[0x2612278D0](pObjMeshData, 0x1092C4070EEB0B2);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)ObjMeshDataCodable;
  [(ObjMeshDataCodable *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_pObjMeshData)
  {
    cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v5, (__CFDictionary *)[MEMORY[0x263EFFA78] mutableCopy]);
    cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)self->_pObjMeshData);
  }
}

- (const)objMeshData
{
  return self->_pObjMeshData;
}

- (ObjMeshDataCodable)initWithCoder:(id)a3
{
  v12[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  v6 = [MEMORY[0x263EFFA08] setWithArray:v5];
  CFDictionaryRef v7 = [v4 decodeObjectOfClasses:v6 forKey:@"meshProperties"];

  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v11, v7);
  if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v11, "V")
    && (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v11, "F") & 1) != 0)
  {
    operator new();
  }
  objc_super v8 = __VGLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_260C8D000, v8, OS_LOG_TYPE_ERROR, " Required properties : Vertices and Faces, not found in mesh data ", buf, 2u);
  }

  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v11);
  return 0;
}

@end