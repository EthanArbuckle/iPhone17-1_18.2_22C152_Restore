@interface SDOFRenderingDiagnostics
- (SDOFRenderingDiagnostics)init;
- (id)createDiagnosticsDictionary;
- (id)dictFromFace:(id *)a3;
- (id)dictFromFaces:(id *)a3 numFaces:(int)a4;
- (void)addDetectedFaces:(id *)a3 numFaces:(int)a4;
- (void)clearDiagnostics;
@end

@implementation SDOFRenderingDiagnostics

- (SDOFRenderingDiagnostics)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDOFRenderingDiagnostics;
  v2 = [(SDOFRenderingDiagnostics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    diagDict = v2->_diagDict;
    v2->_diagDict = v3;
  }
  return v2;
}

- (void)clearDiagnostics
{
}

- (id)createDiagnosticsDictionary
{
  v4 = objc_msgSend_copy(self->_diagDict, a2, v2, v3);

  return v4;
}

- (void)addDetectedFaces:(id *)a3 numFaces:(int)a4
{
  if (a3)
  {
    objc_msgSend_dictFromFaces_numFaces_(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, v5, (uint64_t)v6, @"FD");
  }
}

- (id)dictFromFaces:(id *)a3 numFaces:(int)a4
{
  if (!a3)
  {
    FigDebugAssert3();
LABEL_11:
    v9 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)&a4;
  v5 = a3;
  v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, *(uint64_t *)&a4);
  if (v9)
  {
    v10 = objc_msgSend_numberWithInt_(NSNumber, v7, v4, v8);
    objc_msgSend_setObject_forKeyedSubscript_(v9, v11, (uint64_t)v10, @"numFaces");

    if ((int)v4 < 1) {
      goto LABEL_7;
    }
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, v12, @"face%d", v13, v14);
      if (!v15) {
        break;
      }
      v18 = (void *)v15;
      CGPoint var1 = v5->var1;
      v24[0] = v5->var0;
      v24[1] = var1;
      CGPoint var3 = v5->var3;
      v24[2] = v5->var2;
      v24[3] = var3;
      v21 = objc_msgSend_dictFromFace_(self, v16, (uint64_t)v24, v17);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v22, (uint64_t)v21, (uint64_t)v18);

      ++v14;
      ++v5;
      if (v4 == v14) {
        goto LABEL_7;
      }
    }
    FigDebugAssert3();

    goto LABEL_11;
  }
  FigDebugAssert3();
LABEL_7:

  return v9;
}

- (id)dictFromFace:(id *)a3
{
  v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, v3);
  if (v5)
  {
    CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3->var1);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v7, (uint64_t)DictionaryRepresentation, @"leftEye");

    CFDictionaryRef v8 = CGPointCreateDictionaryRepresentation(a3->var2);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)v8, @"rightEye");

    CFDictionaryRef v10 = CGPointCreateDictionaryRepresentation(a3->var0);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v11, (uint64_t)v10, @"nose");
  }
  else
  {
    FigDebugAssert3();
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end