@interface TUIKBGraphSerialization
+ (id)separatorCharacterSet;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)UIKBValueForOffset:(int *)a3;
- (BOOL)stringIsSimple:(id)a3;
- (CGRect)CGRectForOffset:(int *)a3;
- (NSData)serializedData;
- (NSMutableData)graphData;
- (NSMutableDictionary)deserializationCache;
- (NSMutableDictionary)keyboardOffsets;
- (TUIKBGraphSerialization)init;
- (float)bareFloatForOffset:(int *)a3;
- (float)compressedFloatForOffset:(int *)a3 withKind:(unsigned __int8)a4;
- (id)UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4;
- (id)_UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4;
- (id)_objectAtSerializedOffset:(int)a3;
- (id)arrayForOffset:(int *)a3 withCount:(unint64_t)a4;
- (id)dataForArray:(id)a3;
- (id)dataForBareFloat:(float)a3;
- (id)dataForCGRect:(CGRect)a3;
- (id)dataForCompressedFloat:(float)a3 kind:(unsigned __int8 *)a4;
- (id)dataForCompressedInt:(int64_t)a3;
- (id)dataForCompressedUInt:(unint64_t)a3;
- (id)dataForDictionary:(id)a3;
- (id)dataForFlags:(unsigned __int8)a3;
- (id)dataForFloat:(float)a3;
- (id)dataForGeometry:(id)a3;
- (id)dataForInt:(int)a3;
- (id)dataForMergeAction:(id)a3;
- (id)dataForObject:(id)a3;
- (id)dataForOffsetObject:(id)a3;
- (id)dataForReference:(int)a3;
- (id)dataForSet:(id)a3;
- (id)dataForShape:(id)a3;
- (id)dataForSimpleString:(id)a3;
- (id)dataForString:(id)a3;
- (id)dataForStringConcat:(id)a3;
- (id)dataForUIKBTree:(id)a3;
- (id)dataForUIKBValue:(id)a3;
- (id)dictionaryForOffset:(int *)a3 nonEmpty:(BOOL)a4;
- (id)geometryForOffset:(int *)a3 withFlags:(unint64_t)a4;
- (id)keyboardForName:(id)a3;
- (id)keyboardPrefixForWidth:(float)a3 andEdge:(BOOL)a4;
- (id)keyboardSuffixForPortraitWidth:(float)a3;
- (id)mergeActionForOffset:(int *)a3 withFlags:(unint64_t)a4;
- (id)mutableDataForObjectType:(unsigned __int8)a3;
- (id)mutableDataForObjectType:(unsigned __int8)a3 withSize:(unint64_t)a4;
- (id)objectForOffset:(int *)a3;
- (id)refArrayForOffset:(int *)a3 withCount:(unint64_t)a4;
- (id)relativeRefArrayForOffset:(int *)a3 withCount:(unint64_t)a4;
- (id)sanitizedDictionary:(id)a3;
- (id)setForOffset:(int *)a3 nonEmpty:(BOOL)a4;
- (id)shapeForOffset:(int *)a3 withFlags:(unint64_t)a4;
- (id)simpleStringForOffset:(int *)a3 withUTF8Length:(unint64_t)a4;
- (id)statistics;
- (id)stringConcatForOffset:(int *)a3 withComponentCount:(unint64_t)a4;
- (id)stringsBySplittingString:(id)a3 afterCharactersInSet:(id)a4;
- (int)_serializedOffsetForObject:(id)a3;
- (int)intValueForOffset:(int *)a3;
- (int64_t)currentFileType;
- (unint64_t)compressedIntForOffset:(int *)a3;
- (unint64_t)compressedUIntForOffset:(int *)a3;
- (unint64_t)serializedObjectCount;
- (unsigned)flagsForOffset:(int *)a3;
- (void)addKeyboardPrefix:(id)a3 forWidth:(float)a4 minEdge:(BOOL)a5;
- (void)dealloc;
- (void)persistData:(id)a3 forObject:(id)a4;
- (void)preheatWithStatistics:(id)a3;
- (void)reset;
- (void)serializeObject:(id)a3;
- (void)setCurrentFileType:(int64_t)a3;
- (void)setDeserializationCache:(id)a3;
- (void)setSerializedData:(id)a3;
@end

@implementation TUIKBGraphSerialization

- (void)setCurrentFileType:(int64_t)a3
{
  self->_currentFileType = a3;
}

- (int64_t)currentFileType
{
  return self->_currentFileType;
}

- (void)setDeserializationCache:(id)a3
{
}

- (NSMutableDictionary)deserializationCache
{
  return self->_deserializationCache;
}

- (id)keyboardPrefixForWidth:(float)a3 andEdge:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 56;
  if (a4) {
    uint64_t v5 = 48;
  }
  v6 = *(Class *)((char *)&self->super.isa + v5);
  v7 = objc_msgSend((id)objc_msgSend(v6, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_44);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id result = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v9 = result;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
        [v12 floatValue];
        if (v13 <= a3) {
          return (id)[v6 objectForKey:v12];
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id result = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v9 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t __58__TUIKBGraphSerialization_keyboardPrefixForWidth_andEdge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 floatValue];
  float v6 = v5;
  [a3 floatValue];
  if (v6 == v7) {
    return 0;
  }
  [a2 floatValue];
  float v10 = v9;
  [a3 floatValue];
  if (v10 <= v11) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)keyboardSuffixForPortraitWidth:(float)a3
{
  if (a3 < 320.0) {
    return @"Mini";
  }
  if (a3 < 730.0) {
    return @"Small";
  }
  v4 = @"Grand";
  if (a3 < 1024.0) {
    v4 = @"Large";
  }
  if (a3 >= 815.0) {
    return v4;
  }
  else {
    return @"Medium";
  }
}

- (void)addKeyboardPrefix:(id)a3 forWidth:(float)a4 minEdge:(BOOL)a5
{
  uint64_t v6 = 56;
  if (a5) {
    uint64_t v6 = 48;
  }
  float v7 = *(Class *)((char *)&self->super.isa + v6);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithFloat:");
  [v7 setObject:a3 forKey:v8];
}

- (id)objectForOffset:(int *)a3
{
  uint64_t v5 = [NSNumber numberWithInt:*a3];
  uint64_t v6 = (void *)[(NSMutableDictionary *)[(TUIKBGraphSerialization *)self deserializationCache] objectForKey:v5];
  if (!v6)
  {
    uint64_t v8 = [(NSData *)self->_graphData bytes];
    uint64_t v9 = *a3;
    unint64_t v10 = v8[v9];
    *a3 = v9 + 1;
    int v11 = v10 & 0xF;
    unint64_t v12 = v10 >> 4;
    if ((v10 >> 4) == 15) {
      unint64_t v12 = [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
    }
    switch(v11)
    {
      case 0:
        int v17 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:", a3, v12);
        return [(TUIKBGraphSerialization *)self objectForOffset:&v17];
      case 1:
        uint64_t v13 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:", a3, v12);
        long long v14 = NSNumber;
        return (id)[v14 numberWithInt:v13];
      case 2:
        -[TUIKBGraphSerialization floatValueForOffset:](self, "floatValueForOffset:", a3, v12);
        long long v15 = NSNumber;
        return (id)objc_msgSend(v15, "numberWithFloat:");
      case 3:
        id v16 = [(TUIKBGraphSerialization *)self simpleStringForOffset:a3 withUTF8Length:v12];
        goto LABEL_25;
      case 4:
        id v16 = [(TUIKBGraphSerialization *)self stringConcatForOffset:a3 withComponentCount:v12];
        goto LABEL_25;
      case 5:
        id v16 = [(TUIKBGraphSerialization *)self arrayForOffset:a3 withCount:v12];
        goto LABEL_25;
      case 6:
        id v16 = [(TUIKBGraphSerialization *)self setForOffset:a3 nonEmpty:v12 != 0];
        goto LABEL_25;
      case 7:
        id v16 = [(TUIKBGraphSerialization *)self dictionaryForOffset:a3 nonEmpty:v12 != 0];
        goto LABEL_25;
      case 8:
        id v16 = [(TUIKBGraphSerialization *)self geometryForOffset:a3 withFlags:v12];
        goto LABEL_25;
      case 9:
        id v16 = [(TUIKBGraphSerialization *)self shapeForOffset:a3 withFlags:v12];
        goto LABEL_25;
      case 10:
        id v16 = [(TUIKBGraphSerialization *)self mergeActionForOffset:a3 withFlags:v12];
        goto LABEL_25;
      case 11:
        id v16 = [(TUIKBGraphSerialization *)self UIKBTreeForOffset:a3 withFlags:v12];
        goto LABEL_25;
      case 12:
        id v16 = [(TUIKBGraphSerialization *)self refArrayForOffset:a3 withCount:v12];
        goto LABEL_25;
      case 13:
        id v16 = [(TUIKBGraphSerialization *)self relativeRefArrayForOffset:a3 withCount:v12];
LABEL_25:
        uint64_t v6 = v16;
        if (v16 && [(TUIKBGraphSerialization *)self deserializationCache]) {
          [(NSMutableDictionary *)[(TUIKBGraphSerialization *)self deserializationCache] setObject:v6 forKey:v5];
        }
        break;
      default:
        return 0;
    }
  }
  return v6;
}

- (id)_UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4 = a4;
  ++*a3;
  uint64_t v7 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:");
  if (v4)
  {
    id v8 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
    if ((v4 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = 0;
    if ((v4 & 2) != 0)
    {
LABEL_3:
      id v9 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
      goto LABEL_6;
    }
  }
  id v9 = (id)[MEMORY[0x1E4F1CA60] dictionary];
LABEL_6:
  id v10 = v9;
  if ((v4 & 4) != 0)
  {
    id v11 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
    if ((v4 & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    id v12 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if ((v4 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  id v12 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
LABEL_11:
  id v13 = (id)[objc_alloc(MEMORY[0x1E4FB18C0]) initWithType:v7 withName:v8 withProperties:v10 withSubtrees:v11 withCache:v12];
  if (([v13 isLeafType] & 1) == 0 && !v11) {
    objc_msgSend(v13, "setSubtrees:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
  }
  return v13;
}

- (id)UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  uint64_t v7 = (void *)MEMORY[0x192FA0BA0](self, a2);
  id v8 = [(TUIKBGraphSerialization *)self _UIKBTreeForOffset:a3 withFlags:a4];
  return v8;
}

- (id)mergeActionForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1890]);
  objc_msgSend(v7, "setRemainingKeyName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  objc_msgSend(v7, "setDisappearingKeyName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  if (v4) {
    objc_msgSend(v7, "setOrderedKeyList:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  }
  if ((v4 & 2) != 0) {
    objc_msgSend(v7, "setFactors:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  }
  return v7;
}

- (id)shapeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB18B8]);
  if (v4) {
    objc_msgSend(v7, "setGeometry:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  }
  [(TUIKBGraphSerialization *)self CGRectForOffset:a3];
  objc_msgSend(v7, "setFrame:");
  [(TUIKBGraphSerialization *)self CGRectForOffset:a3];
  objc_msgSend(v7, "setPaddedFrame:");
  return v7;
}

- (CGRect)CGRectForOffset:(int *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSData *)self->_graphData bytes];
  uint64_t v6 = 0;
  uint64_t v7 = *a3;
  unsigned int v8 = v5[v7];
  *a3 = v7 + 1;
  id v9 = v15;
  do
  {
    [(TUIKBGraphSerialization *)self compressedFloatForOffset:a3 withKind:(v8 >> v6) & 3];
    *(_DWORD *)v9++ = v10;
    v6 += 2;
  }
  while (v6 != 8);
  double v11 = v15[0];
  double v12 = v15[1];
  double v13 = v15[2];
  double v14 = v15[3];
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)geometryForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1880]);
  objc_msgSend(v7, "setName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  uint64_t v8 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setX:", v8, v9);
  uint64_t v10 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setY:", v10, v11);
  uint64_t v12 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setW:", v12, v13);
  uint64_t v14 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setH:", v14, v15);
  uint64_t v16 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setPaddingTop:", v16, v17);
  uint64_t v18 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setPaddingLeft:", v18, v19);
  uint64_t v20 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setPaddingBottom:", v20, v21);
  uint64_t v22 = [(TUIKBGraphSerialization *)self UIKBValueForOffset:a3];
  objc_msgSend(v7, "setPaddingRight:", v22, v23);
  [v7 setExplicitlySpecified:a4 & 1];
  [v7 setIsTemplate:(a4 >> 1) & 1];
  return v7;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)UIKBValueForOffset:(int *)a3
{
  uint64_t v5 = [(NSData *)self->_graphData bytes];
  uint64_t v6 = *a3;
  unsigned int v7 = v5[v6];
  *a3 = v6 + 1;
  if ((v7 & 0xF) == 0xF) {
    uint64_t v8 = 100;
  }
  else {
    uint64_t v8 = v7 & 0xF;
  }
  [(TUIKBGraphSerialization *)self compressedFloatForOffset:a3 withKind:v7 >> 4];
  double v10 = v9;
  uint64_t v11 = v8;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (id)dictionaryForOffset:(int *)a3 nonEmpty:(BOOL)a4
{
  if (a4)
  {
    id v6 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:");
    id v7 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
    return (id)[v8 dictionaryWithObjects:v7 forKeys:v6];
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CA60];
    return (id)objc_msgSend(v10, "dictionary", a3);
  }
}

- (id)setForOffset:(int *)a3 nonEmpty:(BOOL)a4
{
  if (a4)
  {
    id v4 = [(TUIKBGraphSerialization *)self objectForOffset:a3];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)[v5 setWithArray:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)objc_msgSend(v7, "set", a3);
  }
}

- (id)relativeRefArrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  id v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      if (v8) {
        v9 += [(TUIKBGraphSerialization *)self compressedIntForOffset:a3];
      }
      else {
        int v9 = [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
      }
      int v11 = v9;
      objc_msgSend(v7, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v11));
      ++v8;
    }
    while (a4 != v8);
  }
  return v7;
}

- (id)refArrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  unint64_t v4 = a4;
  for (i = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4]; v4; --v4)
  {
    int v9 = 0;
    int v9 = [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
    objc_msgSend(i, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v9));
  }
  return i;
}

- (id)arrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  unint64_t v4 = a4;
  for (i = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4]; v4; --v4)
    objc_msgSend(i, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  return i;
}

- (id)stringConcatForOffset:(int *)a3 withComponentCount:(unint64_t)a4
{
  id v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    unsigned int v8 = 1;
    do
    {
      int v11 = 0;
      int v11 = [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
      objc_msgSend(v7, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v11));
      unint64_t v9 = v8++;
    }
    while (v9 < a4);
  }
  return (id)[v7 componentsJoinedByString:&stru_1EDC653C0];
}

- (id)simpleStringForOffset:(int *)a3 withUTF8Length:(unint64_t)a4
{
  id v6 = [(NSData *)self->_graphData bytes] + *a3;
  id result = (id)[[NSString alloc] initWithBytes:v6 length:a4 encoding:4];
  *a3 += a4;
  return result;
}

- (float)compressedFloatForOffset:(int *)a3 withKind:(unsigned __int8)a4
{
  if (a4 == 3)
  {
    [(TUIKBGraphSerialization *)self bareFloatForOffset:a3];
  }
  else if (a4 == 2)
  {
    return (float)-[TUIKBGraphSerialization compressedIntForOffset:](self, "compressedIntForOffset:", a3, v4, v5) / 6.0;
  }
  else
  {
    float result = 0.0;
    if (a4 == 1) {
      return (float)-[TUIKBGraphSerialization compressedIntForOffset:](self, "compressedIntForOffset:", a3, 0.0, v4, v5);
    }
  }
  return result;
}

- (float)bareFloatForOffset:(int *)a3
{
  uint64_t v4 = [(NSData *)self->_graphData bytes];
  uint64_t v5 = *a3;
  *a3 = v5 + 4;
  return *(float *)&v4[v5];
}

- (int)intValueForOffset:(int *)a3
{
  return [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
}

- (unsigned)flagsForOffset:(int *)a3
{
  return [(TUIKBGraphSerialization *)self compressedUIntForOffset:a3];
}

- (unint64_t)compressedUIntForOffset:(int *)a3
{
  uint64_t v4 = [(NSData *)self->_graphData bytes];
  unint64_t result = 0;
  int v6 = 0;
  uint64_t v7 = *a3;
  int v8 = v7 + 1;
  unint64_t v9 = &v4[v7];
  do
  {
    char v10 = *v9++;
    result |= (unint64_t)(v10 & 0x7F) << v6;
    *a3 = v8;
    v6 += 7;
    ++v8;
  }
  while (v10 < 0);
  return result;
}

- (unint64_t)compressedIntForOffset:(int *)a3
{
  uint64_t v4 = [(NSData *)self->_graphData bytes];
  uint64_t v5 = *a3;
  int v6 = (char)v4[v5];
  char v7 = v4[v5];
  unint64_t v8 = v7 & 0x3F;
  uint64_t v9 = v5 + 1;
  *a3 = v5 + 1;
  if (v6 < 0)
  {
    int v10 = v5 + 2;
    int v11 = &v4[v9];
    int v12 = 6;
    do
    {
      char v13 = *v11++;
      v8 |= (unint64_t)(v13 & 0x7F) << v12;
      *a3 = v10;
      v12 += 7;
      ++v10;
    }
    while (v13 < 0);
  }
  if ((v7 & 0x40) != 0) {
    return -(uint64_t)v8;
  }
  else {
    return v8;
  }
}

- (id)keyboardForName:(id)a3
{
  id v5 = -[NSDictionary objectForKey:](self->_keyboardOffsets, "objectForKey:");
  if (v5)
  {
    int v7 = [v5 intValue];
    return [(TUIKBGraphSerialization *)self objectForOffset:&v7];
  }
  else
  {
    [MEMORY[0x1E4F1CAD0] setWithObject:a3];
    _CFPropertyListCreateFiltered();
    return 0;
  }
}

- (void)setSerializedData:(id)a3
{
  self->_serializedData = (NSData *)a3;
  self->_graphData = (NSData *)a3;
  int v12 = 0;

  self->_minEdgeWidths = (NSMutableDictionary *)objc_msgSend(-[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v12), "mutableCopy");
  self->_maxEdgeWidths = (NSMutableDictionary *)objc_msgSend(-[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v12), "mutableCopy");
  int v5 = [(TUIKBGraphSerialization *)self compressedUIntForOffset:&v12];
  int v6 = [(NSData *)self->_graphData bytes];
  int v7 = &v6[v12];

  self->_keyboardOffsetsData = (NSData *)(id)[MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:v5 freeWhenDone:0];
  self->_keyboardOffsets = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v12 + (uint64_t)v5;
  v12 += v5;
  uint64_t v9 = &v6[v8];
  int v10 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v11 = [a3 length];
  self->_graphData = (NSData *)(id)[v10 dataWithBytesNoCopy:v9 length:v11 - v12 freeWhenDone:0];
}

- (NSData)serializedData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  serializedData = self->_serializedData;
  if (!serializedData)
  {
    self->_disableOffsets = 1;
    uint64_t v4 = [(NSDictionary *)self->_keyboardOffsets allKeys];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v10 = [(NSDictionary *)self->_keyboardOffsets objectForKey:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [(NSDictionary *)self->_keyboardOffsets objectForKey:v10];
            int v12 = [(TUIKBGraphSerialization *)self keyboardOffsets];
            if (v11) {
              [(NSMutableDictionary *)v12 setObject:v11 forKey:v9];
            }
            else {
              [(NSMutableDictionary *)v12 removeObjectForKey:v9];
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
    id v13 = [(TUIKBGraphSerialization *)self dataForDictionary:self->_minEdgeWidths];
    id v14 = [(TUIKBGraphSerialization *)self dataForDictionary:self->_maxEdgeWidths];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", -[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets"), 200, 0, 0);
    id v16 = -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", (int)[v15 length]);
    self->_disableOffsets = 0;
    serializedData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v14, "length")+ objc_msgSend(v13, "length")+ objc_msgSend(v15, "length")+ objc_msgSend(v16, "length"));
    [(NSData *)serializedData appendData:v13];
    [(NSData *)serializedData appendData:v14];
    [(NSData *)serializedData appendData:v16];
    [(NSData *)serializedData appendData:v15];
    [(NSData *)serializedData appendData:self->_graphData];
    self->_serializedData = serializedData;
  }
  return serializedData;
}

- (unint64_t)serializedObjectCount
{
  return [(NSMapTable *)self->_serializedOffsets count];
}

- (void)preheatWithStatistics:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 allKeys];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__TUIKBGraphSerialization_preheatWithStatistics___block_invoke;
  v15[3] = &unk_1E55940F8;
  float v15[4] = a3;
  uint64_t v6 = (void *)[v5 sortedArrayUsingComparator:v15];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      [(TUIKBGraphSerialization *)self serializeObject:*(void *)(*((void *)&v11 + 1) + 8 * v10)];
      if ([(NSData *)self->_graphData length] > 0x3FFE) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

uint64_t __49__TUIKBGraphSerialization_preheatWithStatistics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:"), "compare:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2));
  if (!result)
  {
    return [a2 compare:a3];
  }
  return result;
}

- (id)statistics
{
  v2 = self->_referenceCount;
  return v2;
}

- (void)serializeObject:(id)a3
{
  if (!self->_disableOffsets)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_referenceCount, "objectForKey:", a3), "integerValue");
      -[NSMutableDictionary setObject:forKey:](self->_referenceCount, "setObject:forKey:", [NSNumber numberWithInteger:v5 + 1], a3);
    }
    if (![(TUIKBGraphSerialization *)self dataForOffsetObject:a3])
    {
      id v6 = [(TUIKBGraphSerialization *)self dataForObject:a3];
      if (v6) {
        [(TUIKBGraphSerialization *)self persistData:v6 forObject:a3];
      }
    }
    self->_serializedData = 0;
  }
}

- (id)_objectAtSerializedOffset:(int)a3
{
  int v4 = a3;
  return [(TUIKBGraphSerialization *)self objectForOffset:&v4];
}

- (int)_serializedOffsetForObject:(id)a3
{
  if (!a3) {
    return -1;
  }
  id v3 = -[NSMapTable objectForKey:](self->_serializedOffsets, "objectForKey:");
  if (!v3) {
    return -1;
  }
  return [v3 intValue];
}

- (void)persistData:(id)a3 forObject:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a4 type] == 1)
    {
      uint64_t v7 = [(TUIKBGraphSerialization *)self keyboardOffsets];
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_graphData, "length")), objc_msgSend(a4, "name"));
    }
    -[NSMapTable setObject:forKey:](self->_serializedOffsets, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_graphData, "length")), a4);
    uint64_t v8 = [(TUIKBGraphSerialization *)self graphData];
    [(NSMutableData *)v8 appendData:a3];
  }
}

- (id)dataForObject:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 intValue];
    return [(TUIKBGraphSerialization *)self dataForInt:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [(TUIKBGraphSerialization *)self dataForString:a3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return [(TUIKBGraphSerialization *)self dataForArray:a3];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          return [(TUIKBGraphSerialization *)self dataForSet:a3];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            return [(TUIKBGraphSerialization *)self dataForDictionary:a3];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              return [(TUIKBGraphSerialization *)self dataForGeometry:a3];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                return [(TUIKBGraphSerialization *)self dataForShape:a3];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  return [(TUIKBGraphSerialization *)self dataForMergeAction:a3];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    return [(TUIKBGraphSerialization *)self dataForUIKBTree:a3];
                  }
                  else
                  {
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)dataForOffsetObject:(id)a3
{
  if (self->_disableOffsets) {
    return 0;
  }
  id v5 = [(NSMapTable *)self->_serializedOffsets objectForKey:a3];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = [v5 intValue];
  return [(TUIKBGraphSerialization *)self dataForReference:v6];
}

- (id)dataForUIKBTree:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a3 type] == 9)
  {
    uint64_t v5 = [a3 shape];
    return [(TUIKBGraphSerialization *)self dataForShape:v5];
  }
  if ([a3 type] != 10)
  {
    id v8 = [(TUIKBGraphSerialization *)self dataForOffsetObject:a3];
    if (v8) {
      return v8;
    }
    if ([a3 type] == 1)
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "properties"), "objectForKey:", @"Alias");
      if (v9)
      {
        -[NSMutableDictionary setObject:forKey:](-[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets"), "setObject:forKey:", v9, [a3 name]);
        return 0;
      }
    }
    uint64_t v10 = (void *)[a3 properties];
    id v11 = (id)objc_msgSend((id)objc_msgSend(a3, "subtrees"), "mutableCopy");
    if ([a3 type] == 2)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v12 = objc_msgSend(a3, "subtrees", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v17 type] == 10)
            {
              uint64_t v10 = (void *)[v17 properties];
            }
            else if ([v17 type] != 14)
            {
              continue;
            }
            [v11 removeObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
      if (![(TUIKBGraphSerialization *)self dataForOffsetObject:v10]) {
        [(TUIKBGraphSerialization *)self serializeObject:v10];
      }
    }
    unsigned __int8 v18 = [a3 name] != 0;
    if ([v10 count]) {
      v18 |= 2u;
    }
    if ([v11 count]) {
      v18 |= 4u;
    }
    uint64_t v19 = [a3 cache];
    unsigned __int8 v20 = v18 | 8;
    if (!v19) {
      unsigned __int8 v20 = v18;
    }
    id v8 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:11 withFlags:v20];
    objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForInt:](self, "dataForInt:", objc_msgSend(a3, "type")));
    if ([a3 name]) {
      objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "name")));
    }
    if ([v10 count]) {
      objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", v10));
    }
    if ([v11 count]) {
      objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v11));
    }
    if ([a3 cache]) {
      objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", objc_msgSend(a3, "cache")));
    }
    return v8;
  }
  uint64_t v7 = [a3 properties];
  return [(TUIKBGraphSerialization *)self dataForDictionary:v7];
}

- (id)dataForMergeAction:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    BOOL v6 = objc_msgSend((id)objc_msgSend(a3, "orderedKeyList"), "count") != 0;
    if ([a3 factors]) {
      uint64_t v7 = v6 | 2u;
    }
    else {
      uint64_t v7 = v6;
    }
    id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:10 withFlags:v7];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "remainingKeyName")));
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "disappearingKeyName")));
    if (objc_msgSend((id)objc_msgSend(a3, "orderedKeyList"), "count")) {
      objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", objc_msgSend(a3, "orderedKeyList")));
    }
    if ([a3 factors]) {
      objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForGeometry:](self, "dataForGeometry:", objc_msgSend(a3, "factors")));
    }
  }
  return v5;
}

- (id)dataForShape:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    if ([a3 geometry])
    {
      unsigned int v6 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "usesAutomaticMetrics");
      id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:9 withFlags:v6];
      if (v6) {
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForGeometry:](self, "dataForGeometry:", objc_msgSend(a3, "geometry")));
      }
    }
    else
    {
      id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:9 withFlags:0];
    }
    [a3 frame];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCGRect:](self, "dataForCGRect:"));
    [a3 paddedFrame];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCGRect:](self, "dataForCGRect:"));
  }
  return v5;
}

- (id)dataForCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = (void *)[MEMORY[0x1E4F1CA58] data];
  char v15 = 0;
  [v8 appendBytes:&v15 length:1];
  char v14 = 0;
  *(float *)&double v9 = x;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v9));
  v15 |= v14;
  *(float *)&double v10 = y;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v10));
  v15 |= 4 * v14;
  *(float *)&double v11 = width;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v11));
  v15 |= 16 * v14;
  *(float *)&double v12 = height;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v12));
  v15 |= v14 << 6;
  objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, 1, &v15);
  return v8;
}

- (id)dataForGeometry:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    unsigned int v6 = [a3 explicitlySpecified];
    if ([a3 isTemplate]) {
      uint64_t v7 = v6 | 2;
    }
    else {
      uint64_t v7 = v6;
    }
    id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:8 withFlags:v7];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "name")));
    uint64_t v8 = [a3 x];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v8, v9));
    uint64_t v10 = [a3 y];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v10, v11));
    uint64_t v12 = [a3 w];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v12, v13));
    uint64_t v14 = [a3 h];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v14, v15));
    uint64_t v16 = [a3 paddingTop];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v16, v17));
    uint64_t v18 = [a3 paddingLeft];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v18, v19));
    uint64_t v20 = [a3 paddingBottom];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v20, v21));
    uint64_t v22 = [a3 paddingRight];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v22, v23));
  }
  return v5;
}

- (id)dataForUIKBValue:(id)a3
{
  char var1 = a3.var1;
  double var0 = a3.var0;
  unsigned int v6 = (void *)[MEMORY[0x1E4F1CA58] data];
  char v11 = 0;
  [v6 appendBytes:&v11 length:1];
  *(float *)&double v7 = var0;
  objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v11, v7));
  if (var1 == 100) {
    char v8 = 15;
  }
  else {
    char v8 = var1;
  }
  char v10 = v8 | (16 * v11);
  objc_msgSend(v6, "replaceBytesInRange:withBytes:", 0, 1, &v10);
  return v6;
}

- (id)dataForDictionary:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (v5) {
    return v5;
  }
  id v6 = [(TUIKBGraphSerialization *)self sanitizedDictionary:a3];
  if ((int)[v6 count] >= 1)
  {
    id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:7 withSize:1];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = __Block_byref_object_copy__8386;
    uint64_t v19 = __Block_byref_object_dispose__8387;
    uint64_t v20 = 0;
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = 0;
    char v10 = &v9;
    uint64_t v11 = 0x3052000000;
    uint64_t v12 = __Block_byref_object_copy__8386;
    uint64_t v13 = __Block_byref_object_dispose__8387;
    uint64_t v14 = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__TUIKBGraphSerialization_dataForDictionary___block_invoke;
    v8[3] = &unk_1E55940D0;
    v8[4] = &v15;
    v8[5] = &v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v16[5]));
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v10[5]));
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v15, 8);
    return v5;
  }
  return [(TUIKBGraphSerialization *)self mutableDataForObjectType:7 withSize:0];
}

uint64_t __45__TUIKBGraphSerialization_dataForDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v5 addObject:a3];
}

- (id)sanitizedDictionary:(id)a3
{
  int v4 = (void *)[a3 mutableCopy];
  [v4 removeObjectForKey:*MEMORY[0x1E4FB2AD0]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__TUIKBGraphSerialization_sanitizedDictionary___block_invoke;
  v6[3] = &unk_1E55940A8;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return v4;
}

uint64_t __47__TUIKBGraphSerialization_sanitizedDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = (void *)*MEMORY[0x1E4FB2AE8];
  if ([a2 isEqual:*MEMORY[0x1E4FB2AE8]])
  {
    double v7 = *(void **)(a1 + 32);
    char v8 = NSNumber;
    uint64_t v9 = visualStyleFromString();
LABEL_7:
    uint64_t v10 = [v8 numberWithUnsignedInt:v9];
    goto LABEL_8;
  }
  id v6 = (void *)*MEMORY[0x1E4FB2AA0];
  if ([a2 isEqual:*MEMORY[0x1E4FB2AA0]])
  {
    double v7 = *(void **)(a1 + 32);
    char v8 = NSNumber;
    uint64_t v9 = attributeValueFromString();
    goto LABEL_7;
  }
  id v6 = (void *)*MEMORY[0x1E4FB2AA8];
  if ([a2 isEqual:*MEMORY[0x1E4FB2AA8]])
  {
    double v7 = *(void **)(a1 + 32);
    char v8 = NSNumber;
    uint64_t v9 = variantsTypeFromString();
    goto LABEL_7;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2A70]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2A78]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2A80]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2A88]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2A90]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2AC8]];
  if (result) {
    return result;
  }
  uint64_t result = [a2 isEqual:*MEMORY[0x1E4FB2AD8]];
  if (result) {
    return result;
  }
  id v6 = (void *)*MEMORY[0x1E4FB2A68];
  if (![a2 isEqual:*MEMORY[0x1E4FB2A68]])
  {
    if ([a2 isEqual:*MEMORY[0x1E4FB2A98]])
    {
      if ([a3 isEqualToString:*MEMORY[0x1E4FB2AB0]]) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2;
      }
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v15];
      uint64_t v12 = v16;
    }
    else
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if ((result & 1) == 0) {
        return result;
      }
      uint64_t result = attributeValueFromString();
      if (!result) {
        return result;
      }
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v11 = [NSNumber numberWithUnsignedInt:attributeValueFromString()];
      uint64_t v12 = v17;
    }
    uint64_t v13 = a2;
    goto LABEL_9;
  }
  double v7 = *(void **)(a1 + 32);
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "integerValue"));
LABEL_8:
  uint64_t v11 = v10;
  uint64_t v12 = v7;
  uint64_t v13 = v6;
LABEL_9:
  return [v12 setObject:v11 forKey:v13];
}

- (id)dataForSet:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (v5) {
    return v5;
  }
  if ((int)[a3 count] >= 1)
  {
    id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:6 withSize:1];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", objc_msgSend(a3, "allObjects")));
    return v5;
  }
  return [(TUIKBGraphSerialization *)self mutableDataForObjectType:6 withSize:0];
}

- (id)dataForArray:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    if (self->_disableOffsets)
    {
      id v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 5, [a3 count]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v7 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(a3);
            }
            uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            id v12 = [(TUIKBGraphSerialization *)self dataForOffsetObject:v11];
            if (!v12)
            {
              [(TUIKBGraphSerialization *)self serializeObject:v11];
              id v12 = [(TUIKBGraphSerialization *)self dataForOffsetObject:v11];
              if (!v12)
              {
                id v12 = [(TUIKBGraphSerialization *)self dataForObject:v11];
                if (!v12) {
                  continue;
                }
              }
            }
            [v5 appendData:v12];
          }
          uint64_t v8 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v14 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(a3);
            }
            uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
            uint64_t v19 = [(TUIKBGraphSerialization *)self _serializedOffsetForObject:v18];
            if (v19 == -1)
            {
              [(TUIKBGraphSerialization *)self serializeObject:v18];
              uint64_t v19 = [(TUIKBGraphSerialization *)self _serializedOffsetForObject:v18];
            }
            objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v19));
          }
          uint64_t v15 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v15);
      }
      id v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 13, [a3 count]);
      if ([v13 count])
      {
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", (int)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "intValue")));
        if ((unint64_t)[v13 count] >= 2)
        {
          unint64_t v20 = 1;
          do
          {
            objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedInt:](self, "dataForCompressedInt:", (int)(objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v20), "intValue")- objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v20 - 1), "intValue"))));
            ++v20;
          }
          while (v20 < [v13 count]);
        }
      }
    }
  }
  return v5;
}

- (id)dataForString:(id)a3
{
  if (-[TUIKBGraphSerialization stringIsSimple:](self, "stringIsSimple:") || self->_disableOffsets)
  {
    return [(TUIKBGraphSerialization *)self dataForSimpleString:a3];
  }
  else
  {
    return [(TUIKBGraphSerialization *)self dataForStringConcat:a3];
  }
}

- (id)dataForSimpleString:(id)a3
{
  id v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    int v6 = [a3 lengthOfBytesUsingEncoding:4];
    id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:3 withSize:v6];
    if (v6 >= 1) {
      objc_msgSend(v5, "appendBytes:length:", objc_msgSend(a3, "cStringUsingEncoding:", 4), v6);
    }
  }
  return v5;
}

- (id)dataForStringConcat:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = -[TUIKBGraphSerialization stringsBySplittingString:afterCharactersInSet:](self, "stringsBySplittingString:afterCharactersInSet:", a3, [(id)objc_opt_class() separatorCharacterSet]);
  id v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 4, [v4 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [(TUIKBGraphSerialization *)self serializeObject:v10];
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", -[TUIKBGraphSerialization _serializedOffsetForObject:](self, "_serializedOffsetForObject:", v10)));
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (BOOL)stringIsSimple:(id)a3
{
  return (unint64_t)[a3 length] < 2
      || objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", objc_msgSend((id)objc_opt_class(), "separatorCharacterSet"), 0, 1, objc_msgSend(a3, "length") - 2) == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)stringsBySplittingString:(id)a3 afterCharactersInSet:(id)a4
{
  uint64_t v6 = [a3 length];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", a4, 0, v8, v6);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v6 = v10 - v8 + v9;
      }
      objc_msgSend(v7, "addObject:", objc_msgSend(a3, "substringWithRange:", v8, v6));
      v8 += v6;
      uint64_t v11 = [a3 length];
      uint64_t v6 = v11 - v8;
    }
    while (v11 != v8);
  }
  return v7;
}

- (id)dataForReference:(int)a3
{
  id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:0];
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a3));
  return v5;
}

- (id)dataForFloat:(float)a3
{
  id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:2];
  *(float *)&double v6 = a3;
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForBareFloat:](self, "dataForBareFloat:", v6));
  return v5;
}

- (id)dataForBareFloat:(float)a3
{
  float v4 = a3;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:4];
}

- (id)dataForInt:(int)a3
{
  id v5 = [(TUIKBGraphSerialization *)self mutableDataForObjectType:1];
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a3));
  return v5;
}

- (id)dataForFlags:(unsigned __int8)a3
{
  return [(TUIKBGraphSerialization *)self dataForCompressedUInt:a3];
}

- (id)dataForCompressedFloat:(float)a3 kind:(unsigned __int8 *)a4
{
  if (a3 == 0.0)
  {
    *a4 = 0;
    return (id)[MEMORY[0x1E4F1C9B8] data];
  }
  if (a3 > 0.0)
  {
    if (vabds_f32(roundf(a3), a3) < 0.001)
    {
      *a4 = 1;
      unint64_t v5 = llroundf(a3);
      return [(TUIKBGraphSerialization *)self dataForCompressedInt:v5];
    }
    if (fabsf(roundf(a3 * 6.0) - (float)(a3 * 6.0)) < 0.001)
    {
      *a4 = 2;
      unint64_t v5 = llroundf(a3 * 6.0);
      return [(TUIKBGraphSerialization *)self dataForCompressedInt:v5];
    }
  }
  *a4 = 3;
  return -[TUIKBGraphSerialization dataForBareFloat:](self, "dataForBareFloat:");
}

- (id)dataForCompressedUInt:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = 0;
    do
    {
      BOOL v4 = a3 > 0x7F;
      char v5 = a3 > 0x7F;
      char v6 = a3 & 0x7F;
      a3 >>= 7;
      v9[v3++] = v6 | (v5 << 7);
    }
    while (v4);
    uint64_t v7 = v3;
  }
  else
  {
    v9[0] = 0;
    uint64_t v7 = 1;
  }
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:v7];
}

- (id)dataForCompressedInt:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v12[0] = 0;
LABEL_12:
    uint64_t v10 = 1;
    return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:v10];
  }
  if (a3 >= 0) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = -a3;
  }
  char v4 = ((unint64_t)a3 >> 57) & 0x40 | v3 & 0x3F;
  if (v3 > 0x3F) {
    v4 |= 0x80u;
  }
  v12[0] = v4;
  if (v3 < 0x40) {
    goto LABEL_12;
  }
  unint64_t v5 = v3 >> 6;
  uint64_t v6 = 1;
  do
  {
    BOOL v7 = v5 > 0x7F;
    char v8 = v5 > 0x7F;
    char v9 = v5 & 0x7F;
    v5 >>= 7;
    v12[v6++] = v9 | (v8 << 7);
  }
  while (v7);
  uint64_t v10 = v6;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:v10];
}

- (id)mutableDataForObjectType:(unsigned __int8)a3 withSize:(unint64_t)a4
{
  if (a4 > 0xE)
  {
    char v8 = a3 | 0xF0;
    unint64_t v5 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytes:&v8 length:1];
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a4));
  }
  else
  {
    char v9 = a3 | (16 * a4);
    return (id)[MEMORY[0x1E4F1CA58] dataWithBytes:&v9 length:1];
  }
  return v5;
}

- (id)mutableDataForObjectType:(unsigned __int8)a3
{
  return [(TUIKBGraphSerialization *)self mutableDataForObjectType:a3 withSize:0];
}

- (NSMutableDictionary)keyboardOffsets
{
  return (NSMutableDictionary *)self->_keyboardOffsets;
}

- (NSMutableData)graphData
{
  return (NSMutableData *)self->_graphData;
}

- (void)reset
{
  [(NSMapTable *)self->_serializedOffsets removeAllObjects];
  [(NSMutableDictionary *)self->_minEdgeWidths removeAllObjects];
  [(NSMutableDictionary *)self->_maxEdgeWidths removeAllObjects];

  [(NSMutableDictionary *)self->_referenceCount removeAllObjects];
  self->_keyboardOffsetsData = 0;
  [(NSMutableDictionary *)[(TUIKBGraphSerialization *)self keyboardOffsets] removeAllObjects];
  unint64_t v3 = [(TUIKBGraphSerialization *)self graphData];
  -[NSMutableData setData:](v3, "setData:", [MEMORY[0x1E4F1C9B8] data]);

  self->_serializedData = 0;
  self->_currentFileType = -1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TUIKBGraphSerialization;
  [(TUIKBGraphSerialization *)&v3 dealloc];
}

- (TUIKBGraphSerialization)init
{
  v4.receiver = self;
  v4.super_class = (Class)TUIKBGraphSerialization;
  v2 = [(TUIKBGraphSerialization *)&v4 init];
  if (v2)
  {
    v2->_serializedOffsets = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v2->_minEdgeWidths = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v2->_maxEdgeWidths = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v2->_keyboardOffsets = (NSDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v2->_graphData = (NSData *)(id)[MEMORY[0x1E4F1CA58] data];
    v2->_referenceCount = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v2->_serializedData = 0;
    v2->_currentFileType = -1;
  }
  return v2;
}

+ (id)separatorCharacterSet
{
  if (separatorCharacterSet_once != -1) {
    dispatch_once(&separatorCharacterSet_once, &__block_literal_global_8396);
  }
  return (id)separatorCharacterSet_set;
}

id __48__TUIKBGraphSerialization_separatorCharacterSet__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-_"];
  separatorCharacterSet_set = (uint64_t)result;
  return result;
}

@end