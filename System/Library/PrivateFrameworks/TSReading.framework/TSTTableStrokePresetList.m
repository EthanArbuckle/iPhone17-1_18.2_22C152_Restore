@interface TSTTableStrokePresetList
+ (id)init;
+ (id)strokePresetListForDefaultPropertyMapForTablePresetIndex:(unint64_t)a3 colors:(id)a4;
+ (id)strokePresetListForDefaultPropertyMapWithFatStroke:(id)a3 andThinStroke:(id)a4;
+ (id)strokePresetListForDefaultPropertyMapWithHorizontalStroke:(id)a3 verticalStroke:(id)a4 exteriorStroke:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)exteriorStrokeForStrokePreset:(unint64_t)a3;
- (id)horizontalStrokeForStrokePreset:(unint64_t)a3;
- (id)presetAtIndex:(unint64_t)a3;
- (id)verticalStrokeForStrokePreset:(unint64_t)a3;
- (unint64_t)count;
- (unsigned)maskForStrokePreset:(unint64_t)a3;
- (void)dealloc;
- (void)setStroke:(id)a3 forPresetIndex:(unint64_t)a4;
- (void)setStrokePreset:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation TSTTableStrokePresetList

+ (id)init
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSTTableStrokePresetList;
  return objc_msgSendSuper2(&v3, sel_init);
}

- (void)dealloc
{
  if (self->mCount)
  {
    unint64_t v3 = 0;
    do

    while (v3 < self->mCount);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTTableStrokePresetList;
  [(TSTTableStrokePresetList *)&v4 dealloc];
}

- (unint64_t)count
{
  return self->mCount;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (v3 != self->mCount) {
    return 0;
  }
  if (!v3) {
    return 1;
  }
  unint64_t v5 = 0;
  mPresets = self->mPresets;
  v7 = (char *)a3 + 16;
  do
  {
    BOOL result = [(TSTTableStrokePresetData *)mPresets[v5] isEqual:*(void *)&v7[8 * v5]];
    if (!result) {
      break;
    }
    ++v5;
  }
  while (v5 < self->mCount);
  return result;
}

- (id)presetAtIndex:(unint64_t)a3
{
  return self->mPresets[a3];
}

- (void)setStrokePreset:(id)a3 atIndex:(unint64_t)a4
{
  if (self->mCount <= a4)
  {
    v9 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSTTableStrokePresetList setStrokePreset:atIndex:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:109 description:@"preset index higher than count"];
  }
  else
  {
    mPresets = self->mPresets;
    v7 = self->mPresets[a4];
    id v8 = a3;
    if (v7) {

    }
    mPresets[a4] = (TSTTableStrokePresetData *)a3;
  }
}

+ (id)strokePresetListForDefaultPropertyMapForTablePresetIndex:(unint64_t)a3 colors:(id)a4
{
  if (a4)
  {
    uint64_t v6 = s_TSTStrokePresetColors[a3];
    v7 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", [a4 objectAtIndex:v6], 1.0);
    id v8 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", [a4 objectAtIndex:v6], 1.0);
    uint64_t v9 = [a4 objectAtIndex:v6];
  }
  else
  {
    v7 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", objc_msgSend(MEMORY[0x263F7C808], "blackColor", a3), 1.0);
    id v8 = +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", [MEMORY[0x263F7C808] blackColor], 1.0);
    uint64_t v9 = [MEMORY[0x263F7C808] blackColor];
  }
  uint64_t v10 = +[TSDStroke strokeWithColor:v9 width:1.0];

  return (id)[a1 strokePresetListForDefaultPropertyMapWithHorizontalStroke:v7 verticalStroke:v8 exteriorStroke:v10];
}

+ (id)strokePresetListForDefaultPropertyMapWithHorizontalStroke:(id)a3 verticalStroke:(id)a4 exteriorStroke:(id)a5
{
  id v8 = objc_alloc_init(TSTTableStrokePresetList);
  v8->mCount = 15;
  uint64_t v9 = [(TSTTableStrokePresetList *)v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      v12 = [[TSTTableStrokePresetData alloc] initWithMask:sHardCodedMasks[i] horizontalStroke:a3 verticalStroke:a4 exteriorStroke:a5];
      [(TSTTableStrokePresetList *)v8 setStrokePreset:v12 atIndex:i];
    }
  }

  return v8;
}

+ (id)strokePresetListForDefaultPropertyMapWithFatStroke:(id)a3 andThinStroke:(id)a4
{
  uint64_t v6 = objc_alloc_init(TSTTableStrokePresetList);
  v6->mCount = 15;
  uint64_t v7 = [(TSTTableStrokePresetList *)v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (unint64_t i = 0; i != v8; ++i)
    {
      if (i >= 3) {
        id v10 = a3;
      }
      else {
        id v10 = a4;
      }
      uint64_t v11 = [[TSTTableStrokePresetData alloc] initWithMask:sHardCodedMasks[i] horizontalStroke:v10 verticalStroke:v10 exteriorStroke:v10];
      [(TSTTableStrokePresetList *)v6 setStrokePreset:v11 atIndex:i];
    }
  }

  return v6;
}

- (id)horizontalStrokeForStrokePreset:(unint64_t)a3
{
  if (self->mCount <= a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableStrokePresetList horizontalStrokeForStrokePreset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 225, @"illegal preset index");
  }
  uint64_t v7 = self->mPresets[a3];

  return [(TSTTableStrokePresetData *)v7 horizontalStroke];
}

- (id)verticalStrokeForStrokePreset:(unint64_t)a3
{
  if (self->mCount <= a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableStrokePresetList verticalStrokeForStrokePreset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 234, @"illegal preset index");
  }
  uint64_t v7 = self->mPresets[a3];

  return [(TSTTableStrokePresetData *)v7 verticalStroke];
}

- (id)exteriorStrokeForStrokePreset:(unint64_t)a3
{
  if (self->mCount <= a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableStrokePresetList exteriorStrokeForStrokePreset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 244, @"illegal preset index");
  }
  uint64_t v7 = self->mPresets[a3];

  return [(TSTTableStrokePresetData *)v7 exteriorStroke];
}

- (unsigned)maskForStrokePreset:(unint64_t)a3
{
  if (self->mCount <= a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableStrokePresetList maskForStrokePreset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStrokePresetList.mm"), 253, @"illegal preset index");
  }
  uint64_t v7 = self->mPresets[a3];

  return [(TSTTableStrokePresetData *)v7 mask];
}

- (void)setStroke:(id)a3 forPresetIndex:(unint64_t)a4
{
  uint64_t v6 = -[TSTTableStrokePresetData initWithMask:horizontalStroke:verticalStroke:exteriorStroke:]([TSTTableStrokePresetData alloc], "initWithMask:horizontalStroke:verticalStroke:exteriorStroke:", objc_msgSend(-[TSTTableStrokePresetList presetAtIndex:](self, "presetAtIndex:", a4), "mask"), a3, a3, a3);
  [(TSTTableStrokePresetList *)self setStrokePreset:v6 atIndex:a4];
}

@end