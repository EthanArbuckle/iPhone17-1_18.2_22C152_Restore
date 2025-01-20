@interface PXLayoutSection
- (BOOL)isAccurate;
- (CGRect)frame;
- (CGSize)size;
- (NSArray)geometryKinds;
- (PXLayoutSection)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)geometriesWithKind:(int64_t)a3;
- (int64_t)index;
- (unint64_t)identifier;
- (void)enumerateGeometriesWithBlock:(id)a3;
- (void)setAccurate:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeometries:(id)a3 withKind:(int64_t)a4;
- (void)setGeometryKinds:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIndex:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation PXLayoutSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryKinds, 0);
  objc_storeStrong((id *)&self->_geometriesByKind, 0);
}

- (void)setGeometryKinds:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setIndex:(int64_t)a3
{
  self->_indedouble x = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setAccurate:(BOOL)a3
{
  self->_accurate = a3;
}

- (BOOL)isAccurate
{
  return self->_accurate;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CGSize)size
{
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
}

- (NSArray)geometryKinds
{
  return (NSArray *)[(NSMutableDictionary *)self->_geometriesByKind allKeys];
}

- (void)enumerateGeometriesWithBlock:(id)a3
{
  id v4 = a3;
  geometriesByKind = self->_geometriesByKind;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PXLayoutSection_enumerateGeometriesWithBlock___block_invoke;
  v7[3] = &unk_1E5DD0120;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)geometriesByKind enumerateKeysAndObjectsUsingBlock:v7];
}

void __48__PXLayoutSection_enumerateGeometriesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v6)
      {
        [v6 geometryAtIndex:v7];
      }
      else
      {
        uint64_t v10 = 0;
        memset(v9, 0, sizeof(v9));
      }
      (*(void (**)(uint64_t, _OWORD *, unsigned char *))(v8 + 16))(v8, v9, a4);
      if (*a4) {
        break;
      }
      ++v7;
    }
    while (v7 < [v6 count]);
  }
}

- (id)geometriesWithKind:(int64_t)a3
{
  geometriesByKind = self->_geometriesByKind;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)geometriesByKind objectForKeyedSubscript:v4];

  return v5;
}

- (void)setGeometries:(id)a3 withKind:(int64_t)a4
{
  id v8 = a3;
  geometriesByKind = self->_geometriesByKind;
  unint64_t v7 = [NSNumber numberWithInteger:a4];
  if (v8) {
    [(NSMutableDictionary *)geometriesByKind setObject:v8 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)geometriesByKind removeObjectForKey:v7];
  }
}

- (id)description
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PXLayoutSection;
  v3 = [(PXLayoutSection *)&v32 description];
  id v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" index:%ld", self->_index);

  v5 = NSStringFromCGRect(self->_frame);
  id v6 = [v4 stringByAppendingFormat:@" frame:%@", v5];

  BOOL v7 = [(PXLayoutSection *)self isAccurate];
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  v9 = [v6 stringByAppendingFormat:@" isAccurate:%@", v8];

  uint64_t v10 = [v9 stringByAppendingString:@" geometryItems:{\r"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_geometriesByKind;
  uint64_t v27 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v13 = [v10 stringByAppendingFormat:@" kind: %@:{\r", v12];

        v14 = [(NSMutableDictionary *)self->_geometriesByKind objectForKeyedSubscript:v12];
        if ([v14 count])
        {
          unint64_t v15 = 0;
          do
          {
            if (v14)
            {
              [v14 geometryAtIndex:v15];
              uint64_t v16 = 0;
              uint64_t v17 = 0;
            }
            else
            {
              uint64_t v17 = 0;
              uint64_t v16 = 0;
            }
            v18 = NSString;
            v19 = NSStringFromCGPoint(*(CGPoint *)&v16);
            v36.double width = 0.0;
            v36.double height = 0.0;
            v20 = NSStringFromCGSize(v36);
            v21 = [v18 stringWithFormat:@"  [geometry[%ld] = {center:%@, size:%@}]\r", 0, v19, v20];

            v22 = [v13 stringByAppendingString:v21];

            ++v15;
            v13 = v22;
          }
          while (v15 < [v14 count]);
        }
        else
        {
          v22 = v13;
        }
        uint64_t v10 = [v22 stringByAppendingString:@"}"];
      }
      uint64_t v27 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v27);
  }

  v23 = [v10 stringByAppendingString:@"}"];

  return v23;
}

- (PXLayoutSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXLayoutSection;
  v2 = [(PXLayoutSection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    geometriesByKind = v2->_geometriesByKind;
    v2->_geometriesByKind = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[3] = self->_identifier;
  *((unsigned char *)v4 + 16) = self->_accurate;
  v4[4] = self->_index;
  CGSize size = self->_frame.size;
  *((_OWORD *)v4 + 3) = self->_frame.origin;
  *((CGSize *)v4 + 4) = size;
  uint64_t v6 = [(NSMutableDictionary *)self->_geometriesByKind mutableCopy];
  BOOL v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

@end