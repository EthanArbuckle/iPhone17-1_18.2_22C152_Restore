@interface FusionRemixUniforms
- (FusionRemixUniforms)initWithMetal:(id)a3 heap:(id)a4;
@end

@implementation FusionRemixUniforms

- (FusionRemixUniforms)initWithMetal:(id)a3 heap:(id)a4
{
  id v5 = a4;
  v41.receiver = self;
  v41.super_class = (Class)FusionRemixUniforms;
  v9 = [(FusionRemixUniforms *)&v41 init];
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend_resourceOptions(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_newBufferWithLength_options_(v5, v11, 1520, v10);
  fragUniBufSBP = v9->_fragUniBufSBP;
  v9->_fragUniBufSBP = (MTLBuffer *)v12;

  if (!v9->_fragUniBufSBP) {
    goto LABEL_8;
  }
  uint64_t v17 = objc_msgSend_resourceOptions(v5, v14, v15, v16);
  uint64_t v19 = objc_msgSend_newBufferWithLength_options_(v5, v18, 24, v17);
  fragUniBufInt = v9->_fragUniBufInt;
  v9->_fragUniBufInt = (MTLBuffer *)v19;

  if (!v9->_fragUniBufInt) {
    goto LABEL_8;
  }
  uint64_t v24 = objc_msgSend_resourceOptions(v5, v21, v22, v23);
  uint64_t v26 = objc_msgSend_newBufferWithLength_options_(v5, v25, 1360, v24);
  vertexUniBufSBP = v9->_vertexUniBufSBP;
  v9->_vertexUniBufSBP = (MTLBuffer *)v26;

  if (v9->_vertexUniBufSBP)
  {
    v9->_ptr2FragBufSBP = (FusionRemixStageUniformsIBP *)objc_msgSend_contents(v9->_fragUniBufSBP, v28, v29, v30);
    v9->_ptr2FragBufInt = (FusionRemixStageUniformsInternal *)objc_msgSend_contents(v9->_fragUniBufInt, v31, v32, v33);
    v9->_ptr2VertBufSBP = (FusionRemixStageUniformsVertex *)objc_msgSend_contents(v9->_vertexUniBufSBP, v34, v35, v36);
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
    v37 = 0;
    if (v40) {
      goto LABEL_7;
    }
  }
  v37 = v9;
LABEL_7:
  v38 = v37;

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragUniBufInt, 0);
  objc_storeStrong((id *)&self->_vertexUniBufSBP, 0);

  objc_storeStrong((id *)&self->_fragUniBufSBP, 0);
}

@end