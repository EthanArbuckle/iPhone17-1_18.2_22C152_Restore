@interface LSCGainsPlist
- (LSCGainsPlist)initWithDictionary:(id)a3 metal:(id)a4;
- (id)getTextureForPortType:(id)a3;
- (id)getTextureMaxValueForPortType:(id)a3;
- (int)fillLSCGainsTextureFrom:(id *)a3 tex:(id)a4 maxValuesRGBA:(float *)a5;
@end

@implementation LSCGainsPlist

- (LSCGainsPlist)initWithDictionary:(id)a3 metal:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v77 = a4;
  v87.receiver = self;
  v87.super_class = (Class)LSCGainsPlist;
  v7 = [(LSCGainsPlist *)&v87 init];
  if (!v7) {
    goto LABEL_14;
  }
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v12 = objc_msgSend_count(v6, v9, v10, v11);
  uint64_t v15 = objc_msgSend_initWithCapacity_(v8, v13, v12, v14);
  lscGainsByPortType = v7->_lscGainsByPortType;
  v7->_lscGainsByPortType = (NSMutableDictionary *)v15;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v76 = v6;
  id v17 = v6;
  uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v83, (uint64_t)v90, 16);
  if (!v80)
  {
LABEL_13:

    id v6 = v76;
LABEL_14:
    v72 = v7;
    goto LABEL_15;
  }
  uint64_t v79 = *(void *)v84;
  uint64_t v78 = *MEMORY[0x263F2EEC8];
LABEL_4:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v84 != v79) {
      objc_enumerationMutation(v17);
    }
    uint64_t v22 = *(void *)(*((void *)&v83 + 1) + 8 * v21);
    v23 = objc_msgSend_objectForKeyedSubscript_(v17, v19, v22, v20);
    v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, v78, v25);

    if (!v26) {
      goto LABEL_11;
    }
    id v27 = v26;
    uint64_t v31 = objc_msgSend_bytes(v27, v28, v29, v30);
    v33 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v32, 115, *(unsigned int *)(v31 + 20), *(unsigned int *)(v31 + 24), 0);
    v37 = objc_msgSend_device(v77, v34, v35, v36);
    v40 = objc_msgSend_newTextureWithDescriptor_(v37, v38, (uint64_t)v33, v39);

    if (!v40)
    {
      FigDebugAssert3();
      int v75 = FigSignalErrorAt();
      goto LABEL_18;
    }
    int v42 = objc_msgSend_fillLSCGainsTextureFrom_tex_maxValuesRGBA_(v7, v41, v31, (uint64_t)v40, v89);
    if (v42) {
      break;
    }
    objc_msgSend_setObject_forKeyedSubscript_(v7->_lscGainsByPortType, v43, (uint64_t)v40, v22);
    v81 = objc_msgSend_stringWithFormat_(NSString, v44, @"%@#max", v45, v22);
    v82 = v33;
    LODWORD(v46) = v89[0];
    v50 = objc_msgSend_numberWithFloat_(NSNumber, v47, v48, v49, v46);
    v88[0] = v50;
    LODWORD(v51) = v89[1];
    v55 = objc_msgSend_numberWithFloat_(NSNumber, v52, v53, v54, v51);
    v88[1] = v55;
    LODWORD(v56) = v89[2];
    v60 = objc_msgSend_numberWithFloat_(NSNumber, v57, v58, v59, v56);
    v88[2] = v60;
    LODWORD(v61) = v89[3];
    objc_msgSend_numberWithFloat_(NSNumber, v62, v63, v64, v61);
    v66 = v65 = v7;
    v88[3] = v66;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v67, (uint64_t)v88, 4);
    v68 = v26;
    v70 = id v69 = v17;

    v7 = v65;
    objc_msgSend_setObject_forKeyedSubscript_(v65->_lscGainsByPortType, v71, (uint64_t)v70, (uint64_t)v81);

    id v17 = v69;
    v26 = v68;

LABEL_11:
    if (v80 == ++v21)
    {
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v83, (uint64_t)v90, 16);
      if (v80) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  int v75 = v42;
  FigDebugAssert3();

LABEL_18:
  id v6 = v76;
  if (!v75) {
    goto LABEL_14;
  }
  v72 = 0;
LABEL_15:
  v73 = v72;

  return v73;
}

- (int)fillLSCGainsTextureFrom:(id *)a3 tex:(id)a4 maxValuesRGBA:(float *)a5
{
  id v37 = a4;
  uint64_t var4 = a3->var1.var0.var4;
  uint64_t var5 = a3->var1.var0.var5;
  uint64_t var6 = a3->var1.var0.var6;
  uint64_t var7 = a3->var1.var0.var7;
  uint64_t var8 = a3->var1.var0.var8;
  uint64_t var9 = a3->var1.var0.var9;
  uint64_t v13 = (var5 * var4);
  uint64_t v14 = malloc_type_malloc(8 * v13, 0x42276BCEuLL);
  if (v14)
  {
    uint64_t v15 = v14;
    memset_pattern16(a5, &unk_263117D80, 0x10uLL);
    if (v13)
    {
      uint64_t v17 = 0;
      v18 = &a3->var1.var1.var10 + var6;
      v19 = &a3->var1.var1.var10 + var9;
      float v20 = *a5;
      float v21 = a5[1];
      float v22 = a5[2];
      float v23 = a5[3];
      v24 = &a3->var1.var1.var10 + var8;
      do
      {
        _S4 = *(float *)((char *)&a3->var1.var1.var10 + 4 * var7 + v17 * 4);
        __asm { FCVT            H5, S4 }
        v15[(v17 * 4)] = _H5;
        _S5 = v18[v17];
        __asm { FCVT            H5, S5 }
        v15[(v17 * 4 + 1)] = _S5;
        _S5 = v24[v17];
        __asm { FCVT            H5, S5 }
        v15[(v17 * 4 + 2)] = _S5;
        _S5 = v19[v17];
        __asm { FCVT            H5, S5 }
        v15[(v17 * 4 + 3)] = _S5;
        if (v20 <= _S4) {
          float v20 = _S4;
        }
        *a5 = v20;
        if (v21 <= *(float *)&v18[v17]) {
          float v21 = *(float *)&v18[v17];
        }
        a5[1] = v21;
        if (v22 <= *(float *)&v24[v17]) {
          float v22 = *(float *)&v24[v17];
        }
        a5[2] = v22;
        if (v23 <= *(float *)&v19[v17]) {
          float v23 = *(float *)&v19[v17];
        }
        a5[3] = v23;
        ++v17;
      }
      while (v13 != v17);
    }
    memset(v38, 0, 24);
    v38[3] = var4;
    v38[4] = var5;
    v38[5] = 1;
    v34 = v37;
    objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v37, v16, (uint64_t)v38, 0, v15, 8 * var4);
    free(v15);
    int v35 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v35 = -12786;
    v34 = v37;
  }

  return v35;
}

- (id)getTextureForPortType:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_lscGainsByPortType, a2, (uint64_t)a3, v3);
}

- (id)getTextureMaxValueForPortType:(id)a3
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@#max", v3, a3);
  id v8 = objc_msgSend_objectForKeyedSubscript_(self->_lscGainsByPortType, v6, (uint64_t)v5, v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end