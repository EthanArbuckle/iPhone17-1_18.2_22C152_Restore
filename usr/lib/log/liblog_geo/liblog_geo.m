id formatTileKey(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  long long v5;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  long long v12;
  uint64_t v13;
  uint64_t vars8;

  v13 = *MEMORY[0x263EF8340];
  v12 = 0uLL;
  [a1 getBytes:&v12 length:16];
  v1 = v12 & 0x7F;
  if (v1 != *MEMORY[0x263F41660])
  {
    if (v1 == *MEMORY[0x263F41698])
    {
      if (GEOSelectionTileKeyGetXYZId())
      {
        [NSString stringWithFormat:@"{PolySel %u.%u.%u id=%llu}", 0, 0, 0, 0, v11];
        goto LABEL_27;
      }
    }
    else if (v1 == *MEMORY[0x263F416A0])
    {
      if (GEOSelectionTileKeyGetXYZId())
      {
        [NSString stringWithFormat:@"{TrailSel %u.%u.%u id=%llu}", 0, 0, 0, 0, v11];
        goto LABEL_27;
      }
    }
    else if (v1 == *MEMORY[0x263F41648])
    {
      if (GEOContourLinesTileKeyGetXYZSizeUnits())
      {
        [NSString stringWithFormat:@"{Contour %u.%u.%u tileSize=%u units=%llu}", 0, 0, 0, 0, 0];
        goto LABEL_27;
      }
    }
    else
    {
      if (v1 == *MEMORY[0x263F41668])
      {
        v2 = ((*(unsigned __int16 *)((char *)&v12 + 9) | (BYTE11(v12) << 16)) >> 6) & 0x3FFF;
        v3 = BYTE1(v12) & 0x3F;
        *((void *)&v5 + 1) = *(unsigned __int16 *)((char *)&v12 + 9) | ((unint64_t)BYTE11(v12) << 16);
        *(void *)&v5 = *(void *)((char *)&v12 + 1);
        v4 = v5 >> 6;
        if (v2 == 80) {
          [NSString stringWithFormat:@"{Gloria z=%u qk=%llu t=%u mcc=%u mnc=%u}", v3, v4, 80, WORD6(v12) & 0x3FF, (HIDWORD(v12) >> 10) & 0x3FF];
        }
        else {
          [NSString stringWithFormat:@"{Gloria z=%u qk=%llu t=%u}", v3, v4, v2, v10, v11];
        }
        goto LABEL_27;
      }
      if (v1 == *MEMORY[0x263F41688]
        || v1 == *MEMORY[0x263F41678]
        || v1 == *MEMORY[0x263F41680])
      {
        [NSString stringWithFormat:@"{Munin lod=%u pointId=%llu buildId=%u bucketId=%u cameraId=%u}", (*(unsigned __int16 *)((char *)&v12 + 13) | (HIBYTE(v12) << 16)) >> 21, *(void *)((char *)&v12 + 1), *(unsigned int *)((char *)&v12 + 9) | ((unint64_t)((*(unsigned __int16 *)((char *)&v12 + 13) | (HIBYTE(v12) << 16)) & 0xFFFFFF) << 32), *(unsigned __int16 *)((char *)&v12 + 13), HIBYTE(v12) & 0x1F];
        goto LABEL_27;
      }
    }
LABEL_25:
    v8 = GEOStringFromTileKey();
    goto LABEL_28;
  }
  if (!GEOSelectionTileKeyGetXYZId()) {
    goto LABEL_25;
  }
  [NSString stringWithFormat:@"{Transit %u.%u.%u muid=%llu}", 0, 0, 0, 0, v11];
  v8 = LABEL_27:;
LABEL_28:

  return v8;
}

uint64_t formatTileKeyList(uint64_t a1)
{
  return [MEMORY[0x263F41C30] formatOSLogData:a1];
}

id formatDataRequestKind(void *a1)
{
  uint64_t v3 = 0;
  [a1 getBytes:&v3 length:8];
  v1 = GEODataRequestKindAsString();

  return v1;
}

BOOL StringsCaseInsensitiveEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (StringsCaseInsensitiveEqual_onceToken != -1) {
    dispatch_once(&StringsCaseInsensitiveEqual_onceToken, &__block_literal_global_16);
  }
  if (v3 == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = [v3 length];
    BOOL v6 = v5 == [v4 length]
      && [v3 compare:v4 options:3 range:0 locale:v5] == 0;
  }

  return v6;
}

uint64_t __StringsCaseInsensitiveEqual_block_invoke()
{
  StringsCaseInsensitiveEqual_posix = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];

  return MEMORY[0x270F9A758]();
}

uint64_t __protobufClassForType_block_invoke()
{
  protobufClassForType_typeToClassName = (uint64_t)CFDictionaryCreate(0, (const void **)allTypes, (const void **)allClassNames, 659, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);

  return MEMORY[0x270F9A758]();
}

uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x237E04330]();
  uint64_t v5 = +[GEOLogFormatter sharedFormatter];
  BOOL v6 = [NSString stringWithUTF8String:a1];
  uint64_t v7 = [v5 formattedAttributedStringForType:v6 value:v3];

  return v7;
}

uint64_t OSStateCreateStringWithData(uint64_t a1, unsigned int a2, uint64_t a3)
{
  BOOL v6 = (void *)MEMORY[0x237E04330]();
  uint64_t v7 = +[GEOLogFormatter sharedFormatter];
  v8 = [NSString stringWithUTF8String:a1];
  v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:a2 freeWhenDone:0];
  uint64_t v10 = [v7 formattedStringForStateType:v8 data:v9];

  return v10;
}

void sub_236786DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL getNameAndRemainderAtOffset(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  if ([v7 length] <= a2)
  {
    BOOL v12 = 0;
  }
  else
  {
    char v16 = 0;
    v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v16 length:1];
    uint64_t v9 = [v7 rangeOfData:v8 options:0 range:NSMakeRange(a2, [v7 length] - a2)];
    uint64_t v11 = v10;

    BOOL v12 = 0;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [v7 subdataWithRange:a2, v9 - a2];
      id v14 = (id)[[NSString alloc] initWithData:v13 encoding:4];
      *a3 = v14;
      BOOL v12 = v14 != 0;
      if (v14)
      {
        [v7 subdataWithRange:v9 + v11, objc_msgSend(v7, "length") - (v9 + v11)];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v12;
}

id decompress(void *a1, int a2)
{
  id v3 = a1;
  id v4 = v3;
  id v5 = 0;
  HIDWORD(v6) = a2;
  LODWORD(v6) = a2 - 4;
  switch((v6 >> 2))
  {
    case 0u:
      size_t v7 = 4 * [v3 length];
      compression_algorithm v8 = COMPRESSION_LZFSE;
      goto LABEL_6;
    case 1u:
      size_t v7 = (unint64_t)(5 * [v3 length]) >> 1;
      compression_algorithm v8 = COMPRESSION_LZ4;
      goto LABEL_6;
    case 3u:
      size_t v7 = 4 * [v3 length];
      compression_algorithm v8 = COMPRESSION_ZLIB;
      goto LABEL_6;
    case 7u:
      size_t v7 = 4 * [v3 length];
      compression_algorithm v8 = COMPRESSION_LZMA;
LABEL_6:
      uint64_t v9 = [MEMORY[0x263EFF990] dataWithLength:v7];
      int v10 = 3;
      break;
    default:
      goto LABEL_13;
  }
  while (1)
  {
    id v11 = v9;
    BOOL v12 = (uint8_t *)[v11 mutableBytes];
    id v13 = v4;
    size_t v14 = compression_decode_buffer(v12, v7, (const uint8_t *)[v13 bytes], [v13 length], 0, v8);
    if (!v14)
    {
LABEL_10:
      id v5 = 0;
      goto LABEL_12;
    }
    if (v14 < v7) {
      break;
    }
    v7 += 2 * [v13 length:v14];
    [v11 setLength:v7];
    if (!--v10) {
      goto LABEL_10;
    }
  }
  [v11 setLength:v14];
  id v5 = v11;
LABEL_12:

LABEL_13:

  return v5;
}

id formattedStringFromProtobuf(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc(NSClassFromString(v3));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 initWithData:v4];
    if (!v6)
    {
      compression_algorithm v8 = [NSString stringWithFormat:@"(unable to parse protobuf %@) %@", v3, v4];
      goto LABEL_27;
    }
    id v5 = (id)v6;
    size_t v7 = (void *)MEMORY[0x237E04330]();
    if (getOutputMode_onceToken != -1) {
      dispatch_once(&getOutputMode_onceToken, &__block_literal_global_0);
    }
    if (getOutputMode_mode == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_23;
      }
      id v9 = [v5 dictionaryRepresentation];
      compression_algorithm v8 = [v9 description];
    }
    else
    {
      if (getOutputMode_mode != 1)
      {
        if (getOutputMode_mode
          || ([v5 formattedText], (compression_algorithm v8 = objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_23:
          compression_algorithm v8 = [v5 formattedText];
          if (!v8)
          {
            compression_algorithm v8 = [NSString stringWithFormat:@"(unable to format protobuf %@) %@", v3, v4];
          }
        }
LABEL_25:
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_23;
      }
      id v9 = [v5 jsonRepresentation];
      if (v9)
      {
        int v10 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:3 error:0];
        if ([v10 length]) {
          compression_algorithm v8 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
        }
        else {
          compression_algorithm v8 = 0;
        }
      }
      else
      {
        compression_algorithm v8 = 0;
      }
    }
    if (!v8) {
      goto LABEL_23;
    }
    goto LABEL_25;
  }
  compression_algorithm v8 = [NSString stringWithFormat:@"(not a protobuf %@)", v3];
LABEL_26:

LABEL_27:

  return v8;
}

char *__getOutputMode_block_invoke()
{
  v0 = getenv("GEO_RR_Log_Formatter_Mode");
  result = getenv("GEO_RR_Log_Formatter_PBText");
  if (!v0 || !*v0)
  {
    if (!result || *result != 49) {
      return result;
    }
LABEL_10:
    uint64_t v2 = 1;
    goto LABEL_11;
  }
  result = (char *)strncmp(v0, "json", 4uLL);
  if (!result) {
    goto LABEL_10;
  }
  result = (char *)strncmp(v0, "dictionary", 0xAuLL);
  if (!result
    || (result = (char *)strncmp(v0, "description", 0xBuLL), !result)
    || (result = (char *)strncmp(v0, "formattedText", 0xDuLL), !result))
  {
    uint64_t v2 = 2;
LABEL_11:
    getOutputMode_mode = v2;
  }
  return result;
}

id scanDict(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v10 = NSString;
          id v11 = (objc_class *)objc_opt_class();
          size_t v7 = NSStringFromClass(v11);
          uint64_t v8 = [v10 stringWithFormat:@"%@ is actually a %@", v6, v7, (void)v16];
LABEL_20:
          id v9 = (void *)v8;
LABEL_21:

          goto LABEL_22;
        }
        size_t v7 = [v1 objectForKeyedSubscript:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = scanDict(v7);
          if (v8) {
            goto LABEL_20;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = scanArr(v7);
            if (v8) {
              goto LABEL_20;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v13 = NSString;
                size_t v14 = (objc_class *)objc_opt_class();
                v15 = NSStringFromClass(v14);
                id v9 = [v13 stringWithFormat:@"value for %@ is actually a %@", v6, v15, (void)v16];

                goto LABEL_21;
              }
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v9 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_22:

  return v9;
}

id scanArr(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = scanDict(v6);
          if (v7) {
            goto LABEL_17;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v7 = scanArr(v6);
            if (v7)
            {
LABEL_17:
              uint64_t v8 = (void *)v7;
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v10 = NSString;
                id v11 = (objc_class *)objc_opt_class();
                BOOL v12 = NSStringFromClass(v11);
                uint64_t v8 = [v10 stringWithFormat:@"value %@ is actually a %@", v6, v12, (void)v13];

                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_18:

  return v8;
}

id formattedTileLoadOptionsForNumber(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  uint64_t v3 = [v1 array];
  char v4 = [v2 unsignedIntegerValue];

  if (v4)
  {
    [v3 addObject:@"CheckDisk"];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"CheckNetwork"];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"Preload"];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v3 addObject:@"RequireWiFi"];
  if ((v4 & 0x20) != 0) {
LABEL_6:
  }
    [v3 addObject:@"AllowPreliminary"];
LABEL_7:
  id v5 = [v3 componentsJoinedByString:@", "];
  uint64_t v6 = [@"{" stringByAppendingString:v5];
  uint64_t v7 = [v6 stringByAppendingString:@"}"];

  return v7;
}

__CFString *formattedGEOTileSetStyleForNumber(void *a1)
{
  uint64_t v1 = [a1 unsignedIntegerValue];
  id v2 = @"RASTER_STANDARD";
  switch((int)v1)
  {
    case 0:
      break;
    case 1:
      id v2 = @"VECTOR_STANDARD";
      break;
    case 2:
      id v2 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      id v2 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      id v2 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      id v2 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      id v2 = @"RASTER_HYBRID";
      break;
    case 7:
      id v2 = @"RASTER_SATELLITE";
      break;
    case 8:
      id v2 = @"RASTER_TERRAIN";
      break;
    case 11:
      id v2 = @"VECTOR_BUILDINGS";
      break;
    case 12:
      id v2 = @"VECTOR_TRAFFIC";
      break;
    case 13:
      id v2 = @"VECTOR_POI";
      break;
    case 14:
      id v2 = @"SPUTNIK_METADATA";
      break;
    case 15:
      id v2 = @"SPUTNIK_C3M";
      break;
    case 16:
      id v2 = @"SPUTNIK_DSM";
      break;
    case 17:
      id v2 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 18:
      id v2 = @"VECTOR_REALISTIC";
      break;
    case 19:
      id v2 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 20:
      id v2 = @"VECTOR_ROADS";
      break;
    case 21:
      id v2 = @"RASTER_VEGETATION";
      break;
    case 22:
      id v2 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 23:
      id v2 = @"RASTER_COASTLINE_MASK";
      break;
    case 24:
      id v2 = @"RASTER_HILLSHADE";
      break;
    case 25:
      id v2 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 26:
      id v2 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 27:
      id v2 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 28:
      id v2 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 29:
      id v2 = @"VECTOR_SPEED_PROFILES";
      break;
    case 30:
      id v2 = @"VECTOR_VENUES";
      break;
    case 31:
      id v2 = @"RASTER_DOWN_SAMPLED";
      break;
    case 32:
      id v2 = @"RASTER_COLOR_BALANCED";
      break;
    case 33:
      id v2 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 34:
      id v2 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 35:
      id v2 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 36:
      id v2 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 37:
      id v2 = @"VECTOR_TRANSIT";
      break;
    case 38:
      id v2 = @"RASTER_STANDARD_BASE";
      break;
    case 39:
      id v2 = @"RASTER_STANDARD_LABELS";
      break;
    case 40:
      id v2 = @"RASTER_HYBRID_ROADS";
      break;
    case 41:
      id v2 = @"RASTER_HYBRID_LABELS";
      break;
    case 42:
      id v2 = @"FLYOVER_C3M_MESH";
      break;
    case 43:
      id v2 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 44:
      id v2 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 45:
      id v2 = @"RASTER_SATELLITE_ASTC";
      break;
    case 46:
      id v2 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 47:
      id v2 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 48:
      id v2 = @"VECTOR_COVERAGE";
      break;
    case 52:
      id v2 = @"FLYOVER_METADATA";
      break;
    case 53:
      id v2 = @"VECTOR_ROAD_NETWORK";
      break;
    case 54:
      id v2 = @"VECTOR_LAND_COVER";
      break;
    case 55:
      id v2 = @"VECTOR_DEBUG";
      break;
    case 56:
      id v2 = @"VECTOR_STREET_POI";
      break;
    case 57:
      id v2 = @"MUNIN_METADATA";
      break;
    case 58:
      id v2 = @"VECTOR_SPR_MERCATOR";
      break;
    case 59:
      id v2 = @"VECTOR_SPR_MODELS";
      break;
    case 60:
      id v2 = @"VECTOR_SPR_MATERIALS";
      break;
    case 61:
      id v2 = @"VECTOR_SPR_METADATA";
      break;
    case 62:
      id v2 = @"VECTOR_TRACKS";
      break;
    case 63:
      id v2 = @"VECTOR_RESERVED_2";
      break;
    case 64:
      id v2 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 65:
      id v2 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 66:
      id v2 = @"VECTOR_SPR_ROADS";
      break;
    case 67:
      id v2 = @"VECTOR_SPR_STANDARD";
      break;
    case 68:
      id v2 = @"VECTOR_POI_V2";
      break;
    case 69:
      id v2 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 70:
      id v2 = @"VL_METADATA";
      break;
    case 71:
      id v2 = @"VL_DATA";
      break;
    case 72:
      id v2 = @"PROACTIVE_APP_CLIP";
      break;
    case 73:
      id v2 = @"VECTOR_BUILDINGS_V2";
      break;
    case 74:
      id v2 = @"POI_BUSYNESS";
      break;
    case 75:
      id v2 = @"POI_DP_BUSYNESS";
      break;
    case 76:
      id v2 = @"SMART_INTERFACE_SELECTION";
      break;
    case 77:
      id v2 = @"VECTOR_ASSETS";
      break;
    case 78:
      id v2 = @"SPR_ASSET_METADATA";
      break;
    case 79:
      id v2 = @"VECTOR_SPR_POLAR";
      break;
    case 80:
      id v2 = @"SMART_DATA_MODE";
      break;
    case 81:
      id v2 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 82:
      id v2 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 83:
      id v2 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 84:
      id v2 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 85:
      id v2 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 86:
      id v2 = @"VECTOR_TRAFFIC_V2";
      break;
    case 87:
      id v2 = @"VECTOR_ROAD_SELECTION";
      break;
    case 88:
      id v2 = @"VECTOR_REGION_METADATA";
      break;
    case 89:
      id v2 = @"RAY_TRACING";
      break;
    case 90:
      id v2 = @"VECTOR_CONTOURS";
      break;
    case 91:
      id v2 = @"RASTER_SATELLITE_POLAR";
      break;
    case 92:
      id v2 = @"VMAP4_ELEVATION";
      break;
    case 93:
      id v2 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 94:
      id v2 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 95:
      id v2 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 96:
      id v2 = @"UNUSED_96";
      break;
    case 97:
      id v2 = @"UNUSED_97";
      break;
    case 98:
      id v2 = @"UNUSED_98";
      break;
    case 99:
      id v2 = @"UNUSED_99";
      break;
    case 100:
      id v2 = @"UNUSED_100";
      break;
    case 101:
      id v2 = @"UNUSED_101";
      break;
    case 102:
      id v2 = @"UNUSED_102";
      break;
    case 103:
      id v2 = @"UNUSED_103";
      break;
    case 104:
      id v2 = @"UNUSED_104";
      break;
    case 105:
      id v2 = @"UNUSED_105";
      break;
    case 106:
      id v2 = @"UNUSED_106";
      break;
    case 107:
      id v2 = @"UNUSED_107";
      break;
    case 108:
      id v2 = @"UNUSED_108";
      break;
    case 109:
      id v2 = @"UNUSED_109";
      break;
    case 110:
      id v2 = @"UNUSED_110";
      break;
    case 111:
      id v2 = @"UNUSED_111";
      break;
    case 112:
      id v2 = @"UNUSED_112";
      break;
    case 113:
      id v2 = @"UNUSED_113";
      break;
    case 114:
      id v2 = @"UNUSED_114";
      break;
    case 115:
      id v2 = @"UNUSED_115";
      break;
    case 116:
      id v2 = @"UNUSED_116";
      break;
    case 117:
      id v2 = @"UNUSED_117";
      break;
    case 118:
      id v2 = @"UNUSED_118";
      break;
    case 119:
      id v2 = @"UNUSED_119";
      break;
    default:
      [NSString stringWithFormat:@"(unknown: %i)", v1];
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v2;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

uint64_t GEOContourLinesTileKeyGetXYZSizeUnits()
{
  return MEMORY[0x270F30128]();
}

uint64_t GEODataRequestKindAsString()
{
  return MEMORY[0x270F30138]();
}

uint64_t GEOSelectionTileKeyGetXYZId()
{
  return MEMORY[0x270F301C8]();
}

uint64_t GEOStringFromTileKey()
{
  return MEMORY[0x270F301D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x270F30260]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x270F30270]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}