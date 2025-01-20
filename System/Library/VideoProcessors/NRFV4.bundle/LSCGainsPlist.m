@interface LSCGainsPlist
- (LSCGainsPlist)initWithDictionary:(id)a3 metal:(id)a4;
- (id)getCroppedTextureForPortType:(id)a3 roiRect:(CGRect)a4;
- (id)getTextureForPortType:(id)a3;
- (id)getTextureMaxValueForPortType:(id)a3;
- (int)fillLSCGainsTextureFrom:(id *)a3 tex:(id)a4 maxValuesRGBA:(float *)a5;
@end

@implementation LSCGainsPlist

- (LSCGainsPlist)initWithDictionary:(id)a3 metal:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v39 = a4;
  v49.receiver = self;
  v49.super_class = (Class)LSCGainsPlist;
  v7 = [(LSCGainsPlist *)&v49 init];
  p_isa = (id *)&v7->super.isa;
  if (!v7) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v7->_metal, a4);
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v10 = p_isa[1];
  p_isa[1] = (id)v9;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v38 = v6;
  id v11 = v6;
  uint64_t v42 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (!v42)
  {
LABEL_13:

    id v6 = v38;
LABEL_14:
    v34 = p_isa;
    goto LABEL_15;
  }
  uint64_t v41 = *(void *)v46;
  uint64_t v40 = *MEMORY[0x263F2EEC8];
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v46 != v41) {
      objc_enumerationMutation(v11);
    }
    uint64_t v13 = *(void *)(*((void *)&v45 + 1) + 8 * v12);
    v14 = [v11 objectForKeyedSubscript:v13];
    v15 = [v14 objectForKeyedSubscript:v40];

    if (!v15) {
      goto LABEL_11;
    }
    id v16 = v15;
    uint64_t v17 = [v16 bytes];
    v18 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*(unsigned int *)(v17 + 20) height:*(unsigned int *)(v17 + 24) mipmapped:0];
    v19 = [v39 device];
    v20 = (void *)[v19 newTextureWithDescriptor:v18];

    if (!v20)
    {
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();
      goto LABEL_18;
    }
    int v21 = [p_isa fillLSCGainsTextureFrom:v17 tex:v20 maxValuesRGBA:v51];
    if (v21) {
      break;
    }
    [p_isa[1] setObject:v20 forKeyedSubscript:v13];
    v43 = [NSString stringWithFormat:@"%@#max", v13];
    v44 = v18;
    LODWORD(v22) = v51[0];
    v23 = [NSNumber numberWithFloat:v22];
    v50[0] = v23;
    LODWORD(v24) = v51[1];
    v25 = [NSNumber numberWithFloat:v24];
    v50[1] = v25;
    LODWORD(v26) = v51[2];
    v27 = [NSNumber numberWithFloat:v26];
    v50[2] = v27;
    LODWORD(v28) = v51[3];
    [NSNumber numberWithFloat:v28];
    v30 = v29 = p_isa;
    v50[3] = v30;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
    v31 = v15;
    v33 = id v32 = v11;

    p_isa = v29;
    [v29[1] setObject:v33 forKeyedSubscript:v43];

    id v11 = v32;
    v15 = v31;

LABEL_11:
    if (v42 == ++v12)
    {
      uint64_t v42 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v42) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  int v37 = v21;
  FigDebugAssert3();

LABEL_18:
  id v6 = v38;
  if (!v37) {
    goto LABEL_14;
  }
  v34 = 0;
LABEL_15:
  v35 = v34;

  return v35;
}

- (int)fillLSCGainsTextureFrom:(id *)a3 tex:(id)a4 maxValuesRGBA:(float *)a5
{
  id v36 = a4;
  uint64_t var4 = a3->var1.var0.var4;
  uint64_t var5 = a3->var1.var0.var5;
  uint64_t var6 = a3->var1.var0.var6;
  uint64_t var7 = a3->var1.var0.var7;
  uint64_t var8 = a3->var1.var0.var8;
  uint64_t var9 = a3->var1.var0.var9;
  uint64_t v13 = (var5 * var4);
  v14 = malloc_type_malloc(8 * v13, 0x6AC2B718uLL);
  if (v14)
  {
    v15 = v14;
    memset_pattern16(a5, &unk_2634803E0, 0x10uLL);
    if (v13)
    {
      uint64_t v16 = 0;
      uint64_t v17 = &a3->var1.var1.var10 + var6;
      v18 = &a3->var1.var1.var10 + var9;
      float v19 = *a5;
      float v20 = a5[1];
      float v21 = a5[2];
      float v22 = a5[3];
      v23 = &a3->var1.var1.var10 + var8;
      do
      {
        _S4 = *(float *)((char *)&a3->var1.var1.var10 + 4 * var7 + v16 * 4);
        __asm { FCVT            H5, S4 }
        v15[(v16 * 4)] = _H5;
        _S5 = v17[v16];
        __asm { FCVT            H5, S5 }
        v15[(v16 * 4 + 1)] = _S5;
        _S5 = v23[v16];
        __asm { FCVT            H5, S5 }
        v15[(v16 * 4 + 2)] = _S5;
        _S5 = v18[v16];
        __asm { FCVT            H5, S5 }
        v15[(v16 * 4 + 3)] = _S5;
        if (v19 <= _S4) {
          float v19 = _S4;
        }
        *a5 = v19;
        if (v20 <= *(float *)&v17[v16]) {
          float v20 = *(float *)&v17[v16];
        }
        a5[1] = v20;
        if (v21 <= *(float *)&v23[v16]) {
          float v21 = *(float *)&v23[v16];
        }
        a5[2] = v21;
        if (v22 <= *(float *)&v18[v16]) {
          float v22 = *(float *)&v18[v16];
        }
        a5[3] = v22;
        ++v16;
      }
      while (v13 != v16);
    }
    memset(v37, 0, 24);
    v37[3] = var4;
    v37[4] = var5;
    v37[5] = 1;
    v33 = v36;
    [v36 replaceRegion:v37 mipmapLevel:0 withBytes:v15 bytesPerRow:8 * var4];
    free(v15);
    int v34 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v34 = -12786;
    v33 = v36;
  }

  return v34;
}

- (id)getTextureForPortType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_lscGainsByPortType objectForKeyedSubscript:a3];
}

- (id)getCroppedTextureForPortType:(id)a3 roiRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = [(NSMutableDictionary *)self->_lscGainsByPortType objectForKeyedSubscript:a3];
  uint64_t v12 = v11;
  BOOL v13 = x < 0.0 || x > 1.0;
  if (v13
    || (y >= 0.0 ? (BOOL v14 = y > 1.0) : (BOOL v14 = 1),
        v14 || width <= 0.0 || width + x > 1.0 || height <= 0.0 || height + y > 1.0))
  {
    v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    float v19 = 0;
    v23 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    LODWORD(v4) = vcvtad_u64_f64(width * (float)(unint64_t)objc_msgSend(v11, "width", height + y));
    LODWORD(v5) = vcvtad_u64_f64(height * (float)(unint64_t)[v12 height]);
    unint64_t v15 = [v12 width];
    unint64_t v16 = [v12 height];
    uint64_t v17 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v12, "pixelFormat"), v4, v5, 0);
    v18 = [(FigMetalContext *)self->_metal device];
    float v19 = (void *)[v18 newTextureWithDescriptor:v17];

    if (v19)
    {
      float v20 = malloc_type_malloc((8 * v4 * v5), 0x556D5F94uLL);
      if (v20)
      {
        v23 = v20;
        LODWORD(v21) = vcvtad_u64_f64(y * (float)v16);
        LODWORD(v22) = vcvtad_u64_f64(x * (float)v15);
        uint64_t v28 = v22;
        uint64_t v29 = v21;
        uint64_t v30 = 0;
        uint64_t v31 = v4;
        uint64_t v32 = v5;
        uint64_t v33 = 1;
        [v12 getBytes:v20 bytesPerRow:(8 * v4) fromRegion:&v28 mipmapLevel:0];
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v31 = v4;
        uint64_t v32 = v5;
        uint64_t v33 = 1;
        [v19 replaceRegion:&v28 mipmapLevel:0 withBytes:v23 bytesPerRow:(8 * v4)];
        goto LABEL_16;
      }
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      double v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      float v19 = 0;
    }
    v23 = 0;
  }
LABEL_16:
  free(v23);

  return v19;
}

- (id)getTextureMaxValueForPortType:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"%@#max", a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_lscGainsByPortType objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_lscGainsByPortType, 0);
}

@end