@interface PKMediaSize
+ (id)mediaSizeWithWidth:(int)a3 height:(int)a4;
- (BOOL)hasValidIntegerTypesForXAndY;
- (BOOL)yDimensionIsRange;
- (_NSRange)getRange:(id)a3;
- (_NSRange)yRange;
- (id)userCodableDictionary;
- (int)getInt:(id)a3;
- (int)getThingType:(id)a3;
- (int)xDimension;
- (int)yDimension;
@end

@implementation PKMediaSize

- (int)getThingType:(id)a3
{
  id v4 = a3;
  v5 = [(PKCollectionSpecialization *)self collection];
  v6 = [v5 _findAttribute0:v4 valueTag:0];

  if (v6) {
    int v7 = objc_msgSend(v6, "value_tag");
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (int)getInt:(id)a3
{
  id v4 = a3;
  v5 = [(PKCollectionSpecialization *)self collection];
  v6 = [v5 _findAttribute0:v4 valueTag:0];

  int v7 = [v6 values];
  v8 = [v7 objectAtIndexedSubscript:0];
  int v9 = [v8 integer];

  return v9;
}

- (_NSRange)getRange:(id)a3
{
  id v4 = a3;
  v5 = [(PKCollectionSpecialization *)self collection];
  v6 = [v5 _findAttribute0:v4 valueTag:0];

  if (v6)
  {
    if (objc_msgSend(v6, "value_tag") == 33)
    {
      int v7 = [v6 values];
      v8 = [v7 objectAtIndexedSubscript:0];
      int v9 = v8;
      if (v8) {
        [v8 range];
      }
      else {
        uint64_t v16 = 0;
      }

      uint64_t v10 = (int)v16 - 1;
      uint64_t v11 = SHIDWORD(v16) - (uint64_t)(int)v16;
    }
    else
    {
      v12 = [v6 values];
      v13 = [v12 objectAtIndexedSubscript:0];
      uint64_t v10 = (int)[v13 integer];

      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }

  NSUInteger v14 = v10;
  NSUInteger v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

- (BOOL)hasValidIntegerTypesForXAndY
{
  return [(PKMediaSize *)self getThingType:@"x-dimension"] == 33
      && [(PKMediaSize *)self getThingType:@"y-dimension"] == 33;
}

- (int)xDimension
{
  return [(PKMediaSize *)self getInt:@"x-dimension"];
}

- (int)yDimension
{
  return [(PKMediaSize *)self getInt:@"y-dimension"];
}

- (BOOL)yDimensionIsRange
{
  return [(PKMediaSize *)self getThingType:@"y-dimension"] == 51;
}

- (_NSRange)yRange
{
  NSUInteger v2 = [(PKMediaSize *)self getRange:@"y-dimension"];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)userCodableDictionary
{
  NSUInteger v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[PKMediaSize xDimension](self, "xDimension"));
  [v3 setObject:v4 forKeyedSubscript:@"x-dimension"];

  if ([(PKMediaSize *)self yDimensionIsRange])
  {
    v5 = (void *)MEMORY[0x263F08D40];
    uint64_t v6 = [(PKMediaSize *)self yRange];
    objc_msgSend(v5, "valueWithRange:", v6, v7);
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[PKMediaSize yDimension](self, "yDimension"));
  v8 = };
  [v3 setObject:v8 forKeyedSubscript:@"y-dimension"];

  return v3;
}

+ (id)mediaSizeWithWidth:(int)a3 height:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_new();
  [v6 _addInteger:0 valueTag:33 name:@"x-dimension" value:v5];
  [v6 _addInteger:0 valueTag:33 name:@"y-dimension" value:v4];
  uint64_t v7 = [(PKCollectionSpecialization *)[PKMediaSize alloc] initWithCollection:v6];

  return v7;
}

@end