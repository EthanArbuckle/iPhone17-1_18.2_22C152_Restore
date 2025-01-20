@interface TSTChangeDescriptor
+ (id)changeDescriptorWithType:(int)a3;
+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5;
+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5 strokeRange:(id)a6;
+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRegion:(id)a5 strokeRegion:(id)a6;
+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 strokeRange:(id)a5;
+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4;
+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4 strokeRange:(id)a5;
+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4;
+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4 strokeRegion:(id)a5;
+ (id)changeDescriptorWithType:(int)a3 referenceIdentifiers:(id)a4;
+ (id)changeDescriptorWithType:(int)a3 strokeRange:(id)a4;
+ (id)changeDescriptorWithType:(int)a3 strokeRegion:(id)a4;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID;
- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)expandedRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)strokeRange;
- (BOOL)isEqual:(id)a3;
- (NSHashTable)referenceIdentifiers;
- (TSTCellRegion)cellRegion;
- (TSTCellRegion)expandedRegion;
- (TSTCellRegion)strokeRegion;
- (TSTChangeDescriptor)initWithChangeDescriptorType:(int)a3 andCellRegion:(id)a4 andCellID:(id)a5 andStrokeRegion:(id)a6 andReferenceIdentifiers:(id)a7;
- (id)description;
- (int)changeDescriptor;
- (void)dealloc;
- (void)setExpandedRange:(id)a3;
- (void)setExpandedRegion:(id)a3;
@end

@implementation TSTChangeDescriptor

- (TSTChangeDescriptor)initWithChangeDescriptorType:(int)a3 andCellRegion:(id)a4 andCellID:(id)a5 andStrokeRegion:(id)a6 andReferenceIdentifiers:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TSTChangeDescriptor;
  v12 = [(TSTChangeDescriptor *)&v14 init];
  if (v12)
  {
    v12->mCellRegion = (TSTCellRegion *)a4;
    v12->mCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a5;
    v12->mChangeDescriptor = a3;
    v12->mStrokeRegion = (TSTCellRegion *)a6;
    v12->mExpandedRegion = (TSTCellRegion *)+[TSTCellRegion invalidRegion];
    v12->mReferenceIdentifiers = (NSHashTable *)[a7 copy];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTChangeDescriptor;
  [(TSTChangeDescriptor *)&v3 dealloc];
}

+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4
{
  v4 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:a4 andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion invalidRegion] andReferenceIdentifiers:0];

  return v4;
}

+ (id)changeDescriptorWithType:(int)a3 cellRegion:(id)a4 strokeRegion:(id)a5
{
  v5 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:a4 andCellID:0xFFFFFFLL andStrokeRegion:a5 andReferenceIdentifiers:0];

  return v5;
}

+ (id)changeDescriptorWithType:(int)a3 strokeRegion:(id)a4
{
  v4 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion invalidRegion] andCellID:0xFFFFFFLL andStrokeRegion:a4 andReferenceIdentifiers:0];

  return v4;
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRegion:(id)a5 strokeRegion:(id)a6
{
  v6 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:a5 andCellID:*(unsigned int *)&a4 andStrokeRegion:a6 andReferenceIdentifiers:0];

  return v6;
}

+ (id)changeDescriptorWithType:(int)a3
{
  objc_super v3 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion") andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion invalidRegion] andReferenceIdentifiers:0];

  return v3;
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5
{
  v5 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5) andCellID:*(unsigned int *)&a4 andStrokeRegion:+[TSTCellRegion invalidRegion] andReferenceIdentifiers:0];

  return v5;
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 cellRange:(id)a5 strokeRange:(id)a6
{
  v6 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a5) andCellID:*(unsigned int *)&a4 andStrokeRegion:+[TSTCellRegion regionFromRange:a6] andReferenceIdentifiers:0];

  return v6;
}

+ (id)changeDescriptorWithType:(int)a3 cellID:(id)a4 strokeRange:(id)a5
{
  v5 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion") andCellID:*(unsigned int *)&a4 andStrokeRegion:+[TSTCellRegion regionFromRange:a5] andReferenceIdentifiers:0];

  return v5;
}

+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4
{
  v4 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4) andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion invalidRegion] andReferenceIdentifiers:0];

  return v4;
}

+ (id)changeDescriptorWithType:(int)a3 strokeRange:(id)a4
{
  v4 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion") andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion regionFromRange:a4] andReferenceIdentifiers:0];

  return v4;
}

+ (id)changeDescriptorWithType:(int)a3 cellRange:(id)a4 strokeRange:(id)a5
{
  v5 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4) andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion regionFromRange:a5] andReferenceIdentifiers:0];

  return v5;
}

+ (id)changeDescriptorWithType:(int)a3 referenceIdentifiers:(id)a4
{
  v4 = [[TSTChangeDescriptor alloc] initWithChangeDescriptorType:*(void *)&a3 andCellRegion:+[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion") andCellID:0xFFFFFFLL andStrokeRegion:+[TSTCellRegion invalidRegion] andReferenceIdentifiers:a4];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  if (!a3) {
    goto LABEL_7;
  }
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return (char)v4;
  }
  v5 = v4;
  int mChangeDescriptor = self->mChangeDescriptor;
  if (mChangeDescriptor != [v4 changeDescriptor]) {
    goto LABEL_7;
  }
  LODWORD(v4) = -[TSTCellRegion equalsCellRegion:](self->mCellRegion, "equalsCellRegion:", [v5 cellRegion]);
  if (!v4) {
    return (char)v4;
  }
  if (((*(_DWORD *)&self->mCellID ^ [v5 cellID]) & 0xFFFFFF) == 0)
  {
    LODWORD(v4) = -[TSTCellRegion equalsCellRegion:](self->mStrokeRegion, "equalsCellRegion:", [v5 strokeRegion]);
    if (v4)
    {
      mExpandedRegion = self->mExpandedRegion;
      uint64_t v8 = [v5 expandedRegion];
      LOBYTE(v4) = [(TSTCellRegion *)mExpandedRegion equalsCellRegion:v8];
    }
  }
  else
  {
LABEL_7:
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)strokeRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)[(TSTCellRegion *)self->mStrokeRegion boundingCellRange];
}

- (void)setExpandedRange:(id)a3
{
  self->mExpandedRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:a3];
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)expandedRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)[(TSTCellRegion *)self->mExpandedRegion boundingCellRange];
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)[(TSTCellRegion *)self->mCellRegion boundingCellRange];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t mChangeDescriptor = self->mChangeDescriptor;
  if (mChangeDescriptor > 0x28) {
    v7 = @"UNKNOWN";
  }
  else {
    v7 = off_2646B37C8[mChangeDescriptor];
  }
  uint64_t v8 = (void *)[v3 stringWithFormat:@"<%@:%p type:%@", v5, self, v7];
  if (![(TSTCellRegion *)self->mCellRegion isEmpty])
  {
    $CA3468F20078D5D2DB35E78E73CA60DA v9 = [(TSTCellRegion *)self->mCellRegion boundingCellRange];
    v10 = NSString;
    uint64_t v11 = [NSString stringWithFormat:@"(%hu, %hu)", v9.var0.var1, v9.var0.var0];
    [v8 appendFormat:@" range:%@", objc_msgSend(v10, "stringWithFormat:", @"(%@, %@)", v11, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", v9.var1.var0, HIWORD(*(unint64_t *)&v9)))];
  }
  if (self->mCellID.row != 0xFFFF && (*(_DWORD *)&self->mCellID & 0xFF0000) != 0xFF0000) {
    [v8 appendFormat:@" cell:%@", objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", BYTE2(*(_DWORD *)&self->mCellID), (unsigned __int16)*(_DWORD *)&self->mCellID)];
  }
  if (![(TSTCellRegion *)self->mStrokeRegion isEmpty])
  {
    $CA3468F20078D5D2DB35E78E73CA60DA v12 = [(TSTCellRegion *)self->mStrokeRegion boundingCellRange];
    v13 = NSString;
    uint64_t v14 = [NSString stringWithFormat:@"(%hu, %hu)", v12.var0.var1, v12.var0.var0];
    [v8 appendFormat:@" strokeRange:%@", objc_msgSend(v13, "stringWithFormat:", @"(%@, %@)", v14, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", v12.var1.var0, HIWORD(*(unint64_t *)&v12)))];
  }
  [v8 appendString:@" >"];
  return v8;
}

- (int)changeDescriptor
{
  return self->mChangeDescriptor;
}

- (TSTCellRegion)cellRegion
{
  return self->mCellRegion;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCellID;
}

- (TSTCellRegion)strokeRegion
{
  return self->mStrokeRegion;
}

- (TSTCellRegion)expandedRegion
{
  return self->mExpandedRegion;
}

- (void)setExpandedRegion:(id)a3
{
}

- (NSHashTable)referenceIdentifiers
{
  return self->mReferenceIdentifiers;
}

@end