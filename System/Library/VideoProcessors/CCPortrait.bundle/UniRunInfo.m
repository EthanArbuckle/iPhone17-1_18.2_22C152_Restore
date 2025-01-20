@interface UniRunInfo
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadgroupsPerGrid;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadsPerThreadgroup;
- (CGRect)outputExtent;
- (MTLBuffer)indirectBuffer;
- (NSArray)extent;
- (NSArray)threadgroupsPerGrid;
- (NSArray)threadsPerGrid;
- (NSArray)threadsPerThreadgroup;
- (NSNumber)indirectBufferOffset;
- (UniImage)image;
- (UniRunInfo)initWithExtent:(CGRect)a3;
- (UniRunInfo)initWithGridSize:(id *)a3 kernel:(id)a4;
- (UniRunInfo)initWithGridSize:(id *)a3 threadsPerThreadGroup:(id *)a4;
- (UniRunInfo)initWithImage:(id)a3;
- (UniRunInfo)initWithImageDiv2:(id)a3;
- (UniRunInfo)initWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (UniRunInfo)initWithThreadgroupsPerGrid:(id *)a3 threadsPerThreadGroup:(id *)a4;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)description;
- (void)dispatchOn:(id)a3;
- (void)setCoreImageOutputExtent:(CGRect)a3;
- (void)setExtent:(id)a3;
- (void)setImage:(id)a3;
- (void)setIndirectBuffer:(id)a3;
- (void)setIndirectBufferOffset:(id)a3;
- (void)setThreadgroupsPerGrid:(id)a3;
- (void)setThreadsPerGrid:(id)a3;
- (void)setThreadsPerThreadgroup:(id)a3;
@end

@implementation UniRunInfo

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)UniRunInfo;
  v2 = [(UniRunInfo *)&v12 init];
  v3 = v2;
  if (v2)
  {
    indirectBuffer = v2->_indirectBuffer;
    v2->_indirectBuffer = 0;

    indirectBufferOffset = v3->_indirectBufferOffset;
    v3->_indirectBufferOffset = 0;

    threadsPerThreadgroup = v3->_threadsPerThreadgroup;
    v7 = (NSArray *)MEMORY[0x263EFFA68];
    v3->_threadsPerThreadgroup = (NSArray *)MEMORY[0x263EFFA68];

    threadsPerGrid = v3->_threadsPerGrid;
    v3->_threadsPerGrid = v7;

    threadgroupsPerGrid = v3->_threadgroupsPerGrid;
    v3->_threadgroupsPerGrid = 0;

    objc_storeWeak((id *)&v3->_image, 0);
    extent = v3->_extent;
    v3->_extent = v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_super v12 = objc_msgSend__init(v7, v8, v9);
  if (v12)
  {
    v13 = objc_msgSend_indirectBuffer(self, v10, v11);
    objc_msgSend_setIndirectBuffer_(v12, v14, (uint64_t)v13);

    v17 = objc_msgSend_image(self, v15, v16);
    objc_msgSend_setImage_(v12, v18, (uint64_t)v17);

    v21 = objc_msgSend_indirectBufferOffset(self, v19, v20);
    objc_msgSend_setIndirectBufferOffset_(v12, v22, (uint64_t)v21);

    v25 = objc_msgSend_threadsPerGrid(self, v23, v24);
    objc_msgSend_setThreadsPerGrid_(v12, v26, (uint64_t)v25);

    v29 = objc_msgSend_threadsPerThreadgroup(self, v27, v28);
    objc_msgSend_setThreadsPerThreadgroup_(v12, v30, (uint64_t)v29);

    v33 = objc_msgSend_threadgroupsPerGrid(self, v31, v32);
    objc_msgSend_setThreadgroupsPerGrid_(v12, v34, (uint64_t)v33);

    v37 = objc_msgSend_extent(self, v35, v36);
    objc_msgSend_setExtent_(v12, v38, (uint64_t)v37);
  }
  return v12;
}

- (UniRunInfo)initWithImage:(id)a3
{
  v65[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = (UniRunInfo *)objc_msgSend__init(self, v5, v6);
  if (v9)
  {
    v10 = objc_msgSend_texture(v4, v7, v8);
    uint64_t v13 = objc_msgSend_kernel(v4, v11, v12);
    if (v13)
    {
      uint64_t v16 = (void *)v13;
      v17 = objc_msgSend_kernel(v4, v14, v15);
      uint64_t v20 = objc_msgSend_mk(v17, v18, v19);

      if (v10 && v20)
      {
        objc_msgSend_setImage_(v9, v21, (uint64_t)v4);
        objc_msgSend_setIndirectBuffer_(v9, v22, 0);
        objc_msgSend_setIndirectBufferOffset_(v9, v23, 0);
        uint64_t v24 = NSNumber;
        uint64_t v27 = objc_msgSend_width(v10, v25, v26);
        v29 = objc_msgSend_numberWithUnsignedInteger_(v24, v28, v27);
        v65[0] = v29;
        v30 = NSNumber;
        uint64_t v33 = objc_msgSend_height(v10, v31, v32);
        v35 = objc_msgSend_numberWithUnsignedInteger_(v30, v34, v33);
        v65[1] = v35;
        v65[2] = &unk_270E1E768;
        v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v65, 3);
        objc_msgSend_setThreadsPerGrid_(v9, v38, (uint64_t)v37);

        v39 = NSNumber;
        uint64_t v42 = objc_msgSend_threadExecutionWidth(v20, v40, v41);
        v44 = objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
        v64[0] = v44;
        v45 = NSNumber;
        unint64_t v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v20, v46, v47);
        unint64_t v51 = objc_msgSend_threadExecutionWidth(v20, v49, v50);
        v53 = objc_msgSend_numberWithUnsignedInteger_(v45, v52, v48 / v51);
        v64[1] = v53;
        v64[2] = &unk_270E1E768;
        v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v64, 3);
        objc_msgSend_setThreadsPerThreadgroup_(v9, v56, (uint64_t)v55);

        objc_msgSend_setThreadgroupsPerGrid_(v9, v57, 0);
        v60 = objc_msgSend_image(v4, v58, v59);
        v61 = sub_262E42340(v60);
        objc_msgSend_setExtent_(v9, v62, (uint64_t)v61);

        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }

    uint64_t v9 = 0;
  }
LABEL_8:

  return v9;
}

- (UniRunInfo)initWithImageDiv2:(id)a3
{
  v65[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = (UniRunInfo *)objc_msgSend__init(self, v5, v6);
  if (v9)
  {
    v10 = objc_msgSend_texture(v4, v7, v8);
    uint64_t v13 = objc_msgSend_kernel(v4, v11, v12);
    if (v13)
    {
      uint64_t v16 = (void *)v13;
      v17 = objc_msgSend_kernel(v4, v14, v15);
      uint64_t v20 = objc_msgSend_mk(v17, v18, v19);

      if (v10 && v20)
      {
        objc_msgSend_setImage_(v9, v21, (uint64_t)v4);
        objc_msgSend_setIndirectBuffer_(v9, v22, 0);
        objc_msgSend_setIndirectBufferOffset_(v9, v23, 0);
        uint64_t v24 = NSNumber;
        unint64_t v27 = objc_msgSend_width(v10, v25, v26);
        v29 = objc_msgSend_numberWithUnsignedInteger_(v24, v28, v27 >> 1);
        v65[0] = v29;
        v30 = NSNumber;
        unint64_t v33 = objc_msgSend_height(v10, v31, v32);
        v35 = objc_msgSend_numberWithUnsignedInteger_(v30, v34, v33 >> 1);
        v65[1] = v35;
        v65[2] = &unk_270E1E768;
        v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v65, 3);
        objc_msgSend_setThreadsPerGrid_(v9, v38, (uint64_t)v37);

        v39 = NSNumber;
        uint64_t v42 = objc_msgSend_threadExecutionWidth(v20, v40, v41);
        v44 = objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
        v64[0] = v44;
        v45 = NSNumber;
        unint64_t v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v20, v46, v47);
        unint64_t v51 = objc_msgSend_threadExecutionWidth(v20, v49, v50);
        v53 = objc_msgSend_numberWithUnsignedInteger_(v45, v52, v48 / v51);
        v64[1] = v53;
        v64[2] = &unk_270E1E768;
        v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v64, 3);
        objc_msgSend_setThreadsPerThreadgroup_(v9, v56, (uint64_t)v55);

        objc_msgSend_setThreadgroupsPerGrid_(v9, v57, 0);
        v60 = objc_msgSend_image(v4, v58, v59);
        v61 = sub_262E42340(v60);
        objc_msgSend_setExtent_(v9, v62, (uint64_t)v61);

        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }

    uint64_t v9 = 0;
  }
LABEL_8:

  return v9;
}

- (UniRunInfo)initWithThreadgroupsPerGrid:(id *)a3 threadsPerThreadGroup:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v6 = (UniRunInfo *)objc_msgSend__init(self, a2, (uint64_t)a3);
  uint64_t v8 = v6;
  if (v6)
  {
    objc_msgSend_setImage_(v6, v7, 0);
    objc_msgSend_setIndirectBuffer_(v8, v9, 0);
    objc_msgSend_setIndirectBufferOffset_(v8, v10, 0);
    uint64_t v11 = MEMORY[0x263EFFA68];
    objc_msgSend_setThreadsPerGrid_(v8, v12, MEMORY[0x263EFFA68]);
    unint64_t var0 = a4->var0;
    unint64_t var1 = a4->var1;
    unint64_t var2 = a4->var2;
    v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, var0);
    uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, var1, v17);
    v40 = v19;
    v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, var2);
    uint64_t v41 = v21;
    v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)&v39, 3);

    objc_msgSend_setThreadsPerThreadgroup_(v8, v24, (uint64_t)v23);
    unint64_t v25 = a3->var0;
    unint64_t v26 = a3->var1;
    unint64_t v27 = a3->var2;
    v29 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v28, v25);
    v31 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v30, v26, v29);
    v40 = v31;
    unint64_t v33 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v32, v27);
    uint64_t v41 = v33;
    v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)&v39, 3);

    objc_msgSend_setThreadgroupsPerGrid_(v8, v36, (uint64_t)v35);
    objc_msgSend_setExtent_(v8, v37, v11);
  }
  return v8;
}

- (void)setCoreImageOutputExtent:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_numberWithDouble_(NSNumber, a2, v3, a3.origin.x);
  v21[0] = v8;
  uint64_t v11 = objc_msgSend_numberWithDouble_(NSNumber, v9, v10, y);
  v21[1] = v11;
  v14 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, width);
  v21[2] = v14;
  v17 = objc_msgSend_numberWithDouble_(NSNumber, v15, v16, height);
  v21[3] = v17;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, (uint64_t)v21, 4);
  objc_msgSend_setExtent_(self, v20, (uint64_t)v19);
}

- (UniRunInfo)initWithGridSize:(id *)a3 threadsPerThreadGroup:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v6 = (UniRunInfo *)objc_msgSend__init(self, a2, (uint64_t)a3);
  uint64_t v8 = v6;
  if (v6)
  {
    objc_msgSend_setImage_(v6, v7, 0);
    objc_msgSend_setIndirectBuffer_(v8, v9, 0);
    objc_msgSend_setIndirectBufferOffset_(v8, v10, 0);
    unint64_t var0 = a3->var0;
    unint64_t var1 = a3->var1;
    unint64_t var2 = a3->var2;
    uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, var0);
    v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, var1, v15);
    uint64_t v39 = v17;
    uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, var2);
    v40 = v19;
    v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, (uint64_t)&v38, 3);

    objc_msgSend_setThreadsPerGrid_(v8, v22, (uint64_t)v21);
    unint64_t v23 = a4->var0;
    unint64_t v24 = a4->var1;
    unint64_t v25 = a4->var2;
    unint64_t v27 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v26, v23);
    v29 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v28, v24, v27);
    uint64_t v39 = v29;
    v31 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v30, v25);
    v40 = v31;
    unint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)&v38, 3);

    objc_msgSend_setThreadsPerThreadgroup_(v8, v34, (uint64_t)v33);
    objc_msgSend_setThreadgroupsPerGrid_(v8, v35, 0);
    objc_msgSend_setExtent_(v8, v36, MEMORY[0x263EFFA68]);
  }
  return v8;
}

- (UniRunInfo)initWithGridSize:(id *)a3 kernel:(id)a4
{
  v50[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v11 = (UniRunInfo *)objc_msgSend__init(self, v7, v8);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_mk(v6, v9, v10);
    objc_msgSend_setImage_(v11, v13, 0);
    objc_msgSend_setIndirectBuffer_(v11, v14, 0);
    objc_msgSend_setIndirectBufferOffset_(v11, v15, 0);
    unint64_t var0 = a3->var0;
    unint64_t var1 = a3->var1;
    unint64_t var2 = a3->var2;
    uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, var0);
    v50[0] = v20;
    v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v21, var1);
    v50[1] = v22;
    unint64_t v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v23, var2);
    v50[2] = v24;
    unint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v25, (uint64_t)v50, 3);

    objc_msgSend_setThreadsPerGrid_(v11, v27, (uint64_t)v26);
    uint64_t v28 = NSNumber;
    uint64_t v31 = objc_msgSend_threadExecutionWidth(v12, v29, v30);
    unint64_t v33 = objc_msgSend_numberWithUnsignedInteger_(v28, v32, v31);
    v49[0] = v33;
    v34 = NSNumber;
    unint64_t v37 = objc_msgSend_maxTotalThreadsPerThreadgroup(v12, v35, v36);
    unint64_t v40 = objc_msgSend_threadExecutionWidth(v12, v38, v39);
    uint64_t v42 = objc_msgSend_numberWithUnsignedInteger_(v34, v41, v37 / v40);
    v49[1] = v42;
    v49[2] = &unk_270E1E768;
    v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v49, 3);
    objc_msgSend_setThreadsPerThreadgroup_(v11, v45, (uint64_t)v44);

    objc_msgSend_setThreadgroupsPerGrid_(v11, v46, 0);
    objc_msgSend_setExtent_(v11, v47, MEMORY[0x263EFFA68]);
  }
  return v11;
}

- (UniRunInfo)initWithExtent:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = (UniRunInfo *)objc_msgSend__init(self, a2, v3);
  uint64_t v10 = v8;
  if (v8)
  {
    objc_msgSend_setImage_(v8, v9, 0);
    objc_msgSend_setIndirectBuffer_(v10, v11, 0);
    objc_msgSend_setIndirectBufferOffset_(v10, v12, 0);
    uint64_t v13 = MEMORY[0x263EFFA68];
    objc_msgSend_setThreadsPerGrid_(v10, v14, MEMORY[0x263EFFA68]);
    objc_msgSend_setThreadsPerThreadgroup_(v10, v15, v13);
    objc_msgSend_setThreadgroupsPerGrid_(v10, v16, v13);
    uint64_t v19 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18, x);
    v33[0] = v19;
    v22 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, y);
    v33[1] = v22;
    unint64_t v25 = objc_msgSend_numberWithDouble_(NSNumber, v23, v24, width);
    v33[2] = v25;
    uint64_t v28 = objc_msgSend_numberWithDouble_(NSNumber, v26, v27, height);
    v33[3] = v28;
    uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v33, 4);
    objc_msgSend_setExtent_(v10, v31, (uint64_t)v30);
  }
  return v10;
}

- (UniRunInfo)initWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  v35[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8 && a5->var0 && a5->var1 && a5->var2)
  {
    v34.receiver = self;
    v34.super_class = (Class)UniRunInfo;
    uint64_t v9 = [(UniRunInfo *)&v34 init];
    uint64_t v11 = v9;
    if (v9)
    {
      objc_msgSend_setIndirectBuffer_(v9, v10, (uint64_t)v8);
      uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, a4);
      objc_msgSend_setIndirectBufferOffset_(v11, v14, (uint64_t)v13);

      unint64_t var0 = a5->var0;
      unint64_t var1 = a5->var1;
      unint64_t var2 = a5->var2;
      uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, var0);
      v35[0] = v19;
      uint64_t v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, var1);
      v35[1] = v21;
      unint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, var2);
      v35[2] = v23;
      unint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, (uint64_t)v35, 3);

      objc_msgSend_setThreadsPerThreadgroup_(v11, v26, (uint64_t)v25);
      uint64_t v27 = MEMORY[0x263EFFA68];
      objc_msgSend_setThreadsPerGrid_(v11, v28, MEMORY[0x263EFFA68]);
      objc_msgSend_setThreadgroupsPerGrid_(v11, v29, v27);
      objc_msgSend_setImage_(v11, v30, 0);
      objc_msgSend_setExtent_(v11, v31, v27);
    }
    self = v11;
    uint64_t v32 = self;
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadsPerThreadgroup
{
  if (self[1].var1
    && (id v4 = self,
        objc_opt_class(),
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_opt_isKindOfClass(),
        (self & 1) != 0)
    && (self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_count((void *)v4[1].var1, v5, v6),
        self == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)3))
  {
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v7, 0);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = objc_msgSend_unsignedIntValue(v21, v8, v9);
    uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v11, 1);
    unint64_t v15 = objc_msgSend_unsignedIntValue(v12, v13, v14);
    v17 = objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v16, 2);
    unsigned int v20 = objc_msgSend_unsignedIntValue(v17, v18, v19);
    retstr->unint64_t var0 = v10;
    retstr->unint64_t var1 = v15;
    retstr->unint64_t var2 = v20;
  }
  else
  {
    retstr->unint64_t var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadgroupsPerGrid
{
  if (self[2].var0
    && (id v4 = self,
        objc_opt_class(),
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_opt_isKindOfClass(),
        (self & 1) != 0)
    && (self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_count((void *)v4[2].var0, v5, v6),
        self == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)3))
  {
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v7, 0);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = objc_msgSend_unsignedIntValue(v21, v8, v9);
    uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v11, 1);
    unint64_t v15 = objc_msgSend_unsignedIntValue(v12, v13, v14);
    v17 = objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v16, 2);
    unsigned int v20 = objc_msgSend_unsignedIntValue(v17, v18, v19);
    retstr->unint64_t var0 = v10;
    retstr->unint64_t var1 = v15;
    retstr->unint64_t var2 = v20;
  }
  else
  {
    retstr->unint64_t var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }
  return self;
}

- (void)dispatchOn:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    sub_262E43520(self->_threadsPerThreadgroup, (uint64_t *)&v31);
    unint64_t v7 = v31;
    if (!(void)v31) {
      sub_262E4E688();
    }
    unint64_t v8 = *((void *)&v31 + 1);
    if (!*((void *)&v31 + 1)) {
      sub_262E4E6B4();
    }
    if (!v32) {
      sub_262E4E6E0();
    }
    indirectBuffer = self->_indirectBuffer;
    if (indirectBuffer)
    {
      uint64_t v10 = objc_msgSend_unsignedIntegerValue(self->_indirectBufferOffset, v5, v6);
      long long v29 = v31;
      uint64_t v30 = v32;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v4, v11, (uint64_t)indirectBuffer, v10, &v29);
    }
    else
    {
      long long v29 = 0uLL;
      uint64_t v30 = 0;
      sub_262E43520(self->_threadsPerGrid, (uint64_t *)&v29);
      long long v27 = 0uLL;
      uint64_t v28 = 0;
      sub_262E43520(self->_threadgroupsPerGrid, (uint64_t *)&v27);
      uint64_t v14 = v29;
      if (!((unint64_t)v29 | (unint64_t)v27)) {
        sub_262E4E70C();
      }
      uint64_t v15 = *((void *)&v29 + 1);
      if (!(*((void *)&v29 + 1) | *((void *)&v27 + 1))) {
        sub_262E4E738();
      }
      if (!(v30 | v28)) {
        sub_262E4E764();
      }
      if ((void)v27 && *((void *)&v27 + 1) && v28)
      {
        long long v25 = v27;
        uint64_t v26 = v28;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v4, v12, (uint64_t)&v25, &v23, v21[0], v21[1], v21[2], v22[0], v22[1], v22[2], v31, v32);
      }
      else
      {
        if (!(void)v29) {
          sub_262E4E790();
        }
        if (!*((void *)&v29 + 1)) {
          sub_262E4E7BC();
        }
        if (!v30) {
          sub_262E4E7E8();
        }
        uint64_t v16 = objc_msgSend_device(v4, v12, v13);
        int v19 = objc_msgSend_supportsNonUniformThreadgroupSize(v16, v17, v18);

        if (v19)
        {
          long long v25 = v29;
          uint64_t v26 = v30;
          long long v23 = v31;
          uint64_t v24 = v32;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v4, v20, (uint64_t)&v25, &v23);
        }
        else
        {
          objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v4, v20, (uint64_t)v22, v21, v7, v8, 1, (v7 + v14 - 1) / v7, (v8 + v15 - 1) / v8, 1, v23, v24);
        }
      }
    }
  }
}

- (CGRect)outputExtent
{
  if (self->_extent
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend_count(self->_extent, v3, v4) == 4)
  {
    uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_extent, v5, 0);
    objc_msgSend_floatValue(v6, v7, v8);
    double v10 = v9;
    uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(self->_extent, v11, 1);
    objc_msgSend_floatValue(v12, v13, v14);
    double v16 = v15;
    uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_extent, v17, 2);
    objc_msgSend_floatValue(v18, v19, v20);
    double v22 = v21;
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(self->_extent, v23, 3);
    objc_msgSend_floatValue(v24, v25, v26);
    double v28 = v27;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A0];
    double v16 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v22 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v28 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v29 = v10;
  double v30 = v16;
  double v31 = v22;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_stringWithFormat_(v3, v5, @"\n\t\t<%@ <%p>: \n", v4, self);
  uint64_t v8 = v6;
  if (self->_indirectBuffer)
  {
    objc_msgSend_appendString_(v6, v7, @"\t\t\tindirectBuffer: ");
    uint64_t v11 = objc_msgSend_description(self->_indirectBuffer, v9, v10);
    objc_msgSend_appendString_(v8, v12, (uint64_t)v11);
    goto LABEL_9;
  }
  memset(v35, 0, sizeof(v35));
  p_threadsPerGrid = (void **)&self->_threadsPerGrid;
  sub_262E43520(self->_threadsPerGrid, v35);
  memset(v34, 0, sizeof(v34));
  sub_262E43520(self->_threadgroupsPerGrid, v34);
  objc_msgSend_appendString_(v8, v14, @"\t\t\tthreadPerThreadGroup = ");
  v17 = objc_msgSend_description(self->_threadsPerThreadgroup, v15, v16);
  uint64_t v18 = sub_262E43910(v17);
  objc_msgSend_appendString_(v8, v19, (uint64_t)v18);

  objc_msgSend_appendString_(v8, v20, @"\n");
  if (v35[0])
  {
    objc_msgSend_appendString_(v8, v21, @"\t\t\tgridSize = ");
LABEL_7:
    uint64_t v24 = objc_msgSend_description(*p_threadsPerGrid, v22, v23);
    long long v25 = sub_262E43910(v24);
    objc_msgSend_appendString_(v8, v26, (uint64_t)v25);

    objc_msgSend_appendString_(v8, v27, @"\n");
    goto LABEL_8;
  }
  if (v34[0])
  {
    p_threadsPerGrid = (void **)&self->_threadgroupsPerGrid;
    objc_msgSend_appendString_(v8, v21, @"\t\t\tthreadgroupsPerGrid = ");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend_appendString_(v8, v21, @"\t\t\tciExtent = ");
  uint64_t v11 = objc_msgSend_description(self->_extent, v28, v29);
  double v30 = sub_262E43910(v11);
  objc_msgSend_appendString_(v8, v31, (uint64_t)v30);

LABEL_9:
  objc_msgSend_appendString_(v8, v32, @"\n\t\t>\n");

  return v8;
}

- (id)debugQuickLookObject
{
  uint64_t v3 = objc_msgSend_image(self, a2, v2);
  uint64_t v6 = v3;
  if (v3)
  {
    unint64_t v7 = objc_msgSend_debugQuickLookObject(v3, v4, v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (MTLBuffer)indirectBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndirectBuffer:(id)a3
{
}

- (UniImage)image
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_image);

  return (UniImage *)WeakRetained;
}

- (void)setImage:(id)a3
{
}

- (NSNumber)indirectBufferOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndirectBufferOffset:(id)a3
{
}

- (NSArray)threadsPerThreadgroup
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setThreadsPerThreadgroup:(id)a3
{
}

- (NSArray)threadsPerGrid
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadsPerGrid:(id)a3
{
}

- (NSArray)threadgroupsPerGrid
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThreadgroupsPerGrid:(id)a3
{
}

- (NSArray)extent
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extent, 0);
  objc_storeStrong((id *)&self->_threadgroupsPerGrid, 0);
  objc_storeStrong((id *)&self->_threadsPerGrid, 0);
  objc_storeStrong((id *)&self->_threadsPerThreadgroup, 0);
  objc_storeStrong((id *)&self->_indirectBufferOffset, 0);
  objc_destroyWeak((id *)&self->_image);

  objc_storeStrong((id *)&self->_indirectBuffer, 0);
}

@end