@interface CLKUIAtlasBacking
+ (id)atlasBackingWithArt:(id)a3 uuid:(id)a4;
+ (id)atlasBackingWithBytes:(const void *)a3 length:(unint64_t)a4 mmapFile:(id)a5 uuid:(id)a6;
+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4;
+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4 mipmap:(BOOL)a5;
+ (id)atlasBackingWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5;
- (BOOL)mipmaps;
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5;
- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 mmapFile:(id)a5;
- (CLKUIAtlasBackingStructure)structure;
- (NSString)uuid;
- (const)bytes;
- (unint64_t)bytesLength;
- (unint64_t)bytesPerPixel;
- (unint64_t)height;
- (unint64_t)mipCount;
- (unint64_t)planeLength;
- (unint64_t)planes;
- (unint64_t)width;
- (unsigned)filter;
- (unsigned)format;
- (unsigned)wrap;
- (void)setFilter:(unsigned __int8)a3;
- (void)setWrap:(unsigned __int8)a3;
@end

@implementation CLKUIAtlasBacking

+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4
{
  return (id)[a1 atlasBackingWithImage:a3 uuid:a4 mipmap:0];
}

+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4 mipmap:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = v7;
    v10 = (CGImage *)[v9 CGImage];
    unsigned int Width = CGImageGetWidth(v10);
    int Height = CGImageGetHeight(v10);
    unsigned int v13 = Height;
    v14 = 0;
    BOOL v15 = Width - 8193 < 0xFFFFE000 || Height < 1;
    if (!v15 && Height <= 0x2000)
    {
      double v16 = 1.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      double v20 = 1.0;
      double v21 = 0.0;
      switch([v9 imageOrientation])
      {
        case 0:
          break;
        case 1:
          double v18 = (double)Width;
          double v19 = (double)v13;
          double v20 = -1.0;
          goto LABEL_15;
        case 2:
          double v18 = (double)v13;
          double v21 = 1.0;
          double v17 = -1.0;
          goto LABEL_13;
        case 3:
          double v19 = (double)Width;
          double v21 = -1.0;
          double v17 = 1.0;
LABEL_13:
          double v20 = 0.0;
          goto LABEL_19;
        case 4:
          double v18 = (double)Width;
LABEL_15:
          double v16 = -1.0;
          break;
        case 5:
          double v19 = (double)v13;
          double v20 = -1.0;
          break;
        case 6:
          double v18 = (double)v13;
          double v19 = (double)Width;
          double v17 = -1.0;
          double v20 = 0.0;
          double v21 = -1.0;
          goto LABEL_19;
        case 7:
          double v17 = 1.0;
          double v20 = 0.0;
          double v21 = 1.0;
LABEL_19:
          double v16 = 0.0;
          break;
        default:
          double v16 = *MEMORY[0x1E4F1DAB8];
          double v21 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
          double v17 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
          double v20 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
          double v18 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
          double v19 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
          break;
      }
      double v22 = (double)(int)Width;
      double v23 = (double)(int)v13;
      double v24 = v20 * (double)(int)v13 + v21 * (double)(int)Width;
      signed int v25 = vcvtad_u64_f64(fabs(v17 * (double)(int)v13 + v16 * (double)(int)Width));
      int v26 = vcvtad_u64_f64(fabs(v24));
      BOOL v40 = v5;
      if (v5)
      {
        BOOL v27 = v26 < 1 || v25 < 1;
        if (v27 || (v26 == 1 ? (BOOL v28 = v25 == 1) : (BOOL v28 = 0), v28))
        {
          unint64_t v30 = __PAIR64__(v26, v25);
        }
        else
        {
          if (v25 <= v26) {
            int v29 = v26;
          }
          else {
            int v29 = v25;
          }
          unint64_t v30 = (unint64_t)vdup_n_s32(1 << -(char)__clz(v29 - 1));
        }
        signed int v25 = v30;
        int v26 = HIDWORD(v30);
        unsigned int v39 = 4 * HIDWORD(v30) * v30;
        unsigned int v31 = 0;
        if ((int)v30 >= 1)
        {
          int v32 = 1;
          do
          {
            v31 += 4 * v32 * v32;
            v32 *= 2;
          }
          while (v32 <= (int)v30);
        }
      }
      else
      {
        unsigned int v31 = 4 * v26 * v25;
        unsigned int v39 = v31;
      }
      v33 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      id v34 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v31];
      v35 = (void *)[v34 mutableBytes];
      v36 = CGBitmapContextCreate(v35, v25, v26, 8uLL, 4 * v25, v33, 0x4001u);
      CGColorSpaceRelease(v33);
      CGContextTranslateCTM(v36, 0.0, (double)v26);
      CGContextScaleCTM(v36, 1.0, -1.0);
      transform.a = v16;
      transform.b = v21;
      transform.c = v17;
      transform.d = v20;
      transform.tx = v18;
      transform.ty = v19;
      CGContextConcatCTM(v36, &transform);
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = v22;
      v43.size.height = v23;
      CGContextDrawImage(v36, v43, v10);
      CGContextRelease(v36);
      if (v40) {
        _CLKUIRawImageGenerateMipmapsSRGB8((uint64_t)v35, v25);
      }
      v37 = [CLKUIAtlasBacking alloc];
      *(void *)&transform.a = v35;
      *(void *)&transform.b = __PAIR64__(v25, v31);
      *(void *)&transform.c = v26 | 0x100000000;
      LODWORD(transform.d) = v39;
      *(void *)((char *)&transform.d + 4) = 4;
      WORD2(transform.tx) = 2;
      BYTE6(transform.tx) = 0;
      HIBYTE(transform.tx) = v40;
      v14 = [(CLKUIAtlasBacking *)v37 initWithUuid:v8 structure:&transform data:v34];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)atlasBackingWithArt:(id)a3 uuid:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = +[CLKUIMmapFile mmapFileWithPath:a3];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
      id v9 = +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:](CLKUIAtlasBacking, "atlasBackingWithBytes:length:mmapFile:uuid:", [v8 bytes], objc_msgSend(v8, "length"), v8, v5);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)atlasBackingWithBytes:(const void *)a3 length:(unint64_t)a4 mmapFile:(id)a5 uuid:(id)a6
{
  MEMORY[0x1F4188790](a1);
  id v7 = v6;
  unint64_t v9 = v8;
  v11 = v10;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = v12;
  id v53 = v7;
  if (v9 <= 7)
  {
    v14 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:]0();
    }
  }
  uint64_t v15 = *v11;
  unsigned int v52 = v11[1];
  unsigned int v16 = *((unsigned __int16 *)v11 + 1);
  int v17 = *((unsigned __int16 *)v11 + 2);
  int v18 = *((unsigned __int16 *)v11 + 3);
  BOOL v19 = (v17 - 8193) < 0xFFFFE000;
  if ((v17 - 8193) <= 0xFFFFDFFF)
  {
    double v20 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.9();
    }
  }
  if ((v18 - 8193) <= 0xFFFFDFFF)
  {
    double v21 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.8();
    }

    BOOL v19 = 1;
  }
  int v22 = v16 & 7;
  if (v22 != 1 && v22 != 6)
  {
    double v24 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.7();
    }

    BOOL v19 = 1;
  }
  if (v15 >= 0x43)
  {
    signed int v25 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.6();
    }

    BOOL v19 = 1;
  }
  if (v16 >> 14 == 3)
  {
    int v26 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:]();
    }

    if (v52 < 4) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  if (v52 > 3)
  {
LABEL_30:
    BOOL v27 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:](v52, (uint64_t)v53, v27);
    }
LABEL_32:

LABEL_33:
    BOOL v28 = 0;
    goto LABEL_34;
  }
  if (v19) {
    goto LABEL_33;
  }
  id v48 = v13;
  int v49 = (v16 >> 3) & 1;
  int v51 = s_artFormatsBpp[v15];
  int v30 = _CLKUIDeterminePlaneLength(v15, v17, v18, v51);
  int v50 = v30;
  if (v17 && v49 && v18 && (v17 != 1 || v18 != 1))
  {
    unsigned int v31 = v18;
    unsigned int v32 = v17;
    do
    {
      if (v32 <= 1) {
        unsigned int v32 = 1;
      }
      else {
        v32 >>= 1;
      }
      if (v31 <= 1) {
        unsigned int v31 = 1;
      }
      else {
        v31 >>= 1;
      }
      v30 += _CLKUIDeterminePlaneLength(v15, v32, v31, v51);
    }
    while (v31 != 1 || v32 != 1);
  }
  int v33 = v30 * v22;
  unsigned int v34 = (v16 >> 4) & 3;
  if (v34)
  {
    uint64_t v47 = (v30 * v22);
    memset(&stream, 0, sizeof(stream));
    id v13 = v48;
    if (compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, atlasBackingWithBytes_length_mmapFile_uuid__algorithms[v34]) == COMPRESSION_STATUS_ERROR)
    {
      BOOL v27 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:]();
      }
      goto LABEL_32;
    }
    int v46 = (v16 >> 8) & 0x3F;
    stream.src_ptr = v11 + 8;
    stream.src_size = (v9 - 8);
    stream.dst_ptr = buf;
    stream.dst_size = 4096;
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v47];
    while (1)
    {
      compression_status v36 = compression_stream_process(&stream, 0);
      if (v36) {
        break;
      }
      if (stream.dst_size)
      {
        v44 = CLKLoggingObjectForDomain();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_77;
        }
        goto LABEL_78;
      }
      [v35 appendBytes:buf length:4096];
      stream.dst_ptr = buf;
      stream.dst_size = 4096;
    }
    if (v36 == COMPRESSION_STATUS_ERROR)
    {
      v44 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
LABEL_77:
      }
        +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:]();
LABEL_78:

      goto LABEL_79;
    }
    if (v36 == COMPRESSION_STATUS_END && stream.dst_ptr > buf) {
      [v35 appendBytes:buf length:stream.dst_ptr - buf];
    }
    compression_stream_destroy(&stream);
    int v37 = [v35 length];
    if (v47 == v37)
    {
      unsigned int v38 = v16 >> 14;
      id v39 = v35;
      uint64_t v40 = [v39 mutableBytes];
      id v41 = v39;
      v42 = [CLKUIAtlasBacking alloc];
      *(void *)v55 = v40;
      *(_DWORD *)&v55[8] = v47;
      unint64_t v56 = __PAIR64__(v18, v17);
      int v57 = v22;
      int v58 = v50;
      int v59 = v51;
      int v60 = v46;
      char v61 = v15;
      char v62 = v52;
      char v63 = v38;
      char v64 = v49;
      BOOL v28 = [(CLKUIAtlasBacking *)v42 initWithUuid:v53 structure:v55 data:v41];

      goto LABEL_80;
    }
    v45 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 138412802;
      *(void *)&v55[4] = v53;
      LOWORD(v56) = 1024;
      *(_DWORD *)((char *)&v56 + 2) = v47;
      HIWORD(v56) = 1024;
      int v57 = v37;
      _os_log_error_impl(&dword_1B41E7000, v45, OS_LOG_TYPE_ERROR, "%@: Unexpected length %d != %d", v55, 0x18u);
    }

LABEL_79:
    BOOL v28 = 0;
LABEL_80:
  }
  else
  {
    id v13 = v48;
    if (v33 != v9 - 8)
    {
      CGRect v43 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v53;
        LOWORD(v66) = 1024;
        *(_DWORD *)((char *)&v66 + 2) = v33;
        HIWORD(v66) = 1024;
        int v67 = v9 - 8;
        _os_log_error_impl(&dword_1B41E7000, v43, OS_LOG_TYPE_ERROR, "%@: Unexpected length %d != %d", buf, 0x18u);
      }

      goto LABEL_33;
    }
    *(void *)buf = v11 + 8;
    *(_DWORD *)&buf[8] = v33;
    unint64_t v66 = __PAIR64__(v18, v17);
    int v67 = v16 & 7;
    int v68 = v50;
    int v69 = v51;
    int v70 = (v16 >> 8) & 0x3F;
    char v71 = v15;
    char v72 = v52;
    char v73 = v16 >> 14;
    BOOL v74 = (v16 & 8) != 0;
    BOOL v28 = [[CLKUIAtlasBacking alloc] initWithUuid:v53 structure:buf mmapFile:v48];
  }
LABEL_34:

  return v28;
}

+ (id)atlasBackingWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = a4->width - 8193;
  BOOL v10 = v9 < 0xFFFFE000;
  if (v9 <= 0xFFFFDFFF)
  {
    v11 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.8();
    }
  }
  if (a4->height - 8193 <= 0xFFFFDFFF)
  {
    id v12 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.7();
    }

    BOOL v10 = 1;
  }
  unsigned int planes = a4->planes;
  if (planes != 1 && planes != 6)
  {
    v14 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.6();
    }

    BOOL v10 = 1;
  }
  if (a4->format >= 0x43u)
  {
    uint64_t v15 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.5();
    }

    BOOL v10 = 1;
  }
  if (a4->wrap >= 3u)
  {
    unsigned int v16 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.4();
    }

    BOOL v10 = 1;
  }
  if (a4->filter >= 4u)
  {
    int v17 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:]();
    }

    BOOL v10 = 1;
  }
  if (v8)
  {
    id v18 = v8;
    BOOL v19 = (char *)[v18 bytes];
    uint64_t v20 = [v18 length];
    if (a4->bytes < v19 || (char *)a4->bytes + a4->bytesLength > &v19[v20])
    {
      double v21 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:]();
      }

      BOOL v10 = 1;
    }
  }
  unsigned int bytesPerPixel = a4->bytesPerPixel;
  if (bytesPerPixel != s_artFormatsBpp[a4->format])
  {
    double v23 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:]();
    }

    unsigned int bytesPerPixel = a4->bytesPerPixel;
    BOOL v10 = 1;
  }
  if (bytesPerPixel && a4->planeLength != a4->width * bytesPerPixel * a4->height)
  {
    BOOL v27 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      unsigned int width = a4->width;
      unsigned int height = a4->height;
      unsigned int planeLength = a4->planeLength;
      unsigned int v32 = a4->bytesPerPixel;
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = planeLength;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = width;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = height;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v36) = v32;
      _os_log_error_impl(&dword_1B41E7000, v27, OS_LOG_TYPE_ERROR, "%@: Invalid art plane length (%d) [width = %d, height = %d, unsigned int bytesPerPixel = %d]", buf, 0x24u);
    }
  }
  else if (!v10)
  {
    long long v24 = *(_OWORD *)&a4->height;
    *(_OWORD *)buf = *(_OWORD *)&a4->bytes;
    *(_OWORD *)&buf[16] = v24;
    uint64_t v36 = *(void *)&a4->mipCount;
    id v25 = v8;
    v33[0] = *(_OWORD *)buf;
    v33[1] = *(_OWORD *)&buf[16];
    uint64_t v34 = v36;
    int v26 = [[CLKUIAtlasBacking alloc] initWithUuid:v7 structure:v33 data:v25];

    goto LABEL_44;
  }
  int v26 = 0;
LABEL_44:

  return v26;
}

- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAtlasBacking;
  v11 = [(CLKUIAtlasBacking *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    long long v13 = *(_OWORD *)&a4->bytes;
    long long v14 = *(_OWORD *)&a4->height;
    *(void *)&v12->_structure.mipCount = *(void *)&a4->mipCount;
    *(_OWORD *)&v12->_structure.bytes = v13;
    *(_OWORD *)&v12->_structure.unsigned int height = v14;
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 mmapFile:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAtlasBacking;
  v11 = [(CLKUIAtlasBacking *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    long long v13 = *(_OWORD *)&a4->bytes;
    long long v14 = *(_OWORD *)&a4->height;
    *(void *)&v12->_structure.mipCount = *(void *)&a4->mipCount;
    *(_OWORD *)&v12->_structure.bytes = v13;
    *(_OWORD *)&v12->_structure.unsigned int height = v14;
    objc_storeStrong((id *)&v12->_mmapFile, a5);
  }

  return v12;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v7 = a3;
  id v8 = objc_msgSend([v6 alloc], "initWithLength:", -[CLKUIAtlasBacking bytesLength](self, "bytesLength") + 8);
  uint64_t v9 = [v8 mutableBytes];
  *(unsigned char *)uint64_t v9 = [(CLKUIAtlasBacking *)self format];
  *(unsigned char *)(v9 + 1) = [(CLKUIAtlasBacking *)self filter];
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0xFFF8 | [(CLKUIAtlasBacking *)self planes] & 7;
  if ([(CLKUIAtlasBacking *)self mipmaps]) {
    __int16 v10 = 8;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0xFF07 | v10;
  *(_WORD *)(v9 + 2) = (([(CLKUIAtlasBacking *)self mipCount] & 0x3F) << 8) | *(_WORD *)(v9 + 2) & 0xC0FF;
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0x3FFF | ([(CLKUIAtlasBacking *)self wrap] << 14);
  *(_WORD *)(v9 + 4) = [(CLKUIAtlasBacking *)self width];
  *(_WORD *)(v9 + 6) = [(CLKUIAtlasBacking *)self height];
  v11 = self;
  memcpy((void *)(v9 + 8), [(CLKUIAtlasBacking *)v11 bytes], [(CLKUIAtlasBacking *)v11 bytesLength]);
  char v12 = [v8 writeToFile:v7 options:1 error:a4];

  return v12;
}

- (const)bytes
{
  return self->_structure.bytes;
}

- (unint64_t)bytesLength
{
  return self->_structure.bytesLength;
}

- (unint64_t)width
{
  return self->_structure.width;
}

- (unint64_t)height
{
  return self->_structure.height;
}

- (unint64_t)planes
{
  return self->_structure.planes;
}

- (unint64_t)planeLength
{
  return self->_structure.planeLength;
}

- (unint64_t)bytesPerPixel
{
  return self->_structure.bytesPerPixel;
}

- (unint64_t)mipCount
{
  return self->_structure.mipCount;
}

- (unsigned)format
{
  return self->_structure.format;
}

- (unsigned)filter
{
  return self->_structure.filter;
}

- (unsigned)wrap
{
  return self->_structure.wrap;
}

- (BOOL)mipmaps
{
  return self->_structure.mipmaps;
}

- (void)setWrap:(unsigned __int8)a3
{
  self->_structure.wrap = a3;
}

- (void)setFilter:(unsigned __int8)a3
{
  self->_structure.filter = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (CLKUIAtlasBackingStructure)structure
{
  long long v3 = *(_OWORD *)&self[1].bytesLength;
  *(_OWORD *)&retstr->bytes = *(_OWORD *)&self->mipCount;
  *(_OWORD *)&retstr->unsigned int height = v3;
  *(void *)&retstr->mipCount = *(void *)&self[1].planeLength;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_mmapFile, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)atlasBackingWithBytes:(NSObject *)a3 length:mmapFile:uuid:.cold.1(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 1024;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, a2, a3, "%@: Invalid art header filter %d", v3, 0, *MEMORY[0x1E4F143B8]);
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_11();
  int v2 = 3;
  _os_log_error_impl(&dword_1B41E7000, v0, OS_LOG_TYPE_ERROR, "%@: Invalid art header wrap %d", v1, 0x12u);
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.3()
{
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_3(&dword_1B41E7000, v0, v1, "%@: Compression error", v2, v3, v4, v5, v6);
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.6()
{
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art header format %d");
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.7()
{
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art header planes %d");
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.8()
{
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art header height %d");
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.9()
{
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art header width %d");
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.10()
{
  OUTLINED_FUNCTION_6_11();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid length %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.1()
{
  OUTLINED_FUNCTION_4_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure filter %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.2()
{
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure bytes/bytesLength", v2, v3, v4, v5, v6);
}

+ (void)atlasBackingWithUuid:structure:data:.cold.4()
{
  OUTLINED_FUNCTION_4_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure wrap %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.5()
{
  OUTLINED_FUNCTION_4_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure format %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.6()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure planes %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.7()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure height %d");
}

+ (void)atlasBackingWithUuid:structure:data:.cold.8()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_3(&dword_1B41E7000, v0, v1, "%@: Invalid art structure width %d");
}

@end