@interface VTNovDetector
- (VTNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4;
- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3;
- (id)getAnalyzedResultForPhId:(unsigned int)a3;
- (id)getBestAnalyzedResult;
- (id)getOptionValue:(id)a3;
- (id)getSuperVectorWithEndPoint:(unint64_t)a3;
- (unsigned)numResultsAvailable;
- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4;
- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4;
- (void)dealloc;
- (void)reset;
- (void)resetBest;
@end

@implementation VTNovDetector

- (id)getOptionValue:(id)a3
{
  v5 = 0;
  if (a3)
  {
    novDetect = (IntNovDetect *)self->_novDetect;
    if (novDetect)
    {
      v5 = nd_getoption(novDetect, (const char *)[a3 UTF8String]);
      if (v5)
      {
        v5 = [NSString stringWithUTF8String:v5];
      }
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  novDetect = (char *)self->_novDetect;
  if (novDetect)
  {
    novDetect = nd_getsupervector(novDetect, (const char *)a3, v3);
    if (novDetect)
    {
      novDetect = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)novDetect length:4 * *((unsigned int *)novDetect + 2)];
    }
  }

  return novDetect;
}

- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3
{
  if (a3)
  {
    v4 = objc_alloc_init(VTNovDetectorResult);
    [(VTNovDetectorResult *)v4 setSampleFed:a3->var0];
    [(VTNovDetectorResult *)v4 setBestPhrase:a3->var3];
    [(VTNovDetectorResult *)v4 setBestStart:a3->var1];
    [(VTNovDetectorResult *)v4 setBestEnd:a3->var2];
    *(float *)&double v5 = a3->var4;
    [(VTNovDetectorResult *)v4 setBestScore:v5];
    [(VTNovDetectorResult *)v4 setEarlyWarning:a3->var5];
    [(VTNovDetectorResult *)v4 setIsRescoring:a3->var6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getBestAnalyzedResult
{
  novDetect = (char *)self->_novDetect;
  if (novDetect)
  {
    novDetect = [(VTNovDetector *)self _getAnalyzedResultFromNdresult:nd_getresults(novDetect, a2)];
  }

  return novDetect;
}

- (id)getAnalyzedResultForPhId:(unsigned int)a3
{
  novDetect = self->_novDetect;
  if (novDetect)
  {
    double v5 = *(const char **)&a3;
    int v7 = nd_phrasecount((uint64_t)novDetect, a2);
    v8 = (char *)self->_novDetect;
    if (v7 < 1) {
      v9 = nd_getresults(v8, v6);
    }
    else {
      v9 = nd_getphraseresults(v8, v5);
    }
    novDetect = [(VTNovDetector *)self _getAnalyzedResultFromNdresult:v9];
  }

  return novDetect;
}

- (unsigned)numResultsAvailable
{
  return nd_phrasecount((uint64_t)self->_novDetect, a2);
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  int v4 = a4;
  novDetect = (IntNovDetect *)self->_novDetect;
  v6 = (const float *)[a3 bytes];

  nd_wavedataf(novDetect, v6, v4);
}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  int v4 = a4;
  novDetect = (IntNovDetect *)self->_novDetect;
  v6 = (const char *)[a3 bytes];

  nd_wavedata(novDetect, v6, v4);
}

- (void)resetBest
{
}

- (void)reset
{
}

- (void)dealloc
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::~IntNovDetect(novDetect);
    MEMORY[0x21D46B240]();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VTNovDetector;
  [(VTNovDetector *)&v4 dealloc];
}

- (VTNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VTNovDetector;
  if ([(VTNovDetector *)&v10 init])
  {
    if ((initndlib(void)::bNDLibInitialized & 1) == 0) {
      initndlib(void)::bNDLibInitialized = 1;
    }
    operator new();
  }
  v8 = (VTNovDetector *)0;

  return v8;
}

@end