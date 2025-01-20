@interface TXRParserKTX
+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5;
+ (BOOL)handlesData:(id)a3;
- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRTextureInfo)textureInfo;
- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5;
- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6;
- (void)parseImageData:(id)a3 WithOptions:(id)a4 bufferAllocator:(id)a5;
@end

@implementation TXRParserKTX

+ (BOOL)handlesData:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a3 getBytes:v5 length:12];
  uint64_t v3 = 0;
  BOOL result = 1;
  do
  {
    result &= *((unsigned __int8 *)&gKTXFileIdentifier + v3) == v5[v3];
    ++v3;
  }
  while (v3 != 12);
  return result;
}

- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  v14 = (uint32x2_t *)[v13 bytes];
  if (v14[1].i8[4] != 1 || (v15 = v14, v14[1].i8[5] != 2) || v14[1].i8[6] != 3 || v14[1].i8[7] != 4)
  {
    if (a6)
    {
      v31 = @"Only little endian KTX files are supported";
      uint64_t v32 = 10;
LABEL_15:
      _newTXRErrorWithCodeAndErrorString(v32, (uint64_t)v31);
      BOOL v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    BOOL v30 = 0;
    goto LABEL_19;
  }
  v16 = objc_alloc_init(TXRTextureInfo);
  textureInfo = self->_textureInfo;
  self->_textureInfo = v16;

  v18.i32[0] = v15[4].i32[1];
  *(uint32x2_t *)v19.i8 = vmax_u32(v15[5], (uint32x2_t)0x100000001);
  [(TXRTextureInfo *)self->_textureInfo setDimensions:*(double *)vextq_s8(vextq_s8(v18, v18, 4uLL), v19, 0xCuLL).i64];
  unsigned int v20 = v15[6].u32[0];
  if (v20 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  [(TXRTextureInfo *)self->_textureInfo setArrayLength:v21];
  [(TXRTextureInfo *)self->_textureInfo setCubemap:v15[6].i32[1] > 6u];
  unsigned int v22 = v15[7].u32[0];
  if (v22 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v22;
  }
  [(TXRTextureInfo *)self->_textureInfo setMipmapLevelCount:v23];
  [(TXRTextureInfo *)self->_textureInfo setPixelFormat:[(TXRParserKTX *)self determineFormatFromType:v15[2].u32[0] format:v15[3].u32[0] internalFormat:v15[3].u32[1] baseInternalFormat:v15[4].u32[0]]];
  if (![(TXRTextureInfo *)self->_textureInfo pixelFormat])
  {
    if (a6)
    {
      v31 = @"Could not determine format from KTX header";
      uint64_t v32 = 8;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  self->_bytesOfKeyValueData = v15[7].u32[1];
  v24 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
  v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.txrtextureloaderparser", v24);
  parserQueue = self->_parserQueue;
  self->_parserQueue = v25;

  v27 = [[TXRDeferredTextureInfo alloc] initWithMipmapLevelCount:[(TXRTextureInfo *)self->_textureInfo mipmapLevelCount] arrayLength:[(TXRTextureInfo *)self->_textureInfo arrayLength] cubemap:[(TXRTextureInfo *)self->_textureInfo cubemap]];
  deferredTextureInfo = self->_deferredTextureInfo;
  self->_deferredTextureInfo = v27;

  v29 = self->_parserQueue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__TXRParserKTX_parseData_bufferAllocator_options_error___block_invoke;
  v34[3] = &unk_1E6CA2AC8;
  v34[4] = self;
  id v35 = v13;
  id v36 = v12;
  id v37 = v11;
  dispatch_async(v29, v34);

  BOOL v30 = 1;
LABEL_19:

  return v30;
}

uint64_t __56__TXRParserKTX_parseData_bufferAllocator_options_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) parseImageData:*(void *)(a1 + 40) WithOptions:*(void *)(a1 + 48) bufferAllocator:*(void *)(a1 + 56)];
}

- (void)parseImageData:(id)a3 WithOptions:(id)a4 bufferAllocator:(id)a5
{
  id v8 = a3;
  id v58 = a4;
  id v9 = a5;
  id v57 = v8;
  uint64_t v10 = [v57 bytes];
  uint64_t bytesOfKeyValueData = self->_bytesOfKeyValueData;
  [(TXRTextureInfo *)self->_textureInfo dimensions];
  int8x8_t v73 = v12;
  [(TXRTextureInfo *)self->_textureInfo dimensions];
  int8x8_t v70 = v13;
  [(TXRTextureInfo *)self->_textureInfo dimensions];
  unsigned int v69 = v14;
  if ([(TXRTextureInfo *)self->_textureInfo mipmapLevelCount])
  {
    unint64_t v15 = 0;
    int v16 = 0;
    uint64_t v17 = v69;
    int8x8_t v18 = vext_s8(v70, v73, 4uLL);
    v19.i64[0] = v18.u32[0];
    v19.i64[1] = v18.u32[1];
    uint64x2_t v61 = v19;
    unint64_t v20 = v10 + bytesOfKeyValueData + 64;
    unint64_t v21 = 0x1E6CA2000uLL;
    id v63 = v9;
    v72 = self;
    do
    {
      unint64_t v22 = [(TXRTextureInfo *)self->_textureInfo pixelFormat];
      BOOL v23 = v22 - 130 > 0xD || ((1 << (v22 + 126)) & 0x3C3F) == 0;
      if (v23
        && v22 - 150 >= 4
        && (v22 & 0xFFFFFFFFFFFFFFF8) != 0xA0
        && (v22 - 170 <= 0x30 ? (BOOL v26 = ((1 << (v22 + 86)) & 0x1FF7C7FDF3F55) == 0) : (BOOL v26 = 1), v26))
      {
        uint64_t v27 = [(TXRTextureInfo *)self->_textureInfo pixelFormat];
        if (v27 <= 551)
        {
          uint64_t v28 = 1;
          switch(v27)
          {
            case 1:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
              goto LABEL_56;
            case 20:
            case 22:
            case 23:
            case 24:
            case 25:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 40:
            case 41:
            case 42:
            case 43:
              uint64_t v28 = 2;
              goto LABEL_56;
            case 53:
            case 54:
            case 55:
            case 60:
            case 62:
            case 63:
            case 64:
            case 65:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 80:
            case 81:
            case 90:
            case 91:
            case 92:
            case 93:
              goto LABEL_18;
            case 103:
            case 104:
            case 105:
            case 110:
            case 112:
            case 113:
            case 114:
            case 115:
              goto LABEL_54;
            case 123:
            case 124:
            case 125:
              uint64_t v28 = 16;
              goto LABEL_56;
            default:
              goto LABEL_61;
          }
        }
        if ((unint64_t)(v27 - 552) < 2)
        {
LABEL_54:
          uint64_t v28 = 8;
        }
        else if ((unint64_t)(v27 - 554) < 2)
        {
LABEL_18:
          uint64_t v28 = 4;
        }
        else
        {
          if ((unint64_t)(v27 - 2147483649) >= 2) {
LABEL_61:
          }
            pixelBytes_cold_1();
          uint64_t v28 = 3;
        }
LABEL_56:
        unint64_t v30 = v28 * v61.i64[1];
        unint64_t v31 = v61.i64[0] * v17 * v28 * v61.i64[1];
      }
      else
      {
        unint64_t v24 = [(TXRTextureInfo *)self->_textureInfo pixelFormat];
        unsigned int v25 = 17040392;
        switch(v24)
        {
          case 0x82uLL:
          case 0x83uLL:
          case 0x8CuLL:
          case 0x8DuLL:
          case 0xA2uLL:
          case 0xA3uLL:
          case 0xA6uLL:
          case 0xA7uLL:
          case 0xAAuLL:
          case 0xACuLL:
          case 0xB4uLL:
          case 0xB5uLL:
          case 0xB6uLL:
          case 0xB7uLL:
            break;
          case 0x84uLL:
          case 0x85uLL:
          case 0x86uLL:
          case 0x87uLL:
          case 0x8EuLL:
          case 0x8FuLL:
          case 0x96uLL:
          case 0x97uLL:
          case 0x98uLL:
          case 0x99uLL:
          case 0xAEuLL:
          case 0xB0uLL:
          case 0xB2uLL:
          case 0xB3uLL:
          case 0xBAuLL:
          case 0xCCuLL:
            unsigned int v25 = 17040400;
            break;
          case 0xA0uLL:
          case 0xA1uLL:
          case 0xA4uLL:
          case 0xA5uLL:
            goto LABEL_33;
          case 0xBBuLL:
          case 0xCDuLL:
            unsigned int v25 = 17040656;
            break;
          case 0xBCuLL:
          case 0xCEuLL:
            unsigned int v25 = 17106192;
            break;
          case 0xBDuLL:
          case 0xCFuLL:
            unsigned int v25 = 17106448;
            break;
          case 0xBEuLL:
          case 0xD0uLL:
            unsigned int v25 = 17171984;
            break;
          case 0xC0uLL:
          case 0xD2uLL:
            unsigned int v25 = 17106960;
            break;
          case 0xC1uLL:
          case 0xD3uLL:
            int v29 = 17171984;
            goto LABEL_24;
          case 0xC2uLL:
          case 0xD4uLL:
            unsigned int v25 = 17303568;
            break;
          case 0xC3uLL:
          case 0xD5uLL:
            unsigned int v25 = 17104912;
            break;
          case 0xC4uLL:
          case 0xD6uLL:
            unsigned int v25 = 17171984;
LABEL_33:
            v25 += 1024;
            break;
          case 0xC5uLL:
          case 0xD7uLL:
            int v29 = 17303568;
            goto LABEL_24;
          case 0xC6uLL:
          case 0xD8uLL:
            unsigned int v25 = 17435152;
            break;
          case 0xC7uLL:
          case 0xD9uLL:
            int v29 = 17435152;
LABEL_24:
            unsigned int v25 = v29 + 512;
            break;
          case 0xC8uLL:
          case 0xDAuLL:
            unsigned int v25 = 17566736;
            break;
          default:
            +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:]();
        }
        unint64_t v30 = (v61.i64[1] + (unint64_t)((v25 >> 8) & 0xF) - 1) / ((v25 >> 8) & 0xF) * (v25 & 0x18);
        unint64_t v31 = v30 * ((v61.i64[0] + (unint64_t)(HIWORD(v25) & 0xF) - 1) / (HIWORD(v25) & 0xF));
      }
      int v60 = v16;
      uint64_t v32 = (char *)(v20 + 4);
      unint64_t v59 = v17;
      if ([(TXRTextureInfo *)self->_textureInfo arrayLength])
      {
        unint64_t v66 = v15;
        unint64_t v33 = 0;
        int v34 = 0;
        unint64_t v74 = v31;
        size_t v35 = v31 * v17;
        size_t v64 = v31 * v17;
        unint64_t v65 = v30;
        do
        {
          unint64_t v68 = v33;
          int v62 = v34;
          BOOL v36 = [(TXRTextureInfo *)self->_textureInfo cubemap];
          uint64_t v37 = 0;
          uint64_t v38 = 6;
          if (!v36) {
            uint64_t v38 = 1;
          }
          uint64_t v67 = v38;
          do
          {
            v71 = v32;
            id v39 = objc_alloc_init(*(Class *)(v21 + 2576));
            v40 = (void *)[v9 newBufferWithLength:v35];
            [v39 setBuffer:v40];

            [v39 setOffset:0];
            [v39 setBytesPerRow:v30];
            [v39 setBytesPerImage:v74];
            v41 = [v39 buffer];
            v42 = [v41 map];

            memcpy((void *)[v42 bytes], v32, v35);
            v43 = [(TXRDeferredTextureInfo *)self->_deferredTextureInfo mipmaps];
            v44 = [v43 objectAtIndexedSubscript:v66];
            v45 = [v44 elements];
            v46 = [v45 objectAtIndexedSubscript:v68];
            v47 = [v46 faces];
            v48 = [v47 objectAtIndexedSubscript:v37];
            [v48 setInfo:v39];

            v49 = [(TXRDeferredTextureInfo *)v72->_deferredTextureInfo mipmaps];
            v50 = [v49 objectAtIndexedSubscript:v66];
            v51 = [v50 elements];
            v52 = [v51 objectAtIndexedSubscript:v68];
            v53 = [v52 faces];
            v54 = [v53 objectAtIndexedSubscript:v37];
            [v54 signalLoaded];

            self = v72;
            unint64_t v21 = 0x1E6CA2000;
            unint64_t v30 = v65;

            size_t v35 = v64;
            id v9 = v63;
            uint64_t v32 = &v71[v74];
            if ([(TXRTextureInfo *)v72->_textureInfo cubemap]) {
              uint64_t v32 = (char *)((unint64_t)(v32 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            }

            ++v37;
          }
          while (v67 != v37);
          unint64_t v33 = (v62 + 1);
          unint64_t v55 = [(TXRTextureInfo *)v72->_textureInfo arrayLength];
          int v34 = v62 + 1;
        }
        while (v55 > v33);
      }
      int8x16_t v56 = (int8x16_t)vcgtq_u64(v61, (uint64x2_t)vdupq_n_s64(1uLL));
      uint64x2_t v61 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v61, 1uLL), v56), (int64x2_t)vmvnq_s8(v56));
      if (v59 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v59 >> 1;
      }
      unint64_t v20 = (unint64_t)(v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      int v16 = v60 + 1;
      unint64_t v15 = (v60 + 1);
    }
    while ([(TXRTextureInfo *)self->_textureInfo mipmapLevelCount] > v15);
  }
}

- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  if (a5 == a4 && (v7 & 1) == 0)
  {
    if ((int)a4 <= 33318)
    {
      int v15 = 6403;
      unint64_t v16 = 12;
      if (a3 != 5120) {
        unint64_t v16 = 0;
      }
      if (a3 == 5121) {
        unint64_t v16 = 10;
      }
      uint64_t v17 = 70;
      if (a3 != 5121) {
        uint64_t v17 = 0;
      }
      unint64_t v18 = 80;
      if (a3 != 5121) {
        unint64_t v18 = 0;
      }
      if (a4 != 32993) {
        unint64_t v18 = 0;
      }
      if (a4 == 6408) {
        unint64_t v18 = v17;
      }
    }
    else
    {
      if ((int)a4 <= 36243)
      {
        unint64_t v8 = 30;
        if (a3 != 5121) {
          unint64_t v8 = 0;
        }
        uint64_t v9 = 34;
        if (a3 != 5120) {
          uint64_t v9 = 0;
        }
        unint64_t v10 = 33;
        if (a3 != 5121) {
          unint64_t v10 = v9;
        }
        if (a4 != 33320) {
          unint64_t v10 = 0;
        }
        if (a4 == 33319) {
          return v8;
        }
        else {
          return v10;
        }
      }
      int v15 = 36244;
      unint64_t v16 = 14;
      if (a3 != 5120) {
        unint64_t v16 = 0;
      }
      if (a3 == 5121) {
        unint64_t v16 = 13;
      }
      uint64_t v19 = 91;
      if (a3 != 33640) {
        uint64_t v19 = 0;
      }
      if (a4 == 36249) {
        unint64_t v18 = v19;
      }
      else {
        unint64_t v18 = 0;
      }
    }
    if (a4 == v15) {
      return v16;
    }
    else {
      return v18;
    }
  }
  if (a5 != a4 || ((v7 ^ 1) & 1) != 0)
  {
    uint64_t v14 = 0;
    while (LOWORD(formatEquivalenceTable[v14 + 1]) != (unsigned __int16)a5)
    {
      v14 += 2;
      if (v14 == 230) {
        return 0;
      }
    }
    return formatEquivalenceTable[v14];
  }
  else
  {
    if (a5 > a4)
    {
      switch(a4)
      {
        case 0x8E8Cu:
          BOOL v12 = a6 == 6408;
          unint64_t v13 = 152;
          goto LABEL_65;
        case 0x8E8Du:
          BOOL v12 = a6 == 6408;
          unint64_t v13 = 153;
          goto LABEL_65;
        case 0x8E8Eu:
          BOOL v12 = a6 == 6407;
          unint64_t v13 = 150;
          goto LABEL_65;
        case 0x8E8Fu:
          BOOL v12 = a6 == 6407;
          unint64_t v13 = 151;
          goto LABEL_65;
        default:
          return 0;
      }
    }
    switch(a4)
    {
      case 0x8DBBu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 140;
        break;
      case 0x8DBCu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 141;
        break;
      case 0x8DBDu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 142;
        break;
      case 0x8DBEu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 143;
        break;
      default:
        JUMPOUT(0);
    }
LABEL_65:
    if (v12) {
      return v13;
    }
    else {
      return 0;
    }
  }
}

- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  unint64_t v8 = [(TXRDeferredTextureInfo *)self->_deferredTextureInfo mipmaps];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
  unint64_t v10 = [v9 elements];
  id v11 = [v10 objectAtIndexedSubscript:a4];
  BOOL v12 = [v11 faces];
  unint64_t v13 = [v12 objectAtIndexedSubscript:a5];
  uint64_t v14 = [v13 info];

  return v14;
}

+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v117 = 0u;
  int v115 = 169478669;
  unint64_t __ptr = 0xBB31312058544BABLL;
  int v116 = 67305985;
  [v7 dimensions];
  unsigned int v98 = v9;
  [v7 dimensions];
  *(void *)((char *)&v118 + 4) = __PAIR64__(v10, v98);
  [v7 dimensions];
  if (v11 < 2)
  {
    int v13 = 0;
  }
  else
  {
    [v7 dimensions];
    int v13 = v12;
  }
  HIDWORD(v118) = v13;
  uint64_t v14 = [v7 mipmapLevels];
  int v15 = [v14 objectAtIndexedSubscript:0];
  unint64_t v16 = [v15 elements];
  if ((unint64_t)[v16 count] <= 1)
  {
    LODWORD(v119) = 0;
  }
  else
  {
    uint64_t v17 = [v7 mipmapLevels];
    unint64_t v18 = [v17 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 elements];
    LODWORD(v119) = [v19 count];
  }
  if ([v7 cubemap]) {
    int v20 = 6;
  }
  else {
    int v20 = 1;
  }
  DWORD1(v119) = v20;
  unint64_t v21 = [v7 mipmapLevels];
  DWORD2(v119) = [v21 count];

  if (v13 && v119)
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(10, @"KTX does not support volume texture arrays");
      BOOL v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
LABEL_43:
    BOOL v22 = 0;
    goto LABEL_48;
  }
  uint64_t v23 = [v7 pixelFormat];
  if (v23 == 70)
  {
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    unsigned int v25 = &qword_1DC80B7E0;
    do
    {
      ++v24;
      uint64_t v26 = *v25;
      v25 += 2;
    }
    while (v26 != v23);
  }
  uint64_t v27 = (unsigned __int16 *)&formatEquivalenceTable[2 * v24];
  int v28 = v27[4];
  DWORD2(v117) = v27[6];
  HIDWORD(v117) = v28;
  LODWORD(v117) = v27[5];
  LODWORD(v118) = v27[7];
  if ((v117 - 5122) > 9) {
    int v29 = 1;
  }
  else {
    int v29 = dword_1DC80BF00[(__int16)(v117 - 5122)];
  }
  DWORD1(v117) = v29;
  int v107 = -559038737;
  strcpy(v113, "KTXorientation");
  strcpy(v112, "S=r,T=d,R=i");
  strcpy(v111, "File Origin");
  strcpy(v110, "Apple TextureIO");
  int v105 = 28;
  int v106 = 27;
  strcpy(v109, "TextureIO major verison");
  unint64_t v30 = (char *)malloc_type_malloc(2uLL, 0x306B4C95uLL);
  __sprintf_chk(v30, 0, 2uLL, "%d", 3);
  int v104 = 26;
  strcpy(v108, "TextureIO minor verison");
  unint64_t v31 = (char *)malloc_type_malloc(3uLL, 0xA727BA23uLL);
  uint64_t v32 = __sprintf_chk(v31, 0, 3uLL, "%d", 10);
  int v103 = 27;
  HIDWORD(v119) = 128;
  unint64_t v33 = (void *)MEMORY[0x1E01A3D40](v32);
  id v34 = v8;
  size_t v35 = fopen((const char *)[v34 fileSystemRepresentation], "w+");
  if (!v35)
  {
    if (a5)
    {
      v85 = NSString;
      v86 = [v34 absoluteString];
      v87 = [v85 stringWithFormat:@"Cannot create file at %@", v86];

      _newTXRErrorWithCodeAndErrorString(4, (uint64_t)v87);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_43;
  }
  v92 = a5;
  id v93 = v8;
  fwrite(&__ptr, 0x40uLL, 1uLL, v35);
  fwrite(&v106, 4uLL, 1uLL, v35);
  fwrite(v113, 0xFuLL, 1uLL, v35);
  fwrite(v112, 0xCuLL, 1uLL, v35);
  fwrite(&v107, 1uLL, 1uLL, v35);
  fwrite(&v105, 4uLL, 1uLL, v35);
  fwrite(v111, 0xCuLL, 1uLL, v35);
  fwrite(v110, 0x10uLL, 1uLL, v35);
  fwrite(&v107, 0, 1uLL, v35);
  fwrite(&v104, 4uLL, 1uLL, v35);
  fwrite(v109, 0x18uLL, 1uLL, v35);
  fwrite(v30, 2uLL, 1uLL, v35);
  fwrite(&v107, 2uLL, 1uLL, v35);
  fwrite(&v103, 4uLL, 1uLL, v35);
  fwrite(v108, 0x18uLL, 1uLL, v35);
  fwrite(v31, 3uLL, 1uLL, v35);
  fwrite(&v107, 1uLL, 1uLL, v35);
  [v7 dimensions];
  int v100 = v36;
  uint64_t v37 = [v7 mipmapLevels];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0;
    int v41 = v100;
    v94 = v7;
    while (1)
    {
      unint64_t v95 = v40;
      v42 = [v7 mipmapLevels];
      v43 = [v42 objectAtIndexedSubscript:v39];

      v44 = [v43 elements];
      v45 = [v44 objectAtIndexedSubscript:0];
      v46 = [v45 faces];
      v47 = [v46 objectAtIndexedSubscript:0];
      int v48 = [v47 bytesPerImage];

      int v102 = 0;
      unsigned int v96 = v41;
      v49 = [v43 elements];
      int v50 = v41 * v48 * [v49 count];
      v51 = [v43 elements];
      v52 = [v51 objectAtIndexedSubscript:0];
      v53 = [v52 faces];
      int v54 = v50 * [v53 count];

      int v102 = v54;
      fwrite(&v102, 4uLL, 1uLL, v35);
      unint64_t v55 = [v43 elements];
      uint64_t v56 = [v55 count];
      uint64_t v57 = v119;

      if (v56 != v57) {
        break;
      }
      id v58 = [v43 elements];
      uint64_t v59 = [v58 count];

      if (v59)
      {
        unint64_t v60 = 0;
        int v61 = 0;
        v99 = v43;
        do
        {
          int v97 = v61;
          int v62 = [v43 elements];
          id v63 = [v62 objectAtIndexedSubscript:v60];

          size_t v64 = [v63 faces];
          uint64_t v65 = [v64 count];

          if (v65)
          {
            uint64_t v66 = 0;
            unsigned int v67 = 1;
            do
            {
              unint64_t v68 = [v63 faces];
              unsigned int v69 = [v68 objectAtIndexedSubscript:v66];

              int8x8_t v70 = [v69 buffer];
              v71 = [v70 map];

              v72 = (const void *)[v71 bytes];
              uint64_t v73 = [v69 bytesPerImage];
              int v74 = v73 * v96;
              fwrite(v72, v73 * v96, 1uLL, v35);
              v75 = [v63 faces];
              if ((unint64_t)[v75 count] <= 1)
              {
              }
              else
              {
                v76 = [v99 elements];
                uint64_t v77 = [v76 count];

                if (v77 == 1)
                {
                  char v101 = -(char)v74 & 3;
                  if ((-v74 & 3) != 0) {
                    fwrite(&v101, 1uLL, 1uLL, v35);
                  }
                }
              }

              uint64_t v66 = v67;
              v78 = [v63 faces];
              unint64_t v79 = [v78 count];
            }
            while (v79 > v67++);
          }

          unint64_t v60 = (v97 + 1);
          v43 = v99;
          v81 = [v99 elements];
          unint64_t v82 = [v81 count];

          int v61 = v97 + 1;
        }
        while (v82 > v60);
      }

      if (v96 <= 1) {
        int v41 = 1;
      }
      else {
        int v41 = v96 >> 1;
      }
      id v7 = v94;
      unint64_t v39 = (v95 + 1);
      v83 = [v94 mipmapLevels];
      unint64_t v84 = [v83 count];

      unint64_t v40 = v39;
      if (v84 <= v39) {
        goto LABEL_40;
      }
    }
    if (v92)
    {
      v88 = [v43 elements];
      uint64_t v89 = [v88 count];

      v90 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid TXRTexture object: Level 0 has %d array elments but level %d has %d elements", v119, v95, v89);
      _newTXRErrorWithCodeAndErrorString(5, (uint64_t)v90);
      id *v92 = (id)objc_claimAutoreleasedReturnValue();
    }
    fclose(v35);

    BOOL v22 = 0;
    id v7 = v94;
  }
  else
  {
LABEL_40:
    fclose(v35);
    BOOL v22 = 1;
  }
  id v8 = v93;
LABEL_48:

  return v22;
}

- (TXRTextureInfo)textureInfo
{
  return self->_textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserQueue, 0);
  objc_storeStrong((id *)&self->_deferredTextureInfo, 0);
  objc_storeStrong((id *)&self->_internalSizedFormatLookup, 0);
  objc_storeStrong((id *)&self->_textureInfo, 0);
}

@end