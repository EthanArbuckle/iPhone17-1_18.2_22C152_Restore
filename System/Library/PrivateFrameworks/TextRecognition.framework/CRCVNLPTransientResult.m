@interface CRCVNLPTransientResult
- (char)initWithActivationMatrix:(void *)a3 decodingLocale:(long long *)a4 activationsBuffer:;
- (double)modernizedActivationMatrix;
- (id).cxx_construct;
@end

@implementation CRCVNLPTransientResult

- (char)initWithActivationMatrix:(void *)a3 decodingLocale:(long long *)a4 activationsBuffer:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = v7;
    id v10 = v8;
    v23.receiver = a1;
    v23.super_class = (Class)CRCVNLPTransientResult;
    v11 = (char *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_setProperty_atomic(v11, v12, v9, 360);
      objc_setProperty_atomic(a1, v13, v10, 368);

      long long v14 = *a4;
      long long v15 = a4[1];
      *(_OWORD *)(a1 + 40) = a4[2];
      *(_OWORD *)(a1 + 24) = v15;
      *(_OWORD *)(a1 + 8) = v14;
      long long v16 = a4[3];
      long long v17 = a4[4];
      long long v18 = a4[5];
      *(_OWORD *)(a1 + 104) = a4[6];
      *(_OWORD *)(a1 + 88) = v18;
      *(_OWORD *)(a1 + 72) = v17;
      *(_OWORD *)(a1 + 56) = v16;
      long long v19 = a4[7];
      long long v20 = a4[8];
      long long v21 = a4[9];
      *((void *)a1 + 21) = *((void *)a4 + 20);
      *(_OWORD *)(a1 + 152) = v21;
      *(_OWORD *)(a1 + 136) = v20;
      *(_OWORD *)(a1 + 120) = v19;
    }
    else
    {
    }
  }

  return a1;
}

- (double)modernizedActivationMatrix
{
  if (self)
  {
    id v10 = objc_getProperty(self, (SEL)self, 360, 1);
    uint64_t v4 = [v10 timestepCount];
    uint64_t v6 = objc_msgSend(objc_getProperty(self, v5, 360, 1), "observationCount");
    uint64_t v7 = *((void *)self + 1);
    if (*((unsigned char *)self + 344)) {
      uint64_t v8 = *((void *)self + 22);
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRecognitionActiveSem, 0);
  objc_storeStrong((id *)&self->_decodingLocale, 0);
  objc_storeStrong((id *)&self->_activationMatrix, 0);
  objc_storeStrong((id *)&self->_greedyDecodingResult, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 176) = 0;
  *((unsigned char *)self + 344) = 0;
  return self;
}

@end