@interface FusionRemixUniforms
- (FusionRemixUniforms)initWithMetal:(id)a3 heap:(id)a4;
@end

@implementation FusionRemixUniforms

- (FusionRemixUniforms)initWithMetal:(id)a3 heap:(id)a4
{
  id v5 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FusionRemixUniforms;
  v6 = [(FusionRemixUniforms *)&v17 init];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = objc_msgSend(v5, "newBufferWithLength:options:", 1520, objc_msgSend(v5, "resourceOptions"));
  fragUniBufSBP = v6->_fragUniBufSBP;
  v6->_fragUniBufSBP = (MTLBuffer *)v7;

  if (!v6->_fragUniBufSBP) {
    goto LABEL_8;
  }
  uint64_t v9 = objc_msgSend(v5, "newBufferWithLength:options:", 24, objc_msgSend(v5, "resourceOptions"));
  fragUniBufInt = v6->_fragUniBufInt;
  v6->_fragUniBufInt = (MTLBuffer *)v9;

  if (!v6->_fragUniBufInt) {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend(v5, "newBufferWithLength:options:", 1360, objc_msgSend(v5, "resourceOptions"));
  vertexUniBufSBP = v6->_vertexUniBufSBP;
  v6->_vertexUniBufSBP = (MTLBuffer *)v11;

  if (v6->_vertexUniBufSBP)
  {
    v6->_ptr2FragBufSBP = (FusionRemixStageUniformsIBP *)[(MTLBuffer *)v6->_fragUniBufSBP contents];
    v6->_ptr2FragBufInt = (FusionRemixStageUniformsInternal *)[(MTLBuffer *)v6->_fragUniBufInt contents];
    v6->_ptr2VertBufSBP = (FusionRemixStageUniformsVertex *)[(MTLBuffer *)v6->_vertexUniBufSBP contents];
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    v13 = 0;
    if (v16) {
      goto LABEL_7;
    }
  }
  v13 = v6;
LABEL_7:
  v14 = v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragUniBufInt, 0);
  objc_storeStrong((id *)&self->_vertexUniBufSBP, 0);

  objc_storeStrong((id *)&self->_fragUniBufSBP, 0);
}

@end