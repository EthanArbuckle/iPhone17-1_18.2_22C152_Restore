@interface PTFocusBlurMap
- (CGRect)_boxFromComponent:(id)a3;
- (CGRect)_inputSensorPixelRect;
- (CGRect)_normalRectFromPixelRect:(CGRect)a3;
- (CGRect)_pixelRectFromNormalRect:(CGRect)a3;
- (CGRect)_sensorPixelRectFromRegion:(id)a3;
- (CGRect)_sensorPixelRectFromTileRect:(CGRect)a3;
- (CGRect)_tileRectFromNodes:(id)a3;
- (CGRect)_tileRectFromSensorPixelRect:(CGRect)a3;
- (CGRect)_validNormalizedRectFromSensorPixelRect:(CGRect)a3;
- (CGRect)autoFocusRect;
- (CGRect)focusValidNormalizedRect;
- (CGRect)inputValidNormalizedRect;
- (CGRect)validNormalizedRectFromRegion:(id)a3;
- (NSIndexSet)inFocusRegion;
- (NSIndexSet)largestFocusRegion;
- (PTFocusBlurMap)init;
- (PTFocusBlurMap)initWithFocusBlurMapData:(id)a3 sensorSize:(CGSize)a4 validSensorRect:(CGRect)a5;
- (PTFocusBlurMap)initWithFocusBlurMapDictionary:(id)a3;
- (id)_blurExtendedNodes:(id)a3 blurMin:(int)a4 blurMax:(int)a5;
- (id)_blurExtendedNodes:(id)a3 options:(unint64_t)a4;
- (id)_connectedComponentWithNode:(unint64_t)a3 unvisited:(id)a4;
- (id)_connectedComponents:(id)a3;
- (id)_inFocusNodes;
- (id)_largestOfComponents:(id)a3;
- (id)_nodesBetweenBlurMin:(int)a3 blurMax:(int)a4;
- (id)_nodesForNormalizedRect:(CGRect)a3;
- (id)_nodesFromTileRect:(CGRect)a3;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)inputX;
- (unint64_t)inputY;
- (unint64_t)sensorHeight;
- (unint64_t)sensorWidth;
- (unint64_t)tileCountX;
- (unint64_t)tileCountY;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (unint64_t)tileXForTile:(unint64_t)a3;
- (unint64_t)tileYForTile:(unint64_t)a3;
- (unint64_t)validHeight;
- (unint64_t)validWidth;
- (unint64_t)validX;
- (unint64_t)validY;
- (void)_getBlurRangeOfNodes:(id)a3 blurMin:(int *)a4 blurMax:(int *)a5;
- (void)_initValidRectFromSensorWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)dealloc;
- (void)setAutoFocusRect:(CGRect)a3;
@end

@implementation PTFocusBlurMap

- (PTFocusBlurMap)init
{
  v5.receiver = self;
  v5.super_class = (Class)PTFocusBlurMap;
  v2 = [(PTFocusBlurMap *)&v5 init];
  if (v2)
  {
    v2->_map = (PTFigCaptureStreamFocusBlurMap *)malloc_type_calloc(1uLL, 0x1028uLL, 0x10000404F0D65F2uLL);
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_autoFocusRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_autoFocusRect.size = v3;
  }
  return v2;
}

- (void)dealloc
{
  map = self->_map;
  if (map) {
    free(map);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTFocusBlurMap;
  [(PTFocusBlurMap *)&v4 dealloc];
}

- (PTFocusBlurMap)initWithFocusBlurMapData:(id)a3 sensorSize:(CGSize)a4 validSensorRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.height;
  double v10 = a4.width;
  id v12 = a3;
  if (![v12 length]) {
    goto LABEL_7;
  }
  v17.receiver = self;
  v17.super_class = (Class)PTFocusBlurMap;
  self = [(PTFocusBlurMap *)&v17 init];
  if (self)
  {
    v13 = (PTFigCaptureStreamFocusBlurMap *)malloc_type_malloc([v12 length], 0xFA178D6EuLL);
    self->_map = v13;
    objc_msgSend(v12, "getBytes:length:", v13, objc_msgSend(v12, "length"));
    map = self->_map;
    if (map->var0 && map->var1.var12 * (unint64_t)map->var1.var11 - 1 <= 0x1FF)
    {
      self->_sensorWidth = (unint64_t)v10;
      self->_sensorHeight = (unint64_t)v9;
      self->_validX = (unint64_t)x;
      self->_validY = (unint64_t)y;
      self->_validWidth = (unint64_t)width;
      self->_validHeight = (unint64_t)height;
      goto LABEL_6;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
LABEL_6:
  self = self;
  v15 = self;
LABEL_8:

  return v15;
}

- (PTFocusBlurMap)initWithFocusBlurMapDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PTFocusBlurMap *)self init];
  v6 = v5;
  if (!v5) {
    goto LABEL_25;
  }
  map = v5->_map;
  if (!map) {
    goto LABEL_25;
  }
  v8 = [v4 objectForKeyedSubscript:@"flow"];
  double v9 = v8;
  if (v8)
  {
    double v10 = [(PTFocusBlurMap *)v8 objectForKeyedSubscript:@"frame"];
    if (!v10)
    {

LABEL_24:
      double v9 = 0;
      goto LABEL_26;
    }
    v11 = v10;
    id v12 = [v10 objectForKeyedSubscript:@"focusPos"];
    map->var1.var0 = [v12 intValue];

    v13 = [(PTFocusBlurMap *)v9 objectForKeyedSubscript:@"regions"];
    v14 = [v13 objectAtIndexedSubscript:0];

    if (!v14
      || ([v14 objectForKeyedSubscript:@"enabled"],
          v15 = objc_claimAutoreleasedReturnValue(),
          v6->_map->var0 = [v15 BOOLValue],
          v15,
          !v6->_map->var0))
    {
      int v33 = 1;
      goto LABEL_23;
    }
    v49 = v11;
    v16 = [v14 objectForKeyedSubscript:@"sizeX"];
    v6->_sensorWidth = (int)[v16 intValue];

    objc_super v17 = [v14 objectForKeyedSubscript:@"sizeY"];
    v6->_sensorHeight = (int)[v17 intValue];

    [(PTFocusBlurMap *)v6 _initValidRectFromSensorWidth:v6->_sensorWidth height:v6->_sensorHeight];
    v18 = [v14 objectForKeyedSubscript:@"startX"];
    map->var1.var1 = [v18 intValue];

    v19 = [v14 objectForKeyedSubscript:@"startY"];
    map->var1.var2 = [v19 intValue];

    v20 = [v14 objectForKeyedSubscript:@"sizeX"];
    map->var1.var3 = [v20 intValue];

    v21 = [v14 objectForKeyedSubscript:@"sizeY"];
    map->var1.var4 = [v21 intValue];

    v22 = [v14 objectForKeyedSubscript:@"startX"];
    map->var1.var5 = [v22 intValue];

    v23 = [v14 objectForKeyedSubscript:@"startY"];
    map->var1.var6 = [v23 intValue];

    v24 = [v14 objectForKeyedSubscript:@"sizeX"];
    map->var1.var7 = [v24 intValue];

    v25 = [v14 objectForKeyedSubscript:@"sizeY"];
    map->var1.var8 = [v25 intValue];

    v26 = [v14 objectForKeyedSubscript:@"tileSizeX"];
    map->var1.var9 = [v26 intValue];

    v27 = [v14 objectForKeyedSubscript:@"tileSizeY"];
    map->var1.var10 = [v27 intValue];

    v28 = [v14 objectForKeyedSubscript:@"tileCountX"];
    map->var1.var11 = [v28 intValue];

    v29 = [v14 objectForKeyedSubscript:@"tileCountY"];
    map->var1.var12 = [v29 intValue];

    v30 = [v14 objectForKeyedSubscript:@"tiles"];
    if (v30)
    {
      unint64_t v31 = map->var1.var12 * (unint64_t)map->var1.var11;
      if (v31 <= 0x200)
      {
        if (!v31)
        {
LABEL_21:
          int v33 = 0;
          goto LABEL_22;
        }
        uint64_t v34 = 0;
        p_var5 = &v6->_map->var2[0].var5;
        while (1)
        {
          v36 = [v30 objectAtIndexedSubscript:v34];
          v37 = [v36 objectForKeyedSubscript:@"defocus"];
          [v37 floatValue];
          *((_WORD *)p_var5 - 3) = vcvts_n_s32_f32(v38, 8uLL);

          v39 = [v30 objectAtIndexedSubscript:v34];
          v40 = [v39 objectForKeyedSubscript:@"conf"];
          int v41 = [v40 intValue];
          __int16 v42 = v41 + 255;
          if (v41 >= 0) {
            HIBYTE(v42) = BYTE1(v41);
          }
          *(p_var5 - 4) = HIBYTE(v42);

          v43 = [v30 objectAtIndexedSubscript:v34];
          v44 = [v43 objectForKeyedSubscript:@"flags"];

          if (!v44) {
            break;
          }
          v45 = [v44 objectForKeyedSubscript:@"valid"];
          *(p_var5 - 2) = [v45 BOOLValue];

          v46 = [v44 objectForKeyedSubscript:@"flat"];
          *(p_var5 - 1) = [v46 BOOLValue];

          v47 = [v44 objectForKeyedSubscript:@"level"];
          unsigned __int8 *p_var5 = [v47 intValue];
          p_var5 += 8;

          if (v31 == ++v34) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        v32 = _PTLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[PTFocusBlurMap initWithFocusBlurMapDictionary:](v31, v32);
        }
      }
    }
    int v33 = 1;
LABEL_22:
    v11 = v49;

LABEL_23:
    if (v33) {
      goto LABEL_24;
    }
LABEL_25:
    double v9 = v6;
  }
LABEL_26:

  return v9;
}

- (void)_initValidRectFromSensorWidth:(unint64_t)a3 height:(unint64_t)a4
{
  float v4 = (float)a3 / 1.78;
  self->_validWidth = a3;
  self->_validHeight = (unint64_t)v4;
  self->_validX = 0;
  self->_validY = a4 - ((unint64_t)v4 >> 1);
}

- (NSIndexSet)inFocusRegion
{
  CGSize v3 = -[PTFocusBlurMap _nodesForNormalizedRect:](self, "_nodesForNormalizedRect:", self->_autoFocusRect.origin.x, self->_autoFocusRect.origin.y, self->_autoFocusRect.size.width, self->_autoFocusRect.size.height);
  float v4 = [(PTFocusBlurMap *)self _blurExtendedNodes:v3 options:1];

  return (NSIndexSet *)v4;
}

- (NSIndexSet)largestFocusRegion
{
  CGSize v3 = [(PTFocusBlurMap *)self inFocusRegion];
  float v4 = [(PTFocusBlurMap *)self _connectedComponents:v3];
  objc_super v5 = [(PTFocusBlurMap *)self _largestOfComponents:v4];

  return (NSIndexSet *)v5;
}

- (CGRect)_inputSensorPixelRect
{
  map = self->_map;
  LOWORD(v2) = map->var1.var1;
  double v7 = (double)v2;
  LOWORD(v3) = map->var1.var2;
  double v8 = (double)v3;
  LOWORD(v4) = map->var1.var3;
  double v9 = (double)v4;
  LOWORD(v5) = map->var1.var4;
  double v10 = (double)v5;
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)inputValidNormalizedRect
{
  map = self->_map;
  LOBYTE(v2) = map->var1.var11;
  double v5 = (double)v2;
  LOBYTE(v2) = map->var1.var12;
  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:", 0.0, 0.0, v5, (double)v2);

  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)focusValidNormalizedRect
{
  unint64_t v3 = [(PTFocusBlurMap *)self largestFocusRegion];
  [(PTFocusBlurMap *)self _sensorPixelRectFromRegion:v3];
  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)validNormalizedRectFromRegion:(id)a3
{
  [(PTFocusBlurMap *)self _sensorPixelRectFromRegion:a3];

  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (unint64_t)inputX
{
  return self->_map->var1.var1;
}

- (unint64_t)inputY
{
  return self->_map->var1.var2;
}

- (unint64_t)inputWidth
{
  return self->_map->var1.var3;
}

- (unint64_t)inputHeight
{
  return self->_map->var1.var4;
}

- (unint64_t)tileWidth
{
  return self->_map->var1.var9;
}

- (unint64_t)tileHeight
{
  return self->_map->var1.var10;
}

- (unint64_t)tileCountX
{
  return self->_map->var1.var11;
}

- (unint64_t)tileCountY
{
  return self->_map->var1.var12;
}

- (unint64_t)tileXForTile:(unint64_t)a3
{
  return a3 % self->_map->var1.var11;
}

- (unint64_t)tileYForTile:(unint64_t)a3
{
  return a3 / self->_map->var1.var11;
}

- (id)_nodesForNormalizedRect:(CGRect)a3
{
  -[PTFocusBlurMap _pixelRectFromNormalRect:](self, "_pixelRectFromNormalRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PTFocusBlurMap _tileRectFromSensorPixelRect:](self, "_tileRectFromSensorPixelRect:");

  return -[PTFocusBlurMap _nodesFromTileRect:](self, "_nodesFromTileRect:");
}

- (id)_nodesBetweenBlurMin:(int)a3 blurMax:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  double v7 = [MEMORY[0x1E4F28D60] indexSet];
  double v8 = [(PTFocusBlurMap *)self _blurExtendedNodes:v7 blurMin:v5 blurMax:v4];

  return v8;
}

- (id)_blurExtendedNodes:(id)a3 blurMin:(int)a4 blurMax:(int)a5
{
  id v8 = a3;
  double v9 = (void *)[v8 mutableCopy];
  map = self->_map;
  if (map->var1.var12 * (unint64_t)map->var1.var11)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 40;
    do
    {
      int v13 = *(__int16 *)(&map->var0 + v12);
      if (v13 >= a4 && v13 <= a5)
      {
        [v9 addIndex:v11];
        map = self->_map;
      }
      ++v11;
      v12 += 8;
    }
    while (v11 < map->var1.var12 * (unint64_t)map->var1.var11);
  }
  double v15 = (void *)[v9 copy];

  return v15;
}

- (void)_getBlurRangeOfNodes:(id)a3 blurMin:(int *)a4 blurMax:(int *)a5
{
  id v8 = a3;
  *a4 = 0x7FFFFFFF;
  *a5 = 0x80000000;
  id v12 = v8;
  uint64_t v9 = [v8 firstIndex];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v9; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend(v12, "indexGreaterThanIndex:"))
    {
      int var0 = self->_map->var2[i].var0;
      if (*a4 > var0) {
        *a4 = var0;
      }
      if (*a5 < var0) {
        *a5 = var0;
      }
    }
  }
}

- (id)_blurExtendedNodes:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  uint64_t v11 = 0;
  if (![v6 count])
  {
    if ((v4 & 2) != 0) {
      uint64_t v7 = 4294967040;
    }
    else {
      uint64_t v7 = 0;
    }
    HIDWORD(v11) = v7;
    uint64_t v8 = 0x7FFFFFFFLL;
    goto LABEL_14;
  }
  [(PTFocusBlurMap *)self _getBlurRangeOfNodes:v6 blurMin:(char *)&v11 + 4 blurMax:&v11];
  uint64_t v7 = HIDWORD(v11);
  if ((v4 & 1) == 0)
  {
    uint64_t v8 = v11;
    if ((v4 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (SHIDWORD(v11) >= 1)
  {
    uint64_t v7 = 0;
    HIDWORD(v11) = 0;
  }
  uint64_t v8 = v11;
  if ((v11 & 0x80000000) == 0)
  {
    if ((v4 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  uint64_t v8 = 0;
  LODWORD(v11) = 0;
  if ((v4 & 2) != 0)
  {
LABEL_13:
    uint64_t v7 = (v7 - 256);
    HIDWORD(v11) = v7;
    uint64_t v8 = (v8 + 256);
LABEL_14:
    LODWORD(v11) = v8;
  }
LABEL_15:
  uint64_t v9 = [(PTFocusBlurMap *)self _blurExtendedNodes:v6 blurMin:v7 blurMax:v8];

  return v9;
}

- (id)_inFocusNodes
{
  unint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  map = self->_map;
  if (map->var1.var12 * (unint64_t)map->var1.var11)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 42;
    do
    {
      if (*(&map->var0 + v6))
      {
        [v3 addIndex:v5];
        map = self->_map;
      }
      ++v5;
      v6 += 8;
    }
    while (v5 < map->var1.var12 * (unint64_t)map->var1.var11);
  }
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (id)_connectedComponentWithNode:(unint64_t)a3 unvisited:(id)a4
{
  id v6 = a4;
  v23 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v7 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
  uint64_t v8 = v7;
  while ([v7 count])
  {
    unint64_t v9 = [v8 firstIndex];
    [v23 addIndex:v9];
    [v8 removeIndex:v9];
    [v6 removeIndex:v9];
    unint64_t var11 = self->_map->var1.var11;
    unint64_t v11 = v9 / var11;
    unint64_t v12 = v9 % var11;
    for (uint64_t i = -1; i != 2; ++i)
    {
      unint64_t v14 = i + v11;
      uint64_t v15 = -1;
      uint64_t v16 = 3;
      do
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          unint64_t v17 = v15 + v12;
          if ((uint64_t)(v15 + v12) >= 0)
          {
            map = self->_map;
            if (v14 < map->var1.var12)
            {
              unint64_t v19 = map->var1.var11;
              if (v17 < v19)
              {
                unint64_t v20 = v17 + v14 * v19;
                if ([v6 containsIndex:v20]) {
                  [v8 addIndex:v20];
                }
              }
            }
          }
        }
        ++v15;
        --v16;
      }
      while (v16);
    }
    uint64_t v7 = v8;
  }
  v21 = (void *)[v23 copy];

  return v21;
}

- (id)_connectedComponents:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)[v4 mutableCopy];
  uint64_t v7 = v6;
  while ([v6 count])
  {
    uint64_t v8 = -[PTFocusBlurMap _connectedComponentWithNode:unvisited:](self, "_connectedComponentWithNode:unvisited:", [v7 firstIndex], v7);
    [v5 addObject:v8];

    id v6 = v7;
  }
  unint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (id)_largestOfComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "count", (void)v14);
        if (v11 > [v4 count])
        {
          id v12 = v10;

          id v4 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CGRect)_validNormalizedRectFromSensorPixelRect:(CGRect)a3
{
  double validWidth = (double)self->_validWidth;
  double v4 = (a3.origin.x - (double)self->_validX) / validWidth;
  double validHeight = (double)self->_validHeight;
  double v6 = (a3.origin.y - (double)self->_validY) / validHeight;
  double v7 = a3.size.width / validWidth;
  double v8 = a3.size.height / validHeight;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_normalRectFromPixelRect:(CGRect)a3
{
  map = self->_map;
  LOWORD(v3) = map->var1.var3;
  double v6 = (double)v3;
  double v7 = a3.origin.x / v6;
  LOWORD(v4) = map->var1.var4;
  double v8 = (double)v4;
  double v9 = a3.origin.y / v8;
  double v10 = a3.size.width / v6;
  double v11 = a3.size.height / v8;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_pixelRectFromNormalRect:(CGRect)a3
{
  map = self->_map;
  LOWORD(v3) = map->var1.var3;
  double v6 = (double)v3;
  double v7 = a3.origin.x * v6;
  LOWORD(v4) = map->var1.var4;
  double v8 = (double)v4;
  double v9 = a3.origin.y * v8;
  double v10 = a3.size.width * v6;
  double v11 = a3.size.height * v8;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_tileRectFromSensorPixelRect:(CGRect)a3
{
  map = self->_map;
  LOWORD(v3) = map->var1.var1;
  *(double *)&unint64_t v6 = (double)v3;
  CGFloat v7 = a3.origin.x - *(double *)&v6;
  LOWORD(v6) = map->var1.var9;
  double v8 = (double)v6;
  double v9 = v7 / v8;
  LOWORD(v4) = map->var1.var2;
  *(double *)&unint64_t v10 = (double)v4;
  CGFloat v11 = a3.origin.y - *(double *)&v10;
  LOWORD(v10) = map->var1.var10;
  double v12 = (double)v10;
  double v13 = v11 / v12;
  double v14 = a3.size.width / v8;
  double v15 = a3.size.height / v12;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v9;
  return result;
}

- (CGRect)_sensorPixelRectFromTileRect:(CGRect)a3
{
  map = self->_map;
  LOWORD(v3) = map->var1.var1;
  *(double *)&unint64_t v7 = (double)v3;
  LOWORD(v4) = map->var1.var9;
  double v8 = (double)v4;
  double v9 = *(double *)&v7 + a3.origin.x * v8;
  LOWORD(v7) = map->var1.var2;
  LOWORD(v5) = map->var1.var10;
  double v10 = (double)v5;
  double v11 = (double)v7 + a3.origin.y * v10;
  double v12 = a3.size.width * v8;
  double v13 = a3.size.height * v10;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (CGRect)_tileRectFromNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    map = self->_map;
    unint64_t var11 = map->var1.var11;
    unint64_t var12 = map->var1.var12;
    uint64_t v8 = [v4 firstIndex];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v15 = v8;
      unint64_t v10 = 0;
      unint64_t v9 = 0;
      do
      {
        unint64_t v16 = self->_map->var1.var11;
        unint64_t v17 = v15 / v16;
        unint64_t v18 = v15 % v16;
        if (v18 < var11) {
          unint64_t var11 = v18;
        }
        if (v17 < var12) {
          unint64_t var12 = v17;
        }
        if (v18 >= v9) {
          unint64_t v9 = v18 + 1;
        }
        if (v17 + 1 > v10) {
          unint64_t v10 = v17 + 1;
        }
        unint64_t v15 = objc_msgSend(v4, "indexGreaterThanIndex:");
      }
      while (v15 != 0x7FFFFFFFFFFFFFFFLL);
    }
    unint64_t v19 = v9 - var11;
    if (v9 < var11) {
      unint64_t v19 = 0;
    }
    unint64_t v20 = v10 - var12;
    if (v10 < var12) {
      unint64_t v20 = 0;
    }
    double v11 = (double)var11;
    double v12 = (double)var12;
    double v13 = (double)v19;
    double v14 = (double)v20;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v21 = v11;
  double v22 = v12;
  double v23 = v13;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)_nodesFromTileRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v9 = floor(CGRectGetMinX(v26));
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v11 = floor(CGRectGetMinY(v27));
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  unint64_t v12 = (unint64_t)v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v13 = ceil(CGRectGetMaxX(v28));
  LOBYTE(v14) = self->_map->var1.var11;
  double v15 = (double)v14;
  if (v13 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v13;
  }
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v17 = ceil(CGRectGetMaxY(v29));
  LOBYTE(v18) = self->_map->var1.var12;
  double v19 = (double)v18;
  if (v17 >= v19) {
    double v17 = v19;
  }
  unint64_t v20 = (unint64_t)v17;
  if (v12 < (unint64_t)v17)
  {
    unint64_t v21 = (unint64_t)v16;
    do
    {
      unint64_t v22 = (unint64_t)v10;
      if ((unint64_t)v10 < v21)
      {
        do
        {
          [v8 addIndex:v22 + v12 * self->_map->var1.var11];
          ++v22;
        }
        while (v21 != v22);
      }
      ++v12;
    }
    while (v12 != v20);
  }
  double v23 = (void *)[v8 copy];

  return v23;
}

- (CGRect)_sensorPixelRectFromRegion:(id)a3
{
  [(PTFocusBlurMap *)self _tileRectFromNodes:a3];

  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:");
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_boxFromComponent:(id)a3
{
  [(PTFocusBlurMap *)self _tileRectFromNodes:a3];
  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:");

  -[PTFocusBlurMap _normalRectFromPixelRect:](self, "_normalRectFromPixelRect:");
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)autoFocusRect
{
  objc_copyStruct(v6, &self->_autoFocusRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setAutoFocusRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_autoFocusRect, &v3, 32, 1, 0);
}

- (unint64_t)sensorWidth
{
  return self->_sensorWidth;
}

- (unint64_t)sensorHeight
{
  return self->_sensorHeight;
}

- (unint64_t)validX
{
  return self->_validX;
}

- (unint64_t)validY
{
  return self->_validY;
}

- (unint64_t)validWidth
{
  return self->_validWidth;
}

- (unint64_t)validHeight
{
  return self->_validHeight;
}

- (void)initWithFocusBlurMapDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CGRect v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "ignoring blur map with tile count %@ - too big", (uint8_t *)&v4, 0xCu);
}

@end