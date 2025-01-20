@interface UINibDecoder
+ (id)unarchiveObjectWithData:(id)a3;
+ (id)unarchiveObjectWithFile:(id)a3;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeArrayOfCGFloats:(double *)a3 count:(int64_t)a4 forKey:(id)a5;
- (BOOL)decodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5;
- (BOOL)decodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)isReusable;
- (BOOL)validateAndIndexClasses:(const void *)a3 length:(unint64_t)a4;
- (BOOL)validateAndIndexData:(id)a3 error:(id *)a4;
- (BOOL)validateAndIndexKeys:(const void *)a3 length:(unint64_t)a4;
- (BOOL)validateAndIndexObjects:(const void *)a3 length:(unint64_t)a4;
- (BOOL)validateAndIndexValues:(const void *)a3 length:(unint64_t)a4;
- (CGAffineTransform)decodeCGAffineTransformForKey:(SEL)a3;
- (CGPoint)decodeCGPointForKey:(id)a3;
- (CGRect)decodeCGRectForKey:(id)a3;
- (CGSize)decodeCGSizeForKey:(id)a3;
- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(id)a3;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeDataObject;
- (id)decodeNXObject;
- (id)decodeObject;
- (id)decodeObjectForKey:(id)a3;
- (id)decodePropertyList;
- (id)delegate;
- (id)initForReadingWithData:(id)a3;
- (id)initForReadingWithData:(id)a3 error:(id *)a4;
- (id)nextGenericKey;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (int64_t)uniqueIDForCurrentlyDecodingObject;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)dealloc;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)finishDecoding;
- (void)replaceObject:(id)a3 withObject:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation UINibDecoder

- (void)finishDecoding
{
  p_header = &self->header;
  if (self->header.objects.count)
  {
    unint64_t v4 = 0;
    do
    {

      unint64_t count = p_header->objects.count;
    }
    while (v4 < count);
    size_t v6 = 8 * count;
  }
  else
  {
    size_t v6 = 0;
  }
  bzero(self->objectsByObjectID, v6);
  self->recursiveState.nextGenericKey = 0;
  *(void *)&self->recursiveState.nextValueSearchIndex = 0;
  self->recursiveState.objectID = 0;
}

- (CGSize)decodeCGSizeForKey:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINibDecoder *)self decodeArrayOfCGFloats:v6 count:2 forKey:a3];
  double v4 = *(double *)v6;
  double v5 = *(double *)&v6[1];
  if (!v3)
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (int)decodeIntForKey:(id)a3
{
  uint64_t v18 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v18];
  LODWORD(v5) = 0;
  if (!v4) {
    return v5;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0) {
    goto LABEL_21;
  }
  v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      LODWORD(v5) = 0;
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return v5;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
  {
LABEL_21:
    LODWORD(v5) = 0;
    return v5;
  }
  int v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
    {
      LODWORD(v5) = v15 == 5;
      return v5;
    }
    goto LABEL_21;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      LODWORD(v5) = valueData[values[v12].var1];
      break;
    case 1:
      LODWORD(v5) = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      LODWORD(v5) = *(_DWORD *)&valueData[values[v12].var1];
      break;
    case 3:
      uint64_t v5 = *(void *)&valueData[values[v12].var1];
      break;
    default:
      goto LABEL_21;
  }
  return v5;
}

- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(id)a3
{
  v8[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINibDecoder *)self decodeArrayOfCGFloats:v8 count:4 forKey:a3];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    double v7 = *(double *)v8;
    double v6 = *(double *)&v8[1];
    double v5 = *(double *)&v8[2];
    double v4 = *(double *)&v8[3];
  }
  result.right = v4;
  result.bottom = v5;
  result.left = v6;
  result.top = v7;
  return result;
}

- (CGPoint)decodeCGPointForKey:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINibDecoder *)self decodeArrayOfCGFloats:v6 count:2 forKey:a3];
  double v4 = *(double *)v6;
  double v5 = *(double *)&v6[1];
  if (!v3)
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)initForReadingWithData:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UINibDecoder;
  v10 = 0;
  double v6 = [(UINibDecoder *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    if (a3 && [(UINibDecoder *)v6 validateAndIndexData:a3 error:&v10])
    {
      v7->recursiveState.objectID = 0;
      v7->valueCache.previousKey = [(UINibStringIDTable *)v7->keyIDTable count] + 1;
      if (![(UINibStringIDTable *)v7->keyIDTable lookupKey:@"NSInlinedValue" identifier:&v7->inlinedValueKey])v7->inlinedValueKey = [(UINibStringIDTable *)v7->keyIDTable count] + 1; {
      v7->arrayClass = (Class)objc_opt_class();
      }
      v7->setClass = (Class)objc_opt_class();
      v7->dictionaryClass = (Class)objc_opt_class();
    }
    else
    {

      double v7 = 0;
    }
  }
  if (a4) {
    *a4 = v10;
  }
  return v7;
}

- (BOOL)validateAndIndexData:(id)a3 error:(id *)a4
{
  uint64_t v7 = [a3 bytes];
  unint64_t v8 = [a3 length];
  if (v8 < 0xA) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)v7;
  *(_WORD *)&self->header.type[8] = *(_WORD *)(v7 + 8);
  *(void *)self->header.type = v9;
  if (v8 - 14 > 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_16;
  }
  self->header.formatVersion = *(_DWORD *)(v7 + 10);
  if (v8 < 0x12) {
    goto LABEL_16;
  }
  self->header.coderVersion = *(_DWORD *)(v7 + 14);
  if (v8 - 22 > 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_16;
  }
  self->header.objects.unint64_t count = *(_DWORD *)(v7 + 18);
  if (v8 < 0x1A) {
    goto LABEL_16;
  }
  self->header.objects.offset = *(_DWORD *)(v7 + 22);
  if (v8 - 30 > 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_16;
  }
  self->header.keys.unint64_t count = *(_DWORD *)(v7 + 26);
  if (v8 < 0x22) {
    goto LABEL_16;
  }
  self->header.keys.offset = *(_DWORD *)(v7 + 30);
  if (v8 - 38 > 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_16;
  }
  self->header.values.unint64_t count = *(_DWORD *)(v7 + 34);
  if (v8 < 0x2A) {
    goto LABEL_16;
  }
  self->header.values.offset = *(_DWORD *)(v7 + 38);
  if (v8 - 46 > 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_16;
  }
  self->header.classes.unint64_t count = *(_DWORD *)(v7 + 42);
  if (v8 < 0x32) {
    goto LABEL_16;
  }
  self->header.classes.offset = *(_DWORD *)(v7 + 46);
  if (*(void *)self->header.type == *(void *)"NIBArchive"
    && *(unsigned __int16 *)&self->header.type[8] == (unint64_t)*(unsigned __int16 *)"ve")
  {
    if (self->header.formatVersion <= 1)
    {
      unint64_t v15 = v8;
      if ([(UINibDecoder *)self validateAndIndexClasses:v7 length:v8])
      {
        if ([(UINibDecoder *)self validateAndIndexKeys:v7 length:v15])
        {
          if ([(UINibDecoder *)self validateAndIndexValues:v7 length:v15])
          {
            BOOL v12 = [(UINibDecoder *)self validateAndIndexObjects:v7 length:v15];
            uint64_t v11 = @"The object data is invalid.";
            if (v12) {
              uint64_t v11 = 0;
            }
          }
          else
          {
            LOBYTE(v12) = 0;
            uint64_t v11 = @"The value data is invalid.";
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          uint64_t v11 = @"The key data is invalid.";
        }
      }
      else
      {
        LOBYTE(v12) = 0;
        uint64_t v11 = @"The class data is invalid.";
      }
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v11 = @"The NIB data is too new for this version of iOS.";
    }
  }
  else
  {
LABEL_16:
    uint64_t v11 = 0;
    LOBYTE(v12) = 0;
  }
  if (a4 && !v12)
  {
    if (v11) {
      unsigned int v13 = v11;
    }
    else {
      unsigned int v13 = @"The NIB data is invalid.";
    }
    *a4 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E4F28568]));
  }
  return v12;
}

- (CGRect)decodeCGRectForKey:(id)a3
{
  v8[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINibDecoder *)self decodeArrayOfCGFloats:v8 count:4 forKey:a3];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    double v7 = *(double *)v8;
    double v6 = *(double *)&v8[1];
    double v5 = *(double *)&v8[2];
    double v4 = *(double *)&v8[3];
  }
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (float)decodeFloatForKey:(id)a3
{
  uint64_t v18 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v18];
  float result = 0.0;
  if (!v4) {
    return result;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0) {
    return result;
  }
  double v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return result;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  int v15 = self->valueTypes[v12];
  if (values) {
    BOOL v16 = v15 == 6;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    return *(float *)((char *)self->valueData + values[v12].var1);
  }
  if (values) {
    BOOL v17 = v15 == 7;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    return *(double *)((char *)self->valueData + values[v12].var1);
  }
  return result;
}

- (CGAffineTransform)decodeCGAffineTransformForKey:(SEL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  float result = (CGAffineTransform *)[(UINibDecoder *)self decodeArrayOfCGFloats:v10 count:6 forKey:a4];
  if (result)
  {
    long long v6 = v10[1];
    *(_OWORD *)&retstr->a = v10[0];
    *(_OWORD *)&retstr->c = v6;
    long long v7 = v10[2];
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v9;
    long long v7 = *(_OWORD *)(v8 + 32);
  }
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (BOOL)decodeArrayOfCGFloats:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  unint64_t v16 = 0;
  long long v7 = [(UINibDecoder *)self decodeBytesForKey:a5 returnedLength:&v16];
  BOOL v8 = 0;
  if (v7)
  {
    unint64_t v9 = v16;
    if (v16)
    {
      int v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v16 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            unint64_t v13 = 1;
            do
            {
              uint64_t v14 = 0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                uint64_t v14 = *(void *)&v7[v13];
                v13 += 8;
              }
              *(void *)a3++ = v14;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v16 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          unint64_t v11 = 1;
          do
          {
            float v12 = 0.0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              float v12 = *(float *)&v7[v11];
              v11 += 4;
            }
            *a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  uint64_t v18 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v18];
  double result = 0.0;
  if (!v4) {
    return result;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0) {
    return result;
  }
  long long v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return result;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  int v15 = self->valueTypes[v12];
  if (values) {
    BOOL v16 = v15 == 7;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    return *(double *)((char *)self->valueData + values[v12].var1);
  }
  if (values) {
    BOOL v17 = v15 == 6;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    return *(float *)((char *)self->valueData + values[v12].var1);
  }
  return result;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  uint64_t v17 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v17];
  int64_t result = 0;
  if (!v4) {
    return result;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v17) & 1) == 0) {
    return 0;
  }
  long long v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      int64_t result = 0;
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return result;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v17) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v17) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  if (!values) {
    return 0;
  }
  int v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4) {
      return v15 == 5;
    }
    return 0;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      int64_t result = valueData[values[v12].var1];
      break;
    case 1:
      int64_t result = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      int64_t result = *(unsigned int *)&valueData[values[v12].var1];
      break;
    case 3:
      int64_t result = *(void *)&valueData[values[v12].var1];
      break;
    default:
      return 0;
  }
  return result;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  unsigned int v21 = 0;
  uint64_t v20 = 0;
  BOOL v6 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v20];
  int64_t result = 0;
  if (!v6)
  {
LABEL_21:
    if (!a4) {
      return result;
    }
    goto LABEL_22;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v20) & 1) == 0)
  {
LABEL_20:
    int64_t result = 0;
    goto LABEL_21;
  }
  unint64_t v9 = &self->objects[objectID_low];
  unsigned int var0 = v9->var0;
  unsigned int var1 = v9->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex < var1)
  {
    LODWORD(v13) = self->recursiveState.nextValueSearchIndex;
    do
    {
      uint64_t v14 = var0 + v13;
      if (self->values[v14].var0 == v20) {
        goto LABEL_16;
      }
      LODWORD(v13) = v13 + 1;
    }
    while (var1 != v13);
  }
  if (nextValueSearchIndex)
  {
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = var0 + v13;
      if (self->values[v14].var0 == v20) {
        break;
      }
      if (nextValueSearchIndex == ++v13) {
        goto LABEL_11;
      }
    }
LABEL_16:
    self->recursiveState.uint64_t nextValueSearchIndex = v13;
    values = self->values;
    if (values) {
      BOOL v17 = self->valueTypes[v14] == 8;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      goto LABEL_20;
    }
    uint64_t v19 = values[v14].var1;
    valueData = (char *)self->valueData;
    UIReadNibArchiveVInt32((uint64_t)valueData, self->valueDataSize, &v19, (int *)&v21);
    int64_t result = &valueData[v19];
    if (!a4) {
      return result;
    }
LABEL_22:
    *a4 = v21;
    return result;
  }
LABEL_11:
  int64_t result = 0;
  if ((int)nextValueSearchIndex + 1 < var1) {
    unsigned int v15 = nextValueSearchIndex + 1;
  }
  else {
    unsigned int v15 = 0;
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v15;
  if (a4) {
    goto LABEL_22;
  }
  return result;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v18 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v18];
  if (!v4) {
    return v4;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0) {
    goto LABEL_21;
  }
  BOOL v6 = &self->objects[objectID_low];
  unsigned int var0 = v6->var0;
  unsigned int var1 = v6->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      LOBYTE(v4) = 0;
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v12 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v12 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v12;
      return v4;
    }
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = var0 + v10;
      if (self->values[v11].var0 == v18) {
        break;
      }
      if (nextValueSearchIndex == ++v10) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v10) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v11 = var0 + v10;
      if (self->values[v11].var0 == v18) {
        break;
      }
      LODWORD(v10) = v10 + 1;
      if (var1 == v10) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v10;
  values = self->values;
  if (!values) {
    goto LABEL_21;
  }
  int v14 = self->valueTypes[v11];
  if (v14 == 5)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (v14 == 4 || (char)v14 > 3)
  {
LABEL_21:
    LOBYTE(v4) = 0;
    return v4;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v11])
  {
    case 0:
      uint64_t v16 = valueData[values[v11].var1];
      break;
    case 1:
      uint64_t v16 = *(unsigned __int16 *)&valueData[values[v11].var1];
      break;
    case 2:
      uint64_t v16 = *(unsigned int *)&valueData[values[v11].var1];
      break;
    case 3:
      uint64_t v16 = *(void *)&valueData[values[v11].var1];
      break;
    default:
      uint64_t v16 = 0;
      break;
  }
  LOBYTE(v4) = v16 != 0;
  return v4;
}

- (BOOL)containsValueForKey:(id)a3
{
  uint64_t v16 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v16];
  if (v4)
  {
    uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
    if ((self->keyMasks[objectID_low] >> v16))
    {
      BOOL v6 = &self->objects[objectID_low];
      unsigned int var0 = v6->var0;
      unsigned int var1 = v6->var1;
      uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
      if (nextValueSearchIndex >= var1)
      {
LABEL_7:
        if (!nextValueSearchIndex)
        {
LABEL_11:
          uint64_t v13 = 0;
          if ((int)nextValueSearchIndex + 1 < var1) {
            unsigned int v14 = nextValueSearchIndex + 1;
          }
          else {
            unsigned int v14 = 0;
          }
          self->recursiveState.uint64_t nextValueSearchIndex = v14;
          goto LABEL_19;
        }
        uint64_t v12 = 0;
        while (1)
        {
          uint64_t v11 = var0 + v12;
          if (self->values[v11].var0 == v16) {
            break;
          }
          if (nextValueSearchIndex == ++v12) {
            goto LABEL_11;
          }
        }
        self->recursiveState.uint64_t nextValueSearchIndex = v12;
      }
      else
      {
        unsigned int v10 = self->recursiveState.nextValueSearchIndex;
        while (1)
        {
          uint64_t v11 = var0 + v10;
          if (self->values[v11].var0 == v16) {
            break;
          }
          if (var1 == ++v10) {
            goto LABEL_7;
          }
        }
        self->recursiveState.uint64_t nextValueSearchIndex = v10;
      }
      uint64_t v13 = &self->values[v11];
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_19:
    LOBYTE(v4) = v13 != 0;
  }
  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  uint64_t v15 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v15];
  id result = 0;
  if (v4)
  {
    uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
    if (((self->keyMasks[objectID_low] >> v15) & 1) == 0) {
      return 0;
    }
    long long v7 = &self->objects[objectID_low];
    unsigned int var0 = v7->var0;
    unsigned int var1 = v7->var1;
    uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
    if (nextValueSearchIndex < var1)
    {
      LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
      while (1)
      {
        uint64_t v12 = var0 + v11;
        if (self->values[v12].var0 == v15) {
          break;
        }
        LODWORD(v11) = v11 + 1;
        if (var1 == v11) {
          goto LABEL_7;
        }
      }
LABEL_15:
      self->recursiveState.uint64_t nextValueSearchIndex = v11;
      values = self->values;
      if (values)
      {
        UINibDecoderDecodeObjectForValue((uint64_t)self, (uint64_t)&values[v12], self->valueTypes[v12]);
        return result;
      }
      return 0;
    }
LABEL_7:
    if (nextValueSearchIndex)
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = var0 + v11;
        if (self->values[v12].var0 == v15) {
          goto LABEL_15;
        }
      }
      while (nextValueSearchIndex != ++v11);
    }
    id result = 0;
    if ((int)nextValueSearchIndex + 1 < var1) {
      unsigned int v13 = nextValueSearchIndex + 1;
    }
    else {
      unsigned int v13 = 0;
    }
    self->recursiveState.uint64_t nextValueSearchIndex = v13;
  }
  return result;
}

- (BOOL)validateAndIndexClasses:(const void *)a3 length:(unint64_t)a4
{
  p_header = &self->header;
  if (self->header.classes.offset > a4)
  {
    uint64_t v6 = 0;
LABEL_3:
    UIFreeMissingClasses((void **)&self->missingClasses, v6);
    return 0;
  }
  unint64_t offset = self->header.classes.offset;
  unint64_t count = self->header.classes.count;
  if (!count) {
    return 1;
  }
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  char v13 = 0;
  uint64_t v6 = 0;
  do
  {
    uint64_t v36 = 0;
    if (v11 == v12)
    {
      if ((uint64_t)(v11 + 128) >= (uint64_t)count) {
        unint64_t v12 = count;
      }
      else {
        unint64_t v12 = v11 + 128;
      }
      self->classes = (Class *)malloc_type_realloc(self->classes, 8 * v12, 0x80040B8603338uLL);
      self->missingClasses = (id *)malloc_type_realloc(self->missingClasses, 8 * v12, 0x80040B8603338uLL);
    }
    if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36 + 1)) {
      goto LABEL_3;
    }
    if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36)) {
      goto LABEL_3;
    }
    if (a4 < offset) {
      goto LABEL_3;
    }
    unint64_t v14 = 4 * v36;
    if (a4 - offset < v14) {
      goto LABEL_3;
    }
    unint64_t v15 = v14 + offset;
    unint64_t v16 = a4 - (v14 + offset);
    if (a4 < v15) {
      goto LABEL_3;
    }
    if (v16 < HIDWORD(v36)) {
      goto LABEL_3;
    }
    unint64_t offset = v15 + HIDWORD(v36);
    if (!HIDWORD(v36)) {
      goto LABEL_3;
    }
    BOOL v17 = (char *)a3 + v15;
    uint64_t v18 = (HIDWORD(v36) - 1);
    if (*((unsigned char *)a3 + v15 + v18)) {
      goto LABEL_3;
    }
    uint64_t v19 = (void *)[[NSString alloc] initWithBytes:v17 length:v18 encoding:4];
    if (v19)
    {
      self->classes[v11] = (Class)[MEMORY[0x1E4F28DC0] classForClassName:v19];
      classes = self->classes;
      Class v21 = classes[v11];
      if (!v21)
      {
        Class v21 = objc_lookUpClass(v17);
        classes = self->classes;
      }
      classes[v11] = v21;
      Class v22 = self->classes[v11];
      BOOL v23 = v22 == 0;
      if (v22) {
        id v24 = 0;
      }
      else {
        id v24 = v19;
      }
      v13 |= v23;
      self->missingClasses[v11] = v24;
      uint64_t v6 = v11 + 1;
    }

    unint64_t count = p_header->classes.count;
    if (!v19) {
      break;
    }
    ++v11;
  }
  while (v11 < count);
  if (!v19) {
    goto LABEL_3;
  }
  if ((v13 & 1) == 0) {
    return 1;
  }
  unint64_t v25 = p_header->classes.offset;
  BOOL result = v25 <= a4;
  if (v25 > a4) {
    unint64_t v26 = 0;
  }
  else {
    unint64_t v26 = p_header->classes.offset;
  }
  unint64_t offset = v26;
  if (count && v25 <= a4)
  {
    unint64_t v27 = 0;
    while (1)
    {
      uint64_t v36 = 0;
      if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36 + 1)) {
        return 0;
      }
      char v28 = UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36);
      int v29 = v36;
      unint64_t v30 = offset;
      int v31 = 0;
      if (v36) {
        break;
      }
LABEL_50:
      if ((v28 & 1) == 0) {
        return 0;
      }
      if (a4 < v30) {
        return 0;
      }
      unint64_t v35 = 4 * (v29 - v31);
      if (a4 - v30 < v35 || a4 < v30 + v35 || a4 - (v30 + v35) < HIDWORD(v36)) {
        return 0;
      }
      unint64_t offset = v30 + v35 + HIDWORD(v36);
      ++v27;
      BOOL result = 1;
      if (v27 >= p_header->classes.count) {
        return result;
      }
    }
    while (1)
    {
      v32 = self->classes;
      if (v32[v27]) {
        goto LABEL_50;
      }
      if (v28)
      {
        char v28 = 0;
        if (a4 < v30 || a4 - v30 < 4) {
          goto LABEL_48;
        }
        uint64_t v33 = *(unsigned int *)((char *)a3 + v30);
        v30 += 4;
        if (v33 < p_header->classes.count)
        {
          v34 = v32[v33];
          if (v34)
          {
            v32[v27] = v34;

            self->missingClasses[v27] = 0;
          }
          char v28 = 1;
          goto LABEL_48;
        }
      }
      char v28 = 0;
LABEL_48:
      if (v29 == ++v31)
      {
        int v31 = v29;
        goto LABEL_50;
      }
    }
  }
  return result;
}

- (BOOL)validateAndIndexKeys:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4 = ((uint64_t (*)(UINibDecoder *, SEL, const void *, unint64_t))MEMORY[0x1F4188790])(self, a2, a3, a4);
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v24 = 0;
  uint64_t v10 = v4 + 88;
  unint64_t v11 = *(unsigned int *)(v4 + 120);
  BOOL v12 = v11 <= v5;
  if (v11 <= v5) {
    unint64_t v24 = *(unsigned int *)(v4 + 120);
  }
  uint64_t v13 = *(unsigned int *)(v4 + 116);
  if (v13 <= 0x100)
  {
    unint64_t v15 = v25;
    unint64_t v14 = v26;
  }
  else
  {
    unint64_t v14 = malloc_type_malloc(8 * v13, 0x80040B8603338uLL);
    uint64_t v13 = *(unsigned int *)(v10 + 28);
    if (v13 < 0x101)
    {
      unint64_t v15 = v25;
    }
    else
    {
      unint64_t v15 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
      LODWORD(v13) = *(_DWORD *)(v10 + 28);
    }
  }
  bzero(v14, 8 * v13);
  if (*(_DWORD *)(v10 + 28)) {
    BOOL v16 = v11 > v6;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
LABEL_13:
    if (v12)
    {
      *(void *)(v9 + 208) = [[UINibStringIDTable alloc] initWithKeysTransferingOwnership:v14 count:*(unsigned int *)(v10 + 28)];
      BOOL v17 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v18 = 0;
    while (1)
    {
      unsigned int v23 = 0;
      if (!UIReadNibArchiveVInt32(v8, v6, (uint64_t *)&v24, (int *)&v23)) {
        break;
      }
      if (v6 < v24 || v6 - v24 < v23) {
        break;
      }
      unint64_t v20 = v8 + v24;
      v24 += v23;
      uint64_t v21 = [[NSString alloc] initWithBytes:v20 length:v23 encoding:4];
      *(void *)&v14[8 * v18] = v21;
      BOOL v12 = v21 != 0;
      *(void *)&v15[8 * v18] = v18;
      if (++v18 >= (unint64_t)*(unsigned int *)(v10 + 28) || !v21) {
        goto LABEL_13;
      }
    }
  }
  BOOL v17 = 0;
LABEL_25:
  if (v14 != v26) {
    free(v14);
  }
  if (v15 != v25) {
    free(v15);
  }
  return v17;
}

- (BOOL)validateAndIndexObjects:(const void *)a3 length:(unint64_t)a4
{
  if (!self->keyIDTable || !self->values || !self->classes) {
    -[UINibDecoder validateAndIndexObjects:length:]();
  }
  p_header = &self->header;
  if (self->header.objects.offset > a4) {
    return 0;
  }
  uint64_t offset = self->header.objects.offset;
  size_t count = self->header.objects.count;
  if (count)
  {
    uint64_t v9 = a3;
    size_t v10 = 0;
    int64_t v11 = 0;
    unint64_t v12 = 0x1E91D4000uLL;
    while (1)
    {
      if (v11 == v10)
      {
        if ((uint64_t)(v10 + 128) >= (uint64_t)count) {
          size_t v13 = count;
        }
        else {
          size_t v13 = v10 + 128;
        }
        unint64_t v14 = v12;
        uint64_t v15 = *(int *)(v12 + 2352);
        *(Class *)((char *)&self->super.super.isa + v15) = (Class)malloc_type_realloc(*(void **)((char *)&self->super.super.isa + v15), 8 * v13, 0x100004000313F17uLL);
        if (self->header.classes.count > 0xFF)
        {
          size_t v18 = v13;
          uint64_t v16 = 152;
          longObjectClassIDs = self->longObjectClassIDs;
          size_t v19 = 4 * v13;
          unsigned int v20 = 1384677904;
        }
        else
        {
          uint64_t v16 = 160;
          longObjectClassIDs = self->shortObjectClassIDs;
          size_t v18 = v13;
          size_t v19 = v13;
          unsigned int v20 = 2004306212;
        }
        *(Class *)((char *)&self->super.super.isa + v16) = (Class)malloc_type_realloc(longObjectClassIDs, v19, v20 | 0x100004000000000);
        self->keyMasks = (unsigned int *)malloc_type_realloc(self->keyMasks, 4 * v13, 0x100004052888210uLL);
        unint64_t v12 = v14;
        int64_t v11 = v18;
        uint64_t v9 = a3;
      }
      unsigned int v36 = 0;
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, (int *)&v36)) {
        return 0;
      }
      uint64_t v21 = *(int *)(v12 + 2352);
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, *(int **)((char *)&self->super.super.isa + v21) + 2 * v10))return 0; {
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, *(int **)((char *)&self->super.super.isa + v21) + 2 * v10 + 1))return 0;
      }
      if (v36 >= self->header.classes.count) {
        return 0;
      }
      uint64_t v22 = *(uint64_t *)((char *)&self->super.super.isa + v21);
      if (*(_DWORD *)(v22 + 8 * v10 + 4) + *(_DWORD *)(v22 + 8 * v10) > self->header.values.count) {
        return 0;
      }
      shortObjectClassIDs = self->shortObjectClassIDs;
      if (shortObjectClassIDs)
      {
        shortObjectClassIDs[v10] = v36;
        uint64_t v22 = *(uint64_t *)((char *)&self->super.super.isa + v21);
      }
      else
      {
        self->longObjectClassIDs[v10] = v36;
      }
      unint64_t v24 = (int *)(v22 + 8 * v10);
      uint64_t v25 = v24[1];
      if (v25)
      {
        int v26 = *v24;
        keyMasks = self->keyMasks;
        values = self->values;
        unsigned int v29 = keyMasks[v10];
        do
        {
          v29 |= 1 << values[v26].var0;
          keyMasks[v10] = v29;
          ++v26;
          --v25;
        }
        while (v25);
      }
      ++v10;
      size_t count = self->header.objects.count;
      if (v10 >= count)
      {
        if (!p_header->objects.count) {
          goto LABEL_31;
        }
        self->objectsByObjectID = (id *)malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
        uint64_t v30 = self->header.objects.count;
        goto LABEL_32;
      }
    }
  }
  int64_t v11 = 0;
LABEL_31:
  uint64_t v30 = 0;
LABEL_32:
  if (v11 > v30)
  {
    self->objects = (UINibDecoderObjectEntry *)malloc_type_realloc(self->objects, 8 * v30, 0x100004000313F17uLL);
    uint64_t v31 = 160;
    v32 = self->shortObjectClassIDs;
    if (v32)
    {
      size_t v33 = self->header.objects.count;
      unsigned int v34 = 2004306212;
    }
    else
    {
      uint64_t v31 = 152;
      v32 = self->longObjectClassIDs;
      size_t v33 = 4 * self->header.objects.count;
      unsigned int v34 = 1384677904;
    }
    *(Class *)((char *)&self->super.super.isa + v31) = (Class)malloc_type_realloc(v32, v33, v34 | 0x100004000000000);
    self->keyMasks = (unsigned int *)malloc_type_realloc(self->keyMasks, 4 * self->header.objects.count, 0x100004052888210uLL);
  }
  return 1;
}

- (BOOL)validateAndIndexValues:(const void *)a3 length:(unint64_t)a4
{
  if (!self->keyIDTable) {
    -[UINibDecoder validateAndIndexValues:length:]();
  }
  unint64_t v4 = a4;
  p_header = &self->header;
  if (self->header.values.offset > a4) {
    return 0;
  }
  unint64_t offset = self->header.values.offset;
  int64_t count = self->header.values.count;
  if (!count) {
    return 1;
  }
  uint64_t v9 = a3;
  uint64_t v10 = 0;
  int64_t v44 = 0;
  unint64_t v11 = 0;
  v41 = &self->header;
  while (1)
  {
    if (v44 == v10)
    {
      if (v10 + 128 >= count) {
        size_t v12 = count;
      }
      else {
        size_t v12 = v10 + 128;
      }
      self->values = (UINibDecoderValue *)malloc_type_realloc(self->values, 8 * v12, 0x100004000313F17uLL);
      int64_t v44 = v12;
      self->valueTypes = (char *)malloc_type_realloc(self->valueTypes, v12, 0x100004077774924uLL);
    }
    if (UIReadNibArchiveVInt32((uint64_t)v9, v4, (uint64_t *)&offset, (int *)&self->values[v10]))
    {
      unint64_t v13 = offset;
      if (offset >= v4)
      {
        int v14 = 0;
      }
      else
      {
        self->valueTypes[v10] = v9[offset];
        unint64_t offset = v13 + 1;
        int v14 = 1;
      }
    }
    else
    {
      int v14 = 0;
    }
    uint64_t v15 = UIFixedByteLengthForType(self->valueTypes[v10]);
    BOOL result = 0;
    if (!v14 || v15 == -2) {
      break;
    }
    uint64_t v45 = v10;
    unsigned int v46 = 0;
    if (v15 == -1)
    {
      if (!UIReadNibArchiveVInt32((uint64_t)v9, v4, (uint64_t *)&offset, (int *)&v46)) {
        return 0;
      }
      unsigned int v16 = v46;
      unsigned int v17 = v46;
    }
    else
    {
      unsigned int v16 = 0;
      unsigned int v17 = v15;
    }
    unint64_t v18 = offset;
    if (v4 < offset) {
      return 0;
    }
    size_t v19 = v17;
    if (v4 - offset < v17) {
      return 0;
    }
    values = self->values;
    offset += v17;
    values[v45].unsigned int var1 = v11;
    if (v15 == -1)
    {
      unint64_t v42 = v18;
      int v21 = (2 * v16) & 0x7F00 | v16 & 0x7F;
      int v22 = v21 | (4 * v16) & 0x7F0000 | (((v16 >> 21) & 0x7F) << 24);
      int v23 = v21 | 0x8000;
      int v24 = v21 | (((v16 >> 14) & 0x7F) << 16) | 0x800000;
      int v25 = v16 | 0x80;
      valueData = (char *)self->valueData;
      if (v16 >= 0x80) {
        int v25 = v23;
      }
      uint64_t v27 = 1;
      if (v16 >= 0x80) {
        uint64_t v27 = 2;
      }
      if (v16 < 0x4000) {
        int v24 = v25;
      }
      uint64_t v28 = 3;
      if (v16 < 0x4000) {
        uint64_t v28 = v27;
      }
      if (v16 >= 0x200000) {
        unsigned int v29 = v22 | 0x80000000;
      }
      else {
        unsigned int v29 = v24;
      }
      if (v16 >= 0x200000) {
        uint64_t v30 = 4;
      }
      else {
        uint64_t v30 = v28;
      }
      while (1)
      {
        unint64_t valueDataSize = self->valueDataSize;
        unsigned int v32 = v29;
        size_t v33 = v30;
        if (v16 >> 28)
        {
          char v49 = v16 >> 28;
          unsigned int v32 = v22;
          size_t v33 = 5;
        }
        unsigned int __src = v32;
        if (valueDataSize >= v11 && valueDataSize - v11 >= v33) {
          break;
        }
        self->unint64_t valueDataSize = valueDataSize + 512;
        valueData = (char *)malloc_type_realloc(valueData, valueDataSize + 512, 0x4A6A3422uLL);
        self->valueData = valueData;
      }
      memcpy(&valueData[v11], &__src, v33);
      v11 += v33;
      unint64_t v4 = a4;
      p_header = v41;
      unint64_t v18 = v42;
    }
    unint64_t v35 = self->valueDataSize;
    BOOL v36 = v35 >= v11;
    size_t v37 = v35 - v11;
    v38 = (char *)self->valueData;
    while (!v36 || v37 < v19)
    {
      self->unint64_t valueDataSize = v35 + 512;
      v38 = (char *)malloc_type_realloc(v38, v35 + 512, 0xA384DC14uLL);
      self->valueData = v38;
      unint64_t v35 = self->valueDataSize;
      BOOL v36 = v35 >= v11;
      size_t v37 = v35 - v11;
    }
    uint64_t v9 = a3;
    memcpy(&v38[v11], (char *)a3 + v18, v19);
    v11 += v19;
    uint64_t v10 = v45 + 1;
    int64_t count = p_header->values.count;
    if (v45 + 1 >= (unint64_t)count)
    {
      if (v44 > count)
      {
        self->values = (UINibDecoderValue *)malloc_type_realloc(self->values, 8 * count, 0x100004000313F17uLL);
        self->valueTypes = (char *)malloc_type_realloc(self->valueTypes, p_header->values.count, 0x100004077774924uLL);
      }
      return 1;
    }
  }
  return result;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  if (a3 != a4)
  {
    objectsByObjectID = self->objectsByObjectID;
    int64_t objectID = self->recursiveState.objectID;
    if (objectsByObjectID[objectID] == a3)
    {
      objectsByObjectID[objectID] = a4;
      self->recursiveState.replaced = 1;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"This coder only supports replacing the object currently being decoded."];
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = 0;
  p_keyIDCache = &self->keyIDCache;
  do

  while (v3 != 64);
  if (self->objectsByObjectID && self->header.objects.count)
  {
    unint64_t v5 = 0;
    do

    while (v5 < self->header.objects.count);
  }
  UIFreeMissingClasses((void **)&self->missingClasses, self->header.classes.count);
  free(self->classes);
  free(self->objects);
  free(self->values);
  free(self->valueData);
  free(self->objectsByObjectID);
  free(self->shortObjectClassIDs);
  free(self->longObjectClassIDs);
  free(self->valueTypes);
  free(self->keyMasks);

  v6.receiver = self;
  v6.super_class = (Class)UINibDecoder;
  [(UINibDecoder *)&v6 dealloc];
}

- (id)initForReadingWithData:(id)a3
{
  return [(UINibDecoder *)self initForReadingWithData:a3 error:0];
}

- (BOOL)isReusable
{
  return 1;
}

+ (id)unarchiveObjectWithData:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initForReadingWithData:a3 error:0];
  id v4 = (id)[v3 decodeObjectForKey:@"object"];
  [v3 finishDecoding];

  return v4;
}

+ (id)unarchiveObjectWithFile:(id)a3
{
  id result = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a3];
  if (result)
  {
    return (id)[a1 unarchiveObjectWithData:result];
  }
  return result;
}

- (id)nextGenericKey
{
  v2 = NSString;
  int64_t nextGenericKey = self->recursiveState.nextGenericKey;
  self->recursiveState.int64_t nextGenericKey = nextGenericKey + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", @"$%ld", nextGenericKey);
}

- (int64_t)uniqueIDForCurrentlyDecodingObject
{
  return self->recursiveState.objectID;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  uint64_t v17 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v17];
  int64_t result = 0;
  if (!v4) {
    return result;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v17) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      int64_t result = 0;
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return result;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v17) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v17) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  if (!values) {
    return 0;
  }
  int v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4) {
      return v15 == 5;
    }
    return 0;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      int64_t result = valueData[values[v12].var1];
      break;
    case 1:
      int64_t result = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      int64_t result = *(unsigned int *)&valueData[values[v12].var1];
      break;
    case 3:
      int64_t result = *(void *)&valueData[values[v12].var1];
      break;
    default:
      return 0;
  }
  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  uint64_t v18 = 0;
  BOOL v4 = [(UINibStringIDTable *)self->keyIDTable lookupKey:a3 identifier:&v18];
  LODWORD(v5) = 0;
  if (!v4) {
    return v5;
  }
  uint64_t objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v7 = &self->objects[objectID_low];
  unsigned int var0 = v7->var0;
  unsigned int var1 = v7->var1;
  uint64_t nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!nextValueSearchIndex)
    {
LABEL_11:
      LODWORD(v5) = 0;
      if ((int)nextValueSearchIndex + 1 < var1) {
        unsigned int v13 = nextValueSearchIndex + 1;
      }
      else {
        unsigned int v13 = 0;
      }
      self->recursiveState.uint64_t nextValueSearchIndex = v13;
      return v5;
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      if (nextValueSearchIndex == ++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      uint64_t v12 = var0 + v11;
      if (self->values[v12].var0 == v18) {
        break;
      }
      LODWORD(v11) = v11 + 1;
      if (var1 == v11) {
        goto LABEL_7;
      }
    }
  }
  self->recursiveState.uint64_t nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
  {
LABEL_21:
    LODWORD(v5) = 0;
    return v5;
  }
  int v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
    {
      LODWORD(v5) = v15 == 5;
      return v5;
    }
    goto LABEL_21;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      LODWORD(v5) = valueData[values[v12].var1];
      break;
    case 1:
      LODWORD(v5) = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      LODWORD(v5) = *(_DWORD *)&valueData[values[v12].var1];
      break;
    case 3:
      uint64_t v5 = *(void *)&valueData[values[v12].var1];
      break;
    default:
      goto LABEL_21;
  }
  return v5;
}

- (BOOL)decodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5
{
  unint64_t v17 = 0;
  uint64_t v7 = [(UINibDecoder *)self decodeBytesForKey:a5 returnedLength:&v17];
  BOOL v8 = 0;
  if (v7)
  {
    unint64_t v9 = v17;
    if (v17)
    {
      int v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v17 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            unint64_t v13 = 1;
            do
            {
              double v14 = 0.0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                double v14 = *(double *)&v7[v13];
                v13 += 8;
              }
              float v15 = v14;
              *a3++ = v15;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v17 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          unint64_t v11 = 1;
          do
          {
            int v12 = 0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              int v12 = *(_DWORD *)&v7[v11];
              v11 += 4;
            }
            *(_DWORD *)a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (BOOL)decodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  unint64_t v16 = 0;
  uint64_t v7 = [(UINibDecoder *)self decodeBytesForKey:a5 returnedLength:&v16];
  BOOL v8 = 0;
  if (v7)
  {
    unint64_t v9 = v16;
    if (v16)
    {
      int v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v16 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            unint64_t v13 = 1;
            do
            {
              uint64_t v14 = 0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                uint64_t v14 = *(void *)&v7[v13];
                v13 += 8;
              }
              *(void *)a3++ = v14;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v16 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          unint64_t v11 = 1;
          do
          {
            float v12 = 0.0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              float v12 = *(float *)&v7[v11];
              v11 += 4;
            }
            *a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  if (strlen(a3) == 1)
  {
    unsigned int v8 = *(unsigned __int8 *)a3;
    if (v8 <= 0x63)
    {
      if (*(unsigned __int8 *)a3 > 0x3Fu)
      {
        if (v8 != 64)
        {
          if (v8 == 66)
          {
            *(unsigned char *)a4 = [(UINibDecoder *)self decodeBoolForKey:[(UINibDecoder *)self nextGenericKey]];
            return;
          }
          goto LABEL_31;
        }
        id v14 = [(UINibDecoder *)self decodeObjectForKey:[(UINibDecoder *)self nextGenericKey]];
      }
      else if (v8 == 42)
      {
        uint64_t v19 = 0;
        unint64_t v16 = [(UINibDecoder *)self decodeBytesForKey:[(UINibDecoder *)self nextGenericKey] returnedLength:&v19];
        if (v19) {
          size_t v17 = v19 - 1;
        }
        else {
          size_t v17 = 0;
        }
        id v14 = strndup(v16, v17);
      }
      else
      {
        if (v8 != 58)
        {
LABEL_31:
          unint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          SEL v10 = a2;
          unint64_t v11 = self;
          uint64_t v12 = 1070;
          goto LABEL_9;
        }
        unint64_t v13 = [(UINibDecoder *)self decodeObjectForKey:[(UINibDecoder *)self nextGenericKey]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = (id)NSSelectorFromString(v13);
        }
        else {
          id v14 = 0;
        }
      }
    }
    else
    {
      if (*(unsigned __int8 *)a3 <= 0x68u)
      {
        if (v8 == 100)
        {
          [(UINibDecoder *)self decodeDoubleForKey:[(UINibDecoder *)self nextGenericKey]];
          *(void *)a4 = v18;
          return;
        }
        if (v8 == 102)
        {
          [(UINibDecoder *)self decodeDoubleForKey:[(UINibDecoder *)self nextGenericKey]];
          *(float *)&double v15 = v15;
          *(_DWORD *)a4 = LODWORD(v15);
          return;
        }
        goto LABEL_31;
      }
      if (v8 == 105)
      {
        *(_DWORD *)a4 = [(UINibDecoder *)self decodeIntegerForKey:[(UINibDecoder *)self nextGenericKey]];
        return;
      }
      if (v8 != 113)
      {
        if (v8 == 115)
        {
          *(_WORD *)a4 = [(UINibDecoder *)self decodeIntegerForKey:[(UINibDecoder *)self nextGenericKey]];
          return;
        }
        goto LABEL_31;
      }
      id v14 = [(UINibDecoder *)self decodeIntegerForKey:[(UINibDecoder *)self nextGenericKey]];
    }
    *(void *)a4 = v14;
    return;
  }
  unint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  SEL v10 = a2;
  unint64_t v11 = self;
  uint64_t v12 = 1073;
LABEL_9:

  [v9 handleFailureInMethod:v10 object:v11 file:@"UINibDecoder.m" lineNumber:v12 description:@"The UINibDecoder doesn't decode this type. Please switch your NSCoding implementation to using keyed archiving."];
}

- (id)decodeNXObject
{
  return 0;
}

- (id)decodeDataObject
{
  return 0;
}

- (id)decodeObject
{
  uint64_t v3 = 0;
  [(UINibDecoder *)self decodeValueOfObjCType:"@" at:&v3 size:8];
  return v3;
}

- (id)decodePropertyList
{
  return 0;
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);

  [v5 handleFailureInMethod:a2 object:self file:@"UINibDecoder.m" lineNumber:1099 description:@"Unimplemented"];
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);

  [v7 handleFailureInMethod:a2 object:self file:@"UINibDecoder.m" lineNumber:1103 description:@"Unimplemented"];
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  return 0;
}

- (unsigned)systemVersion
{
  return 2000;
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(objc_class *)v3 version];
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = a3;
}

- (void)validateAndIndexObjects:length:.cold.1()
{
}

- (void)validateAndIndexValues:length:.cold.1()
{
}

@end